unit WindowListUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TWinListDlg = class(TForm)
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WinListDlg: TWinListDlg;

implementation

{$R *.dfm}

procedure TWinListDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
