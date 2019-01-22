unit XmlParseUnit;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.IOUtils, Data.DB, System.Types,
  XML.xmldom, XML.XMLIntf,
  FIREDAC.Stan.Error, FIREDAC.Stan.Param,FireDAC.Phys.IBWrapper,
  XML.XMLDoc
  {$Ifdef console}
    , DMConUnit
  {$else}
    , ErrorUnit
    , DmUnit
  {$Endif}
    ;

{$Include 'consts.inc'}

procedure ParseInputFile(Doc: IDOMDocument; quiet: boolean);
function ParseSessionFile(Doc: IDOMDocument; quiet: boolean) : Integer;
function ParseOrderFile(Doc: IXMLNode; azs, filename: String): integer;
procedure LoadTanks(node: IDOMNode; id: integer; azs: String);
procedure LoadHoses(node: IDOMNode; id: integer);
procedure LoadOBR(node: IDOMNode; id: integer);
procedure LoadOBC(node: IDOMNode; id: integer);
procedure LoadIOBR(node: IDOMNode; id: integer);
procedure LoadIOBP(node: IDOMNode; id: integer);
procedure LoadIBR(node: IDOMNode; id: integer);
procedure LoadCF(node: IDOMNode; id: integer);
procedure LoadTDIB(node: IDOMNode; id: integer);
procedure LoadTR(node: IDOMNode; id: integer);
procedure LoadIR(node: IDOMNode; id: integer);
procedure LoadTDBItems(node: IDOMNode; id: integer);
procedure LoadOBO(node: IDOMNode; id: integer; azs: String);
//procedure CheckLink(tablename, ecode, ename: string; adds: array of string);
procedure CheckLink(tablename: string; var ecode: string; ename: string; adds: array of string);
function LoadOrderFile(filename, azs: string): Integer;
function TryToGetCode(tablename, ename: String): String;

implementation

{$Ifdef console}
{$else}
uses MainUnit, MlogUnit;
{$Endif}
var gazs: string;

procedure CheckLink(tablename: string; var ecode: string; ename: string; adds: array of string);
  var
    rc: integer;
begin

  if Trim(ecode) = '' then
  begin
    if (tablename='PAYMENTMODES') or (tablename='FIRMS') then
    begin
      if AnsiLowerCase(ename)  = 'безналичный расчет' then
      begin
        ecode := '99PL99';

      end
      else ecode := 'EMPTY';

    end
    else Exit;
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

      if length(adds) = 2 then
      begin
        SQL.Text := 'insert into ' + tablename +
          '(code, name,'+adds[0]+') values (:code, :name, :adds)';
      end
      else
      begin
        SQL.Text := 'insert into ' + tablename +
          '(code, name) values (:code, :name)';
      end;

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
        if length(adds) = 2 then
        begin
          with Add do
          begin
            Name := 'adds';
            DataType := ftString;
            ParamType := ptInput;
          end;

        end;

      end;
      ParamByName('code').AsString := ecode;
      ParamByName('name').AsString := ename;
      if length(adds) = 2 then
      begin
        ParamByName('adds').AsString := adds[1];
      end;
      Prepare;
      ExecSQL;

      AddToLog(format('Added %s in %s', [ename, tablename]));

    end;

  end;

end;

// ..................................................................

function TryToGetCode(tablename, ename: String): String;
  var
    rc: integer;
begin
  result := '';

  with DM.FDQuery do
  begin
    SQL.Text := 'select code from ' + tablename + ' where name = :name';
    with Params do
    begin
      Clear;
      with Add do
      begin
        Name := 'name';
        DataType := ftString;
        ParamType := ptInput;
      end;
    end;

    ParamByName('name').AsString := ename;
    Prepare;
    Open;

    rc := RecordCount;
    if rc > 0 then
    begin
      result := FieldByName('code').AsString;

    end;
  end;

end;

// ..................................................................

procedure CheckContracts(ecode: String);
  var
    rc: integer;
begin
  if Trim(ecode) = '' then Exit;

  with DM.FDQuery do
  begin
    SQL.Text := 'select * from contracts where partner_code = :code';
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

      begin
        SQL.Text := 'insert into contracts ' +
          '(partner_code) values (:code)';
      end;

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
      ExecSQL;

      AddToLog(format('Added %s in %s', [ecode, 'CONTRACTS']));

    end;
  end;
end;

// ..................................................................

// start

procedure ParseInputFile(Doc: IDOMDocument; quiet: boolean);
var
  nL: IDOMNodeList;
  msg: TMessage;
  sid: Integer;
begin

  nL := Doc.getElementsByTagName('DataPaket');
  if nL.length > 0 then
  begin
    DM.FDTransaction.StartTransaction;
    DM.FDTransactionUPD.StartTransaction;
    try
      sid := ParseSessionFile(doc, quiet);
      if DM.FDTransactionUPD.Active then DM.FDTransactionUPD.Commit;
      if DM.FDTransaction.Active then DM.FDTransaction.Commit;


DM.FDConnection.Close;
DM.FDConnection.Open();
{$Ifndef console}
      msg.Msg := WM_SESSION_ADDED;
      MainForm.SendMsgs(msg);
      DM.AddLogMsg(user_id, Format('Session %d added', [sid]));
{$Endif}
    except
      on e: Exception do
      begin
        if DM.FDTransactionUPD.Active then DM.FDTransactionUPD.Rollback;
        if DM.FDTransaction.Active then DM.FDTransaction.Rollback;

        AddToLog('parse input: ' + e.Message);
{$Ifndef console}
        ErrorMessageBox(MainForm, e.Message);

{$Endif}
      end;
    end;
    Exit;
  end;

  nL := Doc.getElementsByTagName('OrderData');
  if nL.length > 0 then
  begin
//    ParseOrderFile(doc);  not now
    AddToLog('Not now');
    Exit;
  end;
//  raise Exception.Create('Not a session or order file');

end;

// ......................................................................

function GetSnFromFile(fname: String) : integer;
var
  doc : IXmlDocument;
  n: IDomNode;
  d: IDOMDocument;
  nL: IDOMNodeList;
  i, len: Integer;
  attrs: IDOMNamedNodeMap;
  csn: String;
begin
  result := $7ffffff;
  doc := LoadXMLDocument(fname);
//  n := doc.DocumentElement.DOMNode;
  d := doc.DOMDocument;
  nL := d.getElementsByTagName('Session');
  len := nL.length;
  for i:= 0 to len - 1 do
  begin
    n := nL.item[i];
    attrs := n.attributes;
    try
      csn := attrs.getNamedItem('SessionNum').nodeValue;
      result := StrToIntDef(csn, Result);
      AddToLog(format('SN in %s is %d', [ExtractFileName(fname), Result]));
    except
      on e: Exception do
      begin
        AddToLog(format('No SN in %s', [ExtractFileName(fname)]));
        Exit;
      end;
    end;
  end;

end;

// .............................................................................

function IsAllowedLoadinThisSession(azs, s: String;
  var requiredfile: String; var sn: Integer) : boolean;
var
  cfilepath, csql, cfile: String;
  files: TStringDynArray;
  fnames: TstringList;
  i, len, rc, ind, rcsn: Integer;
begin
  Result := false;
  cfilepath := ExtractFilePath(CurrentFile);
  cfile := ExtractFileName(CurrentFile);
  files := TDirectory.GetFiles(cfilepath, 'close*.xml', TSearchOption.soTopDirectoryOnly);
  csql := 'select id, sessionnum from sessions where azscode = :azs order by startdatetime';

  fnames := TStringList.Create;
  try
    len := Length(files);
    if len < 1 then
    begin
      // it is impossible
      requiredfile := 'it is impossible!';
      sn := -1;
      AddToLog('it is impossible!');
      exit;
    end;

    for i := 0 to len - 1 do
    begin
      fnames.Add(ExtractFileName(files[i]));
    end;

    fnames.Sort;

    with DM.FDQuery do
    begin
      Sql.Text := csql;
      with Params do
      begin
        Clear;
        with Add do
        begin
          Name := 'azs';
          DataType := ftString;
          ParamType := ptInput;

        end;
      end;
      ParamByName('azs').AsString := azs;
      Prepare;
      Open;
      rc := RecordCount;
      Last;
    end;

    if rc > 0 then
    begin
      rcsn := DM.FDQuery.FieldByName('sessionnum').AsInteger;
      ind := -1;
      if fnames.Find(cfile, ind) then
      begin
        // SessionNum in cfile (really CurrentFile) must be last + 1
        // or < last (if session counter had been reset)
        //csn := sn; // GetSnFromFile(CurrentFile);
        if (sn = rcsn + 1) or (sn < rcsn) then
        begin
          sn := rcsn;
          result := true;
          exit;
        end
        else
        begin
          if ind = len -1 then
          begin
            // it was last file, therefore it was already loaded
            AddToLog('it was last file');
          end
          else
          begin
            requiredfile := fnames[ind + 1];
            sn := rcsn + 1;
            AddToLog(Format('required file %s', [requiredfile]));
          end;

        end;

      end
      else
      begin
        requiredfile := 'it is impossible!';
        sn := -1;
        exit;

      end;
    end
    else
    begin
      requiredfile := fnames[0];
      if cfile = requiredfile then
      begin
        AddToLog('First session file');
        Result := true;
        Exit;
      end;

      sn := 1;
    end;

  finally
    fnames.Free;
  end;

end;

// .............................................................................

procedure AddAllTanks(session_id: Integer; azs: String);
begin
  with DM.AddTanksProc do
  begin
    with Params do
    begin
      clear;
      with add do
      begin
        Name := 'session_id';
        DataType := ftInteger;
        ParamType := ptInput;
      end;
      with add do
      begin
        Name := 'azscode';
        DataType := ftWideString;
        ParamType := ptInput;
      end;
    end;
    ParamByName('session_id').AsInteger := session_id;
    ParamByName('azscode').AsWideString := azs;
    Prepare;
    ExecProc;
  end;

