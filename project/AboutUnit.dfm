object AboutForm: TAboutForm
  Left = 0
  Top = 0
  ActiveControl = Button1
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'About'
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
end
