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
  JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid;

type
  TTabForm = class(TBaseForm)
    Pages: TJvPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DSInOut: TJvDataSource;
    QueryInOut: TFDQuery;
    CommitAction: TAction;
    RollbackAction: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    DSIOTH: TJvDataSource;
    QueryIOTH: TFDQuery;
    IOTHGrid: TJvDBUltimGrid;
    GridInOutGSM: TJvDBUltimGrid;
    FuelPopupMenu: TPopupMenu;
    Add1: TMenuItem;
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
    session_id: Integer;
    procedure ShowGSMData();
    procedure ShowIOTHData();
  end;

var
  TabForm: TTabForm;

implementation

{$R *.dfm}

uses DmUnit, MainUnit, YNUnit;

procedure TTabForm.ShowGSMData();
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

// .............................................................................

procedure TTabForm.ShowIOTHData();
begin
  with QueryIOTH do
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

// .............................................................................

procedure TTabForm.CommitActionExecute(Sender: TObject);
begin
  inherited;
  with QueryInOut do
  begin
    if Transaction.Active then
    begin
      Transaction.Commit;
      dirty := false;
      ShowIOTHData;
      ShowGSMData;
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
      ShowGSMData;
      ShowIOTHData;
      GridInOutGSM.Refresh;
      IOTHGrid.Refresh;
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

  session_id := 209;

  with QueryInOut do
  begin
    with Params do
    begin
      Clear;
      with Add do
      begin
          Name := 'session_id';
          DataType := ftInteger;
          ParamType := ptInput;
      end;
    end;
    ParamByName('session_id').AsInteger := session_id;
  end;

  with QueryIOTH do
  begin
    with Params do
    begin
      Clear;
      with Add do
      begin
          Name := 'session_id';
          DataType := ftInteger;
          ParamType := ptInput;
      end;
    end;
    ParamByName('session_id').AsInteger := session_id;
  end;


  ShowIOTHData;
  ShowGSMData;

end;

// .............................................................................

procedure TTabForm.GridInOutGSMEditChange(Sender: TObject);
begin
  //
  dirty := true;
end;


end.


