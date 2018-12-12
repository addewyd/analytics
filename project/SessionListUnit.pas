unit SessionListUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DmUnit, FormWithGridUnit, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  JvDataSource, System.ImageList, Vcl.ImgList, Vcl.Menus, System.Actions,
  Vcl.ActnList, JvFormPlacement, JvComponentBase, JvAppStorage,
  JvAppRegistryStorage, JvDBGridFooter, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, Vcl.ToolWin, JvToolBar,
  JvDBUltimGrid, Vcl.StdCtrls, JvExStdCtrls, JvCheckBox, Vcl.Mask, JvExMask,
  JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit, JvEdit,
  JvHtControls;
{$Include 'consts.inc'}

type
  TSessionListForm = class(TFormWithGrid)
    QuerySST: TFDQuery;
    FDQueryD: TFDQuery;
    DeleteLastAction: TAction;
    ToolButton3: TToolButton;
    DeleteLast1: TMenuItem;
    ToolButton4: TToolButton;
    ChangeStationAction: TAction;
    N2: TMenuItem;
    CloseSessAction: TAction;
    ClearCloseAction: TAction;
    VerifiedAction: TAction;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    GenQuery: TFDQuery;
    GenTrans: TFDTransaction;
    GenUpdQuery: TFDQuery;
    GenUpdTrans: TFDTransaction;
    GenUpdTransUPD: TFDTransaction;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    EnnableFilterCB: TJvCheckBox;
    JvHTLabel1: TJvHTLabel;
    AZSEdit: TJvEdit;
    STDatePickerEdit: TJvDatePickerEdit;
    ENDDatePickerEdit: TJvDatePickerEdit;
    procedure FormCreate(Sender: TObject);
    procedure JvDBGridDblClick(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure JvDBGridKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DeleteLastActionExecute(Sender: TObject);
    procedure JvDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ChangeStationActionExecute(Sender: TObject);
    procedure CloseSessActionExecute(Sender: TObject);
    procedure ClearCloseActionExecute(Sender: TObject);
    procedure VerifiedActionExecute(Sender: TObject);
    procedure EnnableFilterCBClick(Sender: TObject);
    procedure AZSEditKeyPress(Sender: TObject; var Key: Char);
    procedure STDatePickerEditChange(Sender: TObject);
    procedure ENDDatePickerEditChange(Sender: TObject);
  private
    { Private declarations }
    acode: String;
  public
    { Public declarations }
    function GetStartSession: String;
    procedure sessionadded(var Msg: TMessage); message WM_SESSION_ADDED;
    procedure sessiondeleted(var Msg: TMessage); message WM_SESSION_DELETED;
    procedure sessionclosed(var Msg: TMessage); message WM_SESSION_CLOSED;
    procedure sessionupdated(var Msg: TMessage); message WM_SESSION_UPDATED;
    procedure stationchanged(var Msg: TMessage); message WM_STATION_CHANGED;
    procedure statechangedfext(var Msg: TMessage); message WM_STATE_CHANGED_FEXT;
    procedure PrepareAndLoad;
    function PrevClosed(sid: Integer) : boolean;
    procedure UpdateState(tablename, idname: String; id, _state: Integer);
    procedure SetControls(st: Integer);
    function IsNextSessionOpened(id: Integer): boolean;
  end;

var
  SessionListForm: TSessionListForm;

implementation

{$R *.dfm}

uses HttpServiceUnit, MainUnit, TabUnit, BaseFormUnit1, YNUnit, StationsUnit;

        // проверено, закрыть смену, открыть смену

procedure TSessionListForm.SetControls(st: Integer);
begin
    CloseSessAction.Enabled := st < S_CLOSED;
    ClearCloseAction.Enabled := st = S_CLOSED;
    VerifiedAction.Enabled := st < S_VERIFIED;
end;

// .............................................................................

procedure TSessionListForm.PrepareAndLoad;
var
  sst, est: String;
begin
  sst := GetStartSession;
  est := DateTimeToStr(Now + 1);
  if EnnableFilterCB.Checked then
  begin
    est := DateTimeToStr(EndDatePickerEdit.Date + 1);
  end;

  with FDQuery do
  begin
    with Macros do
    begin
      Clear;
      with Add do
      begin
        Name := 'sscl';
        DataType := mdRaw;
      end;
    end;
    with Params do
    begin
      Clear;
      with Add do
      begin
        Name := 'azs';
        DataType := ftString;
        ParamType := ptInput;
      end;
        with Add do
        begin
          Name := 'sst';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'est';
          DataType := ftString;
          ParamType := ptInput;
        end;
    end;
    if show_closed then
      MacroByName('sscl').asRaw := ' '
    else
      MacroByName('sscl').asRaw := ' and state<2 ';

    ParamByName('azs').AsString := acode;
    ParamByName('sst').AsString := sst;
    ParamByName('est').AsString := est;
  end;
  inherited;
  inherited LoadData;
  JvDBGrid.Refresh;

end;

// .............................................................................

procedure TSessionListForm.UpdateState(tablename, idname: String;
  id, _state: Integer);
var
  Msg: TMessage;
begin
  with GenUpdQuery do
  begin
    Transaction.StartTransaction;
    UpdateTransaction.StartTransaction;
    try
      if AnsiSameText(tablename, 'sessions') then
        sql.Text := 'update !table set state = :state ' +
          ' where !session_id = :session_id'// and state < ' + SS_CLOSED
      else
        sql.Text := 'update !table set state = :state, lastuser_id=:user_id ' +
          ' where !session_id = :session_id'; // and state < ' + SS_CLOSED;
      with Macros do
      begin
        Clear;
        with Add do
        begin
          Name := 'table';
          DataType := mdRaw;
        end;
        with Add do
        begin
          Name := 'session_id';
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
        if not AnsiSameText(tablename, 'sessions') then
          with Add do
        begin
          Name := 'user_id';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
      end;
      MacroByName('table').asRaw := tablename;
      MacroByName('session_id').asRaw := idname;
      ParamByName('state').AsInteger := _state;
      ParamByName('session_id').AsInteger := id;
      if not AnsiSameText(tablename, 'sessions') then
        ParamByName('user_id').AsInteger := user_id;

      prepare;
      ExecSQL;
      AddToLog('updating ' + tablename);

      UpdateTransaction.Commit;
      Transaction.Commit;

      DM.AddLogMsg(user_id, format('Updated %s session_id %d',
        [tablename, id]));
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

procedure TSessionListForm.AZSEditKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ord(key) = VK_RETURN then
  begin
    // reload
    acode := AZSEdit.Text;
    PrepareAndLoad;
    key := chr(0);
  end;
end;

// .............................................................................

procedure TSessionListForm.ChangeStationActionExecute(Sender: TObject);
  var
    tb: TForm;
begin
  inherited;
  if not MainForm.isWinOpen('stations')
  then
  begin
    TStationsForm.Create(MainForm, 'stations');
  end
  else
  begin
    ShowWindow(MainForm.GetMDIForm('stations').Handle, SW_RESTORE);
    MainForm.GetMdiForm('stations').Show;
  end;


end;

// .............................................................................

function TSessionListForm.IsNextSessionOpened(id: Integer): boolean;
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
    ParamByName('azscode').AsString := acode;
    ParamByName('id').AsInteger := id;
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

procedure TSessionListForm.ClearCloseActionExecute(Sender: TObject);
  var
    yn : TYNForm;
    msg: TMessage;
    session_id: Integer;
    _state: Integer;
begin
  inherited;
  session_id := FDQuery.FieldByName('id').AsInteger;
  _state := FDQuery.FieldByName('state').AsInteger;
  if (_state <> S_CLOSED) then Exit;

  if IsNextSessionOpened(session_id) then
  begin
    yn := TYNForm.Create(self);
    yn.Memo1.Text := 'Открыть смену?';
    if yn.ShowModal <> mrOK then Exit;

    UpdateState('sessions', 'id', session_id, S_CHANGED);
    UpdateState('inoutgsm', 'session_id', session_id, S_CHANGED);
    UpdateState('iotankshoses', 'session_id', session_id, S_CHANGED);
    UpdateState('inoutitems', 'session_id', session_id, S_CHANGED);
    msg.WParam := S_CHANGED;
    msg.LParam := session_id;
    msg.Msg := WM_STATE_CHANGED;
    MainForm.SendMsgs(msg);
    LoadData;
    FDQuery.Locate('id', session_id);
  end
  else
  begin
    ErrorMessageBox(self, 'Не открыта следующая смена');
    Exit;

  end;
end;

// .............................................................................

procedure TSessionListForm.VerifiedActionExecute(Sender: TObject);
  var
    yn : TYNForm;
    msg: TMessage;
    session_id: Integer;
    _state: Integer;
begin
  inherited;
  session_id := FDQuery.FieldByName('id').AsInteger;
  _state := FDQuery.FieldByName('state').AsInteger;
  if _state <= S_VERIFIED then
  begin
    yn := TYNForm.Create(self);
    yn.Memo1.Text := 'Смена проверена?';
    if yn.ShowModal <> mrOK then Exit;

    UpdateState('sessions', 'id', session_id, S_VERIFIED);
    UpdateState('inoutgsm', 'session_id', session_id, S_VERIFIED);
    UpdateState('iotankshoses', 'session_id', session_id, S_VERIFIED);
    UpdateState('inoutitems', 'session_id', session_id, S_VERIFIED);
    msg.WParam := S_VERIFIED;
    msg.Msg := WM_STATE_CHANGED;
    MainForm.SendMsgs(msg);
    LoadData;
    FDQuery.Locate('id', session_id);
  end
  else
  begin
    ErrorMessageBox(self, 'Смена закрыта');
    Exit;

  end;
end;

// .............................................................................

procedure TSessionListForm.CloseSessActionExecute(Sender: TObject);
  var
    yn : TYNForm;
    msg: TMessage;
    session_id: Integer;
    _state: Integer;

begin
  inherited;

  session_id := FDQuery.FieldByName('id').AsInteger;
  _state := FDQuery.FieldByName('state').AsInteger;

  if _state = S_CLOSED then Exit;

  if not PrevClosed(session_id) then
  begin
    ErrorMessageBox(self, 'Не закрыта предыдущая смена');
    Exit;
  end;

  yn := TYNForm.Create(self);
  yn.Memo1.Text := 'Закрыть смену?';
  if yn.ShowModal <> mrOK then Exit;

  try
    UpdateState('sessions', 'id', session_id, S_CLOSED);
    UpdateState('inoutgsm', 'session_id', session_id, S_CLOSED);
    UpdateState('iotankshoses', 'session_id', session_id, S_CLOSED);
    UpdateState('inoutitems', 'session_id', session_id, S_CLOSED);
    msg.WParam := S_CLOSED;
    msg.Msg := WM_STATE_CHANGED;
    MainForm.SendMsgs(msg);
    LoadData;
    FDQuery.Locate('id', session_id);

  except
      on e: Exception do
      begin
        AddToLog('oblom ' + e.Message);
      end;
  end;

end;

// .............................................................................

procedure TSessionListForm.DeleteLastActionExecute(Sender: TObject);
  var
    Key: Word;
begin
  inherited;
  key := VK_DELETE;
  JvDBGridKeyDown(Sender, Key, []);
end;

// .............................................................................

procedure TSessionListForm.ENDDatePickerEditChange(Sender: TObject);
begin
  inherited;
  PrepareAndLoad;
end;

// .............................................................................

procedure TSessionListForm.EnnableFilterCBClick(Sender: TObject);
begin
  inherited;
  STDatePickerEdit.Enabled := EnnableFilterCB.Checked;
  ENDDatePickerEdit.Enabled := EnnableFilterCB.Checked;
  AZSEdit.Enabled := EnnableFilterCB.Checked;
  if true {EnnableFilterCB.Checked} then
  begin
    PrepareAndLoad;
  end;
end;

// .............................................................................

procedure TSessionListForm.FormCreate(Sender: TObject);
begin
  inherited;
  acode := current_azscode;
  AZSEdit.Text := acode;
  STDatePickerEdit.Enabled := EnnableFilterCB.Checked;
  ENDDatePickerEdit.Enabled := EnnableFilterCB.Checked;
  AZSEdit.Enabled := EnnableFilterCB.Checked;

  PrepareAndLoad;

end;

// .............................................................................

procedure TSessionListForm.JvDBGridDblClick(Sender: TObject);
  var
    tb: TForm;
begin
  inherited;
  //
  AddToLog(FDQuery.FieldByName('sessionnum').asString);

  if not MainForm.isWinOpen('tabform')
  then
  begin
//    TTabForm.Create(MainForm, 'tabform', FDQuery.FieldByName('id').asInteger);
  end
  else
  begin
    tb := MainForm.GetMDIForm('tabform');
    tb.Close;
    MainForm.RemoveComponent(tb);
  end;
  TTabForm.Create(MainForm, 'tabform',
      FDQuery.FieldByName('id').asInteger,
      FDQuery.FieldByName('sessionnum').asInteger,
      FDQuery.FieldByName('sdt').asString,
      FDQuery.FieldByName('state').asInteger
      );

end;

// .............................................................................

procedure TSessionListForm.JvDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  var
    st: Integer;
    fn, fv: String;
    TextRect: TRect;
    cl : TColor;
  const clrs: array of TColor = [
    clBlack, // NEW
    clBlue,  // CHANGED
    clGreen,  // VERIFIED
    clGray,  // CLOSED
    clMaroon,     // PARTLY
    clRed     // SENT
    ];
begin
  inherited;

  st := FDQuery.FieldByName('state').AsInteger;
  cl := clrs[st];
  JvDBGrid.Canvas.Brush.Color := clWebIvory;
  JvDBGrid.Canvas.Font.Color := cl;
  JvDBGrid.Canvas.Pen.Color := cl;

  if gdFocused in State then
  begin

  end;

  if gdFixed in State then
  begin

  end;

  if gdSelected in State then
  begin
//    JvDBGrid.Canvas.Font.Color := clBlue;
    JvDBGrid.Canvas.Brush.Color := clWebLavenderBlush;

  end
  else
  begin
//    JvDBGrid.Canvas.Font.Color := clBlack;
  end;

  fn := Column.FieldName;
  fv := FDQuery.FieldByName(fn).AsString;

  JvDBGrid.Canvas.FillRect(Rect);
  TextRect := Rect;

  TextRect.Bottom := TextRect.Top + JvDBGrid.RowsHeight;

  JvDBGrid.Canvas.TextRect(TextRect, TextRect.Left + 2, TextRect.Top + 2, fv);

end;

// .............................................................................

procedure TSessionListForm.JvDBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    id, bill_id, _state: Integer;
    msg: TMessage;
begin
  inherited;
  id := 0;

  if Key = VK_DELETE then
  begin
    YNForm := TYNForm.Create(self);
    YNForm.Memo1.Lines.Add('Удалить полностью последнюю смену?');
    YNForm.Memo1.Lines.Add('Really?');
    if YNForm.ShowModal <> mrOk  then
    begin
      Exit;
    end;

     with FDQueryD do
     begin
      if FDQuery.Active then
      begin
        FDQuery.Last;
        if not false {Eof} then
        begin
          id := FDQuery.FieldByname('id').AsInteger;
          _state := FDQuery.FieldByname('state').AsInteger;
          if(_state > 1) then
          begin
            ErrorMessageBox(self, 'Смена закрыта, нельзя удалить');
            Exit;
          end;
          if id > 0 then
          begin
            // try to delete session
            {  TABLES

                     INOUTGSM
                     INOUTITEMS
                     IOTANKSHOSES

                     CASHFLOW
                     HOSES
                     INCOMESBYDISCHARGE
                     ITEMOUTCOMESBYPAYSHEET
                     ITEMOUTCOMESBYRETAIL
                     ITEMRESTS
                     OUTCOMESBYCOUPON
                     OUTCOMESBYOFFICE
                     OUTCOMESBYRETAIL
                     TANKS
                     TDB_ITEMS // bill_id to  TRADEDOCSINBILL
                     TECHRETURN
                     TRADEDOCSINBILL
                     WAREPRICES

                     SESSIONS  // id

            }

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
              end;
              Trans.StartTransaction;
              TransUPD.StartTransaction;

              sql.Text := 'select id from TRADEDOCSINBILL where session_id=:id';
              ParamByNAme('id').AsInteger := id;
              Prepare;
              Open;
              First;
              bill_id := FieldByName('id').AsInteger;
              Close;

              sql.Text := 'delete from INOUTGSM where session_id = :id';
              Prepare;
              ExecSQL;

              sql.Text := 'delete from INOUTITEMS where session_id = :id';
              Prepare;
              ExecSQL;

              sql.Text := 'delete from IOTANKSHOSES where session_id = :id';
              Prepare;
              ExecSQL;

              // ...............................................................
              sql.Text := 'delete from CASHFLOW where session_id = :id';
              Prepare;
              ExecSQL;
              sql.Text := 'delete from HOSES where session_id = :id';
              Prepare;
              ExecSQL;
              sql.Text := 'delete from INCOMESBYDISCHARGE where session_id = :id';
              Prepare;
              ExecSQL;
              sql.Text := 'delete from ITEMOUTCOMESBYPAYSHEET where session_id = :id';
              Prepare;
              ExecSQL;
              sql.Text := 'delete from ITEMOUTCOMESBYRETAIL where session_id = :id';
              Prepare;
              ExecSQL;
              sql.Text := 'delete from ITEMRESTS where session_id = :id';
              Prepare;
              ExecSQL;
              sql.Text := 'delete from OUTCOMESBYCOUPON where session_id = :id';
              Prepare;
              ExecSQL;
              sql.Text := 'delete from OUTCOMESBYOFFICE where session_id = :id';
              Prepare;
              ExecSQL;
              sql.Text := 'delete from OUTCOMESBYRETAIL where session_id = :id';
              Prepare;
              ExecSQL;
              sql.Text := 'delete from TANKS where session_id = :id';
              Prepare;
              ExecSQL;
              sql.Text := 'delete from TECHRETURN where session_id = :id';
              Prepare;
              ExecSQL;
              sql.Text := 'delete from WAREPRICES where session_id = :id';
              Prepare;
              ExecSQL;

              sql.Text := 'delete from TDB_ITEMS where bill_id = :id';
              ParamByName('id').AsInteger := bill_id;
              Prepare;
              ExecSQL;

              sql.Text := 'delete from sessions where id = :id';
              ParamByName('id').AsInteger := id;
              Prepare;
              ExecSQL;

              TransUPD.Commit;
              Trans.Commit;
              msg.msg := WM_SESSION_DELETED;
              msg.WParam := id;
              MainForm.SendMsgs(msg);
              DM.AddLogMsg(user_id, Format('deleted session id %d tables', [id]));
              PrepareAndLoad;
            except
              on e: Exception do
              begin
                TransUPD.Rollback;
                Trans.Rollback;
                ErrorMessageBox(self, e.Message);
              end;
            end;
          end;
        end;
      end;
     end;
     AddToLog(Format('del id %d', [id]));
  end;

end;

// .............................................................................

procedure TSessionListForm.JvDBGridKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ord(Key) = VK_RETURN then
  begin
     Key := #0;
     JvDBGridDblClick(Sender);
  end;
end;

// .............................................................................

procedure TSessionListForm.RefreshActionExecute(Sender: TObject);
begin
  inherited;
  PrepareAndLoad;
end;

// .............................................................................

function TSessionListForm.GetStartSession: String;
begin
  result := '2000-01-01 00:00:00';
  if EnnableFilterCB.Checked then
  begin

    result := DateTimeToStr(STDatePickerEdit.Date);
    exit;
  end;
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
      ParamByName('azs').AsString := acode;
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

procedure TSessionListForm.sessionadded(var Msg: TMessage);
begin
  AddToLog('SESSIONADDED');
  PrepareAndLoad;
end;

// .............................................................................

procedure TSessionListForm.sessiondeleted(var Msg: TMessage);
begin
  AddToLog('SESSIONDELETED');
  PrepareAndLoad;
end;

// .............................................................................

procedure TSessionListForm.sessionclosed(var Msg: TMessage);
begin
  AddToLog('SESSIONCLOSED');
  PrepareAndLoad;
end;

// .............................................................................

procedure TSessionListForm.sessionupdated(var Msg: TMessage);
begin
  AddToLog('SESSIONUPDATED');
  PrepareAndLoad;
end;

// .............................................................................

procedure TSessionListForm.stationchanged(var Msg: TMessage);
begin
  AddToLog('STATIONCANGED');
  acode := current_azscode;
  AZSEdit.Text := acode;
  PrepareAndLoad;
end;

procedure TSessionListForm.STDatePickerEditChange(Sender: TObject);
begin
  inherited;
  PrepareAndLoad;
end;

// .............................................................................

procedure TSessionListForm.statechangedfext(var Msg: TMessage);
begin
  AddToLog('STATECANGED from http to ' + IntToStr(msg.WPARAM));
  PrepareAndLoad;

end;

// .............................................................................

function TSessionListForm.PrevClosed(sid: Integer) : boolean;
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
    ParamByName('azscode').AsString := acode;
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

end.
