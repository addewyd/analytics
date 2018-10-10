unit TabUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseFormUnit1, System.ImageList,
  Vcl.ImgList, Vcl.Menus, System.Actions, Vcl.ActnList, JvFormPlacement,
  JvComponentBase, JvAppStorage, JvAppRegistryStorage, Vcl.ComCtrls,
  JvExComCtrls, JvStatusBar, Vcl.ToolWin, JvToolBar, JvComCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TTabForm = class(TBaseForm)
    Pages: TJvPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GridInOutGSM: TJvDBGrid;
    DSInOut: TJvDataSource;
    QueryInOut: TFDQuery;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TabForm: TTabForm;

implementation

{$R *.dfm}

uses DmUnit;

procedure TTabForm.FormCreate(Sender: TObject);
begin
  inherited;
  with QueryInOut do
  begin
    Transaction.StartTransaction;
    try
      Open;
      Transaction.Commit;
    except
      Transaction.Rollback;
    end;
  end;

end;

end.
