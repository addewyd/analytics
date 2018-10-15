object SimpleReportDialog: TSimpleReportDialog
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'SimpleReport'
  ClientHeight = 173
  ClientWidth = 226
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DateStartEdit: TJvDatePickerEdit
    Left = 72
    Top = 48
    Width = 121
    Height = 21
    AllowNoDate = True
    Checked = True
    TabOrder = 0
  end
  object DateEndEdit: TJvDatePickerEdit
    Left = 72
    Top = 80
    Width = 121
    Height = 21
    AllowNoDate = True
    Checked = True
    TabOrder = 1
  end
  object JvStaticText1: TJvStaticText
    Left = 16
    Top = 20
    Width = 46
    Height = 17
    Caption = 'AzsCode'
    Layout = tlTop
    TabOrder = 2
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object JvStaticText2: TJvStaticText
    Left = 16
    Top = 50
    Width = 41
    Height = 17
    Caption = #1053#1072#1095#1072#1083#1086
    Layout = tlTop
    TabOrder = 3
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object JvStaticText3: TJvStaticText
    Left = 16
    Top = 82
    Width = 35
    Height = 17
    Caption = #1050#1086#1085#1077#1094
    Layout = tlTop
    TabOrder = 4
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object OkButton: TButton
    Left = 16
    Top = 121
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 5
    OnClick = OkButtonClick
  end
  object CancelButton: TButton
    Left = 118
    Top = 121
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
  end
  object LookupAzs: TJvDBLookupEdit
    Left = 72
    Top = 17
    Width = 121
    Height = 21
    LookupDisplay = 'cn'
    LookupField = 'azscode'
    LookupSource = DSAzs
    TabOrder = 7
    Text = ''
  end
  object FDQueryAZS: TFDQuery
    Connection = DM.FDConnection
    Transaction = DM.FDTransaction
    SQL.Strings = (
      
        'select code as azscode, name, extcode, code || '#39' '#39' || name as cn' +
        '  from stations order by code')
    Left = 67
    Top = 58
  end
  object DSAzs: TJvDataSource
    AutoEdit = False
    DataSet = FDQueryAZS
    Left = 187
    Top = 58
  end
  object FormStorage: TJvFormStorage
    AppStorage = AppStorage
    AppStoragePath = '%FORM_NAME%\'
    StoredProps.Strings = (
      'DateStartEdit.Date'
      'DateEndEdit.Date')
    StoredValues = <>
    Left = 80
    Top = 112
  end
  object AppStorage: TJvAppRegistryStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    Root = 'Software\Shrfs'
    SubStorages = <>
    Left = 32
    Top = 128
  end
end
