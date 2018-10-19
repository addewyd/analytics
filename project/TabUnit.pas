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
    procedure SetPrevSessionData1Click(Sender: TObject);
    procedure IOTHGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure IOTHGridCellClick(Column: TColumn);
    procedure IOTHGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure IOTHGridEditButtonClick(Sender: TObject);
    procedure IOTHGridColExit(Sender: TObject);
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
  private
    { Private declarations }
    dirtyGSM: Boolean;
    dirtyIOTH: Boolean;
    dirtyPM: Boolean;
    warelist: TStringList;
    session_id: Integer;
    sessionnum: Integer;
    procedure LoadWareList;
    function GenPMSql(var sumsql: string): String;
    procedure warechanged(var Msg: TMessage); message WM_WARECHANGED;
    procedure counterschanged(var Msg: TMessage); message WM_COUNTERS_CHANGED;
  public
    { Public declarations }
    sst: String;
    startdate: String;
    // azscode: String;
    FuelCombo: TJVDBLookUpCombo;
    constructor Create(pr: TComponent; fname: String;
      _sid, _snum: Integer; _sdt: String);
      reintroduce; overload;

    procedure ShowAllData();

    procedure ShowGSMData();
    procedure ShowIOTHData();
    procedure ShowPMData();
    procedure UpdateState(q: TFDQuery);
    function GetStartSession: String;
  end;

var
  TabForm: TTabForm;

implementation

{$R *.dfm}

uses DmUnit, MainUnit, YNUnit, CntReplaceUnit, StrUtils;

constructor TTabForm.Create(pr: TComponent; fname: String;
  _sid, _snum: Integer; _sdt: String);
begin
  inherited Create(pr, fname);
  session_id := _sid;
  sessionnum := _snum;
  startdate := _sdt;

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

procedure TTabForm.DSIOTHFieldChanged(Sender: TObject; Field: TField);
var
  f, fname: String;
begin
  inherited;
  fname := Field.FieldName;
  f := Field.AsString;
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

procedure TTabForm.UpdateState(q: TFDQuery);
begin
  // HZ!!!
  // q.UpdateTransaction.Commit;
  AddToLog(q.Name + ' need update');
  WITH q DO
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

  sqlt := 'update iotankshoses set warecode = :warecode_new ' +
    ' where session_id >= :session_id and azscode= :azs and tanknum = :tanknum and warecode = :old_warecode';

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
        ' where session_id >= :session_id and azscode=:azs and tanknum = :tanknum and ware_code = :old_warecode';

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
      + '    where w1.code= ' + #$27 + warelist.Names[i] + #$27 +
      '        and i1.direction=0 ' +
      '        and i1.payment_code = i.payment_code and i1.session_id=:session_id), '
      + '0)  as volume_' + st + ',';

    tmp := 'coalesce((select sum(i1.amount) from inoutgsm i1 join wares w1 on w1.code=i1.ware_code '
      + '    where w1.code= ' + #$27 + warelist.Names[i] + #$27 +
      '        and i1.direction=0 ' +
      '        and i1.payment_code = i.payment_code and i1.session_id=:session_id), '
      + '0)  as amount_' + st + ',';

    th := th + tm + tmp;

    sumtm := sumtm + ' sum(volume_' + st + ') as volume_' + st + ',';

  end;
  sumtf := ' 0 as nol' + '    from (';
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
    AddToLog('ReplCnt mrOK');
    ShowIOTHData;
  end;

end;

// .............................................................................

procedure TTabForm.SetPrevSessionData1Click(Sender: TObject);
begin
  inherited;
  AddToLog(QueryIOTH.FieldByName('StartFuelVolume').AsString);
end;

// .............................................................................

procedure TTabForm.ShowAllData();
begin
//  sst := GetStartSession();
  LoadWareList;
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
    if Active then
      Close;
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
    // ParamByName('start_session_t').AsString := sst;
    ParamByName('session_id').AsInteger := session_id;
    ParamByName('azscode').AsString := current_azscode;

    Transaction.StartTransaction;
    try
      Prepare;
      Open;
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
      end;
      with Add do
      begin
        FieldName := 'payment_code';
      end;
      with Add do
      begin
        FieldName := 'pmode';
      end;
      with Add do
      begin
        FieldName := 'VOLUME';
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
//      RealPMFooter.Refresh;
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

procedure TTabForm.ShowIOTHData();
var
  i: Integer;
  tm: TMenuItem;
