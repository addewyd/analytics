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
  XML.XMLDoc, JvExControls, JvLabel, Vcl.StdCtrls, JvExStdCtrls, JvEdit

  ;

{$Include 'consts.inc'}

type
  TRep01Form = class(TFormWithGrid)
    XLSSS: TXLSSpreadSheet;
    SaveAction: TAction;
    ToolButton3: TToolButton;
    FDQueryG: TFDQuery;
    FDQueryC: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure SaveActionExecute(Sender: TObject);
  private
    { Private declarations }
    doc: TXMLDocument;
    colOrder: Integer;
    cparams: TArray<Qparam>;
    azscode, rtemplate: String;
    sdt, edt: TDate;
    procedure doSheets(n :IXMLNode; XS:TXLSSpreadSheet);
    procedure doOneSheet(n :IXMLNode; XS:TXLSSpreadSheet);
    procedure doSheetData(n:IXMLNode; XS:TXLSSpreadSheet; sheetname, columnparam: String);
//    procedure doColumn(XS:TXLSSpreadSheet; columnparam: String);
    procedure doGroup(n: IXMLNode; XS:TXLSSpreadSheet; WS: TXLSWorkSheet; columnparam: String);
    procedure doColumns(n: IXMLNode; XS:TXLSSpreadSheet; WS: TXLSWorkSheet; columnparam: String);
  public
    { Public declarations }
    constructor Create(pr: TComponent; fname, _rtemplate, _AzsCode: String;
      _sdt, _edt: TDate); reintroduce; overload;
  end;

var
  Rep01Form: TRep01Form;

implementation

{$R *.dfm}

uses DmUnit, MainUnit;

// .............................................................................

constructor TRep01Form.Create(pr: TComponent; fname, _rtemplate, _AzsCode: String;
      _sdt, _edt: TDate);
begin
  inherited create(pr, fname);
  azscode := _azscode;
  rtemplate := _rtemplate;
  sdt := _sdt;
  edt := _edt;
  JvStatusBar1.Panels[0].Text := 'АЗС ' + azscode;
  JvStatusBar1.Panels[1].Text := 'Шаблон ' + rtemplate;
  JvStatusBar1.Panels[2].Text := DateToStr(sdt) + ' - ' + DateToStr(edt);

end;

// .............................................................................

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
//        Transaction.StartTransaction;  // Auto
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

procedure TRep01Form.doGroup(n: IXMLNode; XS:TXLSSpreadSheet; WS: TXLSWorkSheet; columnparam: String);
  var
    s, gparams: String;
begin
  s := n.Attributes['sql'];

  gparams := '';
  if n.HasAttribute('params') then
    gparams := n.Attributes['params'];

  with FDQueryG do
  begin
    SQL.Text := s;
  end;


end;

// .............................................................................

procedure TRep01Form.doColumns(n: IXMLNode; XS:TXLSSpreadSheet; WS: TXLSWorkSheet; columnparam: String);
  var
    s: String;
    i, r: integer;
    sp: Qparam;
    f: String;
begin
  s := n.Attributes['sql'];

  with FDQueryC do
  begin
    SQL.Text := s;
    Params.Clear;
      with Params do
      begin
        with Add do
        begin
          Name := 'columnparam';
          DataType := ftString;
          ParamType := ptInput;
        end;
      end;


    for sp in cparams do
    begin
      with Params do
      begin
        with Add do
        begin
          Name := sp.Name;
          DataType := sp.DataType;
          ParamType := sp.ParamType;
        end;
      end;

    end;
      // Fixed List!!!
      // azscode, startdatetime, enddatetime
    ParamByName('azscode').AsString := azscode;
    ParamByName('startdatetime').AsDate := sdt;
    ParamByName('enddatetime').AsDateTime  := edt;
    ParamByName('columnparam').AsString  := columnparam;

    prepare;
    open;
    r := 0;
    while not Eof do
    begin
      i := 0;
      for f in FieldList do
      begin

        WS.asString[colOrder + i, r + 3] := FieldByName(f).AsString;
        inc(i);
      end;
      Next;
      inc(r)
    end;
    colOrder := colOrder + FieldCount;
    Close;

  end;


end;

// .............................................................................

procedure TRep01Form.doSheetData(n :IXMLNode; XS:TXLSSpreadSheet; sheetname, columnparam: String);
  var
    WS: TXLSWorksheet;
    nL, aN: IXMLNodeList;
    cn: IXMLNode;
    k: Integer;
begin
  colOrder := 0;

  addToLog('cp ' + columnparam);
  WS := XS.XLS.Add;
  WS.Name := sheetname + ' (' +inttostr(XS.XLS.Count) + ')';
  nL := n.ChildNodes;

  // columns or columngroup
  for k := 0 to nL.Count - 1 do
  begin
    cn := nL.Get(k);

    if cn.NodeName = 'columns' then
    begin
      if cn.HasAttribute('sql') then
      begin
        doColumns(cn, XS, WS, columnparam);
      end;
    end
    else if cn.NodeName = 'columngroup' then
    begin
      if cn.HasAttribute('sql') then
      begin
        doGroup(cn, XS, WS, columnparam);
      end;

    end
    {
    else if cn.NodeName = 'column' then
    begin
      if cn.HasAttribute('sql') then
      begin
          doColumn
      end;
    end
    }
    else
    begin
      // nothing
    end

  end;

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
    nL, nL2, aN: IXMLNodeList;
    n, n2 :IXMLNode;
    c, k: Integer;

    function GetpType(p: String) : Data.DB.TFieldType;
    begin
        if p = 'integer' then result := ftInteger
        else if p = 'date' then result := ftDate
        else if p = 'datetime' then result := ftDateTime
        else if p = 'string' then result := ftString
        else
        begin
          raise Exception.Create('unknown param typr in report');
        end;
    end;

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

    WS0.AsString[1,1] := 'Дата';

    WS0.AsString[1,3] := '01 Октябрь 18';
    WS0.AsString[1,4] := '02 Октябрь 18';
    WS0.AsString[1,5] := '03 Октябрь 18';

    WS0.AsString[2,1] := 'Объём';

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
  doc.LoadFromFile(Exepath + 'reports\' + rtemplate);
  inode := doc.DocumentElement;
  nL := Doc.ChildNodes;
  n := nL.FindNode('report');
  if n = nil then
  begin
    AddToLog('R00 "report" node not found');
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

    if n.NodeName = 'params' then // parameter list for queries
    begin
      nL2 := n.ChildNodes;
      SetLength(cparams, nL2.Count);
      for k := 0 to nL2.Count - 1 do
      begin
        n2 := nL2.Get(k);
        cparams[k].Name := n2.Attributes['name'];
        cparams[k].DataType := GetpType(n2.Attributes['type']);
        cparams[k].ParamType := ptInput;
      end;
    end;

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
