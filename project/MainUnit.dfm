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
    object ToolButton2: TToolButton
      Left = 0
      Top = 0
      Action = ClearDBAction
    end
    object ToolButton3: TToolButton
      Left = 23
      Top = 0
      Action = LoadFileAction
    end
    object ToolButton4: TToolButton
      Left = 46
      Top = 0
      Action = AboutAction
    end
    object ToolButton1: TToolButton
      Left = 69
      Top = 0
      Hint = 'Quit'
      Action = CloseAction
      ImageIndex = 130
    end
  end
  object logm: TJvMemo
    Left = 8
    Top = 35
    Width = 457
    Height = 502
    Lines.Strings = (
      '')
    ScrollBars = ssVertical
    TabOrder = 2
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
    object Options1: TMenuItem
      Caption = 'Options'
    end
    object Service1: TMenuItem
      Caption = 'Service'
      object ClearDB1: TMenuItem
        Action = ClearDBAction
      end
    end
    object About1: TMenuItem
      Action = AboutAction
    end
  end
  object ActionList: TActionList
    Images = DM.imlist
    Left = 72
    Top = 40
    object CloseAction: TAction
      Caption = 'Quit'
      ImageIndex = 48
      OnExecute = CloseActionExecute
    end
    object AboutAction: TAction
      Caption = 'About'
      Hint = 'About'
      ImageIndex = 28
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
  end
  object ApplicationEvents: TApplicationEvents
    OnException = ApplicationEventsException
    Left = 176
    Top = 48
  end
  object JvOpenDialog1: TJvOpenDialog
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
    SubStorages = <>
    Left = 48
    Top = 368
  end
  object JvFS: TJvFormStorage
    AppStorage = JvAppRS
    AppStoragePath = '%FORM_NAME%'
    StoredValues = <>
    Left = 48
    Top = 416
  end
end
