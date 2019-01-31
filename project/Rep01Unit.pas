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
  XLSReadWriteII5, Xc12DataStyleSheet5, XLSCellAreas5, XLSMergedCells5,
  XML.xmldom, XML.XMLIntf,
  XML.XMLDoc, JvExControls, JvLabel, Vcl.StdCtrls, JvExStdCtrls, JvEdit,
  JvDialogs

  ;

{$Include 'consts.inc'}

type
  TRep01Form = class(TFormWithGrid)
    XLSSS: TXLSSpreadSheet;
    SaveAction: TAction;
    ToolButton3: TToolButton;
    FDQueryG: TFDQuery;
    FDQueryC: TFDQuery;
    SaveDialog: TJvSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure SaveActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
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
    procedure doHGroup(n: IXMLNode; XS:TXLSSpreadSheet; WS: TXLSWorkSheet; columnparam: String);
    procedure doColumns(n: IXMLNode; XS:TXLSSpreadSheet;
      WS: TXLSWorkSheet; columnparam, title: String; groupparam: String = ''; shownulls:boolean = true);
    procedure ReLoad(Sender: TObject);
  public
    { Public declarations }
    constructor Create(pr: TComponent; fname, _rtemplate, _AzsCode: String;
      _sdt, _edt: TDate); reintroduce; overload;
  end;

const rowshift = 2;

var
  Rep01Form: TRep01Form;

implementation

{$R *.dfm}

uses DmUnit, MainUnit;

// .............................................................................

function AttrToIntDef(n: IXMLNode; attr: String; def: Integer): Integer;
begin
  if n = nil then result := 1
  else if n.HasAttribute(attr) then
    result := StrToIntDef(n.Attributes[attr], def)
  else
    result := def;
end;

function AttrToStrDef(n: IXMLNode; attr: String; def: String): String;
begin
  if n = nil then result := ''
  else if n.HasAttribute(attr) then
    result := n.Attributes[attr]
  else
    result := def;
end;

// .............................................................................

constructor TRep01Form.Create(pr: TComponent; fname, _rtemplate, _AzsCode: String;
      _sdt, _edt: TDate);
begin
  inherited create(pr, fname);
  azscode := _azscode;
  rtemplate := _rtemplate;
  sdt := _sdt;
  edt := _edt;
  JvStatusBar1.Panels[0].Text := 'ÀÇÑ ' + azscode;
  JvStatusBar1.Panels[1].Text := 'Øàáëîí ' + rtemplate;
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

procedure TRep01Form.doGroup(n: IXMLNode; XS:TXLSSpreadSheet;
  WS: TXLSWorkSheet; columnparam: String);
  var
    s, gparams, groupparam, title: String;
    c, k: Integer;
    nn: IXMLNode;
begin
  s := n.Attributes['sql'];

  gparams := '';
  if n.HasAttribute('params') then
    gparams := n.Attributes['params'];
  title := AttrToStrDef(n, 'title', 'GrTtl');
  // for now it is only azscode
  with FDQueryG do
  begin
    SQL.Text := s;
    with Params do
    begin
      Clear;
      with Add do
      begin
          Name := gparams;
          DataType := ftString;
          ParamType := ptInput;
      end;
    end;

    if pos(':azscode', s) > 0 then
    begin


      ParamByName(gparams).AsString := azscode;
    end;
    prepare;
    open;
    while not Eof do
    begin
      groupparam := FieldByName('groupparam').AsString;
      title := FieldByName('groupname').AsString;
      for c := 0 to n.ChildNodes.Count - 1 do
      begin
        nn := n.ChildNodes.Get(c);
        if nn.NodeName = 'columns' then
        begin
          //if c > 0  then title := '';

          doColumns(nn, XS, WS, columnparam, title, groupparam, false);
         end;
      end;
      Next;
    end;


  end;
end;

// .............................................................................

procedure TRep01Form.doHGroup(n: IXMLNode; XS:TXLSSpreadSheet;
  WS: TXLSWorkSheet; columnparam: String);
  var
    s: String;
    c: Integer;
    nn : IXMLNode;
begin
  s := AttrToStrDef(n, 'title', 'title');
  for c := 0 to n.ChildNodes.Count - 1 do
  begin
    nn := n.ChildNodes.Get(c);
    if nn.NodeName = 'columns' then
    begin
      doColumns(nn, XS, WS, columnparam, s);
    end;
  end;
end;

// .............................................................................

