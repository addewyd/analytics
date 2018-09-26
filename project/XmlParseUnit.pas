unit XmlParseUnit;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.IOUtils, Data.DB, System.Types,
  XML.xmldom, XML.XMLIntf, FIREDAC.Stan.Error,
  XML.XMLDoc, ErrorUnit, DmUnit;

procedure ParseInputFile(Doc: IDOMDocument);
procedure ParseSessionFile(Doc: IDOMDocument);
function ParseOrderFile(Doc: IXMLNode; azs, filename: String): integer;
procedure LoadTanks(node: IDOMNode; id: integer);
procedure LoadOBR(node: IDOMNode; id: integer);
procedure LoadOBO(node: IDOMNode; id: integer; azs: String);
procedure CheckLink(tablename, ecode, ename: string);
function LoadOrderFile(filename, azs: string): Integer;

implementation

uses MainUnit;

procedure CheckLink(tablename, ecode, ename: string);
  var
    rc: integer;
begin

  if Trim(ecode) = '' then Exit;
  if tablename = 'PAYMENTMODES' then
  begin
    if Length(ecode) > 10 then
      ecode := Copy(Trim(ecode), 1, 10);
  end;

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
//    ParseOrderFile(doc);  not now
    MainForm.logm.Lines.Add('Not now');
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
      end
      else if nname = 'OutcomesByOffice' then
      begin
        LoadOBO(n1, id, azs);
      end;

    end;
  end;
end;


// .............................................................................

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
          MainForm.logm.Lines.Add('warning: empty density');
          dens := '0';
        end;
        ParamByName('dens').AsString := dens;
        Prepare;
        ExecSQL;

      end;

    end;

end;

// .............................................................................

// OutcomesByRetail
procedure LoadOBR(node: IDOMNode; id: integer);
  var i, len, rc: integer;
    NL: IDOMNodeList;
    n: IDOMNode;
    attrs: IDOMNamedNodeMap;
    fuelcode, fuelname, paymentcode, paymentname, partnername, partnercode: string;

    tanknum, hosename,agentname,cardcode,Partnerinn,agentextcode,
      remark: String;
    sVolume, sAmount, sMass, sOrigprice, ordercount: String;
    Volume, Amount, Mass, Origprice: Extended;

begin
  NL := node.childNodes;
  len := nl.length;

  for i:= 0 to len - 1 do
    begin
      attrs := NL.item[i].attributes;

      fuelcode := attrs.getNamedItem('FuelExtCode').nodeValue;
      paymentcode := attrs.getNamedItem('PaymentModeExtCode').nodeValue;
      partnercode := attrs.getNamedItem('PartnerExtCode').nodeValue;

      if Trim(fuelcode) = '' then fuelcode := 'EMPTY';
      if Trim(paymentcode) = '' then paymentcode := 'EMPTY';
      if Trim(partnercode) = '' then partnercode := 'EMPTY';


      fuelname := attrs.getNamedItem('FuelName').nodeValue;
      paymentname := attrs.getNamedItem('PaymentModeName').nodeValue;
      partnername := attrs.getNamedItem('PartnerName').nodeValue;

      CheckLink('WARES', fuelcode, fuelname);
      CheckLink('PAYMENTMODES', paymentcode, paymentname);
      CheckLink('CONTRAGENTS', partnercode, partnername);

      tanknum := attrs.getNamedItem('TankNum').nodeValue;
      hosename := attrs.getNamedItem('HoseName').nodeValue;
      agentname := attrs.getNamedItem('AgentName').nodeValue;
      cardcode := attrs.getNamedItem('CardCode').nodeValue;
      partnerinn := attrs.getNamedItem('PartnerINN').nodeValue;
      agentextcode := attrs.getNamedItem('AgentExtCode').nodeValue;
      Remark := attrs.getNamedItem('Remark').nodeValue;

      sVolume := attrs.getNamedItem('Volume').nodeValue;
      sAmount := attrs.getNamedItem('Amount').nodeValue;
      sMass := attrs.getNamedItem('Mass').nodeValue;
      sOrigprice := attrs.getNamedItem('OrigPrice').nodeValue;

      ordercount := attrs.getNamedItem('OrderCount').nodeValue;

      volume := StrToExtdef(sVolume, 0);
      amount := StrToExtdef(sAmount, 0);
      mass := StrToExtdef(sMass, 0);
      origprice := StrToExtdef(sOrigprice, 0);

      with DM.FDQuery do
      begin
        SQL.Text := 'insert into OutcomesByRetail ' +
          '(session_id,   tanknum,  hosename,  fuelname,  paymentmodename, ' +
              'agentname, cardcode, partnername, partnerinn, ' +
              'fuelextcode, paymentmodeextcode, agentextcode, ' +
              'partnerextcode, volume, amount, mass, ' +
              'origprice, remark, ordercount)' +
          ' values ' +
          '(:session_id, :tanknum, :hosename, :fuelname, :paymentmodename,:agentname,:cardcode,:partnername,:partnerinn,:fuelextcode,:paymentmodeextcode,:agentextcode,:partnerextcode,:volume,:amount,:mass,:origprice,:remark,:ordercount)';

        with params do
        begin
          Clear;
          with Add do
          begin
            Name := 'session_id';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'tanknum';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'hosename';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'fuelname';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'paymentmodename';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'agentname';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'cardcode';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'partnername';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'partnerinn';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'fuelextcode';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'paymentmodeextcode';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'agentextcode';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'partnerextcode';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'volume';
            DataType := ftExtended;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'amount';
            DataType := ftExtended;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'mass';
            DataType := ftExtended;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'origprice';
            DataType := ftExtended;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'remark';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'ordercount';
            DataType := ftInteger;
            ParamType := ptInput;
          end;

        end; // params

        ParamByName('session_id').AsInteger := id;
        ParamByName('tanknum').AsString := tanknum;
        ParamByName('hosename').AsString := hosename;
        ParamByName('fuelname').AsString := fuelname;
        ParamByName('paymentmodename').AsString := paymentname;
        ParamByName('agentname').AsString := agentname;
        ParamByName('cardcode').AsString := cardcode;
        ParamByName('partnername').AsString := partnername;
        ParamByName('partnerinn').AsString := Partnerinn;
        ParamByName('fuelextcode').AsString := fuelcode;
        ParamByName('paymentmodeextcode').AsString := paymentcode;
        ParamByName('agentextcode').AsString := agentextcode;
        ParamByName('partnerextcode').AsString := partnercode;
        ParamByName('volume').AsExtended := Volume;
        ParamByName('amount').AsExtended := amount;
        ParamByName('mass').AsExtended := mass;
        ParamByName('origprice').AsExtended := Origprice;
        ParamByName('remark').AsString := remark;
        ParamByName('ordercount').AsString := Ordercount;
        Prepare;
        ExecSQL;

      end; // query


    end;

