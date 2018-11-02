unit TabUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseFormUnit1, System.ImageList,
  Vcl.ImgList, Vcl.Menus, System.Actions, Vcl.ActnList, JvFormPlacement,
  JvComponentBase, JvAppStorage, JvAppRegistryStorage, Vcl.ComCtrls,
  JvExComCtrls, JvStatusBar, Vcl.ToolWin, JvToolBar, JvComCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  Vcl.ExtCtrls, JvExExtCtrls, JvSplitter, JvDBGridFooter, JvExtComponent,
  JvPanel, Vcl.StdCtrls, JvExStdCtrls, JvCombobox, JvDBCombobox, JvExControls,
  JvDBLookup, ExDBUGrid;

{$Include 'consts.inc'}

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
    DSRealPM: TJvDataSource;
    QueryRealPM: TFDQuery;
    JvPanel2: TJvPanel;
    GridFooterInOut: TJvDBGridFooter;
    GridInOutGSM: TJvDBUltimGrid;
    JvPanel1: TJvPanel;
    Spl01: TJvSplitter;
    RealPMFooter: TJvDBGridFooter;
    RealPMGrid: TJvDBUltimGrid;
    QuerySST: TFDQuery;
    TransInOut: TFDTransaction;
    TransIOTH: TFDTransaction;
    TransPM: TFDTransaction;
    QueryWL: TFDQuery;
    StartVPMenu: TPopupMenu;
    SetPrevSessionData1: TMenuItem;
    IOTHGrid: TJvDBUltimGrid;
    RButton: TButton;
    ggg1: TMenuItem;
    GenUpdQuery: TFDQuery;
    GenUpdTrans: TFDTransaction;
    GenUpdTransUPD: TFDTransaction;
    QueryRealPmSum: TFDQuery;
    IOTHFooter: TJvDBGridFooter;
    SCNTPMenu: TPopupMenu;
    SCNT1: TMenuItem;
    RestoreIOTHRec: TFDStoredProc;
    TransINOutUpd: TFDTransaction;
    QueryIOTHSum: TFDQuery;
    QueryInOutSum: TFDQuery;
    QueryInOutItems: TFDQuery;
    TransInOutItems: TFDTransaction;
    DSInOutItems: TJvDataSource;
    GridInOutItems: TJvDBUltimGrid;
    GridFooterInOutItems: TJvDBGridFooter;
    QueryInOutItemsSum: TFDQuery;
    QueryInOutItemsID: TIntegerField;
    QueryInOutItemsDIR: TWideStringField;
    QueryInOutItemsSDATE: TDateField;
    QueryInOutItemsCLIENTNAME: TWideStringField;
    QueryInOutItemsCONTRACT: TWideStringField;
    QueryInOutItemsPAYMENTMODE: TWideStringField;
    QueryInOutItemsITEMNAME: TWideStringField;
    QueryInOutItemsITEMCODE: TWideStringField;
    QueryInOutItemsAMOUNT: TFloatField;
    QueryInOutItemsEI: TWideStringField;
    QueryInOutItemsQUANTITY: TIntegerField;
    QueryInOutItemsPRICE: TFloatField;
    QueryInOutItemsNDS: TWideStringField;
    QueryInOutItemsSUMM: TFloatField;
    QueryInOutItemsWHOLE: TFloatField;
    QIOIUpdateSQL: TFDUpdateSQL;
    QueryInOutID: TIntegerField;
    QueryInOutDIR: TWideStringField;
    QueryInOutSDATE: TDateField;
    QueryInOutCLIENTNAME: TWideStringField;
    QueryInOutCONTRACT: TWideStringField;
    QueryInOutPAYMENTMODE: TWideStringField;
    QueryInOutFUELNAME: TWideStringField;
    QueryInOutFUELCODE: TWideStringField;
    QueryInOutAMOUNT: TFloatField;
    QueryInOutEI: TWideStringField;
    QueryInOutVOLUME: TFloatField;
    QueryInOutPRICE: TFloatField;
    QueryInOutDENSITY: TFloatField;
    QueryInOutNDS: TWideStringField;
    QueryInOutWHOLE: TFloatField;
    InOutUPDSql: TFDUpdateSQL;
    QueryInOutSUMNDS: TFloatField;
    QueryInOutSumVOLUME: TFloatField;
    QueryInOutSumAMOUNT: TFloatField;
    QueryInOutSumSUMNDS: TFloatField;
    QueryInOutSumWHOLE: TFloatField;
    QueryInOutItemsSUMNDS: TFloatField;
    CloseSessAction: TAction;
    ToolButton4: TToolButton;
    GenQuery: TFDQuery;
    GenTrans: TFDTransaction;
    ClearCloseAction: TAction;
    ToolButton5: TToolButton;
    N1: TMenuItem;
    N2: TMenuItem;
    VerifiedAction: TAction;
    ToolButton6: TToolButton;
    N3: TMenuItem;
    QueryIOTHID: TIntegerField;
    QueryIOTHSESSION_ID: TIntegerField;
    QueryIOTHSTDT: TDateField;
    QueryIOTHFUELNAME: TWideStringField;
    QueryIOTHTANKNUM: TWideStringField;
    QueryIOTHSTARTFUELVOLUME: TFloatField;
    QueryIOTHCALCIN: TFloatField;
    QueryIOTHCALC: TFloatField;
    QueryIOTHCALCREST: TFloatField;
    QueryIOTHENDFACTVOLUME: TFloatField;
    QueryIOTHHOSENUM: TIntegerField;
    QueryIOTHSTCNT: TFloatField;
    QueryIOTHECNT: TFloatField;
    QueryIOTHDENSITY: TFloatField;
    QueryIOTHTEMPERATURE: TFloatField;
    QueryIOTHHEIGHT: TFloatField;
    QueryIOTHMASS: TFloatField;
    QueryIOTHWATER: TFloatField;
    QueryIOTHWARECODE: TWideStringField;
    QueryIOTHFACT: TFloatField;
    QueryIOTHOUTCOME: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure CommitActionExecute(Sender: TObject);
    procedure RollbackActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RealPMFooterCalculate(Sender: TJvDBGridFooter;
      const FieldName: string; var CalcValue: Variant);
    procedure GridFooterInOutCalculate(Sender: TJvDBGridFooter;
      const FieldName: string; var CalcValue: Variant);
    procedure SetPrevSessionData1Click(Sender: TObject);
    procedure IOTHGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure IOTHGridCellClick(Column: TColumn);
    procedure IOTHGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure IOTHGridEditButtonClick(Sender: TObject);
    procedure QueryIOTHBeforeInsert(DataSet: TDataSet);
    procedure RButtonClick(Sender: TObject);
    procedure DSIOTHFieldChanged(Sender: TObject; Field: TField);
    procedure FPMClick(Sender: TObject);
    procedure IOTHFooterCalculate(Sender: TJvDBGridFooter;
      const FieldName: string; var CalcValue: Variant);
    procedure SCNT1Click(Sender: TObject);
    procedure DSRealPMFieldChanged(Sender: TObject; Field: TField);
    procedure DSInOutFieldChanged(Sender: TObject; Field: TField);
    procedure IOTHGridDrawColumnTitle(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; AColumn: TColumn; var ASortMarker: TJvDBGridBitmap;
      IsDown: Boolean; var Offset: Integer; var DefaultDrawText,
      DefaultDrawSortMarker: Boolean);
    procedure RealPMGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RealPMGridDrawColumnTitle(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; AColumn: TColumn; var ASortMarker: TJvDBGridBitmap;
      IsDown: Boolean; var Offset: Integer; var DefaultDrawText,
      DefaultDrawSortMarker: Boolean);
    procedure RButtonKeyPress(Sender: TObject; var Key: Char);
    procedure DSInOutItemsFieldChanged(Sender: TObject; Field: TField);
    procedure GridFooterInOutItemsCalculate(Sender: TJvDBGridFooter;
      const FieldName: string; var CalcValue: Variant);
    procedure TransInOutItemsAfterCommit(Sender: TObject);
    procedure CloseSessActionExecute(Sender: TObject);
    procedure ClearCloseActionExecute(Sender: TObject);
    procedure VerifiedActionExecute(Sender: TObject);
    procedure IOTHGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RealPMGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridInOutGSMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridInOutItemsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RealPMFooterDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure RealPMFooterDisplayText(Sender: TJvDBGridFooter;
      Column: TFooterColumn; const Value: Variant; var Text: string);
  private
    { Private declarations }
    dirtyGSM: Boolean;
    dirtyIOTH: Boolean;
    dirtyPM: Boolean;
    dirtyItem: Boolean;
    warelist: TStringList;
    sessionnum: Integer;
    procedure LoadWareList;
    function PrevClosed(sid: Integer): boolean;
    function GenPMSql(var sumsql: string): String;
    procedure warechanged(var Msg: TMessage); message WM_WARECHANGED;
    procedure counterschanged(var Msg: TMessage); message WM_COUNTERS_CHANGED;
    procedure sessionadded(var Msg: TMessage); message WM_SESSION_ADDED;
    procedure sessiondeleted(var Msg: TMessage); message WM_SESSION_DELETED;
    procedure stationchanged(var Msg: TMessage); message WM_STATION_CHANGED;
    procedure SetControlsOnSessionState(st: Integer);
    function IsNextSessionOpened: boolean;
    function SetSessionState(st: Integer): boolean;
    procedure UpdateState(q: TFDQuery; _state: Integer);


  public
    { Public declarations }
    session_id: Integer;
    sst: String;
    startdate: String;
    session_state: Integer;
    constructor Create(pr: TComponent; fname: String;
      _sid, _snum: Integer; _sdt: String; _state: Integer);
      reintroduce; overload;

    procedure ShowAllData();

    procedure ShowGSMData();
    procedure ShowItemsData();
    procedure ShowIOTHData();
    procedure ShowPMData();
    procedure UpdateAllStates(_state: Integer);
    function GetStartSession: String;
  end;

