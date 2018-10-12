inherited PaymentModesForm: TPaymentModesForm
  Caption = #1042#1080#1076#1099' '#1054#1087#1083#1072#1090#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited JvDBGrid: TJvDBUltimGrid
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CODE'
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
      Caption = #1042#1080#1076#1099' '#1054#1087#1083#1072#1090#1099
    end
  end
  inherited FDQuery: TFDQuery
    Connection = DM.FDConnection
    Transaction = DM.FDTransaction
    UpdateTransaction = DM.FDTransaction
    SQL.Strings = (
      'select code, name from PAYMENTMODES')
  end
end