begin

  FuelPopupMenu.Items.Clear;
  for i := 0 to warelist.Count - 1 do
  begin
    tm := TMenuItem.Create(FuelPopupMenu);
    tm.Caption := warelist.ValueFromIndex[i];

    tm.Name := 'fpm_' + IntToStr(i);
    // tm.Parent := FuelPopupMenu;
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
    // ParamByName('start_session_t').AsString := sst;
    ParamByName('session_id').AsInteger := session_id;
    ParamByName('azscode').AsString := current_azscode;

    Transaction.StartTransaction;
    try
      Prepare;
      Open;
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

procedure TTabForm.CommitActionExecute(Sender: TObject);
var
  cmt: Boolean;
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
          Close;
          Transaction.Commit;
          cmt := true;
          UpdateState(QueryIOTH);
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
          cmt := true;
          UpdateState(QueryRealPM);
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
          cmt := true;
          UpdateState(QueryInOut);
          ShowGSMData;
          dirtyGSM := false;
        end;
      end;
    end;

    // if cmt then DM.FDTransaction.Commit;

  except
    on e: Exception do
    begin
      AddToLog(e.Message);
    end;
  end;

  // ShowAllData;
end;

// .............................................................................

procedure TTabForm.RollbackActionExecute(Sender: TObject);
var
  cmt: Boolean;
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
        ShowGSMData;
        dirtyGSM := false;

      end;

    end;
    with QueryIOTH do
    begin
      if Transaction.Active then
      begin
        Transaction.Rollback;
        cmt := true;
        ShowIOTHData;
        dirtyIOTH := false;
      end;

    end;
    with QueryRealPM do
    begin
      if Transaction.Active then
      begin
        // Transaction.Rollback;
        cmt := true;
        ShowPMData;
        dirtyPM := false;
      end;

    end;
    // if cmt  then DM.FDTransaction.Rollback;

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
begin
  inherited;
  CalcValue := 'F: ' + FieldName;
end;

// .............................................................................

procedure TTabForm.RealPMFooterCalculate(Sender: TJvDBGridFooter;
  const FieldName: string; var CalcValue: Variant);

var
  i: Integer;
  f: String;
begin
  inherited;
  // AddToLog(FieldName);
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

procedure TTabForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  warelist.Free;
  if QueryInOut.Transaction.Active then
  begin
    //
  end;
  // JVFS.SaveFormPlacement;

end;

// .............................................................................

procedure TTabForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  yn: TYNForm;
  mr: Integer;
begin
  inherited;
  // if QueryInOut.Transaction.Active then
  // begin

  CanClose := not(dirtyGSM or dirtyIOTH or dirtyPM);

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
      if QueryIOTH.Transaction.Active then
        QueryIOTH.Transaction.Commit;
      if QueryRealPM.Transaction.Active then
        QueryRealPM.Transaction.Commit;

      if dirtyGSM then
        UpdateState(QueryInOut);
      if dirtyIOTH then
        UpdateState(QueryIOTH);
      if dirtyPM then
        UpdateState(QueryRealPM);
      CanClose := true;
    end;
    if mr = mrAbort then
    begin
      if QueryInOut.Transaction.Active then
        QueryInOut.Transaction.Rollback;
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

procedure TTabForm.FormCreate(Sender: TObject);
var
  i: Integer;
  sst: String;
  tm: TMenuItem;
begin
  inherited;
  warelist := TStringList.Create;
  dirtyGSM := false;
  dirtyIOTH := false;
  dirtyPM := false;
  Caption := Format('TabForm AZS ' +
    ' %s session %d start %s' , [current_azscode, sessionnum, startdate]);

  // ??? no need
  FuelCombo := TJVDBLookUpCombo.Create(self);
  with FuelCombo do
  begin
    Parent := self;
    Visible := false;
    LookupSource := IOTHGrid.DataSource;
    DataField := 'FUELNAME';

  end;

  ShowAllData;
end;

// .............................................................................

procedure TTabForm.GridInOutGSMEditChange(Sender: TObject);
begin
  //
//  dirtyGSM := true;
end;

// .............................................................................

procedure TTabForm.IOTHFooterCalculate(Sender: TJvDBGridFooter;
  const FieldName: string; var CalcValue: Variant);
begin
  inherited;
  CalcValue := FieldName;
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

