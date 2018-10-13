inherited FormWithGrid: TFormWithGrid
  Caption = 'FormWithGrid'
  PixelsPerInch = 96
  TextHeight = 13
  inherited JvToolBar1: TJvToolBar
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Action = RefreshAction
      ParentShowHint = False
      ShowHint = True
    end
  end
  inherited JvStatusBar1: TJvStatusBar
    Top = 243
    ExplicitTop = 243
  end
  object JvDBGridFooter: TJvDBGridFooter [2]
    Left = 0
    Top = 262
    Width = 418
    Height = 19
    SizeGrip = True
    Visible = False
    Columns = <>
    DataSource = JvDS
    DBGrid = JvDBGrid
  end
  object JvDBGrid: TJvDBUltimGrid [3]
    Left = 0
    Top = 29
    Width = 418
    Height = 214
    Align = alClient
    DataSource = JvDS
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
    CanDelete = False
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        Visible = True
      end>
  end
  inherited JvFS: TJvFormStorage
    StoredValues = <
      item
      end>
  end
  inherited ActionList: TActionList
    object RefreshAction: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 328
      OnExecute = RefreshActionExecute
    end
  end
  inherited MainMenu: TMainMenu
    inherited File1: TMenuItem
      object N1: TMenuItem [0]
        Action = RefreshAction
      end
    end
  end
  object JvDS: TJvDataSource
    DataSet = FDQuery
    Left = 320
    Top = 72
  end
  object FDQuery: TFDQuery
    FetchOptions.AssignedValues = [evUnidirectional]
    Left = 240
    Top = 152
  end
end
