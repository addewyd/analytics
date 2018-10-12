unit StationsUnit;

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
  JvDBGrid, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, Vcl.ToolWin, JvToolBar,
  JvDBUltimGrid;

type
  TStationsForm = class(TFormWithGrid)
    FDUpdSQL: TFDUpdateSQL;
    UpdateAction: TAction;
    Update1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure UpdateActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StationsForm: TStationsForm;

implementation

{$R *.dfm}

uses DmUnit;

procedure TStationsForm.FormCreate(Sender: TObject);
begin
  inherited;
  with FDQuery do
    begin
    Transaction.StartTransaction;
    try
      Open;
      FetchAll;
      Transaction.Commit;
    except
      on e: exception do
      begin
        Transaction.Rollback;
        ErrorMessageBox(self, e.message);
      end;
    end;
  end;
end;

procedure TStationsForm.RefreshActionExecute(Sender: TObject);
begin
  inherited;

end;

/// ............................................................................

procedure TStationsForm.UpdateActionExecute(Sender: TObject);
begin
  inherited;
  with FDQuery do
  begin
    Transaction.StartTransaction;
    try
      ApplyUpdates;
      Transaction.Commit;
    except
      on e: exception do
      begin
        Transaction.Rollback;
        ErrorMessageBox(self, e.message);
      end;
    end;
  end;
end;

end.
