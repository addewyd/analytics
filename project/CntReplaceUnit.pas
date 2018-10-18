unit CntReplaceUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvExControls, JvStaticText,
  JvExStdCtrls, JvMemo;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CntReplaceDlg: TCntReplaceDlg;

implementation

{$R *.dfm}

uses DmUnit;

procedure TCntReplaceDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

end.
