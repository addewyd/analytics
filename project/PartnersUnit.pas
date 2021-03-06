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
  JvDBUltimGrid, JvExControls, JvLabel, Vcl.StdCtrls, JvExStdCtrls, JvEdit;

  {$I 'consts.inc'}

type
  TPartnersForm = class(TFormWithGrid)
    CommitAction: TAction;
    ToolButton3: TToolButton;
    N2: TMenuItem;
    FDQueryCODE: TWideStringField;
    FDQueryNAME: TWideStringField;
    CodeEdit: TJvEdit;
    NameEdit: TJvEdit;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    procedure FormCreate(Sender: TObject);
    procedure CommitActionExecute(Sender: TObject);
    procedure JvDBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RefreshActionExecute(Sender: TObject);
    procedure CodeEditChange(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
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

procedure TPartnersForm.CodeEditChange(Sender: TObject);
begin
  inherited;
///

  FDQuery.Locate('CODE',CodeEdit.Text,[loPartialKey, loCaseInsensitive]);
end;

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
      JvDBGrid.Columns[0].Title.Caption := '���';
      JvDBGrid.Columns[1].Title.Caption := '������������';
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
  if (Key = VK_DELETE) and (ssShift in Shift) then
  begin
    FDQuery.Delete;
    key := 0;
  end;

end;

procedure TPartnersForm.NameEditChange(Sender: TObject);
begin
  inherited;
  FDQuery.Locate('NAME',NameEdit.Text,[loPartialKey, loCaseInsensitive]);

end;

// .............................................................................

procedure TPartnersForm.RefreshActionExecute(Sender: TObject);
begin
  if FDQuery.UpdateTransaction.Active then FDQuery.UpdateTransaction.Rollback;
  if FDQuery.Transaction.Active then FDQuery.Transaction.Rollback;
  inherited;

end;

// .............................................................................

procedure TPartnersForm.catsupd(var Msg: TMessage);
begin
  LoadData;
end;

end.
