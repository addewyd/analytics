object CntReplaceDlg: TCntReplaceDlg
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Replace cnts'
  ClientHeight = 369
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  DesignSize = (
    552
    369)
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TButton
    Left = 357
    Top = 318
    Width = 75
    Height = 25
    Action = OKAction
    Anchors = [akRight, akBottom]
    ModalResult = 1
    TabOrder = 0
  end
  object CancelButton: TButton
    Left = 452
    Top = 318
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    Default = True
    ModalResult = 2
    TabOrder = 1
  end
  object Text01: TJvStaticText
    Left = 14
    Top = 18
    Width = 200
    Height = 17
    AutoSize = False
    Caption = 'Text01'
    Layout = tlTop
    TabOrder = 2
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object Text02: TJvStaticText
    Left = 14
    Top = 47
    Width = 200
    Height = 17
    Caption = 'Text02'
    Layout = tlTop
    TabOrder = 3
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object RecMemo: TJvMemo
    Left = 16
    Top = 80
    Width = 511
    Height = 153
    Lines.Strings = (
      '')
    TabOrder = 4
  end
  object Tran: TFDTransaction
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = DM.FDConnection
    Left = 240
    Top = 136
  end
  object FDQuery: TFDQuery
    Connection = DM.FDConnection
    Transaction = Tran
    UpdateTransaction = TranUpd
    Left = 312
    Top = 128
  end
  object TranUpd: TFDTransaction
    Options.Isolation = xiSnapshot
    Options.AutoStart = False
    Options.AutoStop = False
    Options.EnableNested = False
    Connection = DM.FDConnection
    Left = 376
    Top = 168
  end
  object ActionList1: TActionList
    Left = 48
    Top = 248
    object OKAction: TAction
      Caption = 'OK'
      OnExecute = OKActionExecute
    end
  end
  object FDQueryS: TFDQuery
    Connection = DM.FDConnection
    Transaction = Tran
    UpdateTransaction = TranUpd
    Left = 104
    Top = 112
  end
end
