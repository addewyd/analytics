object AboutForm: TAboutForm
  Left = 0
  Top = 0
  ActiveControl = Button1
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
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
  object Button1: TButton
    Left = 176
    Top = 240
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object JvMemo: TJvMemo
    Left = 24
    Top = 16
    Width = 217
    Height = 129
    TabStop = False
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Lines.Strings = (
      #1055#1086#1082#1072' '#1085#1080#1095#1077#1075#1086)
    ReadOnly = True
    TabOrder = 1
  end
end
