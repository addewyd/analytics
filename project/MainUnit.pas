unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.AppEvnts, System.ImageList, Vcl.ImgList,

  FStorage, AboutUnit, DmUnit, JvDataSource, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, FireDAC.Phys.FB, FireDAC.Phys.FBDef, JvBaseDlg,
  JvSelectDirectory, JvDialogs, XmlParseUnit, Xml.xmldom, Xml.XMLIntf,
  Xml.XMLDoc, ErrorUnit, Vcl.StdCtrls, JvExStdCtrls, JvMemo, YNUnit,
  JvFormPlacement, JvComponentBase, JvAppStorage, JvAppRegistryStorage,
  SessionListUnit, Vcl.StdActns;

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
  private
    { Private declarations }
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
  CurrentFile: String;

implementation

{$R *.dfm}

uses BaseFormUnit1, MlogUnit, StationsUnit, TablesListUnit;


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
  //ErrorMessageBox(self, e.Message);
  MessageDlg('AE: ' + E.Message, mtError, [mbOk], 0);
//  Application.Terminate;
end;

// ........................................................................

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
  DM.FDConnection.Params.Add('Database=' + dbname);
  DM.FDConnection.Open;
  //Database := dbname;
  StatusBar1.Panels[0].Text := dbname;
//    SetLocaleInfo(    LOCALE_SYSTEM_DEFAULT,  LOCALE_SDECIMAL,'.');
//    SetLocaleInfo(    LOCALE_SYSTEM_DEFAULT,  LOCALE_STHOUSAND,',');
end;

// .............................................................................

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  JVFS.SaveFormPlacement();
end;

// .............................................................................

procedure TMainForm.FormCreate(Sender: TObject);

begin
  // set up form
  Exepath := ExtractFilePath(Application.ExeName);
  dbname := Exepath + '\db\shrfs.fdb';
  Application.Title := 'Shrfs';
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

procedure TMainForm.SessionsActionExecute(Sender: TObject);
begin
  if not isWinOpen('sessions') then
  begin
    TSessionListForm.Create(self, 'sessions');
  end
  else GetMDIForm('sessions').Show;
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

procedure TMainForm.XmlTablesActionExecute(Sender: TObject);
begin
  if not isWinOpen('tableslist') then
  begin
    TTablesListForm.Create(self, 'tableslist');
  end
  else GetMDIForm('tableslist').Show;
end;

end.
