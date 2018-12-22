unit TanksHosesUnit;

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
  Vcl.ToolWin, JvToolBar, Vcl.StdCtrls;

type
  TTanksHosesForm = class(TFormWithGrid)
    CommitAction: TAction;
    ToolButton3: TToolButton;
    azsedit: TEdit;
    Label1: TLabel;
    ToolButton4: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure PrepareAndLoad;
    procedure CommitActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure JvDBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure azseditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    acode: String;
  public
    { Public declarations }
    procedure stationchanged(var Msg: TMessage); message WM_STATION_CHANGED;
  end;

var
  TanksHosesForm: TTanksHosesForm;

implementation

{$R *.dfm}

uses MainUnit, DmUnit;

procedure TTanksHosesForm.PrepareAndLoad;
begin
  with FDQuery do
  begin

    with params do
    begin
      Clear;
      with add do
      begin
        Name:= 'azscode';
        DataType := ftString;
        ParamType:= ptInput;
      end;
    end;
    ParamByName('azscode').AsString := acode;


  end;
  inherited;
  inherited LoadData;
  JvDBGrid.Refresh;

end;

// .............................................................................

procedure TTanksHosesForm.azseditKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = chr(13) then
  begin
    acode := azsedit.Text;
    PrepareAndLoad;
    key := chr(0);
  end;

end;

// .............................................................................

procedure TTanksHosesForm.CommitActionExecute(Sender: TObject);
begin
  inherited;
  with FDQuery do
  begin

    with params do
    begin
      Clear;
      with add do
      begin
        Name:= 'azscode';
        DataType := ftString;
        ParamType:= ptInput;
      end;
    end;
    ParamByName('azscode').AsString := current_azscode;

    Transaction.StartTransaction;
    try
      ApplyUpdates(0);
      Close;
      Transaction.Commit;
      PrepareAndLoad;
    except
      on e: exception do
      begin
        Transaction.Rollback;
        ErrorMessageBox(self, 'QEI ' + e.message);
      end;
    end;
  end;

end;

// .............................................................................

procedure TTanksHosesForm.FormCreate(Sender: TObject);
begin
  inherited;
  acode := current_azscode;
  Caption := 'Рукава АЗС ' + acode;
  azsedit.Text := acode;
  PrepareAndLoad;
end;

// .............................................................................

procedure TTanksHosesForm.JvDBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TTanksHosesForm.RefreshActionExecute(Sender: TObject);
begin
//  inherited;
//  if FDQuery.UpdateTransaction.Active then FDQuery.UpdateTransaction.Rollback;
//  if FDQuery.Transaction.Active then FDQuery.Transaction.Rollback;
  PrepareAndLoad;
end;

// .............................................................................

procedure TTanksHosesForm.stationchanged(var Msg: TMessage);
begin
//  AddToLog('STATIONCANGED');
  Caption := 'Рукава АЗС ' + current_azscode;
  PrepareAndLoad;
end;


end.