var
  TabForm: TTabForm;

implementation

{$R *.dfm}

uses DmUnit, MainUnit, YNUnit, CntReplaceUnit, StrUtils;

constructor TTabForm.Create(pr: TComponent; fname: String;
  _sid, _snum: Integer; _sdt: String; _state: Integer);
begin
  inherited Create(pr, fname);
  session_id := _sid;
  sessionnum := _snum;
  startdate := _sdt;
  session_state := _state;

end;

// .............................................................................

procedure TTabForm.DSInOutFieldChanged(Sender: TObject; Field: TField);
var
  f, fname: String;
begin
  inherited;
  fname := Field.FieldName;
  f := Field.AsString;
  AddToLog(fname + ' DSCh ' + f);
  dirtyGSM := true;

end;

// .............................................................................

procedure TTabForm.DSInOutItemsFieldChanged(Sender: TObject; Field: TField);
var
  f, fname: String;
begin
  inherited;
  fname := Field.FieldName;
  f := Field.AsString;
  AddToLog(fname + ' DSCh ' + f);
  dirtyItem := true;

end;

// .............................................................................

procedure TTabForm.DSIOTHFieldChanged(Sender: TObject; Field: TField);
var
  f, fname: String;
  v, m, d: Extended;
begin
  inherited;
  fname := Field.FieldName;
  f := Field.AsString;
  if fname = 'DENSITY' then 
  begin
    v := QueryIOTH.FieldByName('CALC').AsExtended;
    d := Field.AsExtended;

    m :=  d * v / 1000.0;

    QueryIOTH.FieldByName('MASS').AsExtended := m;
  
  end;
  
  AddToLog(fname + ' DSCh ' + f);
  dirtyIOTH := true;
end;

// .............................................................................

procedure TTabForm.DSRealPMFieldChanged(Sender: TObject; Field: TField);
  var
    f, fname: String;
begin
  inherited;
  fname := Field.FieldName;
  f := Field.AsString;
  AddToLog(fname + ' DSCh ' + f);
  dirtyPM := true;

end;

// .............................................................................

// raises Exc

procedure TTabForm.UpdateState(q: TFDQuery; _state: Integer);
var
  tablename: String;
  msg: TMessage;
begin
  // HZ!!!
  // q.UpdateTransaction.Commit;
  tablename := '';

  if q <> nil then
  begin
    tablename := q.UpdateOptions.UpdateTableName;
//      AddToLog(q.Name + ' need update');

  end
  else AddToLog('nil ' + ' need update');

  with GenUpdQuery do
  begin
    Transaction.StartTransaction;
    UpdateTransaction.StartTransaction;
    try
      if _state <> session_state then
      begin
        sql.Text := 'update sessions set state=:state where id = :session_id and state < ' + SS_CLOSED;
        with Params do
        begin
          Clear;
          with Add do
          begin
            Name := 'state';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'session_id';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
        end;
        ParamByName('state').AsInteger := _state;
        ParamByName('session_id').AsInteger := session_id;
        prepare;
        ExecSQL;
        DM.AddLogMsg(user_id,
          format('Changed session state to %d session_id %d',
          [_state, session_id]));
        AddToLog(format('sate changed to %d', [_state]));
      end;

      if Trim(tablename) <> '' then
      begin
        sql.Text :=
          'update !table set state = :state, lastuser_id=:user_id ' +
          ' where session_id = :session_id and state < ' + SS_CLOSED;
        with Macros do
        begin
          Clear;
          with Add do
          begin
            Name := 'table';
            DataType := mdRaw;
          end;
        end;
        with Params do
        begin
          Clear;
          with Add do
          begin
            Name := 'state';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'session_id';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'user_id';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
        end;
        MacroByName('table').AsRaw := tablename;
        ParamByName('state').AsInteger := _state;
        ParamByName('session_id').AsInteger := session_id;
        ParamByName('user_id').AsInteger := user_id;

        prepare;
        ExecSQL;
        AddToLog('updating ' + tablename);  
      end;

      UpdateTransaction.Commit;
      Transaction.Commit;

      DM.AddLogMsg(user_id, format('Updated %s session_id %d',
        [tablename, session_id]));
      AddToLog(format('Updated %s state to %d', [tablename, _state]));
    except
      on e: Exception do
      begin
        UpdateTransaction.Rollback;
        Transaction.Rollback;
        AddToLog(e.Message);
        raise;
      end;

    end;

  end;

end;

// .............................................................................

procedure TTabForm.UpdateAllStates(_state: Integer);
  var
    msg: TMessage;
begin
  if _state <> session_state then
  begin
    try
      UpdateState(nil, _state);
      UpdateState(QueryInOut, _state);
      UpdateState(QueryIOTH, _state);
      UpdateState(QueryInOutItems, _state);

      session_state := _state;

      SetControlsOnSessionState(_state);
      msg.Msg := WM_SESSION_UPDATED;
      MainForm.SendMsgs(msg);
    except
      on e: Exception do
      begin
        ErrorMessageBox(self, 'UpdateAllStates: ' + e.Message);
      end;
    end;

  end;
end;

// .............................................................................

procedure TTabForm.VerifiedActionExecute(Sender: TObject);
  var
    new_state: Integer;
    yn : TYNForm;
    
begin
  inherited;
  yn := TYNForm.Create(self);
  yn.Memo1.Text := 'Смена проверена?';

  if yn.ShowModal = mrOK then
  begin
  
    new_state := S_VERIFIED;
    UpdateAllStates(new_state);
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
      warelist.Add(FieldByName('code').AsString + '=' + FieldByName('name')
        .AsString);
      Next;
    end;
    Close;
    Transaction.Commit;
  end;

