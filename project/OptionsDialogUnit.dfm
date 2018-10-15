object OptionsDialog: TOptionsDialog
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 457
  ClientWidth = 432
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
  object OkButton: TButton
    Left = 256
    Top = 424
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object CancelButton: TButton
    Left = 349
    Top = 424
    Width = 71
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object JvPanel1: TJvPanel
    Left = 8
    Top = 7
    Width = 412
    Height = 94
    BevelEdges = []
    BevelOuter = bvNone
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 2
    object DBLocEdit: TJvEdit
      Left = 89
      Top = 17
      Width = 301
      Height = 21
      TabOrder = 0
      Text = ''
    end
    object JvStaticText2: TJvStaticText
      Left = 6
      Top = 48
      Width = 26
      Height = 17
      Caption = 'Host'
      Layout = tlTop
      TabOrder = 1
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object HostEdit: TJvEdit
      Left = 90
      Top = 44
      Width = 97
      Height = 21
      TabOrder = 2
      Text = ''
    end
    object JvCheckBox1: TJvCheckBox
      Left = 207
      Top = 48
      Width = 71
      Height = 17
      Caption = 'Embedded'
      TabOrder = 3
      OnClick = JvCheckBox1Click
      LinkedControls = <>
      LeftText = True
    end
    object JvStaticText1: TJvStaticText
      Left = 6
      Top = 21
      Width = 57
      Height = 17
      Caption = 'DB location'
      Layout = tlTop
      TabOrder = 4
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object JvStaticText4: TJvStaticText
      Left = 24
      Top = 70
      Width = 191
      Height = 17
      Caption = '('#1058#1088#1077#1073#1091#1077#1090#1089#1103' '#1087#1077#1088#1077#1079#1072#1087#1091#1089#1082' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103')'
      Layout = tlTop
      TabOrder = 5
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
  end
  object JvPanel2: TJvPanel
    Left = 8
    Top = 107
    Width = 412
    Height = 112
    BevelEdges = []
    BevelOuter = bvNone
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 3
    object HTTPCheckBox: TJvCheckBox
      Left = 6
      Top = 2
      Width = 96
      Height = 17
      Caption = 'HTTP Service'
      Checked = True
      State = cbChecked
      TabOrder = 0
      LinkedControls = <>
      AutoSize = False
      LeftText = True
    end
    object JvStaticText3: TJvStaticText
      Left = 120
      Top = 5
      Width = 54
      Height = 17
      Caption = 'Allowed IP'
      Layout = tlTop
      TabOrder = 1
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object IPAMemo: TMemo
      Left = 188
      Top = 5
      Width = 202
      Height = 89
      TabOrder = 2
    end
  end
  object JvPanel3: TJvPanel
    Left = 8
    Top = 228
    Width = 412
    Height = 95
    Alignment = taRightJustify
    BevelEdges = []
    BevelOuter = bvNone
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 4
    object UserNameText: TJvStaticText
      Left = 12
      Top = 8
      Width = 120
      Height = 17
      AutoSize = False
      Caption = 'un'
      Layout = tlTop
      TabOrder = 0
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object JvStaticText5: TJvStaticText
      Left = 12
      Top = 32
      Width = 97
      Height = 17
      Caption = 'Last sessions count'
      Layout = tlTop
      TabOrder = 1
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object LscEdit: TJvSpinEdit
      Left = 116
      Top = 30
      Width = 101
      Height = 21
      Alignment = taRightJustify
      MaxValue = 60.000000000000000000
      MinValue = 1.000000000000000000
      Value = 1.000000000000000000
      TabOrder = 2
    end
    object JvStaticText6: TJvStaticText
      Left = 12
      Top = 64
      Width = 47
      Height = 17
      Caption = #1050#1086#1076' '#1040#1047#1057
      Layout = tlTop
      TabOrder = 3
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object AzsEdit: TJvEdit
      Left = 116
      Top = 61
      Width = 101
      Height = 21
      TabOrder = 4
      Text = ''
    end
  end
  object SePanel: TJvPanel
    Left = 8
    Top = 333
    Width = 412
    Height = 74
    BevelEdges = []
    BevelOuter = bvNone
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 5
    Visible = False
    object JvStaticText7: TJvStaticText
      Left = 8
      Top = 11
      Width = 41
      Height = 17
      Caption = 'DB user'
      Layout = tlTop
      TabOrder = 0
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object JvStaticText8: TJvStaticText
      Left = 8
      Top = 43
      Width = 66
      Height = 17
      Caption = 'DB password'
      Layout = tlTop
      TabOrder = 1
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object dbuSEReDIT: TJvEdit
      Left = 116
      Top = 8
      Width = 101
      Height = 21
      TabOrder = 2
      Text = ''
    end
    object dbpASSeDIT: TJvEdit
      Left = 116
      Top = 40
      Width = 101
      Height = 21
      TabOrder = 3
      Text = ''
    end
  end
end
