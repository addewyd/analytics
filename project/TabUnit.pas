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
  JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  Vcl.ExtCtrls, JvExExtCtrls, JvSplitter, JvDBGridFooter, JvExtComponent,
  JvPanel;

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
    FuelPopupMenu: TPopupMenu;
    Add1: TMenuItem;
    DSRealPM: TJvDataSource;
    QueryRealPM: TFDQuery;
    JvPanel2: TJvPanel;
    GridFooterInOut: TJvDBGridFooter;
    GridInOutGSM: TJvDBUltimGrid;
    JvPanel1: TJvPanel;
    IOTHGrid: TJvDBUltimGrid;
    Spl01: TJvSplitter;
    RealPMFooter: TJvDBGridFooter;
    RealPMGrid: TJvDBUltimGrid;
    UpdateIOTHSQL: TFDUpdateSQL;
    QuerySST: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure CommitActionExecute(Sender: TObject);
    procedure RollbackActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure GridInOutGSMEditChange(Sender: TObject);
    procedure RealPMFooterCalculate(Sender: TJvDBGridFooter;
      const FieldName: string; var CalcValue: Variant);
    procedure GridFooterInOutCalculate(Sender: TJvDBGridFooter;
      const FieldName: string; var CalcValue: Variant);
    procedure IOTHGridEditChange(Sender: TObject);
    procedure RealPMGridEditChange(Sender: TObject);
  private
    { Private declarations }
    dirty: boolean;
  public
    { Public declarations }
    session_id: Integer;
    sst: String;
    //azscode: String;
    procedure ShowAllData();

    procedure ShowGSMData();
    procedure ShowIOTHData();
    procedure ShowPMData();
    function GetStartSession :String;
  end;

var
  TabForm: TTabForm;

implementation

{$R *.dfm}

uses DmUnit, MainUnit, YNUnit;


function TTabForm.GetStartSession :String;
begin
  result := '2000-01-01 00:00:00';
//  last_sessions_count
try
  with QuerySST do
  begin
    Transaction.StartTransaction;
    with Params  do
    begin
      Clear;
      with Add do
      begin
          Name := 'cnt';
          DataType := ftInteger;
          ParamType := ptInput;
      end;
      with Add do
      begin
          Name := 'azs';
          DataType := ftString;
          ParamType := ptInput;
      end;
    end;
    ParamByName('cnt').AsInteger := last_sessions_count;
    ParamByName('azs').AsString := current_azscode;
    Prepare;
    Open;
    First;
    if not EOF then
    begin
      //First;
      Result := FieldByName('startdatetime').AsString;
    end;

    Close;
    Transaction.Commit;
  end;
except
  on e: Exception do
  begin
    QuerySST.Transaction.Rollback;
    AddToLog(e.Message);
  end;

end;

end;
// .............................................................................

procedure TTabForm.ShowAllData();
begin
  sst := GetStartSession();
  ShowIOTHData;
  ShowGSMData;
  ShowPMData;
  GridInOutGSM.Refresh;
  IOTHGrid.Refresh;
  RealPMGrid.Refresh;

end;

// .............................................................................

procedure TTabForm.ShowGSMData();
begin

  with QueryInOut do
  begin
    if Active then Close;

    with Params do
    begin
      Clear;
      with Add do
      begin
          Name := 'start_session_t';
          DataType := ftString;
          ParamType := ptInput;
      end;
      with Add do
      begin
          Name := 'azscode';
          DataType := ftString;
          ParamType := ptInput;
      end;
    end;
    ParamByName('start_session_t').AsString := sst;
    ParamByName('azscode').AsString := current_azscode;

    Transaction.StartTransaction;
    try
      Prepare;
      Open;
//      Transaction.Commit;
    except
      on e: Exception do
      begin
        AddToLog(e.Message);
//        Transaction.Rollback;
//        raise
      end;
    end;
  end;

end;

// .............................................................................