end;

// .............................................................................

procedure TTabForm.FPMClick(Sender: TObject);
var
  cap, old_warecode, old, wareccode_new: String;
  sqlt, tanknum: String;
  session_id, ind: Integer;
  tm: TMenuItem;
  msg: TMessage;

begin
  inherited;
  if session_state > S_VERIFIED then
  begin
    ErrorMessageBox(self, 'Смена закрыта');
    Exit;
  end;

  tm := (Sender as TMenuItem);
  old_warecode := QueryIOTH.FieldByName('warecode').AsString;
  tanknum := QueryIOTH.FieldByName('tanknum').AsString;
  session_id := QueryIOTH.FieldByName('session_id').AsInteger;
  old := QueryIOTH.FieldByName('fuelname').AsString;
  cap := tm.Caption;
  ind := FuelPopupMenu.Items.IndexOf(tm);
  wareccode_new := warelist.Names[ind];

  AddToLog(Format('cap %s old wc %s old %s new %s', [cap, old_warecode, old,
    wareccode_new]));

  //
  // now update iotankshoses with new warecode
  // upd key: session_id, tanknum, warecode, azs

  sqlt := 'update iotankshoses set warecode = :warecode_new, state = ' + SS_CHANGED +
    ' where session_id >= :session_id and azscode= :azs ' +
    'and tanknum = :tanknum and warecode = :old_warecode and state < ' + SS_CLOSED;

  YNForm := TYNForm.Create(self);
  // YNForm.Height := 400;
  YNForm.Memo1.Font.Size := 18;
  with YNForm.Memo1.Lines do
  begin
    Add('Do you really want to change');
    Add(Format('%s to %s', [old, cap]));
    Add(Format('codes %s to %s', [old_warecode, wareccode_new]));
    Add(Format('At session id %d', [session_id]));
    Add('???');
  end;
  if YNForm.ShowModal = mrOk then
  begin
    if dirtyGSM then
    begin
      if QueryInOut.Transaction.Active then
        QueryInOut.Transaction.Commit;
      dirtyGSM := false;
    end;
    if dirtyPM then
    begin
      if QueryRealPM.Transaction.Active then
        QueryRealPM.Transaction.Commit;
      dirtyPM := false;
    end;
    if dirtyIOTH then
    begin
      if QueryIOTH.Transaction.Active then
        QueryIOTH.Transaction.Commit;
      dirtyIOTH := false;
    end;

    try

      GenUpdQuery.Transaction.StartTransaction;
      GenUpdQuery.UpdateTransaction.StartTransaction;

      with GenUpdQuery do
      begin
        Sql.Text := sqlt;
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
            Name := 'warecode_new';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'old_warecode';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'tanknum';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'azs';
            DataType := ftString;
            ParamType := ptInput;
          end;
        end;
        ParamByName('session_id').AsInteger := session_id;
        ParamByName('warecode_new').AsString := wareccode_new;
        ParamByName('old_warecode').AsString := old_warecode;
        ParamByName('tanknum').AsString := tanknum;
        ParamByName('azs').AsString := current_azscode;
        Prepare;
        ExecSQL;

      end;

      sqlt := 'update inoutgsm set ware_code = :warecode_new ' +
        ' where session_id >= :session_id and azscode=:azs ' +
        'and tanknum = :tanknum and ware_code = :old_warecode and state = ' + SS_CHANGED;

      with GenUpdQuery do
      begin
        Sql.Text := sqlt;
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
            Name := 'warecode_new';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'old_warecode';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'tanknum';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'azs';
            DataType := ftString;
            ParamType := ptInput;
          end;
        end;
        ParamByName('session_id').AsInteger := session_id;
        ParamByName('warecode_new').AsString := wareccode_new;
        ParamByName('old_warecode').AsString := old_warecode;
        ParamByName('tanknum').AsString := tanknum;
        ParamByName('azs').AsString := current_azscode;
        Prepare;
        ExecSQL;

      end;

      GenUpdQuery.UpdateTransaction.Commit;
      GenUpdQuery.Transaction.Commit;

      msg.Msg := WM_WARECHANGED;
      MainForm.SendMsgs(msg);

      UpdateAllStates(S_CHANGED); // or All?
    except
      on e: Exception do
      begin
        GenUpdQuery.UpdateTransaction.Rollback;
        GenUpdQuery.Transaction.Rollback;
        AddToLog(e.Message);
      end;
    end;

    ShowAllData;

  end;

end;

// .............................................................................

function TTabForm.GenPMSql(var sumsql: String): String;
var
  th, tf, tm, tmp: String;
  sumth, sumtf, sumtm: String;
  len, i: Integer;
  st: String;
begin
  result := '';

  sumth := 'select sum(volume) as volume, ';

  th := 'select' + '    i.session_id,' +
    '    cast(s.startdatetime as date) as stdt,' + '    i.payment_code,' +
    '    p.name as pmode,' +

    '    sum(i.volume) as volume,' +
    '    sum(i.amount) as amount,'
    ;

  len := warelist.Count;
  for i := 0 to len - 1 do
  begin
    st := IntToStr(i);
    tm := 'coalesce((select sum(i1.volume) from inoutgsm i1 join wares w1 on w1.code=i1.ware_code '
      + '    where w1.code= '#$27 + warelist.Names[i] + #$27 +
      '        and i1.direction=0 ' +
      '        and i1.payment_code = i.payment_code and i1.session_id=:session_id), '
      + '0)  as volume_' + st + ',';

    tm := tm + '(select first 1 price from inoutgsm i1 join wares w1 on w1.code=i1.ware_code '
      + '    where i1.session_id=:session_id and i1.ware_code='#$27 + warelist.Names[i] + #$27') '
      + ' as price_' + st + ',';
      
    tmp := 'coalesce((select sum(i1.amount) from inoutgsm i1 join wares w1 on w1.code=i1.ware_code '
      + '    where w1.code= '#$27 + warelist.Names[i] + #$27 +
      '        and i1.direction=0 ' +
      '        and i1.payment_code = i.payment_code and i1.session_id=:session_id), '
      + '0)  as amount_' + st + ',';
      
    th := th + tm + tmp;

    sumtm := sumtm + ' sum(volume_' + st + ') as volume_' + st + ',';

  end;
  sumtf := ' ' + st + ' as nol' + '    from (';
  tf := ' 0 as nol' + '    from inoutgsm i' +
    '    join sessions s on s.id=i.session_id' +
    '    join paymentmodes p on i.payment_code = p.code' +

    '    where /*s.startdatetime >= cast(:start_session_t as TIMESTAMP)*/' +
    '   s.id = :session_id ' + '   and i.azscode=:azscode' +
    '   and  i.direction = 0' +
    ' group by session_id,stdt,payment_code, pmode'
    + ' order by stdt';

  sumsql := sumth + sumtm + sumtf + th + tf  + ')';
//  AddToLog(sumsql);

  result := th + tf;
//  ErrorMessageBox(self, result);

end;

// .............................................................................

function TTabForm.GetStartSession: String;
begin
  result := '2000-01-01 00:00:00';
  // last_sessions_count
  try
    with QuerySST do
    begin
      Transaction.StartTransaction;
      with Params do
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
      if not Eof then
      begin
        // First;
        result := FieldByName('startdatetime').AsString;
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

procedure TTabForm.SCNT1Click(Sender: TObject);
{
  type Rec = // In consts.inc
}
  var
    sqlt: String;
    crd: TCntReplaceDlg;
    i, mr, nrec, nrec_for_repl, PrevRecId, cur_rec_id: Integer;
    records: TRecArray;
    currec: Rec;

begin
  inherited;
  if session_state > S_VERIFIED then
  begin
    ErrorMessageBox(self, 'Смена закрыта');
    Exit;
  end;

  AddToLog('SCNT');
  // get ecnt value from previous session/ How?

