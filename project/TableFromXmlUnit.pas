unit TableFromXmlUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormWithGridUnit, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  JvDataSource, System.ImageList, Vcl.ImgList, Vcl.Menus, System.Actions,
  Vcl.ActnList, JvFormPlacement, JvComponentBase, JvAppStorage,
  JvAppRegistryStorage, JvDBGridFooter, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, Vcl.ToolWin, JvToolBar,
  JvExControls, JvStaticText, Vcl.StdCtrls, JvExStdCtrls, JvCombobox,
  JvDBCombobox, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, JvDBLookup,
  JvCheckBox, JvDateTimePicker;

type
  TTableFromXmlForm = class(TFormWithGrid)
    JvPanel1: TJvPanel;
    JvDSF01: TJvDataSource;
    FDQF01: TFDQuery;
    JvStaticText1: TJvStaticText;
    JvDBCB01: TJvDBLookupCombo;
    JvCheckBox01: TJvCheckBox;
    JvDateStartP: TJvDateTimePicker;
    JvDateEndP: TJvDateTimePicker;
    JvCheckBox02: TJvCheckBox;
    JvCheckBox03: TJvCheckBox;
    procedure JvDBCB01Change(Sender: TObject);
    procedure JvCheckBox01Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure JvCheckBox02Click(Sender: TObject);
    procedure JvCheckBox03Click(Sender: TObject);
    procedure JvDateStartPChange(Sender: TObject);
    procedure JvDateEndPChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure JvFSBeforeRestorePlacement(Sender: TObject);
    procedure JvFSBeforeSavePlacement(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SQLText: String;
    procedure FilterAndShowData;
    constructor Create(pr: TComponent; fname: String); reintroduce; overload;

  end;

var
  TableFromXmlForm: TTableFromXmlForm;

implementation

{$R *.dfm}

uses ErrorUnit, DmUnit;

constructor TTableFromXmlForm.Create(pr: TComponent; fname: string);
begin
  inherited create(pr, fname);
  //MainMenu.Items[0].Caption := formname;
  JvFS.AppStoragePath := 'FS_' + fname;
end;


procedure TTableFromXmlForm.FilterAndShowData;
  var
    sqlf, wfilter, azscode, conj: string;
    sdt, edt: TdateTime;
begin

  sqlf := sqltext;

  if not JvDBCB01.Enabled then
  begin
    JvDBCB01.ClearValue;
    wfilter := '';
  end
  else
  begin
    if not (JvDBCB01.Text = '') then
    begin
      azscode := JvDBCB01.Text;
      wfilter := ' where azscode = ' + chr($27) + azscode + chr($27);
    end;
  end;

  if JvDateStartP.Enabled then
  begin
    sdt := JvDateStartP.DateTime;
    if wfilter = '' then conj := ' where '
    else conj := ' and ';

    wfilter := wfilter + conj + 'startdatetime >= timestamp'  + chr($27)
      + FormatDateTime('yyyy-mm-dd',sdt) + ' 00:00:00' + chr($27);

  end;

  if JvDateEndP.Enabled then
  begin
    edt := JvDateEndP.DateTime;
    if wfilter = '' then conj := ' where '
    else conj := ' and ';

    wfilter := wfilter + conj + 'enddatetime <= timestamp'  + chr($27)
      + FormatDateTime('yyyy-mm-dd',edt) + ' 23:59:59' + chr($27);

  end;

  sqlf := sqltext + wfilter;

  with FDQuery do
    begin
      Close;
      sql.Text := sqlf;
      Transaction.StartTransaction;
      Open();
  end;

end;

// .............................................................................

procedure TTableFromXmlForm.FormActivate(Sender: TObject);
begin
  inherited;
//  JvFS.RestoreFormPlacement;

end;

procedure TTableFromXmlForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  FDQF01.Transaction.Commit;
//  FDQuery.Transaction.Commit;
  //JvFS.SaveFormPlacement;
end;

procedure TTableFromXmlForm.FormCreate(Sender: TObject);
begin
  inherited;
  MainMenu.Items[0].Caption := formname;
  JvDBCB01.ClearValue;
end;

// .............................................................................

procedure TTableFromXmlForm.JvCheckBox01Click(Sender: TObject);
begin
  inherited;
  if not JvCheckBox01.Checked then JvDBCB01.ClearValue;
  JvDBCB01.Enabled := JvCheckBox01.Checked;

  FilterAndShowData();

end;

// .............................................................................

procedure TTableFromXmlForm.JvCheckBox02Click(Sender: TObject);
begin
  inherited;
  JvDateStartP.Enabled := JvCheckBox02.Checked;
  FilterAndShowData();
end;

// .............................................................................

procedure TTableFromXmlForm.JvCheckBox03Click(Sender: TObject);
begin
  inherited;
  JvDateEndP.Enabled := JvCheckBox03.Checked;
  FilterAndShowData();
end;

// .............................................................................

procedure TTableFromXmlForm.JvDateEndPChange(Sender: TObject);
begin
  inherited;
  FilterAndShowData();

end;

procedure TTableFromXmlForm.JvDateStartPChange(Sender: TObject);
begin
  inherited;
  FilterAndShowData();

end;

procedure TTableFromXmlForm.JvDBCB01Change(Sender: TObject);
begin
  inherited;
  FilterAndShowData();

end;

procedure TTableFromXmlForm.JvFSBeforeRestorePlacement(Sender: TObject);
begin
  inherited;
  //ErrorMessageBox(self, jvfs.AppStoragePath);

end;

procedure TTableFromXmlForm.JvFSBeforeSavePlacement(Sender: TObject);
begin
  inherited;
//  ErrorMessageBox(self, jvfs.AppStoragePath);

end;

end.
