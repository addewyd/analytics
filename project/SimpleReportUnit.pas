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
{    zexmlss, zeodfs, zexmlssutils, zsspxml, zexlsx, zeZippy, zeZippyJCL7z,}
  XLSSheetData5, XLSReadWriteII5, XLSWriteXLSX5, Xc12Utils5,
XLSComment5, XLSDrawing5, Xc12DataStyleSheet5,
  XLSCmdFormat5, XPMan
;

type
  TSimpleReportForm = class(TFormWithGrid)
    ToXlsAction: TAction;
    XLS1: TMenuItem;
    ToolButton3: TToolButton;
    XLSRWII: TXLSReadWriteII5;
    procedure ToXlsActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
//    procedure FillSTyles(tzs: TZStyles);
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
{
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
}
// .............................................................................

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
    i, j: Integer;
    rname, ssdt, tmplname: String;
    dt: TDate;
    xw: TXLSWriteXLSX;
    s: TFileStream;
    X: TXLSReadWriteII5;
    WS0, WS1: TXLSWorksheet;
    WB: TXLSWorkbook;

begin
  inherited;
  rname := Exepath + '\reports\repSmAzsII.xlsx';
//  xw := TXLSWriteXLSX.Create(nil, nil);

  //X := TXLSReadWriteII5.Create(nil);

  with XLSRWII do
  begin
    Filename := Exepath + '\reports\Repii.xlsx';
//    WS1 := Add;
    WS0 := Items[0];
//    WS0.Name := 'list 1';
//    WS1.Name := 'list 2';


  CmdFormat.BeginEdit(Nil);
  CmdFormat.Fill.BackgroundColor.RGB := $7F7F10;
  CmdFormat.Font.Name := 'Courier new';
  CmdFormat.AddAsDefault('F1');

  // Create second default format.
  CmdFormat.BeginEdit(Nil);
  CmdFormat.Fill.BackgroundColor.RGB := $FF1010;
  CmdFormat.Font.Name := 'Ariel Black';
  CmdFormat.Border.Color.IndexColor := xcBlack;
  CmdFormat.Border.Style := cbsThick;
  CmdFormat.Border.Preset(cbspOutline);
  CmdFormat.AddAsDefault('F2');


DefaultFormat := CmdFormat.Defaults.Find('F1');
    WS0.AsString[0,0] := 'some text 1';
    WS0.AsString[1,1] := 'some text 2';
DefaultFormat := CmdFormat.Defaults.Find('F2');

    WS0.AsString[2,1] := 'anothertext';
    WS0.AsString[2,2] := 'ya str';

    WS0.Columns[1].Width := 23 * 256;
    WS0.Columns[0].Width := 32 * 256;

    WS0.Cell[1,1].CellColorRGB := $a0a0f0;
    WS0.Cell[2,1].CellColorRGB := $a0f101;

    WS0.Cell[0,0].CellColorRGB := $a0f101;
    WS0.Cell[0,0].FontColor := $a0f101;

  // Create third default format.
  CmdFormat.BeginEdit(Nil);
  CmdFormat.Fill.BackgroundColor.RGB := $10F040;
  CmdFormat.Font.Name := 'Times New Roman';
  CmdFormat.Font.Style := [xfsBold,xfsItalic];
  CmdFormat.AddAsDefault('F3');

DefaultFormat := CmdFormat.Defaults.Find('F3');
    WS0.AsiNTEGER[3,3] := 125;
    WS0.AsiNTEGER[3,4] := 1125;

    AddToLog(Format('x: %d',[count]));

    Write;
  end;


end;

end.
