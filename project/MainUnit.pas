unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,  System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.AppEvnts, System.ImageList, Vcl.ImgList,
  Registry, Math, System.Types, System.IOUtils,

  FStorage, AboutUnit, DmUnit, JvDataSource, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, FireDAC.Phys.FB, FireDAC.Phys.FBDef, JvBaseDlg,
  JvSelectDirectory, JvDialogs, XmlParseUnit, Xml.xmldom, Xml.XMLIntf,
  Xml.XMLDoc, ErrorUnit, Vcl.StdCtrls, JvExStdCtrls, JvMemo, YNUnit,
  JvFormPlacement, JvComponentBase, JvAppStorage, JvAppRegistryStorage,
  SessionListUnit, Vcl.StdActns, IdContext, IdCustomHTTPServer, IdBaseComponent,
  IdComponent, IdCustomTCPServer, IdHTTPServer, IdCookieManager, IdIntercept,
  IdServerInterceptLogBase, IdServerInterceptLogFile, IdLogEvent, IdLogBase,
  IdLogFile, Xml.omnixmldom, Xml.adomxmldom;

{$Include 'consts.inc'}

type
  TMainForm = class(TForm)
    MainMenuM: TMainMenu;
    File1: TMenuItem;
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
    JvSelectDirectory: TJvSelectDirectory;
    XMLDoc: TXMLDocument;
    ClearDBAction: TAction;
    DelTB: TToolButton;
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
    XMLMI: TMenuItem;
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
    dtb1: TToolButton;
    dtb2: TToolButton;
    ToolButton17: TToolButton;
    N8: TMenuItem;
    SessDataAction: TAction;
    N9: TMenuItem;
    ToolButton18: TToolButton;
    Window1: TMenuItem;
    Cascade1: TMenuItem;
    ileVertically1: TMenuItem;
    ileHorizontally1: TMenuItem;
    WindowListAction: TAction;
    ToolButton20: TToolButton;
    WindowList1: TMenuItem;
    UsersAction: TAction;
    UsersMI: TMenuItem;
    UsersTB: TToolButton;
    ViewLogAction: TAction;
    ViewLog1: TMenuItem;
    ToolButton19: TToolButton;
    ToolButton2: TToolButton;
    CatTHAction: TAction;
    anksHoses1: TMenuItem;
    ImageList: TImageList;
    StoragesAction: TAction;
    N10: TMenuItem;
    DeadRestAction: TAction;
    DeadRest1: TMenuItem;
    ContractsAction: TAction;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    ReportN1Action: TAction;
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
    procedure FormClick(Sender: TObject);
    procedure SessDataActionExecute(Sender: TObject);
    procedure DelSessionsActionExecute(Sender: TObject);
    procedure WindowListActionExecute(Sender: TObject);
    procedure UsersActionExecute(Sender: TObject);
    procedure ViewLogActionExecute(Sender: TObject);
    procedure CatTHActionExecute(Sender: TObject);
    procedure StoragesActionExecute(Sender: TObject);
    procedure DeadRestActionExecute(Sender: TObject);
    procedure ContractsActionExecute(Sender: TObject);
    procedure ReportN1ActionExecute(Sender: TObject);
  private
    { Private declarations }
//    gdbname: String;
    logged: boolean;
  public
    { Public declarations }
    function GetMdiForm(formname: string): TForm;
    function isWinOpen(formname: String): boolean;
    procedure SendMsgs(Msg: TMessage);

  end;

Procedure AddToLog(msg: String);
Procedure LoadUserOptions(user_id: Integer);
Procedure SaveUserOptions(user_id: Integer; def: boolean);

var
  MainForm: TMainForm;
  Exepath: String;
  dbname: string;
  clientdll: String;
  host: String;
  HTTPServiceOn: Boolean;
  CurrentFile: String;
  embed: Boolean;
  show_closed: boolean;

  IPAS: TStringList;

  user_id: Integer;
  user_login: String;
  user_role: Integer;
  user_fio: String;
  current_azscode: String;
  db_pass, db_user: String;
  dbport: Integer;
  last_sessions_count: Integer;
  move_orders: boolean; // from opts
  ordersLoaded: Integer;

const
  last_sessions_count_def: Integer = 14;
  azscode_def: string = '';

implementation

{$R *.dfm}

