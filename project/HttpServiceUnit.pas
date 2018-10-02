unit HttpServiceUnit;

interface
uses
Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
IdContext, IdCustomHTTPServer, IdBaseComponent,
  IdComponent, IdCustomTCPServer, IdHTTPServer, IdCookieManager, IdIntercept,
  IdServerInterceptLogBase, IdServerInterceptLogFile, IdLogEvent, IdLogBase,
  IdLogFile;

Procedure CommandGet(Context: TIdContext;
  var Request: TIdHTTPRequestInfo; var Response: TIdHTTPResponseInfo);

implementation

uses DmUnit;


Procedure CommandGet(Context: TIdContext;
  var Request: TIdHTTPRequestInfo; var Response: TIdHTTPResponseInfo);
  var
    s, r, u, d: string;
begin
  s := Request.UserAgent;
  u := Request.URI;
  d := Request.Document;
  r := '<html>TEST 02<br> ' + Request.Params.Text + ' <br>' + s + '</html>';
  Response.ContentText  :=
    Format('R: %s '+ chr($0d)+chr($0a) + 'U: %s D: %s',[Request.Params.Text,u,d]);

end;


end.
