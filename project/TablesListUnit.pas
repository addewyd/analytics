unit TablesListUnit;

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
  JvDBGrid, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, Vcl.ToolWin, JvToolBar;

type
  TTablesListForm = class(TFormWithGrid)
    procedure JvDBGridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TablesListForm: TTablesListForm;

implementation

{$R *.dfm}

uses DmUnit, ErrorUnit, MainUnit, TableFromXmlUnit;

procedure TTablesListForm.FormCreate(Sender: TObject);
begin
  inherited;
  MainMenu.Items[0].Caption := formname;
  with FDQuery do
    begin
    Transaction.StartTransaction;
    try
      Open;
      FetchAll;
      Transaction.Commit;
    except
      on e: exception do
      begin
        Transaction.Rollback;
        ErrorMessageBox(self, e.message);
      end;
    end;
  end;
end;

// .............................................................................

procedure TTablesListForm.JvDBGridDblClick(Sender: TObject);
var
  grid: TJvDBGrid;
  r: integer;
  s: String;
  tt: TTableFromXmlForm;

  wfieldlist: TStringList;

begin
  inherited;
  grid := Sender as TJvDBGrid;
  s := grid.DataSource.DataSet.FieldByName('TABLENAME').AsString;
  if not MainForm.isWinOpen(s) then
  begin

    wfieldlist := TStringList.Create;
    try

      wfieldlist.Add('azscode');
      wfieldlist.Add('sessionnum');
      wfieldlist.Add('startdatetime');

      if s = 'OutcomesByRetail' then
      begin
        wfieldlist.Add('tanknum');
      end;


      tt := TTableFromXmlForm.Create(MainForm, s);
      tt.JvFS.AppStoragePath := 'FS_' + s;

      tt.Caption := s;

      for r  := 0 to wfieldlist.Count - 1 do
      begin
        tt.JvDBGrid.Columns.Add;
        tt.JvDBGrid.Columns[r].FieldName := wfieldlist[r];
      end;

//      JvFS.RestoreFormPlacement;

      with tt.FDQF01 do
      begin

        Connection := DM.FDConnection;
        Transaction := DM.FDTransaction;// .FDT01;
//        Transaction.Connection := DM.FDConnection;
        Transaction.StartTransaction;

        SQL.Text := 'select s.azscode as azscode, startdatetime from sessions s join ' + s +
          ' t on s.id=t.session_id group by azscode, startdatetime';

        Open;
//        First;
        Transaction.Commit;
      end;

      with tt.FDQuery do
      begin
        Connection := DM.FDConnection;
        Transaction := DM.FDTransaction;

        SQL.Text := 'select t.id, '
          + wfieldlist.CommaText
          + ' from sessions s join '
          + s + ' t on s.id = t.session_id';

        tt.SQLText := SQL.Text;

        Transaction.StartTransaction;
        // try
        Open;
        Transaction.Commit;
        // Except
        // Transaction.Rollback;
        // end;
      end;
    finally
      wfieldlist.Free;
    end;

  end
  else
    MainForm.GetMDIForm(s).Show;
end;

end.
