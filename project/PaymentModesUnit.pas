unit PaymentModesUnit;

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
  TPaymentModesForm = class(TFormWithGrid)
    CommitAction: TAction;
    ToolButton3: TToolButton;
    FDQueryCODE: TWideStringField;
    FDQueryNAME: TWideStringField;
    FDQueryRNT: TSmallintField;
    FDQueryRBT: TSmallintField;
    FDQueryRNM: TSmallintField;
    FDQueryRBM: TSmallintField;
    FDQueryCAOT: TSmallintField;
    FDQueryCAOM: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure CommitActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure JvDBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBGridKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGridColEnter(Sender: TObject);
    procedure JvDBGridCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ToggleCB;
  end;

var
  PaymentModesForm: TPaymentModesForm;

implementation

{$R *.dfm}

uses DmUnit;

procedure TPaymentModesForm.CommitActionExecute(Sender: TObject);
begin
  inherited;
  with FDQuery do
  begin

    Transaction.StartTransaction;
    try
      ApplyUpdates(0);
      Close;
      Transaction.Commit;
//      PrepareAndLoad;
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

// .............................................................................

procedure TPaymentModesForm.FormCreate(Sender: TObject);
begin
  inherited;
  LoadData;
end;

// .............................................................................

procedure TPaymentModesForm.ToggleCB;
  var v: Integer;
begin
    JvDBGrid.SelectedField.Dataset.Edit;
    v := JvDBGrid.SelectedField.AsInteger;
    if v > 0 then
    begin
      v := 0;
    end
    else
    begin
      v := 1;
    end;
    JvDBGrid.SelectedField.AsInteger := v;
    JvDBGrid.SelectedField.Dataset.Post;

end;

// .............................................................................

procedure TPaymentModesForm.JvDBGridCellClick(Column: TColumn);
begin
  inherited;
  if    AnsiSameText(column.FieldName, 'RNT')
    or  AnsiSameText(column.FieldName, 'RBT')
    or  AnsiSameText(column.FieldName, 'RNM')
    or  AnsiSameText(column.FieldName, 'RBM')
    or  AnsiSameText(column.FieldName, 'CAOT')
    or  AnsiSameText(column.FieldName, 'CAOM')
    then
  begin
    ToggleCB;
  end;
end;

// .............................................................................

procedure TPaymentModesForm.JvDBGridColEnter(Sender: TObject);
begin
  inherited;
  with TDBGrid(Sender) do
  if    AnsiSameText(SelectedField.FieldName, 'RNT')
    or  AnsiSameText(SelectedField.FieldName, 'RBT')
    or  AnsiSameText(SelectedField.FieldName, 'RNM')
    or  AnsiSameText(SelectedField.FieldName, 'RBM')
    or  AnsiSameText(SelectedField.FieldName, 'CAOT')
    or  AnsiSameText(SelectedField.FieldName, 'CAOM')
    then
      Options := Options - [dgEditing]
    else
      Options := Options + [dgEditing]

end;

// .............................................................................

procedure TPaymentModesForm.JvDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Style : Integer;
  cbrect: trect;
{
    RNT   SMALLINT,
    RBT   SMALLINT,
    RNM   SMALLINT,
    RBM   SMALLINT,
    CAOT  SMALLINT,
    CAOM  SMALLINT
}
begin
  inherited;
  if    AnsiSameText(column.FieldName, 'RNT')
    or  AnsiSameText(column.FieldName, 'RBT')
    or  AnsiSameText(column.FieldName, 'RNM')
    or  AnsiSameText(column.FieldName, 'RBM')
    or  AnsiSameText(column.FieldName, 'CAOT')
    or  AnsiSameText(column.FieldName, 'CAOM')
    then
  begin
    if Column.Field.AsInteger > 0 then
      begin
        style := DFCS_CHECKED;
        cbrect:=rect;
      end
      else
      begin
        style := DFCS_BUTTONCHECK;
        cbrect:=rect;
      end;
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle,
        cbRect, DFC_BUTTON, Style);
  end;

end;

// .............................................................................

procedure TPaymentModesForm.JvDBGridKeyDown(Sender: TObject; var Key: Word;
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

end;

// .............................................................................

procedure TPaymentModesForm.JvDBGridKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
 if (key = Chr(9)) then Exit;
  with TDBGrid(Sender) do
  begin
  if    AnsiSameText(SelectedField.FieldName, 'RNT')
    or  AnsiSameText(SelectedField.FieldName, 'RBT')
    or  AnsiSameText(SelectedField.FieldName, 'RNM')
    or  AnsiSameText(SelectedField.FieldName, 'RBM')
    or  AnsiSameText(SelectedField.FieldName, 'CAOT')
    or  AnsiSameText(SelectedField.FieldName, 'CAOM')
    then
    begin
       if key = chr(32) then
       begin
          ToggleCB;
       end;
    end;
  end;

end;

// .............................................................................

procedure TPaymentModesForm.RefreshActionExecute(Sender: TObject);
begin
  inherited;
  LoadData;
end;

end.
