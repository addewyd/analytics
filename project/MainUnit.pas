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
  JvFormPlacement, JvComponentBase, JvAppStorage, JvAppRegistryStorage;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
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
    JvOpenDialog1: TJvOpenDialog;
    JvSelectDirectory1: TJvSelectDirectory;
    XMLDoc: TXMLDocument;
    logm: TJvMemo;
    ClearDBAction: TAction;
    ToolButton2: TToolButton;
    Service1: TMenuItem;
    ClearDB1: TMenuItem;
    JvAppRS: TJvAppRegistryStorage;
    JvFS: TJvFormStorage;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure FormActivate(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AboutActionExecute(Sender: TObject);
    procedure LoadFileActionExecute(Sender: TObject);
    procedure LoadDirActionExecute(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure ClearDBActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  Exepath: String;
  dbname: string;
  CurrentFile: String;

implementation

{$R *.dfm}

procedure TMainForm.AboutActionExecute(Sender: TObject);
begin
    TAboutForm.Create(self).ShowModal;
end;

// .............................................................................

procedure TMainForm.ApplicationEventsException(Sender: TObject; E: Exception);
begin
  ErrorMessageBox(self, e.Message);
  Application.Terminate;
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
          logm.Lines.Clear;
          ExecSQL('delete from orders');
          logm.Lines.Add('deleted from orders');
          ExecSQL('delete from outcomesbyretail');
          logm.Lines.Add('deleted from outcomesbyretail');
          ExecSQL('delete from wares');
          logm.Lines.Add('deleted from wares');
          ExecSQL('delete from tanks');
          logm.Lines.Add('deleted from tanks');
          ExecSQL('delete from paymentmodes');
          logm.Lines.Add('deleted from paymentmodes');
          ExecSQL('delete from contragents');
          logm.Lines.Add('deleted from contragents');
          ExecSQL('delete from sessions');
          logm.Lines.Add('deleted from sessions');

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

procedure TMainForm.LoadFileActionExecute(Sender: TObject);
  var filename: String;
      doc: IDOMDocument;
begin
//
  if JvOpenDialog1.Execute() then
  begin
    filename := JvOpenDialog1.FileName;

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

end.
