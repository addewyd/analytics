inherited SessionListForm: TSessionListForm
  Caption = 'Session List'
  ClientHeight = 364
  ClientWidth = 551
  ExplicitWidth = 567
  ExplicitHeight = 423
  PixelsPerInch = 96
  TextHeight = 13
  inherited JvToolBar1: TJvToolBar
    Width = 551
    ExplicitWidth = 551
  end
  inherited JvStatusBar1: TJvStatusBar
    Top = 345
    Width = 551
    ExplicitTop = 345
    ExplicitWidth = 551
  end
  inherited JvDBGridFooter: TJvDBGridFooter
    Top = 326
    Width = 551
    ExplicitTop = 326
    ExplicitWidth = 551
  end
  inherited JvDBGrid: TJvDBUltimGrid
    Width = 551
    Height = 297
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    Columns = <
      item
        Expanded = False
        FieldName = 'AZSCODE'
        Title.Caption = #1050#1086#1076' '#1040#1047#1057
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SESSIONNUM'
        Title.Caption = #1053#1086#1084#1077#1088' '#1089#1084#1077#1085#1099
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STARTDATETIME'
        Title.Caption = #1053#1072#1095#1072#1083#1086
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USERNAME'
        Title.Caption = #1054#1087#1077#1088#1072#1090#1086#1088
        Width = 120
        Visible = True
      end>
  end
  inherited MainMenu: TMainMenu
    inherited File1: TMenuItem
      Caption = #1057#1084#1077#1085#1099
    end
  end
  inherited FDQuery: TFDQuery
    Connection = DM.FDConnection
    Transaction = DM.FDTransaction
    UpdateTransaction = DM.FDTransaction
    SQL.Strings = (
      
        'select azscode, sessionnum, startdatetime, username from session' +
        's')
  end
end
