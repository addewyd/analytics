unit XmlParseUnit;

interface
      uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
          XML.xmldom, Xml.XMLIntf,
          Xml.XMLDoc, ErrorUnit;

      procedure ParseSessionFile(Doc: IDOMDocument);
      //function ParseOrderFile(Doc: IDOMDocument): boolean;

implementation

  uses MainUnit;

procedure ParseSessionFile(Doc: IDOMDocument);
  var
    nL, nL1: IDOMNodeList;
    n, n0, n1: IDoMNode;
    attrs: IDOMNamedNodeMap;
    s, nname: String;
    i, j: integer;
begin
  nl := Doc.getElementsByTagName('DataPaket');
  if nl.length <> 1 then
  begin
    raise Exception.Create('Not a session file');
  end;


  n := nl.item[0];

  attrs := n.attributes;

  n0 := attrs.getNamedItem('AZSCode');
  s := n0.nodeValue;

  nl := Doc.getElementsByTagName('Sessions');

  if nl.length < 1 then
  begin
    raise Exception.Create('No sessions node');
  end;

  n := nL.item[0];

  nL := n.childNodes;  // sessions

  n := nL.item[0];
  attrs := n.attributes;

  nL := n.childNodes;  // session

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
OutcomesByCoupon
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



  for i := 0 to nL.length - 1 do
  begin

        n1 := nL.item[i];
        nname := n1.nodeName;
        MainForm.Logm.Lines.Add(nname); // Session

  end;

end;


end.
