unit CatItemsUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormWithGridUnit, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  JvDataSource, System.ImageList, Vcl.ImgList, Vcl.Menus, System.Actions,
  Vcl.ActnList, JvFormPlacement, JvComponentBase, JvAppStorage,
  JvAppRegistryStorage, JvDBGridFooter, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, Vcl.ToolWin, JvToolBar;

type
  TCatItemsForm = class(TFormWithGrid)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CatItemsForm: TCatItemsForm;

implementation

{$R *.dfm}

uses DmUnit;

procedure TCatItemsForm.FormCreate(Sender: TObject);
begin
  inherited;

  with FDQuery do
  begin
    SQL.Text := 'select code, name from items';
    Transaction.StartTransaction;
    try
      Open;
//      FetchAll;
      Transaction.Commit;
      JvDBGrid.Columns[0].Title.Caption := 'Код';
      JvDBGrid.Columns[1].Title.Caption := 'Наименование';
    except
      Transaction.Rollback;
    end;
  end;

end;

end.
