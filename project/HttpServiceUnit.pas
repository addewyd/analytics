unit HttpServiceUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Generics.Defaults, System.Generics.Collections,
  IdContext, IdCustomHTTPServer, IdBaseComponent,
  IdComponent, IdCustomTCPServer, IdHTTPServer, IdCookieManager, IdIntercept,
  IdServerInterceptLogBase, IdServerInterceptLogFile, IdLogEvent, IdLogBase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  IdLogFile,
  XML.xmldom, XML.XMLIntf, XML.XMLDoc, RegularExpressions,
  ActiveX;

{$I 'consts.inc'}
Procedure CommandGet(Context: TIdContext; Request: TIdHTTPRequestInfo;
  Response: TIdHTTPResponseInfo);

implementation

uses DmUnit, MainUnit;


type IOGRec =
    record
      id: Integer;
      session_id: Integer;
      sessionnum: Integer;
      azscode: String;
      azsextcode: String;
      dir: string;
      sdate: TDateTime;
      clientcode: String;
      clientname: String;
      paymentcode: String;
      paymentname: String;
      fuelcode: String;
      fuelname: String;
      volume: Extended;
      price: Extended;
      density: Extended;
      mass: Extended;
      nds: String;
      sumnds: Extended;
      whole: Extended;
      amount0: Extended;
      cn: String;
      stname: String;
    end;

type RespRec =
  Record
    id: Integer;
    session_id: Integer;
    res: String;
    descr: String;
  end;

var
  query: TFDQuery;
  conn: TFDConnection;
  tran: TFDTransaction;

function UniqStr(n: Integer): String;
  var
    possible: String;
  var
    i, r: Integer;
begin
  possible := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  Result := '';
  for i := 1 to n do
  begin
    Randomize;
    r := Random(Length(possible));
    Result := Result + Copy(possible, r, 1);
  end

end;

// .............................................................................

Procedure CreateConn;
begin
  conn := TFDConnection.Create(nil);
  tran := TFDTransaction.Create(nil);

  conn.Params.Assign(DM.FDConnection.Params);
  conn.DriverName := 'FB';
  conn.FetchOptions.Assign(DM.FDConnection.FetchOptions);
  conn.ResourceOptions.Assign(DM.FDConnection.ResourceOptions);
  conn.UpdateOptions.Assign(DM.FDConnection.UpdateOptions);
  conn.Transaction := tran;
  conn.UpdateTransaction := tran;

  tran.Options.Assign(DM.FDTransaction.Options);
  tran.Connection := conn;
  conn.Open();
end;

// .............................................................................

procedure FreeConn;
begin
  if tran.Active then
    tran.Commit;
  if conn.Connected then
    conn.Close;
  tran.Free;
  conn.Free;
end;


// .............................................................................

Procedure AddToLogT(msg: String);
begin
  TThread.Queue(nil,
    procedure
    begin
      AddToLog(msg);
    end);

end;

// .............................................................................

procedure SendMsgs(m: TMessage);
begin
  MainForm.SendMsgs(m);
end;

// .............................................................................

function BuildResponse(recs: Array of IOGRec): String;
  var rsp: String;
    k: integer;
begin
          rsp := '['#13#10;
          for k := 0 to Length(recs) - 1 do
          begin
            rsp := rsp + format(
              '["%d","%d","%d","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%.3f","%.2f","%.3f","%.3f","%s","%.2f","%.2f","%.2f","%s","%s"]',
              [
                recs[k].id,
                recs[k].session_id,
                recs[k].sessionnum,
                recs[k].azscode,
                recs[k].azsextcode,
                recs[k].dir,
                DateTimeToStr(recs[k].sdate),
                recs[k].clientcode,
                recs[k].clientname,
                recs[k].paymentcode,
                recs[k].paymentname,
                recs[k].fuelcode,
                recs[k].fuelname,
                recs[k].volume,
                recs[k].price,
                recs[k].density,
                recs[k].mass,
                recs[k].nds,
                recs[k].sumnds,
                recs[k].whole,
                recs[k].amount0,
                recs[k].cn,
                recs[k].stname
              ]);
            if k < Length(recs) - 1 then rsp := rsp + ','#13#10
            else rsp := rsp + #13#10;

          end;
          rsp := rsp + ']'#13#10;
  result := rsp;
end;

// .............................................................................