uses BaseFormUnit1, MlogUnit, StationsUnit, TablesListUnit, CatGSMUnit,
  PartnersUnit, CatItemsUnit, SipleReportUnit, SimpleReportUnit,
  PaymentModesUnit, HttpServiceUnit, OptionsDialogUnit, TabUnit, SelectUserUnit,
  WindowListUnit, UsersUnit, ViewLogUnit, TanksHosesUnit, StoragesUnit,
  DeadRestUnit, ContractUnit, Rep01Unit;


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

// .............................................................................

procedure TMainForm.HTTPServerCommandOther(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin
//  not used
end;

/// ............................................................................

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

Procedure LoadUserOptions(user_id: Integer);
begin
  try
    with DM.OptQuery do
    begin
      sql.Text := 'select o.user_id, u.login, opname1, optvalue1, ' +
      ' opname2, optvalue2, opname3, optvalue3 ' +
        '  from useroptions o ' + '  join users u on u.id = o.user_id ' +
        ' where u.id = :user_id ';

      with Params do
      begin
        Clear;
        with Add do
        begin
          Name := 'user_id';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
      end;
      ParamByName('user_id').AsInteger := user_id;
      Prepare;
      Open;
      if RecordCount < 1 then
      begin
        SaveUserOptions(user_id, true);
        LoadUserOptions(user_id);
      end
      else
      begin
        //user_login := FieldByName('login').AsString;
        last_sessions_count := StrToIntDef(FieldByName('optvalue1')
          .AsString, last_sessions_count_def);
        current_azscode := FieldByName('optvalue2').AsString;
        show_closed := (FieldByName('Optvalue3').AsInteger > 0);

      end;
    end;
  except
    on E: Exception do
    begin
      AddToLog(E.Message);
    end;
  end;

end;

// .............................................................................

Procedure SaveUserOptions(user_id: Integer; Def: boolean);
begin
  if not DM.FDConnection.connected then Exit;

  if Def then
  begin
    last_sessions_count := last_sessions_count_def;
    current_azscode := azscode_def;
    with DM.OptQuery do
    begin
      sql.Text :=
        'insert into USEROPTIONS '+
        '(user_id,opname1,optvalue1,optfullname1,opname2,optvalue2,optfullname2,opname3,optfullname3,optvalue3) values ' +
        '(:user_id,:opname1,:optvalue1,:optfullname1,:opname2,:optvalue2,:optfullname2,:opname3,:optfullname3,:optvalue3)';

      with Params do
      begin
        Clear;
        with Add do
        begin
          Name := 'user_id';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'optvalue1';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'opname1';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'optfullname1';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'optvalue2';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'opname2';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'optfullname2';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'optvalue3';
          DataType := ftSmallint;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'opname3';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'optfullname3';
          DataType := ftString;
          ParamType := ptInput;
        end;
      end;
      ParamByName('user_id').AsInteger := user_id;
      ParamByName('optvalue1').AsString := IntToStr(last_sessions_count);
      ParamByName('opname1').AsString := 'last_sessions_count';
      ParamByName('optfullname1').AsString := 'Last sessions count';

      ParamByName('optvalue2').AsString := current_azscode;
      ParamByName('opname2').AsString := 'AzsCode';
      ParamByName('optfullname2').AsString := 'Azs Code';

      ParamByName('optfullname3').AsString := 'Show closed sessions';
      ParamByName('optvalue3').AsBoolean := show_closed;
      ParamByName('opname3').AsString := 'Show closed sessions';
      Prepare;
      ExecSQL;
    end;
  end;
  try
    with DM.OptQuery do
    begin
      sql.Text :=
        'update useroptions set optvalue1 = :optvalue1, optvalue2 = :optvalue2, optvalue3=:optvalue3 where user_id=:user_id';

      with Params do
      begin
        Clear;
        with Add do
        begin
          Name := 'user_id';
          DataType := ftInteger;
          ParamType := ptInput;

        end;
        with Add do
        begin
          Name := 'optvalue1';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'optvalue2';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'optvalue3';
          DataType := ftSmallint;
          ParamType := ptInput;
        end;
      end;
      ParamByName('user_id').AsInteger := user_id;
      ParamByName('optvalue1').AsString := IntToStr(last_sessions_count);
      ParamByName('optvalue2').AsString := current_azscode;
      ParamByName('optvalue3').AsBoolean := show_closed;
      prepare;
      ExecSQL;
    end;
  except
    on E: Exception do
    begin
      AddToLog(E.Message);
    end;
  end;

end;

// .............................................................................

procedure TMainForm.AboutActionExecute(Sender: TObject);
begin
    TAboutForm.Create(self).ShowModal;
end;

// .............................................................................

procedure TMainForm.ApplicationEventsException(Sender: TObject; E: Exception);
begin
  MessageDlg('AE: ' + E.Message + ' ' + e.StackTrace,
    mtError, [mbOk], 0);
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

procedure TMainForm.CatTHActionExecute(Sender: TObject);
begin
  if not isWinOpen('cattankshoses') then
  begin
    TTanksHosesForm.Create(self, 'cattankshoses');
  end
  else GetMDIForm('cattankshoses').Show;
end;

// .............................................................................

procedure TMainForm.ClearDBActionExecute(Sender: TObject);
  var
    msg: TMessage;
    fm: TForm;
begin

  YNForm := TYNForm.Create(self);
  YNForm.Memo1.Text := 'Really?';

    if YNForm.ShowModal = mrOk then
    begin

      with DM.FDConnection do
      begin
        Transaction.StartTransaction;
        UpdateTransaction.StartTransaction;
        try
          //logm.Lines.Clear;
          ExecSQL('delete from inoutgsm');
          AddToLog('deleted from inoutgsm');
          ExecSQL('delete from iotankshoses');
          AddToLog('deleted from iotankshoses');
          ExecSQL('delete from inoutitems');
          AddToLog('deleted from inoutitems');


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
          ExecSQL('delete from ITEMOUTCOMESBYPAYSHEET');
          AddToLog('deleted from ITEMOUTCOMESBYPAYSHEET');

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

          ExecSQL('delete from wareprices');
          AddToLog('deleted from wareprices');

//          ExecSQL('delete from wares');
//          AddToLog('deleted from wares');

//          ExecSQL('delete from storages');
//          AddToLog('deleted from storages');
          ExecSQL('delete from firms');
          AddToLog('deleted from firms');

          //ExecSQL('delete from items');
          //AddToLog('deleted from items');

//          ExecSQL('delete from tahoa');
//          AddToLog('deleted from tahoa');

          ExecSQL('delete from tanks');
          AddToLog('deleted from tanks');
          ExecSQL('delete from hoses');
          AddToLog('deleted from hoses');

          //ExecSQL('delete from paymentmodes');
          //AddToLog('deleted from paymentmodes');
          ExecSQL('delete from wareprices');
          AddToLog('deleted from wareprices');
          ExecSQL('delete from sessions');
          AddToLog('deleted from sessions');
          UpdateTransaction.Commit;
          Transaction.Commit;

          Close;
          Open;

          msg.Msg := WM_SESSION_DELETED;
          if isWinOpen('tabform') then
          begin
              fm := GetMdiForm('tabform');
              fm.Close;
          end;
          SendMsgs(msg);

          DM.AddLogMsg(user_id, 'deleted all tables');
        except
          on e: Exception do
          begin
            UpdateTransaction.Rollback;;
            Transaction.Rollback;
            ErrorMessageBox(self, e.Message);
            AddToLog(e.Message);
          end;
        end;
      end;
    end;
end;

// .............................................................................

procedure TMainForm.DeadRestActionExecute(Sender: TObject);
begin
  if not isWinOpen('deadrest') then
  begin
    TDeadRestForm.Create(self, 'deadrest');
  end
  else GetMDIForm('deadrest').Show;
end;

// .............................................................................

procedure TMainForm.DelSessionsActionExecute(Sender: TObject);
begin
end;

// ....................................................................

procedure TMainForm.CloseActionExecute(Sender: TObject);
begin
  Close;
end;

// ....................................................................

procedure TMainForm.ContractsActionExecute(Sender: TObject);
begin
  if not isWinOpen('contracts') then
  begin
    TContractsForm.Create(self, 'contracts');
  end
  else GetMDIForm('contracts').Show;
end;

// .............................................................................

procedure TMainForm.FormActivate(Sender: TObject);
var
  oParams: TFDPhysFBConnectionDefParams;
  tsd: TSelectUser;
  br: Integer;
  uid, urole: Integer;
  login, fio: String;
begin

  JvFS.RestoreFormPlacement();

  TRY
    with DM.FDConnection.Params do
    begin
      Clear;
      Add('Database=' + dbname);
      Add('DriverID=FB');
      if embed then
        Add('Protocol=Local')
      else
        Add('Protocol=TCPIP');
      Add('User_Name=' + db_user);
      Add('Password=' + db_pass);
      Add('SQLDialect=3');
      Add(format('port=%d', [dbport]));
      if embed then
        Add('Server=')
      else
        Add('server=' + host);
      Add('CharacterSet=UTF8');
      // Add('lc_ctype=UTF8');
      DM.DriverLink.VendorLib := clientdll;
    end;

    DM.FDConnection.Open;

  except
    on E: Exception do
    begin
      ErrorMessageBox2(self, [E.Message, 'Set correct db location',
        'And restart App, please']);
    end;
  END;

  if not logged then
  begin

    tsd := TSelectUser.Create(self);
    tsd.FDQuery.Transaction.StartTransaction;
    tsd.FDQuery.Open;
    tsd.FDQuery.First;

    br := tsd.ShowModal;
    if (br = mrCancel) or (tsd.uid < 0) then
    begin
      // Application.Terminate;
      if HTTPServer.Active then
        HTTPServer.Active := false;

      self.Close;
      Exit;
    end;
    uid := 0;
    if DM.FDConnection.connected then
    begin

      uid := StrToIntDef(tsd.combo.LookupValue, 0);
      urole := tsd.urole;
      login := tsd.login;
      fio := tsd.fio;

      user_role := urole;
      user_login := login;
      user_fio := fio;
      user_id := uid;

      Caption := 'Analytics [' + user_login + ' id ' + IntToStr(user_id) + ' ' +
        IntToStr(user_role) + ']';
      logged := true;
    end;

    if uid < 1 then
    begin
      ErrorMessageBox(self, 'Íå âûáðàíî');
      Application.Terminate;
    end;

    if user_role <> 1 then
    begin
      ClearDBAction.Visible := false;
      UsersAction.Visible := false;
      XmlTablesAction.Visible := false;
      ViewLogAction.Visible := false;

    end;

    try
      StatusBar1.Panels[0].Text := ExtractFileName(dbname);
      LoadUserOptions(user_id);
      StatusBar1.Panels[3].Text := 'ÀÇÑ ' + current_azscode;
    except
      on E: Exception do
      begin
        ErrorMessageBox2(self, ['Set correct db location',
          'And restart App, please']);
      end;
    end;

    DM.AddLogMsg(user_id, 'Start Work');
  end
  else
  begin
    //
    user_role := 1;
    user_login := 'admin';
    user_fio := '';
    user_id := 1;
  end;
end;

// .............................................................................

procedure TMainForm.FormClick(Sender: TObject);
begin
//
end;

// .............................................................................

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DM.FDConnection.Connected then
  begin
    if user_id > 0 then  DM.AddLogMsg(user_id, 'End Work');
  end;
  JVFS.SaveFormPlacement();
  HTTPServer.Active := false;
end;

// .............................................................................

procedure TMainForm.FormCreate(Sender: TObject);
  var
    reg: TRegIniFile;
    db, ip, val: String;
    len, i: Integer;
  const
    SubKey: string = 'Software\Shrfs';
begin

  logged := false;
  //user_id := 1; // admin
  //user_role := 1; // admin

  IPAS := TStringList.Create;

  reg := TRegIniFile.Create(SubKey);
  try
    db := reg.ReadString('options', 'db', '\db\');
    dbport := StrToIntDef(reg.ReadString('options', 'dbport', '3050'), 3050);
    clientdll := reg.ReadString('options', 'clientdll', 'fbclient.dll');
    host := reg.ReadString('options', 'host', 'localhost'{,'94.181.67.31'});
    embed := reg.ReadBool('options', 'embedded', false);
    HTTPServiceOn := reg.ReadBool('options', 'httpservice', true);
    db_pass := reg.ReadString('options', 'dbpass', 'masterkey');
    db_user := reg.ReadString('options', 'dbuser', 'SYSDBA');

      IPAS.Clear;
      len := 6;
      for i := 0 to len - 1 do
      begin
        if i = 0 then val := '127.0.0.1'
        else val := '';
        ip := reg.ReadString('options', format('IP%d', [i]), val);
        IPAS.Add(ip);
      end;

    Exepath := ExtractFilePath(Application.ExeName);
    if embed then
      dbname := db
    else
      dbname := db;
    Application.Title := 'Shrfs';
    HTTPServer.DefaultPort := 8033;
    if HTTPServiceOn then
    begin
      HTTPServer.Active := true;
      IdServerInterceptLogFile.Filename:= Exepath + '/db/http.log';
      StatusBar1.Panels[2].Text := format('HTTP service at TCP port %d',
        [HTTPServer.DefaultPort]);
    end
    else
    begin
      StatusBar1.Panels[2].Text := 'HTTP Service off';
    end;

  finally
    reg.Free;
  end;
end;

// .............................................................................

procedure TMainForm.LoadDirActionExecute(Sender: TObject);
  var
    dir, f: String;
    files: TStringDynArray;
    Doc: IDOMDocument;
begin
  JvSelectDirectory.InitialDir := JvFS.ReadString('loaddir', '');
  if not DirectoryExists(JvSelectDirectory.InitialDir) then
  begin
    JvSelectDirectory.InitialDir := Exepath;
  end;
  if JvSelectDirectory.Execute then
  begin
    dir := JvSelectDirectory.Directory;
    JvFS.WriteString('loaddir', dir);
    ordersLoaded := 0;

    files := TDirectory.GetFiles(dir, 'CloseS*.xml', TSearchOption.soTopDirectoryOnly);
    for f in files do
    begin
      try
        CurrentFile := f;
        XMLDoc.LoadFromFile(f);
        doc := XmlDoc.DOMDocument;
        ParseInputFile(Doc, true);
      except
        on e: Exception do
        begin
          ErrorMessageBox(self, e.Message);
        end;
      end;
    end;
  end;
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
      ordersLoaded := 0;
      ParseInputFile(Doc, false);

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
    ip, val: String;
    len, i: Integer;
    msg: Tmessage;
begin
  try
    reg := TRegIniFile.Create('Software\Shrfs');
    try
      od := TOptionsDialog.Create(self);

      dbloc := reg.ReadString('options', 'db', '\db\');
      dbport := StrToIntDef(reg.ReadString('options', 'dbport', '3050'), 3050);
      clientdll := reg.ReadString('options', 'clientdll', 'fbclient.dll');
      host := reg.ReadString('options', 'host', 'localhost');
      embed := reg.ReadBool('options', 'embedded', false);
      db_pass := reg.ReadString('options', 'dbpass', 'masterkey');
      db_user := reg.ReadString('options', 'dbuser', 'SYSDBA');
      dbname := dbloc;

      od.IPAMemo.Lines.Clear;
      IPAS.Clear;
      len := 6;
      for i := 0 to len - 1 do
      begin
        if i = 0 then val := '127.0.0.1'
        else val := '';
        ip := reg.ReadString('options', format('IP%d', [i]), val);
        if ip <> '' then
        begin
          od.IPAMemo.Lines.add(ip);
        end;
        IPAS.Add(ip);

      end;

      HTTPServiceOn := reg.ReadBool('options', 'httpservice', true);
      od.DBLocEdit.Text := dbloc;
      od.HostEdit.Text := host;
      od.JvCheckBox1.Checked := embed;
      od.HTTPCheckBox.Checked :=  HTTPServiceOn;
      od.DllEdit.Text := clientdll;
      od.IPAMemo.Enabled :=  HTTPServiceOn;

      od.UserNameText.Caption := user_login + ' options:';
      od.LscEdit.Value := last_sessions_count;
      od.AzsEdit.Text := current_azscode;
      od.dbpassedit.Text := db_pass;
      od.dbuseredit.text := db_user;
      od.ShowCSCB.Checked := show_closed;

      if od.ShowModal = mrOK then
      begin
        dbloc := od.DBLocEdit.Text;
        dbport := StrToIntDef(od.PortEdit.Text, 3050);
        clientdll := od.dlledit.Text;
        dbname := dbloc;
        host := od.HostEdit.Text;
        embed := od.JvCheckBox1.Checked;
        show_closed := od.ShowCSCB.Checked;
        HTTPServiceOn := od.HTTPCheckBox.Checked;
        HTTPServer.Active := HTTPServiceOn;
        if user_role = 1 then
        begin
          db_pass := od.dbpassedit.Text;
          db_user := od.dbuseredit.text;
          reg.WriteString('options', 'dbpass', db_pass);
          reg.WriteString('options', 'dbuser', db_user);
        end;

        reg.WriteString('options', 'db', dbloc);
        reg.WriteString('options', 'dbport', IntToStr(dbport));
        reg.WriteString('options', 'clientdll', clientdll);
        if Trim(host) <> 'local' then
          reg.WriteString('options', 'host', host);
        reg.WriteBool('options', 'embedded', embed);
        reg.WriteBool('options', 'httpservice', HTTPServiceOn);
        IPAS.Clear;
        for i := 0 to len - 1 do
        begin
//          if i >= len then break;
          if i >= od.IPAMemo.Lines.Count then
          begin
            ip := '';
          end
          else
          begin
            ip := Trim(od.IPAMemo.Lines[i]);
          end;
          reg.WriteString('options', format('IP%d', [i]), ip) ;
          IPAS.Add(ip);
        end;
        last_sessions_count := Ceil(od.LscEdit.Value);
        current_azscode := od.AzsEdit.Text;

        if DM.FDConnection.connected then
          SaveUserOptions(user_id, false);
        StatusBar1.Panels[3].Text := 'ÀÇÑ ' + current_azscode;
        msg.Msg := WM_SESSION_ADDED;
        SendMsgs(msg);

        if DM.FDConnection.connected then
          DM.AddLogMsg(user_id, 'Options saved');

        DM.DriverLink.VendorLib := clientdll;

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

procedure TMainForm.ReportN1ActionExecute(Sender: TObject);
begin
  if not isWinOpen('rep01form') then
  begin
    TRep01Form.Create(self, 'rep01form');
  end
  else GetMDIForm('rep01form').Show;
end;

// .............................................................................

procedure TMainForm.SessDataActionExecute(Sender: TObject);
begin
  if not isWinOpen('tabform') then
  begin
    TTabForm.Create(self, 'tabform');
  end
  else GetMDIForm('tabform').Show;
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

procedure TMainForm.StoragesActionExecute(Sender: TObject);
begin
  if not isWinOpen('storages') then
  begin
    TStoragesForm.Create(self, 'storages');
  end
  else GetMDIForm('storages').Show;
end;

// .............................................................................

procedure TMainForm.UsersActionExecute(Sender: TObject);
begin
  if not isWinOpen('users') then
  begin
    TUsersForm.Create(self, 'users');
  end
  else GetMDIForm('users').Show;
end;

// .............................................................................

procedure TMainForm.ViewLogActionExecute(Sender: TObject);
begin
  if not isWinOpen('viewlog') then
  begin
    TViewLogForm.Create(self, 'viewlog');
  end
  else GetMDIForm('viewlog').Show;
end;

// .............................................................................

procedure TMainForm.WindowListActionExecute(Sender: TObject);
  var
    dlg: TWinListDlg;
    i, len: integer;
    c, f: String;
    sl : TstringList;
begin
  len := MDIChildCount;
  dlg := TWinListDlg.Create(self);
  with dlg do
  begin
    wlist.Clear;

    for i := 0 to len - 1 do
    begin
      c := (MainForm.mdichildren[i] as TBaseForm).Caption;
      f := (MainForm.mdichildren[i] as TBaseForm).formName;
      wlist.AddItem(IntToStr(i) + ',' + f + ',' + c,
        MainForm.mdichildren[i]);
    end;

    ShowModal;
    //if not isWinOpen('tableslist') then
    sl := TStringList.Create;
    try
      sl.CommaText := dlg.scapt;
      if sl.Count > 2 then
      begin
        AddToLog(sl[1]);

        if isWinOpen(sl[1]) then
        begin
          ShowWindow(GetMDIForm(sl[1]).Handle, SW_RESTORE);
          GetMDIForm(sl[1]).Show;
        end;

      end;
    finally
      sl.free;
    end;


  end;
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

// .............................................................................

procedure TMainForm.SendMsgs(Msg: TMessage);
  var i: Integer;
begin
  for i := 0 to MdiChildCount -1 do
  begin
    MDIChildren[i].WindowProc(msg);
  end;
  TMessage(msg).result := 1;
end;

end.
