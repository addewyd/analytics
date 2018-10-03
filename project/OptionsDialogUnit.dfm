object OptionsDialog: TOptionsDialog
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 291
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TButton
    Left = 248
    Top = 248
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object CancelButton: TButton
    Left = 342
    Top = 248
    Width = 71
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object JvStaticText1: TJvStaticText
    Left = 24
    Top = 20
    Width = 57
    Height = 17
    Caption = 'DB location'
    Layout = tlTop
    TabOrder = 2
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object DBLocEdit: TJvEdit
    Left = 112
    Top = 16
    Width = 301
    Height = 21
    TabOrder = 3
    Text = ''
  end
  object JvStaticText2: TJvStaticText
    Left = 24
    Top = 48
    Width = 26
    Height = 17
    Caption = 'Host'
    Layout = tlTop
    TabOrder = 4
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object HostEdit: TJvEdit
    Left = 112
    Top = 44
    Width = 97
    Height = 21
    TabOrder = 5
    Text = ''
  end
end
