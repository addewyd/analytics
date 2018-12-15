unit BaseFormUnit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  JvFormPlacement, JvComponentBase, JvAppStorage, JvAppRegistryStorage,
  Vcl.ComCtrls, JvExComCtrls, JvStatusBar, Vcl.ToolWin, JvToolBar,
  System.ImageList, Vcl.ImgList;

type
  TBaseForm = class(TForm)
    JvToolBar1: TJvToolBar;
    JvStatusBar1: TJvStatusBar;
    JvAppRS: TJvAppRegistryStorage;
    JvFS: TJvFormStorage;
    ActionList: TActionList;
    MainMenu: TMainMenu;
    ToolButton1: TToolButton;
    ImageList: TImageList;
    CloseAction: TAction;
    File1: TMenuItem;
    Close1: TMenuItem;
    procedure CloseActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    formname: string;
    constructor Create(pr: TComponent; fname: String); reintroduce; overload;

  end;

var
  BaseForm: TBaseForm;

implementation

{$R *.dfm}

constructor TBaseForm.Create(pr: TComponent; fname: string);
begin
  inherited create(pr);
  formname := fname;
  self.Name := 'FS_' + fname;
  //MainMenu.Items[0].Caption := formname;

end;

// .............................................................................

procedure TBaseForm.CloseActionExecute(Sender: TObject);
begin
  Close;
end;

// .............................................................................

procedure TBaseForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

// .............................................................................

procedure TBaseForm.FormCreate(Sender: TObject);
begin
  //Caption := formname;
end;

end.