procedure markDoc(sid, id: Integer; res: String);
begin
//
  if res = 'Y'  then
  begin
    try
    with query do
    begin
      SQL.Text :=  'update inoutgsm set sent = 1 where id = :id';
      with params do
      begin
        Clear;
        with Add do
        begin
          Name := 'id';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
      end;
      ParamByName('id').AsInteger := id;
      Transaction.StartTransaction;
      Prepare;
      ExecSQL;
      Transaction.Commit;
    end;

    except
      on e: Exception do
      begin
        if query.Transaction.Active then query.Transaction.Rollback;
        AddToLogT('MD: ' +e.Message);
      end;
    end;

  end;
end;

// .............................................................................

procedure markSession(sid, ec: Integer);
  var
    st: Integer;
    msg: TMessage;
begin
  AddToLogT(format('sid %d ecount %d', [sid, ec]));

  if ec > 0  then st := S_PARTLY
  else st := S_SENT;

  try
    with query do
    begin
      SQL.Text :=  'update sessions set state = :st where id = :sid';
      with params do
      begin
        Clear;
        with Add do
        begin
          Name := 'st';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'sid';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
      end;
      Transaction.StartTransaction;
      ParamByName('st').AsInteger := st;
      ParamByName('sid').AsInteger := sid;
      Prepare;
      ExecSQL;
      Transaction.Commit;
    end;

    msg.Msg := WM_STATE_CHANGED_FEXT;
    msg.WParam := st;
    msg.LParam := sid;

    TThread.Queue(nil,
          procedure
          begin
            SendMsgs(msg);
          end);

  except
      on e: Exception do
      begin
        if query.Transaction.Active then query.Transaction.Rollback;
        AddToLogT('MS: ' +e.Message);
      end;
  end;
end;

// .............................................................................

procedure SetResults(Arec: Array of RespRec);
  var i, k: Integer;
      c_session_id: Integer;
      i_session_id, i_id, e_count: Integer;
      rec: RespRec;
begin
  k := Length(Arec);
  c_session_id := 0;
  e_count := 0;

  query := TFDQuery.Create(nil);
  with query do
  begin
      Connection := conn;
      Transaction := tran;
      UpdateTransaction := tran;
  end;

  try

    for rec in Arec do
    begin
      i_session_id := rec.session_id;
      i_id := rec.id;

      if rec.res <> 'Y' then inc(e_count);


      if c_session_id <> i_session_id then
      begin
        // next session
        if c_session_id > 0 then
        begin
          markSession(c_session_id, e_count);
        end;

        c_session_id := i_session_id;
        e_count := 0;
      end;

      MarkDoc(c_session_id, i_id, rec.res);
    end;

    markSession(c_session_id, e_count);
  finally
    query.Free;
  end;

end;

// .............................................................................

procedure SplitD(s, sep: String; a: TStrings);
  var
    RegEx: TRegEx;
    sa: TArray<string>;
    rs: String;
begin
  a.Clear;
  RegEx := TRegEx.Create(sep);
  sa := RegEx.Split(s);
  for rs in sa do a.add(rs);

end;

// .............................................................................

procedure HandleRsp(rsp: String);
  var
    RspList, DocList: TStringList;
    i, k: Integer;
    sep, ws: TsysCharSet;
    ARespRec: Array of RespRec;
    r: RespRec;
    cmp: IComparer<RespRec>;
begin

    cmp := TDelegatedComparer<RespRec>.Create
       (
         function(const Left, Right: RespRec): Integer
          var l, r: string;
         begin
            l := Format('%08d%08d', [Left.session_id, Left.id]);
            r := Format('%08d%08d', [Right.session_id, Right.id]);
            if l > r then Result := 1
            else if r < l then Result := -1
            else Result := 0;

         end
      );
  RspList := TStringList.Create;
  DocList := TStringList.Create;
  sep := [';'];
  ws := [' '];
  try

    SplitD(rsp, '@@', RspList);

    k := RspList.Count;
    SetLength(ARespRec, k);

    for i := 0 to k - 1  do
    begin
      DocList.Clear;
      SplitD(RspList[i], '##', DocList);
      ARespRec[i].id := StrToIntDef(DocList[0], 0);
      ARespRec[i].session_id := StrToIntDef(DocList[1], 0);
      ARespRec[i].res := DocList[2];
      ARespRec[i].descr := DocList[3];
    end;

    //TArray.Sort<RespRec>(ArespRec, cmp);  // ?????

    for r in ARespRec do
    begin
      AddToLogT(Format(':%08d%08d %s',
        [r.session_id, r.id, r.res]));
    end;

    SetResults(ArespRec);

  finally
    DocList.Free;
    RspList.Free;
  end;

end;

// .............................................................................

