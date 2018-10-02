unit OptionsDialogUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit,
  JvExControls, JvStaticText;

type
  TOptionsDialog = class(TForm)
    OkButton: TButton;
    CancelButton: TButton;
    JvStaticText1: TJvStaticText;
    JvEdit1: TJvEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OptionsDialog: TOptionsDialog;

implementation

{$R *.dfm}

procedure TOptionsDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
