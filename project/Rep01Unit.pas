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
    SaveAction: TAction;
    ToolButton3: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure SaveActionExecute(Sender: TObject);
  private
    { Private declarations }
    doc: TXMLDocument;
    procedure doSheets(n :IXMLNode; XS:TXLSSpreadSheet);
    procedure doOneSheet(n :IXMLNode; XS:TXLSSpreadSheet);
    procedure doSheetData(n :IXMLNode; XS:TXLSSpreadSheet; sheetname, columnparam: String);
  public
    { Public declarations }
  end;

var
  Rep01Form: TRep01Form;

implementation

{$R *.dfm}

uses DmUnit, MainUnit;

procedure TRep01Form.doSheets(n :IXMLNode; XS:TXLSSpreadSheet);
  var
    aN: IXMLNodeList;
    k: Integer;
    s, sheetname, columnparam: String;
begin
  // sql
  an := n.AttributeNodes;
  for k := 0 to an.Count - 1 do
  begin
    if an.Get(k).NodeName = 'sql' then
    begin
      s := an.Get(k).NodeValue;
      with FDQuery do
      begin
        sql.Text := s;
        Transaction.StartTransaction;
        Prepare;
        Open;
        while not Eof do
        begin
          sheetname := FieldByName('sheetname').AsString;
          columnparam := FieldByName('columnparam').AsString;
          doSheetData(n, XS, sheetname, columnparam);
          Next;

        end;
      end;
    end;
  end;

end;

// .............................................................................

procedure TRep01Form.doSheetData(n :IXMLNode; XS:TXLSSpreadSheet; sheetname, columnparam: String);
  var
    WS: TXLSWorksheet;
begin
  addToLog('cp ' + columnparam);
  WS := XS.XLS.Add;
  WS.Name := sheetname + ' (' +inttostr(XS.XLS.Count) + ')';
end;

// .............................................................................

procedure TRep01Form.doOneSheet(n :IXMLNode; XS:TXLSSpreadSheet);
  var
    sheetname, columnparam: String;
begin
  // name
  sheetname := '';
  if n.HasAttribute('name') then
    sheetname := n.Attributes['name'];
  columnparam := ''; // no restrict data by sheet param
  // name := attr name
  if sheetname <> '' then
    doSheetData(n, XS, sheetname, columnparam);
end;

// .............................................................................

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

  // ...........................................
  with XLSSS.XLS do begin
    Clear(0);
    FileName := Exepath + '\reports\Repii.xlsx';

    WS0 := Add; // Items[0];
    WS0.Name := 'TEST';

    CmdFormat.BeginEdit(Nil);
    CmdFormat.Fill.BackgroundColor.RGB := $FF0000;
    CmdFormat.Font.Name := 'Courier new';
    CmdFormat.Font.Size := 5;
    CmdFormat.AddAsDefault('F0');

    CmdFormat.BeginEdit(Nil);
    CmdFormat.Fill.BackgroundColor.RGB := $00FF00;
    CmdFormat.Font.Name := 'Tahoma';
    CmdFormat.AddAsDefault('F1');

    CmdFormat.BeginEdit(Nil);
    CmdFormat.Fill.BackgroundColor.RGB := $FFFF00;
    CmdFormat.Font.Name := 'Arial';
    CmdFormat.AddAsDefault('F2');

    DefaultFormat := CmdFormat.Defaults.Find('F0');


    DefaultFormat := CmdFormat.Defaults.Find('F1');

    WS0.AsString[1,1] := 'ƒата';

    WS0.AsString[1,3] := '01 ќкт€брь 18';
    WS0.AsString[1,4] := '02 ќкт€брь 18';
    WS0.AsString[1,5] := '03 ќкт€брь 18';

    WS0.AsString[2,1] := 'ќбъЄм';

    WS0.AsString[2,3] := '123.11';
    WS0.AsString[2,4] := '556.34';
    WS0.AsString[2,5] := '3488.01';

    WS0.Columns[1].Width := 20 * 256;

    DefaultFormat := CmdFormat.Defaults.Find('F0');
    WS0.AsString[0,0] := ' ';
    WS0.Cell[0,0].CellColorRGB := $FF;
    WS0.Cell[0,0].FontColor := $FF;
    WS0.Cell[0,0].FontSize := 5;

    WS0.AsString[1,0] := ' ';
    WS0.Cell[1,0].CellColorRGB := $FFFF;
    WS0.Cell[1,0].FontColor := $FFFF;
    WS0.Cell[1,0].FontSize := 5;

    DefaultFormat := CmdFormat.Defaults.Find('F2');
  end;

  XLSSS.XLS.CmdFormat.BeginEdit(XLSSS.XLS[0]);
  XLSSS.XLS.CmdFormat.Apply;
  // .......................................................

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
      doSheets(n, XLSSS)
    end;
    if n.NodeName = 'sheet' then  //
    begin
      doOneSheet(n, XLSSS);
    end;
  end;

end;

// .............................................................................

procedure TRep01Form.SaveActionExecute(Sender: TObject);
begin
  inherited;

  XLSSS.XLS.SaveToFile(Exepath + 'reports\tst.xlsx');
end;

end.