procedure TTabForm.ShowPMData();
begin
  with QueryRealPM do
  begin
    if Active then Close;
    with Params do
    begin
      Clear;
      with Add do
      begin
          Name := 'start_session_t';
          DataType := ftString;
          ParamType := ptInput;
      end;
      with Add do
      begin
          Name := 'azscode';
          DataType := ftString;
          ParamType := ptInput;
      end;
    end;
    ParamByName('start_session_t').AsString := sst;
    ParamByName('azscode').AsString := current_azscode;

    Transaction.StartTransaction;
    try
      Prepare;
      Open;
//      Transaction.Commit;
    except
      on e: Exception do
      begin
        AddToLog(e.Message);
//        Transaction.Rollback;
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
    with Params do
    begin
      Clear;
      with Add do
      begin
          Name := 'start_session_t';
          DataType := ftString;
          ParamType := ptInput;
      end;
      with Add do
      begin
          Name := 'azscode';
          DataType := ftString;
          ParamType := ptInput;
      end;
    end;
    ParamByName('start_session_t').AsString := sst;
    ParamByName('azscode').AsString := current_azscode;

    Transaction.StartTransaction;
    try
      Prepare;
      Open;
//      Transaction.Commit;
    except
      on e: Exception do
      begin
        AddToLog(e.Message);
//        Transaction.Rollback;
//        raise
      end;
    end;
  end;

end;

// .............................................................................

procedure TTabForm.CommitActionExecute(Sender: TObject);
begin
  inherited;
  try
    with QueryInOut do
    begin
      if Transaction.Active then
      begin
        Transaction.Commit;
      end;
    end;
    with QueryIOTH do
    begin
      if Transaction.Active then
      begin
        Transaction.Commit;
      end;
    end;
    with QueryRealPM do
    begin
      if Transaction.Active then
      begin
        Transaction.Commit;
      end;
    end;
    dirty := false;
  except
    on e: Exception do
    begin
      AddToLog(e.Message);
    end;
  end;

  ShowAllData;
end;

// .............................................................................

procedure TTabForm.RollbackActionExecute(Sender: TObject);
begin
  inherited;
  try
    with QueryInOut do
    begin
      if Transaction.Active then
      begin
        Transaction.Rollback;
      end;

    end;
    with QueryIOTH do
    begin
      if Transaction.Active then
      begin
        Transaction.Rollback;
      end;

    end;
    with QueryRealPM do
    begin
      if Transaction.Active then
      begin
        Transaction.Rollback;
      end;

    end;
    dirty := false;
  except
    on e: Exception do
    begin
      AddToLog(e.Message);
    end;
  end;
  ShowAllData;
end;

// .............................................................................

procedure TTabForm.GridFooterInOutCalculate(Sender: TJvDBGridFooter;
  const FieldName: string; var CalcValue: Variant);
begin
  inherited;
  CalcValue := 'F: ' + FieldName;
end;

// .............................................................................

procedure TTabForm.RealPMFooterCalculate(Sender: TJvDBGridFooter;
  const FieldName: string; var CalcValue: Variant);
begin
  inherited;
//  AddToLog(FieldName);
  CalcValue := 'F: ' + FieldName;
end;

// .............................................................................

procedure TTabForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if QueryInOut.Transaction.Active then
  begin
//
  end;
//  JVFS.SaveFormPlacement;

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
        QueryIOTH.Transaction.Commit;
        QueryRealPM.Transaction.Commit;
        CanClose := true;
      end;
      if  mr = mrAbort then
      begin
        QueryInOut.Transaction.Rollback;
        QueryIOTH.Transaction.Rollback;
        QueryRealPM.Transaction.Rollback;
        CanClose := true;
      end;
    end;

  end;

end;

// .............................................................................

procedure TTabForm.FormCreate(Sender: TObject);
  var
    i: Integer;
    sst: String;
begin
  inherited;
  dirty := false;
  ShowAllData;
end;

// ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

procedure TTabForm.GridInOutGSMEditChange(Sender: TObject);
begin
  //
  dirty := true;
end;


procedure TTabForm.IOTHGridEditChange(Sender: TObject);
begin
  inherited;
  dirty := true;
//
end;

procedure TTabForm.RealPMGridEditChange(Sender: TObject);
begin
  inherited;
//
end;


end.
