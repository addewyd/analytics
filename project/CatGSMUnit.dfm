inherited CatGSMForm: TCatGSMForm
  Caption = #1043#1057#1052
  ClientHeight = 336
  ClientWidth = 477
  ExplicitWidth = 493
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 13
  inherited JvToolBar1: TJvToolBar
    Width = 477
    ExplicitWidth = 477
  end
  inherited JvStatusBar1: TJvStatusBar
    Top = 298
    Width = 477
    ExplicitTop = 298
    ExplicitWidth = 477
  end
  inherited JvDBGridFooter: TJvDBGridFooter
    Top = 317
    Width = 477
    ExplicitTop = 317
    ExplicitWidth = 477
  end
  inherited JvDBGrid: TJvDBUltimGrid
    Width = 477
    Height = 269
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CODE'
        Title.Caption = #1050#1086#1076' 1'#1057
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 120
        Visible = True
      end>
  end
  inherited MainMenu: TMainMenu
    inherited File1: TMenuItem
      Caption = #1043#1057#1052
    end
  end
  inherited FDQuery: TFDQuery
    Connection = DM.FDConnection
    Transaction = DM.FDTransaction
    UpdateTransaction = DM.FDTransaction
    SQL.Strings = (
      'select code, name from wares')
  end
end
