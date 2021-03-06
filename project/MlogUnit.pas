unit MlogUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseFormUnit1, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Menus, System.Actions, Vcl.ActnList,
  JvFormPlacement, JvComponentBase, JvAppStorage, JvAppRegistryStorage,
  Vcl.ComCtrls, JvExComCtrls, JvStatusBar, Vcl.ToolWin, JvToolBar;

type
  TMlogForm = class(TBaseForm)
    mlog: TMemo;
    ClearAction: TAction;
    Clear1: TMenuItem;
    ToolButton2: TToolButton;
    procedure ClearActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Clear;
  end;

var
  MlogForm: TMlogForm;

implementation

{$R *.dfm}

procedure TMlogForm.Clear;
begin
  mlog.Clear;
end;

// .............................................................................

procedure TMlogForm.ClearActionExecute(Sender: TObject);
begin
  inherited;
  Clear;
end;

end.
