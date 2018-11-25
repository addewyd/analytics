unit HttpServiceUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  IdContext, IdCustomHTTPServer, IdBaseComponent,
  IdComponent, IdCustomTCPServer, IdHTTPServer, IdCookieManager, IdIntercept,
  IdServerInterceptLogBase, IdServerInterceptLogFile, IdLogEvent, IdLogBase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  IdLogFile,
  XML.xmldom, XML.XMLIntf, XML.XMLDoc,
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
      query.SQL.Text := CIOGSQLH;
      Transaction.StartTransaction;
      try

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
        Response.ContentText := rsp;

        Transaction.Commit;
        msg.Msg := WM_STATE_CHANGED_FEXT;
        msg.WParam := S_SENT;
        msg.LParam := 0;

      TThread.Queue(nil,
        procedure
        begin
          SendMsgs(msg);
        end);

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
  list := TStringList.Create;
  try
    list.CommaText := postdata;

  finally
    list.Free;
  end;
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
