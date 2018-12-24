unit DmUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  Vcl.Forms,
  ErrorUnit, FireDAC.Phys.IBBase;

{$I 'consts.inc'}

  procedure ErrorMessageBox(f: TForm; msg: String);
  procedure ErrorMessageBox2(f: TForm; msg: array of String);
  function StrToextDef(s: String; d: Extended): Extended;

type
  TDM = class(TDataModule)
    FDQuery: TFDQuery;
    FDUpdateSQL: TFDUpdateSQL;
    FDCommand: TFDCommand;
    FDConnection: TFDConnection;
    FDTransaction: TFDTransaction;
    FDTransactionH_r: TFDTransaction;
    FDManager: TFDManager;
    FDQueryForINOUTGSM: TFDQuery;
    FDQueryForIOTANKSHOSES: TFDQuery;
    OptQuery: TFDQuery;
    FDTransactionUpd: TFDTransaction;
    LogQuery: TFDQuery;
    LogTran: TFDTransaction;
    LogTranUpd: TFDTransaction;
    FDQueryForInOutItems: TFDQuery;
    QUpdUId: TFDQuery;
    QuUpdTran: TFDTransaction;
    AddTanksProc: TFDStoredProc;
    DriverLink: TFDPhysFBDriverLink;
    FDQueryWP: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddLogMsg(user_id: integer; msg: String);
    procedure UpdUserId(tablename: String; sid: Integer);
  end;

var
  DM: TDM;

{$I 'sqls.inc'}

//  var IOGSQL, IOGSQLH, IOGSQLSUm: String;

implementation


{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MainUnit;

{$R *.dfm}



procedure ErrorMessageBox(f: TForm; msg: String);
begin
  ErrorForm := TErrorForm.Create(f);
  ErrorForm.Memo1.Lines.Add(msg);
  ErrorForm.ShowModal;
end;

// ...........................................................................

procedure ErrorMessageBox2(f: TForm; msg: array of String);
    var
      i: Integer;
begin
    ErrorForm := TErrorForm.Create(f);
    for i := 0 to Length(msg) - 1 do
    begin
      ErrorForm.Memo1.Lines.Add(msg[i]);
    end;
    ErrorForm.ShowModal;
end;

// .............................................................................

function StrToextDef(s: String; d: Extended): Extended;
    var
      ds: String;
  begin
    ds := FormatSettings.DecimalSeparator;
    Result := d;
    s := Trim(s);
    if s = '' then
    begin
      exit;
    end;

    try

      s := StringReplace(s, ',', ds, [rfReplaceAll]);
      s := StringReplace(s, '.', ds, [rfReplaceAll]);
      result := StrToFloatDef(s, d);
    except
      //
    end;

end;

// .............................................................................

procedure TDM.DataModuleCreate(Sender: TObject);
begin
//  in sqls.inc

{
  s :=
'select ' +
'   i.id,   ' +
'   s.id as session_id, ' +
'   s.azscode, ' +
'   a.extcode as azsextcode, ' +
'   iif( i.direction = 0,'+#$27'Расход'#$27+',' + #$27'Приход'#$27 +') as dir, ' +
'   cast(s.startdatetime as date) as sdate, ' +
'   c.name as clientname, ' +
'   c.code as clientcode, ' +
'   cn.nomer || ' + #$27' '#$27  + ' || cn.name as contract, ' +
'   p.name as paymentmode, ' +
'   p.code as paymentcode, ' +
'   w.name as fuelname, ' +
'   w.code as fuelcode, ' +
'   i.ei, ' +
'   i.volume, ' +
'   i.price, ' +

'   i.density,   ' +
'   round(volume * density / 1000,3) as mass, ' +
'   i.nds, ' +
'   round(amount * cast(nds as double precision) / ' +
'       (100+cast(nds as double precision)), 2) as sumnds, ' +
'   amount as whole, ' +
'   round(amount - amount * ' +
'      cast(nds as double precision) / ' +
'     (100+cast(nds as double precision)), 2) as amount0 ' +

'   from inoutgsm i ' +
'   join sessions s on s.id = i.session_id ' +
'   join wares w on w.code=i.ware_code ' +
'   join contragents c on c.code=i.client_code ' +
'   join contracts cn on cn.partner_code=c.code ' +
'   join paymentmodes p on p.code=i.payment_code ' +
'   join stations a on a.code=s.azscode ';


  IOGSQL := s +

 '     where /*s.startdatetime >= cast(:start_session_t as TIMESTAMP)*/ ' +
 '     s.id = :session_id ' +
 '     and i.azscode=:azscode ' +

 '  order by s.startdatetime, i.direction,paymentmode,clientname';

  IOGSQLH := s + ' where s.state = ' + SS_CLOSED
   + 'order by s.startdatetime, i.direction,paymentmode,clientname';


 IOGSQLSum := 'select sum(volume) as volume,sum(amount0) as amount0, ' +
    'sum(sumnds) as sumnds, sum(whole) as whole, sum(mass) as mass ' +
    ' from ( '  +
       IOGSQL +
       ')';
   //AddToLog(IOGSQL);
   }
end;

// .............................................................................

procedure TDM.UpdUserId(tablename: String; sid: Integer);
begin
  with QUpdUId do
  begin

    MacroByName('TABLE').AsRaw := tablename;

    ParamByName('lastuser_id').AsInteger := user_id;
    ParamByName('session_id').AsInteger := sid;
    //Transaction.StartTransaction;
    try

      Prepare;
      ExecSQL;
      //Transaction.Commit;
    except
      on e: Exception do
      begin
        //Transaction.Rollback;
        ErrorMessageBox(nil, e.Message);
        Raise;
      end;

    end;
  end;

end;

// .............................................................................

procedure TDM.AddLogMsg(user_id: integer; msg: String);
var
  m: TMessage;
  i: Integer;

begin
  with LogQuery do
  begin
    SQL.Text := 'insert into actionlog (adate, user_id, msg) ' +
                ' values ' +
                '(current_timestamp, :user_id, :msg)';
    with params do
    begin
      Clear;
      with add do
      begin
        Name := 'user_id';
        DataType := ftInteger;
        ParamType := ptInput;
      end;
      with add do
      begin
        Name := 'msg';
        DataType := ftString;
        ParamType := ptInput;
      end;
    end;
    ParamByName('user_id').AsInteger := user_id;
    ParamByName('msg').AsString := msg;
    Transaction.StartTransaction;
    UpdateTransaction.StartTransaction;
    try
      Prepare;
      ExecSQL;
      UpdateTransaction.Commit;
      Transaction.Commit;
      m.Msg := WM_LOGADDED;

  for i := 0 to MainForm.MdiChildCount -1 do
  begin
    MainForm.MDIChildren[i].WindowProc(m);
  end;
  TMessage(m).result := 1;

    except
      on e: Exception do
      begin
        UpdateTransaction.Rollback;
        Transaction.Rollback;
        ErrorMessageBox(nil, e.Message);
      end;

    end;

  end;
end;


end.
