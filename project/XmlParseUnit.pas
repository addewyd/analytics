unit XmlParseUnit;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Data.DB,
  XML.xmldom, XML.XMLIntf,
  XML.XMLDoc, ErrorUnit, DmUnit;

procedure ParseInputFile(Doc: IDOMDocument);
procedure ParseSessionFile(Doc: IDOMDocument);
procedure ParseOrderFile(Doc: IDOMDocument);
procedure LoadTanks(node: IDOMNode; id: integer);
procedure LoadOBR(node: IDOMNode; id: integer);
procedure CheckLink(tablename, ecode, ename: string);

implementation

uses MainUnit;

procedure CheckLink(tablename, ecode, ename: string);
  var
    rc: integer;
begin

  if Trim(ecode) = '' then Exit;

  with DM.FDQuery do
  begin
    SQL.Text := 'select * from ' + tablename + ' where code = :code';
    with Params do
    begin
      Clear;
      with Add do
      begin
        Name := 'code';
        DataType := ftString;
        ParamType := ptInput;
      end;

    end;
    ParamByName('code').AsString := ecode;
    Prepare;
    Open;
    rc := RecordCount;
    if rc < 1 then
    begin
      SQL.Text := 'insert into ' + tablename +
        '(code, name) values (:code, :name)';
      with Params do
      begin
        Clear;
        with Add do
        begin
          Name := 'code';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'name';
          DataType := ftString;
          ParamType := ptInput;
        end;

      end;
      ParamByName('code').AsString := ecode;
      ParamByName('name').AsString := ename;
      Prepare;
      ExecSQL;

      MainForm.Logm.Lines.Add(format('Added %s in %s', [ename, tablename]));

    end;

  end;

end;

// ..................................................................

procedure ParseInputFile(Doc: IDOMDocument);
var
  nL, nL1: IDOMNodeList;
begin
  nL := Doc.getElementsByTagName('DataPaket');
  if nL.length > 0 then
  begin
    DM.FDTransaction.StartTransaction;
    try
      ParseSessionFile(doc);
      DM.FDTransaction.Commit;
    except
      on e: Exception do
      begin
        DM.FDTransaction.Rollback;
        ErrorMessageBox(MainForm, e.Message);
      end;
    end;
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
  n, n0, n1: IDOMNode;
  attrs: IDOMNamedNodeMap;
  s, nname, d0, d1, d2, un, azs: String;
  i, j, rc, id: integer;
  td0, td1, td2: TDateTime;
