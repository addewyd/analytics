unit HttpServiceUnit;

interface
uses
Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
IdContext, IdCustomHTTPServer, IdBaseComponent,
  IdComponent, IdCustomTCPServer, IdHTTPServer, IdCookieManager, IdIntercept,
  IdServerInterceptLogBase, IdServerInterceptLogFile, IdLogEvent, IdLogBase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  IdLogFile,
  XML.xmldom, XML.XMLIntf,XML.XMLDoc,
  ActiveX;

{$I 'consts.inc'}
Procedure CommandGet(Context: TIdContext;
  Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo);



implementation

uses DmUnit, MainUnit;

  var
    query: TFDQuery;
    conn: TFDConnection;
    tran: TFDTransaction;

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

  procedure LoadDocs(Response: TIdHTTPResponseInfo);
    var
      msg: TMessage;
  begin
    AddToLogT('received LoadDocs');
    try
      DM.FDConnection.Close;

    finally
      if not DM.FDConnection.Connected then  DM.FDConnection.Open;
      msg.msg := WM_CONN_REOPEN;
      MainForm.SendMsgs(msg);
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
        conn.Transaction := tran;
        conn.Params := DM.FDConnection.Params;

        Connection := conn;

        conn.Open();
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
      if conn.Connected then
        conn.Close;

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
      conn.Transaction := tran;
      conn.Params := DM.FDConnection.Params;
      Connection := conn;

      conn.Open();
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
    if conn.Connected then
      conn.Close;

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
  len, i,  j, cnt: Integer;
  Text, cname, res, sql, tablename: String;
  flist, vlist: TstringList;
  ii: IXMLDocument;
begin

  res := '';
  len := 0;
  cnt := 0;
  CoInitialize(nil);
  flist := TStringList.Create;
  vlist := TStringList.Create;
  query := TFDQuery.Create(nil);
  with query do
  begin
    conn.Transaction := tran;
    conn.Params := DM.FDConnection.Params;
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
            text := nL[i].ChildNodes[j].Text;
            flist.Add(cname);
            vlist.Add(':' + cname);
            with Query.Params.Add do
            begin
              Name := cname;
              DataType := ftString;
              ParamType := ptInput;
            end;
            query.ParamByName(cname).AsString := Text;
        end;
        sql := 'insert into ' + tablename + ' (' + flist.CommaText
          + ') values ('+vlist.CommaText+')'#13#10;
        query.SQL.Text := sql;
        res := sql;
        cnt := cnt + ExecInsSql(query);
      end;
    except
      on e: Exception do
      begin
        MainForm.IdServerInterceptLogFile.LogWriteString(res);
        MainForm.IdServerInterceptLogFile.LogWriteString(e.Message);
      end;
    end;
  finally
    if conn.Connected then
      conn.Close;
    Query.Free;
    vlist.Free;
    flist.Free;
    CoUninitialize;
  end;
  res := Format('Inserted %d of %d records', [cnt, len]);
  TThread.Queue(nil,
    procedure
    begin
      AddToLog(res);
    end);
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

//  ip := Request.RemoteIP;

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

  TThread.Queue(nil,
    procedure
    begin

      AddToLog(u + ' ' + ip);
    end);


  if not ok then
  begin
    Response.ContentText := 'Congratulations!';
    Exit;
  end;

  try
    conn := TFDConnection.Create(nil);
    tran := TFDTransaction.Create(nil);
    conn.DriverName := 'FB';
    conn.FetchOptions := DM.FDConnection.FetchOptions;
    conn.ResourceOptions := DM.FDConnection.ResourceOptions;
    conn.UpdateOptions := DM.FDConnection.UpdateOptions;
    conn.UpdateTransaction := tran;

    tran.Options := DM.FDTransaction.Options;
    tran.Connection := conn;

    try

      if u = '/Version' then
      begin

        Response.ContentText := Format('R: %s ' + chr($0D) + chr($0A) +
          'U: %s D: %s', [Request.Params.Text, u, d]);
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
        Response.ContentText := Format('%s size: %d'
          + chr($0D) + chr($0A) +
          ' %s'
          + chr($0D) + chr($0A) +
          'Command P: %s '
          + chr($0D) + chr($0A) +
          'U: %s D: %s', [Request.Command, slen, postdata,
          Request.Params.Text, u, d]);

      end
      else if u = '/SQL' then
      begin
        slen := Request.PostStream.Size;
        SetLength(buf, slen);
        Request.PostStream.ReadData(buf, slen);

        postdata := StringOf(buf);
         ExecAnySQL(response, postdata);

      end
      else if u = '/PostContr' then
      begin
        slen := Request.PostStream.Size;
        SetLength(buf, slen);

        Request.PostStream.ReadData(buf, slen);

        postdata := StringOf(buf);
        CheckContr(response, postdata);

      end
      else if u = '/SQLG' then
      begin
        postdata := 'select * from outcomesbyretail';
        ExecAnySQL(response, postdata);

      end
      else if u = '/LoadDocs' then
      begin
        LoadDocs(response);

      end
      else
      begin
        Response.ContentText := Format('Unknown command P: %s '
          + chr($0D) + chr($0A) +
          'U: %s D: %s', [Request.Params.Text, u, d]);
      end;
    finally
      tran.Free;
      conn.Free;
    end;

  except
    on e: Exception do
    begin
      Response.ContentText := 'HE: ' + e.Message;
    end;

  end;

end;


end.
