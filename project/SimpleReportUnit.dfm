inherited SimpleReportForm: TSimpleReportForm
  Caption = 'Simple Report'
  PixelsPerInch = 96
  TextHeight = 13
  inherited JvStatusBar1: TJvStatusBar
    Panels = <
      item
        Width = 50
      end
      item
        Width = 100
      end
      item
        Width = 100
      end>
  end
  inherited JvDBGrid: TJvDBUltimGrid
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
  end
  inherited ActionList: TActionList
    object ToXlsAction: TAction
      Caption = 'XLS'
      Hint = 'To XLS'
      ImageIndex = 146
      OnExecute = ToXlsActionExecute
    end
  end
  inherited MainMenu: TMainMenu
    inherited File1: TMenuItem
      Caption = #1055#1088#1086#1089#1090#1086#1081' '#1086#1090#1095#1105#1090
      object XLS1: TMenuItem [0]
        Action = ToXlsAction
      end
    end
  end
  inherited JvDS: TJvDataSource
    AutoEdit = False
  end
  inherited FDQuery: TFDQuery
    Connection = DM.FDConnection
    Transaction = DM.FDTransaction
    SQL.Strings = (
      ' select'
      '    sid,'
      '    startdatetime,'
      '    fuelname,'
      '    hose,'
      '    scnt,'
      '    ecnt,'
      '    tanknum,'
      '    density,'
      '/*    pmec, */'
      '    sum(volume) as volume,'
      '    sum(amount) as amount'
      '    from'
      '(select'
      '    s.id as sid,'
      '    azscode,'
      '    sessionnum,'
      '    startdatetime,'
      '    '#39'R'#39' as tbl,'
      '    r.fuelextcode,'
      '    r.fuelname,'
      '    cast (r.hosename as integer) as hose,'
      '    h.startcounter as scnt,'
      '    h.endcounter as ecnt,'
      '    r.tanknum, '
      '    t.enddensity as density,'
      '    (h.endcounter - h.startcounter) as hdiff,'
      '    r.paymentmodeextcode as pmec,'
      '    r.paymentmodename,'
      '    sum(r.volume) as volume,'
      '    sum(r.amount) as amount'
      '    from sessions s'
      '    join outcomesbyretail r on s.id = r.session_id'
      '    join Hoses h on s.id = h.session_id'
      '    join tanks t on t.session_id = s.id'
      '   where'
      '    azscode = :azscode'
      '    and  startdatetime >= cast(:sdt as timestamp) '
      '    and enddatetime <= cast(:edt as timestamp)'
      '    /*and r.fuelextcode = '#39'00000000001'#39'*/'
      '    and cast(r.hosename as integer) = h.hosenum'
      '    and r.tanknum = t.tanknum'
      '   group by sid,'
      '    azscode,sessionnum,startdatetime,'
      '    tbl,'
      '    hose, hdiff,'
      '    fuelextcode,fuelname,'
      '    startcounter,endcounter,'
      '    tanknum, density,'
      '    paymentmodeextcode,paymentmodename'
      'union'
      'select'
      '    s.id as sid,'
      '    azscode,'
      '    sessionnum,'
      '    startdatetime,'
      '    '#39'O'#39' as tbl,'
      '    r.fuelextcode,'
      '    r.fuelname,'
      '    cast (r.hosename as integer) as hose,'
      '    h.startcounter as scnt,'
      '    h.endcounter as ecnt,'
      '    r.tanknum, '
      '    t.enddensity as density,'
      '    (h.endcounter - h.startcounter) as hdiff,'
      '    r.paymentmodeextcode as pmec,'
      '    r.paymentmodename,'
      '    sum(r.volume) as volume,'
      '    sum(r.amount) as amount'
      '    from sessions s'
      '    join outcomesbyretail r on s.id = r.session_id'
      '    join Hoses h on s.id = h.session_id'
      '    join tanks t on t.session_id = s.id'
      '   where'
      '    azscode = :azscode'
      '    and  startdatetime >= cast(:sdt as timestamp)'
      '    and  enddatetime >= cast(:edt as timestamp)'
      '/*    and r.fuelextcode = '#39'00000000001'#39' */'
      '    and cast(r.hosename as integer) = h.hosenum'
      '    and r.tanknum = t.tanknum'
      '   group by sid,'
      '    azscode,sessionnum,startdatetime,'
      '    tbl,'
      '    hose, hdiff,'
      '    fuelextcode,fuelname,'
      '    startcounter,endcounter,'
      '    tanknum, density,'
      '    paymentmodeextcode,paymentmodename'
      ' )'
      '    group by'
      '        sid,'
      '        startdatetime,'
      '       fuelname,'
      '        hose,'
      '        scnt,'
      '        ecnt,'
      '        tanknum,'
      '        density /*,'
      '        pmec   */'
      '    order by startdatetime')
    ParamData = <
      item
        Name = 'AZSCODE'
        ParamType = ptInput
      end
      item
        Name = 'SDT'
        ParamType = ptInput
      end
      item
        Name = 'EDT'
        ParamType = ptInput
      end>
  end
end