//  session_id
//  current_azscode
// tanknum & hosenum (int) := q.fieldbyname

    sqlt := 'select i.id, i.session_id, startcounter, endcounter,' +
      ' (select volume from calcoutcomes(s.id, i.tanknum,i.hosenum)) as calc' +
      ' from iotankshoses i join sessions s on i.session_id = s.id' +

      ' where s.azscode = :azscode and tanknum = :tanknum and hosenum = :hosenum' +
      ' order by i.session_id asc';

{
    open query
    rec_prev := none
    rec_id [[for replace]] := id

    for each rec_current in recordes:
      if rec_prev:

        if rec_current id >= rec_id

            // Replace data:  rec_prev data -> rec_current data
            // (fill replacement list)

        rec_prev := rec_current

    close query

    open uod query
    foreach r in replacement_list:

      // do replace

    commit

}
  crd := TCntReplaceDlg.Create(self);

  with crd.FDQuery do
  begin
    Sql.Text := sqlt;
    with Params do
    begin
      with Add do
      begin
        Name := 'aszcode';
        ParamType := ptInput;
        DataType := ftString;
      end;
      with Add do
      begin
        Name := 'tanknum';
        ParamType := ptInput;
        DataType := ftString;
      end;
      with Add do
      begin
        Name := 'hosenum';
        ParamType := ptInput;
        DataType := ftInteger;
      end;
    end;
    ParamByName('azscode').AsString := current_azscode;
    ParamByName('tanknum').AsString := QueryIOTH.FieldByName('tanknum')
      .AsString;
    ParamByName('hosenum').AsInteger := QueryIOTH.FieldByName('hosenum')
      .AsInteger;

    crd.Text02.Caption := '';

    Transaction.StartTransaction;
    try

      Prepare;
      Open;

      nrec := RecordCount;

      crd.Text01.Caption := Format('Всего %d записей', [nrec]);

      PrevRecId := -1;

      currec.session_id := QueryIOTH.FieldByName('session_id').AsInteger;
      currec.prev_session_id := 0;

      currec.scnt := QueryIOTH.FieldByName('stcnt').AsExtended;
      currec.ecnt := QueryIOTH.FieldByName('ecnt').AsExtended;

      currec.prev_scnt := 0;
      currec.prev_ecnt := 0;

      cur_rec_id := QueryIOTH.FieldByName('id').AsInteger;

      nrec_for_repl := 0;

      if nrec > 0 then
      begin
        SetLength(records, nrec);

        First;
        i := FieldByName('id').AsInteger;
        if i = cur_rec_id then
        begin
          crd.Text02.Caption := 'Нет предыдущей смены';
        end
        else
        begin
          while not Eof do
          begin

            if PrevRecId > -1 then
            begin
              i := FieldByName('id').AsInteger;
              if i >= cur_rec_id then
              begin

                records[nrec_for_repl].prev_id := PrevRecId;

                records[nrec_for_repl].id := i;

                records[nrec_for_repl].session_id := FieldByName('session_id')
                  .AsInteger;
                records[nrec_for_repl].scnt := FieldByName('startcounter')
                  .AsExtended;
                records[nrec_for_repl].ecnt := FieldByName('endcounter')
                  .AsExtended;

                records[nrec_for_repl].prev_session_id := currec.session_id;
                records[nrec_for_repl].prev_scnt := currec.scnt;
                records[nrec_for_repl].prev_ecnt := currec.ecnt;

                records[nrec_for_repl].outcome := FieldByName('calc')
                  .AsExtended;

                nrec_for_repl := nrec_for_repl + 1;

              end;
            end
            else
            begin
              //
            end;

            PrevRecId := FieldByName('id').AsInteger;
            currec.session_id := FieldByName('session_id').AsInteger;
            currec.scnt := FieldByName('startcounter').AsExtended;
            currec.ecnt := FieldByName('endcounter').AsExtended;

            Next;
          end;
          crd.Text02.Caption := Format('Для замены %d записей',
            [nrec_for_repl]);

          // .....................................................................

          crd.RecMemo.Lines.Clear;
          for i := 0 to nrec_for_repl - 1 do
          begin
            crd.RecMemo.Lines.Add
              (Format('previd %d id %d prevsid %d sid %d !!! ps %g pe %g s %g e %g (c %g)',
              [records[i].prev_id, records[i].id, records[i].prev_session_id,
              records[i].session_id, records[i].prev_scnt, records[i].prev_ecnt,
              records[i].scnt, records[i].ecnt, records[i].outcome]));

          end;

        end;

      end;
      Transaction.Commit
    except
      on e: Exception do
      begin
        Transaction.Rollback;
        AddToLog(e.Message);
        exit;
      end;

    end;

  end;

  crd.records := @records;
  crd.reccount := nrec_for_repl;
  crd.QIOTH := QueryIOTH;

  mr := crd.ShowModal;
  if mr = mrOk then
  begin
    UpdateAllStates(S_CHANGED);
    AddToLog('ReplCnt mrOK');
    ShowIOTHData;
  end;

end;

// .............................................................................

procedure TTabForm.SetPrevSessionData1Click(Sender: TObject);
begin
  inherited;
  if session_state > S_VERIFIED then Exit;

  AddToLog(QueryIOTH.FieldByName('StartFuelVolume').AsString);
  // WTD?
end;

// .............................................................................

procedure TTabForm.ShowAllData();
begin
//  sst := GetStartSession();
  LoadWareList;
  ShowGSMData;
  ShowItemsData;
  ShowIOTHData;
  ShowPMData;

  GridInOutGSM.Refresh;
  GridInOutItems.Refresh;
  IOTHGrid.Refresh;
  RealPMGrid.Refresh;

end;

// .............................................................................

procedure TTabForm.ShowGSMData();
begin

  with QueryInOut do
  begin
    if Active then
      Close;
    if QueryInOutSum.Active then
      QueryInOutSum.Close;
    if Transaction.Active then
      Transaction.Commit;

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
    QueryInOutSum.Params.Assign(Params);
    QueryInOutSum.ParamByName('session_id').AsInteger := session_id;
    QueryInOutSum.ParamByName('azscode').AsString := current_azscode;

    Transaction.StartTransaction;
    try
      Prepare;
      Open;
      QueryInOutSum.Prepare;
      QueryInOutSum.Open;
      GridFooterInOut.ReCalc;
      // Transaction.Commit;
    except
      on e: Exception do
      begin
        AddToLog(e.Message);
        // Transaction.Rollback;
        // raise
      end;
    end;
  end;

end;

// .............................................................................

procedure TTabForm.ShowItemsData();
begin

  with QueryInOutItems do
  begin
    if Active then
      Close;
    if QueryInOutItemsSum.Active then
      QueryInOutItemsSum.Close;
    if Transaction.Active then
      Transaction.Commit;

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
    QueryInOutItemsSum.Params.Assign(Params);
    QueryInOutItemsSum.ParamByName('session_id').AsInteger := session_id;
    QueryInOutItemsSum.ParamByName('azscode').AsString := current_azscode;

    Transaction.StartTransaction;
    try
      Prepare;
      Open;
      QueryInOutItemsSum.Prepare;
      QueryInOutItemsSum.Open;
      GridFooterInOutItems.ReCalc;
      // Transaction.Commit;
    except
      on e: Exception do
      begin
        AddToLog(e.Message);
        // Transaction.Rollback;
        // raise
      end;
    end;
  end;

end;

// .............................................................................

procedure TTabForm.ShowPMData();
var
  i, len: Integer;
  k, v, sumsql, sqlt: string;
