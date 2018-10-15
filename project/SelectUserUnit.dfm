object SelectUser: TSelectUser
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1042#1093#1086#1076
  ClientHeight = 291
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TButton
    Left = 240
    Top = 240
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelButton: TButton
    Left = 336
    Top = 240
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object combo: TJvDBLookupEdit
    Left = 72
    Top = 24
    Width = 145
    Height = 21
    LookupDisplay = 'LOGIN'
    LookupField = 'ID'
    LookupSource = ds
    DirectInput = False
    TabOrder = 2
    Text = ''
  end
  object ds: TJvDataSource
    DataSet = FDQuery
    Left = 216
    Top = 88
  end
  object FDQuery: TFDQuery
    Connection = DM.FDConnection
    Transaction = DM.FDTransaction
    SQL.Strings = (
      
        'select id, login, password, fio, role as urole from users order ' +
        'by id')
    Left = 120
    Top = 88
  end
end
