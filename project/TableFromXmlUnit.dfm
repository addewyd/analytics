inherited TableFromXmlForm: TTableFromXmlForm
  Caption = 'table'
  ClientHeight = 361
  ClientWidth = 587
  OnActivate = FormActivate
  ExplicitWidth = 603
  ExplicitHeight = 420
  PixelsPerInch = 96
  TextHeight = 13
  inherited JvToolBar1: TJvToolBar
    Width = 587
    ExplicitWidth = 587
  end
  inherited JvStatusBar1: TJvStatusBar
    Top = 342
    Width = 587
    ExplicitTop = 342
    ExplicitWidth = 587
  end
  inherited JvDBGridFooter: TJvDBGridFooter
    Top = 323
    Width = 587
    Visible = True
    Columns = <
      item
        FieldName = 'id'
      end>
    ExplicitTop = 323
    ExplicitWidth = 587
  end
  inherited JvDBGrid: TJvDBUltimGrid
    Top = 55
    Width = 587
    Height = 268
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    OnColExit = JvDBGridColExit
    OnExit = JvDBGridExit
    IniStorage = nil
    OnEditChange = JvDBGridEditChange
    OnCanEditCell = JvDBGridCanEditCell
  end
  object JvPanel1: TJvPanel [4]
    Left = 0
    Top = 29
    Width = 587
    Height = 26
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 4
    object JvStaticText1: TJvStaticText
      Left = 8
      Top = 3
      Width = 26
      Height = 17
      Align = alCustom
      Caption = 'Azs'
      Layout = tlTop
      TabOrder = 0
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object JvDBCB01: TJvDBLookupCombo
      Left = 40
      Top = 1
      Width = 145
      Height = 20
      Enabled = False
      LookupField = 'azscode'
      LookupDisplay = 'azscode'
      LookupSource = JvDSF01
      TabOrder = 1
      OnChange = JvDBCB01Change
    end
    object JvCheckBox01: TJvCheckBox
      Left = 190
      Top = 2
      Width = 13
      Height = 17
      TabOrder = 2
      OnClick = JvCheckBox01Click
      LinkedControls = <>
    end
    object JvDateStartP: TJvDateTimePicker
      Left = 209
      Top = 1
      Width = 136
      Height = 20
      Date = 43372.739786782400000000
      Time = 43372.739786782400000000
      Enabled = False
      TabOrder = 3
      OnChange = JvDateStartPChange
      DropDownDate = 43372.000000000000000000
    end
    object JvDateEndP: TJvDateTimePicker
      Left = 373
      Top = 1
      Width = 136
      Height = 21
      Date = 43372.740569930550000000
      Time = 43372.740569930550000000
      Enabled = False
      TabOrder = 4
      OnChange = JvDateEndPChange
      DropDownDate = 43372.000000000000000000
    end
    object JvCheckBox02: TJvCheckBox
      Left = 351
      Top = 1
      Width = 13
      Height = 17
      TabOrder = 5
      OnClick = JvCheckBox02Click
      LinkedControls = <>
    end
    object JvCheckBox03: TJvCheckBox
      Left = 515
      Top = 1
      Width = 13
      Height = 17
      TabOrder = 6
      OnClick = JvCheckBox03Click
      LinkedControls = <>
    end
  end
  inherited JvFS: TJvFormStorage
    BeforeSavePlacement = JvFSBeforeSavePlacement
    BeforeRestorePlacement = JvFSBeforeRestorePlacement
  end
  inherited JvDS: TJvDataSource
    OnStateChange = JvDSStateChange
    OnDataChange = JvDSDataChange
    OnUpdateData = JvDSUpdateData
  end
  inherited FDQuery: TFDQuery
    FilterOptions = [foCaseInsensitive]
    FetchOptions.AssignedValues = [evCache, evUnidirectional]
    FetchOptions.Cache = [fiBlobs, fiDetails]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    Left = 296
    Top = 136
  end
  object JvDSF01: TJvDataSource
    DataSet = FDQF01
    Left = 408
    Top = 80
  end
  object FDQF01: TFDQuery
    Left = 464
    Top = 80
  end
  object FDUpdateSQL: TFDUpdateSQL
    Connection = DM.FDConnection
    Left = 408
    Top = 192
  end
end
