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

{$I 'consts.inc'}

type
  TCatGSMForm = class(TFormWithGrid)
    CommitAction: TAction;
    ToolButton3: TToolButton;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CommitActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure JvDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBGridColEnter(Sender: TObject);
    procedure JvDBGridColExit(Sender: TObject);
    procedure JvDBGridCellClick(Column: TColumn);
    procedure JvDBGridKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FDQueryReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
  private
    { Private declarations }
    procedure ToggleCB;
    procedure catsupd(var Msg: TMessage); message WM_CATS_UPD;
  public
    { Public declarations }
  end;

var
  CatGSMForm: TCatGSMForm;

implementation

{$R *.dfm}

uses DmUnit, MainUnit;

procedure TCatGSMForm.CommitActionExecute(Sender: TObject);
  var
    msg: TMessage;
    ie: Integer;
    code: String;

begin
  inherited;

  with FDQuery do
  begin
    code := FieldByName('code').AsString;

    Transaction.StartTransaction;
    try
      ie := ApplyUpdates(0);
      if ie = 0 then
      begin
        CommitUpdates;
        Close;
        Transaction.Commit;
        LoadData;
        Locate('CODE', code);

        msg.Msg := WM_GSM_CHANGED;
        MainForm.SendMsgs(msg);
      end
      else
      begin
        Reconcile;
      end;
    except
      on e: exception do
      begin
        if Transaction.Active then Transaction.Rollback;
        ErrorMessageBox(self, e.message);
      end;
    end;
  end;
end;

// .............................................................................

procedure TCatGSMForm.FDQueryReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  inherited;
  AddToLog(e.Message);
end;

procedure TCatGSMForm.FormCreate(Sender: TObject);
begin
  inherited;
//  LoadData;

  with FDQuery do
    begin
    Transaction.StartTransaction;
    try
      Open;
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

// .............................................................................

procedure TCatGSMForm.ToggleCB;
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
//    JvDBGrid.SelectedField.Dataset.Post;
    FDQuery.Edit;
    FDQuery.FieldByName(JvDBGrid.SelectedField.FieldName).AsInteger := v;
    FDQuery.Post;
    //FDQuery.ApplyUpdates;

end;

// .............................................................................

procedure TCatGSMForm.JvDBGridCellClick(Column: TColumn);
begin
  inherited;
  if AnsiSameText(column.FieldName, 'INCL') then
  begin
    ToggleCB;
  end;
end;

// .............................................................................

procedure TCatGSMForm.JvDBGridColEnter(Sender: TObject);
begin
  inherited;
  with TDBGrid(Sender) do
    if SelectedField.FieldName = 'INCL' then
      Options := Options - [dgEditing]
    else
      Options := Options + [dgEditing]
end;

// .............................................................................

procedure TCatGSMForm.JvDBGridColExit(Sender: TObject);
begin
  inherited;
//
end;

// .............................................................................

procedure TCatGSMForm.JvDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Style : Integer;
  cbrect: trect;
begin
  inherited;
  if AnsiSameText(column.FieldName, 'INCL') then
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
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle, cbRect, DFC_BUTTON, Style);
  end;

end;

// .............................................................................

procedure TCatGSMForm.JvDBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TCatGSMForm.JvDBGridKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
 if (key = Chr(9)) then Exit;
  with TDBGrid(Sender) do
  begin
    if SelectedField.FieldName = 'INCL' then
    begin
       if key = chr(32) then
       begin
          ToggleCB;
       end;
    end;
  end;

end;

// .............................................................................

procedure TCatGSMForm.RefreshActionExecute(Sender: TObject);
begin
 // if FDQuery.UpdateTransaction.Active then FDQuery.UpdateTransaction.Rollback;
  if FDQuery.Transaction.Active then FDQuery.Transaction.Rollback;
  inherited;

end;

// .............................................................................

procedure TCatGSMForm.catsupd(var Msg: TMessage);
begin
  LoadData;
end;


end.
