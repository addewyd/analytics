unit OptionsDialogUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit,
  JvExControls, JvStaticText, JvCheckBox, Registry;

type
  TOptionsDialog = class(TForm)
    OkButton: TButton;
    CancelButton: TButton;
    JvStaticText1: TJvStaticText;
    DBLocEdit: TJvEdit;
    JvStaticText2: TJvStaticText;
    HostEdit: TJvEdit;
    JvCheckBox1: TJvCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvCheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OptionsDialog: TOptionsDialog;

implementation

{$R *.dfm}

uses DmUnit;

procedure TOptionsDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TOptionsDialog.JvCheckBox1Click(Sender: TObject);
var
  reg: TregIniFile;
  host: string;
begin
  try
    reg := TregIniFile.Create('Software\Shrfs');
    try

      if JvCheckBox1.Checked then
      begin
        HostEdit.Enabled := false;
        HostEdit.Text := 'local';
      end
      else
      begin
        host := reg.ReadString('options', 'host', 'localhost');
        HostEdit.Text := host;
        HostEdit.Enabled := true;
      end;
    finally
      reg.Free;
    end;
  except
    on e: Exception do
      ErrorMessageBox(self, e.message);
  end;
end;

end.