end;


// OutcomesByOffice
procedure LoadOBO(node: IDOMNode; id: integer; azs: String);
  var
    orderpath: String;
    files: TStringDynArray;
    cnt, i, len: Integer;
begin
  // load orders first
  orderpath := ExtractFilePath(CurrentFile);
  files := TDirectory.GetFiles(orderpath, 'order*.xml', TSearchOption.soTopDirectoryOnly);

  len := Length(files);
  MainForm.logm.Lines.Add(Format('Order files count: %d',[len]));
  cnt := 0;
  for i := 0 to len - 1 do
  begin
    try
      cnt := cnt + LoadOrderFile(files[i], azs);
    except
      on e: TFDDBError do
      begin
        raise;
      end;
      on e: Exception do
      begin
        MainForm.logm.Lines.Add(e.Message);
        // raise?
      end;

    end;
  end;
  MainForm.logm.Lines.Add(Format('Order files loaded: %d',[cnt]));

end;

// ........................................................................


function LoadOrderFile(filename, azs: string): integer;
  var
    orderdoc: TXMLDocument;
begin
  orderdoc := TXMLDocument.Create(MainForm);
  orderdoc.LoadFromFile(filename);
  result := 0;
  try
    result := ParseOrderFile(orderdoc.DocumentElement, azs, filename);
  finally
    orderdoc.Free;
  end;

end;

// ........................................................................

function ParseOrderFile(Doc: IXMLNode; azs, filename: String) : Integer;
  var
    nL: IXMLNodeList;
    session, sdate, stime, sOrdernum, sPumpNum, tanksnum: String;
    sFuelPrice, sFuelVolume, sFuelAmount, FuelExCode: String;
    FuelPrice, FuelVolume, FuelAmount: Extended;
    sdt: String;
    dt: TDateTime;
    rc, pumpnum: Integer;
    el: IXMLNode;

