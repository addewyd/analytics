inherited MlogForm: TMlogForm
  Caption = 'Log'
  PixelsPerInch = 96
  TextHeight = 13
  inherited JvToolBar1: TJvToolBar
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Action = ClearAction
    end
  end
  object mlog: TMemo [2]
    Left = 0
    Top = 29
    Width = 418
    Height = 233
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 2
  end
  inherited ActionList: TActionList
    object ClearAction: TAction
      Caption = 'Clear'
      ImageIndex = 153
      OnExecute = ClearActionExecute
    end
  end
  inherited MainMenu: TMainMenu
    inherited File1: TMenuItem
      Caption = #1051#1086#1075
      object Clear1: TMenuItem [0]
        Action = ClearAction
      end
    end
  end
end
