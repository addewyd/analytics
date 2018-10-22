program Shrfs;

uses
  Vcl.Forms,
  Vcl.Dialogs,
  System.SysUtils,
  MainUnit in 'MainUnit.pas' {MainForm},
  AboutUnit in 'AboutUnit.pas' {AboutForm},
  ForFutureUseUnit in 'ForFutureUseUnit.pas' {ForFutureUseForm},
  DmUnit in 'DmUnit.pas' {DM: TDataModule},
  XmlParseUnit in 'XmlParseUnit.pas',
  ErrorUnit in 'ErrorUnit.pas' {ErrorForm},
  YNUnit in 'YNUnit.pas' {YNForm},
  BaseFormUnit1 in 'BaseFormUnit1.pas' {BaseForm},
  FormWithGridUnit in 'FormWithGridUnit.pas' {FormWithGrid},
  SessionListUnit in 'SessionListUnit.pas' {SessionListForm},
  MlogUnit in 'MlogUnit.pas' {MlogForm},
  StationsUnit in 'StationsUnit.pas' {StationsForm},
  TablesListUnit in 'TablesListUnit.pas' {TablesListForm},
  TableFromXmlUnit in 'TableFromXmlUnit.pas' {TableFromXmlForm},
  CatGSMUnit in 'CatGSMUnit.pas' {CatGSMForm},
  PartnersUnit in 'PartnersUnit.pas' {PartnersForm},
  CatItemsUnit in 'CatItemsUnit.pas' {CatItemsForm},
  SipleReportUnit in 'SipleReportUnit.pas' {SimpleReportDialog},
  SimpleReportUnit in 'SimpleReportUnit.pas' {SimpleReportForm},
  PaymentModesUnit in 'PaymentModesUnit.pas' {PaymentModesForm},
  HttpServiceUnit in 'HttpServiceUnit.pas',
  OptionsDialogUnit in 'OptionsDialogUnit.pas' {OptionsDialog},
  TabUnit in 'TabUnit.pas' {TabForm},
  SelectUserUnit in 'SelectUserUnit.pas' {SelectUser},
  WindowListUnit in 'WindowListUnit.pas' {WinListDlg},
  CntReplaceUnit in 'CntReplaceUnit.pas' {CntReplaceDlg},
  UsersUnit in 'UsersUnit.pas' {UsersForm},
  ViewLogUnit in 'ViewLogUnit.pas' {ViewLogForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  Application.Run;
    //
end.
