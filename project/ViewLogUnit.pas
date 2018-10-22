unit ViewLogUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormWithGridUnit, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  JvDataSource, System.ImageList, Vcl.ImgList, Vcl.Menus, System.Actions,
  Vcl.ActnList, JvFormPlacement, JvComponentBase, JvAppStorage,
  JvAppRegistryStorage, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, JvDBGridFooter, Vcl.ComCtrls, JvExComCtrls, JvStatusBar,
  Vcl.ToolWin, JvToolBar;

type
  TViewLogForm = class(TFormWithGrid)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewLogForm: TViewLogForm;

implementation

{$R *.dfm}

uses DmUnit;

procedure TViewLogForm.FormCreate(Sender: TObject);
begin
  inherited;
  //
  with FDQuery do
  begin
    SQL.Text := 'select first 80 a.adate, u.login, a.msg from actionlog a ' +
    'join users u on a.user_id=u.id order by a.adate';
    Transaction.StartTransaction;
    Open;
  end;
end;

end.