end;

// .............................................................................

function ParseSessionFile(Doc: IDOMDocument; quiet: boolean) : Integer;
var
  nL, nL1: IDOMNodeList;
  n, n0, n1: IDOMNode;
  attrs: IDOMNamedNodeMap;
  s, sql, nname, d0, d1, d2, un, azs, pcode: String;
  i, j, rc, id, sn: integer;
  td0, td1, td2: TDateTime;
  ia: boolean;
  requiredfile: String;
const
  qpa1: Array [0..2] of Qparam = (
    (Name : 'azs';
        DataType : ftString;
        ParamType : ptInput),
    (Name : 'sn';
        DataType : ftInteger;
        ParamType : ptInput),
    (Name : 'sdt';
        DataType : ftTimeStamp;
        ParamType : ptInput)
  );
begin

  result := 0;
{$Ifndef console}
  if not MainForm.isWinOpen('mlog') then
  begin
    MlogForm := TMlogForm.Create(MainForm, 'mlog');
  end;
{$Endif}
  id := -1;

  nL := Doc.getElementsByTagName('DataPaket');

  n := nL.item[0];

  attrs := n.attributes;

  n0 := attrs.getNamedItem('AZSCode');
  azs := n0.nodeValue;

  gazs := azs;

  td0 := VarToDateTime(attrs.getNamedItem('DateTime').nodeValue);

  DateTimeToString(d0, 'yyyy-mm-dd hh:nn:ss', td0);

  AddToLog(d0);

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

    s := attrs.getNamedItem('SessionNum').nodeValue;

    requiredfile := ExtractFileName(currentfile);
    sn := StrToIntDef(s, 0);
