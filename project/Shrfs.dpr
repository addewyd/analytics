program Shrfs;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  AboutUnit in 'AboutUnit.pas' {AboutForm},
  ForFutureUseUnit in 'ForFutureUseUnit.pas' {ForFutureUseForm},
  DmUnit in 'DmUnit.pas' {DM: TDataModule},
  XmlParseUnit in 'XmlParseUnit.pas',
  ErrorUnit in 'ErrorUnit.pas' {ErrorForm},
  YNUnit in 'YNUnit.pas' {YNForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
