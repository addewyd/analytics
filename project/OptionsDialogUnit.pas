unit OptionsDialogUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit,
  JvExControls, JvStaticText, JvCheckBox, Registry, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvItemsPanel, JvMemo, JvHtControls, JvPanel, Vcl.Mask,
  JvExMask, JvSpin;

type
  TOptionsDialog = class(TForm)
    OkButton: TButton;
    CancelButton: TButton;
    JvPanel1: TJvPanel;
    DBLocEdit: TJvEdit;
    JvStaticText2: TJvStaticText;
    HostEdit: TJvEdit;
    JvCheckBox1: TJvCheckBox;
    JvStaticText1: TJvStaticText;
    JvPanel2: TJvPanel;
    HTTPCheckBox: TJvCheckBox;
    JvStaticText3: TJvStaticText;
    IPAMemo: TMemo;
    JvStaticText4: TJvStaticText;
    JvPanel3: TJvPanel;
    UserNameText: TJvStaticText;
    JvStaticText5: TJvStaticText;
    LscEdit: TJvSpinEdit;
    JvStaticText6: TJvStaticText;
    AzsEdit: TJvEdit;
    SePanel: TJvPanel;
    JvStaticText7: TJvStaticText;
    JvStaticText8: TJvStaticText;
    dbuSEReDIT: TJvEdit;
    dbpASSeDIT: TJvEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvCheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OptionsDialog: TOptionsDialog;

implementation

{$R *.dfm}

uses DmUnit, MainUnit;

procedure TOptionsDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TOptionsDialog.FormCreate(Sender: TObject);
begin
//
  if user_role = 1 then // admin role
  begin
    SePanel.Visible := true;
  end;
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