begin
    filename := ExtractFileName(filename);
    rc := 0;
    Result := 0;
    nl := doc.ChildNodes;

    el := nL.FindNode('Session');
    if el = nil then
    begin
      raise Exception.Create(Format('No Session node in %s', [filename]));
    end;
    session := el.Text;

    el := nL.FindNode('Date');
    if el = nil then
    begin
      raise Exception.Create(Format('No Date node in %s', [filename]));
    end;
    sDate := el.Text;

    el := nL.FindNode('Time');
    if el = nil then
    begin
      raise Exception.Create(Format('No Time node in %s', [filename]));
    end;
    sTime := el.Text;

    el := nL.FindNode('OrderNum');
    if el = nil then
    begin
      raise Exception.Create(Format('No OrderNum node in %s', [filename]));
    end;
    sOrdernum := el.Text;

    el := nL.FindNode('PumpNum');
    if el = nil then
    begin
      raise Exception.Create(Format('No PumpNum node in %s', [filename]));
    end;
    sPumpNum := el.Text;

    el := nL.FindNode('TanksNum');
    if el = nil then
    begin
      raise Exception.Create(Format('No TanksNum node in %s', [filename]));
    end;
    tanksnum := el.Text;

    el := nL.FindNode('FuelPrice');
    if el = nil then
    begin
      raise Exception.Create(Format('No FuelPrice node in %s', [filename]));
    end;
    sFuelPrice := el.Text;

    el := nL.FindNode('FuelVolume');
    if el = nil then
    begin
      raise Exception.Create(Format('No FuelVolume node in %s', [filename]));
    end;
    sFuelVolume := el.Text;

    el := nL.FindNode('FuelAmount');
    if el = nil then
    begin
      raise Exception.Create(Format('No FuelAmount node in %s', [filename]));
    end;
    sFuelAmount := el.Text;

    el := nL.FindNode('FuelExCode');
    if el = nil then
    begin
      raise Exception.Create(Format('No FuelExCode node in %s', [filename]));
    end;
    FuelExCode := el.Text;

    //sdt := sdate + ' ' + stime;
    //dt := VarToDateTime(sdt);
    //DateTimeToString(sdt, 'yyyy-mm-dd hh:nn:ss', dt);
    sdt := StringReplace('20' + sDate + ' ' + sTime, '.', '-', [rfReplaceAll]);

    FuelPrice := StrToextDef(sFuelPrice, 0);
    FuelAmount := StrToextDef(sFuelAmount, 0);
    FuelVolume := StrToextDef(sFuelVolume, 0);

    pumpnum := StrToIntDef(sPumpNum, 0);

    with DM.FDQuery do
    begin
      sql.Text := 'select * from orders where azscode=:azscode and odt=:odt and pumpnum=:pumpnum';
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
            Name := 'odt';
            DataType := ftTimeStamp;
            ParamType := ptInput;
        end;
        with Add do
        begin
            Name := 'pumpnum';
            DataType := ftInteger;
            ParamType := ptInput;
        end;
      end;
      ParamByName('azscode').AsString := azs;
      ParamByName('odt').AsString := sdt;
      ParamByName('pumpnum').AsInteger := pumpnum;

      Prepare;
      Open();
      rc := RecordCount;
      if rc > 0 then
      begin
        // already loaded
        exit;
      end;

      // ......................................................................

      sql.Text := 'insert into orders ' +
        '(azscode,session,odt,ordernum,pumpnum,tanksnum,fuelprice,fuelvolume,fuelamount,filename,fuelexcode)' +
        ' values ' +
        '(:azscode,:session,:odt,:ordernum,:pumpnum,:tanksnum,:fuelprice,:fuelvolume,:fuelamount,:filename,:fuelexcode)';
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
            Name := 'session';
            DataType := ftInteger;
            ParamType := ptInput;
        end;
        with Add do
        begin
            Name := 'odt';
            DataType := ftTimeStamp;
            ParamType := ptInput;
        end;
        with Add do
        begin
            Name := 'ordernum';
            DataType := ftInteger;
            ParamType := ptInput;
        end;
        with Add do
        begin
            Name := 'pumpnum';
            DataType := ftInteger;
            ParamType := ptInput;
        end;
        with Add do
        begin
            Name := 'tanksnum';
            DataType := ftString;
            ParamType := ptInput;
        end;
        with Add do
        begin
            Name := 'fuelprice';
            DataType := ftExtended;
            ParamType := ptInput;
        end;
        with Add do
        begin
            Name := 'fuelvolume';
            DataType := ftExtended;
            ParamType := ptInput;
        end;
        with Add do
        begin
            Name := 'fuelamount';
            DataType := ftExtended;
            ParamType := ptInput;
        end;
        with Add do
        begin
            Name := 'filename';
            DataType := ftString;
            ParamType := ptInput;
        end;
        with Add do
        begin
            Name := 'fuelexcode';
            DataType := ftString;
            ParamType := ptInput;
        end;
      end;
      ParamByName('azscode').AsString := azs;
      ParamByName('session').AsString := session;
      ParamByName('odt').AsString := sdt;
      ParamByName('ordernum').AsInteger := StrToIntDef(sOrdernum, 0);
      ParamByName('pumpnum').AsInteger := pumpnum;
      ParamByName('tanksnum').AsString := tanksnum;
      ParamByName('fuelprice').AsExtended := FuelPrice;
      ParamByName('fuelvolume').AsExtended := FuelVolume;
      ParamByName('fuelamount').AsExtended := FuelAmount;
      ParamByName('filename').AsString := filename;
      ParamByName('fuelexcode').AsString := FuelExCode;

      Prepare;
      ExecSQL;

    end;
    Result := 1;
end;

end.
