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

{$I 'consts.inc'}

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
  protected
    procedure sessionadded(var Msg: TMessage); message WM_SESSION_ADDED;
    procedure connreopen(var Msg: TMessage); message WM_CONN_REOPEN;

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

// .............................................................................

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
      on e: Exception do
      begin
        Transaction.Rollback;
        ErrorMessageBox(self, 'FWGU: ' + e.Message);
      end;
    end;
  end;

end;


// .............................................................................

procedure TFormWithGrid.sessionadded(var Msg: TMessage);
begin
  LoadData;

end;

// .............................................................................

procedure TFormWithGrid.RefreshActionExecute(Sender: TObject);
begin
  inherited;
  LoadData;
end;

// .............................................................................

procedure TFormWithGrid.connreopen(var Msg: TMessage);
begin
  LoadData;
end;


end.
