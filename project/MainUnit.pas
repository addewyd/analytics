unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,  System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.AppEvnts, System.ImageList, Vcl.ImgList,
  Registry,

  FStorage, AboutUnit, DmUnit, JvDataSource, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, FireDAC.Phys.FB, FireDAC.Phys.FBDef, JvBaseDlg,
  JvSelectDirectory, JvDialogs, XmlParseUnit, Xml.xmldom, Xml.XMLIntf,
  Xml.XMLDoc, ErrorUnit, Vcl.StdCtrls, JvExStdCtrls, JvMemo, YNUnit,
  JvFormPlacement, JvComponentBase, JvAppStorage, JvAppRegistryStorage,
  SessionListUnit, Vcl.StdActns, IdContext, IdCustomHTTPServer, IdBaseComponent,
  IdComponent, IdCustomTCPServer, IdHTTPServer, IdCookieManager, IdIntercept,
  IdServerInterceptLogBase, IdServerInterceptLogFile, IdLogEvent, IdLogBase,
  IdLogFile;

type
  TMainForm = class(TForm)
    MainMenuM: TMainMenu;
    File1: TMenuItem;
    Options1: TMenuItem;
    About1: TMenuItem;
    Close1: TMenuItem;
    ActionList: TActionList;
    CloseAction: TAction;
    ApplicationEvents: TApplicationEvents;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    AboutAction: TAction;
    LoadFile1: TMenuItem;
    LoadDir1: TMenuItem;
    LoadFileAction: TAction;
    LoadDirAction: TAction;
    JvOpenDialog: TJvOpenDialog;
    JvSelectDirectory1: TJvSelectDirectory;
    XMLDoc: TXMLDocument;
    ClearDBAction: TAction;
    ToolButton2: TToolButton;
    Service1: TMenuItem;
    ClearDB1: TMenuItem;
    JvAppRS: TJvAppRegistryStorage;
    JvFS: TJvFormStorage;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Sessions1: TMenuItem;
    SessionsAction: TAction;
    Sessions2: TMenuItem;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    StationsAction: TAction;
    N1: TMenuItem;
    ToolButton8: TToolButton;
    XmlTablesAction: TAction;
    XML1: TMenuItem;
    ToolButton9: TToolButton;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton7: TToolButton;
    CatGSMAction: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    CatPartnersAction: TAction;
    N4: TMenuItem;
    CatItemsAction: TAction;
    N5: TMenuItem;
    SimpleReportAction: TAction;
    N6: TMenuItem;
    ToolButton13: TToolButton;
    PaimentModesAction: TAction;
    N7: TMenuItem;
    ToolButton14: TToolButton;
    HTTPServer: TIdHTTPServer;
    IdServerInterceptLogFile: TIdServerInterceptLogFile;
    OptionsAction: TAction;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    Options2: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AboutActionExecute(Sender: TObject);
    procedure LoadFileActionExecute(Sender: TObject);
    procedure LoadDirActionExecute(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure ClearDBActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SessionsActionExecute(Sender: TObject);
    procedure StationsActionExecute(Sender: TObject);
    procedure XmlTablesActionExecute(Sender: TObject);
    procedure CatGSMActionExecute(Sender: TObject);
    procedure CatPartnersActionExecute(Sender: TObject);
    procedure CatItemsActionExecute(Sender: TObject);
    procedure SimpleReportActionExecute(Sender: TObject);
    procedure PaimentModesActionExecute(Sender: TObject);
    procedure HTTPServerCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure OptionsActionExecute(Sender: TObject);
    procedure HTTPServerCommandOther(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure HTTPServerException(AContext: TIdContext; AException: Exception);
  private
    { Private declarations }
    gdbname: String;
  public
    { Public declarations }
    function GetMdiForm(formname: string): TForm;
    function isWinOpen(formname: String): boolean;

  end;

Procedure AddToLog(msg: String);
var
  MainForm: TMainForm;
  Exepath: String;
  dbname: string;
  host: String;
  CurrentFile: String;

implementation

{$R *.dfm}

uses BaseFormUnit1, MlogUnit, StationsUnit, TablesListUnit, CatGSMUnit,
  PartnersUnit, CatItemsUnit, SipleReportUnit, SimpleReportUnit,
  PaymentModesUnit, HttpServiceUnit, OptionsDialogUnit;


// .............................................................................

function TMainForm.isWinOpen(formname: string): boolean;
var  i: integer;
begin
  result := false;
  for i := 0 to mdiChildCount - 1 do
  begin
    if  ((mdichildren[i] as TBaseForm).formname = formname) then
    begin
      result := true;
      break;
    end;
  end;
end;

// .............................................................................

function TMainForm.GetMDIForm(formname: string): TForm;
var i: integer;
begin
  result := nil;
  for i := 0 to mdiChildCount - 1 do
  begin
    if  ((mdichildren[i] as TBaseForm).formname = formname) then
    begin
      result := mdichildren[i];
      break;
    end;
  end;

end;

// .............................................................................

procedure TMainForm.HTTPServerCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin

  CommandGet(AContext, ArequestInfo, AResponseInfo);

end;

procedure TMainForm.HTTPServerCommandOther(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin
//
  //  ARequestInfo.PostStream
end;

procedure TMainForm.HTTPServerException(AContext: TIdContext;
  AException: Exception);
begin
  TThread.Queue(nil,
    procedure
    begin

      AddToLog(AException.Message);

    end);
end;

// .............................................................................

Procedure AddToLog(msg: String);
begin
  if not MainForm.isWinOpen('mlog') then
    MLogForm := TMlogForm.Create(MainForm, 'mlog');

  MLogForm.mlog.Lines.Add(msg);
end;

// .............................................................................

procedure TMainForm.AboutActionExecute(Sender: TObject);
begin
    TAboutForm.Create(self).ShowModal;
end;

// .............................................................................

procedure TMainForm.ApplicationEventsException(Sender: TObject; E: Exception);
begin
  MessageDlg('AE: ' + E.Message, mtError, [mbOk], 0);
//  Application.Terminate;
end;

// ........................................................................

procedure TMainForm.CatGSMActionExecute(Sender: TObject);
begin
  if not isWinOpen('catgsm') then
  begin
    TCatGSMForm.Create(self, 'catgsm');
  end
  else GetMDIForm('catgsm').Show;
end;

// .............................................................................

procedure TMainForm.CatItemsActionExecute(Sender: TObject);
begin
  if not isWinOpen('catitems') then
  begin
    TCatItemsForm.Create(self, 'catitems');
  end
  else GetMDIForm('catitems').Show;

end;

// .............................................................................

procedure TMainForm.CatPartnersActionExecute(Sender: TObject);
begin
  if not isWinOpen('catpartners') then
  begin
    TPartnersForm.Create(self, 'catpartners');
  end
  else GetMDIForm('catpartners').Show;
end;

// .............................................................................

procedure TMainForm.ClearDBActionExecute(Sender: TObject);
begin

  YNForm := TYNForm.Create(self);
  YNForm.Memo1.Text := 'Really?';

  try
    if YNForm.ShowModal = mrOk then
    begin

      with DM.FDConnection do
      begin
        Transaction.StartTransaction;
        try
          //logm.Lines.Clear;
          ExecSQL('delete from orders');
          AddToLog('deleted from orders');
          ExecSQL('delete from cashflow');
          AddToLog('deleted from cashflow');
          ExecSQL('delete from outcomesbyretail');
          AddToLog('deleted from outcomesbyretail');
          ExecSQL('delete from itemoutcomesbyretail');
          AddToLog('deleted from itemoutcomesbyretail');
          ExecSQL('delete from outcomesbyoffice');
          AddToLog('deleted from outcomesbyoffice');
          ExecSQL('delete from incomesbydischarge');
          AddToLog('deleted from incomesbydischarge');

          ExecSQL('delete from tdb_items');
          AddToLog('deleted from tdb_items');

          ExecSQL('delete from TRADEDOCSINBILL');
          AddToLog('deleted from tradedocsinbill');

          ExecSQL('delete from techreturn');
          AddToLog('deleted from techreturn');
          ExecSQL('delete from OutcomesByCoupon');
          AddToLog('deleted from outcomesbycoupon');

          ExecSQL('delete from itemrests');
          AddToLog('deleted from itemrests');

          ExecSQL('delete from wares');
          AddToLog('deleted from wares');

          ExecSQL('delete from storages');
          AddToLog('deleted from storages');
          ExecSQL('delete from firms');
          AddToLog('deleted from firms');

          ExecSQL('delete from items');
          AddToLog('deleted from items');
          ExecSQL('delete from tanks');
          AddToLog('deleted from tanks');
          ExecSQL('delete from hoses');
          AddToLog('deleted from hoses');
          ExecSQL('delete from paymentmodes');
          AddToLog('deleted from paymentmodes');
          ExecSQL('delete from contragents');
          AddToLog('deleted from contragents');
          ExecSQL('delete from sessions');
          AddToLog('deleted from sessions');

          Transaction.Commit;
        except
          Transaction.Rollback;
        end;
      end;
    end;
  finally
    YNForm.Free;
  end;
end;

// ....................................................................

procedure TMainForm.CloseActionExecute(Sender: TObject);
begin
  Close;
end;

// .............................................................................

procedure TMainForm.FormActivate(Sender: TObject);
begin
  //
  JVFS.RestoreFormPlacement();
  try
    DM.FDConnection.Params.Add('Database=' + 'localhost:'+dbname);
    DM.FDConnection.Open;
    StatusBar1.Panels[0].Text := ExtractFileName(dbname);

  except
    on e: exception do
    begin
        ErrorMessageBox2(self,
          ['Set correct db location', 'And restart App, please']);
    end;

  end;
end;

// .............................................................................

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  JVFS.SaveFormPlacement();
  HTTPServer.Active := false;
end;

// .............................................................................

procedure TMainForm.FormCreate(Sender: TObject);
  var
    reg: TRegIniFile;
    db: String;
  const
    SubKey: string = 'Software\Shrfs';
begin
  // set up form

  reg := TRegIniFile.Create(SubKey);
  try
    db := reg.ReadString('options', 'db', '\db\shrfs.fdb');
    host := reg.ReadString('options', 'host', '94.181.67.31');
    Exepath := ExtractFilePath(Application.ExeName);
    dbname := host + ':' + Exepath + db;
    Application.Title := 'Shrfs';
    HTTPServer.DefaultPort := 8033;
    HTTPServer.Active := true;
  finally
    reg.Free;
  end;
end;

// .............................................................................

procedure TMainForm.LoadDirActionExecute(Sender: TObject);
begin
//
end;

// .............................................................................


procedure TMainForm.LoadFileActionExecute(Sender: TObject);
  var filename: String;
      doc: IDOMDocument;
begin
//
  if JvOpenDialog.Execute() then
  begin
    filename := JvOpenDialog.FileName;

    StatusBar1.Panels[1].Text := filename;
    try
      CurrentFile := filename;
      XMLDoc.LoadFromFile(filename);
      doc := XmlDoc.DOMDocument;
      ParseInputFile(Doc);
    except
      on e: Exception do
      begin
        ErrorMessageBox(self, e.Message);
      end;

    end;

  end;
end;

// .............................................................................

procedure TMainForm.OptionsActionExecute(Sender: TObject);
  var
    od: TOptionsDialog;
    reg: TRegIniFile;
    dbloc: String;
    host: String;
begin
  try
    reg := TRegIniFile.Create('Software\Shrfs');
    try
      od := TOptionsDialog.Create(self);
      dbloc := reg.ReadString('options', 'db', '\db\shrfs.fdb');
      host := reg.ReadString('options', 'host', 'localhost');
      od.DBLocEdit.Text := dbloc;
      od.HostEdit.Text := host;
      if od.ShowModal = mrOK then
      begin
        dbloc := od.DBLocEdit.Text;
        reg.WriteString('options', 'db', dbloc);
        reg.WriteString('options', 'host', host);

      end;
    finally
      reg.Free;
    end;
  except
    on e: Exception do
      ErrorMessageBox(self, e.message);
  end;
end;

// .............................................................................

procedure TMainForm.PaimentModesActionExecute(Sender: TObject);
begin
  if not isWinOpen('paymentmodes') then
  begin
    TPaymentModesForm.Create(self, 'paymentmodes');
  end
  else GetMDIForm('paymentmodes').Show;
end;

// .............................................................................

procedure TMainForm.SessionsActionExecute(Sender: TObject);
begin
  if not isWinOpen('sessions') then
  begin
    TSessionListForm.Create(self, 'sessions');
  end
  else GetMDIForm('sessions').Show;
end;

// .............................................................................

procedure TMainForm.SimpleReportActionExecute(Sender: TObject);
  var
    srd: TSimpleReportDialog;
begin
  if not isWinOpen('simplereport') then
  begin
    srd := TSimpleReportDialog.Create(self);
    if srd.ShowModal = mrOk then
    begin
      TSimpleReportForm.Create(
        self, 'simplereport', srd.LookupAzs.LookupValue,
          srd.DateStartEdit.Date, srd.DateEndEdit.Date);
    end
  end
  else GetMDIForm('simplereport').Show;
end;

// .............................................................................

procedure TMainForm.StationsActionExecute(Sender: TObject);
begin
  if not isWinOpen('stations') then
  begin
    TStationsForm.Create(self, 'stations');
  end
  else GetMDIForm('stations').Show;
end;

// .............................................................................

procedure TMainForm.XmlTablesActionExecute(Sender: TObject);
begin
  if not isWinOpen('tableslist') then
  begin
    TTablesListForm.Create(self, 'tableslist');
  end
  else GetMDIForm('tableslist').Show;
end;

end.
