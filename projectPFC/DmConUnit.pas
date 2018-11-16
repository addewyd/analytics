unit DmConUnit;

interface

uses
  System.SysUtils,
  System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  Vcl.Forms,
  FireDAC.Phys.IBBase;

type
  TDM = class(TDataModule)
    FDQuery: TFDQuery;
    FDConnection: TFDConnection;
    FDTransaction: TFDTransaction;
    FDTransactionUpd: TFDTransaction;
    FDUpdateSQL: TFDUpdateSQL;
    FDCommand: TFDCommand;
    FDManager: TFDManager;
    OptQuery: TFDQuery;
    LogQuery: TFDQuery;
    LogTran: TFDTransaction;
    LogTranUpd: TFDTransaction;

    AddTanksProc: TFDStoredProc;
    DriverLink: TFDPhysFBDriverLink;
    FDQueryWP: TFDQuery;
    FDQueryForINOUTGSM: TFDQuery;
    FDQueryForIOTANKSHOSES: TFDQuery;
    FDQueryForInOutItems: TFDQuery;
    QUpdUId: TFDQuery;
    QuUpdTran: TFDTransaction;

  public
    procedure UpdUserId(tablename: String; sid: Integer);
    constructor Create(pr: TComponent); reintroduce; overload;

  end;

procedure AddToLog(msg: String);
function StrToextDef(s: String; d: Extended): Extended;

var
  DM: TDM;
  CurrentFile: String;
  user_id: Integer;
  ordersLoaded: Integer;
  move_orders: Boolean;

  embed: Boolean;
  dbname, db_user, db_pass, host, clientdll: String;
  dbport: Integer;

implementation

{$R ..\project\DmUnit.dfm}

constructor TDM.Create(pr: TComponent);
begin

  inherited Create(pr);

  dbname := 'C:\Users\user\Documents\topaz\analytics\project\Win32\D' +
    'ebug\db\SHRFSPS.FDB';
  clientdll := 'C:\Program Files\Firebird\Firebird_2_5\WOW64\fbclient.dll';
  embed := false;
  db_user := 'SYSDBA';
  db_pass := 'electro';
  host := 'localhost';
  dbport := 3050;

  FDConnection.DriverName := 'FB';

  FDConnection.Transaction := FDTransaction;
  FDConnection.UpdateTransaction := FDTransactionUpd;

  with FDConnection.Params do
  begin
    Clear;
    Add('Database=' + dbname);
    Add('DriverID=FB');
    if embed then
      Add('Protocol=Local')
    else
      Add('Protocol=TCPIP');
    Add('User_Name=' + db_user);
    Add('Password=' + db_pass);
    Add('SQLDialect=3');
    Add(format('port=%d', [dbport]));
    if embed then
      Add('Server=')
    else
      Add('server=' + host);
    Add('CharacterSet=UTF8');
    // Add('lc_ctype=UTF8');
    DriverLink.VendorLib := clientdll;
    DriverLink.DriverID := 'FB';
  end;

end;

procedure AddToLog(msg: String);
begin
  Writeln(msg);
end;

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
    Result := StrToFloatDef(s, d);
  except
    //
  end;

end;

procedure TDM.UpdUserId(tablename: String; sid: Integer);
begin
  with QUpdUId do
  begin

    MacroByName('TABLE').AsRaw := tablename;

    ParamByName('lastuser_id').AsInteger := user_id;
    ParamByName('session_id').AsInteger := sid;
    // Transaction.StartTransaction;
    try

      Prepare;
      ExecSQL;
      // Transaction.Commit;
    except
      on e: Exception do
      begin
        // Transaction.Rollback;
        AddToLog(e.Message);
        Raise;
      end;

    end;
  end;

end;

end.
