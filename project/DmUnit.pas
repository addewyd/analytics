unit DmUnit;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  Vcl.Forms,
  ErrorUnit;

  procedure ErrorMessageBox(f: TForm; msg: String);
  procedure ErrorMessageBox2(f: TForm; msg: array of String);
  function StrToextDef(s: String; d: Extended): Extended;

type
  TDM = class(TDataModule)
    imlist: TImageList;
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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddLogMsg(user_id: integer; msg: String);
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}



  procedure ErrorMessageBox(f: TForm; msg: String);
  begin
    ErrorForm := TErrorForm.Create(f);
    ErrorForm.Memo1.Lines.Add(msg);
    ErrorForm.ShowModal;
  end;

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
  begin
    Result := d;
    s := Trim(s);
    if s = '' then
    begin
      exit;
    end;

    try

      s := StringReplace(s, ',', '.', [rfReplaceAll]);
      result := StrToFloatDef(s, d);
    except
      //
    end;

  end;

procedure TDM.AddLogMsg(user_id: integer; msg: String);
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
