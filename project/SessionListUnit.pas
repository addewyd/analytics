unit SessionListUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DmUnit, FormWithGridUnit, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  JvDataSource, System.ImageList, Vcl.ImgList, Vcl.Menus, System.Actions,
  Vcl.ActnList, JvFormPlacement, JvComponentBase, JvAppStorage,
  JvAppRegistryStorage, JvDBGridFooter, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, Vcl.ToolWin, JvToolBar,
  JvDBUltimGrid;

type
  TSessionListForm = class(TFormWithGrid)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SessionListForm: TSessionListForm;

implementation

{$R *.dfm}

procedure TSessionListForm.FormCreate(Sender: TObject);
begin
  inherited;
  //MainMenu.Items[0].Caption := formname;

  with FDQuery do
  begin
//    Connection := DM.FDConnection;
//    Transaction := DM.FDConnection.Transaction;
    Transaction.StartTransaction;
    try
//      SQL.Text := 'select azscode, sessionnum, startdatetime, username from sessions';
      Open;
      FetchAll;
      Transaction.Commit;
    except
      Transaction.Rollback;
    end;
  end;
end;

end.