procedure LoadDocs(Response: TIdHTTPResponseInfo);
var
  msg: TMessage;
  rc, k, c: Integer;
  recs: Array of IOGRec;
  rsp: String;
begin
  AddToLogT('received LoadDocs');
  query := TFDQuery.Create(nil);
  Response.CharSet := 'utf-8';
  Response.ContentType := 'application/json; charset=utf-8';
  try
    with query do
    begin

      Connection := conn;
      Transaction := tran;

      query.FetchOptions.AutoFetchAll := afAll;

      Transaction.StartTransaction;
      try
        // FUEL
        query.SQL.Text := CIOGSQLH;

        Prepare;
        Open;
        FetchAll;
        rc := RecordCount;
        if rc > 0 then
        begin

          SetLength(recs, rc);
          k := 0;

          while not Eof do
          begin
            recs[k].id := FieldByName('id').AsInteger;
            recs[k].session_id := FieldByName('session_id').AsInteger;
            recs[k].sessionnum := FieldByName('sessionnum').AsInteger;
            recs[k].dir := FieldByName('dir').AsString;
            recs[k].azscode := FieldByName('azscode').AsString;
            recs[k].azsextcode := FieldByName('azsextcode').AsString;
            recs[k].sdate := FieldByName('sdate').AsDateTime;
            recs[k].clientcode := FieldByName('clientcode').AsString;
            recs[k].clientname := FieldByName('clientname').AsString;
            recs[k].paymentcode := FieldByName('paymentcode').AsString;
            recs[k].paymentname := FieldByName('paymentmode').AsString;
            recs[k].fuelcode := FieldByName('fuelcode').AsString;
            recs[k].fuelname := FieldByName('fuelname').AsString;
            recs[k].volume := FieldByName('volume').AsExtended;
            recs[k].price := FieldByName('price').AsExtended;
            recs[k].density := FieldByName('density').AsExtended;
            recs[k].mass := FieldByName('mass').AsExtended;
            recs[k].nds := FieldByName('nds').AsString;
            recs[k].sumnds := FieldByName('sumnds').AsExtended;
            recs[k].whole := FieldByName('whole').AsExtended;
            recs[k].amount0 := FieldByName('amount0').AsExtended;
            recs[k].cn := FieldByName('cn').asString;
            recs[k].stname := FieldByName('STNAME').asString;

            Next;
            k := k + 1;

          end;

          rsp := BuildResponse(recs);
        end
        else
        begin
          rsp := '[]';
        end;

        // ITEMS
        // ....

        // add item docs to rsp
        // rsp :=

        Response.ContentText := rsp;

        Transaction.Commit;

      except
        on e: Exception do
        begin
          Transaction.Rollback;
          MainForm.IdServerInterceptLogFile.LogWriteString(e.Message);
          AddToLogT(e.Message);
          Response.ContentText := e.Message;
        end;
      end;
    end;
  finally
    query.Free;
  end;

end;

// .............................................................................

Procedure PostLDResults(Response: TIdHTTPResponseInfo; postdata: String);
  var
    list: TStringList;
begin
  AddToLogT(postdata);
  Response.ContentText := 'OK';
  HandleRsp(postdata);
end;

// .............................................................................

Procedure SendTables(Response: TIdHTTPResponseInfo);
var
  resp: String;
begin
  resp := '';

  query := TFDQuery.Create(nil);
  try
    with query do
    begin
      Connection := conn;
      Transaction := tran;
      SQL.Text := 'select id, tablename from tableslist';
      Transaction.StartTransaction;
      try
        Open;
        while not Eof do
        begin
          resp := resp + FieldByName('tablename').AsString + ';';
          Next;
        end;

      finally
        Transaction.Commit;
      end;
    end;
  finally

    query.Free;
  end;
  Response.ContentText := resp;

end;

// .............................................................................

Procedure ExecAnySQL(Response: TIdHTTPResponseInfo; qsql: String);
var
  XML, fv, f: String;
  nf, i: Integer;

