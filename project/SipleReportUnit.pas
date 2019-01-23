unit SipleReportUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvStaticText, Vcl.Mask,
  JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit,
  Vcl.StdCtrls, JvExStdCtrls, JvEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, JvDBLookup, Data.DB,
  JvDataSource, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvAppStorage,
  JvAppRegistryStorage, JvComponentBase, JvFormPlacement, JvDialogs;

type
  TSimpleReportDialog = class(TForm)
    DateStartEdit: TJvDatePickerEdit;
    DateEndEdit: TJvDatePickerEdit;
    JvStaticText1: TJvStaticText;
    JvStaticText2: TJvStaticText;
    JvStaticText3: TJvStaticText;
    OkButton: TButton;
    CancelButton: TButton;
    FDQueryAZS: TFDQuery;
    DSAzs: TJvDataSource;
    LookupAzs: TJvDBLookupEdit;
    FormStorage: TJvFormStorage;
    AppStorage: TJvAppRegistryStorage;
    OpenDialog: TJvOpenDialog;
    RepFileButton: TButton;
    repfiletext: TJvStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RepFileButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    repfile: String;
  end;

var
  SimpleReportDialog: TSimpleReportDialog;

//  'simplereport', srd.LookupAzs.LookupValue,
  //        srd.DateStartEdit.Date, srd.DateEndEdit.Date

implementation

{$R *.dfm}

function splt(s: String) : String;
begin
  result := s;
  if Length(s) > 40 then
  begin
    Result := Copy(s, 1, 40) + #13#10 + Copy(s, 41);
  end;

end;

procedure TSimpleReportDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

// .............................................................................

procedure TSimpleReportDialog.FormCreate(Sender: TObject);
  var
    a: String;
begin
// restore opendialog.filename
  a := FormStorage.ReadString('azscode', '');
  repfile := FormStorage.ReadString('repfile', '');
  repfiletext.Caption := splt(repfile);
  FDQueryAZS.Transaction.StartTransaction;
  FDQueryAZS.Open;
  FDQueryAZS.Locate('azscode', a);
  LookUpAZS.Text := FDQueryAZS.FieldByName('cn').AsString;
  FDQueryAZS.Transaction. Commit;
end;

// .............................................................................

procedure TSimpleReportDialog.OkButtonClick(Sender: TObject);
begin
  FormStorage.WriteString('azscode', LookupAzs.LookupValue);
end;

// .............................................................................

procedure TSimpleReportDialog.RepFileButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute() then
  begin
    repfile := OpenDialog.FileName;
    FormStorage.WriteString('repfile', repfile);

    repfiletext.Caption := splt(repfile);

  end;
end;

end.
