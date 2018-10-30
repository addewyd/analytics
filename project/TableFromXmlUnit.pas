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
  JvCheckBox, JvDateTimePicker, JvDBUltimGrid;

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
    FDUpdateSQL: TFDUpdateSQL;
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
    procedure JvDBGridEditChange(Sender: TObject);
    procedure JvDBGridCanEditCell(Grid: TJvDBGrid; Field: TField;
      var AllowEdit: Boolean);
    procedure JvDBGridExit(Sender: TObject);
    procedure JvDBGridColExit(Sender: TObject);
    procedure JvDSDataChange(Sender: TObject; Field: TField);
    procedure JvDSStateChange(Sender: TObject);
    procedure JvDSUpdateData(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SQLText: String;
    TableName: String;

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
  TableName := fname;
  JvFS.AppStoragePath := 'FS_' + fname;
end;

// .............................................................................

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
      wfilter := ' where azscode = '#$27 + azscode + #$27;
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

// .............................................................................

procedure TTableFromXmlForm.FormCreate(Sender: TObject);
begin
  inherited;
  MainMenu.Items[0].Caption := formname;
  JvDBCB01.ClearValue;

  if TableName = 'Tanks' then
  begin
    JvDBGrid.ReadOnly := false;

  end;

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

procedure TTableFromXmlForm.JvDBGridCanEditCell(Grid: TJvDBGrid; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
//ErrorMessageBox(self, 'caned');

end;

procedure TTableFromXmlForm.JvDBGridColExit(Sender: TObject);
begin
  inherited;
//  ErrorMessageBox(self, 'colexit');
end;

procedure TTableFromXmlForm.JvDBGridEditChange(Sender: TObject);
begin
  inherited;
//ErrorMessageBox(self, 'edichange');
end;

procedure TTableFromXmlForm.JvDBGridExit(Sender: TObject);
begin
  inherited;
//ErrorMessageBox(self, 'exit');

end;

procedure TTableFromXmlForm.JvDSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
//ErrorMessageBox(self, 'dch');
end;

procedure TTableFromXmlForm.JvDSStateChange(Sender: TObject);
begin
  inherited;
//ErrorMessageBox(self, 'stste');
end;

procedure TTableFromXmlForm.JvDSUpdateData(Sender: TObject);
begin
  inherited;
  if TableName = 'Tanks' then
  begin
    FDQuery.Transaction.StartTransaction;
  end;
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

procedure TTableFromXmlForm.RefreshActionExecute(Sender: TObject);
begin
  inherited;
      with FDQF01 do
      begin
        Transaction.StartTransaction;
        SQL.Text := 'select s.azscode as azscode from sessions s join '
          + TableName +
          ' t on s.id=t.session_id group by azscode';

        Open;
        Transaction.Commit;
      end;

  FilterAndShowData;
end;

end.