procedure TRep01Form.doColumns(n: IXMLNode; XS:TXLSSpreadSheet;
  WS: TXLSWorkSheet; columnparam, title: String; groupparam: String = '';
    shownulls: boolean=true);
  type sums = record
    bs: boolean;
    sum: Extended;
  end;
  var
    s, fval, fife: String;
    i, r: integer;
    sp: Qparam;
    f, ft: String;
    ha: TXc12HorizAlignment;
    fs: Integer;
    clr: longword;
    props: IXMLNode;
    asums: TArray<sums>;
    showit: boolean;
    ca: TCellArea;
    mc: TXLSMergedCells;

    function max(a,b:Integer): Integer;
    begin
      result := a;
      if a<b then result := b;
    end;

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
    if groupparam <> '' then
    begin
      with Params do
      begin
        with Add do
        begin
          Name := 'groupparam';
          DataType := ftString;
          ParamType := ptInput;
        end;
      end;
    end;

      // Fixed List!!!
      // azscode, startdatetime, enddatetime
    if Pos(':azscode', s) > 0 then
    begin

      ParamByName('azscode').AsString := azscode;
    end;
    ParamByName('startdatetime').AsDate := sdt;
    ParamByName('enddatetime').AsDateTime  := edt;
    ParamByName('columnparam').AsString  := columnparam;
    if groupparam <> '' then
    begin
      ParamByName('groupparam').AsString  := groupparam;
    end;

    prepare;
    open;

    r := 0;
    i := 0;

    // prevents add empty group, e.g counters
    // not OK
    if RecordCount < 1 then
    begin
      close;
      exit;
    end;
    // prevents add empty group, e.g counters
    // OK
    if not shownulls then
    begin
      showit := false;
      while not Eof do
      begin
        for f in fieldlist do
        begin
          if not FieldByName(f).IsNull then showit := true;
        end;
        Next;
      end;
      if  not showit then
      begin
        close;
        exit;
      end;
    end;

    // group header
//    if title = '' then
  //    WS.asString[colOrder, r + rowshift] := ' '
    //else
      WS.asString[colOrder, r + rowshift] := title; // + groupparam;

    WS.MergeCells(colorder, r + rowshift,
      colorder + FieldList.Count - 1, r + rowshift);
    WS.Cell[colOrder, r + rowshift].HorizAlignment
       := TXc12HorizAlignment.chaCenter;
    WS.Cell[colOrder, r + rowshift].CellColorRGB := $CCCCCC;

    WS.Cell[colOrder, r + rowshift].BorderBottomStyle := cbsThin;
    WS.Cell[colOrder, r + rowshift].BorderRightStyle := cbsThin;

    inc(r);

    First;
    // Titles Header
    SetLength(asums, max(n.ChildNodes.Count, FieldList.Count));

    for f in FieldList do
    begin
      if i >= n.ChildNodes.Count then
      begin
        props := nil
      end
      else
      begin
        props := n.ChildNodes[i];
      end;

      asums[i].bs := AttrToIntDef(props, 'sum', 0) > 0;
      asums[i].sum := 0;

      ft := AttrToStrDef(props, 'title', f);
      WS.asString[colOrder + i, r + rowshift] := ft;

      WS.Cell[colOrder + i, r + rowshift].BorderBottomStyle := cbsThin;
      WS.Cell[colOrder + i, r + rowshift].BorderRightStyle := cbsThin;

      WS.Columns[colOrder + i].Width
        := AttrToIntDef(props, 'width', 10) * 256;

      WS.Columns[colOrder + i].HorizAlignment :=
        TXc12HorizAlignment(
        AttrToIntDef(props, 'align', 1));

      inc(i);
    end;

    // Data

    while not Eof do
    begin
      i := 0;
      for f in FieldList do
      begin
        if i >= n.ChildNodes.Count then props := nil
        else
          props := n.ChildNodes[i];
        ha := TXc12HorizAlignment(
          AttrToIntDef(props, 'align', 1));
        clr :=
          AttrToIntDef(props, 'bgcolor', $FFFFFF);
        fife :=
          AttrToStrDef(props, 'FifE', '');

        fval := FieldByName(f).AsString;
        WS.asString[colOrder + i, r + rowshift + 1] := fval;
        if (Trim(fval) = '') and (fife <> '') then
        begin