begin
  XML := '<?xml version="1.0" encoding="utf-8"?>' + #13#10;
  query := TFDQuery.Create(nil);
  try
    with query do
    begin
      Connection := conn;
      Transaction := tran;
      SQL.Text := qsql;
      Transaction.StartTransaction;
      XML := XML + '<response>'#13#10;
      try
        Open;
        while not Eof do
        begin
          XML := XML + '<record>';
          nf := Fields.Count;
          for i := 0 to nf - 1 do
          begin
            fv := Fields[i].FieldName;

            f := FieldByName(fv).AsString;
            f := StringReplace(f, '<', '&lt;', [rfReplaceAll]);
            f := StringReplace(f, '>', '&gt;', [rfReplaceAll]);
            XML := XML + '     <' + fv + '>';
            XML := XML + f;
            XML := XML + '</' + fv + '>'#13#10;
          end;

          XML := XML + '</record>'#13#10;
          Next;
        end;

      finally
        XML := XML + '</response>'#13#10;
        Transaction.Commit;
      end;
    end;
  finally
    query.Free;
  end;
  Response.CharSet := 'utf-8';
  Response.ContentType := 'text/xml; charset=utf-8';
  Response.ContentText := XML;
end;

// .............................................................................

function ExecInsSQL(query: TFDQuery): Integer;
begin
  result := 0;
  query.Transaction.StartTransaction;
  try
    query.ExecSQL;
    query.Transaction.Commit;
    result := 1;
  except
    on e: Exception do
    begin
      query.Transaction.Rollback;
      MainForm.IdServerInterceptLogFile.LogWriteString(query.SQL.Text);
      MainForm.IdServerInterceptLogFile.LogWriteString(e.Message);
    end;

  end;

end;

// .............................................................................

Procedure CheckContr(Response: TIdHTTPResponseInfo; xmls: String);
var
  doc: TXMLDocument;
  idoc: IDOMDocument;
  el, el2: IXMLNode;
  nL: IXMLNodeList;
  len, i, j, cnt: Integer;
  Text, cname, res, SQL, tablename: String;
  flist, vlist: TstringList;
  ii: IXMLDocument;
begin

  res := '';
  len := 0;
  cnt := 0;
  CoInitialize(nil);
  flist := TstringList.Create;
  vlist := TstringList.Create;
  query := TFDQuery.Create(nil);
  with query do
  begin
    Connection := conn;
    Transaction := tran;
  end;

  try
    try
      ii := LoadXMLData(xmls);

      el := ii.DocumentElement;
      tablename := el.NodeName;
      nL := el.ChildNodes;
      len := nL.Count;

      cnt := 0;
      for i := 0 to len - 1 do
      begin
        flist.Clear;
        vlist.Clear;
        query.Params.Clear;
        for j := 0 to nL[i].ChildNodes.Count - 1 do
        begin
          cname := nL[i].ChildNodes[j].NodeName;
          Text := nL[i].ChildNodes[j].Text;
          flist.Add(cname);
          vlist.Add(':' + cname);
          with query.Params.Add do
          begin
            Name := cname;
            DataType := ftString;
            ParamType := ptInput;
          end;
          query.ParamByName(cname).AsString := Text;
        end;
        SQL := 'insert into ' + tablename + ' (' + flist.CommaText +
          ') values (' + vlist.CommaText + ')'#13#10;
        query.SQL.Text := SQL;
        res := SQL;
        cnt := cnt + ExecInsSQL(query);
      end;
    except
      on e: Exception do
      begin
        MainForm.IdServerInterceptLogFile.LogWriteString(res);
        MainForm.IdServerInterceptLogFile.LogWriteString(e.Message);
      end;
    end;
  finally
    query.Free;
    vlist.Free;
    flist.Free;
    CoUninitialize;
  end;
  res := Format('Inserted %d of %d records', [cnt, len]);
  AddToLogT(res);
  Response.ContentText := res;
end;

// .............................................................................

Procedure CheckStorages(Response: TIdHTTPResponseInfo; xmls: String);
var
  doc: TXMLDocument;
  idoc: IDOMDocument;
  el, el2: IXMLNode;
  nL: IXMLNodeList;
  len, i, j, cnt: Integer;
  Text, cname, res, SQL, tablename: String;
  flist, vlist: TstringList;
  ii: IXMLDocument;
