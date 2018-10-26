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
  JvDBUltimGrid;
{$Include 'consts.inc'}

type
  TSessionListForm = class(TFormWithGrid)
    QuerySST: TFDQuery;
    FDQueryD: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure JvDBGridDblClick(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure JvDBGridKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetStartSession: String;
    procedure sessionadded(var Msg: TMessage); message WM_SESSION_ADDED;
    procedure sessiondeleted(var Msg: TMessage); message WM_SESSION_DELETED;
    procedure PrepareAndLoad;
  end;

var
  SessionListForm: TSessionListForm;

implementation

{$R *.dfm}

uses HttpServiceUnit, MainUnit, TabUnit, BaseFormUnit1, YNUnit;


procedure TSessionListForm.PrepareAndLoad;
var
  sst: String;
begin
  sst := GetStartSession;
  with FDQuery do
  begin
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
    end;
    ParamByName('azs').AsString := current_azscode;
    ParamByName('sst').AsString := sst;
  end;
  inherited;
  inherited LoadData;
  JvDBGrid.Refresh;

end;

// .............................................................................

procedure TSessionListForm.FormCreate(Sender: TObject);
begin
  inherited;
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
      FDQuery.FieldByName('sdt').asString
      );

end;

// .............................................................................

procedure TSessionListForm.JvDBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    id, bill_id: Integer;
    msg: TMessage;
begin
  inherited;
  id := 0;

  if Key = VK_DELETE then
  begin
    YNForm := TYNForm.Create(self);
    YNForm.Memo1.Lines.Add('������� ��������� ��������� �����?');
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

end.
