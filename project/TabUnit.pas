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
    TransInOut: TFDTransaction;
    TransIOTH: TFDTransaction;
    TransPM: TFDTransaction;
    QueryWL: TFDQuery;
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
    procedure QueryIOTHAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    dirtyGSM: boolean;
    dirtyIOTH: boolean;
    dirtyPM: boolean;
    warelist: TStringList;
    session_id: Integer;
    procedure LoadWareList;
    function GenPMSql: String;
  public
    { Public declarations }
    sst: String;
    //azscode: String;

    constructor Create(pr: TComponent; fname: String; _sid: Integer); reintroduce; overload;

    procedure ShowAllData();

    procedure ShowGSMData();
    procedure ShowIOTHData();
    procedure ShowPMData();
    procedure UpdateState(q: TFDQuery);
    function GetStartSession :String;
  end;

var
  TabForm: TTabForm;

implementation

{$R *.dfm}

uses DmUnit, MainUnit, YNUnit;

constructor TTabForm.Create(pr: TComponent; fname: String; _sid: Integer);
begin
  inherited create(pr, fname);
  session_id := _sid;

end;

// .............................................................................

procedure TTabForm.UpdateState(q: TFDQuery);
begin
  // HZ!!!
//  q.UpdateTransaction.Commit;
  AddToLog(q.Name + ' need update');
  WITH Q DO
  begin
//
  end;
end;

// .............................................................................

procedure TTabForm.LoadWareList;
begin
  warelist.Clear;

  with QueryWL do
  begin
    Transaction.StartTransaction;
    Open;
    while not Eof do
    begin
      warelist.Add(FieldByName('code').AsString +'='+
        FieldByName('name').AsString);
      Next;
    end;
//    Close;
//    Transaction.Commit;
  end;

end;

// .............................................................................

function TTabForm.GenPMSql: String;
  var th, tf, tm: String;
    len, i: Integer;
begin
  result := '';

  th :=
'select' +
'    i.session_id,' +
'    cast(s.startdatetime as date) as stdt,' +
'    i.payment_code,' +
'    p.name as pmode,' +

'    sum(i.volume) as volume,';

  len := warelist.Count;
  for i := 0 to len - 1 do
  begin
    tm :=
    '(select sum(i1.volume) from inoutgsm i1 join wares w1 on w1.code=i1.ware_code ' +
    '    where w1.code= ' + #$27 + warelist.Names[i] + #$27 +
    '        and i1.direction=0 ' +
    '        and i1.payment_code = i.payment_code) ' +
    '    as volume_' + IntToStr(i) + ',';
    th := th + tm;
  end;
tf := ' 0 as nol' +
'    from inoutgsm i' +
'    join sessions s on s.id=i.session_id' +
'    join paymentmodes p on i.payment_code = p.code' +

'    where /*s.startdatetime >= cast(:start_session_t as TIMESTAMP)*/' +
'   s.id = :session_id ' +
'   and azscode=:azscode' +
'   and  i.direction = 0' +
' group by session_id,stdt,payment_code, pmode' +
' order by stdt';

  result := th + tf;

end;

// .............................................................................

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
  ShowGSMData;
  ShowIOTHData;
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
          Name := 'session_id';
          DataType := ftInteger;
          ParamType := ptInput;
      end;
      with Add do
      begin
          Name := 'azscode';
          DataType := ftString;
          ParamType := ptInput;
      end;
    end;
//    ParamByName('start_session_t').AsString := sst;
    ParamByName('session_id').AsInteger := session_id;
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
  var
    i, len: Integer;
    k, v : string;
begin

  LoadWareList();

  with RealPMGrid do
  begin
    with Columns do
    begin
      with Add do
      begin
        Fieldname := 'stdt';
      end;
      with Add do
      begin
        Fieldname := 'payment_code';
      end;
      with Add do
      begin
        Fieldname := 'pmode';
      end;
      with Add do
      begin
        Fieldname := 'volume';
        Title.Caption := 'Îáú¸ì';
      end;
    end;

    len := warelist.Count;
    for i := 0 to len - 1 do
    begin

      k := warelist.Names[i];
      v := warelist.ValueFromIndex[i];
      with Columns do
      begin
        with Add do
        begin
          FieldName := 'volume_' + IntToStr(i);
          Title.Caption := v;
        end;
      end;
    end;

  end;

  with QueryRealPM do
  begin
    if Active then Close;

    SQL.Text := GenPMSql();

    with Params do
    begin
      Clear;
      with Add do
      begin
          Name := 'session_id';
          DataType := ftInteger;
          ParamType := ptInput;
      end;
      with Add do
      begin
          Name := 'azscode';
          DataType := ftString;
          ParamType := ptInput;
      end;
    end;
    ParamByName('session_id').AsInteger := session_id;
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
      (*
      with Add do
      begin
          Name := 'start_session_t';
          DataType := ftString;
          ParamType := ptInput;
      end;
      *)
      with Add do
      begin
          Name := 'session_id';
          DataType := ftInteger;
          ParamType := ptInput;
      end;
      with Add do
      begin
          Name := 'azscode';
          DataType := ftString;
          ParamType := ptInput;
      end;
    end;
