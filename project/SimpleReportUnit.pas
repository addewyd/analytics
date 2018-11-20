unit SimpleReportUnit;

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
  JvDBUltimGrid,
    zexmlss, zeodfs, zexmlssutils, zsspxml, zexlsx, zeZippy, zeZippyJCL7z
;

type
  TSimpleReportForm = class(TFormWithGrid)
    ToXlsAction: TAction;
    XLS1: TMenuItem;
    ToolButton3: TToolButton;
    procedure ToXlsActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure FillSTyles(tzs: TZStyles);
  public
    { Public declarations }
    azscode: String;
    sdt, edt: TDate;
    constructor Create(pr: TComponent; fname, _AzsCode: String;
      _sdt, _edt: TDate); reintroduce; overload;

  end;

var
  SimpleReportForm: TSimpleReportForm;

implementation

{$R *.dfm}

uses ErrorUnit, DmUnit, MainUnit;

constructor TSimpleReportForm.Create(pr: TComponent; fname, _AzsCode: String;
      _sdt, _edt: TDate);
begin
  inherited create(pr, fname);
  azscode := _azscode;
  sdt := _sdt;
  edt := _edt;
end;

// .............................................................................
procedure TSimpleReportForm.FillSTyles(tzs: TZStyles);
  var
    i: Integer;
begin
  tzs.Count := 10;

  with tzs[0] do
  begin
      Font.Size := 20;
      Font.Style := [fsBold];
      Font.Name := 'Tahoma';
      BGColor := $CCFFCC;
      CellPattern := ZPSolid;
      Alignment.Horizontal := ZHCenter;
      Alignment.Vertical := ZVCenter;
      Alignment.WrapText := true;
  end;
  with tzs[0] do
  begin
      Border[0].Weight := 1;
      Border[0].LineStyle := ZEContinuous;
      for i := 1 to 3 do Border[i].Assign(Border[0]);

  end;
end;

procedure TSimpleReportForm.FormCreate(Sender: TObject);
begin
  inherited;
//  ErrorMessageBox(self, azscode);
  JvStatusBar1.Panels[0].Text := 'ÀÇÑ ' + azscode;
  JvStatusBar1.Panels[1].Text := FormatDateTime('dd.mm.yyyy',sdt);
  JvStatusBar1.Panels[2].Text := FormatDateTime('dd.mm.yyyy',edt);
  with FDQuery do
  begin
    with Params do
    begin
      Clear;
      with Add do
      begin
        Name := 'azscode';
        DataType := ftString;
        ParamType := ptInput;
      end;
      with Add do
      begin
        Name := 'sdt';
        DataType := ftString;
        ParamType := ptInput;
      end;
      with Add do
      begin
        Name := 'edt';
        DataType := ftString;
        ParamType := ptInput;
      end;
    end;
    ParamByName('azscode').AsString := azscode;
    ParamByName('sdt').AsString := FormatDateTime('yyyy-mm-dd', sdt) + ' 00:00:00';
    ParamByName('edt').AsString := FormatDateTime('yyyy-mm-dd', edt) + ' 23:59:59';
    Transaction.StartTransaction;
    Prepare;
    Open;
  end;
end;

// .............................................................................

procedure TSimpleReportForm.ToXlsActionExecute(Sender: TObject);
  var
    tz: TZEXMLSS;
    i, j: Integer;
    rname, ssdt: String;
    dt: TDate;
begin
  inherited;
  tz := TZEXMLSS.Create(nil);
  FillStyles(tz.Styles);
  ssdt := DateToStr(sdt)+'-'+DateToStr(edt);

  rname := Exepath + 'reports\rep' + ssdt + '.xlsx';

  dt := sdt;

  try
    tz.Sheets.Count := 1;
    tz.Sheets[0].Title := 'report';
    with tz.Sheets[0] do
    begin
      j := 3;
      RowCount := 40;
      ColCount := 30;
      while dt < edt  do
      begin
        Cell[2, j].CellType := ZEDateTime;
        Cell[2, j].CellStyle := 0;
        Cell[2, j].Data := DateToStr(dt);

        dt := dt + 1;
        j := j + 1;
        if j > 30 then break;

      end;


    end;

    ExportXmlssToXLSX(tz, rname, [], [], nil, 'UTF-8');
  finally
    tz.free();
  end;
end;

end.
