unit PrdictUnit;

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
  Vcl.ToolWin, JvToolBar, XBookComponent2, XLSBook2, XLSSheetData5,
  XLSReadWriteII5, Xc12DataStyleSheet5, XLSCellAreas5, XLSMergedCells5,
  Xc12Utils5, XBookSkin2;

type
  TPredictForm = class(TFormWithGrid)
    XLSSp: TXLSSpreadSheet;
    procedure RefreshActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    XLSSS: TXLSSpreadSheet;
  end;

var
  PredictForm: TPredictForm;

implementation

{$R *.dfm}

procedure TPredictForm.FormCreate(Sender: TObject);
var
  WS: TXLSWorksheet;
begin
  inherited;
  {
  XLSSS := TXLSSpreadSheet.Create(self);
  with XLSSS do
  begin
    align := TAlign.alClient;
    Visible := true;
    Options.View.Gridlines := true;
    Options.View.HorizontalScroll := true;
    Options.View.RowsColumns := true;
    Options.View.VerticalScroll := true;
    SkinStyle := TXBookSkinStyle.xssExcel2013;

  end;
  XLSSS.XLS.Version  := Xc12Utils5.xvExcel2007;
  }
  XLSSp.XLS.Clear(0);

  WS := XLSSp.XLS.Add();
  WS.Name := 'predict';
  WS.Visibility := Xc12Utils5.TXc12Visibility.x12vVisible;
//  WS.AsString[1,1] := 'text1';

end;

// .............................................................................

procedure TPredictForm.RefreshActionExecute(Sender: TObject);
begin
  //inherited;

end;

end.
