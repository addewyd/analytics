unit TabUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseFormUnit1, System.ImageList,
  Vcl.ImgList, Vcl.Menus, System.Actions, Vcl.ActnList, JvFormPlacement,
  JvComponentBase, JvAppStorage, JvAppRegistryStorage, Vcl.ComCtrls,
  JvExComCtrls, JvStatusBar, Vcl.ToolWin, JvToolBar, JvComCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TTabForm = class(TBaseForm)
    Pages: TJvPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GridInOutGSM: TJvDBGrid;
    DSInOut: TJvDataSource;
    QueryInOut: TFDQuery;
    CommitAction: TAction;
    RollbackAction: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure CommitActionExecute(Sender: TObject);
    procedure RollbackActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure GridInOutGSMEditChange(Sender: TObject);
  private
    { Private declarations }
    dirty: boolean;
  public
    { Public declarations }
    procedure ShowData();
  end;

var
  TabForm: TTabForm;

implementation

{$R *.dfm}

uses DmUnit, MainUnit, YNUnit;

procedure TTabForm.ShowData();
begin
  with QueryInOut do
  begin
    if Active then Close;

    Transaction.StartTransaction;
    try

      Open;
    except
      on e: Exception do
      begin
        AddToLog(e.Message);
//      Transaction.Rollback;
//        raise
      end;
    end;
  end;

end;


procedure TTabForm.CommitActionExecute(Sender: TObject);
begin
  inherited;
  with QueryInOut do
  begin
    if Transaction.Active then
    begin
      Transaction.Commit;
      dirty := false;
      ShowData;
    end;

  end;
end;

// .............................................................................

procedure TTabForm.RollbackActionExecute(Sender: TObject);
begin
  inherited;
  with QueryInOut do
  begin
    if Transaction.Active then
    begin
      Transaction.Rollback;
      dirty := false;
      ShowData;
      GridInOutGSM.Refresh;
    end;

  end;

end;

// .............................................................................

procedure TTabForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if QueryInOut.Transaction.Active then
  begin
//
  end;

end;

// .............................................................................

procedure TTabForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    yn: TYNForm;
    mr: Integer;
begin
  inherited;
  if QueryInOut.Transaction.Active then
  begin

    CanClose := not dirty;

    if not CanClose then
    begin
      yn := TYNForm.Create(self);
      yn.ButtonForget.Visible := true;
      yn.Memo1.Text := 'Commit changes & close?';
      mr := yn.ShowModal;
      if  mr = mrOk then
      begin
        QueryInOut.Transaction.Commit;
        CanClose := true;
      end;
      if  mr = mrAbort then
      begin
        QueryInOut.Transaction.Rollback;
        CanClose := true;
      end;
    end;

  end;

end;

// .............................................................................

procedure TTabForm.FormCreate(Sender: TObject);
begin
  inherited;
  dirty := false;
  ShowData;

end;

// .............................................................................

procedure TTabForm.GridInOutGSMEditChange(Sender: TObject);
begin
  //
  dirty := true;
end;


end.


