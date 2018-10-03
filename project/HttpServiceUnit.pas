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
  Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo);

implementation

uses DmUnit, MainUnit;

  var
    query: TFDQuery;
    conn: TFDConnection;
    tran: TFDTransaction;

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

Procedure CommandGet(Context: TIdContext; Request: TIdHTTPRequestInfo;
  Response: TIdHTTPResponseInfo);
var
  s, r, u, d, postdata: string;
  slen: Integer;
  buf: TBytes;
begin
  s := Request.UserAgent;
  u := Request.URI;
  d := Request.Document;
  r := '';

  TThread.Queue(nil,
    procedure
    begin

      AddToLog(u);
    end);

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
        //PostTest(Request, Response);
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
