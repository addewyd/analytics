object SelectUser: TSelectUser
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1042#1093#1086#1076
  ClientHeight = 243
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    265
    243)
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TButton
    Left = 40
    Top = 200
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 152
    Top = 200
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object combo: TJvDBLookupEdit
    Left = 32
    Top = 24
    Width = 195
    Height = 35
    LookupDisplay = 'LOGIN'
    LookupField = 'ID'
    LookupSource = ds
    DirectInput = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = ''
  end
  object ds: TJvDataSource
    DataSet = FDQuery
    Left = 88
    Top = 128
  end
  object FDQuery: TFDQuery
    Connection = DM.FDConnection
    Transaction = DM.FDTransaction
    SQL.Strings = (
      
        'select id, login, password, fio, role as urole from users order ' +
        'by id')
    Left = 8
    Top = 112
  end
end
