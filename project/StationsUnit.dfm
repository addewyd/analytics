inherited StationsForm: TStationsForm
  Caption = #1050#1086#1076#1099' '#1040#1047#1057
  PixelsPerInch = 96
  TextHeight = 13
  inherited JvToolBar1: TJvToolBar
    inherited ToolButton1: TToolButton
      Left = 23
      ExplicitLeft = 23
    end
    inherited ToolButton2: TToolButton
      Left = 0
      ExplicitLeft = 0
    end
  end
  inherited JvDBGrid: TJvDBUltimGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'code'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'extcode'
        Visible = True
      end>
  end
  inherited ActionList: TActionList
    object UpdateAction: TAction
      Caption = 'Update'
      Hint = 'Commit'
      ImageIndex = 361
      OnExecute = UpdateActionExecute
    end
  end
  inherited MainMenu: TMainMenu
    inherited File1: TMenuItem
      Caption = #1050#1086#1076#1099' '#1040#1047#1057
      object Update1: TMenuItem [0]
        Action = UpdateAction
      end
    end
  end
  inherited FDQuery: TFDQuery
    CachedUpdates = True
    Connection = DM.FDConnection
    Transaction = DM.FDTransaction
    UpdateTransaction = DM.FDTransaction
    UpdateObject = FDUpdSQL
    SQL.Strings = (
      'select name, code, extcode from stations')
  end
  object FDUpdSQL: TFDUpdateSQL
    Connection = DM.FDConnection
    InsertSQL.Strings = (
      'insert into stations'
      '(code, name, extcode)'
      'values'
      '(:code, :name, :extcode)')
    Left = 136
    Top = 160
  end
end
