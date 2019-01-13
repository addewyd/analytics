object SimpleReportDialog: TSimpleReportDialog
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1105#1090#1099
  ClientHeight = 234
  ClientWidth = 277
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
  DesignSize = (
    277
    234)
  PixelsPerInch = 96
  TextHeight = 13
  object DateStartEdit: TJvDatePickerEdit
    Left = 72
    Top = 109
    Width = 121
    Height = 21
    AllowNoDate = True
    Anchors = [akLeft, akBottom]
    Checked = True
    TabOrder = 0
    ExplicitTop = 48
  end
  object DateEndEdit: TJvDatePickerEdit
    Left = 72
    Top = 141
    Width = 121
    Height = 21
    AllowNoDate = True
    Anchors = [akLeft, akBottom]
    Checked = True
    TabOrder = 1
    ExplicitTop = 80
  end
  object JvStaticText1: TJvStaticText
    Left = 16
    Top = 81
    Width = 57
    Height = 34
    Anchors = [akLeft, akBottom]
    Caption = 'AzsCode'
    Layout = tlTop
    TabOrder = 2
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = True
    ExplicitTop = 76
  end
  object JvStaticText2: TJvStaticText
    Left = 16
    Top = 111
    Width = 41
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1053#1072#1095#1072#1083#1086
    Layout = tlTop
    TabOrder = 3
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
    ExplicitTop = 50
  end
  object JvStaticText3: TJvStaticText
    Left = 16
    Top = 143
    Width = 35
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1050#1086#1085#1077#1094
    Layout = tlTop
    TabOrder = 4
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
    ExplicitTop = 82
  end
  object OkButton: TButton
    Left = 16
    Top = 182
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 5
    OnClick = OkButtonClick
    ExplicitTop = 121
  end
  object CancelButton: TButton
    Left = 118
    Top = 182
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
    ExplicitTop = 121
  end
  object LookupAzs: TJvDBLookupEdit
    Left = 72
    Top = 78
    Width = 121
    Height = 21
    LookupDisplay = 'cn'
    LookupField = 'azscode'
    LookupSource = DSAzs
    Anchors = [akLeft, akBottom]
    TabOrder = 7
    Text = ''
    ExplicitTop = 17
  end
  object RepFileButton: TButton
    Left = 16
    Top = 8
    Width = 75
    Height = 25
    Caption = #1060#1072#1081#1083' '#1086#1090#1095#1105#1090#1072
    TabOrder = 8
    OnClick = RepFileButtonClick
  end
  object repfiletext: TJvStaticText
    Left = 16
    Top = 43
    Width = 252
    Height = 17
    AutoSize = False
    Caption = 'F'
    Layout = tlTop
    TabOrder = 9
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
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
    Options = [fpLocation]
    StoredProps.Strings = (
      'DateStartEdit.Date'
      'DateEndEdit.Date'
      'OpenDialog.FileName')
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
  object OpenDialog: TJvOpenDialog
    Filter = 'XML|*.xml'
    Height = 0
    Width = 0
    Left = 168
    Top = 8
  end
end