begin

  res := '';
  len := 0;
  cnt := 0;
  CoInitialize(nil);
  flist := TstringList.Create;
  vlist := TstringList.Create;
  query := TFDQuery.Create(nil);
  with query do
  begin
    Connection := conn;
    Transaction := tran;
  end;

  try
    try
      ii := LoadXMLData(xmls);

      el := ii.DocumentElement;
      tablename := el.NodeName;
      nL := el.ChildNodes;
      len := nL.Count;

      cnt := 0;
      for i := 0 to len - 1 do
      begin
        flist.Clear;
        vlist.Clear;
        query.Params.Clear;
        for j := 0 to nL[i].ChildNodes.Count - 1 do
        begin
          cname := nL[i].ChildNodes[j].NodeName;
          Text := nL[i].ChildNodes[j].Text;

          if cname = 'code' then
          begin
            Text := UniqStr(10);
          end;

          flist.Add(cname);
          vlist.Add(':' + cname);

          with query.Params.Add do
          begin
            Name := cname;
            DataType := ftString;
            ParamType := ptInput;
          end;
          query.ParamByName(cname).AsString := Text;
        end;
        with query.Params.Add do
        begin
            Name := 'azscode';
            DataType := ftString;
            ParamType := ptInput;
        end;
        query.ParamByName('azscode').AsString := UniqStr(10);

        SQL := 'insert into ' + tablename + ' (' + flist.CommaText
          + ',azscode' +
          ') values (' + vlist.CommaText + ',:azscode)'#13#10;
        query.SQL.Text := SQL;
        res := SQL;
        cnt := cnt + ExecInsSQL(query);
      end;
    except
      on e: Exception do
      begin
        MainForm.IdServerInterceptLogFile.LogWriteString(res);
        MainForm.IdServerInterceptLogFile.LogWriteString(e.Message);
      end;
    end;
  finally
    query.Free;
    vlist.Free;
    flist.Free;
    CoUninitialize;
  end;
  res := Format('Inserted %d of %d records', [cnt, len]);
  AddToLogT(res);
  Response.ContentText := res;
end;

// .............................................................................

Procedure CommandGet(Context: TIdContext; Request: TIdHTTPRequestInfo;
Response: TIdHTTPResponseInfo);
var
  s, r, u, d, ip, postdata: string;
  slen, i: Integer;
  buf: TBytes;
  ok: boolean;
begin
  s := Request.UserAgent;
  u := Request.URI;
  d := Request.Document;
  r := '';

  // ip := Request.RemoteIP;

  ip := Context.Binding.PeerIP;
  ok := false;

  for i := 0 to IPAS.Count - 1 do
  begin
    if ip = IPAS[i] then
    begin
      ok := true;
      break;
    end;
  end;

  AddToLogT(u + ' ' + ip);

  if not ok then
  begin
    Response.ContentText := 'Congratulations!';
    Exit;
  end;

  try
    CreateConn;
    try

      if u = '/Version' then
      begin
        Response.ContentText := Format('R: %s ' + chr($0D) + chr($0A) +
          'U: %s D: %s', [Request.Params.Text, u, '019']);
      end
      else if u = '/Tables' then
      begin
        SendTables(Response);
      end
      else if u = '/PostTest' then
      begin
        slen := Request.PostStream.Size;
        SetLength(buf, slen);
        Request.PostStream.ReadData(buf, slen);

        postdata := StringOf(buf);
        Response.ContentText := Format('%s size: %d' + chr($0D) + chr($0A) +
          ' %s' + chr($0D) + chr($0A) + 'Command P: %s ' + chr($0D) + chr($0A) +
          'U: %s D: %s', [Request.Command, slen, postdata,
          Request.Params.Text, u, d]);

      end
      else if u = '/SQL' then
      begin
        slen := Request.PostStream.Size;
        SetLength(buf, slen);
        Request.PostStream.ReadData(buf, slen);

        postdata := StringOf(buf);
        ExecAnySQL(Response, postdata);

      end
      else if u = '/PostContr' then
      begin
        slen := Request.PostStream.Size;
        SetLength(buf, slen);

        Request.PostStream.ReadData(buf, slen);

        postdata := StringOf(buf);
        CheckContr(Response, postdata);

      end
      else if u = '/PostStorages' then
      begin
        slen := Request.PostStream.Size;
        SetLength(buf, slen);

        Request.PostStream.ReadData(buf, slen);

        postdata := StringOf(buf);
        CheckStorages(Response, postdata);

      end
      else if u = '/SQLG' then
      begin
        postdata := 'select * from outcomesbyretail';
        ExecAnySQL(Response, postdata);

      end
      else if u = '/LoadDocs' then
      begin
        LoadDocs(Response);
      end
      else if u = '/PostLDResults' then
      begin
        slen := Request.PostStream.Size;
        SetLength(buf, slen);

        Request.PostStream.ReadData(buf, slen);

        postdata := StringOf(buf);
        PostLDResults(Response, postdata);
      end
      else
      begin
        Response.ContentText := Format('Unknown command P: %s ' + chr($0D) +
          chr($0A) + 'U: %s D: %s', [Request.Params.Text, u, d]);
      end;
    finally
      FreeConn;
    end;

  except
    on e: Exception do
    begin
      Response.ContentText := 'HE: ' + e.Message;
    end;

  end;

end;

end.
