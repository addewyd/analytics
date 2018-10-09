object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'SHRFS'
  ClientHeight = 522
  ClientWidth = 733
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenuM
  OldCreateOrder = False
  ShowHint = False
  OnActivate = FormActivate
  OnClick = FormClick
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 503
    Width = 733
    Height = 19
    Panels = <
      item
        Text = 'db'
        Width = 260
      end
      item
        Width = 240
      end
      item
        Text = 'HTTP'
        Width = 140
      end>
    ExplicitTop = 600
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 733
    Height = 29
    Customizable = True
    Images = DM.imlist
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ToolBar1Click
    object ToolButton3: TToolButton
      Left = 0
      Top = 0
      Action = LoadFileAction
    end
    object ToolButton5: TToolButton
      Left = 23
      Top = 0
      Action = SessionsAction
    end
    object ToolButton8: TToolButton
      Left = 46
      Top = 0
      Action = StationsAction
    end
    object ToolButton14: TToolButton
      Left = 69
      Top = 0
      Action = PaimentModesAction
    end
    object ToolButton9: TToolButton
      Left = 92
      Top = 0
      Action = XmlTablesAction
    end
    object ToolButton13: TToolButton
      Left = 115
      Top = 0
      Action = SimpleReportAction
    end
    object ToolButton15: TToolButton
      Left = 138
      Top = 0
      Action = OptionsAction
    end
    object ToolButton4: TToolButton
      Left = 161
      Top = 0
      Action = AboutAction
    end
    object ToolButton6: TToolButton
      Left = 184
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 131
      Style = tbsSeparator
    end
    object ToolButton16: TToolButton
      Left = 192
      Top = 0
      Width = 8
      Caption = 'ToolButton16'
      ImageIndex = 142
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 200
      Top = 0
      Action = WindowCascade1
      ImageIndex = 12
    end
    object ToolButton11: TToolButton
      Left = 223
      Top = 0
      Action = WindowTileHorizontal1
      ImageIndex = 14
    end
    object ToolButton12: TToolButton
      Left = 246
      Top = 0
      Action = WindowTileVertical1
      ImageIndex = 15
    end
    object dtb1: TToolButton
      Left = 269
      Top = 0
      Width = 23
      Caption = 'dtb1'
      Enabled = False
      Style = tbsDivider
    end
    object ToolButton7: TToolButton
      Left = 292
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 142
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 300
      Top = 0
      Margins.Left = 20
      Margins.Right = 20
      Action = ClearDBAction
    end
    object dtb2: TToolButton
      Left = 323
      Top = 0
      Width = 23
      Caption = 'dtb2'
      Enabled = False
      Style = tbsDivider
    end
    object ToolButton17: TToolButton
      Left = 346
      Top = 0
      Width = 9
      Caption = 'ToolButton17'
      ImageIndex = 131
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 355
      Top = 0
      Hint = 'Quit'
      Action = CloseAction
      ImageIndex = 130
    end
  end
  object MainMenuM: TMainMenu
    Left = 16
    Top = 40
    object File1: TMenuItem
      Caption = #1060#1072#1081#1083
      GroupIndex = 10
      object LoadFile1: TMenuItem
        Action = LoadFileAction
        GroupIndex = 12
      end
      object LoadDir1: TMenuItem
        Action = LoadDirAction
        GroupIndex = 14
      end
      object Close1: TMenuItem
        Action = CloseAction
        GroupIndex = 16
      end
    end
    object Sessions1: TMenuItem
      Caption = #1057#1084#1077#1085#1099
      GroupIndex = 20
      object Sessions2: TMenuItem
        Action = SessionsAction
        GroupIndex = 22
      end
    end
    object N2: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      GroupIndex = 50
      object N3: TMenuItem
        Action = CatGSMAction
      end
      object N4: TMenuItem
        Action = CatPartnersAction
      end
      object N5: TMenuItem
        Action = CatItemsAction
      end
      object N7: TMenuItem
        Action = PaimentModesAction
      end
    end
    object Service1: TMenuItem
      Caption = 'Service'
      GroupIndex = 50
      object ClearDB1: TMenuItem
        Action = ClearDBAction
        GroupIndex = 42
      end
      object N1: TMenuItem
        Action = StationsAction
        GroupIndex = 44
      end
      object XML1: TMenuItem
        Action = XmlTablesAction
        GroupIndex = 44
      end
      object N6: TMenuItem
        Action = SimpleReportAction
        GroupIndex = 44
      end
      object N8: TMenuItem
        Action = OptionsAction
        GroupIndex = 44
      end
    end
    object About1: TMenuItem
      Action = AboutAction
      GroupIndex = 50
    end
  end
  object ActionList: TActionList
    Images = DM.imlist
    Left = 80
    Top = 56
    object CloseAction: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 48
      OnExecute = CloseActionExecute
    end
    object AboutAction: TAction
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      Hint = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      ImageIndex = 223
      OnExecute = AboutActionExecute
    end
    object LoadFileAction: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083
      ImageIndex = 68
      OnExecute = LoadFileActionExecute
    end
    object LoadDirAction: TAction
      Caption = 'Load Dir'
      OnExecute = LoadDirActionExecute
    end
    object ClearDBAction: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1042#1057#1045' '#1076#1072#1085#1085#1099#1077
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1042#1057#1045' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 141
      OnExecute = ClearDBActionExecute
    end
    object SessionsAction: TAction
      Caption = #1057#1084#1077#1085#1099
      Hint = #1057#1084#1077#1085#1099
      ImageIndex = 80
      OnExecute = SessionsActionExecute
    end
    object StationsAction: TAction
      Caption = #1050#1086#1076#1099' '#1040#1047#1057
      Hint = #1040#1047#1057
      ImageIndex = 320
      OnExecute = StationsActionExecute
    end
    object XmlTablesAction: TAction
      Caption = #1058#1072#1073#1083#1080#1094#1099' '#1080#1079' XML'
      Hint = #1058#1072#1073#1083#1080#1094#1099' '#1086#1090' '#1058#1086#1087#1072#1079#1072
      ImageIndex = 353
      OnExecute = XmlTablesActionExecute
    end
    object WindowCascade1: TWindowCascade
      Category = 'Window'
      Caption = '&Cascade'
      Hint = 'Cascade'
      ImageIndex = 382
    end
    object WindowTileHorizontal1: TWindowTileHorizontal
      Category = 'Window'
      Caption = 'Tile &Horizontally'
      Hint = 'Tile Horizontal'
      ImageIndex = 383
    end
    object WindowTileVertical1: TWindowTileVertical
      Category = 'Window'
      Caption = '&Tile Vertically'
      Hint = 'Tile Vertical'
      ImageIndex = 384
    end
    object CatGSMAction: TAction
      Caption = #1043#1057#1052
      Hint = #1043#1057#1052
      OnExecute = CatGSMActionExecute
    end
    object CatPartnersAction: TAction
      Caption = #1055#1072#1088#1090#1085#1105#1088#1099
      Hint = #1055#1072#1088#1090#1085#1105#1088#1099
      OnExecute = CatPartnersActionExecute
    end
    object CatItemsAction: TAction
      Caption = #1058#1086#1074#1072#1088#1099
      Hint = #1058#1086#1074#1072#1088#1099
      OnExecute = CatItemsActionExecute
    end
    object SimpleReportAction: TAction
      Caption = #1055#1088#1086#1089#1090#1086#1081' '#1054#1090#1095#1105#1090
      Hint = #1055#1088#1086#1089#1090#1086#1081' '#1054#1090#1095#1105#1090
      ImageIndex = 188
      OnExecute = SimpleReportActionExecute
    end
    object PaimentModesAction: TAction
      Caption = #1042#1080#1076#1099' '#1054#1087#1083#1072#1090#1099
      Hint = #1042#1080#1076#1099' '#1054#1087#1083#1072#1090#1099
      ImageIndex = 24
      OnExecute = PaimentModesActionExecute
    end
    object OptionsAction: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 62
      OnExecute = OptionsActionExecute
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnException = ApplicationEventsException
    Left = 176
    Top = 48
  end
  object JvOpenDialog: TJvOpenDialog
    Filter = 'session xml|close*.xml'
    Height = 0
    Width = 0
    Left = 48
    Top = 216
  end
  object JvSelectDirectory1: TJvSelectDirectory
    Left = 48
    Top = 280
  end
  object XMLDoc: TXMLDocument
    Left = 208
    Top = 128
    DOMVendorDesc = 'ADOM XML v4'
  end
  object JvAppRS: TJvAppRegistryStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    Root = 'Software\Shrfs'
    SubStorages = <>
    Left = 48
    Top = 368
  end
  object JvFS: TJvFormStorage
    AppStorage = JvAppRS
    AppStoragePath = '%FORM_NAME%\'
    StoredValues = <>
    Left = 48
    Top = 416
  end
  object HTTPServer: TIdHTTPServer
    Bindings = <>
    DefaultPort = 8033
    Intercept = IdServerInterceptLogFile
    OnException = HTTPServerException
    OnCommandOther = HTTPServerCommandOther
    OnCommandGet = HTTPServerCommandGet
    Left = 320
    Top = 72
  end
  object IdServerInterceptLogFile: TIdServerInterceptLogFile
    Filename = 'c:\wprc\shrfs.log'
    Left = 320
    Top = 128
  end
end