begin

  LoadWareList();
  with RealPMFooter.Columns do
  begin
    Clear;
      with Add do
      begin
        FieldName := 'VOLUME';
        Alignment := taRightJustify;
        Style := psOwnerDraw;
      end;
  end;

  with RealPMGrid do
  begin
    with Columns do
    begin
      Clear;
      with Add do
      begin
        FieldName := 'stdt';
        Title.Font.Style :=  [fsBold];
        Title.Caption := 'Дата';
      end;
      with Add do
      begin
        FieldName := 'payment_code';
        Title.Font.Style :=  [fsBold];
        Title.Caption := 'Код оплаты';
      end;
      with Add do
      begin
        FieldName := 'pmode';
        Title.Font.Style :=  [fsBold];
        Title.Caption := 'Вид оплаты';
      end;
      with Add do
      begin
        FieldName := 'VOLUME';
        Title.Font.Style :=  [fsBold];
        Title.Caption := 'Объём';
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
      with RealPMFooter.Columns do
      begin
        with add do
        begin
          FieldName := 'volume_' + IntToStr(i);
          Alignment := taRightJustify;
          Style := psOwnerDraw;
        end;
      end;
    end;

  end;

  sqlt := GenPMSql(sumsql);
  QueryRealPmSum.SQL.Text := sumsql;

  with QueryRealPM do
  begin
    if Active then
      Close;
    if QueryRealPMSum.Active then
      QueryRealPMSum.Close;

    Sql.Text := sqlt;

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

    QueryRealPmSum.Params.Assign(Params);

    ParamByName('session_id').AsInteger := session_id;
    ParamByName('azscode').AsString := current_azscode;

    QueryRealPmSum.ParamByName('session_id').AsInteger := session_id;
    QueryRealPmSum.ParamByName('azscode').AsString := current_azscode;


    Transaction.StartTransaction;
    try
      Prepare;
      Open;
      QueryRealPmSum.Prepare;
      QueryRealPmSum.Open;
      // Transaction.Commit;
      RealPMFooter.ReCalc;
    except
      on e: Exception do
      begin
        AddToLog(e.Message);
        // Transaction.Rollback;
        // raise
      end;
    end;
  end;

end;

// .............................................................................`

procedure TTabForm.TransInOutItemsAfterCommit(Sender: TObject);
begin
  inherited;

end;

// .............................................................................

procedure TTabForm.ShowIOTHData();
var
  i: Integer;
  tm: TMenuItem;
const
  qpa: Array [0..1] of Qparam = (
    (Name: 'session_id'; DataType: ftInteger; ParamType: ptInput),
    (Name: 'azscode'; DataType: ftString; ParamType: ptInput)
  );

begin

  FuelPopupMenu.Items.Clear;
  for i := 0 to warelist.Count - 1 do
  begin
    tm := TMenuItem.Create(FuelPopupMenu);
    tm.Caption := warelist.ValueFromIndex[i] + ' (' + warelist.Names[i] + ')';

    tm.Name := 'fpm_' + IntToStr(i);
    tm.OnClick := FPMClick;
    FuelPopupMenu.Items.Add(tm);
  end;

  with QueryIOTH do
  begin
    if Active then
      Close;
    with Params do
    begin
      Clear;
      for i := 0 to Length(qpa) - 1 do
      begin
        with add do
        begin
          Name := qpa[i].Name;
          DataType := qpa[i].DataType;
          ParamType := qpa[i].ParamType;
        end;
      end;

    end;
    QueryIOTHSum.params.Assign(Params);
    ParamByName('session_id').AsInteger := session_id;
    ParamByName('azscode').AsString := current_azscode;
    QueryIOTHSum.ParamByName('session_id').AsInteger := session_id;
    QueryIOTHSum.ParamByName('azscode').AsString := current_azscode;

    Transaction.StartTransaction;
    try
      Prepare;
      Open;
      QueryIOTHSum.Prepare;
      QueryIOTHSum.Open;
      // Transaction.Commit;
    except
      on e: Exception do
      begin
        AddToLog(e.Message);
        // Transaction.Rollback;
        // raise
      end;
    end;
  end;

end;

// .............................................................................

function TTabForm.PrevClosed(sid: Integer) : boolean;
  var
    i, id, prevstate: Integer;
begin
  Result := false;
  with GenQuery do
  begin
    sql.Text := 'select id, state from sessions where azscode=:azscode order by id';
    with Params do
    begin
      Clear;
      with add do
      begin
        Name := 'sid';
        DataType := ftInteger;
        ParamType := ptInput;
      end;
      with add do
      begin
        Name := 'azscode';
        DataType := ftString;
        ParamType := ptInput;
      end;
    end;
    ParamByName('sid').AsInteger := sid;
    ParamByName('azscode').AsString := current_azscode;
    i := 0;
    prevstate := 0;
    Prepare;
    Open;
    while not Eof do
    begin

      id := FieldByName('id').AsInteger;

      if i = 0 then
      begin
        if sid = id then
        begin
          result := true;
          Exit;
        end;
      end
      else
      begin
        if sid = id then
        begin
          if prevstate > S_VERIFIED then
          begin
            result := true;
            exit;
          end;
        end;
      end;
      prevstate := FieldByName('state').AsInteger;

      Next;
      i := i + 1;
    end;
  end;
end;

// .............................................................................

function TTabForm.IsNextSessionOpened: boolean;
begin
  result := false;
  with GenQuery do
  begin
    sql.Text := 'select first 1 id, state from sessions where ' +
    'azscode = :azscode and id > :id order by id';
    with params do
    begin
      Clear;
      with Add do
      begin
        Name := 'azscode';
        DataType := ftString;
        ParamType := ptInput;
      end;
      with Add do
      begin
        Name := 'id';
        DataType := ftInteger;
        ParamType := ptInput;
      end;
    end;
    ParamByName('azscode').AsString := current_azscode;
    ParamByName('id').AsInteger := session_id;
    Prepare;
    Open;
    if RecordCount < 1 then Result := true
    else
    begin
      if FieldByName('state').AsInteger < S_CLOSED then Result := true;

    end;
    Close;
  end;
end;

// .............................................................................

function TTabForm.SetSessionState(st: Integer): boolean;  // forced set
begin
  result := false;
  with GenUpdQuery do
  begin
    Transaction.StartTransaction;
    UpdateTransaction.StartTransaction;
    sql.Text := 'update sessions set state=:st where id=:id';
    try
      with Params do
      begin
        Clear;
        with Add do
        begin
          Name := 'id';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'st';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
      end;
      ParamByName('id').AsInteger := session_id;
      ParamByName('st').AsInteger := st;
      Prepare;
      ExecSql;

      sql.Text := 'update iotankshoses set state=:st where session_id=:id';
      with Params do
      begin
        Clear;
        with Add do
        begin
          Name := 'id';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'st';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
      end;
      ParamByName('id').AsInteger := session_id;
      ParamByName('st').AsInteger := st;
      Prepare;
      ExecSql;

      sql.Text := 'update inoutgsm set state=:st where session_id=:id';
      with Params do
      begin
        Clear;
        with Add do
        begin
          Name := 'id';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'st';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
      end;
      ParamByName('id').AsInteger := session_id;
      ParamByName('st').AsInteger := st;
      Prepare;
      ExecSql;

      sql.Text := 'update inoutitems set state=:st where session_id=:id';
      with Params do
      begin
        Clear;
        with Add do
        begin
          Name := 'id';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'st';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
      end;
      ParamByName('id').AsInteger := session_id;
      ParamByName('st').AsInteger := st;
      Prepare;
      ExecSql;

      UpdateTransaction.Commit;
      Transaction.Commit;
      Result := true;

    except
      on e: Exception do
      begin
        UpdateTransaction.Rollback;
        Transaction.Rollback;
        ErrorMessageBox(self, e.Message);
      end;

    end;
  end;
end;

// .............................................................................

procedure TTabForm.ClearCloseActionExecute(Sender: TObject);
  var
    yn : TYNForm;
    msg: TMessage;
