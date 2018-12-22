unit StoragesUnit;

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
  TStoragesForm = class(TFormWithGrid)
    CommitAction: TAction;
    ToolButton3: TToolButton;
    N2: TMenuItem;
    FDQueryCODE: TWideStringField;
    FDQueryNAME: TWideStringField;
    FDQueryAZSCODE: TWideStringField;
    procedure CommitActionExecute(Sender: TObject);
    procedure JvDBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
  private
    { Private declarations }
    procedure catsupd(var Msg: TMessage); message WM_CATS_UPD;
  public
    { Public declarations }
  end;

var
  StoragesForm: TStoragesForm;

implementation

{$R *.dfm}

uses DmUnit, MainUnit;

procedure TStoragesForm.CommitActionExecute(Sender: TObject);
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
        ErrorMessageBox(self, 'QEJ ' + e.message);
      end;
    end;
  end;
end;

procedure TStoragesForm.FormCreate(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TStoragesForm.JvDBGridKeyDown(Sender: TObject; var Key: Word;
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

// .............................................................................

procedure TStoragesForm.RefreshActionExecute(Sender: TObject);
begin
  //inherited;
  if FDQuery.UpdateTransaction.Active then FDQuery.UpdateTransaction.Rollback;
  if FDQuery.Transaction.Active then FDQuery.Transaction.Rollback;
  inherited;
end;

// .............................................................................

procedure TStoragesForm.catsupd(var Msg: TMessage);
begin
  LoadData;
end;

end.
