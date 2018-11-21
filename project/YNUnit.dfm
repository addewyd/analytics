object YNForm: TYNForm
  Left = 0
  Top = 0
  ActiveControl = Button2
  BorderStyle = bsDialog
  Caption = '?'
  ClientHeight = 284
  ClientWidth = 348
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
    348
    284)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 348
    Height = 233
    Align = alTop
    Alignment = taCenter
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Ctl3D = False
    Lines.Strings = (
      '')
    ParentCtl3D = False
    TabOrder = 0
  end
  object OKButton: TButton
    Left = 177
    Top = 251
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 265
    Top = 251
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    Default = True
    ModalResult = 2
    TabOrder = 2
  end
  object ButtonForget: TButton
    Left = 72
    Top = 251
    Width = 90
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1053#1077' '#1089#1086#1093#1088#1072#1085#1103#1090#1100
    ModalResult = 3
    TabOrder = 3
    Visible = False
  end
end
