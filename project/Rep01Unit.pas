unit Rep01Unit;

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
  XLSReadWriteII5,
  XML.xmldom, XML.XMLIntf,
  XML.XMLDoc

  ;

type
  TRep01Form = class(TFormWithGrid)
    XLSSS: TXLSSpreadSheet;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    doc: TXMLDocument;
  public
    { Public declarations }
  end;

var
  Rep01Form: TRep01Form;

implementation

{$R *.dfm}

uses DmUnit, MainUnit;

procedure TRep01Form.FormCreate(Sender: TObject);
var
    WS0: TXLSWorksheet;
    OwnerDocument: IXMlDocument;
    inode: IXMLNode;
    nL, aN: IXMLNodeList;
    n :IXMLNode;
    c, k: Integer;
begin
  inherited;

  doc := TXMLDocument.Create(self);
  doc.LoadFromFile(Exepath + 'reports\rep.xml');
  inode := doc.DocumentElement;
  nL := Doc.ChildNodes;
  n := nL.FindNode('report');
  if n = nil then
  begin
    AddToLog('R00 node not found');
    // error
    Exit;
  end;

  nL := n.ChildNodes;

  if nL.Count < 1 then
  begin
    AddToLog(IntToStr(nL.Count));
    // error
    Exit;
  end;

//  nL := nL.Get(0).ChildNodes;

  for c := 0 to nL.Count - 1 do
  begin
    n := nL.Get(c);
    an := n.AttributeNodes;
    AddToLog(format('%s anc %d', [n.NodeName, an.Count] ));

    if n.NodeName = 'sheets' then // set of sheets
    begin
//      doSheets(n, XLSSS)
    end;
    if n.NodeName = 'sheet' then  //
    begin
//     doOneSheet(n, XLSSS);
    end;

    // test
    for k  := 0 to an.Count - 1 do
    begin
      AddToLog(
      an.Get(k).NodeName + ' ' + an.Get(k).NodeValue);
    end;


  end;


  with XLSSS.XLS do begin
    FileName := Exepath + '\reports\Repii.xlsx';
    CmdFormat.BeginEdit(Nil);
    CmdFormat.Fill.BackgroundColor.RGB := $7F7F10;
    CmdFormat.Font.Name := 'Courier new';
    CmdFormat.Font.Size := 5;
    CmdFormat.AddAsDefault('F0');

    DefaultFormat := CmdFormat.Defaults.Find('F0');
    WS0 := Items[0];
    WS0.AsString[0,0] := 'some text 1';
    WS0.Cell[0,0].CellColorRGB := $a0f101;
    WS0.Cell[0,0].FontColor := $a0f101;


  end;
end;

end.
