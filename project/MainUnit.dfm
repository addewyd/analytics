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
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Hint = 'Quit'
      Action = CloseAction
      ImageIndex = 141
    end
  end
  object logm: TJvMemo
    Left = 336
    Top = 35
    Width = 273
    Height = 401
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
    object About1: TMenuItem
      Action = AboutAction
    end
  end
  object ActionList: TActionList
    Left = 72
    Top = 40
    object CloseAction: TAction
      Caption = 'Quit'
      OnExecute = CloseActionExecute
    end
    object AboutAction: TAction
      Caption = 'About'
      OnExecute = AboutActionExecute
    end
    object LoadFileAction: TAction
      Caption = 'Load File'
      OnExecute = LoadFileActionExecute
    end
    object LoadDirAction: TAction
      Caption = 'Load Dir'
      OnExecute = LoadDirActionExecute
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
end
