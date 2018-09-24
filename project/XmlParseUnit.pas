unit XmlParseUnit;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Data.DB,
  XML.xmldom, XML.XMLIntf,
  XML.XMLDoc, ErrorUnit, DmUnit;

procedure ParseInputFile(Doc: IDOMDocument);
procedure ParseSessionFile(Doc: IDOMDocument);
procedure ParseOrderFile(Doc: IDOMDocument);

implementation

uses MainUnit;


procedure ParseInputFile(Doc: IDOMDocument);
var
  nL, nL1: IDOMNodeList;
begin
  nL := Doc.getElementsByTagName('DataPaket');
  if nL.length > 0 then
  begin
    ParseSessionFile(doc);
    Exit;
  end;

  nL := Doc.getElementsByTagName('OrderData');
  if nL.length > 0 then
  begin
    ParseOrderFile(doc);
    Exit;
  end;
  raise Exception.Create('Not a session or order file');

end;

// ......................................................................

procedure ParseSessionFile(Doc: IDOMDocument);
var
  nL, nL1: IDOMNodeList;
  n, n0, n1: IDoMNode;
  attrs: IDOMNamedNodeMap;
  s, nname, d0, d1, d2, un: String;
  i, j, rc: integer;
  td0, td1, td2: TDateTime;
begin

  nL := Doc.getElementsByTagName('DataPaket');

  n := nL.item[0];

  attrs := n.attributes;

  n0 := attrs.getNamedItem('AZSCode');
  s := n0.nodeValue;

  td0 := VarToDateTime(attrs.getNamedItem('DateTime').nodeValue);

  DateTimeToString(d0, 'yyyy-mm-dd hh:nn:ss', td0);

  MainForm.Logm.Lines.Add(d0);

  nL := Doc.getElementsByTagName('Sessions');

  if nL.length < 1 then
  begin
    raise Exception.Create('No sessions node');
  end;

  n := nL.item[0];

  nL1 := n.childNodes; // sessions

  for j := 0 to nL1.length - 1 do
  begin
    n := nL1.item[j];
    attrs := n.attributes;

    // <Session SessionNum="406" StartDateTime="31.05.2018 23:58:59" EndDateTime="01.06.2018 7:06:52"
    // UserName="Семенова М.С.">
    s := attrs.getNamedItem('SessionNum').nodeValue;
    d1 := attrs.getNamedItem('StartDateTime').nodeValue;
    d2 := attrs.getNamedItem('EndDateTime').nodeValue;
    un := attrs.getNamedItem('UserName').nodeValue;

    td1 := VarToDateTime(d1);
    td2 := VarToDateTime(d2);
    DateTimeToString(d1, 'yyyy-mm-dd hh:nn:ss', td1);
    DateTimeToString(d2, 'yyyy-mm-dd hh:nn:ss', td2);

    // .....................
    // move it to separate proc

    DM.FDQuery.SQL.Text := 'select * from sessions where sessionnum = :sn and startdatetime = :sdt';

    with DM.FDQuery.Params do begin
      Clear;
      with Add do begin
        Name := 'sn';
        DataType := ftInteger;
        ParamType := ptInput;
      end;
      with Add do begin
        Name := 'sdt';
        DataType := ftTimeStamp;
        ParamType := ptInput;
      end;
    end;
    with DM.FDQuery do begin
      ParamByName('sn').AsString := s;
      ParamByName('sdt').AsString := d1;
      Prepare;
      Open;
      rc := RecordCount;
    end;

    if rc > 0  then
    begin
      // already added
      // message, exit
    end;

    MainForm.Logm.Lines.Add(Format('rc = %d', [rc]));
    // ..............................................

    MainForm.Logm.Lines.Add('Session ' + s);

    MainForm.Logm.Lines.Add(d1 + ' ' + d2);

    nL := n.childNodes; // session

    (*
      Tanks
      Hoses
      OutcomesByRetail
      OutcomesByWholesale
      IncomesByDischarge
      IncomesByWholesale
      ItemOutcomesByRetail
      ItemOutcomesByPaysheet
      CashFlow
      OutcomesByCoupon           //?
      OutcomesByOffice
      OutcomesByCards
      HosesLocking
      TechReturns
      SurplusPostings
      LossRetirements
      TradeDocsInBills
      TradeDocsOutBills
      TradeDocsInActs
      TradeDocsOutActs
      TradeDocsMoveItems
      ItemRests
    *)

(*  Of interest:

"OutcomesByRetail"
"OutcomesByOffice"           //  with orders
"ItemOutcomesByRetail"
"IncomesByDischarge"
"TradeDocsInActs"
"TradeDocsInBills"
  *)

    for i := 0 to nL.length - 1 do
    begin

      n1 := nL.item[i];
      nname := n1.nodeName;
      MainForm.Logm.Lines.Add(nname); // Session

    end;
  end;
end;

// ........................................................................

procedure ParseOrderFile(Doc: IDOMDocument);
begin
//
end;

end.