begin

  id := -1;

  nL := Doc.getElementsByTagName('DataPaket');

  n := nL.item[0];

  attrs := n.attributes;

  n0 := attrs.getNamedItem('AZSCode');
  azs := n0.nodeValue;

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

    DM.FDQuery.SQL.Text :=
      'select * from sessions where azscode = :azs and sessionnum = :sn and startdatetime = :sdt';

    with DM.FDQuery.Params do
    begin
      Clear;
      with Add do
      begin
        Name := 'azs';
        DataType := ftString;
        ParamType := ptInput;
      end;
      with Add do
      begin
        Name := 'sn';
        DataType := ftInteger;
        ParamType := ptInput;
      end;
      with Add do
      begin
        Name := 'sdt';
        DataType := ftTimeStamp;
        ParamType := ptInput;
      end;
    end;
    with DM.FDQuery do
    begin
      ParamByName('azs').AsString := azs;
      ParamByName('sn').AsString := s;
      ParamByName('sdt').AsString := d1;
      Prepare;
      Open;
      rc := RecordCount;
    end;

    if rc > 0 then
    begin
      // ErrorMessageBox(MainForm, Format('session %s %s already added', [azs, s]));
      MainForm.Logm.Lines.Add(Format('session %s %s already added', [azs, s]));
      Exit;
    end
    else
    begin
      DM.FDQuery.SQL.Text := 'insert into sessions ' +
        '(azscode,sessionnum, startdatetime, enddatetime, username) ' + '  values ' +
        '(:azs, :sn, :sdt, :edt, :un) returning id';
      with DM.FDQuery.Params do
      begin
        Clear;
        with Add do
        begin
          Name := 'azs';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'sn';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'sdt';
          DataType := ftTimeStamp;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'edt';
          DataType := ftTimeStamp;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'un';
          DataType := ftString;
          ParamType := ptInput;
        end;
      end;

      with DM.FDQuery do
      begin
        ParamByName('azs').AsString := azs;
        ParamByName('sn').AsString := s;
        ParamByName('sdt').AsString := d1;
        ParamByName('edt').AsString := d2;
        ParamByName('un').AsString := un;
        Prepare;
        Open;
        First;
        id := FieldByName('id').AsInteger;
      end;

    end;

    MainForm.Logm.Lines.Add(Format('rc = %d id = %d', [rc, id]));
    // ..............................................

    MainForm.Logm.Lines.Add(format('Session %s %s', [s, azs]));

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

    (* Of interest:

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

      if nname = 'Tanks' then
      begin
        LoadTanks(n1, id);
      end
      else if nname = 'OutcomesByRetail' then
      begin
        LoadOBR(n1, id);
      end;

    end;
  end;
end;

// ........................................................................

procedure ParseOrderFile(Doc: IDOMDocument);
begin
//
end;

procedure LoadTanks(node: IDOMNode; id: integer);
  var i, len, rc: integer;
    NL: IDOMNodeList;
    n: IDOMNode;
    attrs: IDOMNamedNodeMap;
    tn, dens: string;

begin
  NL := node.childNodes;
  len := NL.length;
  for i  := 0 to len - 1 do
    begin
      n := NL.item[i];

      attrs := n.attributes;
      tn := attrs.getNamedItem('TankNum').nodeValue;
      dens := attrs.getNamedItem('EndDensity').nodeValue;
      MainForm.Logm.Lines.Add(tn + ' ' + dens);

      with DM.FDQuery do
      begin
        //FetchOptions.AutoFetchAll := TFDFetchOptions.afAll;
        SQL.Text := 'select * from tanks where session_id = :id and tanknum = :tn';
        with Params do begin
          Clear;
          with Add do
          begin
            Name := 'id';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'tn';
            DataType := ftString;
            ParamType := ptInput;
          end;

        end;
        ParamByName('id').AsInteger := id;
        ParamByName('tn').AsString := tn;
        Prepare;
        Open;
        rc := RecordCount;

      end;

      if rc > 0 then Continue;

      with DM.FDQuery do
      begin
        SQL.Text := 'insert into tanks (session_id, tanknum, enddensity) values (:id, :tn, :dens)';
        with Params do begin
          Clear;
          with Add do
          begin
            Name := 'id';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'tn';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'dens';
            DataType := ftExtended;
            ParamType := ptInput;
          end;

        end;
        ParamByName('id').AsInteger := id;
        ParamByName('tn').AsString := tn;
        if dens = '' then
        begin
          MainForm.logm.Lines.Add('warning^ empty density');
          dens := '0';
        end;
        ParamByName('dens').AsString := dens;
        Prepare;
        ExecSQL;

      end;

    end;

end;

procedure LoadOBR(node: IDOMNode; id: integer);
  var i, len, rc: integer;
    NL: IDOMNodeList;
    n: IDOMNode;
    attrs: IDOMNamedNodeMap;
    fuelcode, fuelname, paymentcode, paymentname, partnername, partnercode: string;

begin
  NL := node.childNodes;
  len := nl.length;

  for i:= 0 to len - 1 do
    begin
      attrs := NL.item[i].attributes;

      fuelcode := attrs.getNamedItem('FuelExtCode').nodeValue;
      paymentcode := attrs.getNamedItem('PaymentModeExtCode').nodeValue;
      partnercode := attrs.getNamedItem('PartnerExtCode').nodeValue;

      fuelname := attrs.getNamedItem('FuelName').nodeValue;
      paymentname := attrs.getNamedItem('PaymentModeName').nodeValue;
      partnername := attrs.getNamedItem('PartnerName').nodeValue;

      CheckLink('WARES', fuelcode, fuelname);
      CheckLink('PAYMENTMODES', paymentcode, paymentname);
      CheckLink('CONTRAGENTS', partnercode, partnername);


    end;

end;

end.
