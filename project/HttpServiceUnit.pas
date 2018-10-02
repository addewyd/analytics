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
  IdLogFile;

Procedure CommandGet(Context: TIdContext;
  var Request: TIdHTTPRequestInfo; var Response: TIdHTTPResponseInfo);

implementation

uses DmUnit;

Procedure SendTables(Response: TIdHTTPResponseInfo);
  var
    query: TFDQuery;
    resp: String;
begin
  resp := '';

  try
    query := TFDQuery.Create(nil);
    try
      with query do
      begin
        DM.FDCH.Params := DM.FDConnection.Params;
        Connection := DM.FDCH;

        DM.FDCH.Open();
        Transaction := DM.FDTransactionH;
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
      if DM.FDCH.Connected then DM.FDCH.Close;

      query.Free;
    end;

  except
    on e: Exception do
    begin
      resp := 'HE: ' + e.Message;
    end;

  end;
  Response.ContentText := resp;

end;

// .............................................................................

Procedure CommandGet(Context: TIdContext;
  var Request: TIdHTTPRequestInfo; var Response: TIdHTTPResponseInfo);
  var
    s, r, u, d: string;
begin
  s := Request.UserAgent;
  u := Request.URI;
  d := Request.Document;
  r := '<html>TEST 02<br> ' + Request.Params.Text + ' <br>' + s + '</html>';

  if u = '/Version' then
  begin

    Response.ContentText  :=
      Format('R: %s '+ chr($0d)+chr($0a) + 'U: %s D: %s',[Request.Params.Text,u,d]);
  end
  else if u = '/Tables' then
  begin
    SendTables(Response);
  end
  else
  begin
    Response.ContentText  := 'Unknown command';
  end;



end;


end.
