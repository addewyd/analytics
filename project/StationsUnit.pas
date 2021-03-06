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
    UpdateAction: TAction;
    Update1: TMenuItem;
    ToolButton3: TToolButton;
    UpdateSQL: TFDUpdateSQL;
    FDQueryNAME: TWideStringField;
    FDQueryCODE: TWideStringField;
    FDQueryEXTCODE: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure UpdateActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvDBGridDblClick(Sender: TObject);
    procedure JvDBGridKeyPress(Sender: TObject; var Key: Char);
    procedure TransUPDAfterCommit(Sender: TObject);
    procedure JvDBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StationsForm: TStationsForm;

implementation

{$R *.dfm}

uses DmUnit, MainUnit;

procedure TStationsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if FDQuery.UpdateTransaction.Active then FDQuery.UpdateTransaction.Commit;
  if FDQuery.Transaction.Active then FDQuery.Transaction.Commit;
end;

// .............................................................................

procedure TStationsForm.FormCreate(Sender: TObject);
begin
  inherited;
  with FDQuery do
  begin
    Transaction.StartTransaction;
//    UpdateTransaction.StartTransaction;
    try
      Open;
      //FetchAll;
      //Transaction.Commit;
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

procedure TStationsForm.JvDBGridDblClick(Sender: TObject);
  var
    msg: TMessage;
    tb: TForm;
begin
  inherited;
  // change options, reopen sessions

  current_azscode := FDQuery.FieldByName('CODE').AsString;
  MainForm.StatusBar1.Panels[3].Text := '��� ' + current_azscode;

  // set option

  if not MainForm.isWinOpen('tabform')
  then
  begin
//
  end
  else
  begin
    tb := MainForm.GetMDIForm('tabform');
    tb.Close;
    MainForm.RemoveComponent(tb);
  end;


  msg.Msg := WM_STATION_CHANGED;
  MainForm.SendMsgs(msg);

end;

// .............................................................................

procedure TStationsForm.JvDBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
  begin
    UpdateActionExecute(Sender);
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

procedure TStationsForm.JvDBGridKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ord(Key) = VK_RETURN then
  begin
     Key := #0;
     JvDBGridDblClick(Sender);
  end;

end;

// .............................................................................

procedure TStationsForm.RefreshActionExecute(Sender: TObject);
begin
  if FDQuery.UpdateTransaction.Active then FDQuery.UpdateTransaction.Rollback;
  if FDQuery.Transaction.Active then FDQuery.Transaction.Rollback;
  inherited;
end;

// .............................................................................

procedure TStationsForm.TransUPDAfterCommit(Sender: TObject);
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
//      Post;
      ApplyUpdates(0);
      Close;
//      UpdateTransaction.Commit;
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

end.
