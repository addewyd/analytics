inherited CatItemsForm: TCatItemsForm
  Caption = #1058#1086#1074#1072#1088#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited JvDBGrid: TJvDBUltimGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ICODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Visible = True
      end>
  end
  inherited MainMenu: TMainMenu
    inherited File1: TMenuItem
      Caption = #1058#1086#1074#1072#1088#1099
    end
  end
  inherited FDQuery: TFDQuery
    Connection = DM.FDConnection
    Transaction = DM.FDTransaction
    SQL.Strings = (
      'select * from items')
  end
end
