unit ErrorUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TErrorForm = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ErrorForm: TErrorForm;

implementation

{$R *.dfm}

procedure TErrorForm.Button1Click(Sender: TObject);
begin
  Close;
end;

// ............................................................................

procedure TErrorForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

end.
