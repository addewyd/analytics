unit ContractUnit;

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

{$I 'consts.inc'}

type
  TContractsForm = class(TFormWithGrid)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure catsupd(var Msg: TMessage); message WM_CATS_UPD;

  public
    { Public declarations }
  end;

var
  ContractsForm: TContractsForm;

implementation

{$R *.dfm}

uses DmUnit, MainUnit;

procedure TContractsForm.FormCreate(Sender: TObject);
begin
  inherited;
  LoadData;
end;

// .............................................................................

procedure TContractsForm.catsupd(var Msg: TMessage);
begin
  LoadData;
end;

end.
