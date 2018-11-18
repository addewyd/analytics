object DM: TDM
  OldCreateOrder = False
  Height = 527
  Width = 608
  object FDQuery: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    UpdateTransaction = FDTransactionUpd
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvParamCreate]
    ResourceOptions.ParamCreate = False
    Left = 40
    Top = 48
  end
  object FDUpdateSQL: TFDUpdateSQL
    Connection = FDConnection
    ConnectionName = 'FDConnection'
    Left = 40
    Top = 104
  end
  object FDCommand: TFDCommand
    Connection = FDConnection
    Transaction = FDTransaction
    ResourceOptions.AssignedValues = [rvParamCreate]
    ResourceOptions.ParamCreate = False
    Left = 40
    Top = 168
  end
  object FDConnection: TFDConnection
    ConnectionName = 'FDConnection'
    Params.Strings = (
      'CharacterSet=UTF8'
      'User_Name=sysdba'
      'Password=electro'
      'Protocol=TCPIP'
      'DriverID=FB'
      'Server=localhost'
      
        'Database=C:\Users\user\Documents\topaz\analytics\project\Win32\D' +
        'ebug\db\SHRFSPS.FDB')
    ResourceOptions.AssignedValues = [rvAutoConnect]
    TxOptions.AutoStart = False
    TxOptions.AutoStop = False
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    Transaction = FDTransaction
    UpdateTransaction = FDTransactionUpd
    Left = 296
    Top = 56
  end
  object FDTransaction: TFDTransaction
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = FDConnection
    Left = 220
    Top = 56
  end
  object FDTransactionH_r: TFDTransaction
    Connection = FDConnection
    Left = 376
    Top = 232
  end
  object FDManager: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    ResourceOptions.AssignedValues = [rvDefaultStoreFormat]
    ResourceOptions.DefaultStoreFormat = sfJSON
    Active = True
    Left = 152
    Top = 120
  end
  object FDQueryForINOUTGSM: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    UpdateTransaction = FDTransactionUpd
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvParamCreate]
    ResourceOptions.ParamCreate = False
    SQL.Strings = (
      '/* session_id is input parameter */'
      
        '/* TODO: Replace tanks & hoses select  by iotankshoses selects! ' +
        ' */'
      ''
      'insert into INOUTGSM'
      '    (SESSION_ID,'
      '     AZSCODE,'
      '     TBL,'
      '    DIRECTION,'
      '    CLIENT_CODE,'
      '    CONTRACT_ID,'
      '    PAYMENT_CODE,'
      '    WARE_CODE,'
      '    TANKNUM,'
      '    AMOUNT,'
      '    EI,'
      '    VOLUME,'
      '    DENSITY,'
      '    PRICE,'
      '    SUMM,'
      '    NDS,'
      '    WHOLE,'
      '    LASTUSER_ID,'
      '    UPDATED_AT,'
      '    STATE)'
      ''
      '/* session_id is input parameter */'
      ''
      'select'
      '    sid,'
      '    azscode,'
      '    tbl,'
      '    dir as direction,'
      '    partnerextcode,'
      '    c.id as contract_id,'
      '    pmec,'
      '    a.fuelextcode,'
      '   a.tanknum,'
      '    sum(amount) as amount,'
      '    '#39't'#39' as ei,'
      '    sum(volume) as volume,'
      '    density as density,  /*  !!! */'
      '    price,'
      '    sum(amount) as summ,'
      '    nds as nds,'
      
        '    sum(amount + amount * cast(nds as integer) / 100.0) as whole' +
        ','
      '    1 as lastuser_id,'
      '    current_timestamp as updated_at,'
      '    0 as state'
      '    from'
      '(select'
      '    s.id as sid,'
      '    s.azscode as azscode,'
      '    sessionnum,'
      '    '#39'R'#39' as tbl,'
      '    startdatetime,'
      '    0 as dir,'
      '    t.warecode as fuelextcode,'
      '    w.name as fuelname,'
      '    r.tanknum,'
      '--    origprice as price,'
      '    iif(wp.price_o is null, wp.price_r, wp.price_o) as price,'
      '    '#39'18'#39' as nds, -- ??'
      '    t.density as density,'
      '    r.paymentmodeextcode as pmec,'
      '    r.paymentmodename,'
      '    r.partnerextcode, '
      '    sum(r.volume) as volume,'
      '    sum(r.amount) as amount'
      '    from sessions s'
      '    join outcomesbyretail r on s.id = r.session_id'
      '    join         (select session_id, tanknum, warecode, density'
      '            from iotankshoses where session_id=:session_id'
      '                group by'
      '                session_id, tanknum, warecode, density'
      
        '                ) t on t.session_id = s.id  /* here must be user' +
        ' editable density table */'
      '    join wares w on t.warecode = w.code'
      
        '    join wareprices wp on wp.session_id = r.session_id and wp.wa' +
        're_code=t.warecode'
      '   where'
      '    r.session_id = :session_id'
      '    and r.tanknum = t.tanknum'
      '   group by sid,'
      '    azscode,sessionnum,startdatetime,'
      '    dir,'
      '    fuelextcode,fuelname,'
      '    tanknum,'
      '    price,'
      '    nds,'
      '    density,'
      '    paymentmodeextcode,'
      '    paymentmodename,'
      '    partnerextcode'
      ''
      'union all'
      'select'
      '    s.id as sid,'
      '    s.azscode as azscode,'
      '    sessionnum,'
      '    '#39'I'#39' as tbl,'
      '    startdatetime,'
      '    1 as dir,'
      '    t.warecode as fuelextcode,'
      '    w.name as fuelname,'
      '    i.tanknum,'
      '    i.price as price,'
      '    '#39'18'#39' as nds,'
      '    i.density as density,'
      '    '#39'EMPTY'#39' as pmec,'
      '    '#39#39' as paymentmodename,'
      '    i.partnerextcode, '
      '       sum(i.volume) as volume,'
      '    sum(volume * price) as amount'
      '    from sessions s'
      '    join incomesbydischarge i on s.id = i.session_id'
      '    join         (select session_id, tanknum, warecode, density'
      '            from iotankshoses where session_id=:session_id'
      '                group by'
      '                session_id, tanknum, warecode, density'
      '                ) t on t.session_id = s.id'
      '    join wares w on t.warecode = w.code'
      '   where'
      '    i.session_id = :session_id'
      '    and i.tanknum = t.tanknum'
      '   group by sid,'
      '    azscode,sessionnum,startdatetime,'
      '    dir,'
      '    fuelextcode,fuelname,'
      '    tanknum,'
      '    price,'
      '    nds,'
      '    density,'
      '    pmec,'
      '    paymentmodename,'
      '    partnerextcode'
      '/* techreturn */'
      'union all'
      'select'
      '    s.id as sid,'
      '    s.azscode as azscode,'
      '    sessionnum,'
      '    '#39'I'#39' as tbl,'
      '    startdatetime,'
      '    1 as dir,'
      '    t.warecode as fuelextcode,'
      '    w.name as fuelname,'
      '    i.tanknum,'
      '    0 as price,'
      '    '#39'18'#39' as nds,'
      '    i.density as density,'
      '    '#39'01'#1058#1055'00'#39' as pmec,'
      '    '#39#39' as paymentmodename,'
      '    '#39'EMPTY'#39' as partnerextcode,'
      '       sum(i.volume) as volume,'
      '    sum(0) as amount'
      '    from sessions s'
      '    join techreturn i on s.id = i.session_id'
      '    join         (select session_id, tanknum, warecode, density'
      '            from iotankshoses where session_id=:session_id'
      '                group by'
      '                session_id, tanknum, warecode, density'
      '                ) t on t.session_id = s.id'
      '    join wares w on t.warecode = w.code'
      '   where'
      '    i.session_id = :session_id'
      '    and i.tanknum = t.tanknum'
      '   group by sid,'
      '    azscode,sessionnum,startdatetime,'
      '    dir,'
      '    fuelextcode,fuelname,'
      '    tanknum,'
      '    price,'
      '    nds,'
      '    density,'
      '    pmec,'
      '    paymentmodename,'
      '    partnerextcode'
      ''
      ' ) as a'
      '    join  wares as w'
      '        on a.fuelextcode=w.code'
      '    join contragents p'
      '        on a.partnerextcode = p.code'
      '    left join contracts c'
      '        on a.partnerextcode = c.partner_code'
      '    where sid = :session_id'
      '    group by'
      '        sid,'
      '        azscode,'
      '        tbl,'
      '        direction,'
      '        contract_id,'
      '        fuelextcode,'
      '        tanknum,'
      '        pmec,'
      '        price,'
      '        density,'
      '        partnerextcode,'
      '        ei,'
      '        nds,'
      '        lastuser_id,'
      '        updated_at,'
      '        state'
      '   order by'
      '        sid,'
      '        direction,'
      '        pmec,'
      '        partnerextcode')
    Left = 128
    Top = 200
  end
  object FDQueryForIOTANKSHOSES: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    UpdateTransaction = FDTransactionUpd
    SQL.Strings = (
      'insert into iotankshoses'
      '('
      '    session_id,'
      '    azscode, '
      '    tanknum,'
      '    startfuelvolume,'
      '    endfactvolume,'
      '    density,'
      '    temperature,'
      '    height,'
      '    mass,'
      '    water,'
      '    deadrest,'
      '    deadrestliter,'
      '    warecode,'
      '    hosenum,'
      '    startcounter,'
      '    endcounter,'
      '    pumpnum,'
      '    numinpump,'
      '    hosetype,'
      '   volume,'
      '   invol,'
      '    lastuser_id,'
      '    updated_at,'
      '    state'
      ')'
      'select distinct'
      '    s.id, '
      '    s.azscode,'
      '    t.tanknum,'
      '    t.startfuelvolume,'
      '    t.endfactvolume,'
      '    t.enddensity,'
      '    t.endtemperature,'
      '    t.endheight,'
      '    t.endmass,'
      '    t.endwater,'
      '    t.deadrest,'
      '    t.deadrestliter,'
      '    t.warecode,'
      '    h.hosenum,'
      '    h.startcounter,'
      '    h.endcounter,'
      '    h.pumpnum,'
      '    h.numinpump,'
      '    h.hosetype,'
      '    sum(coalesce(o.volume, 0)) as volume,'
      '--    sum(ss.volume) as invol,'
      '     ss.volume as invol,'
      '     1 as lastuser_id,'
      '    current_timestamp as updated_at,'
      '    0 as state'
      ''
      '    from'
      '    hoses h'
      '    inner join tanks t on h.tanknum = t.tanknum'
      '    join sessions s on s.id = h.session_id'
      '    left join outcomesbyretail o on '
      '       (o.session_id=s.id and o.tanknum=t.tanknum '
      '            and h.hosenum=cast(o.hosename as integer))'
      '    left join (select volume, sid, tnum '
      '         from calcincomes0(:session_id)) ss '
      '             on ss.tnum=t.tanknum and ss.sid = s.id'
      ''
      '    where t.session_id = :session_id'
      '            and s.id = t.session_id'
      '    group by'
      '    s.id, '
      '    s.azscode,'
      '    t.tanknum,'
      '    t.startfuelvolume,'
      '    t.endfactvolume,'
      '    t.enddensity,'
      '    t.endtemperature,'
      '    t.endheight,'
      '    t.endmass,'
      '    t.endwater,'
      '    t.deadrest,'
      '    t.deadrestliter,'
      '    t.warecode,'
      '    h.hosenum,'
      '    h.startcounter,'
      '    h.endcounter,'
      '    h.pumpnum,'
      '    h.numinpump,'
      '    h.hosetype,'
      '    invol,'
      '    lastuser_id,'
      '    updated_at,'
      '    state'
      ''
      '    order by t.tanknum')
    Left = 136
    Top = 264
    ParamData = <
      item
        Name = 'SESSION_ID'
        ParamType = ptInput
      end>
  end
  object OptQuery: TFDQuery
    Connection = FDConnection
    Transaction = FDTransactionH_r
    UpdateTransaction = FDTransactionH_r
    Left = 296
    Top = 232
  end
  object FDTransactionUpd: TFDTransaction
    Options.Isolation = xiSnapshot
    Options.AutoStart = False
    Options.AutoStop = False
    Options.DisconnectAction = xdRollback
    Connection = FDConnection
    Left = 296
    Top = 120
  end
  object LogQuery: TFDQuery
    Connection = FDConnection
    Transaction = LogTran
    UpdateTransaction = LogTranUpd
    Left = 360
    Top = 176
  end
  object LogTran: TFDTransaction
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = FDConnection
    Left = 416
    Top = 176
  end
  object LogTranUpd: TFDTransaction
    Options.Isolation = xiSnapshot
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = FDConnection
    Left = 472
    Top = 176
  end
  object FDQueryForInOutItems: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    UpdateTransaction = FDTransactionUpd
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvParamCreate]
    ResourceOptions.ParamCreate = False
    SQL.Strings = (
      'insert into INOUTITEMS'
      '    (SESSION_ID,'
      '     AZSCODE,'
      '     TBL,'
      '    DIRECTION,'
      '    CLIENT_CODE,'
      '    CONTRACT_ID,'
      '    PAYMENT_CODE,'
      '    ITEM_CODE,'
      '    AMOUNT,'
      '    EI,'
      '    PRICE,'
      '    SUMM,'
      '    NDS,'
      '    WHOLE,'
      '   quantity,'
      '    LASTUSER_ID,'
      '    UPDATED_AT,'
      '    STATE)'
      ''
      'select'
      '    sid,'
      '    azscode,'
      '    tbl,'
      '    dir as direction,'
      '    partnerextcode,'
      '    c.id as contract_id,'
      '    pmec,'
      '    a.itemextcode,'
      '    sum(amount) as amount,'
      '    '#39'i'#39' as ei,'
      '    price,'
      '    sum(price * quantity) as summ,'
      '    nds as nds,'
      
        '    sum(price * quantity + price * quantity * cast(nds as intege' +
        'r) / 100.0) as whole,'
      '    sum(quantity) as quantity,'
      '    1 as lastuser_id,'
      '    current_timestamp as updated_at,'
      '    0 as state'
      '    from'
      ''
      '(select'
      '    s.id as sid,'
      '    s.azscode as azscode,'
      '    sessionnum,'
      '    '#39'R'#39' as tbl,'
      '    startdatetime,'
      '    0 as dir,'
      '    r.itemextcode as itemextcode,'
      '    w.name as itemname,'
      '    priceretail as price,'
      '    '#39'18'#39' as nds,'
      '    r.paymentmodeextcode as pmec,'
      '    r.paymentmodename,'
      '    r.partnerextcode, '
      '    sum(r.quantity) as quantity,'
      '    sum(r.amount) as amount'
      '    from sessions s'
      '    join itemoutcomesbyretail r on s.id = r.session_id'
      '    join items w on r.itemextcode = w.code'
      '   where'
      '    r.session_id = :session_id'
      '   group by sid,'
      '    azscode,sessionnum,startdatetime,'
      '    dir,'
      '    itemextcode,'
      '    itemname,'
      '    price,'
      '    nds,'
      '    paymentmodeextcode,'
      '    paymentmodename,'
      '    partnerextcode'
      '-- tradedocsinbills'
      'union all'
      'select'
      '    s.id as sid,'
      '    s.azscode as azscode,'
      '    sessionnum,'
      '    '#39'I'#39' as tbl,'
      '    startdatetime,'
      '    1 as dir,'
      '    b.itemextcode as itemexttcode,'
      '    w.name as itemname,'
      '    b.price as price,'
      '    b.ndsname as nds,'
      '    '#39'EMPTY'#39' as pmec,'
      '    '#39#39' as paymentmodename,'
      '    i.partnerextcode, '
      '    sum(b.quantity) as quantity,'
      '    sum(quantity * b.price) as amount'
      '    from sessions s'
      '    join tradedocsinbill i on s.id = i.session_id'
      '    join tdb_items b on b.bill_id = i.id'
      '    join items w on b.itemextcode = w.code'
      '   where'
      '    i.session_id = :session_id'
      '   group by sid,'
      '    azscode,sessionnum,startdatetime,'
      '    dir,'
      '    itemextcode,'
      '    itemname,'
      '    price,'
      '    ndsname,'
      '    pmec,'
      '    paymentmodename,'
      '    partnerextcode'
      '-- itemoutcomesbypaysheet'
      '/*'
      'union all'
      'select'
      '    s.id as sid,'
      '    s.azscode as azscode,'
      '    sessionnum,'
      '    '#39'O'#39' as tbl,'
      '    startdatetime,'
      '    0 as dir,'
      '    i.itemextcode as itemextcode,'
      '    w.name as itemname,'
      '    price,'
      '    '#39'18'#39' as nds,'
      '    i.paymentmodeextcode as pmec,'
      '    i.paymentmodename,'
      '    i.partnerextcode,'
      '    sum(i.quantity) as quantity,'
      '    sum(quantity * price) as amount'
      '    from sessions s'
      '    join itemoutcomesbypaysheet i on s.id = i.session_id'
      '    join items w on i.itemextcode = w.code'
      '   where'
      '    i.session_id = :session_id'
      '   group by sid,'
      '    azscode,sessionnum,startdatetime,'
      '    dir,'
      '    itemextcode,itemname,'
      '    price,'
      '    nds,'
      '    pmec,'
      '    paymentmodename,'
      '    partnerextcode'
      '*/'
      ') as a'
      '    join  items as w'
      '        on a.itemextcode=w.code'
      '    join contragents p'
      '        on a.partnerextcode = p.code'
      '    left join contracts c'
      '        on a.partnerextcode = c.partner_code'
      '    where sid = :session_id'
      '    group by'
      '        sid,'
      '        azscode,'
      '        tbl,'
      '        direction,'
      '        contract_id,'
      '        itemextcode,'
      '        pmec,'
      '        price,'
      '        partnerextcode,'
      '        ei,'
      '        nds,'
      '        lastuser_id,'
      '        updated_at,'
      '        state'
      '   order by'
      '        sid,'
      '        direction,'
      '        pmec,'
      '        partnerextcode')
    Left = 128
    Top = 344
  end
  object QUpdUId: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    UpdateTransaction = FDTransactionUpd
    FetchOptions.AssignedValues = [evAutoFetchAll]
    FetchOptions.AutoFetchAll = afTruncate
    SQL.Strings = (
      
        'update !table set lastuser_id=:lastuser_id where session_id=:ses' +
        'sion_id')
    Left = 248
    Top = 344
    ParamData = <
      item
        Name = 'LASTUSER_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SESSION_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    MacroData = <
      item
        Value = ''
        Name = 'TABLE'
      end>
  end
  object QuUpdTran: TFDTransaction
    Options.Isolation = xiSnapshot
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = FDConnection
    Left = 448
    Top = 344
  end
  object AddTanksProc: TFDStoredProc
    Connection = FDConnection
    Transaction = FDTransaction
    UpdateTransaction = FDTransactionUpd
    StoredProcName = 'ADDTANKS'
    Left = 128
    Top = 400
  end
  object DriverLink: TFDPhysFBDriverLink
    DriverID = 'FB'
    VendorLib = 'C:\Program Files\Firebird\Firebird_2_5\WOW64\fbclient.dll'
    Left = 400
    Top = 56
  end
  object FDQueryWP: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    UpdateTransaction = FDTransactionUpd
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvParamCreate]
    ResourceOptions.ParamCreate = False
    Left = 96
    Top = 104
  end
end