begin
  inherited;
  if IsNextSessionOpened then
  begin
    yn := TYNForm.Create(self);
    yn.Memo1.Text := 'Открыть смену?';
    if yn.ShowModal <> mrOK then Exit;

    if SetSessionState(S_CHANGED) then
    begin
      UpdateAllStates(S_CHANGED);
      msg.Msg := WM_SESSION_ADDED;
      MainForm.SendMsgs(msg);
    end;
  end
  else
  begin
    ErrorMessageBox(self, 'Не открыта следующая смена');
    Exit;

  end;
end;

// .............................................................................

procedure TTabForm.CloseSessActionExecute(Sender: TObject);
  var
    yn : TYNForm;
    msg: TMessage;
begin
  inherited;

  if not PrevClosed(session_id) then
  begin
    ErrorMessageBox(self, 'Не закрыта предыдущая смена');
    Exit;
  end;

  yn := TYNForm.Create(self);
  yn.Memo1.Text := 'Закрыть смену?';
  if yn.ShowModal <> mrOK then Exit;

  UpdateAllStates(S_CLOSED);

  msg.Msg := WM_SESSION_CLOSED;
  MainForm.SendMsgs(msg);

end;

// .............................................................................

procedure TTabForm.CommitActionExecute(Sender: TObject);
begin
  inherited;
  try

    with QueryIOTH do
    begin
      if Transaction.Active then
      begin
        if dirtyIOTH then
        begin
          ApplyUpdates(0);
          Close;
          Transaction.Commit;
          UpdateAllStates(S_CHANGED);
          dirtyIOTH := false;
          ShowIOTHData;
        end;
      end;
    end;

    with QueryRealPM do
    begin
      if Transaction.Active then
      begin
        if dirtyPM then
        begin
          Close;
          Transaction.Commit;
          UpdateAllStates(S_CHANGED);
          dirtyPM := false;
          ShowPMData;
        end;
      end;
    end;

    with QueryInOut do
    begin
      if Transaction.Active then
      begin
        if dirtyGSM then
        begin
          Close;
          Transaction.Commit;
          UpdateAllStates(S_CHANGED);
          ShowGSMData;
          ShowPMData;
          dirtyGSM := false;
        end;
      end;
    end;

    with QueryInOutItems do
    begin
      if Transaction.Active then
      begin
        if dirtyItem then
        begin
//          ApplyUpdates;
          Close;
          // commits if cachedupdates=false && without call ApplyUpdates
          Transaction.Commit;              // ????? does not commit??
          UpdateAllStates(S_CHANGED);
          ShowItemsData;
          dirtyItem := false;
        end;
      end;
    end;

  except
    on e: Exception do
    begin
      AddToLog(e.Message);
    end;
  end;

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
        ShowGSMData;
        dirtyGSM := false;

      end;

    end;
    with QueryInOutItems do
    begin
      if Transaction.Active then
      begin
        Transaction.Rollback;
        ShowItemsData;
        dirtyItem := false;

      end;

    end;
    with QueryIOTH do
    begin
      if Transaction.Active then
      begin
        Transaction.Rollback;
        ShowIOTHData;
        dirtyIOTH := false;
      end;

    end;
    with QueryRealPM do
    begin
      if Transaction.Active then
      begin
        ShowPMData;
        dirtyPM := false;
      end;

    end;

  except
    on e: Exception do
    begin
      AddToLog(e.Message);
    end;
  end;
  // ShowAllData;
end;

// .............................................................................

procedure TTabForm.GridFooterInOutCalculate(Sender: TJvDBGridFooter;
  const FieldName: string; var CalcValue: Variant);
var
  f: String;
begin
  inherited;
  f := FieldName;
  with QueryInOutSum do
  begin
    if Active and (not eof) then
    begin
      CalcValue := FieldByName(f).AsExtended;
    end;
  end;
end;

// .............................................................................

procedure TTabForm.GridFooterInOutItemsCalculate(Sender: TJvDBGridFooter;
  const FieldName: string; var CalcValue: Variant);
var
  f: String;
begin
  inherited;
  f := FieldName;
  with QueryInOutItemsSum do
  begin
    if Active and (not eof) then
    begin
      CalcValue := FieldByName(f).AsExtended;
    end;
  end;

end;

// .............................................................................

procedure TTabForm.GridInOutGSMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F2 then
  begin
    CommitActionExecute(Sender);
    key := 0;
  end;
  if key = VK_F10 then
  begin
    RollbackActionExecute(Sender);
    key := 0;
  end;

end;

// .............................................................................

procedure TTabForm.GridInOutItemsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F2 then
  begin
    CommitActionExecute(Sender);
    key := 0;
  end;
  if key = VK_F10 then
  begin
    RollbackActionExecute(Sender);
    key := 0;
  end;

end;

// .............................................................................

procedure TTabForm.RealPMFooterCalculate(Sender: TJvDBGridFooter;
  const FieldName: string; var CalcValue: Variant);

var
  f: String;
begin
  inherited;
  f := FieldName;
  with QueryRealPmSum do
  begin
    if Active and (not eof) then
    begin
      CalcValue := FieldByName(f).AsExtended;
    end;
  end;

end;

// .............................................................................

procedure TTabForm.RealPMFooterDisplayText(Sender: TJvDBGridFooter;
  Column: TFooterColumn; const Value: Variant; var Text: string);

var
  gr: TJvDBGrid;
  c,w, hw : Integer;
  Found: Boolean;
  cls : TDBGridColumns;
  cnv : TCanvas;
  crect: TRect;
begin
//  inherited;

// Not in use

  cnv := Sender.Canvas;

  Gr := Sender.DBGrid;
  Found := False;
  
  cls := gr.Columns;
  hw := 0;
  for C := 0 to cls.Count - 1 do
  begin
    w := cls[c].width;
    if AnsiSameText(Column.FieldName, cls[C].FieldName) then
    begin
       Found := True;
       if trim(Text) <> '' then
       begin
          cnv.Font.Color := 0;
          cnv.Brush.Color := clWhite;
          Text := 'text';
          cnv.TextOut(hw, 17, Text);
          
          crect.Left := 0;
          crect.Top := 0;
          crect.Width := 100;
          crect.Height := 34;
          
          cnv.TextOut(0, 0, Text);

          text := '';
          
        end;
     end;
     hw := hw + w;

  end;     

end;

// ............................................................................

procedure TTabForm.RealPMFooterDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
  Var
    gr: TJvDBGrid;
    f : TJvDBGridFooter;
    cls : TFooterColumns;
    gcls : TDBGridColumns;
    pind: Integer;
    fldn, txt, st : String;
    price, vol: Extended;
    c: integer;
begin
  // inherited;

  f := StatusBar as  TJvDBGridFooter;

  gr := f.DBGrid;
  
  cls := f.Columns;
  gcls := gr.Columns;

  pind := Panel.Index;

  fldn := gcls.items[pind - 1].FieldName;

  st := '';
  for c := 0 to cls.Count -1 do
  begin
    if AnsiSameText(cls.Items[c].FieldName, fldn) then
    begin
      StatusBar.Canvas.Font.Color := clGreen;

      txt := QueryRealPmSum.FieldByName(fldn).AsString;
      StatusBar.Canvas.TextOut(Rect.left, Rect.Top + 0, txt);
      vol := StrToextDef(txt, 0);
      if Copy(fldn, 1, 7) = 'VOLUME_' then
      begin
        st := Copy(fldn, 8, 1);
      
      end;

      if st <> '' then
      begin
        price := QueryRealPm.FieldByName('price_' + st).AsExtended;      
        StatusBar.Canvas.Font.Color := clRed;
        StatusBar.Canvas.TextOut(Rect.left, Rect.Top + 17, Format('%12.2f', [price * vol]));
      end;
    
    end;
  
  end;
    
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
end;

// .............................................................................

