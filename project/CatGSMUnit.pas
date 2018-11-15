unit CatGSMUnit;

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
  TCatGSMForm = class(TFormWithGrid)
    FDQueryCODE: TWideStringField;
    FDQueryNAME: TWideStringField;
    FDQueryPRICE_R: TFloatField;
    FDQueryPRICE_O: TFloatField;
    FDQueryINCL: TSmallintField;
    CommitAction: TAction;
    ToolButton3: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure CommitActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CatGSMForm: TCatGSMForm;

implementation

{$R *.dfm}

uses DmUnit;

procedure TCatGSMForm.CommitActionExecute(Sender: TObject);
begin
  inherited;
  with FDQuery do
  begin
    Transaction.StartTransaction;
    try
      ApplyUpdates(0);
      Close;
      Transaction.Commit;
      LoadData;
    except
      on e: exception do
      begin
        Transaction.Rollback;
        ErrorMessageBox(self, e.message);
      end;
    end;
  end;
end;

procedure TCatGSMForm.FormCreate(Sender: TObject);
begin
  inherited;
  with FDQuery do
    begin
    Transaction.StartTransaction;
    try
      Open;
    except
      on e: exception do
      begin
        Transaction.Rollback;
        ErrorMessageBox(self, e.message);
      end;
    end;
  end;

end;

procedure TCatGSMForm.RefreshActionExecute(Sender: TObject);
begin
  inherited;
  if FDQuery.UpdateTransaction.Active then FDQuery.UpdateTransaction.Rollback;
  if FDQuery.Transaction.Active then FDQuery.Transaction.Rollback;

end;

end.
