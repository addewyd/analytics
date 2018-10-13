inherited TabForm: TTabForm
  Caption = 'Tabs'
  ClientHeight = 532
  ClientWidth = 672
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 688
  ExplicitHeight = 591
  PixelsPerInch = 96
  TextHeight = 13
  inherited JvToolBar1: TJvToolBar
    Width = 672
    ExplicitWidth = 672
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Action = CommitAction
    end
    object ToolButton3: TToolButton
      Left = 46
      Top = 0
      Action = RollbackAction
    end
  end
  inherited JvStatusBar1: TJvStatusBar
    Top = 513
    Width = 672
    ExplicitTop = 513
    ExplicitWidth = 672
  end
  object Pages: TJvPageControl [2]
    Left = 0
    Top = 29
    Width = 672
    Height = 484
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object JvPanel1: TJvPanel
        Left = 0
        Top = 0
        Width = 664
        Height = 456
        Align = alClient
        TabOrder = 0
        object Spl01: TJvSplitter
          Left = 1
          Top = 138
          Width = 662
          Height = 3
          Cursor = crVSplit
          Align = alTop
          ExplicitWidth = 224
        end
        object IOTHGrid: TJvDBUltimGrid
          Left = 1
          Top = 1
          Width = 662
          Height = 137
          Align = alTop
          DataSource = DSIOTH
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          AutoAppend = False
          IniStorage = JvFS
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          CanDelete = False
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'FUELNAME'
              PopupMenu = FuelPopupMenu
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TANKNUM'
              ReadOnly = True
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'STARTFUELVOLUME'
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'ENDFACTVOLUME'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HOSENUM'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC'
              ReadOnly = True
              Title.Caption = #1054#1090#1087#1091#1089#1082
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold, fsItalic]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALCIN'
              Title.Caption = #1055#1088#1080#1085#1103#1090#1086
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold, fsItalic]
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'STCNT'
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'ECNT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TEMPERATURE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HEIGHT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'WATER'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MASS'
              Visible = True
            end>
        end
        object RealPMFooter: TJvDBGridFooter
          Left = 1
          Top = 436
          Width = 662
          Height = 19
          SizeGrip = True
          Columns = <
            item
              FieldName = 'VOLUME_AI92'
            end
            item
              FieldName = 'VOLUME_AI95'
            end
            item
              FieldName = 'VOLUME_DT'
            end
            item
              FieldName = 'VOLUME_DTF'
            end>
          DataSource = DSRealPM
          DBGrid = RealPMGrid
          OnCalculate = RealPMFooterCalculate
        end
        object RealPMGrid: TJvDBUltimGrid
          Left = 1
          Top = 141
          Width = 662
          Height = 295
          Align = alClient
          DataSource = DSRealPM
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          AutoAppend = False
          IniStorage = JvFS
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'STDT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAYMENT_CODE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PMODE'
              Width = 115
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VOLUME_AI92'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VOLUME_AI95'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VOLUME_DT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VOLUME_DTF'
              Visible = True
            end>
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object JvPanel2: TJvPanel
        Left = 0
        Top = 0
        Width = 664
        Height = 456
        Align = alClient
        TabOrder = 0
        object GridFooterInOut: TJvDBGridFooter
          Left = 1
          Top = 436
          Width = 662
          Height = 19
          SizeGrip = True
          Columns = <
            item
              FieldName = 'VOLUME'
            end>
          DataSource = DSInOut
          DBGrid = GridInOutGSM
          OnCalculate = GridFooterInOutCalculate
          ExplicitTop = 206
          ExplicitWidth = 431
        end
        object GridInOutGSM: TJvDBUltimGrid
          Left = 1
          Top = 1
          Width = 662
          Height = 435
          Align = alClient
          DataSource = DSInOut
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          AutoAppend = False
          OnEditChange = GridInOutGSMEditChange
          AutoSizeColumns = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          CanDelete = False
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'SDATE'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIR'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FUELNAME'
              ReadOnly = True
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTNAME'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAYMENTMODE'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EI'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VOLUME'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AMOUNT'
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DENSITY'
              Width = 28
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE'
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMM'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NDS'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'WHOLE'
              Width = 38
              Visible = True
            end>
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object TabSheet4: TTabSheet
      Caption = 'TabSheet4'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  inherited JvAppRS: TJvAppRegistryStorage
    Left = 96
    Top = 360
  end
  inherited JvFS: TJvFormStorage
    Left = 56
    Top = 360
  end
  inherited ActionList: TActionList
    Left = 256
    Top = 360
    object CommitAction: TAction
      Caption = 'Commit'
      Hint = 'Commit'
      ImageIndex = 361
      OnExecute = CommitActionExecute
    end
    object RollbackAction: TAction
      Caption = 'Rollback'
      Hint = 'Rollback'
      ImageIndex = 328
      OnExecute = RollbackActionExecute
    end
  end
  inherited MainMenu: TMainMenu
    Left = 200
    Top = 360
    inherited File1: TMenuItem
      Caption = 'Tabs'
    end
  end
  object DSInOut: TJvDataSource
    DataSet = QueryInOut
    Left = 436
    Top = 117
  end
  object QueryInOut: TFDQuery
    Connection = DM.FDConnection
    Transaction = DM.FDTransaction
    UpdateTransaction = DM.FDTransaction
    FetchOptions.AssignedValues = [evAutoClose]
    FetchOptions.AutoClose = False
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.UpdateTableName = 'INOUTGSM'
    SQL.Strings = (
      'select '
      '   i.id,'
      '    iif( i.direction = 0,'#39#1056#1072#1089#1093#1086#1076#39','#39#1055#1088#1080#1093#1086#1076#39') as dir,'
      '   cast(s.startdatetime as date) as sdate,'
      '    w.name as fuelname,'
      '    c.name as clientname,'
      '    p.name as paymentmode,'
      '   i.amount,'
      '   i.ei,'
      '   i.volume,'
      '   i.price,'
      'i.density,'
      'i.nds,'
      'i.summ,'
      'i.whole'
      ''
      '   from inoutgsm i'
      '   join sessions s on s.id = i.session_id'
      '   join wares w on w.code=i.ware_code'
      '   join contragents c on c.code=i.client_code'
      '   join paymentmodes p on p.code=i.payment_code'
      ''
      '  /*where s.id  = :session_id */'
      ''
      '   order by s.id, i.direction,paymentmode,clientname')
    Left = 484
    Top = 117
  end
  object DSIOTH: TJvDataSource
    DataSet = QueryIOTH
    Left = 436
    Top = 69
  end
  object QueryIOTH: TFDQuery
    Connection = DM.FDConnection
    Transaction = DM.FDTransaction
    UpdateTransaction = DM.FDTransaction
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.UpdateTableName = 'IOTANKSHOSES'
    SQL.Strings = (
      'select'
      '    i.id,'
      '    w.name as fuelname,'
      '    i.tanknum,'
      '    i.hosenum,'
      '    i.startfuelvolume,'
      '    i.endfactvolume,'
      
        '    (select volume from calcoutcomes(s.id, i.tanknum,i.hosenum))' +
        ' as calc,'
      '    (select volume from calcincomes(s.id, i.tanknum)) as calcin,'
      '    i.startcounter as stcnt,'
      '    endcounter as ecnt,'
      '    temperature,'
      '    height,'
      '    mass,'
      '    water'
      '    from iotankshoses i'
      '    join sessions s on s.id = i.session_id'
      '    join wares w on w.code = i.warecode'
      '/*'
      '    where'
      '        s.id = :session_id */'
      'order by s.id,i.tanknum,i.hosenum')
    Left = 492
    Top = 69
  end
  object FuelPopupMenu: TPopupMenu
    Left = 84
    Top = 125
    object Add1: TMenuItem
      Caption = 'Change'
    end
  end
  object DSRealPM: TJvDataSource
    DataSet = QueryRealPM
    Left = 428
    Top = 173
  end
  object QueryRealPM: TFDQuery
    Connection = DM.FDConnection
    Transaction = DM.FDTransaction
    UpdateTransaction = DM.FDTransaction
    SQL.Strings = (
      'select'
      '    i.session_id,'
      '    cast(s.startdatetime as date) as stdt,'
      '    i.payment_code,'
      '    p.name as pmode,'
      ''
      ''
      '    sum(i.volume) as volume,'
      
        '    (select sum(i1.volume) from inoutgsm i1 join wares w1 on w1.' +
        'code=i1.ware_code'
      '        where w1.code='#39'00000000001'#39
      '            and i1.direction=0'
      '            and i1.payment_code = i.payment_code)'
      '        as volume_ai92,'
      
        '    (select sum(i1.volume) from inoutgsm i1 join wares w1 on w1.' +
        'code=i1.ware_code'
      '        where w1.code='#39'00000000030'#39
      '            and i1.direction=0'
      '            and i1.payment_code = i.payment_code)'
      '        as volume_ai95,'
      
        '    (select sum(i1.volume) from inoutgsm i1 join wares w1 on w1.' +
        'code=i1.ware_code'
      '        where w1.code='#39'00000000041'#39
      '            and i1.direction=0'
      '            and i1.payment_code = i.payment_code)'
      '        as volume_dt,'
      
        '    (select sum(i1.volume) from inoutgsm i1 join wares w1 on w1.' +
        'code=i1.ware_code'
      '        where w1.code='#39'00000000042'#39
      '            and i1.direction=0'
      '            and i1.payment_code = i.payment_code)'
      '        as volume_dtf'
      ''
      '    from inoutgsm i'
      '    join sessions s on s.id=i.session_id'
      '    join paymentmodes p on i.payment_code = p.code'
      ''
      'where i.direction = 0'
      ''
      'group by session_id,stdt,payment_code, pmode')
    Left = 500
    Top = 173
  end
end