//    sn := sn - 1;
    ia := IsAllowedLoadinThisSession(azs, s, requiredfile, sn);
    if not ia then
    begin
      //
      if quiet then
      begin
        AddToLog(Format('Session not in order, loading %s',
            [requiredfile]));
      end
      else
      begin
{$Ifndef console}
        ErrorMessageBox(MainForm,
          Format('Session not in order, load %s first (supposed SessionNum is %d)',
            [requiredfile, sn]));
{$else}
      Addtolog(Format('Session not in order, load %s first (supposed SessionNum is %d)',
            [requiredfile, sn]));
{$Endif}
      end;
      Continue;                 /// ?
    end;

    d1 := attrs.getNamedItem('StartDateTime').nodeValue;
    d2 := attrs.getNamedItem('EndDateTime').nodeValue;
    un := attrs.getNamedItem('UserName').nodeValue;

    td1 := VarToDateTime(d1);
    if d2 = '' then d2 := d1;

    td2 := VarToDateTime(d2);
    if d2 = '' then td2 := td2 + 0.5;
    DateTimeToString(d1, 'yyyy-mm-dd hh:nn:ss', td1);
    DateTimeToString(d2, 'yyyy-mm-dd hh:nn:ss', td2);

    DM.FDQuery.SQL.Text :=
      'select * from sessions where azscode = :azs and sessionnum = :sn and startdatetime = :sdt';

    with DM.FDQuery.Params do
    begin
      Clear;
      for i := 0 to length(qpa1) - 1 do
      begin
        with Add do
        begin
          Name := qpa1[i].Name;
          DataType := qpa1[i].DataType;
          ParamType := qpa1[i].ParamType;
        end;

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
      AddToLog(Format('session %s %s already added', [azs, s]));
      Exit;
    end
    else
    begin
      DM.FDQuery.SQL.Text := 'insert into sessions ' +
        '(azscode,sessionnum, startdatetime, enddatetime, username, state) ' + '  values ' +
        '(:azs, :sn, :sdt, :edt, :un, ' + SS_NEW + ') returning id';
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
        result := id;
      end;

    end;

    AddToLog(Format('rc = %d id = %d', [rc, id]));
    // ..............................................

    AddToLog(format('Session %s %s', [s, azs]));

    AddToLog(d1 + ' ' + d2);

    nL := n.childNodes; // session

    (*
      Tanks                   +
      Hoses                   +
      OutcomesByRetail          +
      OutcomesByWholesale     -
      IncomesByDischarge         +
      IncomesByWholesale      -
      ItemOutcomesByRetail    -
      ItemOutcomesByPaysheet  +
      CashFlow                   +
      OutcomesByCoupon           +
      OutcomesByOffice           +
      OutcomesByCards       -
      HosesLocking
      TechReturns                +
      SurplusPostings       -
      LossRetirements       -
      TradeDocsInBills      -
      TradeDocsOutBills     -
      TradeDocsInActs       -
      TradeDocsOutActs      -
      TradeDocsMoveItems    -
      ItemRests                 +
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
      AddToLog(nname); // Session

      if nname = 'Tanks' then
      begin
        LoadTanks(n1, id, azs);
      end
      else if nname = 'Hoses' then
      begin
        LoadHoses(n1, id);
      end
      else if nname = 'OutcomesByRetail' then
      begin
        LoadOBR(n1, id);
      end
      else if nname = 'OutcomesByOffice' then
      begin
        LoadOBO(n1, id, azs);
      end
      else if nname = 'OutcomesByCoupon' then
      begin
        LoadOBC(n1, id);
      end
      else if nname = 'ItemOutcomesByRetail' then
      begin
        LoadIOBR(n1, id);
      end
      else if nname = 'TradeDocsInBills' then
      begin
        LoadTDIB(n1, id);
      end
      else if nname = 'TechReturns' then
      begin
        LoadTR(n1, id);
      end
      else if nname = 'ItemRests' then
      begin
        LoadIR(n1, id);
      end
      else if nname = 'CashFlow' then
      begin
        LoadCF(n1, id);
      end
      else if nname = 'IncomesByDischarge' then
      begin
        LoadIBR(n1, id);
      end
      else if nname = 'ItemOutcomesByPaysheet' then
      begin
        LoadIOBP(n1, id);
      end;

    end;
  end;

  pcode := 'EMPTY';
  CheckLink('PAYMENTMODES', pcode, 'N/A', []);

  // now we have  new records with azs,id

  // fill  grouped tables here
  //

  // Tanks, Hoses
  with DM.FDQuery do
  begin
    SQL.Text := 'select * from iotankshoses where session_id=:id';
    with Params do begin
          Clear;
          with Add do
          begin
            Name := 'id';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
    end;
    ParamByName('id').AsInteger := id;
    Prepare;
    Open;
    rc := RecordCount;

  end;

  // Fill IOTANKSHOSES

  if id > 0 then AddAllTanks(id, azs);    // and hoses

  if rc > 0 then
  begin
    AddToLog('session data for tanks already loaded!');
  end
  else
  begin
    try
      with DM.FDQueryForIOTANKSHOSES do
      begin
        with Params do begin
          Clear;
          with Add do
          begin
            Name := 'session_id';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
        end;
        ParamByName('session_id').AsInteger := id;
        Prepare;
        ExecSQL;
      end;
    except
      on e: Exception do
      begin
        AddToLog(e.Message);
        raise;
      end;
    end;
    // then update lastuser_id with user_id
    DM.UpdUserId('IOTANKSHOSES', id);

  end;


  // 1
  (*
    OutcomesByRetail, OutcomesByOffice, IncomesByDischarge,

    (TradeDocsInActs, TradeDocsInBills ???) No

    columns
    вид движения, дата, код клиента, клиент, договор, форма оплдаты,
    код товара, товар, кол-во, Ед изм,
    Объем, Плотность, Цена, Сумма, Ставка НДС, Всего

    Grouping in 1C

    ТабФайл.Свернуть(
      "НомСтр,ВидДвижения,КонецСмены,КодАЗС,Склад,КодКлиента,Клиент,Договор,
          КодТовара,Товар,ЭтоГСМ,Плотность,ФормаОплаты,ФормаОплатыДляДокумента,
          ЕдИзм,Цена,СтавкаНДС,ФайлЗагрузки",

      "Колво,Объем,Сумма,НДС,Всего"
      );

    ТабФайл.Сортировать("КонецСмены,КодАЗС,ВидДвижения,ФормаОплаты,
      ЭтоГСМ-,Клиент,Договор");
  *)

  with DM.FDQuery do
  begin
    SQL.Text := 'select * from inoutgsm where session_id=:id';
    with Params do begin
          Clear;
          with Add do
          begin
            Name := 'id';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
    end;
    ParamByName('id').AsInteger := id;
    Prepare;
    Open;
    rc := RecordCount;

  end;

  // Fill INOUTGSM with new data
  if rc > 0 then
  begin
    AddToLog('session data for gsm already loaded!');
  end
  else
  begin
    try
      with DM.FDQueryForINOUTGSM do
      begin
        with Params do begin
          Clear;
          with Add do
          begin
            Name := 'session_id';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
        end;
        ParamByName('session_id').AsInteger := id;
        Prepare;
        ExecSQL;
      end;
    except
      on e: Exception do
      begin
        AddToLog(e.Message);
        raise;
      end;
    end;
    // then update lastuser_id with user_id
    DM.UpdUserId('INOUTGSM', id);

  end;

  // .....................................................................

  with DM.FDQuery do
  begin
    SQL.Text := 'select * from inoutitems where session_id=:id';
    with Params do begin
          Clear;
          with Add do
          begin
            Name := 'id';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
    end;
    ParamByName('id').AsInteger := id;
    Prepare;
    Open;
    rc := RecordCount;

  end;

  // Fill INOUTGSM with new data
  if rc > 0 then
  begin
    AddToLog('session data for items already loaded!');
  end
  else
  begin
    try
      with DM.FDQueryForINOUTItems do
      begin
        with Params do begin
          Clear;
          with Add do
          begin
            Name := 'session_id';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
        end;
        ParamByName('session_id').AsInteger := id;
        Prepare;
        ExecSQL;
      end;
    except
      on e: Exception do
      begin
        AddToLog(e.Message);
        raise;
      end;
    end;
    // then update lastuser_id with user_id
    DM.UpdUserId('INOUTITEMS', id);

  end;

  // ...........................................................................
  // END
  with DM.FDTransactionUpd do
  begin
//    if Active then Commit;

  end;
  with DM.FDTransaction do
  begin
//    if Active then Commit;

  end;
end;

// .............................................................................

procedure UpdateWarePices(session_id: Integer; ware_code: String; price: Extended; fld: String);
  var bUpd: boolean;
begin
  bUpd := false;
  with DM.FDQueryWP do
  begin
    sql.Text := 'select price_r, price_o from wareprices where session_id = :session_id and ware_code = :ware_code';
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
        Name := 'ware_code';
        DataType := ftString;
        ParamType := ptInput;
      end;
    end;
    ParamByName('session_id').AsInteger := session_id;
    ParamByName('ware_code').AsString := ware_code;
    Prepare;
    Open;
    if RecordCount > 0 then
    begin
      if (fld = 'price_r') and FIeldByName('price_r').IsNull then bUpd := true
      else if (fld = 'price_o') and FIeldByName('price_o').IsNull then bUpd := true;

    // update
      sql.Text := 'update wareprices set !fld = :price where ' +
                  'session_id = :session_id and ware_code = :ware_code';
    end
    else
    begin
      sql.Text := 'insert into wareprices ' +
                '(session_id, ware_code, !fld) values ' +
                '(:session_id, :ware_code, :price)';
      bUpd := true;
    end;
    if bUpd then
    begin
      with Macros do
      begin
        Clear;
        with Add do
        begin
          name := 'fld';
          DataType := mdRaw;
        end;
      end;
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
          Name := 'ware_code';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'price';
          DataType := ftExtended;
          ParamType := ptInput;
        end;
      end;
      MacroByName('fld').AsRaw := fld;
      ParamByName('session_id').AsInteger := session_id;
      ParamByName('ware_code').AsString := ware_code;
      ParamByName('price').AsExtended := price;
      Prepare;
      ExecSQL;
    end;

    SQL.Text := 'update wares set !fld = :price where code = :code';

      with Macros do
      begin
        Clear;
        with Add do
        begin
          name := 'fld';
          DataType := mdRaw;
        end;
      end;
      with params do
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
          Name := 'price';
          DataType := ftExtended;
          ParamType := ptInput;
        end;
      end;
      MacroByName('fld').AsRaw := fld;
      ParamByName('code').AsString := ware_code;
      ParamByName('price').AsExtended := price;
      Prepare;
      ExecSQL;

  end;
end;

// .............................................................................

procedure LoadTanks(node: IDOMNode; id: integer; azs: String);
  var i, len, rc: integer;
    NL: IDOMNodeList;
    n: IDOMNode;
    attrs: IDOMNamedNodeMap;
    tn, dens: string;
    sstartfv, sendfv, sendt, seh, sem, sew, sdr, sdrl: string;
    startfv, endfv, endt, eh, em, ew, dr, drl: Extended;

begin
  NL := node.childNodes;
  len := NL.length;
  for i  := 0 to len - 1 do
    begin
      n := NL.item[i];

      attrs := n.attributes;
      tn := attrs.getNamedItem('TankNum').nodeValue;
      dens := attrs.getNamedItem('EndDensity').nodeValue;
      AddToLog(tn + ' ' + dens);

      with attrs do
      begin
        sstartfv := attrs.getNamedItem('StartFuelVolume').nodeValue;
        sendfv := attrs.getNamedItem('EndFactVolume').nodeValue;
        sendt := attrs.getNamedItem('EndTemperature').nodeValue;
        seh := attrs.getNamedItem('EndHeight').nodeValue;
        sem := attrs.getNamedItem('EndMass').nodeValue;
        sew := attrs.getNamedItem('EndWater').nodeValue;
        sdr := attrs.getNamedItem('DeadRest').nodeValue;
        sdrl := attrs.getNamedItem('DeadRestLiter').nodeValue;
      end;

      startfv := StrToextDef(sstartfv, 0);
      endfv := StrToextDef(sendfv, 0);
      endt := StrToextDef(sendt, 0);
      eh := StrToextDef(seh, 0);
      em := StrToextDef(sem, 0);
      ew := StrToextDef(sew, 0);
      dr := StrToextDef(sdr, 0);
      drl := StrToextDef(sdrl, 0);

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
        SQL.Text := 'insert into tanks ' +
          '(session_id, tanknum, enddensity, startfuelvolume, endfactvolume, endtemperature, endheight, endmass, endwater, deadrest, deadrestliter, azscode)' +
          ' values ' +
          '(:id, :tn, :dens, :startfuelvolume, :endfactvolume, :endtemperature, :endheight, :endmass, :endwater, :deadrest, :deadrestliter, :azscode)';
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
          with Add do
          begin
            Name := 'startfuelvolume';
            DataType := ftExtended;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'endfactvolume';
            DataType := ftExtended;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'endtemperature';
            DataType := ftExtended;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'endheight';
            DataType := ftExtended;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'endmass';
            DataType := ftExtended;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'endwater';
            DataType := ftExtended;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'deadrest';
            DataType := ftExtended;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'deadrestliter';
            DataType := ftExtended;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'azscode';
            DataType := ftString;
            ParamType := ptInput;
          end;

        end;
        ParamByName('id').AsInteger := id;
        ParamByName('tn').AsString := tn;
        ParamByName('azscode').AsString := azs;
        if dens = '' then
        begin
          AddToLog('warning: empty density');
          dens := '0';
        end;
        ParamByName('dens').AsString := dens;
        ParamByName('startfuelvolume').AsExtended := startfv;
        ParamByName('endfactvolume').AsExtended := endfv;
        ParamByName('endtemperature').AsExtended := endt;
        ParamByName('endheight').AsExtended := eh;
        ParamByName('endmass').AsExtended := em;
        ParamByName('endwater').AsExtended := ew;
        ParamByName('deadrest').AsExtended := dr;
        ParamByName('deadrestliter').AsExtended := drl;
        Prepare;
        ExecSQL;

      end;

//      CheckCTanks(gazs, tn);

    end;

end;

// .............................................................................

procedure LoadHoses(node: IDOMNode; id: integer);
  var i, len, rc: integer;
    NL: IDOMNodeList;
    n: IDOMNode;
    attrs: IDOMNamedNodeMap;
    hn: string;
    sstartc, sendc, spn, snip, sht: string;
    startc, endc: Extended;

begin
  NL := node.childNodes;
  len := NL.length;
  for i  := 0 to len - 1 do
    begin
      n := NL.item[i];

      attrs := n.attributes;
      hn := attrs.getNamedItem('HoseNum').nodeValue;

      with attrs do
      begin
        sstartc := attrs.getNamedItem('StartCounter').nodeValue;
        sendc := attrs.getNamedItem('EndCounter').nodeValue;
        spn := attrs.getNamedItem('PumpNum').nodeValue;
        snip := attrs.getNamedItem('NumInPump').nodeValue;
        sht := attrs.getNamedItem('HoseType').nodeValue;
      end;

      startc := StrToextDef(sstartc, 0);
      endc := StrToextDef(sendc, 0);

      with DM.FDQuery do
      begin
        SQL.Text := 'select * from hoses where session_id = :id and hosenum = :hn';
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
            Name := 'hn';
            DataType := ftInteger;
            ParamType := ptInput;
          end;

        end;
        ParamByName('id').AsInteger := id;
        ParamByName('hn').AsInteger := StrToIntDef(hn, 1);
        Prepare;
        Open;
        rc := RecordCount;

      end;

      if rc > 0 then Continue;

      with DM.FDQuery do
      begin
        SQL.Text := 'insert into hoses ' +
          '(session_id, hosenum, startcounter, endcounter, pumpnum, numinpump, hosetype)' +
          ' values ' +
          '(:id, :hn, :startcounter, :endcounter, :pumpnum, :numinpump, :hosetype)';
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
            Name := 'hn';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'startcounter';
            DataType := ftExtended;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'endcounter';
            DataType := ftExtended;
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
            Name := 'numinpump';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'hosetype';
            DataType := ftString;
            ParamType := ptInput;
          end;

        end;
        ParamByName('id').AsInteger := id;
        ParamByName('hn').AsInteger := StrToIntDef(hn, 1);

        ParamByName('startcounter').AsExtended := startc;
        ParamByName('endcounter').AsExtended := endc;
        ParamByName('pumpnum').AsInteger := StrToIntDef(spn, 1);
        ParamByName('numinpump').AsInteger := StrToIntDef(snip, 1);
        ParamByName('hosetype').AsString := sht;
        Prepare;
        ExecSQL;

      end;

    end;
end;

// .............................................................................

procedure UpdateTaho(azs, tanknum: String; hosenum: Integer);
  var
    rc: Integer;
begin

  with DM.FDQuery do
  begin
    SQL.Text := 'select * from ctanks where azscode=:azscode and tanknum=:tanknum';
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
        Name := 'tanknum';
        DataType := ftString;
        ParamType := ptInput;
      end;
    end;
    ParamByName('azscode').AsString := azs;
    ParamByName('tanknum').AsString := tanknum;
    Prepare;
    Open;
    rc := RecordCount;
  end;

  if rc < 1 then
  begin
    with DM.FDQuery do
    begin
      Close;
      SQL.Text :=  'insert into ctanks (azscode,tanknum) values (:azscode,:tanknum)';
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
          Name := 'tanknum';
          DataType := ftString;
          ParamType := ptInput;
        end;
      end;
      ParamByName('azscode').AsString := azs;
      ParamByName('tanknum').AsString := tanknum;
      Prepare;
      ExecSql;
    end;
  end;

  with DM.FDQuery do
  begin
    SQL.Text := 'select * from choses where azscode=:azscode and hosenum=:hosenum';
    with Params do
    begin
      Clear;
      with Add do
      begin
        Name := 'azscode';
        DataType := ftString;
        ParamType := ptInput;
      end;
//      with Add do
  //    begin
    //    Name := 'tanknum';
      //  DataType := ftString;
        //ParamType := ptInput;
      //end;
      with Add do
      begin
        Name := 'hosenum';
        DataType := ftInteger;
        ParamType := ptInput;
      end;
    end;
    ParamByName('azscode').AsString := azs;
    //ParamByName('tanknum').AsString := tanknum;
    ParamByName('hosenum').AsInteger := hosenum;
    Prepare;
    Open;
    rc := RecordCount;
  end;
  if rc < 1 then
  begin
    with DM.FDQuery do
    begin
      Close;
      SQL.Text :=  'insert into choses (azscode,tanknum,hosenum) values (:azscode,:tanknum,:hosenum)';
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
          Name := 'tanknum';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'hosenum';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
      end;
      ParamByName('azscode').AsString := azs;
      ParamByName('tanknum').AsString := tanknum;
      ParamByName('hosenum').AsInteger := hosenum;
      Prepare;
      ExecSql;
    end;
  end;
end;

// .............................................................................

procedure UpdateTanks(id, hosenum: integer; tanknum, warecode: String);
begin
      with DM.FDQuery do
      begin
        SQL.Text := 'update tanks set warecode=:warecode where session_id=:id and tanknum=:tn';
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
            Name := 'warecode';
            DataType := ftString;
            ParamType := ptInput;
          end;

        end;
        ParamByName('id').AsInteger := id;
        ParamByName('tn').AsString := tanknum;
        ParamByName('warecode').AsString := warecode;
        Prepare;
        ExecSQL;

      end;

      //  tanknum may not be NULL!
      // also warecode

      with DM.FDQuery do
      begin
        SQL.Text := 'update hoses set tanknum=:tanknum where session_id = :id and hosenum = :hn';
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
            Name := 'hn';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'tanknum';
            DataType := ftString;
            ParamType := ptInput;
          end;

        end;
        ParamByName('id').AsInteger := id;
        ParamByName('hn').AsInteger := hosenum;
        ParamByName('tanknum').AsString := tanknum;
        Prepare;
        ExecSQL;

      end;
      UpdateTaho(gazs, tanknum, hosenum);
end;

// .............................................................................

// OutcomesByRetail
procedure LoadOBR(node: IDOMNode; id: integer);
  var i, len, rc, hosenum: integer;
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
//      if Trim(paymentcode) = '' then paymentcode := 'EMPTY';
      if Trim(partnercode) = '' then partnercode := 'EMPTY';


      fuelname := attrs.getNamedItem('FuelName').nodeValue;
      paymentname := attrs.getNamedItem('PaymentModeName').nodeValue;
      partnername := attrs.getNamedItem('PartnerName').nodeValue;

      CheckLink('WARES', fuelcode, fuelname, []);
      CheckLink('PAYMENTMODES', paymentcode, paymentname, []);
      CheckLink('CONTRAGENTS', partnercode, partnername, []);
      CheckContracts(partnercode);

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

      hosenum := StrToIntDef(hosename, 0);

      UpdateTanks(id, hosenum, tanknum, fuelcode);
      UpdateWarePices(id, fuelcode, origprice, 'price_r');

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

    AddToLog(format('%d records added', [len]));

end;

// .............................................................................

procedure MoveOrderToBackup(f: String);
  var
    path: String;
    nf: String;
begin
  path := ExtractFilePath(f) + '\ordersbackup';

  if not DirectoryExists(path) then
  begin

    CreateDir(path);
  end;

  nf := path + '\' + ExtractFileName(f);
  RenameFile(f, nf);

end;

// .............................................................................

// OutcomesByOffice
procedure LoadOBO(node: IDOMNode; id: integer; azs: String);
  var
    orderpath: String;
    files: TStringDynArray;
    cnt, i, k, len, hosenum, r: Integer;
    nL: IDOMNodeList;
    attrs: IDOMNamedNodeMap;
    fuelcode, fuelname, paymentcode,
      paymentname: string;

    tanknum, hosename, sDat, sTime,
      remark: String;
    sVolume, sAmount, sMass, sOrigprice: String;
    PartnerExtCode: String;
    Volume, Amount, Mass, Origprice: Extended;
    bHasOrder: boolean;
    dt: TDateTime;
    odt: String;
    cn: IXmlNodeList;
    cni: IDomNodeList;
    el, elc: IXMLNode;
    OwnerDocument: IXMlDocument;

begin
  // load orders first
  if ordersLoaded = 0 then
  begin
    orderpath := ExtractFilePath(CurrentFile);
    files := TDirectory.GetFiles(orderpath, 'order*.xml', TSearchOption.soTopDirectoryOnly);
    len := Length(files);
    AddToLog(Format('Order files count: %d',[len]));
    cnt := 0;
    for i := 0 to len - 1 do
    begin
      try
        r :=  LoadOrderFile(files[i], azs);
        cnt := cnt + r;
        if (r > 0) and move_orders then
            MoveOrderToBackup(files[i]);
      except
          on e: EIBNativeException do // not catches!
            raise;
          on e: Exception do
            AddToLog(e.Message + ' ' + e.Classname);
      end;
    end;
    ordersLoaded := ordersLoaded + 1;
    AddToLog(format('Order files loaded: %d', [cnt]));
  end;
  // ..............................................................

  nL := node.childNodes;
  len := nL.length;

  for i := 0 to len - 1 do
  begin
    attrs := nL.item[i].attributes;

    fuelcode := attrs.getNamedItem('FuelExtCode').nodeValue;
    paymentcode := attrs.getNamedItem('PaymentModeExtCode').nodeValue;

    if Trim(fuelcode) = '' then
      fuelcode := 'EMPTY';
    //      if Trim(paymentcode) = '' then paymentcode := 'EMPTY';

      fuelname := attrs.getNamedItem('FuelName').nodeValue;
      paymentname := attrs.getNamedItem('PaymentModeName').nodeValue;

      CheckLink('WARES', fuelcode, fuelname,[]);
      CheckLink('PAYMENTMODES', paymentcode, paymentname, []);

      with attrs do
      begin
        odt := getNamedItem('Date').nodeValue
          + ' ' + getNamedItem('Time').nodeValue;
        dt := VarToDateTime(odt);
        DateTimeToString(odt, 'yyyy-mm-dd hh:nn:ss', dt);

        tanknum := getNamedItem('TankNum').nodeValue;
        hosename := getNamedItem('HoseName').nodeValue;

        Remark := getNamedItem('Remark').nodeValue;

        sVolume := getNamedItem('Volume').nodeValue;
        sAmount := getNamedItem('Amount').nodeValue;
        sMass := getNamedItem('Mass').nodeValue;
        sOrigprice := getNamedItem('OrigPrice').nodeValue;
      end;

      volume := StrToExtdef(sVolume, 0);
      amount := StrToExtdef(sAmount, 0);
      mass := StrToExtdef(sMass, 0);
      origprice := StrToExtdef(sOrigprice, 0);

      bHasOrder := false;

      hosenum := StrToIntDef(hosename, 0);

      UpdateTanks(id, hosenum, tanknum, fuelcode);

      with DM.FDQuery do
      begin
        SQL.Text := 'select id, fuelprice, fuelvolume, fuelamount from orders ' +
          'where azscode=:azscode and odt=:odt';
        with params do
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

        end;
        ParamByName('azscode').AsString := azs;
        ParamByName('odt').AsString := odt;

        Prepare;
        Open;
        First;
        if not Eof then
        begin
          Volume := FieldByName('fuelvolume').AsExtended;
          Amount := FieldByName('fuelamount').AsExtended;
          Origprice := FieldByName('fuelprice').AsExtended;

          bHasOrder := true;
        end
        else
        begin
          AddToLog(
            Format('No order for azs %s - %s', [azs, odt])
          );
        end;
      end;

      if bhasorder then
      begin
        UpdateWarePices(id, fuelcode, origprice, 'price_o');
      end
      else
      begin
        UpdateWarePices(id, fuelcode, origprice, 'price_o');
      end;

      PartnerExtCode := '';
      OwnerDocument := TXMLDocument.Create(nil);
//      cni := nL.item[i].childNodes;
      el := TXMLNode.Create(nL.item[i],nil,
        (OwnerDocument as IXMLDocumentAccess).DocumentObject);
      elc := el.ChildNodes.FindNode('PartnerExtCode');
      if elc <> nil then
      begin
        try
          PartnerExtCode := elc.Text;
          AddToLog('Bad OBOffice pattnerextcode');
        Except
          PartnerExtCode := 'EMPTY';
        end;
        CheckLink('CONTRAGENTS', partnerextcode, 'NO NAME', []);
        CheckContracts(partnerextcode);

      end;

      with DM.FDQuery do
      begin
        SQL.Text := 'insert into OutcomesByOffice ' +
          '(session_id, odt, tanknum,  hosename,  fuelname, ' +
              'fuelextcode, paymentmodename, paymentmodeextcode, ' +
              'volume, amount, mass, ' +
              'origprice, remark, hasorder, partnerextcode)' +
          ' values ' +
          '(:session_id, :odt, :tanknum, :hosename, :fuelname, ' +
            ':fuelextcode,:paymentmodename,:paymentmodeextcode, ' +
            ':volume,:amount,:mass,:origprice,:remark,:hasorder, :partnerextcode)';
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
            Name := 'odt';
            DataType := ftTimeStamp;
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
            Name := 'fuelextcode';
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
            Name := 'paymentmodeextcode';
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
            Name := 'hasorder';
            DataType := ftBoolean;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'partnerextcode';
            DataType := ftString;
            ParamType := ptInput;
          end;

        end;

        ParamByName('session_id').AsInteger := id;
        ParamByName('odt').AsString := odt;
        ParamByName('tanknum').AsString := tanknum;
        ParamByName('hosename').AsString := hosename;
        ParamByName('fuelname').AsString := fuelname;
        ParamByName('paymentmodename').AsString := paymentname;
        ParamByName('fuelextcode').AsString := fuelcode;
        ParamByName('paymentmodeextcode').AsString := paymentcode;
        ParamByName('volume').AsExtended := Volume;
        ParamByName('amount').AsExtended := amount;
        ParamByName('mass').AsExtended := mass;
        ParamByName('origprice').AsExtended := Origprice;
        ParamByName('remark').AsString := remark;
        if partnerextcode = '' then
          ParamByName('partnerextcode').Clear
        else
          ParamByName('partnerextcode').AsString := partnerextcode;

        ParamByName('hasorder').AsBoolean := bHasOrder;
        Prepare;
        ExecSQL;

      end;

    end;
    AddToLog(format('%d records added', [len]));

end;

// ........................................................................

function LoadOrderFile(filename, azs: string): integer;
  var
    orderdoc: TXMLDocument;
    inode: IXMLNode;
begin
  orderdoc := TXMLDocument.Create(
{$ifdef console}
    DM
{$else}
    MainForm
{$endif}
    );
  result := 0;
  try
//    orderdoc.DOMVendor := DOMVendor.
//         'ADOM XML v4';
    orderdoc.LoadFromFile(filename);
    try
      inode := orderdoc.DocumentElement;
      result := ParseOrderFile(inode, azs, filename);
    except
      on e:Exception do
      begin
//      addtolog(e.Message + ' ' + FileName);
{$ifdef console}
        //addtolog(e.Message);
{$endif}

      end;
    end;
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

// .............................................................................

// IncomesByDischarge
procedure LoadIBR(node: IDOMNode; id: integer);
  var i, len, rc: integer;
    NL: IDOMNodeList;
    n: IDOMNode;
    attrs: IDOMNamedNodeMap;
    fuelcode, fuelname, partnername, partnercode: string;

    tanknum, odt: String;
    sDensity, sVolume, sMass, sPrice, sDiscr, sDocTemp: String;
    Density, Volume, Mass, Price, Discr, DocTemp: Extended;
    docnumber, doccarnumber: String;
    dt: TDateTime;

begin
  NL := node.childNodes;
  len := nl.length;

  for i:= 0 to len - 1 do
    begin
      attrs := NL.item[i].attributes;

      fuelcode := attrs.getNamedItem('FuelExtCode').nodeValue;
      partnercode := attrs.getNamedItem('PartnerExtCode').nodeValue;

      if Trim(fuelcode) = '' then fuelcode := 'EMPTY';
      if Trim(partnercode) = '' then partnercode := 'EMPTY';


      fuelname := attrs.getNamedItem('FuelName').nodeValue;
      partnername := attrs.getNamedItem('PartnerName').nodeValue;

      CheckLink('WARES', fuelcode, fuelname, []);
      CheckLink('CONTRAGENTS', partnercode, partnername, []);
      CheckContracts(partnercode);

      tanknum := attrs.getNamedItem('TankNum').nodeValue;
      odt := attrs.getNamedItem('DateTime').nodeValue;
      dt := VarToDateTime(odt);
      DateTimeToString(odt, 'yyyy-mm-dd hh:nn:ss', dt);

      docnumber := attrs.getNamedItem('DocNumber').nodeValue;
      doccarnumber := attrs.getNamedItem('DocCarNumber').nodeValue;

      sDensity := attrs.getNamedItem('Density').nodeValue;
      sMass := attrs.getNamedItem('Mass').nodeValue;
      sVolume := attrs.getNamedItem('Volume').nodeValue;
      sDiscr := attrs.getNamedItem('Discrepancy').nodeValue;
      sPrice := attrs.getNamedItem('Price').nodeValue;
      sDocTemp := attrs.getNamedItem('DocTemperature').nodeValue;

      Density := StrToextDef(sDensity, 0);
      Mass := StrToextDef(sMass, 0);
      Volume := StrToextDef(sVolume, 0);
      Discr := StrToextDef(sDiscr, 0);
      Price := StrToextDef(sPrice, 0);
      DocTemp := StrToextDef(sDocTemp, 0);

      with DM.FDQuery do
      begin
        SQL.Text := 'insert into IncomesByDischarge ' +
          '(session_id, odt, docnumber, doccarnumber, tanknum, fuelname, ' +
          'fuelextcode, density, mass, volume, discrepancy, price, doctemperature,partnername,partnerextcode)' +
          ' values ' +
          '(:session_id, :odt, :docnumber, :doccarnumber, :tanknum, :fuelname, :fuelextcode, :density, :mass, :volume, :discrepancy, :price, :doctemperature, :partnername, :partnerextcode)';
        with Params do
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
              Name := 'odt';
              DataType := ftTimeStamp;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'docnumber';
              DataType := ftString;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'doccarnumber';
              DataType := ftString;
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
              Name := 'fuelname';
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
              Name := 'density';
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
              Name := 'volume';
              DataType := ftExtended;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'discrepancy';
              DataType := ftExtended;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'price';
              DataType := ftExtended;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'doctemperature';
              DataType := ftExtended;
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
              Name := 'partnerextcode';
              DataType := ftString;
              ParamType := ptInput;
          end;
        end;

        ParamByName('session_id').AsInteger := id;
        ParamByName('odt').AsString := odt;
        ParamByName('docnumber').AsString := docnumber;
        ParamByName('doccarnumber').AsString := doccarnumber;
        ParamByName('tanknum').AsString := tanknum;
        ParamByName('fuelname').AsString := fuelname;
        ParamByName('fuelextcode').AsString := fuelcode;
        ParamByName('density').AsExtended := Density;
        ParamByName('mass').AsExtended := Mass;
        ParamByName('volume').AsExtended := Volume;
        ParamByName('discrepancy').AsExtended := Discr;;
        ParamByName('price').AsExtended := Price;
        ParamByName('doctemperature').AsExtended := DocTemp;
        ParamByName('partnername').AsString := partnername;
        ParamByName('partnerextcode').AsString := partnercode;

        Prepare;
        ExecSQL;

      end;

    end;
    AddToLog(format('%d records added', [len]));

end;

// .............................................................................

// ItemOutcomesByRetail
procedure LoadIOBR(node: IDOMNode; id: integer);
  var i, len, rc: integer;
    NL: IDOMNodeList;
    n: IDOMNode;
    attrs: IDOMNamedNodeMap;

    itemextcode, itemname, paymentextcode,
      paymentname, partnerextcode, partnername: string;

      itemgroup, itemgrpextcode, partnerinn, nds, sunit, frdepartment,
        hash, itemcode: String;
      sIsservice, sItemid, sIsReturn, sQuantity: String;
      sAmount, sPricefasttrade, sPricein, sPriceretail: String;

      Isservice, Itemid, IsReturn, Quantity: integer;
      Amount, Pricefasttrade, Pricein, Priceretail: Extended;

begin
  NL := node.childNodes;
  len := nl.length;

  for i:= 0 to len - 1 do
    begin
      attrs := NL.item[i].attributes;

      itemextcode := attrs.getNamedItem('ItemExtCode').nodeValue;
      paymentextcode := attrs.getNamedItem('PaymentModeExtCode').nodeValue;
      partnerextcode := attrs.getNamedItem('PartnerExtCode').nodeValue;
      itemcode := attrs.getNamedItem('ItemCode').nodeValue;

      if Trim(itemextcode) = '' then itemextcode := 'EMPTY';
      if Trim(itemcode) = '' then itemcode := 'EMPTY';
//      if Trim(paymentextcode) = '' then paymentextcode := 'EMPTY';
      if Trim(partnerextcode) = '' then partnerextcode := 'EMPTY';

      itemname := attrs.getNamedItem('ItemName').nodeValue;
      paymentname := attrs.getNamedItem('PaymentModeName').nodeValue;
      partnername := attrs.getNamedItem('PartnerName').nodeValue;

      CheckLink('ITEMS', itemextcode, itemname, ['ICODE', itemcode]);
      CheckLink('PAYMENTMODES', paymentextcode, paymentname, []);
      CheckLink('CONTRAGENTS', partnerextcode, partnername, []);
      CheckContracts(partnerextcode);


      itemgroup := attrs.getNamedItem('ItemGroup').nodeValue;
      itemgrpextcode := attrs.getNamedItem('ItemsGrpExtCode').nodeValue;
      partnerinn := attrs.getNamedItem('PartnerINN').nodeValue;
      nds := attrs.getNamedItem('Nds').nodeValue;
      sunit := attrs.getNamedItem('Unit').nodeValue;
      frdepartment := attrs.getNamedItem('FRDepartment').nodeValue;
      hash := Trim(attrs.getNamedItem('Hash').nodeValue);
      sIsservice := attrs.getNamedItem('IsService').nodeValue;
      sItemid := attrs.getNamedItem('ItemID').nodeValue;
      sIsReturn := attrs.getNamedItem('IsReturn').nodeValue;
      sQuantity := attrs.getNamedItem('Quantity').nodeValue;
      sAmount := attrs.getNamedItem('Amount').nodeValue;
      sPricefasttrade := attrs.getNamedItem('PriceFastTrade').nodeValue;
      sPricein := attrs.getNamedItem('PriceIn').nodeValue;
      sPriceretail := attrs.getNamedItem('PriceRetail').nodeValue;

      Isservice := StrToIntDef(sIsservice, 0);
      Itemid := StrToIntDef(sItemid, 0);
      IsReturn := StrToIntDef(sIsReturn, 0);
      Quantity := StrToIntDef(sQuantity, 0);
      if isreturn > 0 then
      begin
        Quantity := -Quantity;
      end;

      Amount := StrToextDef(sAmount, 0);
      Pricefasttrade := StrToextDef(sPricefasttrade, 0);
      Pricein := StrToextDef(sPricein, 0);
      Priceretail := StrToextDef(sPriceretail, 0);

      with DM.FDQuery do
      begin
        sql.Text := 'insert into itemoutcomesbyretail' +
          '(session_id, itemname, itemextcode, itemgroup, itemgrpextcode,isservice,'+
          'paymentmodename,paymentmodeextcode,partnername,partnerextcode,partnerinn,itemid,nds,unit,frdepartment,hash,itemcode,isreturn,quantity,amount,pricefasttrade,pricein,priceretail)' +
          ' values ' +
          '(:session_id, :itemname, :itemextcode, :itemgroup, :itemgrpextcode,:isservice,'+
          ':paymentmodename,:paymentmodeextcode,:partnername,:partnerextcode,:partnerinn,:itemid,:nds,:unit,:frdepartment,:hash,:itemcode,:isreturn,:quantity,:amount,:pricefasttrade,:pricein,:priceretail)';
        with Params do
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
              Name := 'itemname';
              DataType := ftString;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'itemextcode';
              DataType := ftString;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'itemgroup';
              DataType := ftString;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'itemgrpextcode';
              DataType := ftString;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'isservice';
              DataType := ftSmallint;
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
              Name := 'paymentmodeextcode';
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
              Name := 'partnerextcode';
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
              Name := 'itemid';
              DataType := ftInteger;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'nds';
              DataType := ftString;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'unit';
              DataType := ftString;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'frdepartment';
              DataType := ftString;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'hash';
              DataType := ftString;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'itemcode';
              DataType := ftString;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'isreturn';
              DataType := ftSmallInt;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'quantity';
              DataType := ftInteger;
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
              Name := 'pricefasttrade';
              DataType := ftExtended;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'pricein';
              DataType := ftExtended;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'priceretail';
              DataType := ftExtended;
              ParamType := ptInput;
          end;

        end;

        ParamByName('session_id').AsInteger := id;
        ParamByName('itemname').AsString := itemname;
        ParamByName('itemextcode').AsString := itemextcode;
        ParamByName('itemgroup').AsString := itemgroup;
        ParamByName('itemgrpextcode').AsString := itemgrpextcode;
        ParamByName('isservice').AsSmallInt := Isservice;
        ParamByName('paymentmodename').AsString := paymentname;
        ParamByName('paymentmodeextcode').AsString := paymentextcode;
        ParamByName('partnername').AsString := partnername;
        ParamByName('partnerextcode').AsString := partnerextcode;
        ParamByName('partnerinn').AsString := partnerinn;
        ParamByName('itemid').AsInteger := Itemid;
        ParamByName('nds').AsString := nds;
        ParamByName('unit').AsString := sunit;
        ParamByName('frdepartment').AsString := frdepartment;
        ParamByName('hash').AsString := hash;
        ParamByName('itemcode').AsString := itemcode;
        ParamByName('isreturn').AsSmallInt := IsReturn;
        ParamByName('quantity').AsInteger := Quantity;
        ParamByName('amount').AsExtended := Amount;
        ParamByName('pricefasttrade').AsExtended := Pricefasttrade;
        ParamByName('pricein').AsExtended := Pricein;
        ParamByName('priceretail').AsExtended := Priceretail;
        Prepare;
        ExecSQL;

      end;

    end;

    AddToLog(format('%d records added', [len]));

end;

// .............................................................................

// ItemOutcomesByPaysheet
procedure LoadIOBP(node: IDOMNode; id: integer);
  var i, len, rc: integer;
    NL: IDOMNodeList;
    n: IDOMNode;
    attrs: IDOMNamedNodeMap;

    itemextcode, itemname, paymentextcode,
      paymentname, partnerextcode, partnername: string;

      partnerinn,
        itemcode: String;
      sItemid, sIsReturn, sQuantity: String;
      sAmount, sPrice: String;

      Itemid, IsReturn, Quantity: integer;
      Amount, Price: Extended;

begin
  NL := node.childNodes;
  len := nl.length;

  for i:= 0 to len - 1 do
    begin
      attrs := NL.item[i].attributes;

      itemextcode := attrs.getNamedItem('ItemExtCode').nodeValue;
      paymentextcode := attrs.getNamedItem('PaymentModeExtCode').nodeValue;
      partnerextcode := attrs.getNamedItem('PartnerExtCode').nodeValue; // no code
      itemcode := attrs.getNamedItem('ItemCode').nodeValue;

      if Trim(itemextcode) = '' then itemextcode := 'EMPTY';
      if Trim(itemcode) = '' then itemcode := 'EMPTY';
//      if Trim(paymentextcode) = '' then paymentextcode := 'EMPTY';
      if Trim(partnerextcode) = '' then partnerextcode := 'EMPTY';

      itemname := attrs.getNamedItem('ItemName').nodeValue;
      paymentname := attrs.getNamedItem('PaymentModeName').nodeValue;
      partnername := attrs.getNamedItem('PartnerName').nodeValue;

      CheckLink('ITEMS', itemextcode, itemname, ['ICODE', itemcode]);
      CheckLink('PAYMENTMODES', paymentextcode, paymentname, []);
      CheckLink('CONTRAGENTS', partnerextcode, partnername, []);
      CheckContracts(partnerextcode);


      partnerinn := attrs.getNamedItem('PartnerINN').nodeValue;
      sItemid := attrs.getNamedItem('ItemID').nodeValue;
      sIsReturn := attrs.getNamedItem('IsReturn').nodeValue;
      sQuantity := attrs.getNamedItem('Quantity').nodeValue;
      sAmount := attrs.getNamedItem('Amount').nodeValue;
      sPrice := attrs.getNamedItem('Price').nodeValue;

      Itemid := StrToIntDef(sItemid, 0);
      IsReturn := StrToIntDef(sIsReturn, 0);
      Quantity := StrToIntDef(sQuantity, 0);
      if isreturn > 0 then
      begin
        Quantity := -Quantity;
      end;


      Amount := StrToextDef(sAmount, 0);
      Price := StrToextDef(sPrice, 0);

      with DM.FDQuery do
      begin
        sql.Text := 'insert into itemoutcomesbypaysheet' +
          '(session_id, itemname, itemextcode,'+
          'paymentmodename,paymentmodeextcode,partnername,partnerextcode, ' +
          'partnerinn,itemid,itemcode,isreturn,quantity,amount,price)' +
          ' values ' +
          '(:session_id, :itemname, :itemextcode,'+
          ':paymentmodename,:paymentmodeextcode,:partnername,:partnerextcode,'+
          ':partnerinn,:itemid,:itemcode,:isreturn,:quantity,:amount,:price)';
        with Params do
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
              Name := 'itemname';
              DataType := ftString;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'itemextcode';
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
              Name := 'paymentmodeextcode';
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
              Name := 'partnerextcode';
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
              Name := 'itemid';
              DataType := ftInteger;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'itemcode';
              DataType := ftString;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'isreturn';
              DataType := ftSmallInt;
              ParamType := ptInput;
          end;
          with Add do
          begin
              Name := 'quantity';
              DataType := ftInteger;
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
              Name := 'price';
              DataType := ftExtended;
              ParamType := ptInput;
          end;

        end;

        ParamByName('session_id').AsInteger := id;
        ParamByName('itemname').AsString := itemname;
        ParamByName('itemextcode').AsString := itemextcode;
        ParamByName('paymentmodename').AsString := paymentname;
        ParamByName('paymentmodeextcode').AsString := paymentextcode;
        ParamByName('partnername').AsString := partnername;
        ParamByName('partnerextcode').AsString := partnerextcode;
        ParamByName('partnerinn').AsString := partnerinn;
        ParamByName('itemid').AsInteger := Itemid;
        ParamByName('itemcode').AsString := itemcode;
        ParamByName('isreturn').AsSmallInt := IsReturn;
        ParamByName('quantity').AsInteger := Quantity;
        ParamByName('amount').AsExtended := Amount;
        ParamByName('price').AsExtended := Price;
        Prepare;
        ExecSQL;

      end;

    end;

    AddToLog(format('%d records added', [len]));

end;

// .............................................................................

// CashFlow
procedure LoadCF(node: IDOMNode; id: integer);
  var i, len: integer;
    NL: IDOMNodeList;
    attrs: IDOMNamedNodeMap;
    sDocTypeID, DocTypeName, sCashID, CashName, Remark, sAmount: String;
    DocTypeID, CashID : integer;
    Amount: Extended;
begin
  NL := node.childNodes;
  len := nl.length;

  for i:= 0 to len - 1 do
  begin
      attrs := NL.item[i].attributes;
      with attrs do
      begin
        sDocTypeID := getNamedItem('DocTypeID').nodeValue;
        DocTypeName := getNamedItem('DocTypeName').nodeValue;
        sCashID := getNamedItem('CashID').nodeValue;
        CashName := getNamedItem('CashName').nodeValue;
        Remark := getNamedItem('Remark').nodeValue;
        sAmount := getNamedItem('Amount').nodeValue;

        DocTypeID := StrToIntDef(sDocTypeID, 0);
        CashID := StrToIntDef(sCashID, 0);
        Amount := StrToextDef(sAmount, 0);

      end;
      with DM.FDQuery do
      begin
        SQL.Text := 'insert into cashflow ' +
          '(session_id, doctypeid, doctypename,cashid,cashname,remark,amount)' +
          ' values ' +
          '(:session_id, :doctypeid, :doctypename,:cashid,:cashname,:remark,:amount)';
          with Params do
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
              Name := 'doctypeid';
              DataType := ftInteger;
              ParamType := ptInput;
            end;
            with Add do
            begin
              Name := 'doctypename';
              DataType := ftString;
              ParamType := ptInput;
            end;
            with Add do
            begin
              Name := 'cashid';
              DataType := ftInteger;
              ParamType := ptInput;
            end;
            with Add do
            begin
              Name := 'cashname';
              DataType := ftString;
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
              Name := 'amount';
              DataType := ftExtended;
              ParamType := ptInput;
            end;
          end;
          ParamByName('session_id').AsInteger := id;
          ParamByName('doctypeid').AsInteger := DocTypeID;
          ParamByName('doctypename').AsString := DocTypeName;
          ParamByName('cashid').AsInteger := CashID;
          ParamByName('cashname').AsString := CashName;
          ParamByName('remark').AsString := Remark;
          ParamByName('amount').AsExtended := Amount;

          Prepare;
          ExecSQL;
        end;

    end;
    AddToLog(format('%d records added', [len]));

end;

// .............................................................................

// TradeDocsInBills
procedure LoadTDIB(node: IDOMNode; id: integer);
  var i, len, tdb_id: integer;
    NL: IDOMNodeList;
    n: IDOMNode;
    attrs: IDOMNamedNodeMap;

    sInBillHID, NDoc, sDateDoc, PriceName, PriceExtCode, PartnerName,
      PartnerExtCode, PartnerInn, PartnerKPP, StoragesName, StoragesExtCode,
      FirmsName, FirmsExtCode: String;

    InBillHID:  Integer;
    DateDoc: TDateTime;
begin
  NL := node.childNodes;
  len := nl.length;

  for i:= 0 to len - 1 do
  begin
      n := NL.item[i];
      attrs := n.attributes;
      with attrs do
      begin
        sInBillHID := getNamedItem('InBillHID').nodeValue;
        NDoc := getNamedItem('NDoc').nodeValue;
        sDateDoc := getNamedItem('DateDoc').nodeValue;
        PriceName := getNamedItem('PriceName').nodeValue;
        PriceExtCode := getNamedItem('PriceExtCode').nodeValue;
        PartnerName := getNamedItem('PartnerName').nodeValue;
        PartnerExtCode := getNamedItem('PartnerExtCode').nodeValue;
        PartnerInn := getNamedItem('PartnerInn').nodeValue;
        PartnerKPP := getNamedItem('PartnerKPP').nodeValue;
        StoragesName := getNamedItem('StoragesName').nodeValue;
        StoragesExtCode := getNamedItem('StoragesExtCode').nodeValue;
        FirmsName := getNamedItem('FirmsName').nodeValue;
        FirmsExtCode := getNamedItem('FirmsExtCode').nodeValue;
      end;

      if Trim(PartnerExtCode) = '' then PartnerExtCode := 'EMPTY';

      CheckLink('CONTRAGENTS', PartnerExtCode, PartnerName, []);
      CheckLink('STORAGES', StoragesExtCode, StoragesName, []);
      CheckLink('FIRMS', FirmsExtCode, FirmsName, []);
      CheckContracts(partnerextcode);

      InBillHID := StrToIntDef(sInBillHID, 0);
      DateDoc := VarToDateTime(sDateDoc);
      DateTimeToString(sDateDoc, 'yyyy-mm-dd hh:nn:ss', DateDoc);

      with DM.FDQuery do
      begin
        SQL.Text := 'insert into tradedocsinbill ' +
          '(session_id, inbillhid,ndoc,datedoc,pricename,priceextcode,'+
            'partnername,partnerextcode,partnerinn,partnerkpp,'+
            'storagesname,storagesextcode,firmsname,firmsextcode)' +
          ' values ' +
          '(:session_id, :inbillhid,:ndoc,:datedoc,:pricename,:priceextcode,'+
            ':partnername,:partnerextcode,:partnerinn,:partnerkpp,'+
            ':storagesname,:storagesextcode,:firmsname,:firmsextcode)' +
          ' returning id';
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
              Name := 'inbillhid';
              DataType := ftInteger;
              ParamType := ptInput;
            end;
            with Add do
            begin
              Name := 'ndoc';
              DataType := ftString;
              ParamType := ptInput;
            end;
            with Add do
            begin
              Name := 'datedoc';
              DataType := ftTimeStamp;
              ParamType := ptInput;
            end;
            with Add do
            begin
              Name := 'pricename';
              DataType := ftString;
              ParamType := ptInput;
            end;
            with Add do
            begin
              Name := 'priceextcode';
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
              Name := 'partnerextcode';
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
              Name := 'partnerkpp';
              DataType := ftString;
              ParamType := ptInput;
            end;
            with Add do
            begin
              Name := 'storagesname';
              DataType := ftString;
              ParamType := ptInput;
            end;
            with Add do
            begin
              Name := 'storagesextcode';
              DataType := ftString;
              ParamType := ptInput;
            end;
            with Add do
            begin
              Name := 'firmsname';
              DataType := ftString;
              ParamType := ptInput;
            end;
            with Add do
            begin
              Name := 'firmsextcode';
              DataType := ftString;
              ParamType := ptInput;
            end;
          end;

          ParamByName('session_id').AsInteger := id;
          ParamByName('inbillhid').AsInteger := InBillHID;
          ParamByName('ndoc').AsString := NDoc;
          ParamByName('datedoc').AsString := sDateDoc;
          ParamByName('pricename').AsString := PriceName;
          ParamByName('priceextcode').AsString := PriceExtCode;
          ParamByName('partnername').AsString := PartnerName;
          ParamByName('partnerextcode').AsString := PartnerExtCode;
          ParamByName('partnerinn').AsString := PartnerInn;
          ParamByName('partnerkpp').AsString := PartnerKPP;
          ParamByName('storagesname').AsString := StoragesName;
          ParamByName('storagesextcode').AsString := StoragesExtCode;
          ParamByName('firmsname').AsString := FirmsName;
          ParamByName('firmsextcode').AsString := FirmsExtCode;

          Prepare;
          Open;
          First;
          tdb_id := FieldByName('id').AsInteger;
      end;

      LoadTDBItems(n, tdb_id);

  end;
  AddToLog(format('%d records added', [len]));

end;

// .............................................................................

procedure LoadTDBItems(node: IDOMNode; id: integer);
  var i, len: integer;
    NL: IDOMNodeList;
    attrs: IDOMNamedNodeMap;

    ItemName, ItemExtCode, sItemIsService, ItemCode, sUnitName, UnitExtCode,
      sAmount, sQuantity, sPrice, sNdsAmount, sTotal, NdsName, NdsExtCode: String;
    Quantity, ItemIsService: Integer;
    Amount, Price, NdsAmount, Total: Extended;
begin
  NL := node.childNodes;
  len := nl.length;

  for i:= 0 to len - 1 do
  begin
    attrs := NL.item[i].attributes;
    with attrs do
    begin
      ItemName := getNamedItem('ItemName').nodeValue;
      ItemExtCode := getNamedItem('ItemExtCode').nodeValue;
      sItemIsService := getNamedItem('ItemIsService').nodeValue;
      ItemCode := getNamedItem('ItemCode').nodeValue;
      sUnitName := getNamedItem('UnitName').nodeValue;
      UnitExtCode := getNamedItem('UnitExtCode').nodeValue;
      sAmount := getNamedItem('Amount').nodeValue;
      sQuantity := getNamedItem('Quantity').nodeValue;
      sPrice := getNamedItem('Price').nodeValue;
      sNdsAmount := getNamedItem('NdsAmount').nodeValue;
      sTotal := getNamedItem('Total').nodeValue;
      NdsName := getNamedItem('NdsName').nodeValue;
      NdsExtCode := getNamedItem('NdsExtCode').nodeValue;

      NdsName := StringReplace(NdsName, '%', '', []);

      Quantity := StrToIntDef(sQuantity, 0);
      ItemIsService := StrToIntDef(sItemIsService, 0);
      Amount := StrToextDef(sAmount, 0);
      Price := StrToextDef(sPrice, 0);
      Total := StrToextDef(sTotal, 0);
      NdsAmount := StrToextDef(sNdsAmount, 0);
    end;
      if ItemExtCode = '' then continue;  // bug in XML

      CheckLink('ITEMS',ItemExtCode,ItemName, ['ICODE', itemcode]);

      with DM.FDQuery do
      begin
        SQL.Text := 'insert into tdb_items ' +
          '(bill_id, itemname, itemextcode,itemisservice,itemcode,unitname,' +
          'unitextcode,amount,quantity,price,ndsamount,total,ndsname,ndsextcode)' +
          ' values ' +
          '(:bill_id, :itemname, :itemextcode,:itemisservice,:itemcode,:unitname,' +
          ':unitextcode,:amount,:quantity,:price,:ndsamount,:total,:ndsname,:ndsextcode)';

        with params do
        begin
          Clear;
          with Add do
          begin
            Name := 'bill_id';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'itemname';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'itemextcode';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'itemisservice';
            DataType := ftSmallint;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'itemcode';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'unitname';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'unitextcode';
            DataType := ftString;
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
            Name := 'quantity';
            DataType := ftInteger;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'price';
            DataType := ftExtended;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'ndsamount';
            DataType := ftExtended;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'total';
            DataType := ftExtended;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'ndsname';
            DataType := ftString;
            ParamType := ptInput;
          end;
          with Add do
          begin
            Name := 'ndsextcode';
            DataType := ftString;
            ParamType := ptInput;
          end;
        end;

        ParamByName('bill_id').AsInteger := id;
        ParamByName('itemname').AsString := ItemName;
        ParamByName('itemextcode').AsString := ItemExtCode;
        ParamByName('itemisservice').AsSmallInt := ItemIsService;
        ParamByName('itemcode').AsString := ItemCode;
        ParamByName('unitname').AsString := sUnitName;
        ParamByName('unitextcode').AsString := UnitExtCode;
        ParamByName('amount').AsExtended := Amount;
        ParamByName('quantity').AsInteger := Quantity;
        ParamByName('price').AsExtended := Price;
        ParamByName('ndsamount').AsExtended := NdsAmount;
        ParamByName('total').AsExtended := Total;
        ParamByName('ndsname').AsString := NdsName;
        ParamByName('ndsextcode').AsString := NdsExtCode;

        Prepare;
        ExecSQL;

      end;

  end;
  AddToLog(format('%d records added in TDB_ITEMS', [len]));

end;

// .............................................................................

// TechReturn
procedure LoadTR(node: IDOMNode; id: integer);
  var i, len: integer;
    NL: IDOMNodeList;
    attrs: IDOMNamedNodeMap;

    sNum, sODT, FuelName, FuelExtCode, TankNum,
      TankExtCode, sVolume, sMass, sDensity: String;
    num: Integer;
    odt: TDateTime;
    Volume, Mass, Density: Extended;

begin
  NL := node.childNodes;
  len := nl.length;

  for i:= 0 to len - 1 do
  begin
    attrs := NL.item[i].attributes;
    with attrs do
    begin
      sNum := getNamedItem('Num').nodeValue;
      sOdt := getNamedItem('DateTime').nodeValue;
      FuelName := getNamedItem('FuelName').nodeValue;
      FuelExtCode := getNamedItem('FuelExtCode').nodeValue;
      TankNum := getNamedItem('TankNum').nodeValue;
      TankExtCode := getNamedItem('TankExtCode').nodeValue;
      sVolume := getNamedItem('Volume').nodeValue;
      sMass := getNamedItem('Mass').nodeValue;
      sDensity := getNamedItem('Density').nodeValue;
    end;

    num := StrToIntDef(sNum, 0);
    Odt := VarToDateTime(sOdt);
    DateTimeToString(sodt, 'yyyy-mm-dd hh:nn:ss', odt);
    Volume := StrToextDef(sVolume, 0);
    Mass := StrToextDef(sMass, 0);
    Density := StrToextDef(sDensity, 0);

    CheckLink('WARES', fuelextcode, fuelname, []);

    with DM.FDQuery do
    begin
      SQL.Text := 'insert into techreturn '+
        '(session_id, num,odt,fuelname,fuelextcode,tanknum, tankextcode,volume,mass,density)'+
        ' values '+
        '(:session_id, :num,:odt,:fuelname,:fuelextcode,:tanknum, :tankextcode,:volume,:mass,:density)';
      with Params do
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
          Name := 'num';
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
          Name := 'fuelname';
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
          Name := 'tanknum';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'tankextcode';
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
          Name := 'mass';
          DataType := ftExtended;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'density';
          DataType := ftExtended;
          ParamType := ptInput;
        end;
      end;
        ParamByName('session_id').AsInteger := id;
        ParamByName('num').AsInteger := num;
        ParamByName('odt').AsString := sODT;
        ParamByName('fuelname').AsString := FuelName;
        ParamByName('fuelextcode').AsString := FuelExtCode;
        ParamByName('tanknum').AsString := TankNum;
        ParamByName('tankextcode').AsString := TankExtCode;
        ParamByName('volume').AsExtended := Volume;
        ParamByName('mass').AsExtended := Mass;
        ParamByName('density').AsExtended := Density;

        Prepare;
        ExecSQL;
    end;

  end;
  AddToLog(format('%d records added', [len]));
end;

// .............................................................................

// OutcomesByCoupon
procedure LoadOBC(node: IDOMNode; id: integer);
  var i, len: integer;
    NL: IDOMNodeList;
    attrs: IDOMNamedNodeMap;
    sOdt, sSessionID, DocID, sVolume, sAmount, CouponCode,
      CouponFuelName, sCouponVolume, sVolumeFact: String;
    odt: TDateTime;
    SessionID: Integer;
    Volume, Amount, VolumeFact, CouponVolume: Extended;
    FuelExtCode: String;
begin
  NL := node.childNodes;
  len := nl.length;

  for i:= 0 to len - 1 do
  begin
    attrs := NL.item[i].attributes;
    with attrs do
    begin
      sOdt:= getNamedItem('Date').nodeValue;
      sSessionID := getNamedItem('SessionID').nodeValue;
      DocID := getNamedItem('DocID').nodeValue;
      sVolume := getNamedItem('Volume').nodeValue;
      sAmount := getNamedItem('Amount').nodeValue;
      CouponCode := getNamedItem('CouponCode').nodeValue;
      CouponFuelName := getNamedItem('CouponFuelName').nodeValue;
      sCouponVolume := getNamedItem('CouponVolume').nodeValue;
      sVolumeFact := getNamedItem('VolumeFact').nodeValue;

    end;

    Odt := VarToDateTime(sOdt);
    DateTimeToString(sodt, 'yyyy-mm-dd hh:nn:ss', odt);

    SessionID := StrToIntDef(sSessionID, 0);
    Volume := StrToextDef(sVolume, 0);
    CouponVolume := StrToextDef(sCouponVolume, 0);
    Amount := StrToextDef(sAmount, 0);
    VolumeFact := StrToextDef(sVolumeFact, 0);
    FuelExtCode := TryTogetCode('WARES', CouponFuelName);

    with DM.FDQuery do
    begin
      sql.Text := 'insert into outcomesbycoupon ' +
        '(session_id,odt, sessionid,docid,volume,amount,' +
            'couponcode,couponfuelname,couponvolume,volumefact,fuelextcode)' +
        ' values ' +
        '(:session_id,:odt, :sessionid,:docid,:volume,:amount,' +
            ':couponcode,:couponfuelname,:couponvolume,:volumefact,:fuelextcode)';

      with Params do
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
          Name := 'odt';
          DataType := ftTimeStamp;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'sessionid';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'docid';
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
          Name := 'couponvolume';
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
          Name := 'couponcode';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'couponfuelname';
          DataType := ftString;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'volumefact';
          DataType := ftExtended;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'fuelextcode';
          DataType := ftString;
          ParamType := ptInput;
        end;

      end;
      ParamByName('session_id').AsInteger := id;
      ParamByName('odt').AsString := sOdt;
      ParamByName('sessionid').AsInteger := SessionID;
      ParamByName('docid').AsString := DocID;
      ParamByName('volume').AsExtended := Volume;
      ParamByName('couponvolume').AsExtended := CouponVolume;
      ParamByName('amount').AsExtended := Amount;
      ParamByName('volumefact').AsExtended := VolumeFact;
      ParamByName('couponcode').AsString := CouponCode;
      ParamByName('couponfuelname').AsString := CouponFuelName;

      if FuelExtCode <> '' then
        ParamByName('fuelextcode').AsString := FuelExtCode
      else
        ParamByName('fuelextcode').Clear();

      Prepare;
      ExecSQL;
    end;
  end;
  AddToLog(format('%d records added', [len]));

end;

// .............................................................................

// ItemRests
procedure LoadIR(node: IDOMNode; id: integer);
  var i, len: integer;
    NL: IDOMNodeList;
    attrs: IDOMNamedNodeMap;
    ItemRest: Integer;
    sItemRest,StorageExtCode, StorageName, ItemExtCode, ItemName, ItemCode: String;

begin
  NL := node.childNodes;
  len := nl.length;

  for i:= 0 to len - 1 do
  begin
    attrs := NL.item[i].attributes;
    with attrs do
    begin
      sItemRest := getNamedItem('ItemRest').nodeValue;
      StorageExtCode := getNamedItem('StorageExtCode').nodeValue;
      StorageName := getNamedItem('StorageName').nodeValue;
      ItemExtCode := getNamedItem('ItemExtCode').nodeValue;
      ItemName := getNamedItem('ItemName').nodeValue;
      ItemCode := getNamedItem('ItemCode').nodeValue;
    end;
    ItemRest := StrToIntDef(sItemRest, 0);

    CheckLink('STORAGES', StorageExtCode, StorageName, []);
    CheckLink('ITEMS', ItemExtCode, ItemName, ['ICODE',ItemCode]);

    with DM.FDQuery do
    begin
      SQL.Text := 'insert into itemrests (session_id, itemrest,storageextcode,storagename,itemextcode,itemname,itemcode) values ' +
        '(:session_id, :itemrest,:storageextcode,' +
        ':storagename,:itemextcode,:itemname,:itemcode)';
      with Params do
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
          Name := 'itemrest';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'storageextcode';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'storagename';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'itemextcode';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'itemname';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'itemcode';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
      end;
      ParamByName('session_id').AsInteger := id;
      ParamByName('itemrest').AsInteger := ItemRest;
      ParamByName('storageextcode').AsString := StorageExtCode;
      ParamByName('storagename').AsString := StorageName;
      ParamByName('itemextcode').AsString := ItemExtCode;
      ParamByName('itemname').AsString := ItemName;
      ParamByName('itemcode').AsString := ItemCode;
      Prepare;
      ExecSQL;

    end;

  end;

  AddToLog(format('%d records added', [len]));
end;


end.
