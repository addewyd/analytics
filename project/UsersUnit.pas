unit UsersUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormWithGridUnit, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  JvDataSource, System.ImageList, Vcl.ImgList, Vcl.Menus, System.Actions,
  Vcl.ActnList, JvFormPlacement, JvComponentBase, JvAppStorage,
  JvAppRegistryStorage, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, JvDBGridFooter, Vcl.ComCtrls, JvExComCtrls, JvStatusBar,
  Vcl.ToolWin, JvToolBar;

type
  TUsersForm = class(TFormWithGrid)
    ToolButton3: TToolButton;
    CommitAction: TAction;
    UpdateSQL: TFDUpdateSQL;
    FDQueryID: TIntegerField;
    FDQueryLOGIN: TWideStringField;
    FDQueryPASSWORD: TWideStringField;
    FDQueryFIO: TWideStringField;
    FDQueryROLE: TIntegerField;
    FDQueryEMAIL: TWideStringField;
    FDQueryCONSTANT: TWideStringField;
    procedure CommitActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UsersForm: TUsersForm;

implementation

{$R *.dfm}

uses DmUnit;

procedure TUsersForm.CommitActionExecute(Sender: TObject);
begin
  inherited;

  with FDQuery do
  begin
    UpdateTransaction.StartTransaction;
    try
//      Post;
      ApplyUpdates;
      UpdateTransaction.Commit;
    except
      on e: exception do
      begin
        UpdateTransaction.Rollback;
        ErrorMessageBox(self, e.message);
      end;
    end;
  end;

end;

// .............................................................................

procedure TUsersForm.FormCreate(Sender: TObject);
begin
  inherited;
  FDQuery.Transaction.StartTransaction;
  try
    FDQuery.Open;
  finally
     //
  end;
end;

// .............................................................................

procedure TUsersForm.RefreshActionExecute(Sender: TObject);
begin
  inherited;
  if FDQuery.UpdateTransaction.Active then FDQuery.UpdateTransaction.RollBack;
  if FDQuery.Transaction.Active then FDQuery.Transaction.RollBack;


end;

end.
