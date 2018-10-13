inherited PartnersForm: TPartnersForm
  Caption = #1055#1072#1088#1090#1085#1105#1088#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited JvDBGrid: TJvDBUltimGrid
    Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    ReduceFlicker = False
    Columns = <
      item
        Expanded = False
        FieldName = 'code'
        Title.Caption = #1050#1086#1076' 1'#1057
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Visible = True
      end>
  end
  inherited MainMenu: TMainMenu
    inherited File1: TMenuItem
      Caption = #1055#1072#1088#1090#1085#1105#1088#1099
    end
  end
  inherited FDQuery: TFDQuery
    Connection = DM.FDConnection
    Transaction = DM.FDTransaction
  end
end
