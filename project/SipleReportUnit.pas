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
  JvAppRegistryStorage, JvComponentBase, JvFormPlacement;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SimpleReportDialog: TSimpleReportDialog;

//  'simplereport', srd.LookupAzs.LookupValue,
  //        srd.DateStartEdit.Date, srd.DateEndEdit.Date

implementation

{$R *.dfm}

procedure TSimpleReportDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

// .............................................................................

procedure TSimpleReportDialog.FormCreate(Sender: TObject);
begin
  FDQueryAZS.Transaction.StartTransaction;
  FDQueryAZS.Open;
  FDQueryAZS.Transaction. Commit;
end;

procedure TSimpleReportDialog.OkButtonClick(Sender: TObject);
begin
  //
end;

end.
