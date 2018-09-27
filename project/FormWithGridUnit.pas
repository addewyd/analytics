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
  FireDAC.Comp.Client;

type
  TFormWithGrid = class(TBaseForm)
    JvDBGrid: TJvDBGrid;
    JvDBGridFooter: TJvDBGridFooter;
    JvDS: TJvDataSource;
    FDQuery: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormWithGrid: TFormWithGrid;

implementation

{$R *.dfm}

end.