//    ParamByName('start_session_t').AsString := sst;
    ParamByName('session_id').Asinteger := session_id;
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
  var
    cmt: boolean;
begin
  inherited;
  cmt := false;
  try

    with QueryIOTH do
    begin
      if Transaction.Active then
      begin
        if dirtyIOTH then
        begin
          Transaction.Commit;
          cmt := true;
          UpdateState(QueryIOTH);
          dirtyIOTH := false;
        end;
      end;
    end;

    with QueryRealPM do
    begin
      if Transaction.Active then
      begin
        if dirtyPM then
        begin
          Transaction.Commit;
          cmt := true;
          UpdateState(QueryRealPM);
          dirtyPM := false;
        end;
      end;
    end;

    with QueryInOut do
    begin
      if Transaction.Active then
      begin
        if dirtyGSM then
        begin
          Transaction.Commit;
          cmt := true;
          UpdateState(QueryInOut);
          dirtyGSM := false;
        end;
      end;
    end;

//    if cmt then DM.FDTransaction.Commit;

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
  var
    cmt: boolean;
begin
  inherited;
  cmt := false;
  try
    with QueryInOut do
    begin
      if Transaction.Active then
      begin
        Transaction.Rollback;
          cmt := true;
        dirtyGSM := false;
      end;

    end;
    with QueryIOTH do
    begin
      if Transaction.Active then
      begin
        Transaction.Rollback;
          cmt := true;
        dirtyIOTH := false;
      end;

    end;
    with QueryRealPM do
    begin
      if Transaction.Active then
      begin
//        Transaction.Rollback;
          cmt := true;
        dirtyPM := false;
      end;

    end;
  //  if cmt  then DM.FDTransaction.Rollback;

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
  warelist.Free;
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
  //if QueryInOut.Transaction.Active then
  //begin

    CanClose := not (dirtyGSM or dirtyIOTH or dirtyPM);

    if not CanClose then
    begin
      yn := TYNForm.Create(self);
      yn.ButtonForget.Visible := true;
      yn.Memo1.Text := 'Commit changes & close?';
      mr := yn.ShowModal;
      if  mr = mrOk then
      begin
        if QueryInOut.Transaction.Active then QueryInOut.Transaction.Commit;
        if QueryIOTH.Transaction.Active then QueryIOTH.Transaction.Commit;
        if QueryRealPM.Transaction.Active then QueryRealPM.Transaction.Commit;

        if dirtyGSM then UpdateState(QueryInOut);
        if dirtyIOTH then UpdateState(QueryIOTH);
        if dirtyPM then UpdateState(QueryRealPM);
        CanClose := true;
      end;
      if  mr = mrAbort then
      begin
        if QueryInOut.Transaction.Active then QueryInOut.Transaction.Rollback;
        if QueryIOTH.Transaction.Active then QueryIOTH.Transaction.Rollback;
        if QueryRealPM.Transaction.Active then QueryRealPM.Transaction.Rollback;
        CanClose := true;
      end;
    end;

  //end;

end;

// .............................................................................

procedure TTabForm.FormCreate(Sender: TObject);
  var
    i: Integer;
    sst: String;
begin
  inherited;
  warelist := TStringList.Create;
  dirtyGSM := false;
  dirtyIOTH := false;
  dirtyPM := false;
  Caption := 'TabForm AZS ' + current_azscode + ' sid ' +  IntToStr(session_id);
  ShowAllData;
end;

// ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

procedure TTabForm.GridInOutGSMEditChange(Sender: TObject);
begin
  //
  dirtyGSM := true;
end;

// ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

procedure TTabForm.IOTHGridEditChange(Sender: TObject);
begin
  inherited;
  dirtyIOTH := true;
//
end;

// ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

procedure TTabForm.QueryIOTHAfterPost(DataSet: TDataSet);
begin
  inherited;
//  AddToLog('aftwr post');
end;

// .............................................................................

procedure TTabForm.RealPMGridEditChange(Sender: TObject);
begin
  inherited;
  dirtyPM := true;
end;


end.
