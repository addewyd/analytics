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
  JvCheckBox;

type
  TTableFromXmlForm = class(TFormWithGrid)
    JvPanel1: TJvPanel;
    JvDSF01: TJvDataSource;
    FDQF01: TFDQuery;
    JvStaticText1: TJvStaticText;
    FDT01: TFDTransaction;
    JvDBCB01: TJvDBLookupCombo;
    JvCheckBox01: TJvCheckBox;
    procedure JvDBCB01Change(Sender: TObject);
    procedure JvCheckBox01Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SQLText: String;

  end;

var
  TableFromXmlForm: TTableFromXmlForm;

implementation

{$R *.dfm}

procedure TTableFromXmlForm.JvCheckBox01Click(Sender: TObject);
begin
  inherited;
  if not JvCheckBox01.Checked then JvDBCB01.ClearValue;

  JvDBCB01.Enabled := JvCheckBox01.Checked;

  if not JvDBCB01.Enabled then
  begin
    JvDBCB01.ClearValue;
    with FDQuery do
    begin
      Close;
      SQL.BeginUpdate;
      try
        SQL.Clear;
        SQL.Add(SqlText);
      finally
        SQL.EndUpdate;
      end;

      Transaction.StartTransaction;
      Open();
      JvDBGrid.Refresh;
      //Transaction.Commit;
    end;
  end;


end;

procedure TTableFromXmlForm.JvDBCB01Change(Sender: TObject);
  var
    wfilter, azscode: string;
begin
  inherited;

  if JvDBCB01.Enabled then
  begin
    if not (JvDBCB01.Text = '') then
    begin

      azscode := JvDBCB01.Text;
      wfilter := ' where azscode = ' + chr($27) + azscode + chr($27);

      with FDQuery do
      begin
        Close;
        SQL.BeginUpdate;
        try
          SQL.Clear;
          SQL.Add(SQLText);
          SQL.Add(wfilter);
        finally
          SQL.EndUpdate;
        end;
        Transaction.StartTransaction;
        Open();
        JvDBGrid.Refresh;
        //Transaction.Commit;
      end;

    end;

  end;

end;

end.
