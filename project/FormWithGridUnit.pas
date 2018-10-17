unit FormWithGridUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseFormUnit1, Data.DB, JvDBGridFooter,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, System.ImageList, Vcl.ImgList,
  Vcl.Menus, System.Actions, Vcl.ActnList, JvFormPlacement, JvComponentBase,
  JvAppStorage, JvAppRegistryStorage, Vcl.ComCtrls, JvExComCtrls, JvStatusBar,
  Vcl.ToolWin, JvToolBar, JvDataSource, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, JvDBUltimGrid;

type
  TFormWithGrid = class(TBaseForm)
    JvDBGridFooter: TJvDBGridFooter;
    JvDS: TJvDataSource;
    FDQuery: TFDQuery;
    RefreshAction: TAction;
    N1: TMenuItem;
    ToolButton2: TToolButton;
    JvDBGrid: TJvDBUltimGrid;
    Trans: TFDTransaction;
    TransUPD: TFDTransaction;
    procedure RefreshActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadData;
  end;

var
  FormWithGrid: TFormWithGrid;

implementation

{$R *.dfm}

uses DmUnit;

procedure TFormWithGrid.FormCreate(Sender: TObject);
begin
  inherited;
//  LoadData;
end;

procedure TFormWithGrid.LoadData;
begin

  with FDQuery do
  begin
  {
    if Connection.Connected then
    begin
      Connection.Close;
    end;
    Connection.Open;
 }
    if Active then
    begin
      Close;
    end;

    Transaction.StartTransaction;
    try
      Open;
      FetchAll;
      Transaction.Commit;
    except
      Transaction.Rollback;
    end;
  end;

end;


// .............................................................................

procedure TFormWithGrid.RefreshActionExecute(Sender: TObject);
begin
  inherited;

  LoadData;
end;

end.
