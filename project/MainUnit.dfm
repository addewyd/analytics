object MainForm: TMainForm
  Left = 0
  Top = 0
  Action = SimpleReportAction
  Caption = 'Main'
  ClientHeight = 619
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
  OnActivate = FormActivate
  OnClick = SimpleReportActionExecute
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 600
    Width = 733
    Height = 19
    Panels = <
      item
        Text = 'db'
        Width = 150
      end
      item
        Width = 150
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 733
    Height = 29
    Caption = 'ToolBar1'
    Images = DM.imlist
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
    object ToolButton4: TToolButton
      Left = 138
      Top = 0
      Action = AboutAction
    end
    object ToolButton6: TToolButton
      Left = 161
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 131
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 169
      Top = 0
      Hint = 'Quit'
      Action = CloseAction
      ImageIndex = 130
    end
    object ToolButton10: TToolButton
      Left = 192
      Top = 0
      Action = WindowCascade1
      ImageIndex = 12
    end
    object ToolButton11: TToolButton
      Left = 215
      Top = 0
      Action = WindowTileHorizontal1
      ImageIndex = 14
    end
    object ToolButton12: TToolButton
      Left = 238
      Top = 0
      Action = WindowTileVertical1
      ImageIndex = 15
    end
    object ToolButton7: TToolButton
      Left = 261
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 142
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 269
      Top = 0
      Action = ClearDBAction
    end
  end
  object MainMenuM: TMainMenu
    Left = 16
    Top = 40
    object File1: TMenuItem
      Caption = 'File'
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
      Caption = 'Sessions'
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
    object Options1: TMenuItem
      Caption = 'Options'
      GroupIndex = 50
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
      Caption = 'Quit'
      ImageIndex = 48
      OnExecute = CloseActionExecute
    end
    object AboutAction: TAction
      Caption = 'About'
      Hint = 'About'
      ImageIndex = 223
      OnExecute = AboutActionExecute
    end
    object LoadFileAction: TAction
      Caption = 'Load File'
      Hint = 'Load file'
      ImageIndex = 68
      OnExecute = LoadFileActionExecute
    end
    object LoadDirAction: TAction
      Caption = 'Load Dir'
      OnExecute = LoadDirActionExecute
    end
    object ClearDBAction: TAction
      Caption = 'Clear DB'
      Hint = 'Delete ALL data'
      ImageIndex = 141
      OnExecute = ClearDBActionExecute
    end
    object SessionsAction: TAction
      Caption = 'Sessions'
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
      OnExecute = CatGSMActionExecute
    end
    object CatPartnersAction: TAction
      Caption = #1055#1072#1088#1090#1085#1105#1088#1099
      OnExecute = CatPartnersActionExecute
    end
    object CatItemsAction: TAction
      Caption = #1058#1086#1074#1072#1088#1099
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
    Left = 248
    Top = 136
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
    AutoStartSession = True
    SessionState = True
    OnCommandGet = HTTPServerCommandGet
    Left = 352
    Top = 72
  end
  object IdLogFile: TIdLogFile
    Intercept = IdLogEvent
    Left = 432
    Top = 80
  end
  object IdLogEvent: TIdLogEvent
    Left = 432
    Top = 136
  end
  object IdServerInterceptLogFile: TIdServerInterceptLogFile
    Filename = 'c:\wprc\shrfs.log'
    Left = 360
    Top = 200
  end
end
