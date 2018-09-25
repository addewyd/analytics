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
  Xml.XMLDoc, ErrorUnit, Vcl.StdCtrls, JvExStdCtrls, JvMemo;

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
    procedure FormActivate(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AboutActionExecute(Sender: TObject);
    procedure LoadFileActionExecute(Sender: TObject);
    procedure LoadDirActionExecute(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  Exepath: String;
  dbname: string;

implementation

{$R *.dfm}

procedure TMainForm.AboutActionExecute(Sender: TObject);
begin
  try
    AboutForm := TAboutForm.Create(self);
    try
      AboutForm.ShowModal;
    finally
      AboutForm.Free;
    end;
  except
    //
  end;

end;

procedure TMainForm.ApplicationEventsException(Sender: TObject; E: Exception);
begin
  ErrorMessageBox(self, e.Message);
  Application.Terminate;
end;

// ........................................................................

procedure TMainForm.CloseActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  //
  DM.FDConnection.Params.Add('Database=' + dbname);
  DM.FDConnection.Open;
  //Database := dbname;
  StatusBar1.Panels[0].Text := dbname;
end;

procedure TMainForm.FormCreate(Sender: TObject);

begin
  // set up form
  Exepath := ExtractFilePath(Application.ExeName);
  dbname := Exepath + '\db\shrfs.fdb';
  Application.Title := 'Shrfs';
end;

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