procedure TTabForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  yn: TYNForm;
  mr: Integer;
begin
  inherited;

  CanClose := not(dirtyGSM or dirtyIOTH or dirtyPM or dirtyItem);

  if not CanClose then
  begin
    yn := TYNForm.Create(self);
    yn.ButtonForget.Visible := true;
    yn.Memo1.Text := 'Commit changes & close?';
    mr := yn.ShowModal;
    if mr = mrOk then
    begin

      if QueryInOut.Transaction.Active then
        QueryInOut.Transaction.Commit;
      if QueryInOutItems.Transaction.Active then
        QueryInOutItems.Transaction.Commit;
      if QueryIOTH.Transaction.Active then
        QueryIOTH.Transaction.Commit;
      if QueryRealPM.Transaction.Active then
        QueryRealPM.Transaction.Commit;

      if dirtyGSM or dirtyItem or dirtyIOTH or dirtyPM then
        UpdateAllStates(S_CHANGED);
      CanClose := true;

    end;
    if mr = mrAbort then
    begin
      if QueryInOut.Transaction.Active then
        QueryInOut.Transaction.Rollback;
      if QueryInOutItems.Transaction.Active then
        QueryInOutItems.Transaction.Rollback;
      if QueryIOTH.Transaction.Active then
        QueryIOTH.Transaction.Rollback;
      if QueryRealPM.Transaction.Active then
        QueryRealPM.Transaction.Rollback;
      CanClose := true;
    end;
  end;

  // end;

end;

// .............................................................................

procedure TTabForm.SetControlsOnSessionState(st: Integer);
var
  b: boolean;
begin

    b := st > S_VERIFIED;

    IOTHGrid.ReadOnly := b;
    GridInOutGSM.ReadOnly := b;
    GridInOutItems.ReadOnly := b;
//    RealPMGrid
    
//    JvStatusBar1.Visible := b;

    CloseSessAction.Enabled := st < S_CLOSED;
    
    RollbackAction.Enabled := st < S_CLOSED;
    
    CommitAction.Enabled := st < S_CLOSED;
    
    ClearCloseAction.Enabled := st = S_CLOSED;

    VerifiedAction.Enabled := st < S_VERIFIED;

    with JvStatusBar1 do
    begin
      case st of  S_NEW: Panels[0].Text := 'Свежая';
                  S_CHANGED: Panels[0].Text := 'Смена изменена';
                  S_VERIFIED: Panels[0].Text := 'Смена проверена';
                  S_CLOSED: Panels[0].Text := 'Смена закрыта!';
                  S_SENT: Panels[0].Text := 'Смена отправлена';
      else  Panels[0].Text := 'Unknown state';
    end;
    
    end;

end;

// .............................................................................

procedure TTabForm.FormCreate(Sender: TObject);
begin
  inherited;
  SetControlsOnSessionState(session_state);

  warelist := TStringList.Create;
  dirtyGSM := false;
  dirtyItem := false;
  dirtyIOTH := false;
  dirtyPM := false;
  Caption := Format('TabForm AZS ' +
    ' %s session %d start %s' , [current_azscode, sessionnum, startdate]);

  ShowAllData;
  Pages.ActivePage := TabSheet1;
end;

// .............................................................................

procedure TTabForm.IOTHFooterCalculate(Sender: TJvDBGridFooter;
  const FieldName: string; var CalcValue: Variant);
  var f: String;
begin
  inherited;
  f := FieldName;
  with QueryIOTHSum do
  begin
    if Active and (not eof) then
    begin
      CalcValue := FieldByName(f).AsExtended;
    end;
  end;
end;

// .............................................................................

procedure TTabForm.IOTHGridCellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'R' then
  begin
    // ErrorMessageBox(self,'R pressed ' + QueryIOTH.FieldByName('id').AsString);
  end
  else
    AddToLog(QueryIOTH.FieldByName(Column.FieldName).AsString);
end;

// .............................................................................

procedure TTabForm.IOTHGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
  var
    TextRect:TRect;
begin
  inherited;
  if (Column.FieldName = 'R') then
  begin
    if (gdFocused in State) then
    begin
      RButton.Left := Rect.Left + IOTHGrid.Left;
      RButton.Top := Rect.Top + IOTHGrid.Top;
      RButton.Width := Rect.Right - Rect.Left + 2;
      RButton.Visible := true;
      RButton.SetFocus;
    end
    else
    begin
//      RButton.Focused := false;
      RButton.Visible := false;
      IOTHGrid.Canvas.FillRect(Rect);
      TextRect := Rect;

      TextRect.Bottom := TextRect.Top + IOTHGrid.RowsHeight;

      IOTHGrid.Canvas.TextRect(TextRect, TextRect.Left + 2, TextRect.Top + 2, 'R');

    end;
  end;

end;

// .............................................................................

procedure TTabForm.IOTHGridDrawColumnTitle(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; AColumn: TColumn; var ASortMarker: TJvDBGridBitmap;
  IsDown: Boolean; var Offset: Integer; var DefaultDrawText,
  DefaultDrawSortMarker: Boolean);
begin
  inherited;
//  ACanvas.TextRect(ARect, 0, 0, AColumn.Title.Caption + '(c)');
end;

// .............................................................................

procedure TTabForm.IOTHGridDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  inherited;
  //
end;

// .............................................................................

procedure TTabForm.IOTHGridEditButtonClick(Sender: TObject);
begin
  inherited;
  //
  ErrorMessageBox(self, Sender.ClassName);
end;

procedure TTabForm.IOTHGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F2 then
  begin
    CommitActionExecute(Sender);
    key := 0;
  end;
  if key = VK_F10 then
  begin
    RollbackActionExecute(Sender);
    key := 0;
  end;
end;

// .............................................................................

procedure TTabForm.RButtonClick(Sender: TObject);
  var
    msg: Tmessage;
    bwidth: Integer;
