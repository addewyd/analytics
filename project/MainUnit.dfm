object MainForm: TMainForm
  Left = 0
  Top = 0
  Action = AboutAction
  Caption = 'Shrfs'
  ClientHeight = 619
  ClientWidth = 733
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClick = AboutActionExecute
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
    object ToolButton4: TToolButton
      Left = 69
      Top = 0
      Action = AboutAction
    end
    object ToolButton6: TToolButton
      Left = 92
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 131
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 100
      Top = 0
      Hint = 'Quit'
      Action = CloseAction
      ImageIndex = 130
    end
    object ToolButton7: TToolButton
      Left = 123
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 131
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 131
      Top = 0
      Action = ClearDBAction
    end
  end
  object MainMenu: TMainMenu
    Left = 16
    Top = 40
    object File1: TMenuItem
      Caption = 'File'
      object LoadFile1: TMenuItem
        Action = LoadFileAction
      end
      object LoadDir1: TMenuItem
        Action = LoadDirAction
      end
      object Close1: TMenuItem
        Action = CloseAction
      end
    end
    object Sessions1: TMenuItem
      Caption = 'Sessions'
      object Sessions2: TMenuItem
        Action = SessionsAction
      end
    end
    object Options1: TMenuItem
      Caption = 'Options'
    end
    object Service1: TMenuItem
      Caption = 'Service'
      object ClearDB1: TMenuItem
        Action = ClearDBAction
      end
      object N1: TMenuItem
        Action = StationsAction
      end
    end
    object About1: TMenuItem
      Action = AboutAction
    end
  end
  object ActionList: TActionList
    Images = DM.imlist
    Left = 72
    Top = 48
    object CloseAction: TAction
      Caption = 'Quit'
      ImageIndex = 48
      OnExecute = CloseActionExecute
    end
    object AboutAction: TAction
      Caption = 'About'
      Hint = 'About'
      ImageIndex = 31
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
      ImageIndex = 320
      OnExecute = StationsActionExecute
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
end