//          WS.asString[colOrder + i, r + rowshift + 1] := fife;
          if (fife = 'PRC') and (r > 1) then
          begin
            clr := $AAAAAA;
            WS.asString[colOrder + i, r + rowshift + 1] :=
               WS.asString[colOrder + i - 1, r + rowshift + 1]
          end
          else if  (fife = 'PRR') and (r > 1)  then
          begin
            clr := $999999;
            WS.asString[colOrder + i, r + rowshift + 1] :=
               WS.asString[colOrder + i - 0, r + rowshift + 1 - 1]
          end
          else
          begin
          end;

        end;
        if asums[i].bs then
        begin
          asums[i].sum := asums[i].sum + StrToextDef(fval, 0);
        end;

        WS.Cell[colOrder + i, r + rowshift + 1].HorizAlignment := ha;
        WS.Cell[colOrder + i, r + rowshift + 1].CellColorRGB := clr;

        WS.Cell[colOrder + i, r + rowshift + 1].FontSize :=
          AttrToIntDef(props, 'fontsize', 8);
        WS.Cell[colOrder + i, r + rowshift + 1].FontName :=
          AttrToStrDef(props, 'fontname', 'Courier New');

        inc(i);
      end;
      Next;
      inc(r)
    end;
    inc(r);
    i := 0;
    for f in FieldList do
    begin
      if asums[i].bs then
      begin
        WS.AsFloat [colOrder + i, r + rowshift + 1] :=
            asums[i].sum;
      end;
      inc(i);
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
  WS.Name := sheetname + ' (' + inttostr(XS.XLS.Count) + ')';
  nL := n.ChildNodes;

  // columns or columngroup
  for k := 0 to nL.Count - 1 do
  begin
    cn := nL.Get(k);

    if cn.NodeName = 'columns' then
    begin
      if cn.HasAttribute('sql') then
      begin
        doColumns(cn, XS, WS, columnparam, '');
      end;
    end
    else if cn.NodeName = 'columngroup' then
    begin
      if cn.HasAttribute('sql') then
      begin
        doGroup(cn, XS, WS, columnparam);
      end
      else
      begin
        doHGroup(cn, XS, WS, columnparam);
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
begin
  inherited;
  XLSSS.XLS.Clear(0);
  Reload(self);
end;

// .............................................................................

procedure TRep01Form.RefreshActionExecute(Sender: TObject);
  var
    WS: TXLSWorksheet;
begin
//  XLSSS.XLS.Clear(0);
//  Reload(sender);
end;

// .............................................................................

procedure TRep01Form.Reload(Sender: TObject);
var
  OwnerDocument: IXMlDocument;
  inode: IXMLNode;
  nL, nL2, aN: IXMLNodeList;
  n, n2: IXMLNode;
  c, k: Integer;

  function GetpType(p: String): Data.DB.TFieldType;
  begin
    if p = 'integer' then
      result := ftInteger
    else if p = 'date' then
      result := ftDate
    else if p = 'datetime' then
      result := ftDateTime
    else if p = 'string' then
      result := ftString
    else
    begin
      raise Exception.Create('unknown param typr in report');
    end;
  end;

begin

  with XLSSS.XLS do begin

    CmdFormat.BeginEdit(Nil);
    CmdFormat.Fill.BackgroundColor.RGB := $FF0000;
    CmdFormat.Font.Name := 'Arial Cyr';
    CmdFormat.Font.Size := 5;
    CmdFormat.AddAsDefault('F0');

    CmdFormat.BeginEdit(Nil);
    CmdFormat.Fill.BackgroundColor.RGB := $00FF00;
    CmdFormat.Font.Name := 'Arial Cyr';
    CmdFormat.Font.Size := 12;
    CmdFormat.AddAsDefault('F1');

    DefaultFormat := CmdFormat.Defaults.Find('F1');
  end;


  doc := TXMLDocument.Create(self);
  try
    doc.LoadFromFile({Exepath + 'reports\' + }rtemplate);
    inode := doc.DocumentElement;
    nL := doc.ChildNodes;
    n := nL.FindNode('report');
    if n = nil then
    begin
      addToLog('R00 "report" node not found');
      // error
      Exit;
    end;

    nL := n.ChildNodes;

    if nL.Count < 1 then
    begin
      addToLog(inttostr(nL.Count));
      // error
      Exit;
    end;

    // nL := nL.Get(0).ChildNodes;

    for c := 0 to nL.Count - 1 do
    begin
      n := nL.Get(c);
      aN := n.AttributeNodes;
      addToLog(format('%s anc %d', [n.NodeName, aN.Count]));

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
      if n.NodeName = 'sheet' then //
      begin
        doOneSheet(n, XLSSS);
      end;
    end;

  finally
    doc.Free;
  end;

end;

// .............................................................................

procedure TRep01Form.SaveActionExecute(Sender: TObject);
begin
  inherited;
  Savedialog.FileName := JvFs.ReadString('savereportfile', '');
  if SaveDialog.Execute then
  begin
    JvFS.WriteString('savereportfile', Savedialog.FileName);
    XLSSS.XLS.SaveToFile(Savedialog.FileName);
  end;
end;

end.