begin
  inherited;
  if session_state > S_VERIFIED then
  begin
    ErrorMessageBox(self, 'Смена закрыта');
    Exit;
  end;
  AddToLog('Restore original ' +QueryIOTH.FieldByName('id').AsString);
  {

  key: session_id, azscode,tanknum,hosenum

    stored proc RESTOREIOTHREC

DDL
--------------------------------------------------
create or alter procedure restoreiothrec (
    session_id integer not null,
    azscode varchar(10) not null,
    tanknum varchar(10) not null,
    hosenum integer not null)
as
declare variable scnt double precision not null;
declare variable ecnt double precision not null;
declare variable density double precision;
declare variable stv double precision;
declare variable etv double precision;
declare variable volume double precision;
declare variable invol double precision;
declare variable sid integer not null;
declare variable tnum varchar(10) not null;
declare variable cnt integer;
begin

  for select distinct
  t.startfuelvolume,
  t.endfactvolume,
  t.enddensity,
  h.startcounter,
  h.endcounter,
  sum(o.volume) as volume

                from
                    hoses h
                    inner join tanks t on h.tanknum = t.tanknum
                    join sessions s on s.id = h.session_id
      join outcomesbyretail o on (
            o.session_id=s.id and
            o.tanknum=t.tanknum and
            h.hosenum=cast(o.hosename as integer))

                where t.session_id = :session_id
                    and s.id = t.session_id
                    and s.id = t.session_id
                    and t.tanknum = :tanknum
                    and h.hosenum = :hosenum
       group by
          t.startfuelvolume,
          t.endfactvolume,
          t.enddensity,
          h.startcounter,
          h.endcounter
            into :stv, :etv, :density, :scnt, :ecnt, :volume
    do
    begin
        update iotankshoses
        set density = :density,
            startfuelvolume = :stv,
            endfactvolume = :etv,
            startcounter = :scnt,
            endcounter = :ecnt,
            volume = :volume
        where
            session_id = :session_id
            and azscode = :azscode
            and tanknum = :tanknum
            and hosenum = :hosenum
            ;
    end
    cnt = 0;
    for
        select volume, sid, tnum from
            sessions s
            join
            (select volume, sid, tnum from calcincomes0(:session_id)) ss
                on ss.sid=s.id
            where tnum = :tanknum
            into :invol,  :sid, :tnum
    do
    begin
        if (:invol is null) then invol = 0;
        update iotankshoses set invol = :invol
            where session_id=:session_id and tanknum = :tanknum;
        cnt = :cnt + 1;
    end
    if (:cnt = 0) then
    begin
        update iotankshoses set invol = 0
            where session_id=:session_id and tanknum = :tanknum;

    end

/*  suspend; */
end
  }

  bwidth := 1;

  AddToLog(Format('RBT %d  %f', [RButton.Top,

  ( (RButton.Top - IOTHGrid.TitleRowHeight) + bwidth) / (IOTHGrid.RowsHeight + bwidth)

  ]));

  YNForm := TYNForm.Create(self);
  YNForm.Memo1.Font.Height := 18;
  YNForm.Memo1.Lines.Add('Уверены, что хотите');
  YNForm.Memo1.Lines.Add('восстановить строку');
  YNForm.Memo1.Lines.Add('из файла?');
  if YNForm.ShowModal <> mrOK then
  begin
    Exit;
  end;

  with RestoreIOTHRec do
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
      with Add do
      begin
        Name := 'hosenum';
        DataType := ftInteger;
        ParamType := ptInput;
      end;
      with Add do
      begin
        Name := 'tanknum';
        DataType := ftWideString;
        ParamType := ptInput;
      end;
      with Add do
      begin
        Name := 'azscode';
        DataType := ftWideString;
        ParamType := ptInput;
      end;
    end;
    ParamByName('session_id').asInteger := session_id;
    ParamByName('hosenum').asInteger := QueryIOTH.FieldByName('hosenum').AsInteger;
    ParamByName('tanknum').AsWideString := QueryIOTH.FieldByName('tanknum').AsWideString;
    ParamByName('azscode').AsWideString := current_azscode;


//    if dirtyIOTH then
//    begin
      if QueryIOTH.Transaction.Active then
        QueryIOTH.Transaction.Commit;
      dirtyIOTH := false;
//    end;

    try

      Transaction.StartTransaction;
      UpdateTransaction.StartTransaction;

      prepare;
      ExecProc;
      UpdateTransaction.Commit;
      Transaction.Commit;

      msg.Msg := WM_RECRESTORED;
      MainForm.SendMsgs(msg);

      UpdateAllStates(S_CHANGED);

    except
      on e: Exception do
      begin
        UpdateTransaction.Rollback;
        Transaction.Rollback;
        AddToLog(e.Message);
      end;

    end;

  end;

  ShowAllData;

end;

// .............................................................................

procedure TTabForm.RButtonKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ord(Key) = VK_RETURN then
  begin
     Key := #0;
     RButtonClick(Sender);
  end;
end;

// .............................................................................

procedure TTabForm.QueryIOTHBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

// .............................................................................

procedure TTabForm.RealPMGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);

var
  fn, fv, fp: String;
  p: Extended;
  TextRect: TRect;
begin
  inherited;

  RealPMGrid.Canvas.Brush.Color := clWebIvory;
  RealPMGrid.Canvas.Font.Color := clBlue;
  RealPMGrid.Canvas.Pen.Color := clGreen;

  if gdFocused in State then
  begin

  end;

  if gdFixed in State then
  begin

  end;

  if gdSelected in State then
  begin
    RealPMGrid.Canvas.Font.Color := clBlue;
    RealPMGrid.Canvas.Brush.Color := clWebLavenderBlush;

  end
  else
  begin
    RealPMGrid.Canvas.Font.Color := clBlack;
  end;

  fn := Column.FieldName;
  fv := QueryRealPM.FieldByName(fn).AsString;

  if LeftStr(fn, 6) = 'VOLUME' then
  begin
    fn := StringReplace(fn, 'VOLUME', 'AMOUNT', []);

    p := QueryRealPM.FieldByName(fn).AsExtended;

    fp := format('₽ %10.2f', [p]);
  end
  else
  begin
    fp := '';
  end;

  RealPMGrid.Canvas.FillRect(Rect);
  TextRect := Rect;

  TextRect.Bottom := TextRect.Top + RealPMGrid.RowsHeight div 2;

  RealPMGrid.Canvas.TextRect(TextRect, TextRect.Left + 2, TextRect.Top + 2, fv);

  OffsetRect(TextRect, 0, RealPMGrid.RowsHeight DIV 2);

  RealPMGrid.Canvas.TextRect(TextRect, TextRect.Left + 2,
    TextRect.Top + 2,  fp);

end;

// .............................................................................

procedure TTabForm.RealPMGridDrawColumnTitle(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; AColumn: TColumn; var ASortMarker: TJvDBGridBitmap;
  IsDown: Boolean; var Offset: Integer; var DefaultDrawText,
  DefaultDrawSortMarker: Boolean);

  var
    fn: String;
    TextRect: TRect;
    var price: Extended;

begin

  fn := AColumn.FieldName;

  if LeftStr(fn, 7) = 'VOLUME_' then
  begin
    ACanvas.Brush.Color := clWebLavenderBlush;
    ACanvas.FillRect(ARect);
    TextRect := ARect;
    TextRect.Bottom := TextRect.Top + RealPMGrid.TitleRowHeight div 2;

    ACanvas.TextRect(TextRect, Textrect.Left + 2, 2, AColumn.Title.Caption);

    Acanvas.Font.Color := clRed;
    Acanvas.Font.Style := [fsBold];
    OffsetRect(TextRect, 0, RealPMGrid.TitleRowHeight DIV 2);
    price := QueryRealPM.FieldByName('price_' + copy(fn, 8, 1)).asExtended;

    ACanvas.TextRect(TextRect, Textrect.Left + 2, Textrect.Top + 2, 
      Format('₽ %10.2f', [price]));

    DefaultDrawText := false;

  end
  else if  LeftStr(fn, 6) = 'VOLUME' then
  begin
    ACanvas.Brush.Color := clWebLavenderBlush;
    ACanvas.FillRect(ARect);
    TextRect := ARect;
    TextRect.Bottom := TextRect.Top + RealPMGrid.TitleRowHeight div 2;

    ACanvas.TextRect(TextRect, Textrect.Left + 2, 2, AColumn.Title.Caption);
    OffsetRect(TextRect, 0, RealPMGrid.TitleRowHeight DIV 2);
    DefaultDrawText := false;

  end
  else
  begin
//    inherited;
  end;
end;

procedure TTabForm.RealPMGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F2 then
  begin
    CommitActionExecute(Sender);
    key := 0;
  end;
  if key = VK_F10 then
  begin
    RollbackActionExecute(Sender);
    key := 0;
  end;

end;

// .............................................................................

procedure TTabForm.warechanged(var Msg: TMessage);
begin
  AddToLog('MSG wareschanged');
end;

// .............................................................................

procedure TTabForm.counterschanged(var Msg: TMessage);
begin
  AddToLog('MSG counterschanged');
  // ShowAllData;// if called causes deadlock!
  // ShowIOTHData; // the same
end;

// .............................................................................

procedure TTabForm.sessionadded(var Msg: TMessage);
begin
//
  AddToLog('sess added in tabs');
  DM.FDConnection.Close;
  DM.FDConnection.Open();
  ShowAllData;
end;

// .............................................................................

procedure TTabForm.sessiondeleted(var Msg: TMessage);
begin
  if Msg.WParam = session_id then
  begin
    Close;
  end;
end;

// .............................................................................

procedure TTabForm.stationchanged(var Msg: TMessage);
begin
//    Close;
end;

end.
