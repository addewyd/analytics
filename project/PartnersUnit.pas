unit PartnersUnit;

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

  {$I 'consts.inc'}

type
  TPartnersForm = class(TFormWithGrid)
    CommitAction: TAction;
    ToolButton3: TToolButton;
    N2: TMenuItem;
    FDQueryCODE: TWideStringField;
    FDQueryNAME: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure CommitActionExecute(Sender: TObject);
    procedure JvDBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RefreshActionExecute(Sender: TObject);
  private
    { Private declarations }
    procedure catsupd(var Msg: TMessage); message WM_CATS_UPD;
  public
    { Public declarations }

  end;

var
  PartnersForm: TPartnersForm;

implementation

{$R *.dfm}

uses DmUnit;

procedure TPartnersForm.CommitActionExecute(Sender: TObject);
  var
    code: String;
begin
  inherited;
  with FDQuery do
  begin
    code := FieldByName('code').AsString;
    Transaction.StartTransaction;
    try
      ApplyUpdates(0);
      Close;
      Transaction.Commit;
      LoadData;
      Locate('CODE', code);
    except
      on e: exception do
      begin
        Transaction.Rollback;
        ErrorMessageBox(self, e.message);
      end;
    end;
  end;
end;

// .............................................................................

procedure TPartnersForm.FormCreate(Sender: TObject);
begin
  inherited;
  with FDQuery do
  begin
//    SQL.Text := 'select code, name from contragents';
    Transaction.StartTransaction;
    try
      Open;
      Transaction.Commit;
      JvDBGrid.Columns[0].Title.Caption := 'Код';
      JvDBGrid.Columns[1].Title.Caption := 'Наименование';
    except
      Transaction.Rollback;
    end;
  end;

end;

// .............................................................................

procedure TPartnersForm.JvDBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TPartnersForm.RefreshActionExecute(Sender: TObject);
begin
  inherited;
  if FDQuery.UpdateTransaction.Active then FDQuery.UpdateTransaction.Rollback;
  if FDQuery.Transaction.Active then FDQuery.Transaction.Rollback;

end;

// .............................................................................

procedure TPartnersForm.catsupd(var Msg: TMessage);
begin
  LoadData;
end;

end.
