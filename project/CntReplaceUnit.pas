unit CntReplaceUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvExControls, JvStaticText,
  JvExStdCtrls, JvMemo, System.Actions, Vcl.ActnList;

{$Include 'consts.inc'}

type
  TCntReplaceDlg = class(TForm)
    OkButton: TButton;
    CancelButton: TButton;
    Tran: TFDTransaction;
    FDQuery: TFDQuery;
    TranUpd: TFDTransaction;
    Text01: TJvStaticText;
    Text02: TJvStaticText;
    RecMemo: TJvMemo;
    ActionList1: TActionList;
    OKAction: TAction;
    FDQueryS: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKActionExecute(Sender: TObject);
  private
    { Private declarations }
    procedure DoChanges;
  public
    records: PRecArray;
    reccount: Integer;
    QIOTH: TFDQuery;
  end;

var
  CntReplaceDlg: TCntReplaceDlg;

implementation

{$R *.dfm}

uses DmUnit, MainUnit;

procedure TCntReplaceDlg.DoChanges;
  var i, sid: Integer;
      scnt, ecnt: Extended;
begin

  with FDQuery do
  begin

    SQL.Text := 'update IOTANKSHOSES set' +
      ' startcounter = :scnt, endcounter = :ecnt, state = ' + SS_CHANGED +
      ' where id = :id and state < ' + SS_CLOSED;

    with Params do
    begin
      Clear;
      with Add do
      begin
        Name := 'scnt';
        DataType := ftExtended;
        ParamType := ptInput;
      end;
      with Add do
      begin
        Name := 'ecnt';
        DataType := ftExtended;
        ParamType := ptInput;
      end;
      with Add do
      begin
        Name := 'id';
        DataType := ftInteger;
        ParamType := ptInput;
      end;
    end;

    for i := 0 to reccount - 1 do
    begin
      sid := records^[i].session_id;
      AddToLog(Format('Repl %d',[sid]));

        // recalulate All counters in spite of the data in records

        scnt := records^[i].prev_ecnt;
        ecnt := scnt + records^[i].outcome;
        if i < reccount - 1 then
        begin
          records^[i + 1].prev_ecnt := ecnt;
        end;

        ParamByName('scnt').AsExtended := scnt;
        ParamByName('ecnt').AsExtended := ecnt;
        ParamByName('id').AsInteger  := records^[i].id;

        prepare;
        execSQl;

    end;
  end;

  with FDQueryS do
  begin

    SQL.Text := 'update SESSIONS set' +
                ' state = ' + SS_CHANGED +
                ' where id = :id and state < ' + SS_CLOSED;

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

    for i := 0 to reccount - 1 do
    begin
      sid := records^[i].session_id;


      ParamByName('id').AsInteger  := sid;

      prepare;
      execSQl;
    end;
  end;

end;

// .............................................................................

procedure TCntReplaceDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

// .............................................................................

procedure TCntReplaceDlg.OKActionExecute(Sender: TObject);
  var
    msg: TMessage;
begin
  AddToLog('ReplCnt OK');

  if QIOTH.Transaction.Active then QIOTH.Transaction.Commit;

  QIOTH.Close;

  FDQuery.Transaction.StartTransaction;
  FDQuery.UpdateTransaction.StartTransaction;
  try

    DoChanges;

    FDQuery.Close;
    FDQuery.UpdateTransaction.Commit;
    FDQuery.Transaction.Commit;
    msg.Msg := WM_COUNTERS_CHANGED;
    MainForm.SendMsgs(msg);
  except
    on e: Exception do
    begin
      FDQuery.UpdateTransaction.Rollback;
      FDQuery.Transaction.Commit;
      AddToLog(e.Message);
    end;
  end;

end;

end.
