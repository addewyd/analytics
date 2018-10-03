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
    FDCH_r: TFDConnection;
  private
    { Private declarations }
  public
    { Public declarations }
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

end.
