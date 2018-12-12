unit DeadRestUnit;

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
  TDeadRestForm = class(TFormWithGrid)
    CommitAction: TAction;
    ToolButton3: TToolButton;
    FDQueryAZSCODE: TWideStringField;
    FDQueryNAME: TWideStringField;
    FDQueryTANKNUM: TWideStringField;
    FDQueryVOLUME: TFloatField;
    procedure CommitActionExecute(Sender: TObject);
    procedure JvDBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvDSDataChange(Sender: TObject; Field: TField);
    procedure JvDSActiveChanged(Sender: TObject);
    procedure JvDSUpdateData(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeadRestForm: TDeadRestForm;

implementation

{$R *.dfm}

uses DmUnit, MainUnit;

procedure TDeadRestForm.CommitActionExecute(Sender: TObject);
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

procedure TDeadRestForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if FDQuery.UpdateTransaction.Active then FDQuery.UpdateTransaction.Rollback;
  if FDQuery.Transaction.Active then FDQuery.Transaction.Rollback;

end;

procedure TDeadRestForm.FormCreate(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TDeadRestForm.JvDBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
  begin
    CommitActionExecute(Sender);
    key := 0;
  end;
  if (Key = VK_F10) or (Key = VK_ESCAPE) then
  begin
    RefreshActionExecute(Sender);
    key := 0;
  end;
  if Key = VK_DELETE then
  begin
    FDQuery.Delete;
    key := 0;
  end;

end;

procedure TDeadRestForm.JvDSActiveChanged(Sender: TObject);
begin
  inherited;
//
end;

procedure TDeadRestForm.JvDSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
//
//  if Field.FieldName = 'AZSCODE'
//   ... :=  JvDS.GetFieldValue(Field);
end;

procedure TDeadRestForm.JvDSUpdateData(Sender: TObject);
begin
  inherited;
//
end;

procedure TDeadRestForm.RefreshActionExecute(Sender: TObject);
begin
  inherited;
  if FDQuery.UpdateTransaction.Active then FDQuery.UpdateTransaction.Rollback;
  if FDQuery.Transaction.Active then FDQuery.Transaction.Rollback;

end;

end.
