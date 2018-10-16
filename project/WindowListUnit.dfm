object WinListDlg: TWinListDlg
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Window List'
  ClientHeight = 234
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  DesignSize = (
    340
    234)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 240
    Top = 191
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    ExplicitLeft = 328
    ExplicitTop = 248
  end
  object wlist: TJvTextListBox
    Left = 24
    Top = 24
    Width = 289
    Height = 153
    ItemHeight = 13
    TabOrder = 1
    OnDblClick = wlistDblClick
  end
end