procedure TTabForm.IOTHGridColExit(Sender: TObject);
begin
  inherited;
  // if IOTHGrid.SelectedField.FieldName = 'R' then
  // RButton.Visible := false;
end;

// .............................................................................

procedure TTabForm.IOTHGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  // IOTHGrid.
//   Canvas.TextRect(Rect, Rect.Left+1, Rect.Top+1,
//   WrapText(Column.Title.Caption, 20));
  if (gdFocused in State) then
  begin
    if (Column.FieldName = 'R') then
    begin
      RButton.Left := Rect.Left + IOTHGrid.Left;
      RButton.Top := Rect.Top + IOTHGrid.Top;
      RButton.Width := Rect.Right - Rect.Left + 2;
      RButton.Visible := true;
    end;
  end;

end;

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

// .............................................................................

procedure TTabForm.RButtonClick(Sender: TObject);
  var
    msg: Tmessage;
begin
  inherited;
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
begin
  for select distinct
                h.startcounter,
                h.endcounter
                from
                    hoses h
                    inner join tanks t on h.tanknum = t.tanknum
                    join sessions s on s.id = h.session_id

                where t.session_id = :session_id
                    and s.id = t.session_id
                    and s.id = t.session_id
                    and t.tanknum = :tanknum
                    and h.hosenum = :hosenum
            into :scnt, :ecnt
    do update iotankshoses
        set startcounter = :scnt,
            endcounter = :ecnt
        where
            session_id = :session_id
            and azscode = :azscode
            and tanknum = :tanknum
            and hosenum = :hosenum
            ;

  suspend;
end

  }

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


    if dirtyIOTH then
    begin
      if QueryIOTH.Transaction.Active then
        QueryIOTH.Transaction.Commit;
      dirtyIOTH := false;
    end;

    try

      Transaction.StartTransaction;
      UpdateTransaction.StartTransaction;

      prepare;
      ExecProc;
      UpdateTransaction.Commit;
      Transaction.Commit;

      dirtyIOTH := true;

      msg.Msg := WM_RECRESTORED;
      MainForm.SendMsgs(msg);


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

procedure TTabForm.IOTHGridEditChange(Sender: TObject);
begin
  inherited;
//  dirtyIOTH := true;  // in ds.Datafield change
  //
end;

// .............................................................................

procedure TTabForm.QueryIOTHAfterPost(DataSet: TDataSet);
begin
  inherited;
  // AddToLog('aftwr post');
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
  p, v: Extended;
  TextRect: TRect;
begin
  inherited;

//  AddToLog(format('%s %d %d %d',
  //  [Column.Title.Caption,
    //  Rect.Top,
      //Rect.Left,
      //RealPMGrid.Canvas.Font.Size
      //]));
  fn := Column.FieldName;
  fv := QueryRealPM.FieldByName(fn).AsString;

  if LeftStr(fn, 6) = 'VOLUME' then
  begin
    fn := StringReplace(fn, 'VOLUME', 'AMOUNT', []);

    p := QueryRealPM.FieldByName(fn).AsExtended;
//    v := StrToextDef(fv, 0);

    fp := format('₽ %10.2f', [p]);
  end
  else
  begin
    fp := '';
  end;

  RealPMGrid.Canvas.Brush.Color := clYellow;
  RealPMGrid.Canvas.FillRect(Rect);
  RealPMGrid.Canvas.Pen.Color := clBlack;
  RealPMGrid.Canvas.Font.Color := clBlack;
  TextRect := Rect;

  TextRect.Bottom := TextRect.Top + RealPMGrid.RowsHeight div 2;

  RealPMGrid.Canvas.TextRect(TextRect, TextRect.Left + 2, TextRect.Top + 2, fv);

  OffsetRect(TextRect, 0, RealPMGrid.RowsHeight DIV 2);

  RealPMGrid.Canvas.TextRect(TextRect, TextRect.Left + 2,
    TextRect.Top + 2,  fp);

end;

procedure TTabForm.RealPMGridDrawColumnTitle(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; AColumn: TColumn; var ASortMarker: TJvDBGridBitmap;
  IsDown: Boolean; var Offset: Integer; var DefaultDrawText,
  DefaultDrawSortMarker: Boolean);
begin
  inherited;
//
end;

procedure TTabForm.RealPMGridEditChange(Sender: TObject);
begin
  inherited;
//  dirtyPM := true;  // in ds.datafieldchange
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


end.
