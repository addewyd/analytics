inherited TabForm: TTabForm
  Caption = 'Tabs'
  ClientHeight = 550
  ClientWidth = 735
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 751
  ExplicitHeight = 609
  PixelsPerInch = 96
  TextHeight = 13
  inherited JvToolBar1: TJvToolBar
    Width = 735
    ExplicitWidth = 735
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Action = CommitAction
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton3: TToolButton
      Left = 46
      Top = 0
      Action = RollbackAction
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton6: TToolButton
      Left = 69
      Top = 0
      Action = VerifiedAction
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton4: TToolButton
      Left = 92
      Top = 0
      Action = CloseSessAction
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton5: TToolButton
      Left = 115
      Top = 0
      Action = ClearCloseAction
      ParentShowHint = False
      ShowHint = True
    end
  end
  inherited JvStatusBar1: TJvStatusBar
    Top = 531
    Width = 735
    Panels = <
      item
        Width = 150
      end>
    Visible = True
    ExplicitTop = 531
    ExplicitWidth = 735
  end
  object Pages: TJvPageControl [2]
    Left = 0
    Top = 29
    Width = 735
    Height = 502
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #1025#1084#1082#1086#1089#1090#1080' '#1090#1086#1087#1083#1080#1074#1072' '#1080' '#1088#1091#1082#1072#1074#1072' '#1058#1056#1050
      object JvPanel1: TJvPanel
        Left = 0
        Top = 0
        Width = 727
        Height = 474
        Align = alClient
        TabOrder = 0
        object Spl01: TJvSplitter
          Left = 1
          Top = 204
          Width = 725
          Height = 7
          Cursor = crVSplit
          Align = alTop
          Beveled = True
        end
        object RealPMFooter: TJvDBGridFooter
          Left = 1
          Top = 435
          Width = 725
          Height = 38
          SizeGrip = True
          OnDrawPanel = RealPMFooterDrawPanel
          Columns = <>
          DataSource = DSRealPM
          DBGrid = RealPMGrid
          OnCalculate = RealPMFooterCalculate
          OnDisplayText = RealPMFooterDisplayText
        end
        object RealPMGrid: TJvDBUltimGrid
          Left = 1
          Top = 211
          Width = 725
          Height = 224
          Align = alClient
          DataSource = DSRealPM
          DefaultDrawing = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = RealPMGridDrawColumnCell
          OnKeyDown = RealPMGridKeyDown
          AutoAppend = False
          IniStorage = JvFS
          OnDrawColumnTitle = RealPMGridDrawColumnTitle
          PostOnEnterKey = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          AutoSizeRows = False
          RowResize = True
          RowsHeight = 34
          TitleRowHeight = 34
          WordWrap = True
          WordWrapAllFields = True
          Delphi2010OptionsMigrated = True
        end
        object IOTHGrid: TJvDBUltimGrid
          Left = 1
          Top = 1
          Width = 725
          Height = 184
          Align = alTop
          DataSource = DSIOTH
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = IOTHGridCellClick
          OnDrawDataCell = IOTHGridDrawDataCell
          OnDrawColumnCell = IOTHGridDrawColumnCell
          OnEditButtonClick = IOTHGridEditButtonClick
          OnKeyDown = IOTHGridKeyDown
          AutoAppend = False
          IniStorage = JvFS
          OnDrawColumnTitle = IOTHGridDrawColumnTitle
          PostOnEnterKey = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          AutoSizeRows = False
          RowsHeight = 17
          TitleRowHeight = 35
          WordWrap = True
          Columns = <
            item
              Expanded = False
              FieldName = 'FUELNAME'
              PopupMenu = FuelPopupMenu
              Title.Caption = #1043#1057#1052
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TANKNUM'
              ReadOnly = True
              Title.Caption = #1025#1084#1082#1086#1089#1090#1100
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALCRESTPREV'
              Title.Caption = #1056#1054' '#1055#1088#1057#1084
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STARTFUELVOLUME'
              PopupMenu = StartVPMenu
              Title.Caption = #1053#1072#1095' '#1054#1073#1098#1105#1084
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALCIN'
              Title.Caption = #1055#1088#1080#1085#1103#1090#1086
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC'
              Title.Caption = #1054#1090#1087#1091#1089#1082
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALCREST'
              Title.Caption = #1056#1072#1089#1095' '#1086#1089#1090#1072#1090#1086#1082
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENDFACTVOLUME'
              Title.Caption = #1060#1072#1082#1090'. '#1054#1089#1090'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VDIFF'
              Title.Caption = #1048#1079#1083'/'#1053#1077#1076
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HOSENUM'
              ReadOnly = True
              Title.Caption = #8470' '#1056#1091#1082
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HEIGHT'
              Title.Caption = #1059#1088#1086#1074#1077#1085#1100
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MASS'
              Title.Caption = #1052#1072#1089#1089#1072
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DENSITY'
              Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TEMPERATURE'
              Title.Caption = #1058#1077#1084' '#176#1057
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'WATER'
              Title.Caption = #1042#1086#1076#1072
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PREVCOUNTER'
              Title.Caption = #1057#1095' '#1055#1088#1057#1084
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STCNT'
              PopupMenu = SCNTPMenu
              Title.Caption = #1057#1095'. '#1053#1072#1095#1072#1083#1086
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ECNT'
              Title.Caption = #1057#1095'. '#1050#1086#1085#1077#1094
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OUTCOME'
              Title.Caption = #1056#1072#1089#1093#1086#1076
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              ButtonStyle = cbsNone
              Expanded = False
              FieldName = 'R'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 24
              Visible = True
            end>
        end
        object RButton: TButton
          Left = 19
          Top = 27
          Width = 56
          Height = 20
          Caption = 'R'
          TabOrder = 3
          Visible = False
          OnClick = RButtonClick
          OnKeyPress = RButtonKeyPress
        end
        object IOTHFooter: TJvDBGridFooter
          Left = 1
          Top = 185
          Width = 725
          Height = 19
          Align = alTop
          SizeGrip = True
          Columns = <
            item
              Alignment = taRightJustify
              FieldName = 'CALC'
            end
            item
              FieldName = 'OUTCOME'
            end
            item
              FieldName = 'CALCIN'
            end
            item
              FieldName = 'CALCREST'
            end>
          DataSource = DSIOTH
          DBGrid = IOTHGrid
          OnCalculate = IOTHFooterCalculate
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1080' '#1087#1088#1080#1093#1086#1076' '#1043#1057#1052
      ImageIndex = 1
      object JvPanel2: TJvPanel
        Left = 0
        Top = 0
        Width = 727
        Height = 474
        Align = alClient
        TabOrder = 0
        object GridFooterInOut: TJvDBGridFooter
          Left = 1
          Top = 435
          Width = 725
          Height = 38
          SizeGrip = True
          OnDrawPanel = GridFooterInOutDrawPanel
          Columns = <
            item
              FieldName = 'VOLUME'
            end
            item
              FieldName = 'MASS'
            end
            item
              FieldName = 'AMOUNT0'
              Style = psOwnerDraw
            end
            item
              FieldName = 'WHOLE'
              Style = psOwnerDraw
            end
            item
              FieldName = 'SUMNDS'
              Style = psOwnerDraw
            end
            item
              FieldName = 'CLIENTNAME'
              Style = psOwnerDraw
            end
            item
              FieldName = 'FUELNAME'
              Style = psOwnerDraw
            end>
          DataSource = DSInOut
          DBGrid = GridInOutGSM
          OnCalculate = GridFooterInOutCalculate
        end
        object GridInOutGSM: TJvDBUltimGrid
          Left = 1
          Top = 1
          Width = 725
          Height = 434
          Align = alClient
          DataSource = DSInOut
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnKeyDown = GridInOutGSMKeyDown
          AutoAppend = False
          IniStorage = JvFS
          PostOnEnterKey = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          CanDelete = False
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'DIR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SDATE'
              Title.Caption = #1044#1072#1090#1072
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTNAME'
              Title.Caption = #1050#1083#1080#1077#1085#1090
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTRACT'
              Title.Caption = #1044#1086#1075#1086#1074#1086#1088
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAYMENTMODE'
              Title.Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FUELNAME'
              Title.Caption = #1043#1057#1052
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FUELCODE'
              Title.Caption = #1050#1086#1076' '#1043#1057#1052
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VOLUME'
              Title.Caption = #1054#1073#1098#1105#1084
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE'
              ReadOnly = True
              Title.Caption = #1062#1077#1085#1072
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DENSITY'
              Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MASS'
              Title.Caption = #1052#1072#1089#1089#1072
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AMOUNT0'
              Title.Caption = #1057#1091#1084#1084#1072
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NDS'
              Title.Caption = #1053#1044#1057'%'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMNDS'
              Title.Caption = #1053#1044#1057
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'WHOLE'
              Title.Caption = #1042' '#1090'.'#1095' '#1053#1044#1057
              Visible = True
            end>
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1060#1072#1089#1086#1074#1082#1072' '#1087#1088#1080#1093#1086#1076
      ImageIndex = 2
      object GridInOutItems: TJvDBUltimGrid
        Left = 0
        Top = 0
        Width = 727
        Height = 455
        Align = alClient
        DataSource = DSInOutItems
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = GridInOutItemsKeyDown
        AutoAppend = False
        IniStorage = JvFS
        PostOnEnterKey = True
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SDATE'
            Title.Caption = #1044#1072#1090#1072
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTNAME'
            Title.Caption = #1050#1083#1080#1077#1085#1090
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRACT'
            Title.Caption = #1044#1086#1075#1086#1074#1086#1088
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAYMENTMODE'
            Title.Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ITEMCODE'
            Title.Caption = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ITEMNAME'
            Title.Caption = #1058#1086#1074#1072#1088
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTITY'
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AMOUNT'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'EI'
            Title.Caption = #1045#1076'.'#1048#1079#1084
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 10
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRICE'
            Title.Caption = #1062#1077#1085#1072
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMM'
            Title.Caption = #1057#1091#1084#1084#1072
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NDS'
            Title.Caption = ' '#1053#1044#1057'%'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMNDS'
            Title.Caption = #1053#1044#1057
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'WHOLE'
            Title.Caption = #1042' '#1090'.'#1095'. '#1053#1044#1057
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      object GridFooterInOutItems: TJvDBGridFooter
        Left = 0
        Top = 455
        Width = 727
        Height = 19
        SizeGrip = True
        Columns = <
          item
            FieldName = 'AMOUNT'
          end
          item
            FieldName = 'SUMM'
          end
          item
            FieldName = 'WHOLE'
          end
          item
            FieldName = 'SUMNDS'
          end>
        DataSource = DSInOutItems
        DBGrid = GridInOutItems
        OnCalculate = GridFooterInOutItemsCalculate
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1060#1072#1089#1086#1074#1082#1072' '#1088#1072#1089#1093#1086#1076
      ImageIndex = 3
      object GridFooterOutItems: TJvDBGridFooter
        Left = 0
        Top = 436
        Width = 727
        Height = 38
        SizeGrip = True
        OnDrawPanel = GridFooterOutItemsDrawPanel
        Columns = <
          item
            FieldName = 'SUMM'
            Style = psOwnerDraw
          end
          item
            FieldName = 'SUMNDS'
            Style = psOwnerDraw
          end
          item
            FieldName = 'WHOLE'
            Style = psOwnerDraw
          end>
        DataSource = DSOutItems
        DBGrid = GridOutItems
        OnCalculate = GridFooterOutItemsCalculate
        OnDisplayText = GridFooterOutItemsDisplayText
      end
      object GridOutItems: TJvDBUltimGrid
        Left = 0
        Top = 0
        Width = 727
        Height = 436
        Align = alClient
        DataSource = DSOutItems
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = GridInOutItemsKeyDown
        AutoAppend = False
        IniStorage = JvFS
        PostOnEnterKey = True
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SDATE'
            Title.Caption = #1044#1072#1090#1072
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTNAME'
            Title.Caption = #1050#1083#1080#1077#1085#1090
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRACT'
            Title.Caption = #1044#1086#1075#1086#1074#1086#1088
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAYMENTMODE'
            Title.Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ITEMCODE'
            Title.Caption = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ITEMNAME'
            Title.Caption = #1058#1086#1074#1072#1088
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTITY'
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EI'
            Title.Caption = #1045#1076'.'#1048#1079#1084
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 10
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRICE'
            Title.Caption = #1062#1077#1085#1072
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMM'
            Title.Caption = #1057#1091#1084#1084#1072
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NDS'
            Title.Caption = ' '#1053#1044#1057'%'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMNDS'
            Title.Caption = #1053#1044#1057
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'WHOLE'
            Title.Caption = #1042' '#1090'.'#1095'. '#1053#1044#1057
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
    end
  end
  inherited JvAppRS: TJvAppRegistryStorage
    Left = 496
    Top = 464
  end
  inherited JvFS: TJvFormStorage
    StoredProps.Strings = (
      'IOTHGrid.Height'
      'Spl01.top'
      'RealPMGrid.RowsHeight')
    Left = 576
    Top = 464
  end
  inherited ActionList: TActionList
    Left = 416
    Top = 464
    object CommitAction: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' (F2)'
      Hint = 'Commit'
      ImageIndex = 361
      OnExecute = CommitActionExecute
    end
    object RollbackAction: TAction
      Caption = #1054#1090#1084#1077#1085#1072' (F10)'
      Hint = 'Rollback'
      ImageIndex = 328
      OnExecute = RollbackActionExecute
    end
    object CloseSessAction: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1089#1084#1077#1085#1091
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1084#1077#1085#1091
      ImageIndex = 8
      OnExecute = CloseSessActionExecute
    end
    object ClearCloseAction: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100
      Enabled = False
      Hint = #1054#1090#1082#1088#1099#1090#1100
      ImageIndex = 3
      OnExecute = ClearCloseActionExecute
    end
    object VerifiedAction: TAction
      Caption = #1055#1088#1086#1074#1077#1088#1077#1085#1086
      Hint = #1055#1088#1086#1074#1077#1088#1077#1085#1086
      ImageIndex = 322
      OnExecute = VerifiedActionExecute
    end
  end
  inherited MainMenu: TMainMenu
    Left = 328
    Top = 456
    inherited File1: TMenuItem
      Caption = 'Tabs'
      object N3: TMenuItem
        Action = VerifiedAction
      end
      object N1: TMenuItem
        Action = CloseSessAction
      end
      object N2: TMenuItem
        Action = ClearCloseAction
      end
    end
  end
  inherited ImageList: TImageList
    Left = 256
    Top = 0
    Bitmap = {
      494C01017E0180019C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000000006000001002000000000000000
      060000000000000000000000000000000000B5B5B5007B736B00ADADA5000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A637B00BD9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADC6D6007B94DE009C6B73009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B9CC600188CE7004A7BA500C694
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5E7FF0042B5FF007384D6009C73
      7300A5A5A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004AB5FF0052B5FF00218CEF004A7B
      A500C69494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5E7FF0039BDFF006B8C
      DE00946B7300BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052B5FF0052B5FF001884
      E7004A7BA500C694940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CECED600CECED6006394B50029B5
      FF006B84CE00635A5A00948C8C0084736B008C7B7300736363008C8C8C00BDBD
      BD00B5B5B500B5B5B5000000000000000000000000000000000052B5FF004AB5
      FF00188CE7004A7BA500BD949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5734A00B5734A00B56B42008CBD
      D6009CB5C600BD948400FFEFBD00FFFFEF00FFFFFF00FFFFFF00A5847B006331
      2100D69473007B4A2900000000000000000000000000000000000000000052B5
      FF004AB5FF002184DE005A6B730000000000AD7B7300C6A59C00D6B5A500CEA5
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFCE9C00E7FFFF00E7FFFF00DEF7
      F700CEBDBD00EFCEA500F7F7C600F7F7CE00EFF7DE00F7FFFF00FFFFFF00847B
      7300D6F7FF00947B6B0000000000000000000000000000000000000000000000
      000052BDFF00B5D6EF00A5948C00B59C8C00F7E7CE00FFFFD600FFFFD600FFFF
      D600E7DEBD00CEADA50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7BD8400CEEFFF00C6D6DE00C6CE
      D600D6BDA500E7D6AD00DECEA500DEE7C600DEE7DE00E7E7E700FFFFEF00BDAD
      9400A5ADB5008C736B0000000000000000000000000000000000000000000000
      000000000000CEB5B500D6B5A500FFEFC600FFFFD600FFFFD600FFFFD600FFFF
      DE00FFFFEF00F7F7EF00B58C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7BD8400CEEFFF00C6D6DE00C6CE
      D600D6BDAD00DECEA500D6C6A500DEDEBD00DEE7C600DEE7CE00EFF7D600D6BD
      9C00A5ADB5009473630000000000000000000000000000000000000000000000
      000000000000C6948C00F7DEB500F7D6A500FFF7CE00FFFFD600B55A1800FFFF
      EF00FFFFF700FFFFFF00DED6BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7BD8400CEEFFF00C6D6DE00C6D6
      DE00D6BDAD00E7E7BD00DECEAD00DED6AD00DEDEBD00E7DEBD00FFFFCE00BD9C
      8400C6D6DE009473630000000000000000000000000000000000000000000000
      000000000000DEBDA500FFE7AD00F7CE9400FFF7CE00E7D6C600B55A1800E7D6
      C600E7D6C600FFFFEF00F7EFD600C69C94000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7BD8400D6EFFF00CEDEDE00CEDE
      DE00C6C6BD00DECEC600EFF7F700E7DEBD00EFD6A500F7EFB500EFCE9C00A58C
      8C00F7FFFF0094735A0000000000000000000000000000000000000000000000
      000000000000E7C6AD00FFDEAD00EFBD8400B55A1800B55A1800B55A1800B55A
      1800B55A1800FFFFDE00F7F7D600C6AD9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7BD8400CEEFFF00C6D6DE00C6D6
      DE00C6D6DE00BDB5B500D6C6BD00E7D6AD00EFD6A500E7C6A500B59C9400C6D6
      DE00FFFFFF0094735A0000000000000000000000000000000000000000000000
      000000000000DEBDAD00FFE7B500EFBD8400F7CE9400FFEFC600B55A1800FFEF
      C600FFFFDE00FFFFDE00F7EFD600C6A59C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7BD8400D6EFFF00CED6E700CEDE
      E700CEDEE700CEE7EF00C6C6CE00B5ADAD00BDB5BD00C6C6CE00D6EFF700DEF7
      FF00FFFFFF0094735A0000000000000000000000000000000000000000000000
      000000000000C69C9400FFEFC600FFEFC600F7D6A500F7CE9C00B55A1800FFF7
      CE00FFF7D600FFFFD600E7DEBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFC69400D6F7FF00CEE7EF00CEE7
      EF00D6EFF700D6EFF700D6EFF700DEF7FF00D6F7FF00D6EFFF00D6EFF700DEF7
      F700FFFFFF0094735A0000000000000000000000000000000000000000000000
      00000000000000000000DEC6AD00FFFFFF00FFF7EF00F7CE9400EFBD8400F7CE
      9C00FFE7B500FFF7C600BD9C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD6B1800BD732100BD732100BD73
      2100BD732100BD732100BD732100BD732100BD732100C6842900C6842900C684
      2900A5846B008452210000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDBD00F7EFD600FFEFC600FFE7AD00FFE7
      B500F7DEB500CEAD9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DE7B1000E7841000E7841000E784
      1000E7841000E7841000E7841000E7841000E7841000E7841000E7841000E784
      1000E7841000AD8C630000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEAD9400CEAD9C00DEBDA500DEBD
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400A5A5A5004242420000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000636B6B00949494009494940000000000B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400B5848400B584840000000000000000000000
      00000000000000000000ADADAD00000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400ADADAD005A5A5A00C6C6C60000000000CE630000FFE7C600FFDE
      BD00FFDEBD00FFDEB500FFD6AD00FFD6AD00CE630000FFE7C600FFDEBD00FFDE
      BD00FFDEB500FFD6AD00FFD6AD00CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005252
      520094949400FFFFFF00EFEFEF00A5A5A500C6A59C00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00B584840000000000000000000000
      000000000000ADADAD005A5A5A009C9C9C000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6A500EFCE9C00EFCE9C00EFCE
      9400BDBDBD006B6B6B00C6C6C6008484840000000000CE630000FFFFFF00FFFF
      FF00FFF7E700FFEFD600FFE7C600FFDEB500CE630000FFFFFF00FFFFF700FFF7
      E700FFEFD600FFE7C600FFDEB500CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000101010001010
      10007B7B7B00E7E7E700A5A5A50000000000C6A59C00FFFFFF00FFEFDE00F7E7
      C600F7E7C600F7E7C600F7D6AD00F7D6AD00B584840000000000000000000000
      0000ADADAD005A5A5A00D6D6D600848484000000000000000000C6ADA500FFEF
      E700AD6B5A00AD6B5A00AD6B5A009C9C9C009C9C9C009C9C9C009C9C9C00AD6B
      5A006B6B6B00181818006B6B6B00524A4A0000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFF7E700FFEFD600FFDEB500CE630000FFFFFF00FFFFFF00FFFF
      F700FFF7E700FFEFD600FFE7C600CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000010101000101010004242
      42007B7B7B008C8C8C000000000000000000C6ADA500FFFFFF00FFFFFF00FFFF
      FF00FFEFDE00FFEFDE00F7E7C600F7D6AD00B58484000000000000000000ADAD
      AD005A5A5A00C6C6C60084848400000000000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00BDBDBD004A4A4A00524A4A004A4A4A0052525200A5A5
      A500393939006B6B6B00BDBDBD000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7E700FFEFD600CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600CE6300000000000000000000000000000000
      00000010E700D6D6D60000000000000000001010100010101000424A52008484
      84006B6B6B00000000000000000000000000C6ADA500FFFFFF00CEBDA500CEBD
      A500CEBDA500848484009C9C9C009C9C9C006B6B6B0084848400ADADAD005A5A
      5A009C9C9C008484840000000000000000000000000000000000CEB5AD00FFFF
      F700AD6B5A0094949C0042393900AD6B5A00AD6B5A00AD6B5A00AD6B5A004239
      39006B6B6B00DEDED600B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7E700CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700CE6300000000000000000000000000000000
      00003139BD00ADCEE700000000001010100010101000424A5200848484006B6B
      6B0000000000000000000000000000000000D6B5AD00FFFFFF00FFFFFF00FFFF
      FF009C9C9C006B6B6B00FFEFDE00FFEFDE00FFEFDE006B6B6B005A5A5A009C9C
      9C00848484000000000000000000000000000000000000000000D6B5AD00FFFF
      FF00A5A59C0042393900B5847300AD6B5A00AD6B5A00AD6B5A00AD6B5A00B584
      730042393900C6C6C600B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CE6300000000000000000000000000000000
      00003139BD005A73E70021080000101010004242420084848400737373000000
      000000000000000000000000000000000000D6B5AD00FFFFFF00CEBDA5009494
      9C0084848400FFEFDE00FFEFE700FFF7EF00FFF7EF00C6A59C00848484006B6B
      6B00000000000000000000000000000000000000000000000000D6BDB500A5A5
      9C006B6B6B00C6B59400FFE7D600EFC6AD00F7D6AD00F7D6AD00E7C69C00F7E7
      CE009C8C730042393900B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CE63000000000000000000000010E7007B94
      C60018A5FF001052BD000008A5003139BD008C847B006B6B6300000000000000
      000000000000000000000000000000000000DEC6B500FFFFFF00BDBDBD006B6B
      6B00FFEFDE00000000000000000000000000FFF7EF00C6A59C00FFF7EF006B6B
      6B00C6C6C6000000000000000000000000000000000000000000D6BDB500A5A5
      9C006B6B6B00D6BDA500AD6B5A00AD6B5A00AD6B5A00AD6B5A00AD6B5A00AD6B
      5A00AD9C8C0042393900B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CE63000000000000000000005A73E700089C
      FF0042E7F70042E7F7002973F700394A9400635A4A0000000000000000000000
      000000000000000000000000000000000000DEC6B500FFFFFF00B5B5AD00FFEF
      DE00FFEFE700FFF7F700FFF7EF00FFF7EF00FFF7EF00C6A59C00FFF7EF00FFF7
      F700737373000000000000000000000000000000000000000000DEBDB500A5A5
      9C006B6B6B00C6BDA500B5847300B5847300AD6B5A00AD6B5A00AD6B5A00AD6B
      5A00A5947B0042393900B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFFF00FFFFFF00CE63000042A5DE002973F700089CFF0042E7
      F700CEF7FF008CF7FF004ABDFF002973F7002973F70094A5EF00ADCEE7000000
      000000000000000000000000000000000000DEC6B500FFFFFF009C9C9C00FFEF
      DE0000000000000000000000000000000000FFF7F700C6A59C00FFF7EF00FFF7
      EF00848484000000000000000000000000000000000000000000DEC6B500FFFF
      FF00A5A59C006B6B6B00FFD6AD00FFE7D600F7FFFF00FFFFF700FFDED600FFD6
      B50042393900A5A5A500B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CE630000ADCEE7002973F700299CEF0042E7
      F700CEF7FF008CF7FF004ABDFF00299CEF002973F7007B94C600ADB5CE000000
      000000000000000000000000000000000000DEC6B500DEC6B500B5B5AD00FFEF
      DE00FFEFE700FFF7EF00FFF7EF00FFF7EF00FFF7EF00C6A59C00FFF7EF00FFF7
      EF00848484000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00A5A59C006B6B6B00F7D6AD00AD6B5A00AD6B5A00EFD6A5004239
      3900BDBDBD00B58C8400B58484000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000000000005A73E70018A5
      FF0042E7F70042E7F7000094F70094A5EF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD006B6B
      6B00C6A59C00C6A59C00C6A59C00C6A59C00C6A59C00C6A59C00FFF7F700A594
      7B00A5A5A5000000000000000000000000000000000000000000E7C6B500FFFF
      FF00AD6B5A00AD6B5A00A5A59C006B6B6B006B6B6B006B6B6B006B6B6B00A5A5
      9C00EFB57300EFA54A00C6846B00000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000000000002973F70094A5
      EF0031ADFF001094EF0094A5EF0042A5DE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE006B6B6B00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7F70084848400A5A5
      A500000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A5A59C00A5A59C00A5A59C00A5A59C00C694
      7B00FFC67300CE94730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002973F70042A5DE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE006B6B6B00FFF7EF00FFF7EF00FFF7EF00CEBDA500BDBDBD000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADCEE7007B94C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500B5B5A5006B6B6B00CEC6B500A5A59C00000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      000000000000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000000000000000
      000000000000CE630000FFFFFF00FFF7E700FFF7E700FFF7E700FFF7E700FFEF
      D600FFE7C600FFD6AD00FFD6AD00CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000000000000000
      0000006B08000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000000000000000
      000000000000CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7E700FFF7
      E700FFEFD600FFE7C600FFD6AD00CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE630000000000000000000000000000006B
      0800006B08000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000000000000000
      000000000000CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7E700FFEFD600FFE7C600CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDE
      B500FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000006B0800089C
      1800006B08000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDE
      B500FFD6AD00FFD6AD00FFD6AD00CE630000FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7E700FFEFD600CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7
      C600FFDEB500FFD6AD00FFD6AD00CE63000000000000006B080018B53100089C
      1800006B0800006B0800006B0800006B0800006B0800006B0800006B08000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7
      C600FFDEB500FFD6AD00FFD6AD00CE630000FFD6AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7E700CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF7004A844A004A84
      4A004A844A004A844A00FFD6AD00CE630000006B080042E7730029C6520018B5
      3100089C1800089C1800008C0800008C0800008C0800008C0800006B0800CE63
      0000CE630000CE630000CE630000CE63000000000000CE630000CE630000CE63
      0000FFD6AD00FFFFFF00CE630000CE630000FFD6AD00FFFFF700CE630000CE63
      0000FFE7C600FFDEB500CE630000CE630000FFD6AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7E700CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A844A0052AD
      520052AD52004A844A00FFDEB500CE63000000000000006B080031CE5A00089C
      1800006B0800006B0800006B0800006B0800006B0800006B0800006B0800FFF7
      E700FFE7C600FFD6AD00FFD6AD00CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      E700FFEFD600FFE7C600FFDEB500CE630000FFD6AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A844A004A844A004A844A0052AD
      520052AD52004A844A004A844A004A844A000000000000000000006B0800089C
      1800006B08000000000000000000CE630000FFFFFF00FFC68400FFC68400FFC6
      8400FFC68400FFC68400FFD6AD00CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7E700FFEFD600FFE7C600CE630000FFD6AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A844A0052AD520052AD520052AD
      520052AD520052AD520052AD52004A844A00000000000000000000000000006B
      0800006B08000000000000000000CE630000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7E700FFEFD600FFE7C600CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600CE630000FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFD6AD000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A844A006BCE84006BCE84006BCE
      840052AD520052AD520052AD52004A844A000000000000000000000000000000
      0000006B08000000000000000000CE630000FFFFFF00FFC68400FFC68400FFC6
      8400FFC68400FFC68400FFEFD600CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700CE63000000000000FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFD6AD000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300004A844A004A844A004A844A006BCE
      840052AD52004A844A004A844A004A844A000000000000000000000000000000
      0000000000000000000000000000CE630000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7E700CE63000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      000000000000FFD6AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFD6AD00000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE6300004A844A006BCE
      840052AD52004A844A00CE630000000000000000000000000000000000000000
      0000000000000000000000000000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000000000
      000000000000FFD6AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFD6AD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A844A004A84
      4A004A844A004A844A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000000000000000
      0000CE630000FFFFFF00FFF7E700FFF7E700FFF7E700FFF7E700FFEFD600FFE7
      C600FFD6AD00FFD6AD00CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFF7E700FFEFD600FFEFD600FFE7C600FFDEBD00FFDE
      BD00FFDEB500FFD6AD00FFD6AD00CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000000000000000
      0000CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7E700FFF7E700FFEF
      D600FFE7C600FFD6AD00CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      E700FFEFD600FFE7C600FFDEB500CE6300000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000006B
      08000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000CE630000CE63
      0000CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      E700FFEFD600FFE7C600CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7E700FFEFD600FFE7C600CE6300000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000006B
      0800006B080000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDE
      B500FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000CE630000FFFF
      FF00CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7E700FFEFD600CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600CE6300000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000006B
      0800089C1800006B0800000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7
      C600FFDEB500FFD6AD00FFD6AD00CE6300000000000000000000CE630000FFFF
      FF00CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7E700CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700CE6300000000000000000000000000000000
      000000000000006B0800006B0800006B0800006B0800006B0800006B0800006B
      0800089C180018B53100006B08000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEF
      D600FFE7C600FFDEB500FFD6AD00CE630000CE630000CE630000CE630000FFFF
      FF00CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7E700CE6300000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000006B0800008C0800008C0800008C0800008C0800089C1800089C
      180018B5310029C6520042E77300006B080000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      E700FFEFD600FFE7C600FFDEB500CE630000CE630000FFFFFF00CE630000FFFF
      FF00CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFF7E700FFF7E700FFEFD600FFEFD600FFEFD600FFEFD600FFDE
      BD00FFDEBD00FFDEBD00FFDEBD00CE630000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00006B0800006B0800006B0800006B0800006B0800006B0800006B
      0800089C180031CE5A00006B08000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7E700FFEFD600FFE7C600CE630000CE630000FFFFFF00CE630000FFFF
      FF00FFFFFF00CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7E700FFEFD600FFE7C600CE630000CE630000FFFFFF00FFC68400FFC6
      8400FFC68400FFC68400FFC68400FFFFFF00CE6300000000000000000000006B
      0800089C1800006B0800000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600CE630000CE630000FFFFFF00CE630000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      E700CE63000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600CE630000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE6300000000000000000000006B
      0800006B080000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700CE630000CE630000FFFFFF00CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE63000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700CE630000CE630000FFFFFF00FFC68400FFC6
      8400FFC68400FFC68400FFC68400FFFFFF00CE6300000000000000000000006B
      08000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000FFFFFF00FFFFFF00CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE63000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE63000000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7E700CE6300000000
      0000000000000000000000000000000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE63000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE63000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE6300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001094CE001094CE001094CE001094CE001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C00C6846B00C6846B004A4A4A004A4A4A004A4A4A00525252009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      000042ADBD0042ADBD0042CEEF005ADEFF005ADEFF005ADEFF0042CEEF001094
      CE001094CE00000000000000000000000000000000001894CE0021A5D6001094
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ADAD
      AD00C6846B00F7E7D600FFD6AD00C6846B00EFDED600EFDED600CEBDB5005A5A
      5A00737373009C9C9C00000000000000000000000000000000000000000042AD
      BD0042CEEF009CE7FF009CE7FF009CE7FF00000000005ADEFF005ADEFF005ADE
      FF0042CEEF001094CE000000000000000000000000001894CE009CEFFF006BE7
      F70031B5DE0031B5DE0031B5DE0021A5D6001094CE0000000000000000000000
      000000000000000000000000000000000000B5735200B5735200C6421800C642
      2100CE4A2900C64A29009C4A29008C5242000000000000000000000000000000
      000000000000000000000000000000000000C6846B0000000000CEC6BD00F7E7
      D600C6846B00F7E7D600C6846B00D6AD9400DEC6BD00EFF7F700F7EFEF00EFDE
      D6008C847B006B6B6B009C9C9C0000000000000000000000000042ADBD0042CE
      EF009CE7FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF005ADE
      FF005ADEFF0042CEEF001094CE0000000000000000001894CE0094E7F70084FF
      FF007BF7FF0084F7FF007BF7FF0073EFFF006BE7F70031B5DE0031B5DE0021A5
      D60000000000000000000000000000000000C6421800C6421800E75A3900F763
      4A00FF6B5A00EF634A00E75A3900EF5A42008C4A290063735A00397339003173
      3100297B290029732900316B31005A735A00C6846B00C6846B00F7E7DE00C684
      6B00F7E7D600FFD6AD00C6846B00D6AD9C00C65A2100BD522100D6AD9C00F7FF
      FF00F7DED6007B736B007373730000000000000000000000000042ADBD00ADF7
      FF009CE7FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF009CE7
      FF005ADEFF005ADEFF001094CE0000000000000000001894CE0073CEE70094FF
      FF0073F7FF007BEFFF0073EFFF0073EFFF0073EFFF0073EFFF007BEFFF005AD6
      F700189CCE00000000000000000000000000CE4A2100CE4A2100FF735A00FF7B
      6300DE6B4200EFB58400DE7B4A00F7735A00E75A39007B8C390084BD730063AD
      5A0063C6630052C6520031B5310018941800C6846B00F7E7D600C6846B00C684
      6B00F7E7D600C6846B00C6A59400FFFFFF00DE947300BD4A1000B54A1000CE9C
      8400F7FFFF00EFDED6005A5A5A009C9C9C00000000000000000042ADBD00ADF7
      FF00ADF7FF009CE7FF009CE7FF000000000000000000000000009CE7FF009CE7
      FF009CE7FF005ADEFF001094CE0000000000000000001894CE0031B5DE0094E7
      F7007BF7FF007BEFFF0073EFFF0073EFFF0073EFFF0073EFFF0073EFFF005AD6
      F70039BDE70000000000000000000000000000000000D6846300FF7B6300FF8C
      6B00DE8C5A00FFD69C00DE8C5A00EF7B5A00E75A39007BA55200C6DEB500D6E7
      C60073D6730063CE630042B54200188C1800C6846B00F7E7D600FFD6AD00FFD6
      AD00FFD6AD00C6846B00CE6B3900DE8C6B00CE632900CE633100C65A2900B54A
      1000DEC6BD00F7EFE700A59C940063636300000000000000000042ADBD00ADF7
      FF00ADF7FF00ADF7FF009CE7FF008484840000000000848484009CE7FF009CE7
      FF009CE7FF005ADEFF001094CE0000000000000000001894CE0063DEF70031B5
      DE0084FFFF0073F7FF0073EFFF0000630800006B0800007308000063080052D6
      EF005AD6F700189CCE0000000000000000000000000000000000A56342008C31
      18002121730021217B00A5524A00C65A310073B55A0084DE8400FFF7E700FFF7
      E7007BAD630063BD6300398C390000000000C6846B00F7E7D600FFF7F700FFFF
      FF00F7DECE00C6846B00C6846B00C6846B00CE6B3900C65A2100CE633100C652
      1800C67B5200F7FFFF00DECEC60052525200000000000000000042ADBD0042CE
      EF00ADF7FF00ADF7FF00ADF7FF00ADF7FF009CE7FF009CE7FF009CE7FF009CE7
      FF009CE7FF0042CEEF001094CE0000000000000000001894CE007BF7FF0031B5
      DE0094E7F70094E7F7008CEFFF008CF7FF0073EFFF00006B0800008C08000063
      08006BE7F70039BDE70000000000000000000000000000000000181818000808
      080010319400103194001018730063525A004AA54A0063BD630094ADB5004A8C
      B5006394A500318439000000000000000000C6846B00F7E7D600FFF7F700FFF7
      F700F7DECE00F7DECE00C6846B00FFFFFF00EFAD9400C64A1000CE633100CE63
      2900C65A2900F7EFEF00EFDED6005252520000000000000000000000000042AD
      BD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042AD
      BD0042ADBD0042ADBD000000000000000000000000001894CE0084FFFF006BEF
      FF0031B5DE0031B5DE0031B5DE0031B5DE009CEFFF0073EFFF0000730800008C
      080063DEF70063DEF7001094CE0000000000000000001010100008101800184A
      A500185ABD00185ABD001852BD0010318C0000000000000000003194F7003194
      F7003194F7002994EF000000000000000000C6846B00F7E7D600FFF7F700F7DE
      CE00F7DECE00C6846B00C6522100CEB5A500FFFFFF00E79C7B00C6521800CE63
      2900C65A2900F7EFEF00EFDED600525252000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD009CE7
      FF001094CE00000000000000000000000000000000001894CE0084F7FF007BF7
      FF007BF7FF007BF7FF0073F7FF0052D6EF0031B5DE0084DEF70000630800089C
      1800006B080094EFFF0031A5D60000000000000000001818180010213100185A
      BD00216BCE00216BCE002163CE00104AAD0000000000529CCE0039A5FF0039A5
      FF00399CFF00399CFF00426B7B0000000000C6846B00F7E7D600F7DECE00F7DE
      CE00C6846B00C65A2100C6521800BD4A1000DECEC600FFFFFF00D6734200CE5A
      2100CE6B3900FFF7F700EFDED6006B6B6B000000000000000000000000000000
      00001094CE001094CE001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE00000000000000000000000000000000001894CE0084FFFF007BF7
      FF007BF7FF007BEFFF007BF7FF007BF7FF006BE7F70031B5DE000873100018B5
      31000884100031A5D600189CCE0000000000000000003131310029292900215A
      A5003194F7003194F700298CF700216BCE000000000042A5E7004AB5FF0052B5
      FF004AB5FF004AADFF00298CCE0000000000C6846B00F7E7D600F7DECE00C684
      6B00CE8C6B00EFE7DE00D67B5200BD310000D69C7B00FFFFFF00DE8C6300CE52
      1800E79C7300FFFFFF00DEC6BD00ADADAD000000000000000000000000000000
      000042ADBD009CE7FF001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE00000000000000000000000000000000001894CE008CFFFF007BF7
      FF007BF7FF007BF7FF0073E7FF007BE7FF007BE7FF00005A000031CE5A0029C6
      520018B53100005A0000000000000000000000000000313131004A4A4A001829
      4200216BCE00297BE7003194F700216BC600000000004AA5E70052BDFF005ABD
      FF0052BDFF0052B5FF003194DE0000000000C6846B00F7E7D600C6846B00FF8C
      4A00DE845A00EFFFFF00FFFFFF00E7BDA500F7FFFF00EFFFFF00E7733900E773
      3900FFEFEF00F7E7DE00A59C9400000000000000000000000000000000000000
      000042ADBD009CE7FF001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE00000000000000000000000000000000001094CE001894CE008CEF
      FF0084F7FF006BE7F700189CCE001094CE001894CE001894CE00005A000042E7
      7300005A000000000000000000000000000000000000000000005A5A5A006B6B
      6B00A5A5A50084848400313131004A4A4A0000000000529CC6003994C6004A9C
      CE003194CE00298CCE00106B9C0000000000C6846B00C6846B00FFFFFF00FFEF
      CE00FFB57300EFAD8400EFE7DE00EFF7F700EFE7DE00F7A57B00FF8C4A00FFDE
      CE00FFFFFF00EFDED600CECEC600000000000000000000000000000000000000
      000042ADBD0042CEEF0042CEEF001094CE001094CE001094CE0042CEEF0042CE
      EF001094CE000000000000000000000000000000000000000000000000001894
      CE00189CCE001894CE000000000000000000000000000000000000000000005A
      0000000000000000000000000000000000000000000000000000424242007373
      73008C8C8C0084848400393939000000000000000000000000005AA5D6006BB5
      DE00ADD6EF0073B5D6004284A50000000000C6846B00F7EFEF00EFDED600FFFF
      FF00FFFFFF00FFF7C600FFDEAD00FFCE9400FFCE9400FFD6AD00FFF7F700FFFF
      FF00EFDED600CECEC60000000000000000000000000000000000000000000000
      00000000000042ADBD0042CEEF009CE7FF009CE7FF009CE7FF0042CEEF001094
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009CC6DE008CBD
      D60084B5D6008CB5CE0000000000000000000000000000000000F7EFEF00EFDE
      D600F7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE7DE00EFDE
      D600DEDEDE000000000000000000000000000000000000000000000000000000
      0000000000000000000042ADBD0042ADBD0042ADBD0042ADBD001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7EF
      E700F7F7EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000052A54A00009408006BB563000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000424242004242420042424200424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD735200C65A0000AD4A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000052638C00314A7B0031395A0000000000000000005A6B
      8C003163BD0031395A0000000000000000000000000000000000000000000000
      00000000000018B5290000BD2100009400008CBD7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C8C8C00C6C6C600FFFFFF0084848400848484004242
      4200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B55A3100C65A0000CE63
      0000B552100000000000000000000000000000000000000000006BADFF00639C
      FF00427BE700214A94005A94FF00427BEF00294A940021428400315ABD003163
      BD00396BD6003163C60031395A00000000000000000000000000000000000000
      00006BB5630000BD210000C6290000A50000319C310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C8C8C00424242004242420042424200424242004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B55A3100C663
      0000CE630000B55A210000000000000000000000000000000000396BC6005284
      E700396BC60029529C00A5E7FF006BA5FF00315ABD00315ABD002952A5002142
      8C0021428C002952A500526B9C00000000000000000000000000000000000000
      0000009C100000CE310000C6290000AD100000940000A5C69400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C8C8C00C6C6C600FFFFFF0084848400848484004242
      4200000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B55A
      2100CE630000C6630000C684630000000000000000000000000063A5FF005A94
      FF00427BEF00315AAD004A84F7004A84F7003973E7003973E7003163C6002952
      AD001831630018294A00424A6B000000000000000000000000000000000052A5
      4A0000CE310000C6290000FF630000CE3100009C0000008C0000000000000000
      000000000000000000000000000000000000000000000000000000ADFF000000
      000000000000000000008C8C8C00848484008484840084848400848484004242
      420000000000000000000000000000ADFF0000000000AD4A0000BD5A0000BD5A
      0000BD5A0000BD5A0000BD5A0000BD5A0000BD5A0000C6846300000000000000
      0000AD4A0000CE630000B54A000000000000000000000000000084C6FF0073AD
      FF004A84F700315ABD004A84FF004A84F700427BF700427BEF003163CE00295A
      B5001839730018294A00000000000000000000000000000000000000000018B5
      290029CE5A0000FF630000FF630000BD210000C62900009400008CBD7B000000
      000000000000000000000000000000000000000000000000000000000000006B
      FF00000000000084FF000084840000FFFF0000FFFF0000CEFF0000FFFF000084
      8400426BB50000000000006BFF000000000000000000B5520000D6730000CE6B
      0000CE630000CE630000CE630000CE630000C6630000BD6B4200000000000000
      0000CE9C8400C6630000C6630000C68463000000000000000000396BC6005284
      E700396BC6002952AD00528CFF004A8CFF006BA5FF005A94FF00396BD600295A
      B50018316B0018294A00000000000000000000000000000000000000000018C6
      420000FF630000FF630052A54A0052A54A0000C6290000A50000319C31000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000ADFF000084FF0000FFFF0000E7F70000E7FF0000E7FF0000E7F70000FF
      FF00426BB50000ADFF00000000000000000000000000BD5A0000DE7B0000D673
      0000CE630000A5421000CE9C8400CE9C8400CE9C840000000000000000000000
      000000000000AD4A0000CE630000B5521000000000000000000094D6FF007BB5
      FF00528CFF00315ABD005294FF005A9CFF0094CEFF006BA5FF00396BD600295A
      B500183163002939520000000000000000000000000000000000000000000000
      000000AD210000AD2100000000000000000000AD180000C6290000940000A5C6
      9400000000000000000000000000000000000000000000ADFF00000000000000
      00005ABDFF0000FFFF0000E7FF0000EFFF0000EFFF0000E7FF0000E7FF0000DE
      FF0000FFFF00426BB500000000000000000000000000C6630000E7840000CE63
      0000DE730000CE630000C6846300000000000000000000000000000000000000
      000000000000C6734200CE630000B54A00000000000000000000396BC6005284
      E700396BC600294A9C005A9CFF0063ADFF009CD6FF0063A5FF003163C6002952
      A50031395A000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000031B5420000C62900009C0000008C
      0000000000000000000000000000000000000000000000000000006BFF005ABD
      FF00C6FFFF0029EFFF0000EFFF0000F7FF0000FFFF0000FFFF0000E7FF0000E7
      FF0000DEFF0000FFFF00426BB500006BFF0000000000CE630000F7940000B552
      1000B5520000DE7B0000CE6B0000BD7B52000000000000000000000000000000
      000000000000C6734200CE630000B54A000000000000000000009CDEFF007BBD
      FF00528CFF00315ABD00528CFF004A84FF004A7BDE00427BE700315ABD00294A
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000B5210000C629000094
      00008CBD7B000000000000000000000000000000000000000000000000005ABD
      FF00C6FFFF006BFFFF0021FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000EF
      FF0000E7FF0000CEFF00426BB5000000000000000000CE6B0800FF9C0800CE84
      420000000000B5520000E7840000CE6B0000BD63310000000000000000000000
      000000000000B54A0000CE630000B55210000000000000000000000000000000
      000000000000000000006BADFF0073ADFF00295AB50021397300395284000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052A54A0000C6290029AD
      390031B542000000000000000000000000000000000000000000006BFF005ABD
      FF00C6FFFF00E7FFFF0031FFFF0008FFFF0000FFFF0000FFFF0000FFFF0000F7
      FF0000E7FF0000FFFF00426BB500006BFF0000000000CE732100FFAD3100CE84
      4A000000000000000000C6631000E7840000E77B0000BD520000C67B5200C68C
      7300B5521000C6630000C6630000C68463000000000000000000000000000000
      000000000000526B9C009CDEFF006BA5FF00294A9400394A6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000029AD4A005AE7
      A50029AD39008CBD7B0000000000000000000000000000ADFF00000000005ABD
      FF00C6FFFF00E7FFFF006BFFFF0031FFFF0000FFFF0000FFFF0000FFFF0000F7
      FF0000FFFF0000CEFF00426BB5000000000000000000CE7B3900FFBD6300C67B
      5200000000000000000000000000B55A2100E77B0000E7840000DE7B0000D673
      0000CE6B0000C6630000AD4A1000000000000000000000000000000000000000
      0000000000007BA5DE009CDEFF004A84F7002139630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031B5420000D6
      42008CBD7B000000000000000000000000000000000000000000000000000000
      00005ABDFF00C6FFFF00E7FFFF0073FFFF0021FFFF0000FFFF0000FFFF0000FF
      FF0000CEFF00426BB500000000000000000000000000CE947B00C6845A000000
      000000000000000000000000000000000000CE9C8400C6631000CE6B0000CE6B
      0000BD5A0000BD6B420000000000000000000000000000000000000000000000
      0000000000007BA5DE0094CEFF004A84F700213963004A525A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A5C6
      9400000000000000000000000000000000000000000000000000000000000000
      0000006BFF005ABDFF00C6FFFF00E7FFFF00E7FFFF0000FFFF0000FFFF0000CE
      FF00426BB500006BFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009CDEFF0063A5FF005294FF003963CE00294A9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006BFF0000AD
      FF0000000000000000005ABDFF005ABDFF0010B5FF0010B5FF0010B5FF0010B5
      FF00000000000000000000ADFF00006BFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007BA5DE004A84F7003963C600526B9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD4A0000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD4A0000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD4A0000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD4A0000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD4A0000FFAD6300FF630000BD4A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD4A0000FFAD6300FF630000BD4A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD4A0000FFAD6300FF630000BD4A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD4A0000FFAD6300FF630000BD4A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD4A0000FFAD6300FFAD6300FF630000FF630000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD4A0000FFAD6300FFAD6300FF630000FF630000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD4A0000FFAD6300FFAD6300FF630000FF630000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD4A0000FFAD6300FFAD6300FF630000FF630000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF630000FF630000FF630000FF630000BD4A0000BD4A0000BD4A0000BD4A
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF630000FF630000FF630000FF630000BD4A0000BD4A0000BD4A0000BD4A
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF630000FF630000FF630000FF630000BD4A0000BD4A0000BD4A0000BD4A
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF630000FF630000FF630000FF630000BD4A0000BD4A0000BD4A0000BD4A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A00000000000000000000BD4A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000BD4A0000FF63
      0000BD4A00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000000000000000000000000000000000000000000000000000BD4A
      0000BD4A0000BD4A0000BD4A0000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000BD4A00000000000000000000BD4A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000FF630000FF630000FF630000FF63
      0000FF630000000000000000000000000000000000000000000000000000FF63
      0000FF630000FF630000FF630000FF630000BD4A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B58484000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE63000000000000CE630000CE630000CE63
      0000CE630000CE6300000000000000000000CE630000CE630000CE630000CE63
      0000CE6300000000000000000000000000000000000000000000C6A59C00FFEF
      D60031C6520029BD4A0010A5310010A5310010A53100008C0800008C0800008C
      0800006B0800EFCE9C00B58484000000000000000000CE630000FFFFFF00FFC6
      8400FFC68400FFFFF700FFC68400FFC68400FFC68400FFC68400FFC68400FFC6
      8400FFC68400FFC68400FFD6AD00CE63000000000000CE630000FFFFFF00CE63
      6300CE636300FFFFF700CE636300CE636300FFE7C600CE636300CE636300FFD6
      AD00CE636300CE636300FFD6AD00CE63000000000000CE630000FF7B0000FF7B
      0000CE630000CE6300000000000000000000CE630000CE630000FF7B0000FF7B
      0000CE6300000000000000000000000000000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE63000000000000CE630000000000000000
      0000CE630000FF7B00000000000000000000FF7B0000CE630000000000000000
      0000CE6300000000000000000000000000000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEB500F7D6B500F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B58484000000000000000000CE630000FFFFFF00FFC6
      8400FFC68400FFFFFF00FFC68400FFC68400FFC68400FFC68400FFC68400FFC6
      8400FFC68400FFC68400FFD6AD00CE63000000000000CE630000FFFFFF00CE63
      6300CE636300FFFFFF00FF9C9C00FF9C9C00FFF7E700FF9C9C00FF9C9C00FFDE
      B500FF9C9C00FF9C9C00FFD6AD00CE630000000000000000000000000000FF7B
      0000CE63000000000000000000000000000000000000CE630000FF7B00000000
      0000000000000000000000000000000000000000000000000000CEB5AD00FFFF
      F70073A5FF00004AF700004AF700004AF700004AF700004AF700004AF700004A
      F700004AF700EFCE9C00B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7
      C600FFDEB500FFD6AD00FFD6AD00CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7
      C600FFDEB500FFD6AD00FFD6AD00CE630000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000CE6300000000
      0000000000000000000000000000000000000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEBD00F7D6
      AD00F7D6A500F7D6A500B58484000000000000000000CE630000FFFFFF00FFC6
      8400FFC68400FFFFFF00FFC68400FFC68400FFC68400FFC68400FFC68400FFC6
      8400FFC68400FFC68400FFD6AD00CE63000000000000CE630000FFFFFF00CE63
      6300CE636300FFFFFF00FF9C9C00FF9C9C00FFFFFF00FF9C9C00FF9C9C00FFF7
      E700FF9C9C00FF9C9C00FFD6AD00CE6300000000000000000000FF7B0000FF7B
      0000000000000000000000000000000000000000000000000000FF7B0000FF7B
      0000000000000000000000000000000000000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEC600F7DE
      BD00F7D6B500F7D6AD00B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      E700FFEFD600FFD6A500FFDEB500CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      E700FFEFD600FFD6A500FFDEB500CE63000000000000FF7B0000CE6300000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000FF7B00000000000000000000000000000000000000000000D6BDB500FFFF
      FF0031C6520029BD4A0010A5310010A5310010A53100008C0800008C0800008C
      0800006B0800F7DEB500B58484000000000000000000CE630000FFFFFF00FFC6
      8400FFC68400FFFFFF00FFC68400FFC68400FFC68400FFC68400FFC68400FFC6
      8400FFC68400FFC68400FFE7C600CE63000000000000CE630000FFFFFF00CE63
      6300CE636300FFFFFF00FF9C9C00FF9C9C00FFFFFF00FF9C9C00FF9C9C00FFFF
      FF00FF9C9C00FF9C9C00FFE7C600CE63000000000000FF7B0000CE6300000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000FF7B00000000000000000000000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C600F7DEC600F7D6B500B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600CE63000000000000FF7B0000CE6300000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000FF7B00000000000000000000000000000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700CE63000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700CE6300000000000000000000CE630000FF7B
      0000000000000000000000000000000000000000000000000000FF7B0000CE63
      0000000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF0073A5FF00004AF700004AF700004AF700004AF700FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B58484000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000000000000000000000000000CE63
      0000CE630000FF7B0000FF7B0000FF7B0000FF7B0000CE630000CE6300000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B00000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000000000
      0000FF7B0000CE630000CE630000CE630000CE630000FF7B0000000000000000
      0000000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE94730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6847300B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      00000000000094292900B55A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5636B00FFEF
      C600F7D6B500EFD6AD00EFCE9C00EFCE9400EFC68C00EFBD8400EFBD7B00EFBD
      8400EFBD8400EFC68400A5636B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6A59C00FFFFEF00FFFFEF00FFFF
      EF00FFFFEF00FFF7DE00FFF7DE00FFF7DE00FFF7DE00FFEFD600FFEFD600FFEF
      D600FFDEB500FFDEB500FFD6A500B58484000000000000000000000000000000
      0000942929009429290094292900B55A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5636B00F7E7
      CE00F7DEBD00EFD6AD00EFCEA500EFCE9C00EFC69400EFC68C00EFBD8400EFBD
      7B00EFBD7B00EFC68400A5636B0000000000000000005A6BEF001029A5000010
      9C0000109C0000109C0000109C0000109C0000109C0000109C0000109C000821
      9C005A6BEF00000000000000000000000000C6A59C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFEF00FFFFEF00FFFFEF00FFF7DE00FFF7DE00FFEF
      D600FFEFD600FFEFD600FFDEB500B58484000000000000000000000000009429
      2900942929009429290094292900B55A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5635A00FFEF
      DE00F7DEC600F7DEBD00EFD6AD00EFCEA500EFCE9C00EFC69400EFC68C00EFBD
      8400EFBD7B00EFC68400A5636B0000000000000000001029C6000018C6000821
      C6001029C6001029C6000829CE001029CE001029CE000021CE000018CE000010
      AD0010219C00000000000000000000000000C6ADA500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0094313100EFD6D600BD7B7B0094313100B56B6300F7E7CE00FFF7
      DE00FFEFD600FFEFD600FFEFD600B58484000000000000000000942929009429
      290094292900B55A5A009429290094292900B55A5A0000000000000000000000
      0000000000000000000000000000000000000000000000000000A5635A00FFF7
      E700F7E7CE00F7DEC600A5A5CE00EFD6AD00EFCEA500A59CB500EFC69400EFC6
      8C00EFBD8400EFC68400A5636B0000000000000000000018CE001031D6001831
      D6002139E7002942E7002142E7001842E7001039E7000831E7000029E7000018
      CE0000109C00000000000000000000000000C6ADA500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0094313100A54A4A00EFDEDE00E7C6C60094313100B5737300FFFF
      EF00FFF7DE00FFEFD600FFEFD600B58484000000000094292900942929009429
      2900B55A5A0000000000000000009429290094292900C6848400000000000000
      0000000000000000000000000000000000000000000000000000A5736B00FFF7
      EF00FFEFDE00F7E7CE000021F7009494CE009494C6000021F700EFCE9C00EFC6
      9400EFC68C00EFC68400A5636B0000000000000000000021D6001831D6002942
      E700314AE700294AE700294AE7001842E7001042E7001039E7000831E7000021
      CE0000109C00000000000000000000000000D6B5AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0094313100DEB5B500FFFFFF00FFF7F7009431310094313100FFFF
      EF00FFFFEF00FFF7DE00FFEFD600B5848400000000000000000094292900B55A
      5A000000000000000000000000000000000094292900B55A5A00000000000000
      0000000000000000000000000000000000000000000000000000A5736B00FFFF
      FF00FFEFE700FFE7D6005A73E7000021F7000021F7005A6BD600EFCEA500EFCE
      9C00EFC69400EFC68C00A5636B0000000000000000001031D6002142E7003952
      E7003152E700314AE700294AE7001842E7001839E7001039E7000831E7001031
      CE0000109C00000000000000000000000000D6B5AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0094313100F7EFEF00FFFFFF00C68C8C0094313100A54A4A00FFFF
      FF00FFFFEF00FFF7DE00FFEFD600B58484000000000000000000000000000000
      0000000000000000000000000000000000000000000094292900B55A5A000000
      0000000000000000000000000000000000000000000000000000BD846B00FFFF
      FF00FFF7EF00FFEFE700949CE7000021F7000021F7009494CE00EFD6AD00EFCE
      A500EFCE9C00EFCE9400A5636B0000000000000000002139E700314AE7003952
      E7003152E700314AE700294AE7001842E7001039E7001031E7000831E7001031
      CE0000109C00000000000000000000000000D6BDB500FFFFFF00FFFFFF00C68C
      8C00C68C8C00C68C8C00C68C8C00C68C8C0094313100C68C8C00C68C8C00C68C
      8C00C68C8C00FFFFEF00FFF7DE00B58484000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094292900B55A
      5A00000000000000000000000000000000000000000000000000BD846B00FFFF
      FF00FFFFFF00FFF7EF000021F7005A73E7005A73E7000021F700F7DEBD00EFD6
      AD00EFCEA500F7D6A500A5636B000000000000000000314AE700425AE7004252
      E7003152E700314AE7002942E7001839DE001031DE001031DE001031DE001031
      CE0000109C00000000000000000000000000D6BDB500FFFFFF00FFFFFF00A539
      0000A5390000A5390000A5390000A5390000A5390000A5390000A5390000A539
      0000A5390000FFFFEF00FFF7DE00B58484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009429
      2900B55A5A000000000000000000000000000000000000000000D6946B00FFFF
      FF00FFFFFF00FFFFFF00637BF700FFEFE700FFE7D6006373E700F7DEC600F7D6
      B500F7D6AD00EFCEA500A5636B0000000000000000003952E7004A63E700425A
      E7003952E7003142E7002942DE001839DE001031D6001031DE001031DE001031
      CE0000109C00000000000000000000000000D6BDB500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A552520094313100B56B6B00F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFEF00FFF7DE00B58484000000000000000000000000000000
      0000000000000000000000000000A59C9C0000000000A59C9C00000000000000
      000094292900B55A5A0000000000000000000000000000000000D6946B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFEFE700FFE7D600F7E7CE00F7E7
      CE00DECEB500B5AD9400A5636B0000000000000000004252E700526BEF004A63
      E7004252DE00314AE7002942DE002139DE001839D6001831DE001031DE001031
      CE0000109C00000000000000000000000000E7C6B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009431310094313100F7EFEF00FFFFFF00EFDEDE0094313100FFFF
      FF00FFFFFF00FFFFFF00FFFFEF00B58484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000094292900B55A5A00000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFEFE700EFDECE00A56B
      5A00A56B5A00A56B5A00A5636B0000000000000000004A63E7006B84EF005A73
      EF004A63E7004252E7003152E700314ADE002942DE002142DE002139D6001031
      CE0008189C00000000000000000000000000E7C6B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B56B6B0094313100E7C6C600F7EFEF00AD63630094313100FFFF
      FF00FFFFFF00FFFFFF00FFFFEF00B58484000000000000000000000000000000
      0000000000000000000000000000A59C9C000000000000000000000000000000
      0000000000000000000094292900000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700DEC6BD00A56B
      5A00E79C5200E78C3100B56B4A0000000000000000005A73EF008C94EF006B7B
      EF005273EF005263E7004A63E7004A5AE700425AE7003952E700294AE7001031
      CE001831A500000000000000000000000000E7C6B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7EFEF00AD63630094313100B56B6B00EFDEDE0094313100FFFF
      FF00FFFFFF00FFFFFF00FFFFEF00B58484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C600A56B
      5A00FFB55A00BD7B5A000000000000000000000000005A73EF005A73EF004A5A
      E7003952E700314AE700314AE7002942E7002939E7002139D6001839D6001831
      C6005A6BEF00000000000000000000000000E7C6B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFEF00B584840000000000A59C9C0000000000A59C
      9C00000000000000000000000000A59C9C0000000000A59C9C00000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00DEC6BD00A56B
      5A00BD846B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7C6B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFEF00C68473000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00A56B
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7C6B500E7C6B500E7C6
      B500E7C6B500E7C6B500E7C6B500D6BDB500D6BDB500D6B5AD00D6B5AD00C6AD
      A500C6ADA500C6A59C00C6A59C00000000000000000000000000000000000000
      000000000000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7E7CE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFD6AD00FFCE9400FFCE9400FFCE
      9400FFCE9400FFCE9400FFCE9400000000000000000000008400000084000000
      8400000084000000840000008400000000000000000000000000000000000000
      0000007308000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00EFDECE008C5A5A00000000000000000000000000000000000000
      000000000000DEBD9400DEBD9400DEBD9400DEBD9400DEBD9400DEBD9400DEBD
      9400DEBD9400DEBD9400DEBD9400000000000000000000000000000000000000
      000000000000000000000000000000000000FFD6AD00FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFCE9400000000000000000000008400000084000000
      0000000000000000000000008400000000000000000000000000000000008484
      8400087B08008484840000000000000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE008C5A5A00000000000000000000000000000000000000
      000000000000FFEFD600FFF7E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7
      E700FFEFD600FFEFD600DEBD9400000000000000000000000000000000000000
      000000000000000000000000000000000000FFD6AD00FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFCE9400000000000000000000000000000084000000
      8400000000000000000000000000000000000000000000000000000000000073
      08005AE78C0000730800000000000000000000000000B58C8C008C5A5A008C5A
      5A008C5A5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B6300000000000000000000000000000000000000
      000000000000FFEFD600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      E700FFF7E700FFEFD600DEBD940000000000000000000000000000000000CE63
      0000CE630000CE630000CE630000CE630000FFD6AD00FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFCE9400000000000000000000000000000000000000
      84000000840000000000000000000000000000000000000000000073080042D6
      6B0042D66B0031C64A00007308000000000000000000B58C8C00FFF7E700F7EF
      DE00F7EFDE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B00000000000000000000000000000000000000
      000000000000FFEFD600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7E700FFF7E700DEBD940000000000000000000000000000000000CE63
      0000FFFFFF00FFF7E700FFF7E700FFF7E700FFD6AD00FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFCE9400000000000000000000000000000000000000
      0000000084000000840000000000000000000000000000730800087B0800087B
      080031C64A00087B0800087B08000073080000000000B58C8C00F7EFDE0084FF
      840084FF8400B58C8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFE7D600A57B73000000000000000000CE630000CE630000CE63
      0000CE630000FFEFD600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7E700DEBD940000000000000000000000000000000000CE63
      0000FFFFFF00FFFFFF00FFFFFF00FFF7E700FFD6AD00FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFCE9400000000000000000000008400000000000000
      0000000000000000840000008400000000000000000000000000000000000000
      00000073080000000000000000000000000000000000B58C8C00FFF7E700FFD6
      A500FFD6A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D600F7E7CE00FFE7
      D600FFF7E700EFDEDE00A57B73000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFEFD600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEBD940000000000000000000000000000000000CE63
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00000000000000000000008400000084000000
      8400000084000000840000008400000000000000000000000000000000000000
      00000073080000000000000000000000000000000000B58C8C00FFF7EF0084FF
      840084FF8400B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700EFDE
      DE00D6C6C600BDADAD00B58473000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFEFD600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEBD940000000000FFD6AD00FFCE9400FFCE9400FFCE
      9400FFCE9400FFCE9400FFCE9400FFFFFF00FFFFFF00FFF7E700FFF7E700CE63
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000073080000000000000000000000000000000000B58C8C00FFF7EF0084FF
      840084FF8400B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700B58C
      8C00B58C8C00B58C8C00B58C8C000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600DEBD9400DEBD9400DEBD940000000000FFD6AD00FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFCE9400FFFFFF00FFFFFF00FFFFFF00FFF7E700CE63
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000008400000084000000840000000000000000000000000000000000
      00000073080000000000000000000000000000000000B58C8C00FFFFF700FFD6
      A500FFD6A500B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C
      8C00EFB56B00C68C7B00000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600DEBD94000000000000000000FFD6AD00FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFCE9400FFFFFF00FFFFFF00FFFFFF00FFF7E700CE63
      0000000000000000000000000000000000000000000084848400840000000000
      0000000000000000000084000000848484000000000000000000000000000000
      00000073080000000000000000000000000000000000B58C8C00FFFFF70084FF
      840084FF8400B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00BD84840000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE6300000000
      000000000000000000000000000000000000FFD6AD00FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFCE9400FFFFFF00FFFFFF00FFFFFF00FFF7E700CE63
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      00000073080000000000000000000000000000000000B58C8C00FFFFFF0084FF
      840084FF840084FF840084FF8400EFDEDE00D6C6C600BDADAD00B58473000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE6300000000
      000000000000000000000000000000000000FFD6AD00FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFCE9400CE630000CE630000CE630000CE630000CE63
      0000000000000000000000000000000000000000000000000000848484008400
      0000000000008400000084848400000000000000000000000000000000000000
      00000073080000000000000000000000000000000000B58C8C00FFFFFF00FFD6
      A500FFD6A500FFD6A500FFD6A500B58C8C00B58C8C00B58C8C00B58C8C000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE6300000000
      000000000000000000000000000000000000FFD6AD00FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFCE9400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000000000000000
      00000073080000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B00000000000000
      0000000000000000000000000000000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000000000000000
      000000000000000000000000000000000000FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400840000008484840000000000000000000000000000000000000000000000
      00000073080000000000000000000000000000000000B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00BD84840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000730800000000000000000000000000000000004A637B00BD9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B58484000000000000000000C6847300B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000006B9CC600188CE7004A7BA500C694
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5B5B5003939390000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500F7CE9C00F7CE9400F7CE
      9400F7CE9400F7D69C00B584840000000000C6A59C00FFFFFF00FFFFFF00FFFF
      FF00FFFFEF00FFFFEF00FFFFEF00FFF7DE00FFF7DE00FFEFD600FFEFD600FFEF
      D600FFDEB50000189C00FFD6A500B58484004AB5FF0052B5FF00218CEF004A7B
      A500C69494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ADAD
      AD004A4A4A00949494007B7B7B00000000000000000000000000C6A59C00FFEF
      D600848484008484840084848400848484008484840084848400848484008484
      840084848400F7CE9C00B584840000000000C6A59C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFEF00FFFFEF00FFFFEF00FFF7DE00FFF7DE00FFEF
      D600FFEFD60000189C00FFDEBD00B58484000000000052B5FF0052B5FF001884
      E7004A7BA500C694940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5004242
      420094949400D6D6D6008C8C8C00000000000000000000000000C6ADA500FFF7
      E70084FF840084FF840084FF840084FF840084FF840084FF840084FF840084FF
      840084FF8400F7CE9C00B584840000000000C6ADA500FFFFFF00FFFFFF00FFFF
      FF00DEA57B00C6847300FFFFFF00DEA57B00C6847300FFFFEF00DEA57B002118
      CE002118CE002118CE0000189C0000189C00000000000000000052B5FF004AB5
      FF00188CE7004A7BA500BD949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADADAD005A5A5A009C9C
      9C00C6C6C6009494940000000000000000000000000000000000C6ADA500FFF7
      E70084FF840084FF840084FF840084FF840084FF840084FF840084FF840084FF
      840084FF8400F7CE9400B584840000000000C6ADA500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFEF00FFFF
      EF00FFF7DE002118CE00FFEFD600B584840000000000000000000000000052B5
      FF004AB5FF002184DE005A6B7300004A0000004A0000004A0000005A0000004A
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD006B6B6B009C9C9C00B5B5
      B500949494000000000000000000000000000000000000000000C6ADA500FFFF
      F700848484008484840084848400848484008484840084848400848484008484
      840084848400F7CE9C00B584840000000000D6B5AD00FFFFFF00C6847300FFFF
      FF00FFFFFF00EFE7E700943931008C2121008C212100A5635A008C212100E7CE
      C600FFFFEF002118CE00FFEFD600B58484000000000000000000000000000000
      000052BDFF00B5D6EF00185A210042632900315A1800295A1000087310000873
      100021521000CEADA50000000000000000000000000000000000000000009C9C
      9C009C9C9C009C9C9C009C9C9C00000000006B6B6B00181818006B6B6B008484
      8400000000000000000000000000000000000000000000000000DEC6B500FFFF
      FF0084FF840084FF840084FF840084FF840084FF840084FF840084FF840084FF
      840084FF840084FF8400B584840000000000D6B5AD00FFFFFF00DEA57B00FFFF
      FF00FFFFFF00BD7B7B009C424200FFFFFF00EFE7E7009C5252008C212100FFFF
      FF00FFFFEF00DEA57B00FFEFD600B58484000000000000000000000000000000
      000000000000CEB5B500D6B5A500FFEFC600FFFFD600FFFFD6001863100018BD
      4A00006B080073734200B58C8C00000000000000000000000000BDBDBD004A4A
      4A00524A4A004A4A4A0052525200A5A5A500393939006B6B6B00BDBDBD000000
      0000000000000000000000000000000000000000000000000000DEC6B500FFFF
      FF0084FF840084FF840084FF840084FF840084FF840084FF840084FF840084FF
      840084FF840084FF8400B584840000000000D6BDB500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C68C8C008C212100CE949400FFFFFF00FFFFFF008C212100FFFF
      FF00FFFFFF00FFFFEF00FFF7DE00B5848400000000000000000000000000004A
      0000004A0000C6948C00F7DEB500F7D6A500FFF7CE00FFFFD600639C5A0018AD
      390018AD390052733100DED6BD00000000000000000094949C0094846B00F7E7
      CE00FFF7E700FFF7DE00FFE7D600A59484006B6B6B00DEDED600000000000000
      0000000000000000000000000000000000000000000000000000DEC6B500FFFF
      FF00848484008484840084848400848484008484840084848400848484008484
      840084848400F7DEB500B584840000000000D6BDB500FFFFFF00C6847300FFFF
      FF00FFFFFF00FFFFFF00B56B6B00943931008C2121008C2121008C212100FFFF
      FF00FFFFFF00C6847300FFFFEF00B58484000000000000000000004A0000186B
      1800005A080039632100FFE7AD00F7CE9400004A0000004A0000006B080029C6
      520029CE5A0008731000004A0000004A0000BDBDBD0042393900FFF7E700FFF7
      DE00DEC6AD00DEC6AD00FFE7CE00FFFFF7006B636300C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000DEBDB500FFFF
      FF0084FF840084FF840084FF840084FF840084FF840084FF840084FF840084FF
      840084FF8400F7DEB500B584840000000000D6BDB500FFFFFF00DEA57B00FFFF
      FF00FFFFFF00EFE7E700CE949400FFFFFF00FFFFFF00E7D6D6008C212100FFFF
      FF00FFFFFF00DEA57B00FFFFEF00B584840000000000000000000052080021B5
      420021B5420010631800528C3900EFBD8400528C3900218C42001094290042EF
      730031E76B001084210039632100C6AD9C00A5A5A500C6B59400FFE7D600EFC6
      AD00EFBD9400EFBD9400E7C69C00F7E7CE009C8C730073737300000000000000
      0000000000000000000000000000000000000000000000000000DEC6B500FFFF
      FF0084FF840084FF840084FF840084FF840084FF840084FF840084FF840084FF
      840084FF8400C6BDAD00B584840000000000E7C6B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFE7E7008C212100BD7B7B00CE949400B56B6B008C212100FFFF
      FF00FFFFFF00FFFFFF00FFFFEF00B584840000000000004A00001084210031E7
      6B0042EF730010942900218C4200528C3900F7CE9400529442001063180021B5
      420021B54200186B2900F7EFD600C6A59C009C9C9C00D6BDA500FFE7D600F7DE
      C600F7CEA500F7CEA500FFDEC600FFE7CE00AD9C8C0084848400000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF008484840084848400848484008484840084848400FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B584840000000000E7C6B500FFFFFF00C6847300FFFF
      FF00FFFFFF00FFFFFF00DEBDB5009C525200943931009C424200DEBDB500FFFF
      FF00FFFFFF00C6847300FFFFEF00B5848400004A0000004A00000873100029CE
      5A0029C65200006B0800004A0000004A0000F7D6A500F7CE9C00528C3900005A
      0800186B18004A7B3100E7DEBD0000000000B5B5AD00C6BDA500FFD6B500FFDE
      C600FFF7DE00FFF7DE00F7D6BD00FFD6B500A5947B0084848C00000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF0084FF840084FF840084FF840084FF840084FF840084FF8400E7CECE00BD8C
      7300EFB57300EFA54A00C6846B0000000000E7C6B500FFFFFF00DEA57B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DEA57B00FFFFFF00B58484000000000000000000004A000018AD
      390018AD3900295A1800DEC6AD00FFFFFF00FFF7EF00F7CE9400EFBD84006394
      4200639C4A00FFF7C600BD9C8C0000000000CECECE00A59C8C00FFD6AD00FFE7
      D600F7FFFF00FFFFF700FFDED600FFD6B50094947B00A5A5A500000000000000
      0000000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF0084FF840084FF840084FF840084FF840084FF840084FF8400E7D6CE00C694
      7B00FFC67300CE9473000000000000000000E7C6B500FFFFFF00FFFFFF00FFFF
      FF00DEA57B00C6847300FFFFFF00DEA57B00C6847300FFFFFF00DEA57B00C684
      7300FFFFFF00FFFFFF00FFFFFF00B58484000000000000000000004A0000006B
      080018BD4A00004A000000000000D6BDBD00F7EFD600FFEFC600FFE7AD00FFE7
      B500F7DEB500CEAD9C00000000000000000000000000CECECE00BDB59400F7D6
      AD00FFFFE700FFF7DE00EFD6A500CEBDA500BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C8400000000000000000000000000E7C6B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6847300000000000000000000000000004A
      00000873100008731000004A0000185208004A63290039632100DEBDA500DEBD
      A500000000000000000000000000000000000000000000000000A5A5A500B5B5
      A500EFD6A500E7CE9C00CEC6B500A5A59C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500DEBDB500BD84
      7B000000000000000000000000000000000000000000E7C6B500E7C6B500E7C6
      B500E7C6B500E7C6B500E7C6B500D6BDB500D6BDB500D6B5AD00D6B5AD00C6AD
      A500C6ADA500C6A59C00C6A59C00000000000000000000000000000000000000
      00000000000000000000AD5A5A00AD5A5A00E7C6C600E7C6C600E7C6C600C6CE
      C600C6CEC600C6CEC600AD5A5A00943131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A637B00BD9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A00BD7B7300C65A5A00E7C6C6009C393900B5737300C6CE
      C600F7F7F700F7F7F700C65A5A009431310000000000AD5A5A00AD5A5A00E7C6
      C600E7C6C600C6CEC600C6CEC600C6CEC600C6CEC600AD5A5A00943131000000
      0000000000000000000000000000000000000000000000000000B58484008C63
      63008C6363008C6363008C6363008C6363008C6363008C6363008C6363008C63
      63007B5A5A007B5A5A0000000000000000006B9CC600188CE7004A7BA500C694
      9400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFD6A500FFD6A500FFD6
      A500FFD6A500FFD6A500BD7B7300C65A5A00C6948C009C3939009C4A4A00E7C6
      C600C6C6C600F7F7F700C65A5A0094313100BD7B7300C65A5A00C65A5A00E7C6
      C6009C393900B5737300C6CEC600F7F7F700F7F7F700C65A5A00943131000000
      0000000000000000000000000000000000000000000000000000CEADAD00DEDE
      DE00CEADAD00CEADAD00CEADAD00CEADAD00CEADAD00CEADAD00CEADAD00CEAD
      AD007B5A5A003131310000000000000000004AB5FF0052B5FF00218CEF004A7B
      A500C69494000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFD6A500FFD6A500FFD6
      A500FFD6A500FFD6A500BD7B7300C65A5A00C6948C00C6948C00BDA5A500BDA5
      A500E7C6C600C6CEC600C65A5A0094313100BD7B7300C65A5A00C65A5A00C694
      8C009C3939009C4A4A00E7C6C600C6CEC600F7F7F700C65A5A00943131000000
      000094313100000000000000000000000000000000000000000000000000CEAD
      AD00B5848400B5848400B5848400B58484008C6363008C6363008C6363007B5A
      5A00313131000000000000000000000000000000000052B5FF0052B5FF001884
      E7004A7BA500C694940000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C000000EF000000EF00F7DE
      C600F7DEC600F7DEC600BD7B7300AD524A00B55A5A00C65A5A00C65A5A00C65A
      5A00C65A5A00C65A5A00C65A5A0094313100BD7B7300C65A5A00C65A5A00C694
      8C00C6948C00BDA5A500BDA5A500E7C6C600C6CEC600C65A5A0094313100C65A
      5A009431310000000000000000000000000000000000CEADAD00CEADAD00CEAD
      AD00CEADAD00CEADAD00B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B584840000000000000000000000000052B5FF004AB5
      FF00188CE7004A7BA500BD949400000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C008484E7000000EF000000
      EF00F7DEC600F7DEC600BD7B7300AD524A00FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700C65A5A0094313100BD7B7300AD524A00B55A5A00C65A
      5A00C65A5A00C65A5A00C65A5A00C65A5A00C65A5A00C65A5A0094313100C65A
      5A0094313100000000009431310000000000CEADAD00CE9C9C00CE9C9C00CE9C
      9C00CE9C9C00CE9C9C00CE9C9C00A58C8C00A58C8C00A58C8C00A58C8C00A58C
      8C00A58C8C00A58C8C00B58484008C63630000000000000000000000000052B5
      FF004AB5FF002184DE005A6B730000000000AD7B7300C6A59C00D6B5A500CEA5
      9C0000000000000000000000000000000000B58C8C00F7EFDE00F7EFDE000000
      EF008484E700EFEFFF00BD7B7300AD524A00FFF7F700FFF7F700FFF7F700FFF7
      F700FFFFF700FFF7F700C65A5A0094313100BD7B7300AD524A00FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700C65A5A0094313100C65A
      5A0094313100C65A5A009431310000000000CEADAD00CE9C9C00FFCE6300FFCE
      6300FFCE6300FFCE6300FFCE6300FFCE6300FFCE6300FFCE6300FFCE6300FFCE
      6300FFCE6300FFCE6300B58484008C6363000000000000000000000000000000
      000052BDFF00B5D6EF00A5948C00B59C8C00F7E7CE00FFFFD600FFFFD600FFFF
      D600E7DEBD00CEADA5000000000000000000B58C8C00F7EFDE00F7EFDE00DED6
      FF000000EF000000EF00BD7B7300AD524A00FFF7F700FFF7F700FFF7F700FFF7
      F700FFFFF700FFF7F700C65A5A0094313100BD7B7300AD524A00FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700C65A5A0094313100C65A
      5A0094313100C65A5A009431310000000000CEADAD00CE9C9C00FFCE6300FFCE
      6300FFCE6300FFCE6300FFCE6300FFCE6300FFCE6300FFCE6300FFCE6300FFCE
      6300FFCE6300FFCE6300B5848400A57373000000000000000000000000000000
      000000000000CEB5B500D6B5A500FFEFC600FFFFD600FFFFD600FFFFD600FFFF
      DE00FFFFEF00F7F7EF00B58C8C0000000000B58C8C00FFF7EF00FFF7EF00FFF7
      EF000000EF00FFF7EF00BD7B7300AD524A00FFF7F700FFF7F700FFFFF700FFFF
      F700FFFFF700FFF7F700C65A5A0094313100BD7B7300AD524A00FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700C65A5A0094313100C65A
      5A0094313100C65A5A009431310000000000CEADAD00CE9C9C00FFD67300FFD6
      7300FFD67B00FFD67B00FFDE8400FFDE8400FFDE8400FFD67B00FFD67B00FFD6
      7B00FFD67B00FFD67300CEADAD00A57373000000000000000000000000000000
      000000000000C6948C00F7DEB500F7D6A500FFF7CE00FFFFD600FFFFDE00FFFF
      EF00FFFFF700FFFFFF00DED6BD0000000000B58C8C00FFF7EF00FFF7EF00FFF7
      EF00CECEFF000000EF00BD7B7300BD7B7300CEB5B500CEB5B500CEB5B500CEB5
      B500CEB5B500D6D6D600AD524A0094313100BD7B7300AD524A00FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700C65A5A0094313100C65A
      5A0094313100C65A5A009431310000000000CEADAD00CE9C9C00FFDE8400FFD6
      7B00FFDE8400FFDE8400FFDE8C00FFDE8C00FFDE8400FFDE8400FFDE8400FFD6
      7B00FFD67B00FFD67B00CEADAD00A57373000000000000000000000000000000
      000000000000DEBDA500FFE7AD00F7CE9400FFF7CE00FFFFDE00FFFFE700FFFF
      F700FFFFF700FFFFEF00F7EFD600C69C9400B58C8C00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF000000EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00BDAD
      AD00A57B7300000000000000000000000000BD7B7300AD524A00FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700C65A5A0094313100C65A
      5A0094313100C65A5A009431310000000000CEADAD00CE9C9C00FFDE8400FFDE
      8C00FFE79400FFE79400FFE79400FFE79C00FFE79400FFE79400FFDE8C00FFDE
      8C00FFDE8C00FFDE8C00CEADAD00A57373000000000000000000000000000000
      000000000000E7C6AD00FFDEAD00EFBD8400F7E7B500FFFFD600FFFFDE00FFFF
      E700FFFFE700FFFFDE00F7F7D600C6AD9C00B58C8C00FFFFFF00FFFFFF00FFFF
      FF00DED6FF000000EF00EFEFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDAD
      AD00B5847300000000000000000000000000BD7B7300AD524A00D6D6D600CEB5
      B500CEB5B500CEB5B500CEB5B500CEB5B500D6D6D600AD524A0094313100C65A
      5A0094313100C65A5A009431310000000000CEADAD00CE9C9C00FFDE8400FFDE
      8C00FFE79C00FFE79C00FFE79C00FFE79C00FFE79C00FFE79C00FFE79400FFE7
      9400FFDE8400FFDE8C00CEADAD00A57373000000000000000000000000000000
      000000000000DEBDAD00FFE7B500EFBD8400F7CE9400FFEFC600FFFFDE00FFFF
      DE00FFFFDE00FFFFDE00F7EFD600C6A59C00B58C8C00FFFFFF00FFFFFF00FFFF
      FF000000EF00CECEFF000000EF00FFFFFF00FFFFFF00B58C8C00B58C8C00B58C
      8C00B58C8C000000000000000000000000000000000000000000BD7B7300AD52
      4A00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700C65A
      5A0094313100C65A5A009431310000000000CEADAD00CE9C9C00FFDE8C00FFE7
      9C00FFEFA500FFEFAD00FFEFAD00FFEFAD00FFEFAD00FFEFAD00FFEFA500FFE7
      9C00FFE79C00FFD67B00CEADAD00A57373000000000000000000000000000000
      000000000000C69C9400FFEFC600FFEFC600F7D6A500F7CE9C00F7E7B500FFF7
      CE00FFF7D600FFFFD600E7DEBD0000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00CECEFF000000EF00DEDEEF00FFFFFF00FFFFFF00B58C8C00EFB56B00BD84
      8400000000000000000000000000000000000000000000000000BD7B7300AD52
      4A00D6D6D600CEB5B500CEB5B500CEB5B500CEB5B500CEB5B500D6D6D600AD52
      4A0094313100C65A5A009431310000000000CEADAD00CE9C9C00FFE79C00FFEF
      A500FFEFAD00FFEFAD00FFF7B500FFF7B500FFF7B500FFF7B500FFEFAD00FFEF
      A500FFE79C00FFE79C00CEADAD00B58484000000000000000000000000000000
      00000000000000000000DEC6AD00FFFFFF00FFF7EF00F7CE9400EFBD8400F7CE
      9C00FFE7B500FFF7C600BD9C8C0000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C8C00BD8484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD7B7300AD524A00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700C65A5A009431310000000000CEADAD00CE9C9C00FFF7BD00FFF7
      B500FFF7BD00FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFF7BD00FFF7
      B500FFF7B500FFFFC600CEADAD00B58484000000000000000000000000000000
      0000000000000000000000000000D6BDBD00F7EFD600FFEFC600FFE7AD00FFE7
      B500F7DEB500CEAD9C000000000000000000B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00BD848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD7B7300AD524A00D6D6D600CEB5B500CEB5B500CEB5B500CEB5B500CEB5
      B500D6D6D600AD524A00943131000000000000000000CE9C9C00CE9C9C00CE9C
      9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C
      9C00CE9C9C00CE9C9C00CEADAD00000000000000000000000000000000000000
      000000000000000000000000000000000000CEAD9400CEAD9C00DEBDA500DEBD
      A500000000000000000000000000000000000000000000000000AD5A5A00AD52
      5200A54A4A00AD949400C6CEC600CECEC600CECEC600C6CEC600C6CEC600B59C
      9C009C4242009C424200A5525200000000000000000000000000000000000000
      00000000000000000000AD5A5A00AD5A5A00E7C6C600E7C6C600E7C6C600C6CE
      C600C6CEC600C6CEC600AD5A5A00943131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AD5A5A00AD5A5A00E7C6C600E7C6C600E7C6C600C6CE
      C600C6CEC600C6CEC600AD5A5A009431310000000000BD7B7300CE636300CE6B
      6B00B55A5A009C848400BDA5A500E7CECE00FFF7F700FFFFF700F7F7F700CEB5
      B500942929009C313100C65A5A00AD5A5A000000000000000000000000000000
      00000000000000000000BD7B7300C65A5A00E7C6C6009C393900B5737300C6CE
      C600F7F7F700F7F7F700C65A5A00943131000000000094313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009431310000000000B58C8C008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A00BD7B7300C65A5A00E7C6C6009C393900B5737300C6CE
      C600F7F7F700F7F7F700C65A5A009431310000000000BD7B7300CE636300CE63
      6300B55A5A009C7B7B009C424200B5737300E7DEDE00FFF7F700FFFFFF00D6B5
      B500943131009C313100BD5A5A00AD5A5A000000000000000000000000000000
      00000000000000000000BD7B7300C65A5A00C6948C009C3939009C4A4A00E7C6
      C600C6C6C600F7F7F700C65A5A00943131000000000000000000B57373000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B57373000000000000000000B58C8C00FFD6A500FFD6A500FFD6
      A500FFD6A500FFD6A500BD7B7300C65A5A00C6948C009C3939009C4A4A00E7C6
      C600C6C6C600F7F7F700C65A5A009431310000000000BD7B7300CE636300CE63
      6300B55A5A00AD8484009C3939009C393900CEBDBD00EFEFEF00FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A000000000000000000000000000000
      00000000000000000000BD7B7300C65A5A00C6948C00C6948C00BDA5A500BDA5
      A500E7C6C600C6CEC600C65A5A0094313100000000000000000000000000AD5A
      5A00AD5A5A00E7C6C600E7C6C600E7C6C600C6CEC600C6CEC600C6CEC600AD5A
      5A0094313100000000000000000000000000B58C8C00FFD6A500FFD6A500FFD6
      A500FFD6A500FFD6A500BD7B7300C65A5A00C6948C00C6948C00BDA5A500BDA5
      A500E7C6C600C6CEC600C65A5A009431310000000000BD7B7300CE636300CE63
      6300B55A5A00B58C8C009C4A4A0094313100A59C9C00D6D6D600FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A000000000000000000000000000000
      0000A5947B00AD847B00BD7B7300AD524A00B55A5A00C65A5A00C65A5A00C65A
      5A00C65A5A00C65A5A00C65A5A0094313100000000000000000000000000BD7B
      7300C65A5A00E7C6C6009C393900B5737300C6CEC600F7F7F700F7F7F700C65A
      5A0094313100000000000000000000000000B58C8C00F7DEC600F7DEC600F7DE
      C600F7DEC600F7DEC600BD7B7300AD524A00B55A5A00C65A5A00C65A5A00C65A
      5A00C65A5A00C65A5A00C65A5A009431310000000000BD7B7300CE636300CE63
      6300BD5A5A00C6948C00C6949400B5848400AD8C8C00BDA5A500E7C6C600DEAD
      AD00A5393900A5393900C65A5A00AD5A5A00000000000000000000000000A57B
      6300BD633900C6634200BD7B7300AD524A00FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700C65A5A0094313100000000000000000000000000BD7B
      7300C65A5A00C6948C009C3939009C4A4A00E7C6C600C6C6C600F7F7F700C65A
      5A0094313100000000000000000000000000B58C8C00F7DEC600F7DEC600F7DE
      C6008484840000000000BD7B7300AD524A00FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700C65A5A009431310000000000BD7B7300CE636300CE63
      6300CE636300CE636300CE636300CE636300CE636300C65A5A00C65A5A00CE63
      6300CE636300CE636300CE6B6B00AD525A000000000000000000BD734A00C65A
      1800A54218008C522100BD7B7300AD524A00FFF7F700FFF7F700FFF7F700FFF7
      F700FFFFF700FFF7F700C65A5A0094313100000000000000000000000000BD7B
      7300C65A5A00C6948C00C6948C00BDA5A500BDA5A500E7C6C600C6CEC600C65A
      5A0094313100000000000000000000000000B58C8C00F7EFDE00F7EFDE008484
      840084000000FF000000BD7B7300AD524A00FFF7F700FFF7F700FFF7F700FFF7
      F700FFFFF700FFF7F700C65A5A009431310000000000BD7B7300B5525200B55A
      5A00C6848400D6A5A500D6ADAD00D6ADA500D6ADAD00D6A5A500D6A5A500D6AD
      A500D6ADAD00D69C9C00CE636300AD52520000000000BD734A00BD521000A539
      0000AD42000031630000BD7B7300AD524A00FFF7F700FFF7F700FFF7F700FFF7
      F700FFFFF700FFF7F700C65A5A0094313100000000000000000000000000BD7B
      7300AD524A00B55A5A00C65A5A00C65A5A00C65A5A00C65A5A00C65A5A00C65A
      5A0094313100000000000000000000000000B58C8C00F7EFDE00F7EFDE008484
      0000FF00000084840000BD7B7300AD524A00FFF7F700FFF7F700FFF7F700FFF7
      F700FFFFF700FFF7F700C65A5A009431310000000000BD7B7300AD524A00E7CE
      CE00F7F7F700F7F7EF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700DEBDBD00C65A5A00AD525A00B58473009C524200AD420000CE5A
      0000BD6B0000007B0000BD7B7300AD524A00FFF7F700FFF7F700FFFFF700FFFF
      F700FFFFF700FFF7F700C65A5A0094313100000000000000000000000000BD7B
      7300AD524A00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700C65A
      5A0094313100000000000000000000000000B58C8C00FFF7EF00FFF7EF008484
      0000C6C6C600C6C6C600BD7B7300AD524A00FFF7F700FFF7F700FFFFF700FFFF
      F700FFFFF700FFF7F700C65A5A009431310000000000BD7B7300B5524A00EFD6
      D600FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7F7F700DEBDBD00C65A5A00AD525A00B58473009C524200CE5A0000D67B
      0000848C000039940000BD7B7300AD524A00D6D6D600CEB5B500CEB5B500CEB5
      B500CEB5B500D6D6D600AD524A0094313100000000000000000000000000BD7B
      7300AD524A00FFF7F700FFF7F700FFF7F700FFF7F700FFFFF700FFF7F700C65A
      5A0094313100000000000000000000000000B58C8C00FFF7EF00FFF7EF008484
      0000C6C6C60084840000BD7B7300AD524A00D6D6D600CEB5B500CEB5B500CEB5
      B500CEB5B500D6D6D600AD524A009431310000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A00B58473009C524200C673000029A5
      180031AD2100D6AD1800FF9C0800E78C00003184000000730000426B1000636B
      290000000000000000000000000000000000000000000000000000000000BD7B
      7300AD524A00FFF7F700FFF7F700FFF7F700FFF7F700FFFFF700FFF7F700C65A
      5A0094313100000000000000000000000000B58C8C00FFF7EF00FFF7EF00C6C6
      C6008484000084848400FF0000000084000084840000C6C6C600FFF7EF00BDAD
      AD00A57B730000000000000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00DED6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DED6
      D600EFEFEF00DEBDBD00C65A5A00AD525A00B5847300BD734A007B94080010C6
      4A0031CE63007BCE6B00FFCE5A00FFA510006B8C000000840000296B0000296B
      000000000000000000000000000000000000000000000000000000000000BD7B
      7300AD524A00FFF7F700FFF7F700FFFFF700FFFFF700FFFFF700FFF7F700C65A
      5A0094313100000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600848400008484000084840000C6C6C600FFFFFF00FFFFFF00BDAD
      AD00B584730000000000000000000000000000000000BD7B7300B5524A00EFD6
      D600F7F7EF00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00EFEFEF00DEBDBD00C65A5A00AD525A00B5847300BD734A0031BD390042D6
      7300A5E79C00A5F7B500D6E79400D6B52900B58C0000318400005A7B2900A594
      7B0000000000000000000000000000000000000000000000000000000000BD7B
      7300AD524A00D6D6D600CEB5B500CEB5B500CEB5B500CEB5B500D6D6D600AD52
      4A0094313100000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C8C00B58C8C00B58C
      8C00B58C8C0000000000000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A0000000000A5947B0084C6730063DE
      7B00BDF7AD00D6FFBD005ADE840039B53100F78C0000C6840800A5947B000000
      0000000000000000000000000000000000000000000000000000B57373000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B57373000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C8C00EFB56B00BD84
      84000000000000000000000000000000000000000000BD7B7300B5524A00E7D6
      CE00FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00FFF7F700DEBDBD00C65A5A00AD525A000000000000000000A5947B00ADC6
      8C00A5D6840094DE8C0052CE63004AB53900D69C4200A5947B00000000000000
      0000000000000000000000000000000000000000000094313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009431310000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C8C00BD8484000000
      0000000000000000000000000000000000000000000000000000AD524A00CEB5
      B500D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00D6D6D600CEADAD00A54A4A0000000000000000000000000000000000B584
      7300B5847300B5847300B5847300B5847300B584730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00BD848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009CCE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A9CD600316BAD00316B
      AD00316BAD00316BAD00316BAD00316BAD00316BAD00316BAD00316BAD00316B
      AD00316BAD00316BAD00316BAD0000000000CE630000B55A0000B55A0000B55A
      0000B55A0000B55A0000B55A0000B55A0000B55A0000B55A0000B55A0000B55A
      0000B55A0000B55A0000B55A0000B55A0000000000000000000000000000009C
      CE00009CCE0000639C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6846300BD633100B5521000B5521000BD633100C68463000000
      000000000000000000000000000000000000000000005A9CD600F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00316BAD0000000000CE630000F7ADA5005A5A5A00F7AD
      A5005A5A5A00F7ADA5005A5A5A00F7ADA5005A5A5A00F7ADA5005A5A5A00F7AD
      A5005A5A5A00F7ADA5005A5A5A00F7ADA5000000000000000000009CCE0000CE
      FF00009CCE00009CCE0000639C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD633100B5521000B5521000B5521000B5521000B5521000B5521000BD63
      310000000000000000000000000000000000000000005A9CD600F7FFFF00296B
      3100296B3100296B3100296B3100296B3100296B3100296B3100296B3100296B
      3100296B3100F7FFFF00316BAD0000000000CE630000F7ADA5005A5A5A00F7AD
      A5005A5A5A00F7ADA5005A5A5A00F7ADA5005A5A5A00F7ADA5005A5A5A00F7AD
      A5005A5A5A00F7ADA5005A5A5A00F7ADA50000000000009CCE0000CEFF0000CE
      FF0000CEFF0000639C00009CCE0000639C000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD63
      3100B5521000BD633100C68463000000000000000000C6846300BD633100B552
      1000BD633100000000000000000000000000000000004AA5EF00F7FFFF00296B
      3100F7FFFF007BADD600F7FFFF007BADD600F7FFFF00F7FFFF007BADD600F7FF
      FF00296B3100F7FFFF00316BAD0000000000CE630000F7ADA500F7ADA500F7AD
      A500F7ADA500F7ADA500F7ADA500F7ADA500F7ADA500F7ADA500F7ADA500F7AD
      A500F7ADA500F7ADA5005A5A5A00F7ADA500009CCE009CFFFF009CFFFF0000CE
      FF0000CEFF0000CEFF00009CCE00009CCE0000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000C6846300B552
      1000BD633100000000000000000000000000000000000000000000000000BD63
      3100B5521000C68463000000000000000000000000004AA5EF00F7FFFF00296B
      31004ABD6B007BADD6004ABD6B007BADD6004ABD6B004ABD6B007BADD6004ABD
      6B00296B3100F7FFFF00316BAD0000000000CE630000FFC6C600FFC6C600FFC6
      C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6
      C600FFC6C600FFC6C600FFC6C600FFC6C60000000000009CCE009CFFFF000063
      9C0000CEFF0000CEFF0000CEFF0000639C00009CCE0000639C00000000000000
      0000000000000000000000000000000000000000000000000000BD633100B552
      100000000000000000000000000000000000000000000000000000000000C684
      6300B5521000BD6331000000000000000000000000004AA5EF00F7FFFF00296B
      3100F7FFFF007BADD600F7FFFF007BADD600F7FFFF00F7FFFF007BADD600F7FF
      FF00296B3100F7FFFF00316BAD0000000000CE630000FFC6C600FFC6C600FFC6
      C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C6000000
      00000000000000000000FFC6C600FFC6C600000000000000000000639C009CFF
      FF009CFFFF0000CEFF0000CEFF0000CEFF00009CCE00009CCE0000639C000000
      0000000000000000000000000000000000000000000000000000B5521000B552
      1000000000000000000000000000000000000000000000000000000000000000
      0000B5521000B55210000000000000000000000000004AA5EF00F7FFFF00296B
      31004ABD6B007BADD6004ABD6B007BADD6004ABD6B004ABD6B007BADD6004ABD
      6B00296B3100F7FFFF00316BAD0000000000CE630000FFC6C600FFC6C600B55A
      0000FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6
      C60000000000FFC6C600FFC6C600FFC6C600000000000000000000000000009C
      CE009CFFFF0000639C0000CEFF0000CEFF0000CEFF0000639C00009CCE000063
      9C00000000000000000000000000000000000000000000000000B5521000B552
      10000000000000000000000000000000000000000000CE844200000000000000
      0000B5521000B55210000000000000000000000000004AA5EF00F7FFFF00296B
      3100F7FFFF007BADD600F7FFFF007BADD600F7FFFF00F7FFFF007BADD600F7FF
      FF00296B3100F7FFFF00316BAD0000000000CE630000FFC6C600FFC6C600B55A
      0000B55A0000FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6
      C60000000000FFC6C600FFC6C600FFC6C6000000000000000000000000000000
      000000639C009CFFFF009CFFFF0000CEFF0000CEFF0000CEFF00009CCE00009C
      CE0000639C000000000000000000000000000000000000000000BD633100B552
      1000C684630000000000000000000000000000000000BD7B5200CE8442000000
      0000B5521000BD6331000000000000000000000000004AA5EF00F7FFFF00296B
      3100296B3100296B3100296B3100296B3100296B3100296B3100296B3100296B
      3100296B3100F7FFFF00316BAD0000000000CE630000FFC6C600FFC6C600FFC6
      C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C6000000
      000000000000FFC6C600FFC6C600FFC6C6000000000000000000000000000000
      000000000000009CCE009CFFFF0000639C0000CEFF0000CEFF0000CEFF000063
      9C00009CCE0000639C0000000000000000000000000000000000C6846300B552
      1000BD63310000000000000000000000000000000000CE7B3900FF9C0800BD63
      3100B5521000C68463000000000000000000000000004AA5EF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00316BAD0000000000CE630000FFC6C600FFC6C600FFC6
      C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6
      C60000000000FFC6C600FFC6C600FFC6C6000000000000000000000000000000
      0000000000000000000000639C009CFFFF009CFFFF0000CEFF0000CEFF0000CE
      FF00009CCE00009CCE0000639C0000000000000000000000000000000000BD63
      3100B552100000000000000000000000000000000000CE6B0800E7840000DE73
      0000BD633100000000000000000000000000000000004AA5EF00F7FFFF00F7FF
      FF00296B3100296B3100296B3100296B3100296B3100296B3100296B3100296B
      3100F7FFFF00F7FFFF00316BAD0000000000CE630000FFC6C600FFC6C600FFC6
      C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6
      C600FFC6C600FFC6C600FFC6C600FFC6C6000000000000000000000000000000
      0000000000000000000000000000009CCE009CFFFF0000639C0000CEFF0000CE
      FF0000CEFF0000639C00009CCE00009CCE000000000000000000000000000000
      00000000000000000000000000000000000000000000BD5A0000D6730000E784
      0000FF9C0800BD6B42000000000000000000000000004AA5EF00F7FFFF00F7FF
      FF004ABD6B004ABD6B0042B55A0042B55A00319C3900319C3900319C39003184
      3900F7FFFF00F7FFFF00316BAD0000000000CE630000FFDEDE00FFDEDE00FFDE
      DE0084848400FFDEDE00FFDEDE00FFDEDE0084848400FFDEDE00FFDEDE00FFDE
      DE0084848400FFDEDE00FFDEDE00FFDEDE000000000000000000000000000000
      00000000000000000000000000000000000000639C009CFFFF009CFFFF0000CE
      FF0000CEFF0000CEFF00009CCE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD4A0000BD5A0000CE6B
      0800CE7B3900BD7B5200BD6B420000000000000000004AA5EF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00316BAD0000000000CE630000FFDEDE0084848400FFDE
      DE0084848400FFDEDE0084848400FFDEDE0084848400FFDEDE0084848400FFDE
      DE0084848400FFDEDE0084848400FFDEDE000000000000000000000000000000
      00000000000000000000000000000000000000000000009CCE009CFFFF000063
      9C0000CEFF00009CCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004AA5EF004AA5EF004AA5
      EF004AA5EF004AA5EF004AA5EF004AA5EF004AA5EF004AA5EF004AA5EF005A9C
      D6005A9CD6005A9CD6005A9CD60000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000639C009CFF
      FF00009CCE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009C
      CE00000000000000000000000000000000000000000000000000000000000000
      0000AD4A0000C65A0000BD735200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B635A0073635A000000
      00007B736B005A524A006B635A0000000000000000000000000000000000B552
      1000CE630000C65A0000B55A3100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5636B00FFEF
      C600C6CE9400D6CE9400EFCE9C00E7CE9400EFC68400EFBD8400EFBD7B00EFBD
      8400EFBD8400EFC68400A5636B00000000000000000000000000000000000000
      00008C8C8C00949494007373730073737300636363005A5A5A00525252005252
      52005A5A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A525200D69494009C7B7B008473
      73009C737300DE8C8C004A424200000000000000000000000000B55A2100CE63
      0000C6630000B55A310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5636B00FFEF
      CE009CBD7300299C21006BAD4A0021941000219410005AA53900CEB57300EFBD
      7B00EFBD7B00EFC68400A5636B00000000000000000000000000000000009494
      9400848484009C9C9C0052525200525252006B6B6B0039393900525252004242
      4200313131003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B636B008C6B6B00EFA5A500FFAD
      AD00AD7B7B0063525200000000000000000000000000C6846300C6630000CE63
      0000B55A21000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5635A00FFEF
      DE00BDCE9C00108C08000084000000840000008400000084000029941800DEBD
      7B00EFBD7B00EFC68400A5636B00000000000000000000000000000000009C9C
      9C00848484009C9C9C004A4A4A004A4A4A006B6B6B0029292900525252004242
      4200212121002929290000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C7B7B00DE9C
      9C005242420000000000000000000000000000000000B54A0000CE630000AD4A
      00000000000000000000C6846300BD5A0000BD5A0000BD5A0000BD5A0000BD5A
      0000BD5A0000BD5A0000AD4A0000000000000000000000000000A5635A00FFF7
      E700BDCE9C00189410000084000018941000ADBD730073AD4A000084000073AD
      4A00EFBD8400EFC68400A5636B00000000000000000000000000000000009C9C
      9C0084848400A5A5A50042424200424242006B6B6B0018181800525252004242
      4200101010002929290000000000000000006B635A0073635200736352007363
      52007363520073635200736352007363520073635200736352007B736B00DE9C
      9C003929210073635A0073635A0084736B00C6846300C6630000C66300000000
      00000000000000000000BD6B4200C6630000CE630000CE630000CE630000CE63
      0000CE6B0000D6730000B5520000000000000000000000000000A5736B00FFF7
      EF00BDD6A500088C0800008400000084000084B55A00EFCEA500A5B56B006BAD
      4A00EFC68C00EFC68400A5636B0000000000000000000000000000000000A5A5
      A50084848400A5A5A5004A4A4A004A4A4A006B6B6B0018181800525252004242
      4200101010002929290000000000000000006B635A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00847B7B00DEA5
      A500524A4200FFFFFF00635A5A0073635A00B5521000CE630000AD4A00000000
      0000000000000000000000000000CE9C8400CE9C8400CE9C8400A5421000CE63
      0000D6730000DE7B0000BD5A0000000000000000000000000000A5736B00FFFF
      FF00E7E7D600A5CE94009CC6840094BD73009CBD7300EFD6AD00EFCEA5009CC6
      7B00EFC69400EFC68C00A5636B0000000000000000000000000000000000A5A5
      A50084848400ADADAD004A4A4A004A4A4A006B6B6B0018181800525252004242
      4200101010002929290000000000000000006B635A00FFFFFF00E7390000D639
      0000CE310000B5310000B5310000A5290000A5290000FFFFFF00847B7B00DEA5
      A50063525200FFFFFF00635A5A0073635200B54A0000CE630000C67342000000
      00000000000000000000000000000000000000000000C6846300CE630000DE73
      0000CE630000E7840000C6630000000000000000000000000000BD846B00FFFF
      FF00A5DEA500FFEFE700F7EFD6009CC6840094BD730094BD73009CBD7300EFCE
      A500EFCE9C00F7CE9400A5636B0000000000000000000000000000000000A5A5
      A50084848400ADADAD004A4A4A004A4A4A006B6B6B0018181800525252004242
      4200101010002929290000000000000000006B635A00FFFFFF00E7390000D639
      0000CE310000B5310000B5310000A5290000A5290000FFFFFF00847B7B00DEAD
      AD0063525200FFFFFF00635A5A00735A5200B54A0000CE630000C67342000000
      000000000000000000000000000000000000BD7B5200CE6B0000DE7B0000B552
      0000B5521000F7940000CE630000000000000000000000000000BD846B00FFFF
      FF0073C67300ADD6A500FFEFE70084C673000084000000840000088C0800EFD6
      AD00EFCEA500F7D6A500A5636B00000000000000000000000000000000009C9C
      9C0084848400A5A5A50042424200424242006B6B6B0018181800525252004242
      4200101010002929290000000000000000006B635A00FFFFFF00E7390000D639
      0000CE310000B5310000B5310000A5290000A5290000FFFFFF00847B7B00DEB5
      B50063525200FFFFFF00635A5A00735A5200B5521000CE630000B54A00000000
      0000000000000000000000000000BD633100CE6B0000E7840000B55200000000
      0000CE844200FF9C0800CE6B0800000000000000000000000000D6946B00FFFF
      FF0084CE8400008400007BC67300ADD6A5001894180000840000108C0800F7D6
      B500F7D6AD00EFCEA500A5636B00000000000000000000000000000000009C9C
      9C0084848400A5A5A50042424200424242006B6B6B0018181800525252004242
      4200101010002929290000000000000000006B635A00FFFFFF00E7390000D639
      0000CE310000B5310000B5310000A5290000A5290000FFFFFF0084847B00DEB5
      B50063525200FFFFFF00635A5A00735A5200C6846300C6630000C6630000B552
      1000C68C7300C67B5200BD520000E77B0000E7840000C6631000000000000000
      0000CE844A00FFAD3100CE732100000000000000000000000000D6946B00FFFF
      FF00F7F7EF0029A5290000840000008400000084000000840000108C0800FFEF
      CE00DECEB500B5AD9400A5636B0000000000000000000000000094949400A5A5
      A500737373009C9C9C0039393900393939006B6B6B0018181800525252004A4A
      4A0010101000313131007B7B7B00000000006B635A00FFFFFF00E7390000D639
      0000CE310000B5310000B5310000A5290000A5290000FFFFFF0084848400DEBD
      BD0063525200FFFFFF00635A5200735A520000000000AD4A1000C6630000CE6B
      0000D6730000DE7B0000E7840000E77B0000B55A210000000000000000000000
      0000C67B5200FFBD6300CE7B3900000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00DEF7DE0063BD6300219C2100219C210073BD6B00299C2100946B
      5200A56B5A00A56B5A00A5636B000000000000000000000000008C8C8C009C9C
      9C009C9C9C00949494007B7B7B007B7B7B00636363005A5A5A00525252004A4A
      4A00424242003131310021212100000000006B635A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700EFEFEF0084848400DEBD
      BD005A524A00FFFFFF00635A520073635A000000000000000000BD6B4200BD5A
      0000CE6B0000CE6B0000C6631000CE9C84000000000000000000000000000000
      000000000000C6845A00CE947B00000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEF7DE00DEF7DE00FFFFF700ADB594008C6B
      5200E79C5200E78C3100B56B4A00000000000000000000000000737373006363
      6300636363006B6B6B00636363006363630052525200525252004A4A4A004A4A
      4A00313131003131310073737300000000006B635A006B635A006B635A006B63
      5A006B635A006B635A006B635A006B635A00635A5A005A524A00847B7B00DEC6
      C6004A4239006B635A006B635A0073635A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C600A56B
      5A00FFB55A00BD7B5A0000000000000000000000000000000000000000009C9C
      9C00949494009494940084848400848484007B7B7B00737373006B6B6B006B6B
      6B00636363005A5A5A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848C8C005A525200948C8C00FFE7
      E7005A525200524A42006B5A5200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00DEC6C600A56B
      5A00BD846B000000000000000000000000000000000000000000000000000000
      000000000000A5A5A5007B7B7B000000000000000000737373007B7B7B004242
      4200000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848C8C00EFEFEF00D6C6C6006B63
      6300DEC6C600FFE7E7004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00A56B
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5A5A5007B7B7B007B7B7B007B7B7B00424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B636300848C8C00948C8C000000
      0000848C8C00948C8C00948C8C00000000000000000000000000000000000000
      0000635242006352420063524200635242006352420063524200635242006352
      4200635242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B57B
      7B00B57B7B00E7CECE00E7CECE00E7CECE00E7CECE00E7CECE00E7CECE00E7CE
      CE00635242006352420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDAD00ADAD9C00ADAD9C00ADAD9C00AD9C8400AD9C8400BDAD94000000
      000000000000000000000000000000000000000000000000000000000000B57B
      7B00FFEFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7CECE006352420000000000000000000000000029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60029ADD6000000000000000000000000000000
      000000000000007B000000630000006300000063000000630000007B00000000
      000000000000000000000000000000000000000000000000000000000000EFE7
      DE00FFEFCE00FFE7C600FFE7BD00FFE7C600FFEFCE00FFF7D600FFE7C600AD9C
      840000000000000000000000000000000000000000000000000000000000B57B
      7B00FFEFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7CECE006352420000000000000000000000000029ADD60094FFFF0094FF
      FF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FF
      FF0094FFFF0094FFFF0094FFFF0029ADD6000000000000000000000000000000
      0000006300000063000010A5290010A52900089C2100089C2100006300000063
      0000000000000000000000000000000000000000000000000000EFE7DE00FFFF
      DE00FFE7BD00FFDEAD00FFD6A50042B54200FFF7E700FFF7E700FFFFE700FFFF
      DE00AD9C8400000000000000000000000000000000000000000000000000B57B
      7B004A6BE7000839EF000839EF000839EF000839EF000839EF000839EF000839
      EF000018AD006352420000000000000000000000000029ADD60094FFFF008484
      8400848484008484840084848400848484008484840094FFFF00848484008484
      8400848484008484840094FFFF0029ADD6000000000000000000000000000063
      00000063000010A5290010A5290010B5390010B53900089C2100089C21000063
      0000006300000000000000000000000000000000000000000000E7C69C00FFE7
      B500FFF7D600FFDEB500FFD6A50042B54200009C0000009C000021A52100CEEF
      C600FFFFDE00AD9C84000000000000000000000000000000000000000000B57B
      7B004A6BE7000839EF00C6C6C600848484000839EF0084848400C6C6C6000839
      EF000018AD006352420000000000000000000000000029ADD60094FFFF0094FF
      FF00AD738400AD73840094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FF
      FF0094FFFF0094FFFF0094FFFF0029ADD6000000000000000000007B00000063
      000010A5290010B5390010B5390010B5390010B5390010B53900089C2100089C
      210000630000007B000000000000000000000000000000000000F7C68C00F7BD
      8400FFCE9C00FFE7BD00FFF7CE0042B54200009C000052BD5200EFFFEF0042B5
      4200FFE7C600BDAD94000000000000000000000000000000000000000000B57B
      7B004A6BE7000839EF00FFFFFF00FFFFFF000018AD00FFFFFF00FFFFFF000839
      EF000018AD006352420000000000000000000000000029ADD60029ADD600AD73
      8400AD738400FFFFFF00B584840029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60029ADD60000000000000000000063000010A5
      290010B5390010B5390010B5390010A5290010A5290010B5390010B53900089C
      2100089C210000630000000000000000000000000000EFE7DE00FFC69400FFC6
      9400FFC69400FFC69400FFDEB50042B5420042B5420021A52100DEEFD6008CD6
      8C00CED6A500BDAD94000000000000000000000000000000000000000000B57B
      7B004A6BE7000839EF000839EF000839EF00C6C6C6000839EF000839EF000839
      EF000018AD00635242000000000000000000000000000000000000000000AD73
      8400FFFFFF00B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006300007BD6
      7B0010B5390010B5390010A5290010A5290010A5290010A5290010B5390010B5
      3900089C210000630000000000000000000000000000EFDEC600FFD6A500FFD6
      A500FFD6A500FFD6A500FFE7CE0084CE7B00FFF7E70073C6730042B5420042B5
      4200DEE7BD00D6CEAD000000000000000000000000000000000000000000B57B
      7B004A6BE7000839EF000839EF00C6C6C600FFFFFF00C6C6C6000839EF000839
      EF000018AD0063524200000000000000000084848400AD73840000000000AD73
      8400FFFFFF00B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006300007BD6
      7B0010B5390010B5390010A5290010A5290010A5290010A5290010B5390010B5
      3900089C210000630000000000000000000000000000F7DEBD00FFDEB500FFDE
      B500FFDEB500FFDEB500FFE7BD0052BD520084CE7B0084CE8400009C000042B5
      4200FFE7C600D6CEAD000000000000000000000000000000000000000000B57B
      7B004A6BE7000839EF000839EF000839EF000839EF000839EF000839EF000839
      EF000018AD0063524200000000000000000084848400FFFFFF00AD738400FFFF
      FF00B58484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006300007BD6
      7B007BD67B0010B5390010B5390010A5290010A5290010B5390010B53900089C
      2100089C210000630000000000000000000000000000FFE7BD00FFEFC600FFEF
      C600FFEFC600FFEFC600FFEFC600DEEFC60021A52100009C0000009C000042B5
      4200FFEFD600D6CEAD000000000000000000000000000000000000000000B57B
      7B00FFEFF700FFEFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEF
      F700E7CECE0063524200000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00B5848400B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000007B00000063
      00007BD67B007BD67B0010B5390010B5390010B5390010B53900089C2100089C
      210000630000007B0000000000000000000000000000FFE7BD00FFFFDE00FFFF
      DE00FFFFDE00FFFFDE00FFFFDE00FFFFDE00EFFFDE00BDE7B500CEEFC60042B5
      4200FFFFE700DEDEC60000000000000000000000000000000000000000000000
      0000B57B7B00FFEFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEFF700E7CE
      CE006352420000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000063
      0000006300007BD67B007BD67B0010B5390010B53900089C2100089C21000063
      00000063000000000000000000000000000000000000FFD6AD00FFFFDE00FFFF
      DE00FFFFDE00FFFFDE00FFF7D600FFEFC600FFDEB500FFE7B500FFEFCE00FFFF
      DE00FFFFDE00DEDEC60000000000000000000000000000000000000000000000
      0000635242006352420063524200635242006352420063524200635242006352
      42006352420000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00B58484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000630000006300007BD67B007BD67B00089C2100089C2100006300000063
      00000000000000000000000000000000000000000000FFE7CE00FFD6AD00FFD6
      AD00FFD6AD00EFCEA500EFB57300EFB56B00EFB57300F7BD7B00F7BD7B00F7C6
      8C00FFE7BD00DEDEC60000000000000000000000000000000000000000004242
      4200080808000808080008080800080808000808080008080800080808000808
      08000808080008080800000000000000000084848400FFFFFF00FFFFFF00B584
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007B000000630000006300000063000000630000007B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFD6AD00EFCEA500F7BD8400F7BD8400F7C6
      8C00F7C68C00FFDEAD0000000000000000000000000000000000000000007B7B
      7B009C9C9C008484840042424200424242003939390039393900393939003131
      31003131310008080800000000000000000084848400FFFFFF00B58484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFD6AD00FFC6
      9400FFC69400F7CEA50000000000000000000000000000000000000000000000
      00007B7B7B004242420042424200424242004242420042424200424242004242
      420042424200000000000000000000000000C6C6C600B5848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C6B63009C6B
      63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B
      63009C6B63009C6B6300A56B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4A18000000000000000000000000000000
      000000000000E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6
      B5000000000000000000000000000000000000000000000000009C736B00FFE7
      C600F7DEB500F7D6AD00F7D69C00F7CE9400EFC68400EFC68400EFC68400EFC6
      8400EFC68400EFC684009C6B6300000000000000000042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF4A1800FF8463000000000000000000000000000000
      000042182100E7C6B500F7F7F700FFEFDE00F7DEC600F7DEC600FFFFFF00E7C6
      B5004218210000000000000000000000000000000000000000009C736B00F7E7
      C600F7DEBD00F7D6AD00EFCEA500EFCE9C00EFC69400EFC68400EFBD7B00EFBD
      7B00EFBD7B00EFBD7B009C6B6300000000000000000084848400424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF4A1800FF846300000000000000000000000000000000005252
      520042182100E7C6B500F7F7F700FFD6A500FFCE9C00FFCE9C00FFFFFF00E7C6
      B5004218210052525200000000000000000000000000000000009C736B00F7E7
      D600FFEFCE00F7DEBD00FFDEB500F7D6AD00EFCE9C00EFC69400EFC68400EFBD
      7B00EFBD7B00EFBD7B009C6B6300000000000000000000000000848484004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4A1800FF4A180000000000000000000000
      0000FF4A1800FF8463000000000000000000000000006B6B6B004A4A4A004A4A
      4A004A4A4A00E7C6B500F7F7F700FFEFDE00F7DEC600F7DEC600F7F7F700E7C6
      B5004A4A4A004A4A4A0042182100000000000000000000000000A5737300FFF7
      DE00948C8C00948C8C00948C8C00948C8C00E7C69C00EFCE9C00EFC69400EFC6
      8400EFBD7B00EFBD7B009C6B6300000000000000000000000000000000000000
      00004242420084848400000084000000840000005A0000005A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF4A1800FF945200FF945A00FF4A1800FF4A1800FF4A
      1800FF8C6B000000000000000000000000007B7B7B004A4A4A005A5252005252
      52004A4A4A009C9C9C00ADADAD00ADB5B500B5B5B500B5B5B500A5A5A5009494
      9C004A4A4A0052525A004A5252004A4A4A000000000000000000A57B7300FFFF
      F700313129006B7394001029A50021213900D6B58C00F7D6AD00EFCE9C00EFC6
      9400EFC68400EFBD7B009C6B6300000000000000000000000000000000000000
      000084848400000084000000FF00000084000000840000005A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF4A1800FF945A00FF9C6300FFA56B00FFB58400FF8C
      6B00FF84630000000000000000000000000052525200847B8400949C9C008C9C
      9C008C9C9400949C9C00949494008C8C8C007B847B0084948C008C949400949C
      9C008C849C00B5B5B5008CFF7B00421821000000000000000000AD847B00FFFF
      F70031313900637BE7007B94FF0010219C00DEC69C00FFDEB500EFCEA500EFCE
      9C00EFC69400EFC684009C6B6300000000000000000000000000000000000000
      0000000084000000FF000000FF000000FF000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF4A1800FF9C6300FFA57300FFB58400FFBD9400FF8C
      6B00FF846300000000000000000000000000525252009C9C9C00BDBDBD00ADAD
      AD00948C8C00846B7300846B6B0084636B00845A6B007B636B008C6B6B008C63
      7300A57BA5008C4A5A00B5B5B500421821000000000000000000B58C7B00FFFF
      FF0042424200524A4A005A524A00182994006373D600C6B59C00F7D6B500EFCE
      A500EFCE9C00EFC694009C6B6300000000000000000000000000000000000000
      00004242FF000000FF000000FF000000FF000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF4A1800FF945A00FF9C6300FFAD7B00FFBD9400FFE7CE00FFE7
      CE00FF8C6B0000000000000000000000000063636300ADADAD00D6DEDE008C6B
      73009C6B7300A57B7B00BD8C8C00C68C9400BD8C9400BD8C9400C68C8C00A573
      7B00A56B7B008C4A5A00BDD6BD00525252000000000000000000BD8C7B00FFFF
      FF00FFFFFF00F7EFE700F7E7D600F7E7D600637BE700425AE700E7CEBD00F7D6
      AD00EFCEA500EFCE9C009C6B6300000000000000000000000000000000000000
      0000FFFFFF00C6C6FF004242FF00000084000000FF000000840000005A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF4A1800FF945A00FFA56B00FFA57300FFBD9400FFE7CE00FFEFE700FFEF
      E700FF8C6B000000000000000000000000008C8C8C00B5B5B500CECECE007B4A
      5200844A52004A4A4A0042182100421821004218210042182100421821004A4A
      4A00844A52008C4A5A00C6C6CE00525252000000000000000000C6947B00FFFF
      FF00948C8C00948C8C00948C8C00948C8C00EFE7CE00C6BDDE00EFD6C600F7D6
      B500F7D6AD00E7C69C0094736B00000000000000000000000000000000000000
      00000000FF004242FF0000008400FFFFFF000000FF000000FF00000084000000
      00000000000000000000000000000000000000000000FF4A1800FF4A1800FF4A
      1800FF9C6300FF9C6300FFAD7300FFBD9400FFDEC600FF8C6B00FF8C6B00FF8C
      6B00FF8463000000000000000000000000008C8C8C00B5B5B500CECECE004218
      21004A4A4A00A5A5A500DEDEDE00DEDEDE00DEDEDE00DEDEDE004A4A42004A4A
      42004A4A42004A4A42004A4A42004A4A42000000000000000000CE9C8400FFFF
      FF0031312900A5A5A5005263AD0029314200D6CEBD00FFF7DE00FFEFCE00F7E7
      C600DECEAD00B5A58C00846B6300000000000000000000000000000000000000
      000000008400000084000000840000008400FFFFFF000000FF00424242000000
      840000005A0000005A000000000000000000FF8C7300FF9C6300FFA57300FFA5
      7300FF8C6B00FFAD7300FFBD9400FFDEC600FF8C6B00FF846300000000000000
      00000000000000000000000000000000000000000000A5A5A500ADB5B5009C94
      940084737300E7C6B500FFFFFF00FFFFFF00F7F7F700F7F7F7004A4A42004A6B
      E7000839EF00FFE7DE00FFE7DE006B6363000000000000000000CE9C8400FFFF
      FF0042424A007B94FF00426BFF0018297B00E7DEC600FFF7E700E7CEBD00A56B
      6B00A56B6B00A56B6B00A56B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000840000008400000084000000
      FF000000840000005A000000000000000000FF8C7300FFA56B00FFB58400FFBD
      9400FFA57300FF8C6B00FFDEC600FF8C6B00FF84630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E7C6B500FFFFFF00FFFFFF00F7F7F700C6A594004A6BE7000839
      EF004A6BE7000839EF00FFE7DE006B6363000000000000000000D6A58400FFFF
      FF0029292900636B84008C8C9C000821A500BDC6F700FFFFF700D6B5AD00A56B
      6B00E79C4A00E78C3100A56B6B00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000084004242FF000000
      FF0000008400000084008484840000000000FF8C7300FFAD7300FFBD9400FFC6
      A500FFD6BD00FFDECE00FF8C6B00FF8463000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E7C6B500F7FFFF00FFFFFF00F7F7F700C6A594004A4A4200FFE7
      DE00FFE7DE000839EF004A6BE7007B7363000000000000000000D6A58400FFFF
      FF00ADB5B50094949400949494008C9CC6004263FF009CB5FF00D6B5BD00A56B
      6B00F7AD5A00A56B6B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400FFFFFF004242
      FF0000008400848484000000000000000000FFB59C00FF8C6B00FFBD9400FFDE
      C600FFE7D600FFE7D600FF8C6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E7C6B500F7F7F700F7F7F700F7F7F700C6A594004A4A4200FFE7
      DE00FFE7DE00FFE7DE000839EF004A6BE7000000000000000000D6A58400F7EF
      E700FFFFF700FFFFF700FFFFF700FFF7EF00CECEEF005A73EF00B5A5B500A56B
      6B00A56B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      84008484840000000000000000000000000000000000FF846300FF8C6B00FFD6
      BD00FFE7D600FFE7D600FF8C6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E7C6B500E7C6B500E7C6B500E7C6B500C6A594004A4A42006B63
      63006B6363006B6363007B7363000839EF000000000000000000D6946B00D69C
      7B00D69C7B00D69C7B00CE947300C68C7300C68C7300C68C7300AD736B00A56B
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFB59C00FFBD
      A500FFBDA500FFBDA500FFB59C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00000000000000000000000000848484008484
      84008C8C8C000000000000000000000000000000000000000000A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000848484000000000000000000000000009C9C9C009C9C
      9C00A5A5A5000000000000000000000000000000000000000000000000000000
      00009C9C9C009C9C9C00D6CECE009494940039393900525252009C949400C6C6
      C600D6D6D60084848400000000000000000000000000000000004A526300FFEF
      C600F7D6B500EFD6AD00EFCE9C00EFCE9400EFC68C00EFBD8400EFBD7B00EFBD
      8400EFBD8400EFC68400A5636B00000000000000000000000000000000000000
      000000000000E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6
      B500000000000000000000000000000000000000000000000000000000000000
      00008484840084848400DEDEDE00ADA5A500525252006B6B6B00ADADAD00CECE
      CE00DEDEDE009C9C9C00000000000000000000000000000000009C9C9C009C9C
      9C00F7F7F700FFFFFF00D6D6D6009C9C9C004242420021182100211821003131
      310063636300848484008C8C8C000000000000000000636B8400186BC600636B
      8400F7DEBD00EFD6AD00EFCEA500EFCE9C00EFC69400EFC68C00EFBD8400EFBD
      7B00EFBD7B00EFC68400A5636B00000000000000000000000000000000000000
      000042182100E7C6B500F7F7F700FFEFDE00F7DEC600F7DEC600FFFFFF00E7C6
      B500421821000000000000000000000000000000000000000000848484008484
      8400F7F7F700FFFFFF00DEDEDE00B5ADAD005A5A630031313100313131005252
      5200848484009C9C9C00A5A5A50000000000948C8C009C9C9C00EFEFEF00FFFF
      FF00EFE7E700C6C6C6009C9C9C008C8C8C009494940084848400636363003939
      390018212100211821007373730000000000000000000000000031A5FF001073
      D6006B6B8400F7DEBD00EFD6B500EFCEA500EFCE9C00EFC69400EFC68C00EFBD
      8400EFBD7B00EFC68400A5636B00000000000000000000000000000000005252
      520042182100E7C6B500F7F7F700FFD6A500FFCE9C00FFCE9C00FFFFFF00E7C6
      B500421821005252520000000000000000008484840084848400EFEFEF00FFFF
      FF00EFEFEF00D6D6D600B5B5B500A5A5A500ADA5AD009C9C9C007B7B7B005252
      520031313900313139008C8C8C00000000009C9C9C00E7E7E700E7E7E700BDBD
      BD00A5A5A500B5ADAD00C6BDBD00A5A5A50094949400948C8C00949494009C94
      94008C8C8C006B6B6B0084848400000000000000000000000000A5635A0031A5
      FF001073D6005A638400F7DEBD00EFD6AD00EFCEA500EFCE9C00EFC69400EFC6
      8C00EFBD8400EFC68400A5636B0000000000000000006B6B6B004A4A4A004A4A
      4A004A4A4A00E7C6B500F7F7F700FFEFDE00F7DEC600F7DEC600F7F7F700E7C6
      B5004A4A4A004A4A4A00421821000000000084848400EFEFEF00E7E7E700CECE
      CE00B5B5B500B5B5B500CECECE00B5B5B500ADA5A500A5A5A500ADA5AD00ADAD
      AD00A5A5A500848484009C9C9C000000000094949400ADADAD00A5A5A500ADAD
      AD00C6C6C600D6D6D600EFEFEF00EFEFEF00DEDEDE00C6C6C600ADADAD009C9C
      9C00948C8C00949494008C8C8C00000000000000000000000000A5736B00FFF7
      EF0031A5FF00427BAD008C635A00AD7B730094635A00AD7B6B00CEA58400EFC6
      9400EFC68C00EFC68400A5636B00000000007B7B7B004A4A4A005A5252005252
      52004A4A4A009C9C9C00ADADAD00ADB5B500B5B5B500B5B5B500A5A5A5009494
      9C004A4A4A0052525A004A5252004A4A4A0084848400BDBDBD00B5B5B500B5B5
      B500D6D6D600DEDEDE00EFEFEF00F7F7F700E7E7E700CECECE00BDBDBD00ADAD
      AD00A5A5A500ADA5AD00A5A5A50000000000948C8C00ADADAD00C6C6C600CECE
      CE00C6C6C600DEDEDE00CECECE00A5ADA500BDBDBD00CECECE00D6D6D600D6D6
      D600C6C6C600B5B5B50094949400000000000000000000000000A5736B00FFFF
      FF00F7EFE700AD8C8C00B58C8400DEBDA500EFD6B500D6B59C00B58C7300CEA5
      8400EFC69400EFC68C00A5636B000000000052525200847B8400949C9C008C9C
      9C008C9C9400949C9C00949494008C8C8C007B847B0084948C008C949400949C
      9C008C849C00B5B5B5008CFF7B004218210084848400B5B5B500D6D6D600D6D6
      D600D6D6D600E7E7E700DEDEDE00B5BDB500B5B5B500D6D6D600DEDEDE00DEDE
      DE00D6CECE00C6C6C600ADADAD0000000000000000009C9C9C00CECECE00CECE
      CE00DEDEDE00C6C6C600B5B5B500A5D6A500BDC6BD00C6A5A500ADA5A500A5A5
      A500B5B5B500C6BDBD00A5A5A500000000000000000000000000BD846B00FFFF
      FF00FFF7EF00AD847B00DEC6B500F7E7CE00F7E7C600FFFFF700D6B59C00AD7B
      6B00EFCE9C00EFCE9400A5636B0000000000525252009C9C9C00BDBDBD00ADAD
      AD00948C8C00846B7300846B6B0084636B00845A6B007B636B008C6B6B008C63
      7300A57BA5008C4A5A00B5B5B500421821000000000084848400DEDEDE00D6D6
      D600E7E7E700D6D6D600B5B5B500BDDEBD00CECECE00B5B5B500BDB5B500BDBD
      BD00C6C6C600CECECE00BDBDBD000000000000000000000000009C9C9C00BDBD
      BD00ADADAD00ADADAD00E7E7E700F7EFEF00EFEFEF00EFE7DE00D6D6D600CECE
      CE00B5B5B5009494940000000000000000000000000000000000BD846B00FFFF
      FF00FFFFFF0094636300F7EFDE00F7EFDE00F7E7CE00FFFFEF00EFD6B5009463
      5A00EFCEA500F7D6A500A5636B000000000063636300ADADAD00D6DEDE008C6B
      73009C6B7300A57B7B00BD8C8C00C68C9400BD8C9400BD8C9400C68C8C00A573
      7B00A56B7B008C4A5A00BDD6BD0052525200000000000000000084848400CECE
      CE00BDBDBD00C6BDBD00E7E7E700F7F7F700EFEFEF00F7EFE700E7DEDE00B5B5
      B500C6C6C6008484840000000000000000000000000000000000000000009C9C
      9C00D6D6D600CECECE009C9C9C00BDBDBD00D6D6D600D6D6D600D6D6D600C6C6
      C600ADADAD000000000000000000000000000000000000000000D6946B00FFFF
      FF00FFFFFF00B58C8400DEC6C600F7EFE700F7EFDE00FFFFD600DEBDA500AD7B
      7300F7D6AD00EFCEA500A5636B00000000008C8C8C00B5B5B500CECECE007B4A
      5200844A52004A4A4A0042182100421821004218210042182100421821004A4A
      4A00844A52008C4A5A00C6C6CE00525252000000000000000000000000008484
      8400DEE7E700D6D6D600B5B5B500CECECE00DEDEDE00DEDEDE00DEDEDE00D6D6
      D600848484000000000000000000000000000000000000000000000000000000
      0000FFE7E700FFDECE00E7C6BD00E7C6BD00E7CEC600DED6CE00CECECE009494
      9400000000000000000000000000000000000000000000000000D6946B00FFFF
      FF00FFFFFF00D6BDBD00BD949400DEC6C600F7EFDE00DEC6B500B58C8400B58C
      7B00DECEB500B5AD9400A5636B00000000008C8C8C00B5B5B500CECECE004218
      21004A4A4A00A5A5A500DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00A5A5
      A500393939004A212100CECECE00636363000000000000000000000000000000
      0000F7EFE700FFE7DE00EFD6CE00EFD6CE00EFD6CE00E7DEDE004A4A42004A4A
      42004A4A42004A4A42004A4A42004A4A42000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500FFAD9C00000000000000
      0000000000000000000000000000000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00FFFFFF00D6BDBD00B58C840094636300AD847B00CEA59C00A56B
      5A00A56B5A00A56B5A00A5636B000000000000000000A5A5A500ADB5B5009C94
      940084737300E7C6B500FFFFFF00FFFFFF00F7F7F700F7F7F700F7F7F700B584
      84007B636B009C8C8C00ADB5B500000000000000000000000000000000000000
      0000DEB5B500FFE7DE00FFDECE00FFD6C600FFCEB500FFC6AD004A4A42007B94
      EF002139AD00FFE7DE00FFE7DE006B6363000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9400000000000000
      0000000000000000000000000000000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700D6BDBD00A56B
      5A00E79C5200E78C3100B56B4A00000000000000000000000000000000000000
      000000000000E7C6B500FFFFFF00FFFFFF00F7F7F700C6A59400C6A59400C6A5
      9400000000000000000000000000000000000000000000000000000000000000
      0000DEB5B500FFE7DE00FFD6C600FFD6C600FFCEB500FFBDAD007B94EF002139
      AD007B94EF002139AD00FFE7DE006B6363000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9C00000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C600A56B
      5A00FFB55A00BD7B5A0000000000000000000000000000000000000000000000
      000000000000E7C6B500F7FFFF00FFFFFF00F7F7F700C6A59400FFFFFF00C6A5
      9400000000000000000000000000000000000000000000000000000000000000
      0000DEB5B500FFE7DE00FFD6C600FFD6C600FFCEB500FFBDAD004A4A4200FFE7
      DE00FFE7DE002139AD007B94EF007B736300000000000000000000000000CE9C
      9C00FFE7D600FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9C00000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00D6BDBD00A56B
      5A00BD846B000000000000000000000000000000000000000000000000000000
      000000000000E7C6B500F7F7F700F7F7F700F7F7F700C6A59400C6A594000000
      000000000000000000000000000000000000000000000000000000000000DEB5
      B500FFE7DE00FFE7DE00FFDECE00FFD6C600FFCEB500FFBDAD004A4A4200FFE7
      DE00FFE7DE00FFE7DE002139AD007B94EF00000000000000000000000000CE9C
      9C00CE9C9C00CE9C9C00CE9C9C00F7AD9C00F7AD9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00A56B
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000E7C6B500E7C6B500E7C6B500E7C6B500C6A59400000000000000
      000000000000000000000000000000000000000000000000000000000000DEB5
      B500DEB5B500DEB5B500DEB5B500F7BDB500F7BDB500000000004A4A42006B63
      63006B6363006B6363007B7363002139AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000039AD39001094100000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B58484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000182939006B9CCE0094C6EF0094C6F70073ADE700639CD6006394
      C600426384001031520000000000000000000000000000000000000000000000
      0000000000000000000039AD3900218C180000AD000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C60000730800F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B584840000000000FFFFFF0084B58400107310001873
      18001873180018731800187B1800187B1800107B1000107B1000087B0800087B
      0800007B0000007300007BB57B00FFFFFF000000000000000000000000000000
      000010315200425A7B0084B5E700BDDEFF00CEE7FF00A5CEFF007BB5F70063A5
      DE0042638C001031520000000000000000000000000000000000000000000000
      00000000000039AD390018841800219C1800009C000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D6000073080031C64A00109C2100108C2100F7D6A500EFCE9C00EFCE9C00EFCE
      9400EFCE9400EFCE9C00B584840000000000FFFFFF0010841000218C21002994
      2900319431003194310029942900299C2900219C210018A5180018A5180010A5
      100008A5080000940000006B0000FFFFFF000000000000000000000000000000
      0000212939007BADD600BDDEFF00E7F7FF00EFF7FF00BDDEFF0094C6FF0073B5
      F7005284BD001031520000000000000000000000000000000000000000000000
      000039AD3900088C100008840000088C0000009C000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6ADA5000073
      08005AE78C0042D66B0031C64A0018AD290008A5180008841000EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B584840000000000FFFFFF00188C180029942900399C
      3900399C3900399C390039A53900FFFFFF00A5D6A5004AA54A004AA54A004AA5
      4A0008AD0800009C0000007B0000FFFFFF000000000000000000000000000000
      00004A6B84009CC6F700D6EFFF00FFFFFF00F7FFFF00D6EFFF00ADD6FF0084C6
      FF006BADEF0010315200000000000000000000000000000000000000000039AD
      3900107B100063AD630021942100008C0000088C080000B5000000B5080018C6
      180042DE420052E752006BDE6B0000AD00000000000000000000C6ADA500FFF7
      EF000073080052D67B00108C210008841000088C100008A51800087B0800EFCE
      9C00EFCE9C00EFCE9400B584840000000000FFFFFF0021942100399C390042A5
      42004AA54A0042A54200FFFFFF00FFFFFF00FFFFFF004AA54A004AA54A004AA5
      4A0010AD100008A50800087B0800FFFFFF000000000000000000000000001829
      39006394C6007BA5D600BDDEFF00DEEFFF00EFF7FF00EFF7FF00BDDEFF008CC6
      FF006BADEF00103152000000000000000000000000000000000039AD3900187B
      180063AD6300218C180000840000008C0800008C000000A5000000B5000000BD
      000008C6000018D6180063E76300009C08000000000000000000CEB5AD00FFFF
      F700FFEFE70000730800F7E7D600F7E7CE00F7DEC600088C1000088C1000F7D6
      AD00EFCE9C00EFCE9C00B584840000000000FFFFFF0029942900429C42004AA5
      4A0052A55200FFFFFF00FFFFFF00FFFFFF004AA54A004AA54A004AA54A004AA5
      4A0010AD100010A5100008840800FFFFFF000000000000000000182939006B9C
      C6005284B5004273AD009CCEFF00ADD6FF00C6DEFF00CEE7FF00ADD6FF007BB5
      EF005A94CE001031520000000000000000000000000039AD3900187B180063AD
      6300187B2100007B000000840000008C0800009C000000AD000000B5000000BD
      000000C6000000CE000063E76300109408000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700F7E7D600F7E7CE00F7E7C600F7DEC600088C1000F7D6
      AD00F7D6A500F7D6A500B584840000000000FFFFFF00319C31004AA54A0052A5
      5200FFFFFF00FFFFFF00FFFFFF004AA54A004AA54A004AA54A004AA54A004AA5
      4A0018AD180018A5180010841000FFFFFF0000000000182939005A84A5005A84
      AD001839520031527B008CBDEF0073A5D60073A5D60084ADDE005A8CC6006394
      CE003163940010315200000000000000000039AD3900187B210063AD6300298C
      3100007B00000084000000840000008C08000094000000AD000000B5000000BD
      000008C6000000CE000063E76B0000A500000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE00F7E7D600F7E7CE00F7E7C600087B0800F7DE
      BD00F7D6B500F7D6AD00B584840000000000FFFFFF00429C420052A55200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00219C210018841800FFFFFF0000000000425A7B006394BD00314A
      5A000000000029425A0084B5E7004A84B500316B9C004A73A50029527B004A73
      A5001031520000000000000000000000000039AD39001873290063AD6300398C
      310000730000007B000000840000008C08000094080000AD000000B5000000BD
      000008C6000000CE00006BE76B00089C00000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFF7F700FFF7EF00FFEFE700F7E7D600F7E7CE00F7DEC600F7DE
      BD00F7DEB500F7DEB500B584840000000000FFFFFF0042A542005AAD5A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00219C2100217B2100FFFFFF00000000002131420042525A000000
      00000000000029394A0084B5E700427BAD0008315A0010213100081821001021
      3100000000000000000000000000000000000000000039AD3900187B210063AD
      630029841800087B080000840000009400000094000000A5000000B5000000BD
      000008C6000000CE000063E76300009C00000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C600F7DEC600F7D6B500B584840000000000FFFFFF0052A5520063AD630063AD
      6300FFFFFF00FFFFFF00FFFFFF00429C4200429C4200429C4200429C42002994
      29002994290029942900217B2100FFFFFF000000000000000000000000000000
      00000000000029394A0084B5E700426B8C000000000000000000000000000000
      000000000000000000000000000000000000000000000000000039AD3900107B
      180063AD6300108C180000840000008C00000894000000AD080000B5000000BD
      000008C6000018D618006BEF6300009408000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B584840000000000FFFFFF0052A552006BB56B006BB5
      6B005AAD5A00FFFFFF00FFFFFF00FFFFFF00429C4200429C4200429C42002994
      29002994290029942900217B2100FFFFFF000000000000000000000000000000
      00000000000029394A0084B5E700426B8C000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000039AD
      3900107B100063AD630018942100009400000094000000AD000000B5080018C6
      180042DE42005AE75A007BDE7B0000AD00000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B584840000000000FFFFFF005AAD5A007BBD7B0073BD
      730063AD63005AAD5A00FFFFFF00FFFFFF00FFFFFF00429C4200319C3100319C
      31003194310031943100217B2100FFFFFF000000000000000000000000000000
      00000000000029394A0084B5E700426B8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000039AD3900088C100008840000008C0000009C000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B0000000000FFFFFF006BB56B008CC68C007BBD
      7B006BB56B0063B5630063AD6300FFFFFF00B5DEB5004AA54A004AA54A0042A5
      4200399C390031943100217B2100FFFFFF000000000000000000000000000000
      00000000000029394A0084B5E700426B8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000039AD3900188C1800189418001094080000000000000000000000
      0000000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE9473000000000000000000FFFFFF0073BD73009CCE9C008CC6
      8C007BBD7B0073BD73006BB56B0063B5630063AD63005AAD5A0052AD52004AA5
      4A0042A542003194310018731800FFFFFF000000000000000000000000000000
      0000000000003139420094BDDE00426B8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000039AD390018941800009C000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C8400000000000000000000000000FFFFFF00B5DEB50073BD730063B5
      63005AAD5A0052A5520052A552004AA54A004AA54A0042A54200429C4200399C
      390031943100218C21008CBD8C00FFFFFF000000000000000000000000000000
      00000000000000000000426B8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000039AD39002194210000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A573
      5200735A4A009C6B4A009C6B4A009C6B4A009C6B4A009C6B4A00735A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006BAD840021842900218429006BAD8400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000735A4A00735A
      4A009C6B4A00BD845200CE8C5200D6945200D6945200C6845200A57B4A008463
      4200846B63000000000000000000000000000000000000000000000000000000
      000000000000004A000000630000004A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000735A4A00A5735200BD84
      5200CE8C5200CE8C5200C68C4A00CE8C5200CE8C5200CE845200CE8C5200C684
      5200A5734A0063527B0000000000000000000000000000000000000000000000
      00000000000000630000089C210000630000004A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000735A4A00A5735200C6845200C684
      4A00CE8C4A00CE8C5200D6945200CE945200C68C5200CE945200CE8C4A00C68C
      4A00A57B52005A4ABD00736BA500000000000000000000000000000000000000
      00000000000000630000109C2100089C210000630000004A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424242000000000000000000000000000000000042424200000000000000
      000000000000424242000000000000000000A5735200BD7B4200C6844A00DEA5
      6300E7BD8400F7D6A500F7E7B500FFEFBD00FFEFB500F7E7B500F7CE9C00DEB5
      7B00B5845A00634AAD005A4A9400000000000000000000000000000000000000
      0000000000000063000010A5290010A52900089C210000630000004A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004242420000000000000000000000000042424200000000000000
      000000000000424242000000000000000000A5735200C68C5200DEB57B00F7DE
      AD00F7E7AD00F7E7B500F7E7AD00F7E7AD00FFE7AD00FFE7AD00F7E7B500E7D6
      A500A5948C007363C6005A4A9400000000000000000000000000000000000000
      0000000000000063000010B5390010A52900089C2100089C210000630000004A
      000000000000000000000000000000000000000000006BAD8400218429002184
      290021842900218429002184290094DE8C0039B5520021842900218429002184
      290021842900218429006BAD8400000000000000000000000000000000000000
      0000000000000000000042424200000000000000000000000000424242004242
      420042424200424242000000000000000000A5735200E7BD8400F7DEA500F7DE
      AD00F7DEAD00F7DEAD00F7DEAD00FFDEAD00F7DEAD00E7D6A500B5A59400ADA5
      BD00AD9CDE009C8CEF006B639C00000000000000000000000000000000000000
      0000000000000063000018B54A0010AD390010AD390010AD390010A529000063
      0000005200000000000000000000000000000000000063A5630039B5520039B5
      520039B5520039B5520039B5520039B5520039B5520039B5520039B5520039B5
      520039B5520039B5520021842900000000000000000000000000000000000000
      0000000000000000000000000000424242000000000000000000000000000000
      000000000000000000000000000000000000A5735200DEC69C00E7CEA500DECE
      9C00DECE9C00DECE9C00DECEA500DEC6A500B5AD9C00948CBD00AD94EF00AD94
      EF00A594F700AD94F700847BAD00000000000000000000000000000000000000
      0000000000000063000052BD52005ABD52004ABD52004ABD52004ABD52000063
      0000005200000000000000000000000000000000000063A5630094DE8C0094DE
      8C0094DE8C0094DE8C0094DE8C0094DE8C0039B5520094DE8C0094DE8C0094DE
      8C0094DE8C0094DE8C0021842900000000000000000000000000000000000000
      0000000000000000000000000000000000004242420000000000000000000000
      0000000000000000000000000000000000008C9CA50084C6B50084CEC60084CE
      C60084CEC6008CCEC60084CEC60084B5BD008C8CC6009C84E7009C8CEF009C84
      E7009C8CEF009C8CE7007B73A500000000000000000000000000000000000000
      000000000000006300005AC65A006BC66B006BC663004ABD520000630000004A
      000000000000000000000000000000000000000000006BAD840063A5630063A5
      630063A5630063A5630063A5630094DE8C0039B5520021842900218429002184
      290021842900218429006BAD8400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042424200000000000000
      0000000000000000000000000000000000008C9CA50073CECE0073F7FF0073F7
      FF007BF7FF007BF7FF0073F7F70073F7F7007BBDD600847BCE009473E7009473
      E7009473E7008C73D6008C849C00000000000000000000000000000000000000
      000000000000006300006BC66B007BD67B007BD67B0000630000004A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      0000000000000000000000000000000000000000000000000000424242000000
      0000000000000000000042424200000000000000000000000000424242000000
      000000000000000000000000000000000000000000008C9CA5007BD6DE007BEF
      FF0073EFFF0073EFFF0073EFFF006BEFFF006BE7FF0073BDCE007B73C6008C63
      D6008C63D60084739C0000000000000000000000000000000000000000000000
      0000000000000063000063C663008CD68C0000630000004A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      0000000000000000000000000000000000000000000000000000424242000000
      0000000000000000000042424200000000000000000000000000000000004242
      42000000000000000000000000000000000000000000000000009CA5B50073B5
      C6006BCEDE006BD6EF006BDEFF006BDEFF006BDEFF006BD6EF0073A5BD007B73
      A5009484A5000000000000000000000000000000000000000000000000000000
      0000000000000063000039AD390000630000004A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000424242000000000000000000000000000000000000000000000000000000
      0000ADBDBD008CB5BD007BADBD0073ADB50073A5BD0084ADBD009CB5BD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004A000000630000004A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063A5630094DE8C0039B5520021842900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006BAD840063A5630063A563006BAD8400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000299C
      DE00299CDE00A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B730000000000000000000000000000000000299C
      DE00299CDE0094949400948C94008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C008C8C8C008C8C8C00000000000000000000000000000000000000
      000000000000000000003173CE0052B5EF0063B5D60039527B0039424A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000299CDE008CD6
      EF0084D6F700CEC6BD00FFEFDE00F7EFE700F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7EFDE00A57B7300000000000000000000000000299CDE008CD6
      EF0084D6F700949494008CCE8C008CCE8C008CD69C0094DEA50094DEB5008CDE
      BD008CDEBD0094E7CE008C848400000000000000000000000000000000000000
      000000000000000000003173CE0052B5EF0063B5D60039527B0039424A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000299CDE00A5E7FF0094EF
      FF008CF7FF00CEC6BD00F7E7D600F7E7D600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7DEC600F7E7D600A57B73000000000000000000299CDE00A5E7FF0094EF
      FF008CF7FF009C9C9C0008520800005208000052080000520800084208000852
      0800A5FFFF009CFFFF008C848400000000000000000000000000000000000000
      00000000000039527B0039424A0039424A0039424A0039424A0039424A003942
      4A00000000000000000000000000000000000000000000000000292929005A52
      4A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000299CDE00A5E7FF0094EF
      FF0084EFFF00CEC6BD00F7E7DE00FFE7CE00F7DEBD00F7DEBD00F7DEBD00F7DE
      BD00F7DEC600F7E7D600A57B73000000000000000000299CDE00A5E7FF0094EF
      FF0084EFFF00A5A5A500004A0000003900000039000000310000004A0000186B
      100084E7B50073E7AD008C848C00000000000000000000000000000000000000
      000000000000000000008C6B6300FFF7E700F7EFDE00EFE7D60039424A000000
      00000000000000000000000000000000000000000000000000005A524A003139
      3900526363000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000299CDE00ADEFFF00A5EF
      FF0094EFFF00CEC6BD00F7E7E700F7E7D600F7DEC600F7DEC600F7DEBD00F7DE
      BD00F7DEC600F7E7D600A57B73000000000000000000299CDE00ADEFFF00A5EF
      FF0094EFFF00A5A5A500186B1000004A0000003900000031000029A542004AC6
      6B0094B54A00B5AD29008C8C9400000000000000000000000000000000000000
      00000000000094948C00EFBDA500F7F7EF00F7EFDE00EFE7D6008C6B63009494
      8C00000000000000000000000000000000000000000000000000000000005273
      7B00428CDE0018526B008C5A5200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000299CDE00B5EFFF00ADEF
      FF00A5EFFF00CEC6BD00F7EFE700F7EFDE00FFE7CE00FFE7CE00FFE7CE00F7DE
      C600F7E7D600EFE7DE00A57B73000000000000000000299CDE00B5EFFF00ADEF
      FF00A5EFFF00ADADB5005ABD63000873100000520000085A0000C66B0000CE63
      0000DE6B0000DE730000848C9C00000000000000000000000000000000000000
      0000000000008C6B6300FFDEC600F7F7EF00F7EFDE00EFE7D600FFDEC6004229
      1800000000000000000000000000000000000000000000000000000000005273
      7B00297B9C008C7B7B00D67318008C5A52000000000000000000000000000000
      00000000000000000000000000000000000000000000299CDE00BDEFFF00BDF7
      FF00ADF7FF00CEC6BD00FFF7EF00FFE7CE00FFDEBD00F7DEBD00F7DEBD00FFDE
      B500F7DEC600F7EFE700A57B73000000000000000000299CDE00BDEFFF00BDF7
      FF00ADF7FF00B5B5B50031AD3900218C1800529C390094944200DE7B2100C65A
      0000BD4A0000C65200008C949C00000000000000000000000000000000000000
      0000EFBDA500EFBDA500FFF7E700F7F7EF00EFE7D600EFE7D600E7D6C6008C6B
      63007B7373000000000000000000000000000000000000000000000000000000
      00007B737B00FFC68400FFB56300D67318008C5A520000000000000000000000
      00000000000000000000000000000000000000000000299CDE00C6EFFF00CEF7
      FF00BDF7FF00CEC6BD00FFF7F700FFF7EF00F7EFE700F7EFE700F7EFDE00F7EF
      DE00F7EFE700EFE7DE00A57B73000000000000000000299CDE00C6EFFF00CEF7
      FF00BDF7FF00BDBDBD008CBD4A00A5BD5A00E7D68400FFEF9C00F7CE7B00DE9C
      4200BD733100AD4A00008C949C00000000000000000000000000000000000000
      0000EFBDA500FFF7E700F7F7EF00F7F7EF0039424A00EFE7D600E7D6C600FFDE
      C600422918000000000000000000000000000000000000000000000000000000
      0000847B7B00FFCE9400FFC68400FFB56300D67318008C5A5200000000000000
      00000000000000000000000000000000000000000000299CDE00CEEFFF00DEF7
      FF00CEF7FF00CEC6BD00FFF7F700FFFFFF00FFFFFF00FFF7F700F7F7F700EFE7
      DE00D6BDB500C6ADA500A57B73000000000000000000299CDE00CEEFFF00DEF7
      FF00CEF7FF00C6C6C600F7CE8C00FFB54200FFAD2900FFBD5A00FFBD5A00FFDE
      A500F7EFC600FFFFCE0084848400000000000000000000000000000000000000
      000000000000EFBDA500FFF7E700EFBDA500FFDEC600EFBDA500E7D6C6008C6B
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000AD7B7300FFD6AD00FFC68400FFB56300D67318008C5A52000000
      00000000000000000000000000000000000000000000299CDE00CEEFFF00E7FF
      FF00DEF7FF00CEC6BD00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00DECE
      C600E7AD7300C6AD8C00000000000000000000000000299CDE00CEEFFF00E7FF
      FF00DEF7FF00C6C6C600EFCEA500F7CE9400F7CE8C00F7D6AD00F7D6AD00F7D6
      9C00EFCE9C00F7D69C0084848C00000000000000000000000000000000000000
      000000000000EFBDA500FFDEC600F7F7EF008C6B6300EFE7D600FFDEC6004A42
      3900000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AD7B7300FFD6AD00FFC68400FFB56300D67318008C5A
      52000000000000000000000000000000000000000000299CDE00D6F7FF00F7FF
      FF00E7FFFF00CEC6BD00FFEFE700FFF7EF00FFF7EF00FFEFEF00FFF7EF00E7C6
      BD00C6AD8C00299CDE00000000000000000000000000299CDE00D6F7FF00F7FF
      FF00E7FFFF00C6C6C600EFCEA500EFCEA500EFCEA500E7C69C00E7C69C00E7C6
      9C00E7C69C00EFC694008C8C9400000000000000000000000000000000000000
      00000000000000000000EFBDA500FFF7E7008C6B6300EFE7D6008C6B63000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD7B7300FFD6AD00FFC68400FFB56300D673
      18008C5A520000000000000000000000000000000000299CDE00DEF7FF00FFFF
      FF00F7FFFF00CEC6BD00CEC6BD00CEC6BD00CEC6BD00CEC6BD00CEC6BD00CEC6
      BD0084C6DE00299CDE00000000000000000000000000299CDE00DEF7FF00FFFF
      FF00F7FFFF00C6C6C600B5B5B500ADB5B500ADADB500ADADAD00A5A5AD00A5A5
      AD00A5A5A5009C9C9C009C9C9C00000000000000000000000000000000000000
      00000000000000000000EFBDA500FFDEC6008C6B6300FFDEC6005A524A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD7B7300FFCE9400BD848400299C
      EF004ABDFF000863A500000000000000000000000000299CDE00DEF7FF00F7F7
      F700ADC6CE00A5C6CE00A5C6CE00A5C6CE00A5C6CE00A5C6CE00B5D6D600DEFF
      FF0084D6F700299CDE00000000000000000000000000299CDE00DEF7FF00F7F7
      F700ADC6CE00A5C6CE00A5C6CE00A5C6CE00A5C6CE00A5C6CE00B5D6D600DEFF
      FF0084D6F700299CDE0000000000000000000000000000000000000000000000
      0000000000000000000000000000EFBDA5008C6B63008C6B6300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD7B7300299CEF004ABD
      FF00299CEF000018AD0000009C000000000000000000299CDE00DEF7FF00DECE
      C600BDA59C00A57B7300A57B7300A57B7300A57B7300A57B7300BD9C9400E7EF
      E70094DEF700299CDE00000000000000000000000000299CDE00DEF7FF00DECE
      C600BDA59C00A57B7300A57B7300A57B7300A57B7300A57B7300BD9C9400E7EF
      E70094DEF700299CDE0000000000000000000000000000000000000000000000
      0000000000000000000000000000EFBDA50039424A008C6B6300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004ABDFF00299C
      EF000831CE001029D6000010AD000018C6000000000000000000299CDE00B5D6
      E700949C9C00E7DED600F7E7D600F7E7D600F7E7D600CEC6BD00849CA5008CCE
      E700299CDE000000000000000000000000000000000000000000299CDE00B5D6
      E700949C9C00E7DED600F7E7D600F7E7D600F7E7D600CEC6BD00849CA5008CCE
      E700299CDE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C6B630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000018
      C6006B8CFF00106BFF000018C60000000000000000000000000000000000299C
      DE00299CDE009C948C009C948C009C948C009C948C009C948C00299CDE00299C
      DE0000000000000000000000000000000000000000000000000000000000299C
      DE00299CDE009C948C009C948C009C948C009C948C009C948C00299CDE00299C
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C6B630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000018C6000018C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000639400004A6B006B6B6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A844A004A844A004A84
      4A004A844A004A844A004A844A004A844A004A844A000000000000000000BD63
      31009442310000000000944231000000000000000000FF840000DE730000DE73
      0000CE630000CE630000CE630000CE630000CE6300000000000000000000BD63
      3100944231000000000094423100000000000000000000000000000000000000
      0000000000000000000000639400006394008CD6FF0000639400004A6B006B6B
      6B00000000000000000000000000000000000000000073524A0073524A007352
      4A0073524A0073524A00B5848400000000000000000000000000A54210000000
      0000A5421000000000000000000000000000000000004A844A006BCE84006BCE
      84005ABD6B005ABD6B0052B56B0052AD52004A844A000000000000000000BD63
      31009442310000000000944231000000000000000000FF840000DE730000DE73
      0000CE630000CE630000CE630000CE630000CE6300000000000000000000BD63
      3100944231000000000094423100000000000000000000000000000000000000
      00000063940000639400007BB500007BB5008CD6FF000063940000639400004A
      6B006B6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A54210000000
      0000A5421000000000000000000000000000000000004A844A004A844A004A84
      4A004A844A004A844A004A844A004A844A004A844A000000000000000000BD63
      3100944231000000000094423100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD63
      3100944231000000000094423100000000000000000000000000006394000063
      9400007BB500007BB500007BB500007BB5008CD6FF0000639400006394000063
      9400004A6B006B6B6B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A54210000000
      0000A54210000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD63
      3100944231000000000094423100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD63
      3100944231000000000094423100000000000000000000639400007BB500007B
      B500007BB500007BB500007BB500007BB5008CD6FF0000639400006394000063
      940000639400004A6B006B6B6B00000000000000000073524A0073524A007352
      4A0073524A0073524A00B5848400000000000000000000000000A54210000000
      0000A5421000000000000000000000000000000000004A844A004A844A004A84
      4A004A844A004A844A004A844A00000000000000000000000000944231009442
      31009442310000000000944231000000000000000000FF840000DE730000DE73
      0000CE630000CE630000CE630000000000000000000000000000944231009442
      3100944231000000000094423100000000000000000000639400007BB500007B
      B500007BB500007BB500007BB500007BB5008CD6FF0000639400006394000063
      94000063940000639400004A6B006B6B6B000000000000000000000000000000
      00000000000000000000000000000000000084848400A5421000A54210000000
      0000A5421000000000000000000000000000000000004A844A006BCE84005ABD
      6B0052B56B0052AD52004A844A00000000000000000094423100BD734200BD63
      31009442310000000000944231000000000000000000FF840000DE730000DE73
      0000CE630000CE630000CE630000000000000000000094423100BD734200BD63
      3100944231000000000094423100000000000000000000639400007BB500007B
      B500007BB500007BB500007BB500007BB5008CD6FF0000639400006394000063
      94000063940000639400004A6B00000000000000000000000000000000000000
      000000000000000000000000000000000000A5421000A5421000A54210000000
      0000A5421000000000000000000000000000000000004A844A004A844A004A84
      4A004A844A004A844A004A844A000000000094423100BD734200D67B3100D67B
      3100944231000000000094423100000000000000000000000000000000000000
      00000000000000000000000000000000000094423100BD734200D67B3100D67B
      3100944231000000000094423100000000000000000000639400007BB500007B
      B500007BB500007BB500007BB5008CD6FF008CD6FF008CD6FF00006394000063
      94000063940000639400004A6B00000000000000000073524A0073524A007352
      4A0073524A0073524A00B584840000000000A5421000A5421000A54210000000
      0000A54210000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094423100DE8C4200E79C4200E79C
      4200944231000000000094423100000000000000000000000000000000000000
      00000000000000000000000000000000000094423100DE8C4200E79C4200E79C
      4200944231000000000094423100000000000000000000639400007BB500007B
      B500007BB5008CD6FF008CD6FF00CECECE00C6C6C600007BB5008CD6FF000063
      94000063940000639400004A6B00000000000000000000000000000000000000
      00000000000000000000000000000000000084848400A5421000A5421000A542
      1000A5421000A54210000000000000000000000000004A844A004A844A004A84
      4A004A844A004A844A004A844A000000000094423100BD734200DE8C4200DE8C
      420094423100BD633100944231000000000000000000FF840000DE730000DE73
      0000CE630000CE630000CE6300000000000094423100BD734200DE8C4200DE8C
      420094423100BD63310094423100000000000000000000639400007BB5008CD6
      FF008CD6FF00BDBDBD007B7B7B00B5B5B5006B6B6B00007BB500007BB5008CD6
      FF000063940000639400004A6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A844A006BCE84005ABD
      6B0052B56B0052AD52004A844A00000000000000000094423100BD734200DE7B
      31009442310094423100944231009442310000000000FF840000DE730000DE73
      0000CE630000CE630000CE630000000000000000000094423100BD734200DE7B
      31009442310094423100944231009442310000000000006394008CD6FF00007B
      B500007BB5008C8C8C00D6D6D600D6D6D600E7E7E700007BB500FF6B6B00DEC6
      CE008CD6FF0000639400004A6B00000000000000000073524A0073524A007352
      4A0073524A0073524A0073524A0073524A0073524A0073524A0073524A007352
      4A0073524A00B58484000000000000000000000000004A844A004A844A004A84
      4A004A844A004A844A004A844A00000000000000000000000000944231009442
      3100944231009442310094423100944231000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000944231009442
      3100944231009442310094423100944231000000000000000000004A6B00007B
      B500007BB50094ADB500B5B5B500007BB500007BB500007BB500FF000000FF4A
      4A00007BB5008CD6FF00004A6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000004A
      6B00007BB500007BB500007BB500007BB500007BB500007BB500007BB500007B
      B500004A6B00004A6B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A844A004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A0000000000000000000000000000000000000000000000
      0000FF840000DE730000DE730000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000000000000000
      0000004A6B00007BB500007BB500007BB500007BB500007BB500004A6B00004A
      6B00000000000000000000000000000000000000000000000000000000000000
      00000000000073524A0073524A0073524A0073524A0073524A0073524A007352
      4A0073524A00B584840000000000000000000000000000000000000000000000
      00004A844A006BCE84006BCE84006BCE84005ABD6B0052B56B0052B56B0052AD
      520052AD52004A844A0000000000000000000000000000000000000000000000
      0000FF840000DE730000DE730000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000000000000000
      000000000000004A6B00007BB500007BB500004A6B00004A6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A844A004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004A6B00004A6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400FFFF
      FF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFF7EF00FFEFDE00F7E7CE00F7E7
      CE00F7E7CE00F7E7CE00B5848400000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B0000000000B58C8C00A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300000000000000
      0000000000000000000000000000000000000000000000000000B5848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFF7EF00FFEFDE00F7E7
      CE00F7E7CE00F7E7CE00B5848400000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B5848400000000000000000000000000B5948400FFEF
      C60039525200EFD6AD0039525200EFCE9400EFC68C00EFBD8400EFC67B00EFBD
      840039525200EFC68400A5636B0000000000B58C8C00FFEFE700FFF7E700FFEF
      D600FFE7D600FFE7C600F7DEBD00F7D6B500E7C6AD00A57B7300000000000000
      0000000000000031F70000000000000000000000000000000000B5848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFF7EF00FFEF
      DE00F7E7CE00F7E7CE00B5848400000000000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6A500EFCE9C00EFCE9C00EFCE
      9400EFCE9400EFCE9C00B5848400000000000000000000000000B59484003952
      5200395252003952520039525200395252003952520039525200395252003952
      52003952520039525200A5636B0000000000B58C8C00FFFFF700FFF7E700FFEF
      DE00FFEFD600FFE7CE00F7DEC600F7DEBD00E7CEAD00A57B7300000000000000
      00000031F7000031F70000000000000000000000000000000000B5848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFF7
      EF00FFEFDE00F7E7CE00B5848400000000000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B5848400000000000000000000000000B5948C00FFEF
      DE0039525200F7DEBD0039525200EFCEA500EFCE9C00EFC69400EFC68C00EFBD
      840039525200EFC68400A5636B0000000000B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00000000000000
      000000000000000000000031F700000000000000000000000000B5848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7
      EF00FFF7EF00FFEFDE00B5848400000000000000000000000000C6ADA500FFF7
      E700F7E7D600CE630000F7E7C600F7DEC600CE630000F7D6B500F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B5848400000000000000000000000000BD948C00FFF7
      E70039525200F7DEC600F7DEBD00EFD6AD00EFCEA500EFCE9C00EFC69400EFC6
      8C00EFBD8400EFC68400A5636B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000031F700005A000000000000B5848400FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00B5848400000000000000000000000000CEB5AD00FFFF
      F700EFCE9C00CE630000F7E7D600EFCE9C00CE630000EFCE9C00F7D6B500F7D6
      AD00EFCE9C00EFCE9C00B5848400000000000000000000000000C69C9400FFF7
      EF0039525200F7E7CE00F7DEC600F7DEBD00EFD6AD00EFCEA500EFCE9C00EFC6
      9400EFC68C00EFC68400A5636B0000000000B58C8C00A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300000000000000
      00000000000000000000000000000000000000730800005A0000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000D6B5AD00FFFF
      FF00CE630000CE630000CE630000CE630000CE630000CE630000CE630000F7D6
      AD00F7D6A500F7D6A500B5848400000000000000000000000000C6A59C00FFFF
      FF0039525200F7EFDE00F7E7CE00F7DEC600F7DEBD00EFD6AD00EFCEA500EFCE
      9C00EFC69400EFC68C00A5636B0000000000B58C8C00FFEFE700FFF7E700FFEF
      D600FFE7D600FFE7C600F7DEBD00F7D6B500E7C6AD00A57B7300000000000000
      0000000000000031F70000000000000000000073080000730800005A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6BDB500FFFF
      FF00FFF7F700EFCE9C00CE630000F7E7D600EFCE9C00CE630000EFCE9C00F7DE
      BD00F7D6B500F7D6AD00B5848400000000000000000000000000CEAD9C00FFFF
      FF0039525200FFEFE700F7EFDE00F7E7CE00F7DEC600F7DEBD00EFD6AD00EFCE
      A500EFCE9C00EFCE9400A5636B0000000000B58C8C00FFFFF700FFF7E700FFEF
      DE00FFEFD600FFE7CE00F7DEC600F7DEBD00E7CEAD00A57B7300000000000000
      00000031F7000031F700000000000000000008841000008C0800008C08000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6BDB500FFFF
      FF00FFFFFF00EFCE9C00CE630000EFCE9C00F7E7D600CE630000EFCE9C00F7DE
      BD00F7DEB500F7DEB500B5848400000000000000000000000000CEAD9C00FFFF
      FF0039525200FFF7EF00FFEFE700F7EFDE00F7E7CE00F7DEC600F7DEBD00EFD6
      AD00EFCEA500F7D6A500A5636B0000000000B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00000000000000
      000000000000000000000031F70000000000008C0800008C0800B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000F7DEC600F7D6B500B5848400000000000000000000000000D6B5A500FFFF
      FF0039525200FFFFFF00FFF7EF00FFEFE700F7EFDE00F7E7CE00F7DEC600F7D6
      B500F7D6AD00EFCEA500A5636B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000031F700008C080000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B5848400000000000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00EFCE9C00CE630000FFEFE700EFCE9C00CE630000EFCE
      9C00E7DEC600C6BDAD00B5848400000000000000000000000000D6B5A500FFFF
      FF0039525200FFFFFF00FFFFFF00FFF7EF00FFEFE700FFE7D600F7E7CE00F7E7
      CE00DECEB500B5AD9400A5636B0000000000B58C8C00A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6A500EFCE9C00EFCE9C00EFCE
      9400EFCE9400EFCE9C00B5848400000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CE630000FFF7EF00FFF7EF00CE630000C6A5
      9400B5948C00B58C8400B5848400000000000000000000000000DEB5A500FFFF
      FF0039525200FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFEFE700EFDECE00B58C
      7B00A57B6B009C736300A5636B0000000000B58C8C00FFF7E700FFF7E700FFEF
      D600FFE7D600FFE7C600F7DEBD00F7D6B500E7C6AD00A57B7300000000000000
      0000000000000031F70000000000000000000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B5848400000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CE630000FFFFFF00FFFFF700CE630000BD8C
      7300EFB57300EFA54A00C6846B00000000000000000000000000E7BDA500FFFF
      FF0039525200FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700DEC6BD00AD73
      5A00E79C5200E78C3100B56B4A0000000000B58C8C00FFFFF700FFF7E700FFEF
      D600FFE7D600FFE7C600F7DEBD00F7D6B500E7C6AD00A57B7300000000000000
      00000031F7000031F70000000000000000000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEB500F7D6B500F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B5848400000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE94730000000000000000000000000000000000E7BDA5003952
      52003952520039525200FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C600BD84
      6300FFB55A00BD7B5A000000000000000000B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00000000000000
      000000000000000000000031F700000000000000000000000000C6A59C00FFF7
      E700FFF7E700F7E7D600F7E7CE00F7E7CE00F7DEC600F7DEC600F7DEB500F7D6
      AD00EFCE9C00EFCE9C00B5848400000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000E7BDA500F7F7
      EF0039525200F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00DEC6BD00B57B
      6300C6846B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000031F7000000000000000000C6A59C00FFF7
      E700FFF7E700FFF7E700F7E7D600F7E7CE00F7E7CE00F7DEC600F7DEC600F7DE
      B500F7D6AD00EFCE9C00B5848400000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000EFC6AD00EFCE
      B500EFCEB500E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500A56B
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003131C6003131C6003131A5003131A5000000
      0000000000000000000000000000000000000000000029ADD60031B5DE0021AD
      D600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60031B5DE0021AD
      D600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      000000000000000000003139FF003139FF003139FF003131E7003131E7003131
      A500000000000000000000000000000000000000000029ADD6009CDEEF0084EF
      FF004AC6E70021ADD60018A5C60018A5C60018A5C60000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CDEEF0084EF
      FF004AC6E70021ADD60018A5C60018A5C60018A5C60000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      F700948C8C00948C8C00948C8C00948C8C00FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000000000000000
      0000000000003139FF003139FF003139FF003139FF003139FF003131E7003131
      E7003131A5000000000000000000000000000000000029ADD60052BDE7009CFF
      FF0094FFFF0073DEF70073DEF70073DEF70073DEF7004AC6E70021ADD60018A5
      C600000000000000000000000000000000000000000029ADD60052BDE7009CFF
      FF0094FFFF0073DEF70073DEF70073DEF70073DEF7004AC6E70021ADD60018A5
      C6000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00313129006B7394001029A50021213900FFE7C600FFDEB500FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000000000000000
      0000000000003139FF006363FF003139FF003139FF003139FF003139FF003131
      E7003131A5000000000000000000000000000000000029ADD60052BDE700ADFF
      FF008CF7FF008CEFFF008CEFFF008CEFFF0073DEF70073DEF70073DEF7004AC6
      EF0021ADD6000000000000000000000000000000000029ADD60052BDE700ADFF
      FF008CF7FF008CEFFF008CEFFF008CEFFF0073DEF70073DEF70073DEF7004AC6
      EF0021ADD60000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF0031313900637BE700FFFFF70010219C00FFEFD600FFE7C600FFDEB500FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE630000CE6B00007B3908007B3908007B39
      08007B3908006363FF006363FF003139FF003139FF003139FF003139FF003139
      FF003131A5000000000000000000000000000000000029ADD60029ADD600ADDE
      EF0094F7FF0094F7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DEF70073DE
      F7004AC6EF000000000000000000000000000000000029ADD60029ADD600ADDE
      EF0094F7FF0094F7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DEF70073DE
      F7004AC6EF0000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF0042424200524A4A005A524A00182994006373D600FFEFD600FFE7C600FFDE
      B500FFD6AD00FFD6AD00FFD6AD00CE630000CE6B0000F7941000CE630000CE63
      0000CE6300006363FF009C9CFF006363FF003139FF003139FF003139FF003139
      FF003131A500004A0000004A0000004A00000000000029ADD60073DEF70029AD
      D6009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF008CEFFF0073DE
      F70073DEF70018A5C60000000000000000000000000029ADD60073DEF70029AD
      D6009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF008CEFFF0073DE
      F70073DEF70018A5C600000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00637BE700425AE700FFEFD600FFE7
      C600FFDEB500FFD6AD00FFD6AD00CE63000000000000CE6B0000F7941000E76B
      0000E76B0000E76B00006363FF009C9CFF006363FF003139FF003139FF003131
      C600007B0800007B0800007B0800004A00000000000029ADD60094F7FF0029AD
      D600ADDEEF00A5EFF700A5EFF700A5F7FF008CEFFF008CEFFF008CEFFF0073DE
      F7000073080018A5C60000000000000000000000000029ADD60094F7FF0029AD
      D600ADDEEF00A5EFF700A5EFF700A5F7FF008CEFFF008CEFFF008CEFFF0073DE
      F70073DEF70039BDE700000000000000000000000000CE630000FFFFFF00FFFF
      FF00948C8C00948C8C00948C8C00948C8C00FFFFFF00FFFFFF00FFF7E700FFEF
      D600FFE7C600FFDEB500FFD6AD00CE6300000000000000000000CE6B0000F794
      1000E76B0000CE6300007B3908006363FF003139FF003139FF003139FF00009C
      0800009C0800009C0800007B0800004A00000000000029ADD6009CFFFF0073DE
      F70029ADD60018A5C60018A5C60018A5C600ADDEEF008CF7FF0084EFFF000073
      08005AE78C000073080018A5C600000000000000000029ADD6009CFFFF0073DE
      F70029ADD60018A5C60018A5C60018A5C600ADDEEF008CF7FF0084EFFF0084EF
      FF0073DEF70073DEF70018A5C6000000000000000000CE630000FFFFFF00FFFF
      FF00313129006B7394001029A50021213900FFFFFF00FFFFFF00FFFFF700FFF7
      E700FFEFD600FFE7C600FFDEB500CE630000000000000000000000000000CE6B
      0000F79410007B390800000000000873100042C67300009C0800009C0800009C
      0800009C0800009C0800007B0800004A00000000000029ADD6009CFFFF0094F7
      FF0073DEF70073DEF70073DEF7006BDEF70029ADD600ADDEEF000073080052D6
      7B0042D66B0031C64A0000730800000000000000000029ADD6009CFFFF0094F7
      FF009C9C9C00086B0800086B0800086B080029ADD600ADDEEF0084EFFF0084EF
      FF0084EFFF0094EFFF0031A5D6000000000000000000CE630000FFFFFF00FFFF
      FF0031313900637BE700FFFFFF0010219C00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7E700FFEFD600FFE7C600CE6300000000000000000000000000000000
      0000CE6B000000000000000000000873100042C67300009C0800009C0800009C
      0800009C0800009C0800007B0800004A00000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0073DEF70073DEF70029ADD60018A5C600108C
      210031C64A00109C210018A5C600000000000000000029ADD6009CFFFF0094F7
      FF00A5A5A5004AA54A00086B0800003900000031000029ADD60018A5C60029A5
      D60029A5D60029A5D60018A5C6000000000000000000CE630000FFFFFF00FFFF
      FF0042424200524A4A005A524A00182994006373D600FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600CE6300000000000000000000000000000000
      00000000000000000000000000000873100042C67300009C0800009C0800009C
      0800009C0800009C0800007B0800004A00000000000029ADD600C6FFFF0094FF
      FF009CFFFF00D6FFFF00D6FFFF008CEFFF0094EFFF0073DEF70073DEF7000884
      100018AD29000884100000000000000000000000000029ADD600C6FFFF0094FF
      FF00ADADB5005ABD63004AA54A0000520000085A0000C66B0000CE630000DE6B
      0000DE73000084848400000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00637BE700425AE700FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700CE6300000000000000000000000000000000
      00000000000000000000000000000873100042C67300009C0800009C0800009C
      0800009C0800009C0800007B0800004A00000000000021ADD6009CDEEF00C6FF
      FF00C6FFFF009CDEEF0018ADD60018A5C60018A5C60018A5C60018A5C600088C
      100008A518000000000000000000000000000000000021ADD6009CDEEF00C6FF
      FF00B5B5B50031AD3900218C1800529C390094944200DE7B2100C65A0000BD4A
      0000C652000084848400000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      00000000000000000000000000000873100042C6730042C6730042C6730042C6
      730042C6730042C6730042C67300004A0000000000000000000031B5DE0029AD
      D60018A5C60018A5C60000000000000000000000000000000000088C100008A5
      180008841000000000000000000000000000000000000000000031B5DE0029AD
      D600BDBDBD00FFD68400FFCE6300FFC65200FFC65A00FFCE6300FFE78C00F7DE
      BD00CE9C73008484840000000000000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000000000
      0000000000000000000000000000087310000873100008731000087310000873
      1000087310000873100008731000087310000000000000000000000000000000
      000000000000000000000000000000730800087B0800088C1000088C1000087B
      0800000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600F7CE8C00FFB54200FFAD2900FFBD5A00FFBD5A00FFDEA500F7EF
      C600FFFFCE008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600B5B5BD00B5B5BD00B5B5BD00B5B5BD00B5B5BD00B5B5BD00B5B5
      BD00B5B5BD008C8C940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE6B
      0000CE6B0000CE6B0000CE6B0000CE6B00000000000000000000000000000000
      0000CE6B0000CE6B0000CE6B0000CE6B00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CE6B00009C390800000000000000000000000000000000000000
      000000000000CE6B00009C390800000000009431310094313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001084A500106B8400000000000000
      0000000000004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A0000000000BD4A0000BD4A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CE6B00009C3908000000000000000000000000000000
      000000000000CE6B00009C390800000000000000000000000000943131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000106B84000000
      0000000000004A844A006BCE84006BCE84006BC6840063C67B005ABD6B0052B5
      6B0052AD5A0052AD52004A8C4A00000000000000000000000000BD4A00000000
      000000000000FF630000D6520000D6520000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A000000000000000000000000000000000000000000000000
      0000000000000000000000000000CE6B0000CE6B0000CE6B0000CE6B0000CE6B
      0000CE6B0000CE6B00009C390800000000000000000094313100000000000000
      0000000000005A5242005A5242005A5242005A5242005A5242005A5242005A52
      42005A524200B5848400000000000000000000000000106B8400000000000000
      0000000000004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A000000000000000000BD4A0000000000000000
      000000000000FF630000FF630000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF6300000000000000000000CE6B0000CE6B0000CE6B0000CE6B
      0000CE6B00009C3908000000000000000000CE6B00009C390800000000000000
      000000000000CE6B00009C390800000000009431310094313100943131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001084A5001084A500106B84000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD4A0000BD4A0000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE6B00009C39
      08000000000000000000000000000073080000000000CE6B00009C3908000000
      000000000000CE6B00009C390800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE6B00009C39
      08000000000000000000007308005AE78C000073080000000000CE6B00009C39
      080000000000CE6B00009C390800000000009431310094313100943131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001084A5001084A500106B84000000
      0000000000004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A0000000000BD4A0000BD4A0000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE6B00009C39
      0800000000000073080052D67B0042D66B0031C64A000073080000000000CE6B
      00009C390800CE6B00009C390800000000000000000094313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000106B8400000000000000
      0000000000004A844A006BCE84006BCE84006BC6840063C67B005ABD6B0052B5
      6B0052AD5A0052AD52004A8C4A000000000000000000BD4A0000000000000000
      000000000000FF630000D6520000D6520000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A000000000000000000000000000000000000CE6B00009C39
      08000000000000000000108C210031C64A00109C210000000000000000000000
      0000CE6B0000CE6B00009C390800000000000000000000000000943131000000
      0000000000005A5242005A5242005A5242005A5242005A5242005A5242005A52
      42005A524200B584840000000000000000000000000000000000106B84000000
      0000000000004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A00000000000000000000000000BD4A00000000
      000000000000FF630000FF630000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF63000000000000000000000000000000000000CE6B00009C39
      080000000000000000000884100018AD29000884100000000000000000000000
      000000000000CE6B00009C390800000000009431310094313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001084A500106B8400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD4A0000BD4A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE6B00009C39
      08000000000000000000088C100008A518000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE6B00009C39
      080000000000088C100008A51800088410000000000000000000000000000000
      0000000000000000000000000000000000009431310094313100943131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001084A5001084A500106B84000000
      0000000000004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A0000000000BD4A0000BD4A0000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE6B0000CE6B0000CE6B00009C39
      0800088C1000088C1000087B0800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001084A500000000000000
      0000000000004A844A006BCE84006BCE84006BC6840063C67B005ABD6B0052B5
      6B0052AD5A0052AD52004A8C4A000000000000000000BD4A0000000000000000
      000000000000FF630000D6520000D6520000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000000000000000000000000000CE6B0000CE6B00009C39
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009431310094313100000000000000
      0000000000005A5242005A5242005A5242005A5242005A5242005A5242005A52
      42005A524200B584840000000000000000001084A5001084A500000000000000
      0000000000004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A0000000000BD4A0000BD4A0000000000000000
      000000000000FF630000FF630000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF63000000000000000000000000000000000000CE6B00009C39
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001084A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD4A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE6B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000CE6B00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B000000000000000000000000
      0000CE6B0000CE6B0000CE6B0000CE6B00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B5848400000000000000000000000000000000000000
      0000000000000000000000000000CE6B00009C39080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CE6B00009C3908000000000000000000000000000000
      000000000000CE6B00009C390800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6A500EFCE9C00EFCE9C00EFCE
      9400EFCE9400EFCE9C00B5848400000000000000000000000000000000000000
      0000000000000000000000000000CE6B0000CE6B00009C390800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CE6B00009C39080000000000000000000000
      0000CE6B00009C39080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B5848400000000000000000000000000000000000000
      0000000000000000000000000000CE6B00009C390800CE6B00009C3908000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE6B00009C39080000000000CE6B
      00009C3908000000000000000000000000000000000029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD6000018D6000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C600F7DEC600CE630000EFCE9C00F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B584840000000000CE6B0000CE6B0000CE6B0000CE6B
      0000CE6B00009C39080000000000CE6B00009C39080000000000CE6B00009C39
      080000000000000000000000000000000000CE6B0000CE6B0000CE6B0000CE6B
      0000CE6B00009C390800000000000000000000730800CE6B00009C3908009C39
      0800000000000000000000000000000000000000000029ADD6008CF7FF008CF7
      FF008CEFFF0073DEF7000018D6000018D60073DEF70073DEF70029ADD60029AD
      D60073DEF70073DEF7000018D600000000000000000000000000CEB5AD00FFFF
      F700FFEFE700F7E7D600F7E7D600F7E7CE00CE630000EFCE9C00EFCE9C00F7D6
      AD00EFCE9C00EFCE9C00B5848400000000000000000000000000CE6B00009C39
      0800000000000000000000000000CE6B00009C3908000000000000000000CE6B
      00009C3908000000000000000000000000000000000000000000CE6B00009C39
      0800000000000000000000000000007308005AE78C0000730800CE6B00009C39
      0800000000000000000000000000000000000000000029ADD6008CF7FF008CF7
      FF008CF7FF008CEFFF000018D6000018D6000018D60073DEF70029ADD600ADFF
      FF0029ADD6000018D60029ADD600000000000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700CE630000CE630000CE630000CE630000CE630000F7D6
      AD00F7D6A500F7D6A500B5848400000000000000000000000000CE6B00009C39
      0800000000000000000000000000CE6B00009C39080000000000000000000000
      0000CE6B00009C39080000000000000000000000000000000000CE6B00009C39
      080000000000000000000073080052D67B0042D66B0031C64A0000730800CE6B
      00009C3908000000000000000000000000000000000029ADD6009CFFFF008CF7
      FF008CF7FF008CF7FF008CEFFF008CEFFF000018D6000018D60029ADD6000018
      D6000018D60029ADD60029ADD600000000000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE00F7E7D600CE630000EFCE9C00F7DEC600F7DE
      BD00F7D6B500F7D6AD00B5848400000000000000000000000000CE6B00009C39
      0800000000000000000000000000007308009C39080000000000000000000000
      000000000000CE6B00009C390800000000000000000000000000CE6B00009C39
      0800000000000000000000000000108C210031C64A00109C2100000000000000
      0000CE6B00009C39080000000000000000000000000029ADD6009CFFFF009CFF
      FF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF000018D6000018E7000018
      E70029ADD60029ADD60029ADD600000000000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFFFFF00CE630000EFCE9C00CE630000EFCE9C00F7DEC600F7DE
      BD00F7DEB500F7DEB500B5848400000000000000000000000000CE6B00009C39
      08000000000000000000007308005AE78C000073080000000000000000000000
      00000000000000000000CE6B00009C3908000000000000000000CE6B00009C39
      08000000000000000000CE6B00000884100018AD290008841000000000000000
      000000000000CE6B00009C390800000000000000000029ADD6009CFFFF009CFF
      FF009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF000018D6000018E7000018
      EF0073DEF70073DEF70029ADD600000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00CE630000EFCE9C00EFCE9C00F7E7D600F7E7CE00F7DE
      C600F7DEC600F7D6B500B5848400000000000000000000000000CE6B00009C39
      0800000000000073080052D67B0042D66B0031C64A0000730800000000000000
      0000CE6B0000CE6B0000CE6B0000CE6B00000000000000000000CE6B00009C39
      080000000000CE6B0000CE6B0000088C100008A51800CE6B0000000000000000
      0000CE6B0000CE6B0000CE6B0000CE6B00000000000029ADD6009CFFFF009CFF
      FF009CFFFF009CFFFF008CF7FF008CF7FF000018F7000018EF008CEFFF008CEF
      FF000018F70073DEF70029ADD600000000000000000000000000DEC6B500FFFF
      FF00CE630000CE630000CE630000CE630000CE630000FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B5848400000000000000000000000000CE6B00009C39
      08000000000000000000108C210031C64A00109C210000000000000000000000
      0000000000000000000000000000000000000000000000000000CE6B00009C39
      08000000000000000000088C100008A518000884100000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF000018F7000018FF008CF7FF008CEFFF008CEF
      FF008CEFFF000018F70029ADD600000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00CE630000EFCE9C00FFF7EF00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B5848400000000000000000000000000CE6B00009C39
      080000000000000000000884100018AD29000884100000000000000000000000
      0000000000000000000000000000000000000000000000000000CE6B00009C39
      0800088C1000088C1000088C1000087B08000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF009CFF
      FF009CFFFF009CFFFF000018F7000018F7008CF7FF008CF7FF008CEFFF008CEF
      FF008CEFFF008CEFFF000018F700000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00CE630000EFCE9C00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B0000000000CE6B0000CE6B0000CE6B00009C39
      08000000000000000000088C100008A518000000000000000000000000000000
      000000000000000000000000000000000000CE6B0000CE6B0000CE6B00009C39
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60029ADD60029AD
      D60029ADD60029ADD6000018F70029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD600000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE947300000000000000000000000000CE6B0000CE6B00009C39
      080000000000088C100008A51800088410000000000000000000000000000000
      00000000000000000000000000000000000000000000CE6B0000CE6B00009C39
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000CE6B00009C39
      0800088C1000088C1000087B0800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE6B00009C39
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B0000000000000000000000000000000000000000000000000000000000CE6B
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE6B
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084B58400107310001873
      18001873180018731800187B1800187B1800107B1000107B1000087B0800087B
      0800007B0000007300007BB57B00FFFFFF000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0010841000218C21002994
      2900319431003194310029942900299C2900219C210018A5180018A5180010A5
      100008A5080000940000006B0000FFFFFF000000000000000000C6A59C00FFEF
      D600C6A59C00C6A59C00C6A59C00C6A59C00C6A59C00C6A59C00C6A59C00C6A5
      9C00C6A59C00EFCE9C00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00188C180029942900399C
      3900399C3900399C390039A53900A5D6A500FFFFFF0021AD210018AD180010B5
      100008AD0800009C0000007B0000FFFFFF000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0021942100399C390042A5
      42004AA54A0042A5420042A54200FFFFFF00FFFFFF00FFFFFF0021B5210018B5
      180010AD100008A50800087B0800FFFFFF000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEB500F7D6B500F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B5848400000000000000000029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD600000000000000000029ADD60029ADD60029AD
      D600292929005A524A0029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60000000000FFFFFF0029942900429C42004AA5
      4A0052A552004AA54A0042A5420042AD4200FFFFFF00FFFFFF00FFFFFF0018B5
      180010AD100010A5100008840800FFFFFF000000000000000000CEB5AD00FFFF
      F700C6A59C00C6A59C00C6A59C00C6A59C00C6A59C00C6A59C00C6A59C00C6A5
      9C00C6A59C00EFCE9C00B5848400000000000000000029ADD6008CF7FF008CF7
      FF008CEFFF0073DEF70073DEF70073DEF70073DEF70073DEF70029ADD60029AD
      D60073DEF70073DEF70029ADD600000000000000000029ADD6008CF7FF008CF7
      FF005A524A00424242005263630073DEF70073DEF70073DEF70029ADD60029AD
      D60073DEF70073DEF70029ADD60000000000FFFFFF00319C31004AA54A0052A5
      520052A552004AA54A004AA54A0042A5420039AD3900FFFFFF00FFFFFF00FFFF
      FF0018AD180018A5180010841000FFFFFF000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEBD00F7D6
      AD00F7D6A500F7D6A500B5848400000000000000000029ADD6008CF7FF008CF7
      FF008CF7FF008CEFFF008CEFFF0073DEF70073DEF70073DEF70029ADD600ADFF
      FF0029ADD60073DEF70029ADD600000000000000000029ADD6008CF7FF008CF7
      FF0073DEF70052737B00427BAD0018526B008C5A520073DEF70029ADD600ADFF
      FF0029ADD60073DEF70029ADD60000000000FFFFFF00429C420052A55200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00219C210018841800FFFFFF000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEC600F7DE
      BD00F7D6B500F7D6AD00B5848400000000000000000029ADD6009CFFFF008CF7
      FF008CF7FF008CF7FF008CEFFF008CEFFF0073DEF70073DEF70029ADD600ADFF
      FF00ADFFFF0029ADD60029ADD600000000000000000029ADD6009CFFFF008CF7
      FF008CF7FF0052737B0042739400947B7300C67331008C5A520029ADD600ADFF
      FF00ADFFFF0029ADD60029ADD60000000000FFFFFF0042A542005AAD5A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00219C2100217B2100FFFFFF000000000000000000D6BDB500FFFF
      FF00C6A59C00C6A59C00C6A59C00C6A59C00C6A59C00C6A59C00C6A59C00C6A5
      9C00C6A59C00F7DEB500B5848400000000000000000029ADD6009CFFFF009CFF
      FF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF0073DEF70029ADD60029AD
      D60029ADD60029ADD60029ADD600000000000000000029ADD6009CFFFF009CFF
      FF008CF7FF0073DEF7007B737B00F7BD8400F7AD5A00C67339008C5A520029AD
      D60029ADD60029ADD60029ADD60000000000FFFFFF0052A5520063AD630063AD
      63005AAD5A0052A552004AA54A00429C4200399C3900FFFFFF00FFFFFF00FFFF
      FF00299C290029942900217B2100FFFFFF000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C600F7DEC600F7D6B500B5848400000000000000000029ADD6009CFFFF009CFF
      FF009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF0073DEF70073DE
      F70073DEF70073DEF70029ADD600000000000000000029ADD6009CFFFF009CFF
      FF009CFFFF008CF7FF00AD7B7300FFD6AD00FFC68C00EFA55A00C67339008C5A
      520073DEF70073DEF70029ADD60000000000FFFFFF0052A552006BB56B006BB5
      6B005AAD5A0052A552004AA54A00429C4200FFFFFF00FFFFFF00FFFFFF002994
      29002994290029942900217B2100FFFFFF000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B5848400000000000000000029ADD6009CFFFF009CFF
      FF009CFFFF009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF008CEF
      FF0073DEF70073DEF70029ADD600000000000000000029ADD6009CFFFF009CFF
      FF009CFFFF009CFFFF008CF7FF00AD7B7300FFD6AD00FFC68C00F7AD5A00C673
      31008C5A520073DEF70029ADD60000000000FFFFFF005AAD5A007BBD7B0073BD
      730063AD63005AAD5A0052A55200FFFFFF00FFFFFF00FFFFFF00319C3100319C
      31003194310031943100217B2100FFFFFF000000000000000000E7C6B500FFFF
      FF00C6A59C00C6A59C00C6A59C00C6A59C00C6A59C00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B5848400000000000000000029ADD6009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF008CEF
      FF008CEFFF0073DEF70029ADD600000000000000000029ADD6009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF008CF7FF00AD7B7300FFD6AD00FFC68C00EFA5
      5A00B56B39008C5A520029ADD60000000000FFFFFF006BB56B008CC68C007BBD
      7B006BB56B0063B5630063AD6300B5DEB500FFFFFF004AA54A004AA54A0042A5
      4200399C390031943100217B2100FFFFFF000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B00000000000000000029ADD6009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF008CF7FF008CF7FF008CEFFF008CEF
      FF008CEFFF008CEFFF0029ADD600000000000000000029ADD6009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF008CF7FF00AD7B7300FFD6AD009C94
      A50031ADF7000010AD0000009C0000000000FFFFFF0073BD73009CCE9C008CC6
      8C007BBD7B0073BD73006BB56B0063B5630063AD63005AAD5A0052AD52004AA5
      4A0042A542003194310018731800FFFFFF000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE94730000000000000000000000000029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD600000000000000000029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD600AD7B73004A9C
      EF001029D6001029D6000010AD0000009C00FFFFFF00B5DEB50073BD730063B5
      63005AAD5A0052A5520052A552004AA54A004AA54A0042A54200429C4200399C
      390031943100218C21008CBD8C00FFFFFF000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000018
      C6006B8CFF00106BFF001029D6000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000018C6000018C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001094100039AD390000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B58484000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000042424200424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420042424200424242000000000000000000000000000000
      000000000000000000000000000000AD0000218C180039AD3900000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500F7CE9C00F7CE94000073
      0800F7CE9400F7D69C00B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFF7EF00FFF7EF00FFEFDE00FFEFDE00FFEFDE00FFEFE700FFE7C600FFE7
      C600FFD6AD00FFD6AD00FFD6AD00CE630000000000005A5A5A006B6B6B006363
      6300636363006B6B6B006363630052636B006B6B6B006B6B63006B6B63006B6B
      63006B6B63006B6B63005A635A005A5A5A000000000000000000000000000000
      0000000000000000000000000000009C0000219C18001884180039AD39000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6A500108C2100109C210031C6
      4A0000730800F7CE9C00B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFF7EF00FFF7EF00FFF7EF00FFEFDE00FFEFDE00FFEFDE00FFE7
      C600FFE7C600FFE7C600FFD6AD00CE630000000000006B6B6B00A5A5A5009C9C
      9C0094949400949494009C9C9C0094949400A5A5A5009C9C9C009C9C9C009C9C
      9C009494940094949400A5A5A5006B6B6B000000000000000000000000000000
      0000000000000000000000000000009C0000088C000008840000088C100039AD
      3900000000000000000000000000000000000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC6000884100008A5180018AD290031C64A0042D6
      6B005AE78C0000730800B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFF7EF00FFEFDE00FFEFDE00FFEF
      E700FFE7C600FFD6AD00FFD6AD00CE630000000000007B7B7B00C6C6C600ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADA500C6C6C600ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00C6C6C6007B7B7B0000AD00006BDE6B0052E7520042DE
      420018C6180000B5080000B50000088C0800008C00002194210063AD6300107B
      100039AD39000000000000000000000000000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00087B080008A51800088C100008841000108C210052D6
      7B0000730800F7CE9400B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFEFDE00FFEF
      DE00FFEFDE00FFE7C600FFD6AD00CE630000000000008C8C8C00DEDEDE007B7B
      7B0084848400848484008484840073847B00CEC6C60084848400848484008484
      84008484840073847B00DEDEDE008C8C8C00009C080063E7630018D6180008C6
      000000BD000000B5000000A50000008C0000008C080000840000218C180063AD
      6300187B180039AD390000000000000000000000000000000000CEB5AD00FFFF
      F700FFEFE700F7E7D600088C1000088C1000F7DEC600F7DEBD00F7D6B5000073
      0800F7CE9C00F7CE9C00B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFEF
      DE00FFEFE700FFE7C600FFD6AD00CE63000000000000A5A5A500F7F7EF00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00E7EFEF00C6CECE00C6CECE00CECE
      CE00C6CECE00C6CECE00F7F7EF00A5A5A5001094080063E7630000CE000000C6
      000000BD000000B5000000AD0000009C0000008C080000840000007B0000187B
      210063AD6300187B180039AD3900000000000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700088C1000F7E7CE00F7E7C600F7DEC600F7DEBD00F7D6
      AD00F7D6A500F7D6A500B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF003184
      FF003184FF003184FF00FFD6AD00CE63000000000000ADADAD00FFFFFF008484
      8400848484007B7B7B00848484008C847B00CEEFCE004AB54A0039B542004AAD
      420042BD420042BD4200FFFFFF00ADADAD0000A5000063E76B0000CE000008C6
      000000BD000000B5000000AD000000940000008C08000084000000840000007B
      0000298C310063AD6300187B210039AD39000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00087B0800F7E7D600F7E7CE00F7E7C600F7DEC600F7DE
      BD00F7D6B500F7D6AD00B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003184
      FF0042B5F7003184FF00FFD6AD00CE63000000000000B5B5B500FFFFFF00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00C6E7BD0000730800088C00000084
      000042942100298C1800FFFFFF00B5B5B500089C00006BE76B0000CE000008C6
      000000BD000000B5000000AD000000940800008C080000840000007B00000073
      0000398C310063AD63001873290039AD39000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFF7F700FFEFE700FFEFE700F7E7D600F7E7CE00F7DEC600F7DE
      BD00F7DEB500F7DEB500B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003184FF003184FF003184
      FF0042B5F7003184FF003184FF003184FF0000000000BDBDBD00FFFFFF008484
      84007B7B7B00848484007B7B7B0073847B00FFEFD6009C944200CE946300CE9C
      5A00E7A56B00DEB58400F7EFF700BDBDBD00009C000063E7630000CE000008C6
      000000BD000000B5000000A50000009400000094000000840000087B08002984
      180063AD6300187B210039AD3900000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C600F7DEC600F7D6B500B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003184FF008CD6F700B5DE
      F700B5DEF700B5DEF7008CD6F7003184FF0000000000BDBDBD00FFFFFF00CECE
      CE00D6D6D600D6D6D600D6D6D600D6D6D600FFEFF700EFCEB500EFCEAD00EFCE
      AD00DEC6AD00F7D6BD00E7EFEF00BDBDBD00009408006BEF630018D6180008C6
      000000BD000000B5000000AD080008940000008C000000840000108C180063AD
      6300107B180039AD390000000000000000000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B58484000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003184FF003184FF003184
      FF00B5DEF7003184FF003184FF003184FF0000000000BDBDBD00FFFFFF006B6B
      6B006363630063636300636363006B6B6B00636B63006363630063636B006B63
      5A00636B6B006B6B5A00F7F7EF00CEBDC60000AD00007BDE7B005AE75A0042DE
      420018C6180000B5080000AD000000940000009400001894210063AD6300107B
      100039AD39000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B58484000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE6300003184
      FF00B5DEF7003184FF00CE630000CE63000000000000C6C6C600FFFFFF006363
      6300636363006B6B6B006363630063636B006B5A63006B6B6B0063636300636B
      6B00636363006B6B6300E7EFEF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000009C0000008C000008840000088C100039AD
      3900000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B00000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE6300003184
      FF003184FF003184FF00CE6300000000000000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7F7F700FFFFF700FFFFF700F7FF
      F700FFFFFF00FFFFFF00F7F7EF00C6C6C6000000000000000000000000000000
      00000000000000000000000000001094080018941800188C180039AD39000000
      0000000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE94730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CECECE00C6C6C600CECE
      CE00C6C6C600CECECE00C6C6C600CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE000000000000000000000000000000
      0000000000000000000000000000009C00001894180039AD3900000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000002194210039AD390000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B5848400000000000000000029ADD60031B5DE0021AD
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD73
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B584840000000000AD4A4200AD4A4200AD4A4200AD4A
      4200AD4A4200AD4A4200AD4A4200AD4A4200AD4A4200AD4A4200AD4A4200AD4A
      4200AD4A4200AD4A4200AD4A4200AD4242000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6A500EFCE9C00EFCE9C00EFCE
      9400EFCE9400EFCE9C00B5848400000000000000000029ADD6009CDEEF0084EF
      FF004AC6E70021ADD60018A5C60018A5C60018A5C60000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B584840000000000C66B4A00C66B4A00C66B4A00C66B
      4A00C66B4A00C66B4A00C66B4A00C66B4A00C66B4A00C66B4A00C66B4A00C66B
      4A00C66B4A00C66B4A00AD4A4200AD4242000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B5848400000000000000000029ADD60052BDE7009CFF
      FF0094FFFF0073DEF70073DEF70073DEF70073DEF7004AC6E70021ADD60018A5
      C60000000000000000000000000000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B584840000000000C66B4A00FFFFFF00C66B4A00FFFF
      FF00C66B4A00FFFFFF00C66B4A00FFFFFF00C66B4A00FFFFFF00C66B4A00FFFF
      FF00C66B4A00FFFFFF00AD423900AD4242000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEB500F7D6B500F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B5848400000000000000000029ADD60052BDE700ADFF
      FF008CF7FF008CEFFF008CEFFF008CEFFF0073DEF70073DEF70073DEF7004AC6
      EF0021ADD600000000000000000000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B584840000000000C66B4A00C66B4A00C66B4A00C66B
      4A00C66B4A00C66B4A00C66B4A00C66B4A00C66B4A00C66B4A00C66B4A00C66B
      4A00C66B4A00C66B4A00AD423900AD4A4A000000000000000000CEB5AD00FFFF
      F700FFEFE700F7E7D600F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6
      AD00EFCE9C00EFCE9C00B5848400000000000000000029ADD60029ADD600ADDE
      EF0094F7FF0094F7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DEF70073DE
      F7004AC6EF00000000000000000000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B584840000000000FFFFF700FFFFF700EFDECE00C66B
      4A00EFDED600FFFFF700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFFFF700C66B
      4A00DEAD9C00FFFFFF00F7F7E700AD4A4A000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEBD00F7D6
      AD00F7D6A500F7D6A500B5848400000000000000000029ADD60073DEF70029AD
      D6009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF008CEFFF0073DE
      F70073DEF70018A5C6000000000000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B584840000000000F7EFE700F7EFE700EFCEBD00C66B
      4A00EFD6C600F7EFDE00F7E7D600F7E7D600F7E7D600F7E7D600F7EFDE00C66B
      4A00D6A58C00F7EFE700EFDED600AD4A4A000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEC600F7DE
      BD00F7D6B500F7D6AD00B5848400000000000000000029ADD60094F7FF0029AD
      D600ADDEEF00A5EFF700A5EFF700A5F7FF008CEFFF008CEFFF008CEFFF0073DE
      F70073DEF700ADBDF7000000000000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B584840000000000F7E7D600F7E7D600E7CEB500C66B
      4A00EFCEBD00F7E7D600EFE7CE00EFDED600F7E7D600F7E7D600F7E7D600C66B
      4A00D6A58C00F7EFDE00EFDECE00AD4A4A000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFF7F700FFF7EF00FFEFE700F7E7D600F7E7CE00F7DEC600F7DE
      BD00F7DEB500F7DEB500B5848400000000000000000029ADD6009CFFFF0073DE
      F70029ADD60018A5C60018A5C60018A5C600ADDEEF008CF7FF00004AF70094C6
      FF00004AF700004AF700BDCEF700004AF700000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B584840000000000EFE7CE00EFE7CE00E7C6AD00C66B
      4A00E7CEB500EFDECE00EFDEC600EFDECE00EFDECE00EFDECE00EFDECE00C66B
      4A00D69C8400F7E7D600EFD6C600AD4A4A000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C600F7DEC600F7D6B500B5848400000000000000000029ADD6009CFFFF0094F7
      FF0073DEF70073DEF70073DEF7006BDEF70029ADD600ADDEEF0073A5FF001852
      FF00004AF700004AF700295AFF007B94F70000000000000000003184FF003184
      FF003184FF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700B584840000000000EFDEC600EFDEC600E7C6AD00C66B
      4A00E7C6AD00EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600C66B
      4A00D69C8400EFE7CE00EFD6BD00AD4A4A000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B5848400000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0073DEF70073DEF70029ADD600004AF700004A
      F70042C6FF004ACEFF00004AF700004AF70000000000000000003184FF0042B5
      F7003184FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00B584840000000000E7BDA500E7BDA500DEAD8C00C66B
      4A00DEAD9400E7BDA500E7BDA500E7BDA500E7BDA500E7BDA500E7BDA500C66B
      4A00CE8C7300E7C6A500DEB59C00A53939000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B5848400000000000000000029ADD600C6FFFF0094FF
      FF009CFFFF00D6FFFF00D6FFFF008CEFFF0094EFFF0073DEF700004AF700004A
      F7007BEFFF0073F7FF00004AF700004AF7003184FF003184FF003184FF0042B5
      F7003184FF003184FF003184FF00E7E7E700E7E7E700E7E7E700E7E7E700B584
      7300B5948C00B58C8400B584840000000000C66B4A00C66B4A00C66B4A00C66B
      4A00C66B4A00C66B4A00C66B4A00C66B4A00C66B4A00C66B4A00C66B4A00C66B
      4A00C66B4A00C66B4A00AD423900AD4A4A000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B00000000000000000021ADD6009CDEEF00C6FF
      FF00C6FFFF009CDEEF0018ADD60018A5C60018A5C60018A5C60018A5C600004A
      F7001084FF00108CFF001852FF009CB5F7003184FF008CD6F700B5DEF700B5DE
      F700B5DEF7008CD6F7003184FF00DEDEDE00DEDEDE00DEDEDE00C6C6C600B584
      7300FFFFFF00FFFFFF00B584840000000000C66B4A00FFFFFF00C66B4A00FFFF
      FF00C66B4A00FFFFFF00C66B4A00FFFFFF00C66B4A00FFFFFF00C66B4A00FFFF
      FF00C66B4A00FFFFFF00AD423900A53939000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE9473000000000000000000000000000000000031B5DE0029AD
      D60018A5C60018A5C60000000000000000000000000000000000004AF700637B
      FF00004AF700004AF700738CF700004AF7003184FF003184FF003184FF00B5DE
      F7003184FF003184FF003184FF00D6D6D600D6D6D600D6D6D600C6C6C600B584
      7300FFFFFF00B58484000000000000000000C66B4A00C66B4A00C66B4A00C66B
      4A00C66B4A00C66B4A00C66B4A00C66B4A00C66B4A00C66B4A00C66B4A00C66B
      4A00C66B4A00C66B4A00AD423900AD4242000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004AF700004AF700000000000000000000000000000000003184FF00B5DE
      F7003184FF00CECECE00CECECE00CECECE00CECECE00CECECE00C6C6C600B584
      7300B58484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003184FF003184
      FF003184FF00EFD6C600EFD6C600EFD6C600EFD6C600EFD6C600D6BDB500B584
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A000000000000000000000000000000000000000000088CC600088CC6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A542000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A008C8C8C00ADADAD00BDB5AD005263840052638400BDB5AD00ADADAD009494
      9400424A4A00000000000000000000000000088CC60094E7F7005ADEEF00088C
      C600088CC600088CC600088CC600088CC6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7A54200CE6B0000F7A5
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042424200BDBD
      BD00CEC6C600C6C6BD006B7B9C00006B9C00006B9C006B7B9C00DEDED600BDBD
      BD00B5ADAD00424A4A000000000000000000088CC600A5E7F7008CFFFF0084FF
      FF0084F7FF0084F7FF007BF7FF0063DEFF00088CC600088CC600006B0800106B
      0800000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7A54200CE6B0000CE6B0000CE6B
      0000F7A542000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B0094949400C6C6
      C600DEDEDE006B7B9C0000ADEF0000ADE70000ADE700009CDE006B7B9C00DEDE
      DE00ADA5A500949494004A4A4A00000000000894CE0042ADD6009CFFFF0073F7
      FF007BF7FF0042B594002194420021944A00299C4A00218C4200007B1000008C
      0800087B18000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7A542000000000000000000CE6B00000000
      000000000000F7A5420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00ADADAD00BDBD
      BD00FFFFFF006B7B9C006B7B9C00006B9C00006B9C0000ADE7006B7B9C00EFE7
      E700BDBDBD00ADADAD004A4A4A000000000021A5D60042ADD6009CF7F70073F7
      FF0084FFFF0031945A0029BD4A0029BD4A0021B5420018AD420010A5310008A5
      180000940800006B000000000000000000000000000000000000000000000000
      00000000000000000000F7A54200CE6B00000000000000000000CE6B00000000
      000000000000CE6B0000F7A54200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00ADA5A500CECE
      CE00EFEFEF00D6E7EF006B7B9C0000ADE70000ADE70000A5DE00D6D6E700EFEF
      EF00BDBDBD00ADADAD004A4A4A000000000029A5D6005ADEEF0042ADD60084FF
      FF0084FFFF0031945A0031C6520039D6630029BD4A0021B5420021B5420010A5
      310008A51800008C08000052000000000000F7A5420000000000000000000000
      000000000000F7A54200CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B
      0000CE6B0000CE6B0000CE6B0000F7A54200000000006B84C6000021A5000021
      A5000021A5000021A5000021A5000021A5000021A5000021A5000021A5000021
      A5000021A5000021A5006B84C60000000000000000007B7B7B00B5ADAD00BDBD
      BD00F7F7F7006B7B9C0000ADE70000A5DE00006B9C006B7B9C006B7B9C00EFE7
      E700ADADAD00ADADAD004A4A4A000000000029A5D6007BEFF70042ADD600A5FF
      FF0073FFFF0042B5940031AD5A0029AD630029AD6300088CC60010A5390018B5
      5200089C210010843100088CC60000000000F7A542009C390800000000000000
      00000000000000000000F7A54200CE6B00000000000000000000CE6B00000000
      000000000000CE6B0000F7A5420000000000000000000021A5009494F7000029
      E7000029E7000029E7000029E7000029E7000029E7000029E7000029E7000029
      E7000029E7000029E7000021A5000000000000000000000000007B7B7B00ADAD
      AD00DEDED600C6C6D6006B7B9C0000ADDE0000ADE70000ADEF006B7B9C00CECE
      CE00ADADAD004A4A4A00000000000000000029A5D6008CF7F7006BA5B50042AD
      D60094F7FF0094F7FF0094FFFF008CFFFF0073F7FF0073F7FF0018A531001094
      2900188442007BEFF70021A5D60000000000F7A54200CE7321009C3908000000
      0000000000000000000000000000F7A542000000000000000000CE6B00000000
      000000000000F7A542000000000000000000000000000021A500B5C6FF009CBD
      FF009CBDFF009CB5FF009CB5FF009CB5FF00638CF700638CF700638CF700638C
      F700526BF700526BF7000021A5000000000000000000000000007B7B7B00ADAD
      AD00C6C6C600EFE7E7006B7B9C00006B9C00006B9C006B7B9C00DEDED600ADA5
      A500B5B5B5004A4A4A00000000000000000029A5D60084F7F700DEBDAD0042AD
      D60042ADD60042ADD60042ADD60042ADD6009CF7FF006BEFF700087B18003194
      5A0052CEF70084F7FF004ACEEF0000000000F7A54200D67B1800C66310009C39
      08009C3908009C3908009C3908009C390800F7A54200CE6B0000CE6B0000CE6B
      0000F7A54200000000000000000000000000000000006B84C6000021A5000021
      A5000021A5000021A5000021A5000021A5000021A5000021A5000021A5000021
      A5000021A5000021A5006B84C600000000000000000000000000000000007B7B
      7B0094949400A5A5A500CEC6C6004A5A7B004A5A7B00CEC6BD00BDB5B5009494
      94004A4A4A0000000000000000000000000029A5D60084F7F700D6C6BD00FFFF
      F700FFE7D600FFE7BD00DED6B5009CBDB50042ADD60094E7F70073D6C60094F7
      FF006BDEFF0094F7FF0084F7FF00189CD600F7A54200DE7B1000C6630000C663
      0000B54A00009C3908009C3908000000000000000000F7A54200CE6B0000F7A5
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B007B7B7B006B6B6B00736B6B00736B6B006B6B6B00424242004A4A
      4A000000000000000000000000000000000029A5D60084F7F700D6C6BD00FFFF
      FF00FFEFE700F7E7D600F7E7C600FFDEB500B5C6B50042ADD60042ADD60042AD
      D60042ADD60042ADD60042ADD60031A5D600F7A54200DE7B1000CE6B0000C663
      0000B55A10009C39080000000000000000000000000000000000F7A542000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B006B6363006B6B6B007B7B7B00000000000000
      00000000000000000000000000000000000031A5D60084F7F700DECEC600FFFF
      FF00FFFFF700FFEFE700F7E7D600F7E7C600FFDEB500FFD69C0073A5AD005AEF
      FF00189CD600000000000000000000000000F7A54200DE7B1000C6630000C663
      10009C3908000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C8C8C00CECED600949494008C8C8C00000000000000
      000000000000000000000000000000000000299CD6009CF7F700E7D6C600FFFF
      FF00FFFFFF00FFFFF700FFEFE700F7E7D600AD736300AD736300AD736300219C
      D600219CD600000000000000000000000000F7A54200D67B1800C66310009C39
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00D6D6D600F7FFFF00CED6D600CEC6C6007B7B7B000000
      00000000000000000000000000000000000000000000299CD600EFD6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00AD736300DE844200BD5A63000000
      000000000000000000000000000000000000F7A54200CE7321009C3908000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000021212100A5A5A50031313100949494009494940031313100ADADAD002121
      2100000000000000000000000000000000000000000000000000E7D6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6DE00AD736300DE8C5200000000000000
      000000000000000000000000000000000000F7A542009C390800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEA58400DEA5
      8400DEA58400DEA58400DEA58400DEA58400AD73630000000000000000000000
      000000000000000000000000000000000000F7A5420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C68C8400DEA58400DE9C
      7B00DE9C8400DE9C8400DE9C8400DE9C8400DE9C8400DE9C8400DE9C8400DE9C
      8400DE9C7B00DE9C8400BD847B000000000000000000CEADAD00AD8484007B5A
      52005A423900634A42006B5A5200846B6B009C8C8400B5A5A500000000000000
      00000000000000000000000000000000000000000000000000009C636300A56B
      6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B
      6B00A56B6B00A56B6B00A56B6B000000000000000000ADADAD009C9CA5000000
      0000000000000000000000000000000000006363630042424200313131008C8C
      8C0000000000000000000000000000000000C68C8400CE948400EFB59400FFCE
      9400FFCE9400FFCE9400FFCE9400FFCE9400FFCE9400FFCE9400FFCE9400FFCE
      9400FFD69C00E7B58C00C68C8400BD847B0000000000CEA5A500CE9C9C00D6A5
      9C00CE9C9C00BD8C8C009C736B007B5A5200634A42005A4239006B524A007B6B
      630094847B00AD9C9400000000000000000000000000000000009C5A6B00ADE7
      F700ADE7F700ADE7F700ADE7F700ADE7F700ADE7F700ADE7F7005A94F7005A94
      F7005A94F7005A94F700A56B6B000000000000000000737373005A5A5A009494
      9400000000000000000000000000000000006363630031313100313131008C8C
      8C0000000000000000000000000000000000C68C8400E7B58C00C68C8400F7CE
      AD00F7D6AD00F7CEAD00F7CEAD00F7CEAD00F7CEAD00F7CEAD00F7CEAD00F7D6
      AD00EFC6A500C68C8400EFBD9C00C68C840000000000CEA5A500CE9C9C00DEAD
      9C00FFD6A500EFC69C00EFB59C00D6A59C00CE9C9C00C6949400A5737300845A
      520073524A005A4239006B5A4A0094847B0000000000000000009C5A6B00ADE7
      F700ADE7F700ADE7F7005A94F7005A94F7005A94F700ADE7F700ADE7F700ADE7
      F7005A94F700ADE7F700A56B6B00000000000000000094949400313131005A5A
      5A00949494008C8C8C0000000000000000006363630031313100313131008C8C
      8C0000000000000000000000000000000000BD848400F7D6B500DEA58C00CEA5
      9C00EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDE
      C600C6949400DEAD9400EFDEC600BD84840000000000CEA5A500EFC69C00CE9C
      9C00EFCEAD00FFE7B500FFDEAD00FFD6A500FFD6A500F7C69C00EFB59C00DEAD
      9C00CE9C9C00CE9C9C00A57B73006B5A520000000000000000009C5A6B00ADE7
      F700ADE7F70042BDEF00ADE7F7005A94F700ADE7F700ADE7F700ADE7F700ADE7
      F7005A94F700ADE7F700A56B6B0000000000000000009C9CA50084848C003131
      3100525252007B7B7B0094949400000000006363630031313100313131008C8C
      8C0000000000000000000000000000000000BD848400EFDECE00F7D6B500C68C
      7B00DEC6BD00EFE7D600EFDED600EFDED600EFDED600EFDED600EFE7DE00D6B5
      AD00CE948400F7E7CE00EFDECE00BD84840000000000CEA5A500F7D6AD00EFCE
      AD00CE9C9C00F7E7BD00FFF7C600FFEFBD00FFE7B500FFE7B500FFDEAD00FFD6
      A500F7C69C00CE9C9C00CE9C9C0063524A0000000000000000009C636B00E794
      3900E7943900E7943900ADE7F700ADE7F700B5737300B5737300ADE7F700ADE7
      F7005A94F7005A94F700A56B6B0000000000000000000000000084848C007B7B
      7B0029292900212121007B7B7B0084848400636363005A5A5A005A5A5A009494
      940000000000000000000000000000000000BD8C8400EFE7DE00FFF7E700EFC6
      A500BD8C8400EFD6D600EFE7DE00EFDED600EFDED600EFE7D600E7CEC600C68C
      8400EFDEC600F7F7EF00EFE7DE00BD8C840000000000CEA5A500F7E7BD00FFF7
      C600E7CEB500D6ADA500FFFFD600FFFFD600FFFFCE00FFFFC600FFF7C600FFEF
      BD00D6A59C00DEAD9C00CE9C9C00634A42000000000000000000A5636B00E794
      3900E794390042BDEF008CD6FF00B5737300B5737300B57373005A94F700ADE7
      F700ADE7F7005A94F700A56B6B00000000000000000000000000000000003939
      39007373730021212100212121007B7B7B0031313100313131008C8C8C007B7B
      7B0000000000000000000000000000000000BD8C8400F7EFEF00F7F7EF00D6AD
      A500C68C8400C6949400BD848400BD848400BD848400C68C8C00C6949400C684
      8400E7CEC600FFFFFF00F7EFEF00C68C840000000000CEA5A500F7E7C600FFFF
      D600FFFFCE00DEB5A500DEBDB500FFFFE700FFFFDE00FFFFDE00FFFFD600D6AD
      A500DEB5A500FFD6A500CE9C9C00634A42000000000000000000AD6B6B00E794
      390042BDEF00ADE7F700ADE7F7005A5AFF005A5AFF005A5AFF00ADE7F700ADE7
      F700ADE7F7005A94F700A56B6B00000000000000000000000000000000000000
      00004242420073737B00212121002121210031313100ADADAD008C8C8C000000
      000000000000000000000000000000000000C68C8C00EFD6D600C6949400CEA5
      A500F7EFEF00F7EFEF00E7E7E700E7E7E700E7E7E700E7E7E700E7F7F700DED6
      D600BD949400D6A5A500EFE7DE00C68C8C0000000000CEA5A500F7E7CE00FFFF
      DE00F7E7C600D6ADA500CE9C9C00DEBDBD00F7E7DE00F7EFDE00D6ADA500DEBD
      AD00FFF7C600FFEFBD00CE9C9C00634A42000000000000000000AD6B7300E794
      3900E794390042BDEF00ADE7F7005A5AFF005A5AFF005A5AFF00ADE7F700ADE7
      F700ADE7F7005A94F700A56B6B00000000000000000000000000000000000000
      0000000000003939420073737B0021212100212121006B6B6B004A4A4A003939
      390039393900393939000000000000000000BD848400BD949400E7C6C600FFFF
      FF00F7FFFF00F7FFFF00F7FFFF00EFFFFF00EFFFFF00EFFFFF00EFFFFF00EFFF
      FF00E7F7F700CEB5B500C6949400BD84840000000000CEA5A500EFDECE00DEBD
      AD00CE9C9C00DED6D600DEEFF700CEC6C600BDADB500CE9C9C00C6A5A500DEBD
      AD00FFFFCE00FFFFCE00CE9C9C00634A42000000000000000000B5737300E794
      3900E7943900E7943900E794390042BDEF008CD6FF005A94F700ADE7F7005A94
      F700ADE7F7005A94F700A56B6B00000000000000000000000000000000000000
      000000000000000000003939420073737300292929004A4A4A00BD735200BD73
      5200636363004A4A4A003131310000000000B5847B00A5DEDE00FFFFFF00FFFF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00EFFFFF00E7F7F700E7F7
      F700D6EFEF00C6EFF700ADBDC600B57B7B0000000000CEA5A500CE9C9C00BDB5
      BD00FFFFFF00FFFFFF00F7FFFF00EFFFFF00E7FFFF00DEFFFF00DEF7F700CEAD
      AD00DEBDAD00FFFFD600CE9C9C0063524A000000000000000000B5737300FFA5
      1800E7943900E7943900E7943900E79439008CD6FF00ADE7F7005A94F7005A94
      F700ADE7F7005A94F700A56B6B00000000000000000000000000000000000000
      000000000000000000000000000042424200C67B6300CE846300D68C7300D68C
      7300D6846B00C67B63004A4A4A0000000000BD847B00B5A5A500FFFFFF00FFFF
      FF00FFFFFF00EFF7F700E7EFEF00CEE7E700A5CED60094C6CE0084BDC6007BB5
      C6006BADCE0073A5BD00A5848C00B57B7B0000000000D6B5B5009C8C9C005294
      BD00FFFFFF00FFFFFF00FFFFFF00F7FFFF00EFFFFF00EFFFFF00E7FFFF00D6EF
      F700B59C9C00DEBDB500CE9C9C00735A52000000000000000000BD7B7300FFA5
      1800FFA51800E7943900E7943900E7943900E79439008CD6FF00ADE7F700ADE7
      F700ADE7F7005A94F700A56B6B00000000000000000000000000000000000000
      000000000000000000000000000042424200D68C7300EF9C8400EFA58C00EFA5
      8C00EF9C8400DE947B006B6B6B003131310000000000C6737300BD949400A5DE
      DE008CFFFF007BDEEF0073D6E7006BDEE7006BDEE7006BDEEF006BDEEF006BDE
      FF0084BDD600B58C8C00C67B7B00000000000000000000000000BDADB500428C
      B500DEEFF700BDDEE7008CBDD60084B5CE00428CB500398CB500297BA5004273
      9C0073849C00CE9C9C00CE9C9C009C8C84000000000000000000CE847B00FFA5
      1800FFA51800FFA51800FFA51800E794390042BDEF008CD6FF008CD6FF008CD6
      FF005A94F7005A94F700A56B6B00000000000000000000000000000000000000
      00000000000000000000000000004A4A4A00EFA58C00FFB59C00FFBDAD00FFBD
      A500FFB59C00EFA58C008484840029292900000000000000000000000000B584
      840094B5BD0073EFFF006BF7FF0073EFFF0073EFFF006BF7FF0073E7FF009CAD
      B500BD848400000000000000000000000000000000000000000000000000317B
      A5004A7B9C00529CBD005ABDDE0073C6E7008CCEFF0094CEFF0094CEFF008CC6
      FF00B5A5BD00CE9C9C00BD9C9400000000000000000000000000D68C7B00FFA5
      1800FFA51800FFA51800E7943900E794390042BDEF00ADE7F700ADE7F700ADE7
      F7005A94F700ADE7F700A56B6B00000000000000000000000000000000000000
      000000000000000000000000000039393900EFA58C00FFCEBD00FFD6C600FFD6
      C600FFC6B500FFB59C0073737300313131000000000000000000000000000000
      0000C67B7B00AD9C9C0084D6E70073EFFF0073EFFF0084D6E700AD949C00C67B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000C6BDB500CE9C9C00A5E7EF0094EFFF0094DEFF0094DEFF009CCEF700BDA5
      B500C6949400C6ADA50000000000000000000000000000000000D68C7B00FFA5
      1800FFA51800FFA51800E794390042BDEF0042BDEF00ADE7F7005A94F700ADE7
      F7005A94F700ADE7F700A56B6B00000000000000000000000000000000000000
      00000000000000000000000000002929290063636300FFCEBD00FFEFE700FFEF
      E700FFD6C600EF9C840039394200000000000000000000000000000000000000
      00000000000000000000BD848400B5949400B5949400BD848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6BDB500CE9C9C00ADD6DE00A5DEE700ADC6D600CE9C9C00B594
      8C00C6BDB5000000000000000000000000000000000000000000D68C7B00FFA5
      1800FFA51800FFA51800E794390042BDEF00ADE7F700ADE7F7005A94F700ADE7
      F7005A94F700ADE7F700A56B6B00000000000000000000000000000000000000
      000000000000000000000000000000000000292929005A5A5A009C9CA500ADAD
      AD007B8484003939420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6BDB500D6ADAD00D6ADAD00D6B5B500C6BDB5000000
      0000000000000000000000000000000000000000000000000000D68C7300DEBD
      AD00EFCEAD00EFBDB500E7943900E7943900D6B5AD00D6B5AD00D6B5AD00D6B5
      AD00D6B5AD00D6B5AD00D6B5AD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000313131005252
      5200313131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001094CE001094CE001094CE001094CE001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400000000008484840084848400000000000000000000000000000000000000
      000042ADBD0042ADBD0042CEEF005ADEFF005ADEFF005ADEFF0042CEEF001094
      CE001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A844A004A844A004A84
      4A004A844A004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A00000000000000000000000000000000000000
      0000000000000000000000000000848484002929310029293100292931002929
      31008484840029293100C6C6C6000000000000000000000000000000000042AD
      BD0042CEEF009CE7FF009CE7FF009CE7FF00000000005ADEFF005ADEFF005ADE
      FF0042CEEF001094CE00000000000000000000000000FF630000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A000000000000000000004A844A006BCE84006BCE
      84006BCE84006BCE84006BCE84005ABD6B005ABD6B005ABD6B0052AD5A0052AD
      5A004AA552004AA552004A844A00000000000000000000000000000000000000
      000000000000000000008484840029293100C6C6C6008484840029293100C6C6
      C60029293100C6C6C600FFFFFF0084848400000000000000000042ADBD0042CE
      EF009CE7FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF005ADE
      FF005ADEFF0042CEEF001094CE000000000000000000FF630000D6520000D652
      0000D6520000D6520000D6520000D6520000D6520000D6520000D6520000D652
      0000D6520000D6520000BD4A000000000000000000004A844A006BCE84006BCE
      84006BCE84006BCE84006BCE84005ABD6B005ABD6B005ABD6B0052AD5A0052AD
      5A004AA552004AA552004A844A00000000000000000000000000000000000000
      0000000000008484840029293100C6C6C600FFFFFF00FFFFFF00848484000000
      0000C6C6C600FFFFFF002929310000000000000000000000000042ADBD00ADF7
      FF009CE7FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF009CE7
      FF005ADEFF005ADEFF001094CE000000000000000000FF630000D6520000D652
      0000D6520000D6520000D6520000D6520000D6520000D6520000D6520000D652
      0000D6520000D6520000BD4A000000000000000000004A844A004A844A004A84
      4A004A844A004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A00000000000000000000000000000000000000
      00008484840029293100C6C6C600FFFFFF00848484008484840000000000C6C6
      C600FFFFFF0029293100736B630000000000000000000000000042ADBD00ADF7
      FF00ADF7FF009CE7FF009CE7FF000000000000000000000000009CE7FF009CE7
      FF009CE7FF005ADEFF001094CE000000000000000000FF630000FF630000FF63
      0000FF630000FF630000FF630000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF630000FF630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840029293100C6C6C600FFFFFF00292931000000000000000000FFFFFF00FFFF
      FF0000000000736B63002929310000000000000000000000000042ADBD00ADF7
      FF00ADF7FF00ADF7FF009CE7FF008484840000000000848484009CE7FF009CE7
      FF009CE7FF005ADEFF001094CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A844A004A844A004A84
      4A004A844A004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A00000000000000000000000000000000002929
      3100C6C6C600FFFFFF0029293100000000000000000084848400C6C6C6002929
      3100FFFFFF00848484002929310000000000000000000000000042ADBD0042CE
      EF00ADF7FF00ADF7FF00ADF7FF00ADF7FF009CE7FF009CE7FF009CE7FF009CE7
      FF009CE7FF0042CEEF001094CE000000000000000000FF630000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A000000000000000000004A844A006BCE84006BCE
      84006BCE84006BCE84006BCE84005ABD6B005ABD6B005ABD6B0052AD5A0052AD
      5A004AA552004AA552004A844A0000000000000000000000000084848400C6C6
      C600FFFFFF002929310084848400848484000000000000000000848484002929
      3100FFFFFF0084848400736B63000000000000000000000000000000000042AD
      BD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042AD
      BD0042ADBD0042ADBD00000000000000000000000000FF630000D6520000D652
      0000D6520000D6520000D6520000D6520000D6520000D6520000D6520000D652
      0000D6520000D6520000BD4A000000000000000000004A844A004A844A004A84
      4A004A844A004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A0000000000000000000000000029293100FFFF
      FF0084848400292931000000000000000000848484008484840029293100C6C6
      C600FFFFFF00736B630000000000000000000000000000000000000000000000
      000042ADBD009CE7FF001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE0000000000000000000000000000000000FF630000FF630000FF63
      0000FF630000FF630000FF630000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF630000FF630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000029293100FFFF
      FF00C6C6C6000000000084848400848484000000000029293100C6C6C600FFFF
      FF00736B63000000000000000000000000000000000000000000000000000000
      000042ADBD009CE7FF001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A844A004A844A004A84
      4A004A844A004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A00000000000000000000000000000000008484
      840000000000C6C6C600FFFFFF000000000029293100C6C6C600FFFFFF00736B
      6300000000000000000000000000000000000000000000000000000000000000
      000042ADBD0042CEEF0042CEEF001094CE001094CE001094CE0042CEEF0042CE
      EF001094CE0000000000000000000000000000000000FF630000D6520000D652
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A000000000000000000004A844A004A844A004A84
      4A004A844A004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A00000000000000000000000000848484002929
      3100C6C6C600FFFFFF002929310029293100C6C6C600FFFFFF00736B63000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042ADBD0042CEEF009CE7FF009CE7FF009CE7FF0042CEEF001094
      CE000000000000000000000000000000000000000000FF630000FF630000FF63
      0000FF630000FF630000FF630000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF630000FF630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000029293100C6C6
      C600FFFFFF00736B6300C6C6C600FFFFFF00FFFFFF00736B6300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000042ADBD0042ADBD0042ADBD0042ADBD001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000000000FFFF
      FF00736B630000000000736B6300736B6300736B630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005284
      BD000000000000000000000000004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A004A844A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006331310063313100633131006331
      3100633131006331310063313100633131000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005284BD00C6E7
      FF005284BD0000000000000000004A844A006BCE84006BC6840063C67B005ABD
      6B0052B56B0052AD5A0052AD52004A844A000000000000000000000000004A84
      4A00000000000000000000000000FF630000D6520000D6520000BD4A0000BD4A
      0000BD4A0000BD4A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6840000FFFFDE00FFE7B500FF9C
      0000D6840000CE630000CE630000633131000000000000000000000000000000
      000000000000000000000000000000000000000000005284BD00CEE7FF0094DE
      FF007BCEFF005284BD00000000004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A004A844A0000000000000000004A844A0063E7
      63004A844A000000000000000000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF63000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6840000D6840000D684
      0000D6840000D684000063313100000000000000000000000000000000000000
      0000000000000000000000000000000000005284BD005284BD006BB5F70073CE
      FF0073ADE7005284BD005284BD00000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A844A0063E763006BCE
      84005ABD6B004A844A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5242005A5242007352
      4A0073524A0073524A0073524A0073524A0073524A0073524A0073524A007352
      4A0073524A0073524A00B58484000000000000000000D6840000FFFFFF006331
      3100633131009C9C9C0063313100CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000000000005284BD0073CE
      FF005284BD0000000000000000004A844A004A844A004A844A004A844A004A84
      4A004A844A000000000000000000000000004A844A004A844A006BCE840018C6
      18006BCE84004A844A004A844A00FF630000D6520000D6520000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A0000000000005A5242005A5242007352
      4A0073524A0073524A0073524A0073524A0073524A0073524A0073524A007352
      4A0073524A0073524A00B58484000000000000000000D6840000FFFFFF00FF9C
      0000D68400009C9C9C0063313100C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600CE63000000000000000000005284BD005284
      BD005284BD0000000000000000004A844A0063C67B005ABD6B0052AD5A004AA5
      52004A844A0000000000000000000000000000000000000000004A844A0018C6
      18004A844A000000000000000000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF630000FF630000FF630000000000005A5242005A5242007352
      4A0073524A0073524A0073524A0073524A0073524A0073524A0073524A007352
      4A0073524A0073524A00B5848400000000000000000000000000D6840000E7E7
      E700C6C6C60063313100FFFFFF00FFFFFF00FFE7B500FFCE9C00FFCE9C00FFCE
      9C00FFE7B500FFFFFF00C6C6C600CE6300000000000000000000000000000000
      00000000000000000000000000004A844A004A844A004A844A004A844A004A84
      4A004A844A0000000000000000000000000000000000000000004A844A004A84
      4A004A844A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D684
      000063313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000D6520000D6520000BD4A0000BD4A
      0000BD4A0000BD4A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6840000E7E7
      E7006331310063313100FFFFFF00FFFFFF00EFBD7B00EFBD7B00FFFFFF00EFBD
      7B00EFBD7B00FFFFFF00C6C6C600CE6300000000000000000000000000000000
      00000000000000000000000000004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A004A844A000000000000000000000000000000
      0000000000000000000000000000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF6300000000000000000000000000005A5242005A5242007352
      4A0073524A0073524A0073524A0073524A0073524A0073524A0073524A007352
      4A0073524A0073524A00B58484000000000000000000D6840000FFFFFF00FF9C
      0000633131009C9C9C0063313100FFFFFF00F7D6B500DE9C3900FFFFFF00F7D6
      B500DE9C3900FFFFFF00C6C6C600CE63000000000000000000005284BD005284
      BD005284BD0000000000000000004A844A006BCE84006BC6840063C67B005ABD
      6B0052B56B0052AD5A0052AD52004A8C4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5242005A5242007352
      4A0073524A0073524A0073524A0073524A0073524A0073524A0073524A007352
      4A0073524A0073524A00B58484000000000000000000D6840000FFFFFF00E7E7
      E700C6C6C6009C9C9C0063313100FFFFFF00EFBD7B00EFBD7B00FFFFFF00EFBD
      7B00EFBD7B00FFFFFF00C6C6C600CE63000000000000000000005284BD0073CE
      FF005284BD0000000000000000004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A004A844A0000000000000000004A844A004A84
      4A004A844A000000000000000000FF630000D6520000D6520000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063313100633131006331
      3100633131006331310063313100FFFFFF00F7D6B500DE9C3900FFFFFF00F7D6
      B500DE9C3900FFFFFF00C6C6C600CE6300005284BD005284BD006BB5F70073CE
      FF0073ADE7005284BD005284BD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A844A0018C6
      18004A844A000000000000000000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF630000FF630000FF6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6840000FFFFDE00FFE7B500FF9C
      0000D6840000CE630000CE63000063313100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600CE630000000000005284BD00CEE7FF0094DE
      FF007BCEFF005284BD00000000004A844A004A844A004A844A004A844A004A84
      4A004A844A000000000000000000000000004A844A004A844A006BCE840018C6
      18005ABD6B004A844A004A844A00000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5242005A5242007352
      4A0073524A0073524A0073524A0073524A0073524A0073524A0073524A007352
      4A0073524A0073524A00B584840000000000D6840000D6840000D6840000D684
      0000D6840000D6840000D684000063313100C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600CE63000000000000000000005284BD00C6E7
      FF005284BD0000000000000000004A844A0063C67B005ABD6B0052AD5A004AA5
      52004A844A00000000000000000000000000000000004A844A0063E763006BCE
      84006BCE84004A844A0000000000FF630000D6520000D6520000BD4A0000BD4A
      0000BD4A0000BD4A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000005284
      BD000000000000000000000000004A844A004A844A004A844A004A844A004A84
      4A004A844A0000000000000000000000000000000000000000004A844A0063E7
      63004A844A000000000000000000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF63000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6731000D6731000D6731000D6731000D6731000D6731000D6731000D673
      1000D6731000D6731000D6731000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A84
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000635A5200635A52006B5A52000000
      0000736B6300524A4200635A5200000000000000000000000000000000000000
      00000000000000000000000000000818BD00426BF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000004A
      7B00004A7B00004A7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000524A4A00D68C8C00947373007B6B
      6B00946B6B00DE84840042393900000000000000000000000000000000000000
      00000000000000000000000000000018C6000021C600426BF700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A7B0042BD
      FF0042BDFF00004A7B00004A7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084636300EF9C9C00FFAD
      AD00AD7373005A4A4A0000395A00000000000000000000000000000000000000
      00000000000000000000000000000010C6001029D6000018BD00426BF7000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004A7B0042BDFF001894
      F70084FFFF0042BDFF00004A7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000395A0084737300DE94
      94004A39390042BDFF0000395A00000000000000000000000000000000000000
      00000000000000000000000000001018BD000018CE001031D6000021C600426B
      F700000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004A7B0042BDFF001894F70084FF
      FF00007BCE0084FFFF00004A7B000000000000000000EFAD4A00EFAD4200EFA5
      4200EFA54200EFA54200EFA54200EFA54200EFA54200EFA54200EFA54200EFA5
      4200EFA54200EFA53900A57B4200000000000000000000000000000000000000
      00000000000000000000000000000000000000395A0042BDFF00736B6300DE94
      94003121180084FFFF0000395A00000000006B63C600424ABD00424ABD004A4A
      BD001021BD000010B5000010BD000010C6000018D6000018D600527BEF000021
      C600426BF7000000000000000000000000000000000000000000000000000000
      00000000000000000000004A7B004A73C6004A73C6001894F70084FFFF00007B
      CE0084FFFF00004A7B00000000000000000000000000EFAD4A00FFBD6300FFBD
      6300FFBD6300FFBD6300FFBD6300FFBD6300FFBD6300FFBD6300FFBD6300FFBD
      6300FFBD6300FFB55200A5844200000000000000000000000000000000000000
      0000000000000000000000395A0000395A0042BDFF001894F7007B737300DE9C
      9C004A42390000395A0000000000000000000008AD003939B5000008A5000008
      9C000008A5000010B5000010C6000018BD000018CE000021CE001031E700527B
      EF000021C600426BF70000000000000000000000000000000000004A7B00004A
      7B00004A7B00004A7B0042BDFF0000FFFF004A73C6004A73C600007BCE0084FF
      FF00004A7B0000000000000000000000000000000000EFAD4A00FFBD6300FFBD
      6300FFCE8400FFDEB500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFCE8C00FFBD
      6300FFBD6300FFB55200A57B420000000000000000000000000000395A000039
      5A0000395A0000395A0042BDFF0042BDFF001894F70084FFFF007B737300DE9C
      9C005A4A4A000000000000000000000000000008AD0000009C000008A5000000
      A5000010AD000008B5000010C6000018C6000018CE000021D6000029DE000021
      E700527BEF000021C600426BF7000000000000000000004A7B0042BDFF0042BD
      FF0042BDFF0042BDFF001894F700319CFF0000FFFF004A73C6004A73C6004A73
      C6000000000000000000000000000000000000000000EFAD4A00FFBD6300FFBD
      6300FFBD6300FFBD6300FFBD6300FFBD6300FFBD6300FFBD6300FFBD6300FFBD
      6300FFBD6300FFB55200A5844200000000000000000000395A0042BDFF0042BD
      FF0042BDFF0042BDFF001894F7001894F70084FFFF00007BCE007B737300DEAD
      AD005A4A4A000000000000000000000000000008AD003939B5000800A5000808
      9C000008AD000010B5000010BD000018C6000018CE000021D6000021DE000029
      EF00214AEF005273FF000021C600426BF700004A7B0042BDFF0063FFFF0063FF
      FF0063FFFF0063FFFF0042BDFF0084FFFF00319CFF008CFFFF0000FFFF004A73
      C6004A73C60000000000000000000000000000000000EFAD4A00FFBD6300FFFF
      FF00FFCE8C00FFFFFF00FFCE8C00FFFFFF00FFCE8C00FFFFFF00FFCE8C00FFFF
      FF00FFCE8C00FFB55200A57B420000000000004A7B0042BDFF0063FFFF0063FF
      FF0063FFFF0063FFFF0042BDFF0084FFFF00007BCE0084FFFF007B737300DEB5
      B5005A4A4A000000000000000000000000000008AD0000009C000000A5000008
      A5000008AD000008B5000010BD000018C6000018CE000021CE000821E7000021
      E7001042E700527BEF000021C600426BF700004A7B0063FFFF0063FFFF0084FF
      FF0084FFFF0063FFFF004A73C6004A73C6004A73C6004A73C6008CFFFF0000FF
      FF004A73C6004A73C600000000000000000000000000EFAD4A00FFBD6300FFBD
      6300FFBD6300FFBD6300FFBD6300FFBD6300FFBD6300FFBD6300FFBD6300FFBD
      6300FFBD6300FFBD6300A57B420000000000004A7B0063FFFF0063FFFF0084FF
      FF0084FFFF0063FFFF0063FFFF0042BDFF0084FFFF0000395A007B7B7300DEB5
      B5005A4A4A000000000000000000000000000008AD0000009C000808A5000008
      A5000008AD000010B5000010BD000018C6000018CE000021D6000021D6000821
      E700426BF7000021C600426BF70000000000004A7B0084FFFF0084FFFF0084FF
      FF0084FFFF0084FFFF00319CFF008CFFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF004A73C6004A73C6000000000000000000EFAD4A00FFBD6300FFFF
      FF00FFD69400FFFFFF00FFD69400FFFFFF00FFD69400FFFFFF00FFD69C00FFFF
      FF00FFDEA500FFBD5A00A584420000000000004A7B0084FFFF0084FFFF0084FF
      FF0084FFFF0084FFFF0084FFFF004AFFFF001894F70000395A007B7B7B00DEBD
      BD005A4A4A000000000000000000000000000008AD003939B5000800A5000808
      A5000010AD000008AD000010BD000018C6000018CE000021D6001031D600527B
      EF000021C600426BF7000000000000000000004A7B0084FFFF0084FFFF001894
      F70084FFFF0084FFFF0084FFFF00319CFF008CFFFF0000FFFF004A73C6004A73
      C6000000000000000000000000000000000000000000EFA53900FFBD6300FFBD
      6300FFBD5A00FFBD6300FFBD5A00FFBD6300FFBD5A00FFBD5A00FFBD5A00FFBD
      5A00FFBD6300F7AD4200B58C420000000000004A7B0084FFFF0084FFFF001894
      F70084FFFF0084FFFF0084FFFF004AFFFF004AFFFF0000395A007B7B7B00DEBD
      BD00524A4200000000000000000000000000736BBD00424ABD00424ABD00424A
      BD001021BD000810BD000010BD000018C6000021CE000021D600527BEF000018
      BD00426BF700000000000000000000000000004A7B0084FFFF00ADCEE70042BD
      FF00007BCE0084FFFF0084FFFF0084FFFF00319CFF008CFFFF0000FFFF004A73
      C6004A73C60000000000000000000000000000000000EFAD5200DE841000DE7B
      0800DE7B0800DE7B0800DE7B0800DE7B0800DE7B0800DE7B0800DE7B0800DE7B
      0800DE7B0800DE841000B594630000000000004A7B0084FFFF00ADCEE70042BD
      FF00007BCE0084FFFF0084FFFF0084FFFF004AFFFF00524A42007B737300DEC6
      C60042393100635A520000000000000000000000000000000000000000000000
      00000000000000000000000000000818BD000818D6000829D6000021C600426B
      F70000000000000000000000000000000000004A7B0084FFFF0084FFFF00ADCE
      E70084FFFF0084FFFF0084FFFF0063FFFF00319CFF008CFFFF0000FFFF0000FF
      FF004A73C6004A73C60000000000000000000000000000000000CE6B0000CE6B
      0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B
      0000CE6B0000CE6B00000000000000000000004A7B0084FFFF0084FFFF00ADCE
      E70084FFFF0084FFFF0084FFFF0063FFFF007B848400524A4A008C848400FFE7
      E700524A4A004A42390063524A00000000000000000000000000000000000000
      00000000000000000000000000000021C6000021CE000018BD00426BF7000000
      00000000000000000000000000000000000000000000004A7B0063FFFF0063FF
      FF0063FFFF0063FFFF0063FFFF0063FFFF00004A7B00319CFF008CFFFF0000FF
      FF0000FFFF004A73C6004A73C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004A7B0063FFFF0063FF
      FF0063FFFF0063FFFF0063FFFF0063FFFF007B848400EFEFEF00D6C6C600635A
      5A00DEC6C600FFE7E70042424200000000000000000000000000000000000000
      00000000000000000000000000000021C6000021C600426BF700000000000000
      0000000000000000000000000000000000000000000000000000004A7B00004A
      7B00004A7B00004A7B00004A7B00004A7B000000000000000000319CFF008CFF
      FF0000FFFF0000FFFF004A73C6004A73C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A7B000039
      5A0000395A0000395A0000395A0000395A00635A5A007B8484008C8484000000
      00007B8484008C8484008C848400000000000000000000000000000000000000
      00000000000000000000000000000810BD00426BF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6847300B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6A59C00FFFFEF00FFFFEF00FFFF
      EF00FFFFEF00FFF7DE00FFF7DE00FFF7DE00FFF7DE00FFEFD600FFEFD600FFEF
      D600FFDEB500FFDEB500FFD6A500B58484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000852
      8400085284000852840000000000000000000000000000000000000000000000
      00000000000000000000A5947B00AD847B009C636300BD734A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6A59C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFEF00FFFFEF00FFFFEF00FFF7DE00FFF7DE00FFEF
      D600FFEFD600FFEFD600FFDEB500B58484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000085284004ABD
      FF004ABDFF000852840008528400000000000000000000000000000000000000
      000000000000A57B6300BD633900C6634200C66342009C52420084736B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6ADA500FFFFFF00FFFFFF00FFFF
      FF00E7CECE0094313100943131009431310094313100E7CEBD00FFF7DE00FFF7
      DE00FFEFD600FFEFD600FFEFD600B58484000000000000000000000000000000
      00000000000000000000000000000000000000000000085284004ABDFF00299C
      EF008CF7FF004ABDFF0008528400000000000000000000000000000000000000
      0000BD734A00C65A1800A54218008C522100B5421800BD522900CE6339008442
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6ADA500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700B56B6B0094313100CE9C9C00FFFFFF00FFFFEF00FFFF
      EF00FFF7DE00FFEFD600FFEFD600B58484000000000000000000000000000000
      000000000000000000000000000000000000085284004ABDFF00299CEF008CF7
      FF001084CE008CF7FF000852840000000000000000000000000000000000BD73
      4A00BD521000A5390000AD420000316300006B4A0000AD390000A5390800BD5A
      3900735242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      000000000000000000000000000000000000D6B5AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7CECE0094313100AD636300FFFFFF00FFFFFF00FFFF
      EF00FFFFEF00FFF7DE00FFEFD600B58484000000000000000000000000000000
      0000000000000000000008528400085284004ABDFF00299CEF008CF7FF001084
      CE008CF7FF000852840000000000000000000000000000000000BD734A009C52
      4200AD420000CE5A0000BD6B0000007B000021730000C65A0000B54A00007363
      2100845A31007352420000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6B5AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009C39390094313100F7F7F700FFFFFF00FFFF
      FF00FFFFEF00FFF7DE00FFEFD600B58484000000000000000000085284000852
      840008528400085284004ABDFF004ABDFF00299CEF008CF7FF001084CE008CF7
      FF00085284000000000000000000000000000000000000000000BD734A009C52
      4200CE5A0000D67B0000848C000039940000C6840000BD7B000021730000086B
      0800636B2900BD734A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      000000000000000000000000000000000000D6BDB500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BD7B7B0094313100DEB5B500FFFFFF00FFFF
      FF00FFFFEF00FFFFEF00FFF7DE00B584840000000000085284004ABDFF004ABD
      FF004ABDFF004ABDFF00299CEF00299CEF008CF7FF001084CE008CF7FF000852
      8400000000000000000000000000000000000000000000000000BD734A009C52
      4200C673000029A5180031AD2100D6AD1800FF9C0800E78C0000318400000073
      0000426B1000636B290000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000000000000000000000000000D6BDB500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEB5B50094313100BD7B7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFEF00FFF7DE00B5848400085284004ABDFF006BF7FF006BF7
      FF006BF7FF006BF7FF004ABDFF008CF7FF001084CE008CF7FF00085284000000
      00000000000000000000000000000000000000000000000000009C524200BD73
      4A007B94080010C64A0031CE63007BCE6B00FFCE5A00FFA510006B8C00000084
      0000296B0000296B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      000000000000000000000000000000000000D6BDB500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700943131009C393900FFF7F700FFFF
      FF00FFFFFF00FFFFEF00FFF7DE00B5848400085284006BF7FF006BF7FF008CF7
      FF008CF7FF006BF7FF006BF7FF004ABDFF008CF7FF0008528400000000000000
      0000000000000000000000000000000000000000000000000000A5947B00BD73
      4A0031BD390042D67300A5E79C00A5F7B500D6E79400D6B52900B58C00003184
      00005A7B2900A5947B0000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      000000000000000000000000000000000000E7C6B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B56B6B0094313100E7CECE00FFFF
      FF00FFFFFF00FFFFFF00FFFFEF00B5848400085284008CF7FF008CF7FF008CF7
      FF008CF7FF008CF7FF008CF7FF0052F7FF00299CEF0008528400000000000000
      000000000000000000000000000000000000000000000000000000000000A594
      7B0084C6730063DE7B00BDF7AD00D6FFBD005ADE840039B53100F78C0000C684
      0800A5947B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000000000000000000000000000000000E7C6B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE9C9C0094313100B56B6B00F7F7
      F700FFFFFF00FFFFFF00FFFFEF00B5848400085284008CF7FF008CF7FF00299C
      EF008CF7FF008CF7FF008CF7FF0052F7FF0052F7FF0008528400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5947B00ADC68C00A5D6840094DE8C0052CE63004AB53900D69C4200A594
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7C6B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7CECE009431310094313100943131009431
      3100F7E7E700FFFFFF00FFFFEF00B5848400085284008CF7FF00ADCEE7004ABD
      FF001084CE008CF7FF008CF7FF008CF7FF0052F7FF0008528400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5947B00A5947B00AD847B00A5947B00A5947B00A5947B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7C6B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFEF00B5848400085284008CF7FF008CF7FF00ADCE
      E7008CF7FF008CF7FF008CF7FF006BF7FF0052F7FF0008528400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7C6B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFEF00C684730000000000085284006BF7FF006BF7
      FF006BF7FF006BF7FF006BF7FF006BF7FF000852840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7C6B500E7C6B500E7C6
      B500E7C6B500E7C6B500E7C6B500D6BDB500D6BDB500D6B5AD00D6B5AD00C6AD
      A500C6ADA500C6A59C00C6A59C00000000000000000000000000085284000852
      8400085284000852840008528400085284000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E7C6B500E7C6B500E7C6B500D6BDAD00000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFE7
      D600FFE7D600FFE7D600F7DEC600F7DEC600F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B5848400000000000000000000000000C6A59C00FFE7
      D600FFE7D600FFE7D600F7DEC600F7DEC600F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B5848400000000000000000052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200000000000000000000000000000000000000
      000000000000E7C6B500F7E7E700CED6D600CED6D600F7E7E700D6BDAD000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600FFC67300FFC67300FFC67300FFC67300FFC67300EFB57300EFB57300EFA5
      4A00EFA54A00EFCE9C00B5848400000000000000000000000000C6A59C00FFEF
      D600FFC67300FFC67300FFC67300FFC67300FFC67300EFB57300EFB57300EFA5
      4A00EFA54A00EFCE9C00B5848400000000000000000052525200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0052525200000000000000000000000000000000000000
      0000E7C6B500F7E7E700FFFFFF00D6845A00C66B5200BDBDBD00F7E7E700D6BD
      AD00000000000000000000000000000000000000000000000000C6ADA500FFEF
      E700FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFE7
      D600FFE7D600EFCE9C00B5848400000000000000000000000000C6ADA500FFEF
      E70018AD2900007308000073080000730800FFE7D600FFE7D600FFE7D600FFE7
      D600FFE7D600EFCE9C00B584840000000000000000005A5A5A00F7F7F7009C5A
      2900A5633900B5732900B5732900B5732900B5732900A5633900A56339009C5A
      29009C5A2900F7F7F7005A5A5A0000000000000000000000000000000000E7C6
      B500F7E7E700FFFFFF00D6845A00C66B5200BD6B4A00C66B5200BDBDBD00F7E7
      E700D6BDAD000000000000000000000000000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEC600F7D6B500F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B5848400000000000000000000000000C6ADA500FFF7
      E700F7E7D60018AD29005AE78C00088C1000F7DEC600F7D6B500F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B5848400000000000000000063636300F7F7F700BD7B
      4A00B5732900BD7B4A00BD7B4A00BD7B4A00BD7B4A00B5732900A56339009C5A
      2900DE9C7300F7F7F70063636300000000000000000000000000E7C6B500F7E7
      E700FFFFFF00D6845A00C66B5200FFEFE700FFEFE700FFE7D600BD6B4A00BDBD
      BD00F7E7E700D6BDAD0000000000000000000000000000000000CEB5AD00FFFF
      F700FFC67300FFC67300FFC67300FFC67300FFC67300EFB57300EFB57300EFA5
      4A00EFA54A00EFCE9C00B5848400000000000000000000000000CEB5AD00FFFF
      F700FFC67300088C100018AD2900088C1000FFC67300EFB57300EFB57300EFA5
      4A00EFA54A00EFCE9C00B58484000000000000000000636B6B00EFEFEF00F7E7
      D600E7A57300E7944A0094736B005A6B7300AD7B5A00BD7B4A00B5732900DE9C
      7300EFEFEF00EFEFEF00636B6B000000000000000000E7C6B500F7E7E700FFFF
      FF00D6845A00C66B5200C66B5200C66B5200FFEFE700C66B5200C66B5200BD6B
      4A00BDBDBD00F7E7E700D6BDAD00000000000000000000000000D6B5AD00FFFF
      FF00FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFE7
      D600FFE7D600F7D6A500B584840000000000C6A59C00B5848400B5848400B584
      840000730800088C1000B584840018AD2900FFE7D600FFE7D600FFE7D600FFE7
      D600FFE7D600F7D6A500B584840000000000000000006B737300EFEFEF00FFFF
      FF00FFF7F700BDADA5006B848C004A6B9C006B6B8C00B5946B00E7CEB500FFF7
      F700FFFFFF00EFEFEF006B7373000000000000000000EFD6C600FFFFFF00D684
      5A00CE7B5200C66B5200C66B5200C66B5200FFEFE700C66B5200C66B5200C66B
      5200BD6B4A00BDBDBD00D6BDAD000000000000000000005A0000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE00F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7D6B500F7D6AD00B584840000000000C6A59C00FFF7E700FFF7E700FFF7
      E700088C1000FFF7E700B5848400F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7D6B500F7D6AD00B584840000000000005A000073737300E7E7E700FFFF
      FF00D6DEDE006B6B8C004A6B9C007B94C6007B94C6008CB5C600FFFFFF00FFFF
      FF00FFFFFF00E7E7E700737373000000000000000000EFD6C600FFFFFF00FFE7
      CE00E7A57300CE7B5200C66B5200C66B5200FFEFE700C66B5200C66B5200C66B
      5200D6845A00CED6D600D6BDAD00000000000000000000730800005A0000FFFF
      FF00FFC67300FFC67300FFC67300FFC67300FFC67300EFB57300EFB57300EFA5
      4A00EFA54A00F7DEB500B584840000000000C6ADA500FFC67300EFB57300EFB5
      7300088C1000EFA54A00B5848400FFC67300FFC67300EFB57300EFB57300EFA5
      4A00EFA54A00F7DEB500B58484000000000000730800005A0000E7E7E700F7F7
      F700ADB5CE007B94C6007B94C6008CB5C6007B94C6007B94C600E7E7E700FFFF
      FF00FFFFFF00E7E7E7007B7B7B000000000000000000E7C6B500F7E7E700FFFF
      FF00FFE7CE00E7A57300CE7B5200FFEFE700FFEFE700C66B5200C66B5200D684
      5A00E7EFEF00F7E7E700D6BDAD0000000000000000000073080000730800005A
      0000FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFE7
      D600FFE7D600F7D6B500B584840000000000C6ADA500FFFFF700FFF7E700FFF7
      E700FFF7E700FFF7E700B5848400FFE7D600FFE7D600FFE7D600FFE7D600FFE7
      D600FFE7D600F7D6B500B5848400000000000073080000730800005A0000FFFF
      FF00CECEDE00739CAD00949C9C00ADCEE700ADB5CE00293184006B6B8C00FFFF
      FF00FFFFFF00E7E7E7009C848400000000000000000000000000E7C6B500F7E7
      E700FFFFFF00FFE7CE00E7A57300CE7B5200E7AD8400C66B5200D6845A00FFFF
      FF00F7E7E700E7C6B50000000000000000000000000008841000008C0800008C
      0800FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700F7DEC600F7DEC600FFEF
      D600E7DEC600C6BDAD00B584840000000000CEB5AD00FFC67300EFB57300EFB5
      7300EFB57300EFA54A00B5848400FFF7F700FFEFE700F7DEC600F7DEC600FFEF
      D600E7DEC600C6BDAD00B58484000000000008841000008C0800008C0800FFFF
      FF00E7E7E700ADCEE700ADB5CE007B94C600394A940000007B00394A9400FFFF
      FF00FFFFFF00DEDEDE008C8C8C0000000000000000000000000000000000E7C6
      B500F7E7E700FFFFFF00FFE7CE00E7A57300FFEFE700D6845A00FFFFFF00F7E7
      E700E7C6B50000000000000000000000000000000000008C0800008C0800FFFF
      FF00FFC67300FFC67300EFB57300EFB57300EFA54A00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B584840000000000CEB5AD00FFFFF700FFFFF700FFFF
      F700FFF7E700FFF7E700B5848400EFB57300EFA54A00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B584840000000000008C0800008C0800DEDEDE00FFFF
      FF00ADB5CE003139BD003139BD000008A5000008A5000008A5007B94C600FFFF
      FF00FFFFFF00DEDEDE008C8C8C00000000000000000000000000000000000000
      0000E7C6B500F7E7E700FFFFFF00FFE7CE00D6845A00FFFFFF00F7E7E700E7C6
      B5000000000000000000000000000000000000000000008C0800E7C6B500FFFF
      FF00FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B0000000000D6BDB500FFC67300EFB57300EFB5
      7300EFB57300EFA54A00B5848400FFE7D600FFE7D600FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B0000000000008C08008C8C8C00DEDEDE00FFFF
      FF00CEDEEF003139BD000008A5000008A5000008A5003139BD00EFEFEF00FFFF
      FF00FFFFFF00DEDEDE008C8C8C00000000000000000000000000000000000000
      000000000000E7C6B500F7E7E700FFFFFF00FFFFFF00F7E7E700E7C6B5000000
      0000000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE9473000000000000000000D6BDB500FFFFF700FFFFF700FFFF
      F700FFFFF700FFF7E700B5848400FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE9473000000000000000000000000008C8C8C00DEDEDE00FFFF
      FF00FFFFFF00ADB5CE003139BD000010E7003139BD00ADB5CE00FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00AD8C8C00000000000000000000000000000000000000
      00000000000000000000E7C6B500E7C6B500E7C6B500E7C6B500000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C8400000000000000000000000000D6BDB500D6BDB500D6BDB500D6BD
      B500D6BDB500D6BDB500D6BDB500FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000094949400DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE0094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000094949400949494009494
      9400949494009494940094949400949494009494940094949400949494009494
      9400949494009494940094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005294520052945200529452005294
      5200529452005294520052945200529452005294520052945200529452005294
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A54A1000A54A100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000094633900734A290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005294520052945200529452005294
      5200529452005294520052945200529452005294520052945200529452005294
      5200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A54A1000FFFFFF00FFFFFF00A54A1000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFEFD600734A2900734A2900000000000000000000000000000000000000
      000000000000000000000000000000000000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A54A1000FFFFFF00AD633100AD633100FFFFFF00A54A10000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFEFE700CEAD8C00734A2900734A29000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F739FF00000000005284BD000000
      00000000000000000000000000004A844A004A844A004A844A004A844A004A84
      4A004A844A000000000000000000000000000000000000000000000000000000
      0000A54A1000FFFFFF00AD633100AD633100AD633100AD633100FFFFFF00A54A
      1000000000000000000000000000000000000000000000000000000000000000
      0000FFEFE700FFE7CE00CEAD8C00734A2900734A2900734A2900734A2900734A
      29000000000000000000000000000000000000000000000000004A844A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005284BD005284
      BD000000000000000000000000004A844A0063C67B005ABD6B0052AD5A004AA5
      52004A844A00000000000000000000000000000000000000000000000000A54A
      1000FFFFFF00AD633100AD633100FFFFFF00FFFFFF00FFFFFF00AD633100FFFF
      FF00A54A1000000000000000000000000000000000000000000094633900734A
      2900FFE7CE00FFEFD600FFEFD600FFDEB500FFDEB500FFE7CE00CEAD8C009463
      3900734A2900734A2900000000000000000000000000000000004A844A004A84
      4A00000000000000000000000000FF630000D6520000D6520000BD4A0000BD4A
      0000BD4A00000000000000000000000000005284BD005284BD0063ADF7006BB5
      FF005284BD0000000000000000004A844A004A844A004A844A004A844A004A84
      4A004A844A000000000000000000000000000000000000000000A54A1000FFFF
      FF00AD633100AD633100AD633100AD633100FFFFFF00AD633100AD633100AD63
      3100FFFFFF00A54A100000000000000000000000000094633900E7C6AD00E7C6
      AD00FFE7CE00FFEFD600946342008C392100B54A1000B5633900FFE7CE00FFDE
      B500CEAD8C00734A2900734A2900000000004A844A004A844A005ABD6B006BCE
      84004A844A000000000000000000FF630000FF630000FF630000FF630000FF63
      0000FF6300000000000000000000000000005284BD00B5FFFF0094D6FF0073BD
      FF0063A5F7005284BD0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A54A1000FFFFFF00AD63
      3100AD633100AD633100AD633100AD633100FFFFFF00AD633100AD633100AD63
      3100AD633100FFFFFF00A54A10000000000094633900E7C6AD00FFE7CE00FFEF
      E700FFEFD600FFEFD600FFEFD6008C3921008C210000FFEFD600FFEFD600FFE7
      CE00FFDEB500CEAD8C00734A2900734A29004A844A0063E7630063E763006BCE
      840018C618004A844A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005284BD005284BD0094BDE70084C6
      FF005284BD0000000000000000004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A004A844A0000000000A54A1000FFFFFF00AD63
      3100AD633100AD633100AD633100AD633100FFFFFF00AD633100AD633100AD63
      3100AD633100FFFFFF00A54A100000000000E7C6AD00FFE7CE00FFEFE700FFEF
      D600FFEFD600FFEFD600FFEFD6008C3921008C210000FFEFD600FFEFD600FFEF
      D600FFE7CE00FFDEB500CEAD8C00734A29004A844A004A844A006BCE840018C6
      18004A844A000000000000000000FF630000D6520000D6520000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A000000000000000000005284BD005284
      BD000000000000000000000000004A844A006BCE84006BC6840063C67B005ABD
      6B0052B56B0052AD5A0052AD52004A8C4A000000000000000000A54A1000FFFF
      FF00AD633100AD633100AD633100FFFFFF00FFFFFF00AD633100AD633100AD63
      3100FFFFFF00A54A10000000000000000000FFF7EF00FFEFE700FFEFE700FFEF
      D600FFEFD600FFEFD600842910008C3921008C210000FFEFD600FFEFD600FFEF
      D600FFEFD600FFE7CE00FFE7CE00734A290000000000000000004A844A004A84
      4A00000000000000000000000000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF630000FF630000FF63000000000000000000005284BD000000
      00000000000000000000000000004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A004A844A00000000000000000000000000A54A
      1000FFFFFF00AD633100AD633100AD633100AD633100AD633100AD633100FFFF
      FF00A54A1000000000000000000000000000FFF7EF00FFF7EF00FFEFE700FFEF
      E700FFEFD600FFEFD60094634200842910006B180000FFEFD600FFEFD600FFEF
      D600FFEFD600FFE7CE00FFE7CE00734A290000000000000000004A844A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A54A1000FFFFFF00AD633100F7E7DE00FFFFFF00AD633100FFFFFF00A54A
      100000000000000000000000000000000000FFE7CE00FFF7EF00FFF7EF00FFEF
      E700FFEFE700FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFE7CE00FFF7EF00CEAD8C00946339000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005294520052945200529452005294
      5200529452005294520052945200529452005294520052945200529452005294
      5200000000000000000000000000000000000000000000000000000000000000
      000000000000A54A1000FFFFFF00AD633100AD633100FFFFFF00A54A10000000
      00000000000000000000000000000000000000000000FFE7CE00FFF7EF00FFF7
      EF00FFEFE700FFEFE700FFEFE7009C422100CE734200FFEFD600FFEFD600FFE7
      CE00FFF7EF00CEAD8C009463390000000000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A00000000000000000000000000005294520052945200529452005294
      5200529452005294520052945200529452005294520052945200529452005294
      5200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A54A1000FFFFFF00FFFFFF00A54A1000000000000000
      0000000000000000000000000000000000000000000000000000FFE7CE00FFFF
      FF00FFF7EF00FFF7EF00FFF7EF008400000084000000FFEFD600FFE7CE00FFEF
      D600CEAD8C009463390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A54A1000A54A100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFE7CE00FFF7EF00FFF7EF00FFEFD600FFEFD600FFDEB500CEAD8C009463
      3900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005A5242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005294520052945200529452005294
      5200529452005294520052945200529452005294520052945200529452005294
      5200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005A5242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005294520052945200529452005294
      5200529452005294520052945200529452005294520052945200529452005294
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5242007352
      4A0073524A00B5848400000000005A52420073524A0000000000000000000000
      000000000000000000000000000000000000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5242007352
      4A0073524A00B5848400000000005A524200B584840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005284
      BD000000000000000000000000004A844A004A844A004A844A004A844A004A84
      4A004A844A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5242007352
      4A0073524A00B5848400000000005A5242005A52420073524A0073524A007352
      4A0073524A0073524A0073524A00B58484000000000000000000000000004A84
      4A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005284BD005284
      BD000000000000000000000000004A844A0063C67B005ABD6B0052AD5A004AA5
      52004A844A0000000000000000000000000000000000000000005A5242007352
      4A0073524A00B5848400000000005A5242005A52420073524A0073524A007352
      4A0073524A0073524A0073524A00B58484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A844A004A84
      4A00000000000000000000000000FF630000D6520000D6520000BD4A0000BD4A
      0000BD4A0000000000000000000000000000000000005284BD007BCEFF006BB5
      F7005284BD005284BD00000000004A844A004A844A004A844A004A844A004A84
      4A004A844A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000007308000000
      00000000000000000000000000005A5242005A52420073524A0073524A007352
      4A00B5848400000000000000000000000000000000004A844A005ABD6B006BCE
      84004A844A004A844A0000000000FF630000FF630000FF630000FF630000FF63
      0000FF6300000000000000000000000000005284BD00C6E7FF0094DEFF0073CE
      FF0073CEFF005284BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000007308000000
      00000000000000000000000000005A5242005A52420073524A0073524A007352
      4A00B58484000000000000000000000000000000000000730800007308000000
      00000000000000000000000000005A5242005A52420073524A0073524A007352
      4A00B58484000000000000000000000000004A844A0063E763006BCE840018C6
      180018C618004A844A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005284BD00CEE7FF0073AD
      E7005284BD005284BD00000000004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A004A844A000000000000000000007308000073
      08000000000000000000000000005A5242005A52420073524A0073524A007352
      4A00B5848400000000000000000000000000008C0800008C0800007308000073
      0800007308000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A844A0063E763006BCE
      84004A844A004A844A0000000000FF630000D6520000D6520000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A000000000000000000005284BD005284
      BD000000000000000000000000004A844A006BCE84006BC6840063C67B005ABD
      6B0052B56B0052AD5A0052AD52004A8C4A00007308000073080000730800008C
      0800008C08000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000008C0800008C08000000
      00000000000000000000000000005A5242005A52420073524A0073524A007352
      4A0073524A0073524A0073524A00B584840000000000000000004A844A004A84
      4A00000000000000000000000000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF630000FF630000FF6300000000000000000000000000005284
      BD000000000000000000000000004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A004A844A000000000000000000008C0800008C
      08000000000000000000000000005A5242005A52420073524A0073524A007352
      4A0073524A0073524A0073524A00B58484000000000000000000008C08000000
      00000000000000000000000000005A5242005A52420073524A0073524A007352
      4A0073524A0073524A0073524A00B58484000000000000000000000000004A84
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008C08000000
      00000000000000000000000000005A5242005A52420073524A0073524A007352
      4A0073524A0073524A0073524A00B58484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005294520052945200529452005294
      5200529452005294520052945200529452005294520052945200529452005294
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5242007352
      4A0073524A00B5848400000000005A5242005A52420073524A0073524A007352
      4A0073524A0073524A0073524A00B5848400BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A00000000000000000000000000005294520052945200529452005294
      5200529452005294520052945200529452005294520052945200529452005294
      52000000000000000000000000000000000000000000000000005A5242007352
      4A0073524A00B5848400000000005A5242005A52420073524A0073524A007352
      4A0073524A0073524A0073524A00B58484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005A5242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005A5242000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00737373006B6B
      6B00737373007373730073737300737373007373730073737300737373007373
      7300737373006B6B6B0073737300949494000000000000000000107BB500107B
      B500107BB5007BA5BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400948C94008C8C8C008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C008C8C8C008C8C8C0073737300AD7B7300AD7B7300107BB5004AAD
      E70063C6EF0010639400845A5A00AD7B7300AD7B7300AD7B7300AD7B7300AD7B
      7300AD7B7300AD7B730000000000000000000000000052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000949494008CCE8C008CCE8C008CCE
      8C008CD69C0094DEA50094DEA50094DEAD0094DEB5008CDEBD008CDEBD008CDE
      BD0094E7CE009CD6BD008C8484006B6B6B00AD7B73004AD67B00107BB50063C6
      F70073D6F7005A736B00EFCEAD007BAD5A004AD67B004AD67B004AD67B004AD6
      7B004AD67B00AD7B730000000000000000000000000052525200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0052525200000000000000000000000000000000000000
      0000000000008484840000000000000000008484840000000000848484000000
      0000000000008484840000000000000000009C9C9C00398C3900318C3100398C
      3900399442003994420039944200429C520052A5730063B584007BD6B50094FF
      E70094FFE70094E7DE008C8484006B6B6B00AD7B730039C66300218CBD006BD6
      FF0052B5DE009C8C6B00FFE7CE00D6C6B50042AD520039C6630039C6630039C6
      630039C66300AD7B73000000000000000000000000005A5A5A00F7F7F7009C5A
      2900A5633900B5732900B5732900B5732900B5732900A5633900A56339009C5A
      29009C5A2900F7F7F7005A5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C0008520800004A00000052
      080000520800005208000052080008520800084208000852080052B57B00A5FF
      FF009CFFFF0094EFE7008C8484006B6B6B00AD7B730029B542002994C6002994
      C600319CC600DEB57B00FFD69C00F7E7CE00525242002994420029B5420029B5
      420029B54200AD7B730000000000000000000000000063636300F7F7F700BD7B
      4A00B5732900BD7B4A00BD7B4A00BD7B4A00BD7B4A00B5732900A56339009C5A
      2900DE9C7300F7F7F70063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500004A0000004200000039
      0000003900000039000000310000004A0000004A0000186B10007BCE8C0084E7
      B50073E7AD0073CEA5008C848C006B6B6B00AD7B7300189C2900189C290018A5
      3100318C6B00DEB57B00E7A55A00CEC6AD00C6733900CEA58400427B3900189C
      2900189C2900AD7B7300000000000000000000000000636B6B00EFEFEF00F7E7
      D600E7A57300E7944A0094736B005A6B7300AD7B5A00BD7B4A00B5732900DE9C
      7300EFEFEF00EFEFEF00636B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500186B1000086B0800004A
      0000003900000031000000310000106B180029A542004AC66B0073D67B0094B5
      4A00B5AD2900B5A539008C8C94006B6B6B00AD7B730008941000089410000894
      10000894100031841000C6733900C6733900F7C69400F7BD8400F7C694004A7B
      39006BBD6B00AD7B73000000000000000000000000006B737300EFEFEF00FFFF
      FF00FFF7F700BDADA5006B848C004A6B9C006B6B8C00B5946B00E7CEB500FFF7
      F700FFFFFF00EFEFEF006B737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD004AA54A004AA54A00085A
      080000390000004A0000005A0000318C290094B54A009CAD3900AD9C2100D68C
      0800F78C0000E78C1000848C9C006B6B6B00AD7B73006BA54200088C0800088C
      0800088C0800088C0800B5CE8400C6733900F7BD8400FF9C6B00E78C4200BD84
      5200BDBDAD00AD7B730000000000000000000000000073737300E7E7E700FFFF
      FF00D6DEDE006B6B8C004A6B9C007B94C6007B94C6008CB5C600FFFFFF00FFFF
      FF00FFFFFF00E7E7E70073737300000000000000000000000000000000000000
      0000000000008484840000000000000000008484840000000000848484000000
      000000000000848484000000000000000000ADADB5005ABD630063C663000873
      10000052000000630000085A00007B630000C66B0000CE630000DE6B0000DE6B
      0000DE730000CE7B1800848C9C006B6B6B00AD7B7300FFC6730052942900007B
      0800007B08009CB55A00FFD69C00FFDEA500BD733900F7B57B00FF9C6B00E78C
      4200BD8452009C73630000000000000000000000000073737300E7E7E700F7F7
      F700ADB5CE007B94C6007B94C6008CB5C6007B94C600CEDEEF00E7E7E700F7F7
      F700F7F7F700E7E7E7007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B50031AD390029B53100218C
      1800529C3900429C390094944200DE8C3900DE7B2100C65A0000B5420000BD4A
      0000C6520000BD6B18008C949C006B6B6B00AD7B7300FFBD5200FFBD5A00217B
      10005A8C2100FFC67300FFCE7B00FFCE8400FFD68C00C6733900F7B57B00FF9C
      6B00E78C4200B57B4A0000000000000000000000000073737300DEDEDE00FFFF
      FF00CECEDE00739CAD00949C9C00ADCEE700ADB5CE00CEDEEF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000000000848484000000000000000000BDBDBD008CBD4A0084BD4200A5BD
      5A00E7D68400E7D68400FFEF9C00FFEF9C00F7CE7B00DE9C4200C6732900BD73
      3100AD4A00009C4208008C949C006B6B6B00AD7B7300FFBD4A00FFBD4A00F7B5
      4A00FFBD5200FFBD5200FFBD5A00FFC66300FFC66B00FFC67300C6733900F7B5
      7B00FF9C6B00E78C4200BD845A0000000000000000008C8C8C00DEDEDE00FFFF
      FF00E7E7E700ADCEE700ADB5CE007B94C600394A9400CEDEEF00000000000031
      F7002139AD00FFE7DE00FFE7DE00000000000000000000000000007308000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00FFD68400FFD67B00FFCE
      6300FFC65200FFC65A00FFC65A00FFC65200FFCE6300FFE78C00FFFFBD00F7DE
      BD00CE9C7300AD6B42008C8C94006B6B6B00AD7B7300FFBD4A00FFBD4A00FFBD
      4A00FFBD4A00FFBD4A00FFBD4A00FFBD4A00FFBD5200FFBD5200FFBD5A00C673
      3900F7B57B00FF9C6B00E77B3900BD845200000000008C8C8C00DEDEDE00FFFF
      FF00ADB5CE003139BD003139BD000008A5000008A500CEDEEF000031F7000031
      F7000031F7002139AD00FFE7DE00000000000000000000730800007308000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600F7CE8C00FFD68C00FFB5
      4200FFAD2900FFBD4A00FFBD5A00FFB54200FFBD5A00FFDEA500F7EFC600F7EF
      C600FFFFCE00F7EFC600848484006B6B6B00AD7B7300AD7B7300AD7B7300AD7B
      7300AD7B7300AD7B7300AD7B7300AD7B7300AD7B7300AD7B7300AD7B7300AD7B
      7300C6733900F7B57B00FF9C6B00C6631000000000008C8C8C00DEDEDE00FFFF
      FF00CEDEEF003139BD000008A5000008A5000008A500CEDEEF0000000000FFE7
      DE00FFE7DE000031F7002139AD0000000000008C0800008C0800007308000073
      0800007308000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600EFCEA500F7D6A500F7CE
      9400F7CE8C00F7D6A500F7D6AD00F7D6AD00F7D6AD00F7D69C00EFCE9C00EFCE
      9C00F7D69C00E7C69C0084848C00737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6733900C6733900DEAD8400000000008C8C8C00DEDEDE00FFFF
      FF00FFFFFF00ADB5CE003139BD000010E7003139BD00CECEDE0000000000FFE7
      DE00FFE7DE00FFE7DE000031F7002139AD0000000000008C0800008C08000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600EFCEA500EFCE9C00EFCE
      A500EFCEA500E7C69C00E7C69C00E7C69C00E7C69C00E7C69C00E7C69C00E7C6
      9C00EFC69400DEBD94008C8C9400A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094949400DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00000000000000
      00000000000000000000000000000031F7000000000000000000008C08000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000000000848484000000000000000000BDC6C600BDC6C600BDBDC600BDBD
      BD00B5B5BD00B5B5BD00B5B5B500ADB5B500ADADB500ADADAD00A5A5AD00A5A5
      AD00A5A5A5009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094949400949494009494
      9400949494009494940094949400949494009494940094949400949494009494
      9400949494009494940094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000737373007B737300847B7B007B7B7B007B737300737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD7B6B00AD7B6B00AD7B6B00AD7B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      730084848400ADADAD00ADADAD00A5A5A500A59C9C00A59C9C00A59C9C008484
      840073737300000000000000000000000000000000000000000000000000AD7B
      6B00DEA57B00EFC69400E7C6A500DEB58C00AD7B6B00AD7B6B00AD7B6B00AD7B
      6B0000000000000000000000000000000000000000008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400A59C
      9C00CECECE009C9C940094948400949494008C8C94009C947B008C847B00BDA5
      A500A59494007373730000000000000000000000000000000000AD7B6B00DEB5
      8C00EFB57B00EFC69C00EFD6B500EFCEA500C69C73007B4A4A008C525200AD7B
      6B00AD7B6B00AD7B6B000000000000000000B58C8C00FFF7EF00FFF7EF00FFEF
      E700FFEFE700FFEFE700F7E7D600F7E7D600F7E7D600F7E7D600F7D6A500F7D6
      A500F7D6A500F7D6A500F7D6A5008C5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073737300A59C9C00DED6
      D60094948C00C6C6AD00FFF7CE00CEBDC600ADA5CE00FFFFE700D6D6CE00847B
      6B00BD9C9C00A5949400737373000000000000000000AD7B6B00E7BD9400EFC6
      8C00EFB57B00EFC6A500F7E7CE00F7D6AD00C69C84007B4A4A007B4A4A00CEA5
      7B00EFBD8C00D6A58400AD7B6B0000000000B58C8C00299C29001084100031A5
      310039AD390039AD390031942900217318005A524200FFEFE700F7E7CE00F7E7
      C600F7E7C600F7D6A500F7D6A5008C5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000948C94007BAD7B00186B
      2100CED6B500FFF7CE00F7CE9400EFB57300EFAD6300EFBD8400FFF7DE00EFF7
      EF0084736B00C6A5A5008484840000000000AD7B6B00F7CE9C00F7D69400EFC6
      8C00EFB57B00F7CEAD00FFEFDE00FFE7C600CEA58C007B4A4A007B4A4A00CEA5
      7B00EFBD8C00DEB58400AD7B6B0000000000B58C8C00FFF7EF00299C29006BCE
      6B006BC66B00F7FFEF0063C6630063CE630031A53100FFEFE700FFEFE700FFEF
      DE00F7E7D600F7E7C600F7D6A5008C5A5A000000000000000000000000007B73
      7B007B737B007B737B007B737B007B737B000000000000000000000000000000
      000000000000000000000000000000000000737373007B947B00219C390029BD
      52004A9C4A00F7F7C600FFF7CE00FFEFBD00F7CE9400EFBD7B00F7C68400FFE7
      C600CECEC600947B7300B59C9C008C848400AD7B6B00F7D69C00F7D69400F7C6
      8C00F7B57300F7CEAD00FFF7EF00FFEFDE00CEAD9C00734242007B4A4A00CEA5
      7B00EFBD8C00DEB58400AD7B6B0000000000B58C8C00FFF7EF00299C290073CE
      730052A54A00FFFFFF006BC66B0073CE7300319C3100FFF7EF00FFEFE700FFEF
      E700F7E7D600F7E7CE00F7D6A5008C5A5A00000000000000000000000000AD7B
      730031D6FF0031D6FF0008C6FF00009CFF008C5A520000000000000000000000
      000000000000000000000000000000000000737B6B00107B180029C64A0042DE
      730029BD52006BAD5A00FFFFD600FFFFD600F7F7C600FFE7AD00FFBD7B00F7AD
      6B00FFF7DE008C846B00C69C9C008C848400AD7B6B00F7D69C00FFD69400E7BD
      9400B5A59400F7CEAD00FFFFF700FFF7EF00DEC6B50094635A0084524A00CEA5
      8400EFBD8C00DEB58400AD7B6B0000000000B58C8C00FFF7EF00FFFFFF001873
      4A003984AD00217BBD0063BD6300399C3900FFF7EF00F7E7CE00F7E7CE00F7E7
      CE00F7E7CE00F7E7CE00F7E7D6009C6B63000000000000000000000000000000
      0000AD7B730031D6FF00009CFF008C5A5200D67318008C5A5200000000000000
      000000000000000000000000000000000000106B10000894180018B5310029BD
      4A0021AD4200107B18007BB56300ADAD94006B6B63009C9C8400947B6300D694
      5A00CEBDC600847B8C00C69C9C0094848400AD7B6B00FFD69400D6CEA50052A5
      E7002184F70084ADDE00FFFFEF00FFF7EF00FFF7E700F7E7CE00E7C6A500E7C6
      9C00E7BD9400DEB58400AD7B6B0000000000B58C8C00FFF7EF00FFFFFF00399C
      FF00399CFF00399CFF00298CE700FFF7F700EFE7D600FFD6A500FFD6A500FFD6
      A500FFD6A500FFD6A500EFE7D6009C6B63000000000000000000000000000000
      000000000000AD7B73008C5A5200FFC68400FFB56300D67318008C5A52000000
      000000000000000000000000000000000000296B2900317B31000894180010A5
      2900428C4200C6DEBD00C6E7A500ADAD940039393900292929006B6B5A00C694
      5A00B5ADC60073738C00C69C9C0094848400AD7B6B009CC6C60042B5FF0031AD
      FF00319CFF001884FF0084BDF700FFFFEF00FFF7EF00FFEFDE00F7E7CE00EFD6
      B500EFC69C00DEB58C00A57B7B0000000000B58C8C00FFF7EF0063849C0042A5
      FF0042A5FF0042A5FF00399CF7009CC6DE00FFF7F700FFF7F700FFF7EF00FFF7
      EF00FFF7EF00FFEFE700F7E7D6009C6B63000000000000000000000000000000
      00000000000000000000AD7B7300FFD6AD00FFC68400FFB56300D67318008C5A
      520000000000000000000000000000000000948494008CAD8C00087B10000894
      18005A9C5A00FFFFFF00FFFFF700FFFFD600D6D6AD004A4A4200A59C7B00FFCE
      9400FFEFBD00948C7B00C69CA5008C848400429CF70042A5FF0042ADFF0042B5
      FF0039A5FF002994FF001884FF008CC6F700FFFFEF00FFF7EF00FFEFDE00FFE7
      C600DEC6B500948C94009C7B840000000000B58C8C00FFF7EF006BA5C6004AB5
      FF0052B5FF0052BDFF004AADFF006BA5C600FFF7F700FFF7F700FFF7F700FFF7
      EF00FFF7EF00FFF7EF00FFEFE700A57B73000000000000000000000000000000
      0000000000000000000000000000AD7B7300FFD6AD00FFC68400FFB56300D673
      18008C5A520000000000000000000000000073737300ADA5A50018842100008C
      000018842100DEE7DE00FFFFFF00FFFFF700FFFFE700E7E7CE0042423900948C
      7300D6D6B500A58C8400BD9C9C008C84840000000000429CFF0042A5FF0042AD
      FF0042B5FF0039A5FF002994FF001884FF008CC6F700FFFFEF00FFFFEF00D6D6
      D600737BAD007B7394000000000000000000B58C8C00FFF7EF0063849C004A94
      C6006BADD60063ADF7006BA5C600FFFFFF00FFFFFF00F7E7CE00F7E7CE00F7E7
      CE00F7E7CE00F7E7CE00FFEFE700A57B73000000000000000000000000000000
      000000000000000000000000000000000000AD7B7300FFD6AD00FFC68400FFB5
      6300D67318008C5A52000000000000000000000000008C848C007BA58400007B
      080000840800298C29009CC69C00EFF7EF00F7FFF700FFFFFF00EFEFCE00BDC6
      A5009C948400CEA5A5008C848400000000000000000000000000429CF70042A5
      FF0042ADFF0042ADFF0039A5FF002994FF001884FF0094C6FF00B5CEE7004A6B
      BD00526BA500000000000000000000000000B58C8C00FFF7EF0063849C006BAD
      D6008CBDE70073BDE70063849C00EFE7D600FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500FFD6A500EFE7D600A57B73000000000000000000000000000000
      00000000000000000000000000000000000000000000AD7B7300FFD6AD00FFC6
      8400FFB56300D67318008C5A52000000000000000000737373009C949C0073A5
      7B00107B180000730000006B0000006B080018732100C6DEBD00E7E7D600ADA5
      9400C6A5A5009C8C8C00737373000000000000000000000000000000000042A5
      FF0042ADFF0042B5FF0042ADFF00319CFF002994FF001884FF00316BE7003163
      C60000000000000000000000000000000000B58C8C00FFF7EF00FFFFFF006BA5
      BD004A94B5004A8CAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      F700FFF7F700FFF7F700FFF7F700B58473000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD7B7300FFD6
      AD00FFC68400D67318008C5A52000000000000000000000000007B7B7B009C94
      9C00ADBDAD008CAD8C0073946B007B9C6B0094A58400B5B5A500ADA5A500C6AD
      AD009C8C8C007B7B7B0000000000000000000000000000000000000000000000
      000042A5FF0042ADFF0042B5FF0039ADFF003994F7001831B5003952DE000000
      000000000000000000000000000000000000B58C8C00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00B58473000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD7B
      73008C5A52008C5A520000000000000000000000000000000000000000007373
      73008C848400ADA5AD00BDB5BD00B5ADB500ADA5AD00ADA5A5009C949C008484
      8400737373000000000000000000000000000000000000000000000000000000
      00000000000042A5FF0042ADFF00000000000000000018109400394ADE000000
      00000000000000000000000000000000000000000000B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000073737300737373007B7B7B007B7B7B0073737300737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018189C00394ADE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60029ADD6000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000298C
      BD00000000000000000000000000000000000000000000000000000000000000
      00009C9C9C006B6B6B00525252004A4A4A004A4A4A004A4A4A00525252009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      000029ADD6008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7
      FF008CF7FF008CF7FF008CF7FF0029ADD6000000000000000000C6A59C006BF7
      FF006BF7FF006BF7FF006BF7FF006BF7FF006BF7FF006BF7FF006BF7FF006BF7
      FF006BF7FF007BC6EF00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000298CBD0084BD
      D60000000000000000000000000000000000000000000000000000000000ADAD
      AD00E7CEC600EFDED600F7E7D600F7E7D600EFDED600EFDED600CEBDB5005A5A
      5A00737373009C9C9C00000000000000000000000000B58484008C5A5A008C5A
      5A0029ADD6008CF7FF00EF8C6300EF8C6300EF8C6300EF8C6300EF8C6300EF8C
      6300EF8C6300EF8C63008CF7FF0029ADD6000000000000000000C6A59C006BF7
      FF00EF8C6300EF8C6300EF8C6300E7733900E7733900E7733900E7632100E763
      2100E76321007BC6EF00B5848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000873B500E7FFFF0084BD
      D600000000000000000000000000000000000000000000000000CEC6BD00F7E7
      D600F7F7F700E7E7E700CEB5A500D6AD9400DEC6BD00EFF7F700F7EFEF00EFDE
      D6008C847B006B6B6B009C9C9C000000000000000000B58C8C00FFF7E700FFF7
      E70029ADD6008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7
      FF008CF7FF008CF7FF008CF7FF0029ADD6000000000000000000C6ADA5007BC6
      EF0029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD600B5848400000000000000000000000000298CBD0039A5
      D60039A5D60039A5D60039A5D60039A5D600298CBD00E7FFFF00E7FFFF00DEEF
      FF0039A5D60000000000000000000000000000000000E7D6CE00F7E7DE00F7FF
      FF00CE9C8400B54A1000BD633900D6AD9C00C65A2100BD522100D6AD9C00F7FF
      FF00F7DED6007B736B00737373000000000000000000B58C8C00FFF7E700F7DE
      C60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60029ADD6000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEB500F7D6B500F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B58484000000000000000000298CBD00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF0039A5D600000000000000000000000000EFDED600F7FFFF00C67B
      5A00BD4A1000C6521800C6A59400FFFFFF00DE947300BD4A1000B54A1000CE9C
      8400F7FFFF00EFDED6005A5A5A009C9C9C0000000000B58C8C00FFFFFF00FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFF7E7008C5A5A000000
      0000000000000000000000000000000000000000000000000000CEB5AD00FFFF
      F700FFEFE700F7E7D600F7E7D600F7E7CE00F7DEC600F7DEBD00F7DEC600F7DE
      C600EFCE9C00EFCE9C00B58484000000000000000000298CBD00CEF7FF00E7FF
      FF00CEF7FF00E7FFFF00CEF7FF002929290052525200CEF7FF00E7FFFF00CEF7
      FF00E7FFFF0039A5D6000000000000000000F7E7E700F7F7F700D6AD9400BD4A
      1000CE633100CE632900CE6B3900DE8C6B00CE632900CE633100C65A2900B54A
      1000DEC6BD00F7EFE700A59C94006363630000000000B58C8C00FFFFFF00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7E7CE00FFF7E7008C5A5A000000
      0000000000000000000000000000000000000000000000000000D6B5AD00FFFF
      FF00FFCE9400FFCE9400FFC67B00FFC67B00FFC67B00FFBD6B00FFBD6B00FFBD
      6B00F7D6A500F7D6A500B58484000000000000000000298CBD00CEF7FF00CEF7
      FF00CEF7FF00CEF7FF00CEF7FF00CEF7FF00CEF7FF00CEF7FF00CEF7FF00CEF7
      FF00CEF7FF0039A5D6000000000000000000F7EFE700F7F7F700C6633100C65A
      2900CE6B3100CE5A2100CE8C6B00F7E7DE00CE6B3900C65A2100CE633100C652
      1800C67B5200F7FFFF00DECEC6005252520000000000B58C8C00FFFFFF00FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFF7E7008C5A5A000000
      0000000000000000000000000000000000000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEC600F7DE
      BD00F7D6B500F7D6AD00B584840000000000000000004A9CC600CEF7FF00CEF7
      FF00CEF7FF00CEF7FF00CEF7FF002929290052525200CEF7FF00CEF7FF00CEF7
      FF00CEF7FF0039A5D6000000000000000000F7EFE700EFDED600C65A2100CE63
      3100CE633100CE5A2100C6846B00FFFFFF00EFAD9400C64A1000CE633100CE63
      2900C65A2900F7EFEF00EFDED6005252520000000000B58C8C00FFFFFF00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7E7CE00FFF7E7008C5A5A000000
      0000000000000000000000000000000000000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFF7F700FFF7EF00FFEFE700F7E7D600F7E7CE00F7DEC600F7DE
      BD00F7DEB500F7DEB500B5848400000000000000000039A5D600CEF7FF00CEF7
      FF00CEF7FF00CEF7FF00CEF7FF005252520029292900849CA500CEF7FF00CEF7
      FF00CEF7FF0039A5D6000000000000000000F7EFE700F7DECE00CE5A2100CE63
      3100CE633100CE632900C6522100CEB5A500FFFFFF00E79C7B00C6521800CE63
      2900C65A2900F7EFEF00EFDED6005252520000000000B58C8C00FFFFFF00FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFF7E7008C5A5A000000
      0000000000000000000000000000000000000000000000000000DEBDB500FFFF
      FF00FFCE9400FFCE9400FFC67B00FFC67B00FFC67B00FFBD6B00FFBD6B00FFBD
      6B00F7DEC600F7D6B500B5848400000000000000000039A5D600B5EFFF00B5EF
      FF00B5EFFF00B5EFFF00B5EFFF00B5EFFF00525252002929290052525200B5EF
      FF00B5EFFF0039A5D6000000000000000000F7EFE700F7EFE700DE6B3100D66B
      3100CE632900C65A2100C6521800BD4A1000DECEC600FFFFFF00D6734200CE5A
      2100CE6B3900FFF7F700EFDED6006B6B6B0000000000B58C8C00FFFFFF00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7E7CE00FFF7E7008C5A5A0029AD
      D60029ADD60029ADD60029ADD60029ADD6000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B5848400000000000000000042B5F700B5EFFF00B5EF
      FF00B5EFFF002929290052525200B5EFFF00B5EFFF002929290029292900B5EF
      FF00B5EFFF0042B5F7000000000000000000F7E7E700FFFFFF00F79C6B00E763
      2900CE8C6B00EFE7DE00D67B5200BD310000D69C7B00FFFFFF00DE8C6300CE52
      1800E79C7300FFFFFF00DEC6BD00ADADAD0000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7E7008C5A5A008CF7
      FF008CF7FF008CF7FF008CF7FF0029ADD6000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B5848400000000000000000042B5F700B5EFFF00B5EF
      FF00B5EFFF002929290029292900B5EFFF00849CA5002929290029292900B5EF
      FF00B5EFFF0042B5F7000000000000000000F7EFE700F7EFEF00FFEFDE00FF8C
      4A00DE845A00EFFFFF00FFFFFF00E7BDA500F7FFFF00EFFFFF00E7733900E773
      3900FFEFEF00F7E7DE00A59C94000000000000000000B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00EF8C
      6300EF8C6300EF8C63008CF7FF0029ADD6000000000000000000E7C6B5007BC6
      EF0029ADD60029ADD60029ADD60029ADD60029ADD60029ADD6002184A500BD8C
      7300EFB57300EFA54A00C6846B0000000000000000005AC6F700B5EFFF00B5EF
      FF00B5EFFF00849CA50029292900292929002929290029292900849CA500B5EF
      FF00B5EFFF0042B5F700000000000000000000000000EFDED600FFFFFF00FFEF
      CE00FFB57300EFAD8400EFE7DE00EFF7F700EFE7DE00F7A57B00FF8C4A00FFDE
      CE00FFFFFF00EFDED600CECEC600000000000000000000000000000000000000
      000029ADD6008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7
      FF008CF7FF008CF7FF008CF7FF0029ADD6000000000000000000E7C6B5006BF7
      FF00EF8C6300EF8C6300EF8C6300EF8C6300E7733900E7632100B54A1800C694
      7B00FFC67300CE9473000000000000000000000000005AC6F70094F7FF0094F7
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7
      FF0094F7FF0042B5F700000000000000000000000000F7EFEF00EFDED600FFFF
      FF00FFFFFF00FFF7C600FFDEAD00FFCE9400FFCE9400FFD6AD00FFF7F700FFFF
      FF00EFDED600CECEC60000000000000000000000000000000000000000000000
      000029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60029ADD6000000000000000000E7C6B5006BF7
      FF006BF7FF006BF7FF006BF7FF006BF7FF006BF7FF006BF7FF007BC6EF00C694
      7B00CE9C8400000000000000000000000000000000008CD6F70094F7FF0094F7
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7
      FF0094F7FF0042B5F70000000000000000000000000000000000F7EFEF00EFDE
      D600F7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE7DE00EFDE
      D600DEDEDE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFCEB500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500E7C6B500D6BDB500BD84
      7B000000000000000000000000000000000000000000000000009CDEF70073E7
      FF0073E7FF0073E7FF0073E7FF0073E7FF0073E7FF0073E7FF0073E7FF0073E7
      FF0042B5F700000000000000000000000000000000000000000000000000F7EF
      E700F7F7EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      E700000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EF8C63000000
      00004A844A000000000000000000000000000000000000000000000000004A84
      4A0000000000EF8C630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00B5848400000000000000000000000000C6A59C00FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EF8C63000000
      00004A844A004A844A00000000000000000000000000000000004A844A004A84
      4A0000000000EF8C630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFFF
      FF00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00B5848400000000000000000000000000C6A59C00FFFF
      FF00FFF7F700FFF7F700FFF7F700000000000000000000000000FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EF8C63000000
      00004A844A006BCE84004A844A0000000000000000004A844A005ABD6B004A84
      4A0000000000EF8C630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6ADA500FFFF
      FF00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFF7EF00B5848400000000000000000000000000C6ADA500FFFF
      FF00FFEFD600FFEFD600FFEFD600FFEFD60000000000FFEFD600FFEFD600FFEF
      D600FFEFD600FFF7EF00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EF8C63000000
      00004A844A006BCE84005ABD6B004A844A004A844A0063E763006BCE84004A84
      4A0000000000EF8C630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6ADA500FFFF
      FF00F7D6A500F7D6A500F7D6A500F7D6A500F7D6A500F7D6A500F7D6A500F7D6
      A500F7D6A500FFF7EF00B5848400000000000000000000000000C6ADA500FFFF
      FF00F7D6A500F7D6A500F7D6A500F7D6A50000000000F7D6A500F7D6A500F7D6
      A500F7D6A500FFF7EF00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EF8C63000000
      00004A844A0063E763004A844A0000000000000000004A844A0063E763004A84
      4A0000000000EF8C630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB5AD00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7EF00FFF7EF00B5848400000000000000000000000000CEB5AD00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFF7F70000000000FFF7F700FFF7F700FFF7
      F700FFF7EF00FFF7EF00B584840000000000B58C8C008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000EF8C63000000
      00004A844A004A844A00000000000000000000000000000000004A844A004A84
      4A0000000000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A00000000000000000000000000000000000000000000000000D6B5AD00FFFF
      FF00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFF7EF00B5848400000000000000000000000000D6B5AD00FFFF
      FF00FFEFD600FFEFD600FFEFD600F7D6A50000000000FFEFD600FFEFD600FFEF
      D600FFEFD600FFF7EF00B584840000000000B58C8C00FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E7008C5A5A00000000000000000000000000EF8C63000000
      00004A844A000000000000000000000000000000000000000000000000004A84
      4A0000000000B58C8C00FFF7E700FFF7E700FFF7E700FFF7E700FFF7E7008C5A
      5A00000000000000000000000000000000000000000000000000D6BDB500FFFF
      FF00F7D6A500F7D6A500F7D6A500F7D6A500F7D6A500F7D6A500F7D6A500F7D6
      A500F7D6A500FFF7EF00B5848400000000000000000000000000D6BDB500FFFF
      FF00F7D6A500F7D6A500F7D6A5000000000000000000F7D6A500F7D6A500F7D6
      A500F7D6A500FFF7EF00B584840000000000B58C8C00FFFFFF00FFD6A500FFD6
      A500FFD6A500FFF7E7008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00FFFFFF00FFD6A500FFD6A500FFD6A500FFF7E7008C5A
      5A00000000000000000000000000000000000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700B5848400000000000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700B584840000000000B58C8C00FFFFFF00F7DEC600F7DE
      C600F7E7CE00FFF7E7008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00FFFFFF00F7DEC600F7DEC600F7E7CE00FFF7E7008C5A
      5A00000000000000000000000000000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7
      F700FFF7F700FFF7F700B5848400000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7
      F700FFF7F700FFF7F700B584840000000000B58C8C00FFFFFF00FFD6A500FFD6
      A500FFD6A500FFF7E7008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00FFFFFF00FFD6A500FFD6A500FFD6A500FFF7E7008C5A
      5A00000000000000000000000000000000000000000000000000DEC6B50029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD6002184
      A5002184A500C6BDAD00B5848400000000000000000000000000DEC6B50029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD6002184
      A5002184A500C6BDAD00B584840000000000B58C8C00FFFFFF00F7DEC600F7DE
      C600F7E7CE00FFF7E7008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00FFFFFF00F7DEC600F7DEC600F7E7CE00FFF7E7008C5A
      5A00000000000000000000000000000000000000000000000000E7C6B50029AD
      D6008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF0042EFFF00C6A5
      9400B5948C00B58C8400B5848400000000000000000000000000E7C6B50029AD
      D6008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF0042EFFF00C6A5
      9400B5948C00B58C8400B584840000000000B58C8C00FFFFFF00FFFFFF0029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00FFFFFF00FFFFFF0029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60029ADD6000000000000000000E7C6B50029AD
      D6008CF7FF00EF8C6300EF8C6300EF8C6300E7733900E7632100B54A1800BD8C
      7300EFB57300EFA54A00C6846B00000000000000000000000000E7C6B50029AD
      D6008CF7FF00EF8C6300EF8C6300EF8C6300E7733900E7632100B54A1800BD8C
      7300EFB57300EFA54A00C6846B0000000000B58C8C00B58C8C00B58C8C0029AD
      D6008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF0029AD
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00B58C8C00B58C8C0029ADD6008CF7FF008CF7FF008CF7
      FF008CF7FF008CF7FF008CF7FF0029ADD6000000000000000000EFCEBD0029AD
      D6008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF0042EFFF00C694
      7B00FFC67300CE94730000000000000000000000000000000000EFCEBD0029AD
      D6008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF0042EFFF00C694
      7B00FFC67300CE947300000000000000000000000000000000000000000029AD
      D6008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF0029AD
      D600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000029ADD6008CF7FF008CF7FF004AFF
      FF008CF7FF008CF7FF008CF7FF0029ADD6000000000000000000E7C6B50029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD6007BC6EF00C694
      7B00CE9C84000000000000000000000000000000000000000000E7C6B50029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD6007BC6EF00C694
      7B00CE9C840000000000000000000000000000000000000000000000000029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60029ADD6000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF7B0000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B635200F7BD7B00DE843100DE733100D6731800734A39000000
      00000000000000000000000000000000000000000000636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B0000000000000000000000000000000000CE63
      0000CE630000CE630000FF7B0000FFF7E700FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C600FFE7C600FFDEA500CE63000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      0000000000007B635200F7BD7B00DE843100DE733100D6731800734A39000000
      000000000000000000000000000000000000000000008C8C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008C8C8C0000000000000000000000000000000000CE63
      00000000000000000000E7730000E7730000E7730000E7730000E7730000E773
      0000E7730000E7730000E7730000E773000000000000CE630000FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000000000000000
      0000000000007B635200F7BD7B00DE843100DE733100D6731800734A39000000
      000000000000000000000000000000000000000000008C8C8C00FFFFFF00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFFFFF008C8C8C0000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000008400000084
      00000084000000840000FFF7E700008400000084000000840000008400000084
      0000FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000000000000000
      000000000000848484007B6352007B6352007B6352007B635200848484000000
      000000000000000000000000000000000000000000008C8C8C00FFFFFF00FFB5
      6B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFF
      FF00FFB56B00FFFFFF008C8C8C0000000000000000000000000000000000CE63
      00000000000000000000FF7B0000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000CE630000FFFFFF000084
      000000840000FFFFFF00FFFFF7000084000000840000FFE7C600FFDEB5000084
      000000840000FFD6AD00FFD6AD00CE6300000000000000000000000000000000
      0000000000000000000084848400FFFFFF00C6C6C6005A525200000000000000
      000000000000000000000000000000000000000000009C9C9400FFFFFF00FFB5
      6B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFF
      FF00FFB56B00FFFFFF009C9C940000000000000000000000000000000000CE63
      0000CE630000CE630000FF7B0000FFF7E700FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C600FFE7C600FFDEA500CE63000000000000CE630000FFFFFF000084
      000000840000FFFFFF00FFFFFF000084000000840000FFEFD600FFE7C600FFDE
      B5000084000000840000FFD6AD00CE6300000000000000000000000000000000
      0000000000000000000084848400FFFFFF00C6C6C6005A525200000000000000
      000000000000000000000000000000000000000000009C9C9400FFFFFF00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFFFFF009C9C940000000000000000000000000000000000CE63
      00000000000000000000E7730000E7730000E7730000E7730000E7730000E773
      0000E7730000E7730000E7730000E773000000000000CE630000FFFFFF000084
      000000840000FFFFFF00FFFFFF000084000000840000FFF7E700FFEFD600FFE7
      C6000084000000840000FFD6AD00CE6300000000000000000000000000000000
      0000000000000000000084848400FFFFFF00C6C6C6005A525200000000000000
      000000000000000000000000000000000000000000009C9C9400FFFFFF00F7A5
      5A00FFFFFF00FFFFFF00F7A55A00FFFFFF00FFFFFF00F7A55A00FFFFFF00FFFF
      FF00F7A55A00FFFFFF009C9C940000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF000084
      000000840000FFFFFF00FFFFFF000084000000840000FFFFF700FFF7E700FFEF
      D6000084000000840000FFD6AD00CE6300000000000000000000000000000000
      0000000000000000000084848400FFFFFF00C6C6C6005A525200000000000000
      00000000000000000000000000000000000000000000A5A5A500F7F7F700F7A5
      5A00FFFFFF00FFFFFF00F7A55A00FFFFFF00FFFFFF00F7A55A00FFFFFF00FFFF
      FF00F7A55A00F7F7F700A5A5A50000000000000000000000000000000000CE63
      00000000000000000000FF7B0000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000CE630000FFFFFF000084
      000000840000FFFFFF00FFFFFF000084000000840000FFFFFF00FFFFF700FFF7
      E7000084000000840000FFDEB500CE6300000000000000000000000000000000
      0000000000000000000084848400FFFFFF00C6C6C6005A525200000000000000
      00000000000000000000000000000000000000000000A5A5A500F7F7F700EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100F7F7F700A5A5A50000000000000000000000000000000000CE63
      0000CE630000CE630000FF7B0000FFF7E700FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C600FFE7C600FFDEA500CE63000000000000CE630000FFFFFF000084
      000000840000FFFFFF00FFFFFF000084000000840000FFFFFF00FFFFFF000084
      000000840000FFEFD600FFE7C600CE6300000000000000000000000000000000
      000000000000000000005A5252005A5252005A5252005A525200000000000000
      00000000000000000000000000005A52520000000000ADADAD00EFEFEF00EF9C
      2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFFFF00EF9C21004A4A42004A4A
      42004A4A42004A4A42004A4A42004A4A4200000000000000000000000000CE63
      00000000000000000000E7730000E7730000E7730000E7730000E7730000E773
      0000E7730000E7730000E7730000E773000000000000CE630000008400000084
      00000084000000840000FFFFFF00008400000084000000840000008400000084
      0000FFFFF700FFF7E700FFEFD600CE630000000000005A5252005A5252000000
      0000000000005A525200848484008484840084848400848484005A5252000000
      000000000000000000005A5252005A52520000000000ADADAD00EFEFEF00EF9C
      2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFFFF00EF9C21004A4A42004A6B
      E7000839EF00FFE7DE00FFE7DE006B636300000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700CE630000527B840084848400848484005A52
      52005A52520084848400C6C6C600C6C6C600C6C6C600848484005A5252005A52
      52005A5252005A525200C6C6C6005A52520000000000B5B5B500DEDEDE00EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C21004A6BE7000839
      EF004A6BE7000839EF00FFE7DE006B63630000000000FF7B0000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE6300000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000063636300FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484008484
      840084848400C6C6C6005A5252000000000000000000B5B5B500DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE004A4A4200FFE7
      DE00FFE7DE000839EF004A6BE7007B73630000000000FF7B0000FFF7E700FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFDEA500CE6300000000
      0000000000000000000000000000000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE63000000000000527B8400FFFFFF00C6C6C600C6C6
      C600FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60084848400000000000000000000000000B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B5004A4A4200FFE7
      DE00FFE7DE00FFE7DE000839EF004A6BE70000000000E7730000E7730000E773
      0000E7730000E7730000E7730000E7730000E7730000E7730000E77300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063636300FFFFFF00FFFFFF008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A42006B63
      63006B6363006B6363007B7363000839EF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B000000000000000000636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B000000000000000000636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008C8C8C0000000000000000008C8C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008C8C8C0000000000000000008C8C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008C8C8C0000000000FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00000000008C8C8C00FFFFFF000063
      CE000063CE000063CE000063CE000063CE000063CE000063CE000063CE000063
      CE000063CE00FFFFFF008C8C8C0000000000000000008C8C8C00FFFFFF00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFFFFF008C8C8C0000000000000000008C8C8C00FFFFFF00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFFFFF008C8C8C0000000000FFB56B00FFFFFF00FFFFFF00FFB5
      6B00FFE7C600FFE7C600FFF7E700FFB56B00FFE7C600FFE7C600FFF7E700FFB5
      6B00FFE7C600FFE7C600FFF7E700FFB56B00000000008C8C8C00FFFFFF000063
      CE0010F7FF0010F7FF000063CE0010F7FF0010F7FF000063CE0010F7FF0010F7
      FF000063CE00FFFFFF008C8C8C0000000000000000008C8C8C00FFFFFF00FFB5
      6B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFF
      FF00FFB56B00FFFFFF008C8C8C0000000000000000008C8C8C00FFFFFF00FFB5
      6B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFF
      FF00FFB56B00FFFFFF008C8C8C0000000000FFB56B00FFFFFF00FFFFFF00FFB5
      6B00FFE7C600FFE7C600FFF7E700FFB56B00FFE7C600FFE7C600FFF7E700FFB5
      6B00FFE7C600FFE7C600FFF7E700FFB56B00000000009C9C9400FFFFFF000063
      CE0010F7FF0010F7FF000063CE0010F7FF0010F7FF000063CE0010F7FF0010F7
      FF000063CE00FFFFFF009C9C940000000000000000009C9C9400FFFFFF00FFB5
      6B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFF
      FF00FFB56B00FFFFFF009C9C940000000000000000009C9C9400FFFFFF00FFB5
      6B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFF
      FF00FFB56B00FFFFFF009C9C940000000000FFB56B00FFFFFF00FFFFFF00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00000000009C9C9400FFFFFF000063
      CE000063CE000063CE000063CE000063CE000063CE000063CE000063CE000063
      CE000063CE00FFFFFF009C9C940000000000000000009C9C9400FFFFFF00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFFFFF009C9C940000000000000000009C9C9400FFFFFF000063
      CE000063CE000063CE000063CE000063CE000063CE000063CE000063CE000063
      CE000063CE00FFFFFF009C9C940000000000FFB56B00FFFFFF00FFFFFF00FFB5
      6B00FFE7C600FFE7C600FFF7E700FFB56B00FFE7C600FFE7C600FFF7E700FFB5
      6B00FFE7C600FFE7C600FFF7E700FFB56B00000000009C9C9400FFFFFF000063
      CE0010F7FF0010F7FF000063CE0010F7FF0010F7FF000063CE0010F7FF0010F7
      FF000063CE00FFFFFF009C9C940000000000000000009C9C9400FFFFFF00F7A5
      5A0008E7080008E70800F7A55A0008E7080008E70800F7A55A0008E7080008E7
      0800F7A55A00FFFFFF009C9C940000000000000000009C9C9400FFFFFF000063
      CE0010F7FF0010F7FF000063CE0010F7FF0010F7FF000063CE0010F7FF0010F7
      FF000063CE00FFFFFF009C9C940000000000F7A55A00F7A55A00F7A55A00F7A5
      5A00FFE7C600FFE7C600FFF7E700F7A55A00FFE7C600FFE7C600FFF7E700F7A5
      5A00FFE7C600FFE7C600FFF7E700F7A55A0000000000A5A5A500F7F7F7000063
      CE0010F7FF0010F7FF000063CE0010F7FF0010F7FF000063CE0010F7FF0010F7
      FF000063CE00F7F7F700A5A5A5000000000000000000A5A5A500F7F7F700F7A5
      5A0084FF840008E70800F7A55A0084FF840008E70800F7A55A0084FF840008E7
      0800F7A55A00F7F7F700A5A5A5000000000000000000A5A5A500F7F7F7000063
      CE0010F7FF0010F7FF000063CE0010F7FF0010F7FF000063CE0010F7FF0010F7
      FF000063CE00F7F7F700A5A5A50000000000F7A55A00FFFFFF00FFFFFF00F7A5
      5A00F7A55A00F7A55A00F7A55A00F7A55A00F7A55A00F7A55A00F7A55A00F7A5
      5A00F7A55A00F7A55A00F7A55A00F7A55A0000000000A5A5A500F7F7F7000063
      CE000063CE000063CE000063CE000063CE000063CE000063CE000063CE000063
      CE000063CE00F7F7F700A5A5A5000000000000000000A5A5A500F7F7F700EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100F7F7F700A5A5A5000000000000000000A5A5A500F7F7F7000063
      CE000063CE000063CE000063CE000063CE000063CE000063CE000063CE000063
      CE000063CE00F7F7F700A5A5A50000000000F7A55A00FFFFFF00FFFFFF00F7A5
      5A00FFE7C600FFE7C600FFF7E700F7A55A00FFE7C600FFE7C600FFF7E700F7A5
      5A00FFE7C600FFE7C600FFF7E700F7A55A0000000000ADADAD00EFEFEF000063
      CE0010F7FF0010F7FF000063CE0010F7FF0010F7FF000063CE0010F7FF0010F7
      FF000063CE00EFEFEF00ADADAD000000000000000000ADADAD00EFEFEF00EF9C
      2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFF
      FF00EF9C2100EFEFEF00ADADAD000000000000000000ADADAD00EFEFEF00EF9C
      2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFF
      FF00EF9C2100EFEFEF00ADADAD0000000000EF9C2100FFFFFF00FFFFFF00EF9C
      2100FFE7C600FFE7C600FFF7E700EF9C2100FFE7C600FFE7C600FFF7E700EF9C
      2100FFE7C600FFE7C600FFF7E700EF9C210000000000ADADAD00EFEFEF000063
      CE0010F7FF0010F7FF000063CE0010F7FF0010F7FF000063CE0010F7FF0010F7
      FF000063CE00EFEFEF00ADADAD000000000000000000ADADAD00EFEFEF00EF9C
      2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFF
      FF00EF9C2100EFEFEF00ADADAD000000000000000000ADADAD00EFEFEF00EF9C
      2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFF
      FF00EF9C2100EFEFEF00ADADAD0000000000EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C210000000000B5B5B500DEDEDE000063
      CE000063CE000063CE000063CE000063CE000063CE000063CE000063CE000063
      CE000063CE00DEDEDE00B5B5B5000000000000000000B5B5B500DEDEDE00EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100DEDEDE00B5B5B5000000000000000000B5B5B500DEDEDE00EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100DEDEDE00B5B5B50000000000EF9C2100FFFFFF00FFFFFF00EF9C
      2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EF9C210000000000B5B5B500DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00B5B5B5000000000000000000B5B5B500DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00B5B5B5000000000000000000B5B5B500DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00B5B5B50000000000EF9C2100FFFFFF00FFFFFF00EF9C
      2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EF9C210000000000B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B5000000000000000000B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B5000000000000000000B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B50000000000EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008C08000000
      0000000000000000000000000000F7A55A00F7A55A00F7A55A00F7A55A00F7A5
      5A00F7A55A00F7A55A00F7A55A00F7A55A0000000000636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B000000000000000000636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B000000000000000000636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B000000000000000000008C0800008C08000073
      0800000000000000000000000000EF9C2100FFF7E700FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E700000000008C8C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008C8C8C0000000000000000008C8C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008C8C8C0000000000000000008C8C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008C8C8C0000000000008C0800008C0800007308000073
      0800007308000000000000000000EF9C2100FFF7E700FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E700000000008C8C8C00FFFFFF00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFFFFF008C8C8C0000000000000000008C8C8C00FFFFFF00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFFFFF008C8C8C0000000000000000008C8C8C00FFFFFF00FFB5
      6B00FFB56B00FFB56B000063CE000063CE000063CE000063CE00FFB56B00FFB5
      6B00FFB56B00FFFFFF008C8C8C00000000000000000000000000007308000000
      0000000000000000000000000000EF9C2100FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600000000008C8C8C00FFFFFF00FFB5
      6B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFF
      FF00FFB56B00FFFFFF008C8C8C0000000000000000008C8C8C00FFFFFF00FFB5
      6B00FFFFFF00FFFFFF00FFB56B0008E7080008E70800FFB56B00FFFFFF00FFFF
      FF00FFB56B00FFFFFF008C8C8C0000000000000000008C8C8C00FFFFFF00FFB5
      6B00FFFFFF00FFFFFF000063CE0010F7FF0010F7FF000063CE00FFFFFF00FFFF
      FF00FFB56B00FFFFFF008C8C8C00000000000000000000000000007308000000
      0000000000000000000000000000EF9C2100FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600000000009C9C9400FFFFFF00FFB5
      6B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFF
      FF00FFB56B00FFFFFF009C9C940000000000000000009C9C9400FFFFFF00FFB5
      6B00FFFFFF00FFFFFF00FFB56B0084FF840008E70800FFB56B00FFFFFF00FFFF
      FF00FFB56B00FFFFFF009C9C940000000000000000009C9C9400FFFFFF00FFB5
      6B00FFFFFF00FFFFFF000063CE0010F7FF0010F7FF000063CE00FFFFFF00FFFF
      FF00FFB56B00FFFFFF009C9C9400000000000000000000000000000000000000
      0000000000000000000000000000EF9C2100FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600000000009C9C9400FFFFFF00FFB5
      6B00FFB56B00FFB56B000063CE000063CE000063CE000063CE00FFB56B00FFB5
      6B00FFB56B00FFFFFF009C9C940000000000000000009C9C9400FFFFFF00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFFFFF009C9C940000000000000000009C9C9400FFFFFF00FFB5
      6B00FFB56B00FFB56B000063CE000063CE000063CE000063CE00FFB56B00FFB5
      6B00FFB56B00FFFFFF009C9C9400000000000000000000000000000000000000
      0000000000000000000000000000EF9C2100FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600000000009C9C9400FFFFFF00FFB5
      6B00FFFFFF00FFFFFF000063CE0010F7FF0010F7FF000063CE00FFFFFF00FFFF
      FF00FFB56B00FFFFFF009C9C940000000000000000009C9C9400FFFFFF00F7A5
      5A00FFFFFF00FFFFFF00F7A55A0008E7080008E70800F7A55A00FFFFFF00FFFF
      FF00F7A55A00FFFFFF009C9C940000000000000000009C9C9400FFFFFF00F7A5
      5A00FFFFFF00FFFFFF000063CE0010F7FF0010F7FF000063CE00FFFFFF00FFFF
      FF00F7A55A00FFFFFF009C9C9400000000000000000000000000000000000000
      0000000000000000000000000000EF9C2100FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C60000000000A5A5A500F7F7F700FFB5
      6B00FFFFFF00FFFFFF000063CE0010F7FF0010F7FF000063CE00FFFFFF00FFFF
      FF00FFB56B00F7F7F700A5A5A5000000000000000000A5A5A500F7F7F700F7A5
      5A00FFFFFF00FFFFFF00F7A55A0084FF840008E70800F7A55A00FFFFFF00FFFF
      FF00F7A55A00F7F7F700A5A5A5000000000000000000A5A5A500F7F7F700F7A5
      5A00FFFFFF00FFFFFF000063CE0010F7FF0010F7FF000063CE00FFFFFF00FFFF
      FF00F7A55A00F7F7F700A5A5A500000000000000000000000000007308000000
      0000000000000000000000000000EF9C2100FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C60000000000A5A5A500F7F7F700EF9C
      2100EF9C2100EF9C21000063CE000063CE000063CE000063CE00EF9C2100EF9C
      2100EF9C2100F7F7F700A5A5A5000000000000000000A5A5A500F7F7F700EF9C
      2100EF9C2100EF9C2100EF9C2100FFB56B00FFB56B00EF9C2100EF9C2100EF9C
      2100EF9C2100F7F7F700A5A5A5000000000000000000A5A5A500F7F7F700EF9C
      2100EF9C2100EF9C21000063CE000063CE000063CE000063CE00EF9C2100EF9C
      2100EF9C2100F7F7F700A5A5A500000000000000000000000000007308000000
      0000000000000000000000000000EF9C2100FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C60000000000ADADAD00EFEFEF00EF9C
      2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFF
      FF00EF9C2100EFEFEF00ADADAD000000000000000000ADADAD00EFEFEF00EF9C
      2100FFFFFF00FFFFFF00EF9C210008E7080008E70800EF9C2100FFFFFF00FFFF
      FF00EF9C2100EFEFEF00ADADAD000000000000000000ADADAD00EFEFEF00EF9C
      2100FFFFFF00FFFFFF000063CE0010F7FF0010F7FF000063CE00FFFFFF00FFFF
      FF00EF9C2100EFEFEF00ADADAD0000000000008C0800008C0800007308000073
      0800007308000000000000000000EF9C2100FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C60000000000ADADAD00EFEFEF00EF9C
      2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFF
      FF00EF9C2100EFEFEF00ADADAD000000000000000000ADADAD00EFEFEF00EF9C
      2100FFFFFF00FFFFFF00EF9C210042FF420008E70800EF9C2100FFFFFF00FFFF
      FF00EF9C2100EFEFEF00ADADAD000000000000000000ADADAD00EFEFEF00EF9C
      2100FFFFFF00FFFFFF000063CE0010F7FF0010F7FF000063CE00FFFFFF00FFFF
      FF00EF9C2100EFEFEF00ADADAD000000000000000000008C0800008C08000073
      0800000000000000000000000000EF9C2100FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C60000000000B5B5B500DEDEDE00EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100DEDEDE00B5B5B5000000000000000000B5B5B500DEDEDE00EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100DEDEDE00B5B5B5000000000000000000B5B5B500DEDEDE00EF9C
      2100EF9C2100EF9C21000063CE000063CE000063CE000063CE00EF9C2100EF9C
      2100EF9C2100DEDEDE00B5B5B500000000000000000000000000008C08000000
      0000000000000000000000000000EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C210000000000B5B5B500DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00B5B5B5000000000000000000B5B5B500DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00B5B5B5000000000000000000B5B5B500DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B5000000000000000000B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B5000000000000000000B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE630000B55A
      0000B55A0000B55A0000B55A0000B55A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E700FFB56B00FFFFFF00FFFFFF00FFB5
      6B00FFD6A500FFD6A500FFDEB500FFDEB500FFDEB500FFE7C600FFE7C600FFE7
      C600FFEFD600FFEFD600FFF7E700FFB56B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE630000DE73
      4200DE734200DE734200DE734200DE7342000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFFFF00FFB5
      6B00FFD6A500FFD6A500FFDEB500FFDEB500FFDEB500FFE7C600FFE7C600FFE7
      C600FFEFD600FFEFD600FFF7E700FFB56B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE630000D684
      0000D6840000D6840000D6840000D68400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFFFF00FFB5
      6B00FFD6A500FFD6A500FFDEB500FFDEB500FFDEB500FFE7C600FFE7C600FFE7
      C600FFEFD600FFEFD600FFF7E700FFB56B000063CE000063CE000063CE000063
      CE000063CE000063CE0000000000000000000073080000000000CE630000CE63
      0000CE630000CE630000CE630000CE6300000063CE000063CE000063CE000063
      CE000063CE000063CE0000000000000000000073080000000000EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000063CE000063CE000063CE000063
      CE000063CE000063CE0000000000000000000073080000000000EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100FFB56B00FFB56B00FFB56B00FFB5
      6B00FFD6A500FFD6A500FFDEB500FFDEB500FFDEB500FFE7C600FFE7C600FFE7
      C600FFEFD600FFEFD600FFF7E700FFB56B0010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF000063CE0000000000000000000073080000730800000000000000
      00000000000000000000000000000000000010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF000063CE0000000000000000000073080000730800000000000000
      00000000000000000000000000000000000010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF000063CE0000000000000000000073080000730800000000000000
      000000000000000000000000000000000000F7A55A00FFFFFF00FFFFFF00F7A5
      5A00FFD6A500FFD6A500FFDEB500FFDEB500FFDEB500FFE7C600FFE7C600FFE7
      C600FFEFD600FFEFD600FFF7E700F7A55A0010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF000063CE00007308000073080000730800008C0800007308000000
      00000000000000000000000000000000000010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF000063CE00007308000073080000730800008C0800007308000000
      00000000000000000000000000000000000010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF000063CE00007308000073080000730800008C0800007308000000
      000000000000000000000000000000000000F7A55A00FFFFFF00FFFFFF00F7A5
      5A00FFD6A500FFD6A500FFDEB500FFDEB500FFDEB500FFE7C600FFE7C600FFE7
      C600FFEFD600FFEFD600FFF7E700F7A55A0010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF000063CE000000000000000000008C0800008C0800000000000000
      00000000000000000000000000000000000010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF000063CE000000000000000000008C0800008C0800000000000000
      00000000000000000000000000000000000010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF000063CE000000000000000000008C0800008C0800000000000000
      000000000000000000000000000000000000F7A55A00FFFFFF00FFFFFF00F7A5
      5A00FFD6A500FFD6A500FFDEB500FFDEB500FFDEB500FFE7C600FFE7C600FFE7
      C600FFEFD600FFEFD600FFF7E700F7A55A000063CE000063CE000063CE000063
      CE000063CE000063CE000000000000000000008C080000000000EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000063CE000063CE000063CE000063
      CE000063CE000063CE000000000000000000008C080000000000CE630000B55A
      0000B55A0000B55A0000B55A0000B55A00000063CE000063CE000063CE000063
      CE000063CE000063CE000000000000000000008C080000000000EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100FFFFFF00FFFFFF00EF9C
      2100FFD6A500FFD6A500FFDEB500FFDEB500FFDEB500FFE7C600FFE7C600FFE7
      C600FFEFD600FFEFD600FFF7E700EF9C21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E700EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE630000DE73
      4200DE734200DE734200DE734200DE7342000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFFFF00EF9C
      2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EF9C21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE630000D684
      0000D6840000D6840000D6840000D68400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFFFF00EF9C
      2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EF9C21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000CE630000D6840000DE73
      4200CE630000B55A0000000000000000000000000000CE630000D6840000DE73
      4200CE630000B55A0000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000CE630000D6840000DE73
      4200CE630000B55A0000000000000000000000000000CE630000D6840000DE73
      4200CE630000B55A0000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000CE630000D6840000DE73
      4200CE630000B55A0000000000000000000000000000CE630000D6840000DE73
      4200CE630000B55A0000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B0000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000CE630000D6840000DE73
      4200CE630000B55A0000000000000000000000000000CE630000D6840000DE73
      4200CE630000B55A0000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E70000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000CE630000D6840000DE73
      4200CE630000B55A0000000000000000000000000000CE630000D6840000DE73
      4200CE630000B55A0000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000EF9C2100F7A55A00F7A5
      5A00F7A55A00EF9C210000000000008C080000000000EF9C2100F7A55A00F7A5
      5A00F7A55A00EF9C2100000000000000000000000000EF9C2100F7A55A00F7A5
      5A00F7A55A00EF9C210000000000008C080000000000CE630000CE630000CE63
      0000CE630000CE630000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE63000000000000008C080000000000EF9C2100F7A55A00F7A5
      5A00F7A55A00EF9C210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000008C0800008C08000073080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000008C0800008C08000073080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000008C0800008C08000073080000000000000000000000
      000000000000000000000000000000000000FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B0000000000000000000073080000000000EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000000000000000000000000000
      000000000000008C0800008C0800007308000073080000730800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008C0800008C0800007308000073080000730800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008C0800008C0800007308000073080000730800000000000000
      000000000000000000000000000000000000FFF7E700FFF7E700FFF7E700FFF7
      E700FFF7E700F7A55A0000000000000000000073080000730800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007308000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007308000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007308000000000000000000000000000000
      000000000000000000000000000000000000FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C600F7A55A00007308000073080000730800008C0800007308000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007308000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007308000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007308000000000000000000000000000000
      000000000000000000000000000000000000FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C600F7A55A000000000000000000008C0800008C0800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE000063CE000063CE000063CE000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE000063CE000063CE000063CE000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE000063CE000063CE000063CE000063CE00000000000000
      000000000000000000000000000000000000EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C21000000000000000000008C080000000000EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E7000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7A55A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C210000000000000000000000000000000000000000000000
      0000000000000000000000000000008C08000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C210000000000000000000000000000000000000000000000
      00000000000000000000008C0800008C08000073080000000000000000000000
      000000000000000000000000000000000000FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B000000000000000000000000000000
      000000000000000000000000000000000000FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B000000000000000000000000000000
      00000000000000000000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C210000000000000000000000000000000000000000000000
      000000000000008C0800008C0800007308000073080000730800000000000000
      000000000000000000000000000000000000FFF7E700FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFF7E700F7A55A000000000000000000000000000000
      000000000000000000000000000000000000FFF7E700FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFF7E700F7A55A000000000000000000000000000000
      00000000000000000000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C210000000000000000000000000000000000000000000000
      0000000000000000000000000000007308000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7A55A000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7A55A000000000000000000000000000000
      00000000000000000000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C210000000000000000000000000000000000000000000000
      0000000000000000000000000000007308000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7A55A000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7A55A000000000000000000000000000000
      00000000000000000000000000000000000000000000EF9C2100F7A55A00F7A5
      5A00F7A55A00EF9C210000000000008C080000000000EF9C2100F7A55A00F7A5
      5A00F7A55A00EF9C210000000000000000000000000000000000000000000000
      0000000000000063CE000063CE000063CE000063CE000063CE00000000000000
      000000000000000000000000000000000000FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B000000
      0000000000000073080000000000000000000063CE000063CE000063CE000063
      CE000063CE000063CE000063CE000063CE000063CE000063CE000063CE000000
      0000000000000073080000000000000000000000000000000000000000000000
      00000000000000000000008C0800008C08000073080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      000000000000000000000000000000000000FFF7E700FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7E700F7A55A000000
      00000000000000730800007308000000000010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF000063CE000000
      0000000000000073080000730800000000000000000000000000000000000000
      000000000000008C0800008C0800007308000073080000730800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      000000000000000000000000000000000000FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600F7A55A000073
      08000073080000730800008C08000073080010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF000063CE000073
      08000073080000730800008C0800007308000000000000000000000000000000
      0000000000000000000000000000007308000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      000000000000000000000000000000000000FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600F7A55A000000
      000000000000008C0800008C08000000000010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF000063CE000000
      000000000000008C0800008C0800000000000000000000000000000000000000
      0000000000000000000000000000007308000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063CE0010F7FF0010F7FF0010F7FF000063CE00000000000000
      000000000000000000000000000000000000EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C21000000
      000000000000008C080000000000000000000063CE000063CE000063CE000063
      CE000063CE000063CE000063CE000063CE000063CE000063CE000063CE000000
      000000000000008C080000000000000000000000000000000000000000000000
      000000000000EF9C2100F7A55A00F7A55A00F7A55A00EF9C2100000000000000
      00000000000000000000000000000000000000000000EF9C2100F7A55A00F7A5
      5A00F7A55A000063CE0010F7FF0010F7FF0010F7FF000063CE00F7A55A00F7A5
      5A00F7A55A00EF9C21000000000000000000FFF7E700FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFF7E700EF9C21000000000000000000000000000000
      000000000000000000000000000000000000FFF7E700FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFF7E700EF9C21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EF9C2100FFE7C600FFE7C600FFF7E700EF9C2100000000000000
      00000000000000000000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E7000063CE0010F7FF0010F7FF0010F7FF000063CE00FFFFFF00FFFF
      FF00FFF7E700EF9C21000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7A55A000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7A55A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EF9C2100FFE7C600FFE7C600FFF7E700EF9C2100000000000000
      00000000000000000000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E7000063CE0010F7FF0010F7FF0010F7FF000063CE00FFFFFF00FFFF
      FF00FFF7E700EF9C21000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7A55A000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7A55A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EF9C2100FFE7C600FFE7C600FFF7E700EF9C2100000000000000
      00000000000000000000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E7000063CE0010F7FF0010F7FF0010F7FF000063CE00FFFFFF00FFFF
      FF00FFF7E700EF9C21000000000000000000EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000000000000000000000000000
      000000000000000000000000000000000000EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EF9C2100FFE7C600FFE7C600FFF7E700EF9C2100000000000000
      00000000000000000000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E7000063CE0010F7FF0010F7FF0010F7FF000063CE00FFFFFF00FFFF
      FF00FFF7E700EF9C210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EF9C2100FFE7C600FFE7C600FFF7E700EF9C2100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EF9C2100FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFF7
      E700FFF7E700F7A55A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B000000000000000000EF9C2100FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFF7
      E700FFF7E700F7A55A00000000000000000000000000636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B6B00636B
      6B00636B6B00636B6B00636B6B00000000000000000000000000000000000000
      0000000000000000000000000000008C08000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008C8C8C000000000000000000EF9C2100FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFF7
      E700FFF7E700F7A55A000000000000000000000000008C8C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008C8C8C00000000000000000000000000000000000000
      00000000000000000000008C0800008C08000073080000000000000000000000
      000000000000000000000000000000000000000000008C8C8C00FFFFFF00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFFFFF008C8C8C000000000000000000EF9C2100FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFF7
      E700FFF7E700F7A55A000000000000000000000000008C8C8C00FFFFFF000021
      BD00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B000031DE008C8C8C00000000000000000000000000000000000000
      000000000000008C0800008C0800007308000073080000730800000000000000
      000000000000000000000000000000000000000000008C8C8C00FFFFFF00FFB5
      6B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFF
      FF00FFB56B00FFFFFF008C8C8C000000000000000000EF9C2100FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFF7
      E700FFF7E700F7A55A000000000000000000000000008C8C8C00FFFFFF000031
      DE000021BD00FFFFFF00FFB56B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFF
      FF000031DE00FFFFFF008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000007308000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9400FFFFFF00FFB5
      6B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFF
      FF00FFB56B00FFFFFF009C9C94000000000000000000EF9C2100FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFF7
      E700FFF7E700F7A55A000000000000000000000000009C9C9400FFFFFF00FFB5
      6B000031DE000021BD00FFB56B00FFFFFF00FFFFFF00FFB56B000021BD000031
      DE00FFB56B00FFFFFF009C9C9400000000000000000000000000000000000000
      0000000000000000000000000000007308000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9400FFFFFF00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFFFFF009C9C94000000000000000000EF9C2100FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFF7
      E700FFF7E700F7A55A000000000000000000000000009C9C9400FFFFFF00FFB5
      6B00FFB56B000031DE000021BD00FFB56B00FFB56B000021BD000031DE00FFB5
      6B00FFB56B00FFFFFF009C9C9400000000000000000000000000000000000000
      000000000000EF9C2100F7A55A00F7A55A00F7A55A00EF9C2100000000000000
      000000000000000000000000000000000000000000009C9C9400FFFFFF00F7A5
      5A00FFFFFF00FFFFFF00F7A55A00FFFFFF00FFFFFF00F7A55A00FFFFFF00FFFF
      FF00F7A55A00FFFFFF009C9C94000000000000000000EF9C2100FFE7C600FFE7
      C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFF7
      E700FFF7E700F7A55A000000000000000000000000009C9C9400FFFFFF00F7A5
      5A00FFFFFF00FFFFFF000031DE000031E7000021BD000031E700FFFFFF00FFFF
      FF00F7A55A00FFFFFF009C9C9400000000000000000000000000000000000000
      000000000000EF9C2100FFE7C600FFE7C600FFF7E700EF9C2100000000000000
      00000000000000000000000000000000000000000000A5A5A500F7F7F700F7A5
      5A00FFFFFF00FFFFFF00F7A55A00FFFFFF00FFFFFF00F7A55A00FFFFFF00FFFF
      FF00F7A55A00F7F7F700A5A5A5000000000000000000EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100F7A55A00000000000000000000000000A5A5A500F7F7F700F7A5
      5A00FFFFFF00FFFFFF00F7A55A000031E7000031E7000031DE000021BD00FFFF
      FF00F7A55A00F7F7F700A5A5A500000000000000000000000000000000000000
      000000000000EF9C2100FFE7C600FFE7C600FFF7E700EF9C2100000000000000
      00000000000000000000000000000000000000000000A5A5A500F7F7F700EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100F7F7F700A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500F7F7F700EF9C
      2100EF9C2100EF9C21000031DE000031EF00EF9C2100EF9C21000031F7000021
      BD00EF9C2100F7F7F700A5A5A500000000000000000000000000000000000000
      000000000000EF9C2100FFE7C600FFE7C600FFF7E700EF9C2100000000000000
      00000000000000000000000000000000000000000000ADADAD00EFEFEF00EF9C
      2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFF
      FF00EF9C2100EFEFEF00ADADAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADADAD00EFEFEF00EF9C
      2100FFFFFF000031F7000031EF00FFFFFF00FFFFFF00EF9C2100FFFFFF000031
      F700EF9C2100EFEFEF00ADADAD00000000000000000000000000000000000000
      000000000000EF9C2100FFE7C600FFE7C600FFF7E700EF9C2100000000000000
      00000000000000000000000000000000000000000000ADADAD00EFEFEF00EF9C
      2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFF
      FF00EF9C2100EFEFEF00ADADAD00000000000000000000000000000000000073
      0800000000000000000000000000000000000000000000000000000000000073
      08000000000000000000000000000000000000000000ADADAD00EFEFEF00EF9C
      21000031FF000031EF00EF9C2100FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFF
      FF000031F700EFEFEF00ADADAD000000000000000000EF9C2100F7A55A00F7A5
      5A00F7A55A00EF9C2100FFE7C600FFE7C600FFF7E700EF9C2100F7A55A00F7A5
      5A00F7A55A00EF9C2100000000000000000000000000B5B5B500DEDEDE00EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100DEDEDE00B5B5B500000000000000000000000000007308000073
      0800000000000000000000000000000000000000000000000000000000000073
      08000073080000000000000000000000000000000000B5B5B500DEDEDE000031
      F7000031F700EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C21000031F700B5B5B5000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100FFE7C600FFE7C600FFF7E700EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000B5B5B500DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00B5B5B5000000000000000000008C0800008C08000073
      0800007308000073080000000000000000000000000000730800007308000073
      0800008C0800008C0800000000000000000000000000B5B5B500DEDEDE000031
      F700DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00B5B5B5000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100FFE7C600FFE7C600FFF7E700EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100000000000000000000000000B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500000000000000000000000000008C0800008C
      080000000000000000000000000000000000000000000000000000000000008C
      0800008C080000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B5000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100FFE7C600FFE7C600FFF7E700EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008C
      080000000000000000000000000000000000000000000000000000000000008C
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C2100FFE7C600FFE7C600FFF7E700EF9C2100FFFFFF00FFFF
      FF00FFF7E700EF9C210000000000000000000000000000000000000000000000
      00006B63CE001800CE000800BD007B7BCE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000006B63
      CE003121DE001000E7000800DE000800D6002118C600736BCE00000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B5848400000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B5848400000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B58484000000000000000000000000006B63CE003929
      D6000800E7001000EF000800DE001000DE000800DE001000CE002118C6006B63
      CE00000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600848484008484840084848400848484008484840084848400848484008484
      840084848400EFCE9C00B5848400000000000000000000000000C6A59C00FFEF
      D600FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFCE9C00FFCE
      9C00FFCE9C00EFCE9C00B5848400000000000000000000000000C6A59C00FFEF
      D600848484008484840084848400848484008484840084848400848484008484
      840084848400EFCE9C00B58484000000000000000000000000005242CE001000
      DE001000E7001000EF000800E7000800E7001000E7001000DE001000D6000800
      CE006B63CE000000000000000000000000000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B5848400000000000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B5848400000000000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B58484000000000000000000000000004239D6001000
      E7002910F700634AFF001800F7001000EF001000E7000800DE001000DE000800
      D6000800B5000000000000000000000000008400000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEB500F7D6B500F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B5848400000000000000000000000000C6ADA500FFF7
      E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFCE9C00FFCE
      9C00FFCE9C00EFCE9400B5848400000000000073080000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEB500F7D6B500F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B58484000000000000000000000000004239DE003121
      EF005239FF005231FF002908F7002100F7001800F7001800EF001000EF001000
      DE000800BD00000000000000000000000000840000008400000084000000FFFF
      F700848484008484840084848400848484008484840084848400848484008484
      840084848400EFCE9C00B5848400000000000000000000000000AD8C8400BDAD
      A500BDADA500BDADA500BDADA500BDADA500BDADA500BDADA500BDADA500BDAD
      A500BDADA500BDADA500AD7B7B0000000000007308000073080000730800FFFF
      F7000063CE000063CE000063CE000063CE000063CE000063CE000063CE000063
      CE000063CE00EFCE9C00B58484000000000000000000000000004A42E700736B
      F7004A31F7002108F7002900F7002908F7002108EF002910EF001800EF001800
      EF001008C6000000000000000000000000008400000084000000840000008400
      000084FF840084FF840084FF840084FF840084FF840084FF840084FF840084FF
      840084FF840084FF8400B58484000000000000000000A5522900A5522900A552
      2900A5522900A5522900A5522900A5522900A5522900A5522900A5522900A552
      2900A5522900A5522900A5522900A55229000073080000730800007308000073
      080010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF00EFCE9C00B58484000000000000000000000000006363B5004A42
      AD0021108C00181084001800D6001800F7001808E7001800E7001000EF001800
      EF001808C600000000000000000000000000C6000000C6000000C6000000C600
      000084FF840084FF840084FF840084FF840084FF840084FF840084FF840084FF
      840084FF840084FF8400B58484000000000000000000B55A0000BD8C8400E7EF
      EF00EF8C6300EF8C6300EF8C6300EF8C6300EF8C6300EF8C6300EF8C6300EF8C
      6300EF8C6300E7EFEF00BD8C8400B55A0000008C0800008C0800008C0800008C
      080010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7FF0010F7
      FF0010F7FF00F7DEB500B584840000000000000000000000000000000000847B
      CE0042395A0042424A00181084002910E7002110E7002110E7003118EF003110
      F7003921DE00000000000000000000000000C6000000C6000000C6000000FFFF
      FF00848484008484840084848400848484008484840084848400848484008484
      840084848400F7DEB500B58484000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000008C0800008C0800008C0800FFFF
      FF000063CE000063CE000063CE000063CE000063CE000063CE000063CE000063
      CE000063CE00F7DEB500B5848400000000000000000000000000000000000000
      00008C8C940084848C008484BD007B6BF7004231EF002108E7002910EF003121
      E700736BDE00000000000000000000000000C600000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C600F7DEC600F7D6B500B5848400000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C600F7DEC600F7DEB500B584840000000000008C080000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C600F7DEC600F7D6B500B5848400000000000000000000000000000000000000
      0000C6C6C600848484000000000000000000000000006B63CE006B63DE006B63
      CE00000000000000000000000000000000000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B5848400000000000000000000000000DEC6B500FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFCE9C00FFCE
      9C00FFCE9C00F7DEC600B5848400000000000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B5848400000000000000000000000000000000000000
      0000C6C6C6008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF008484840084848400848484008484840084848400FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B5848400000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600F7E7
      D600F7E7D600F7DEC600B5848400000000000000000000000000E7C6B500FFFF
      FF008484840084848400848484008484840084848400FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B584840000000000000000000000000000000000DEDE
      DE00C6C6C6008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B00000000000000000000000000E7C6B500FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFCE9C00FFCE
      9C00FFCE9C00F7E7D600B5848400000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B0000000000000000000000000000000000C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE94730000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7
      F700FFEFDE00FFEFDE00B5848400000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE94730000000000000000000000000000000000DEDEDE00C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00B5848400000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500DEBDB500BD84
      7B00000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500E7C6B500E7C6B500E7C6
      B500E7C6B500E7C6B500E7C6B500000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500DEBDB500BD84
      7B000000000000000000000000000000000000000000FF848400E76B5A00E76B
      5A00E76B5A00E76B5A00E76B5A00E76B5A00E76B5A00E76B5A00E76B5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031000000420000005200000052000000420000003100000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF848400FF84
      8400E76B5A00DE393100DE393100E7423100FF848400FF848400000000000000
      0000000000000000000000000000000000000000000000000000000000000042
      000000420000007B0800009C0800009C0800009C0800009C0800007B0800004A
      0000004A000000000000000000000000000000000000D6730000D6730000D673
      0000D6730000D6730000D6730000D6730000D6730000D6730000D6730000D673
      0000D6730000D6730000D6730000D67300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E76B
      5A00DE393100DE393100E74A4200E74A4200D652420000000000000000000000
      0000000000000000000000000000000000000000000000000000004A08000063
      080000A5100000A50800009C0800009C0800009C0800009C080000A5080000A5
      0800006B080000310000000000000000000000000000D6730000FFFFFF00FFFF
      FF00FFF7E700FFEFDE00FFEFDE00FFE7CE00FFE7CE00FFE7C600FFDEBD00FFDE
      B500FFD6AD00FFD6A500FFD6A500D67300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E76B5A00E74A
      4200E7423100F7635200EF736300E77B6B0084737B0039526B00000000000000
      00000000000000000000000000000000000000000000004A0800006B100008A5
      210008A51800009C0800009C0800009C0800009C0800009C0800009C0800009C
      080000A50800006B0800004A00000000000000000000D6730000FFFFFF00D673
      0000D6730000D6730000D6730000D6730000D6730000FFE7CE00FFE7C600FFDE
      BD00FFDEB500FFD6AD00FFD6A500D67300000000000000000000000000004242
      4200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E76B5A00E74A4200E75A
      4A00F7635200F77B6300AD7B7B005A7B9400217BAD0008639C00085A9C000000
      00000000000000000000000000000000000000000000004A080010AD310010AD
      290008A5180000A5100010AD2100D6F7DE00E7F7EF004AC65200009C0800009C
      0800009C080000A50800004A00000000000000000000D6730000FFFFFF00D673
      0000FFF7EF00FFEFDE00FFE7C600ADC67B00D6730000FFE7CE00FFE7CE00FFE7
      C600FFDEBD00FFDEB500FFD6AD00D67300000000000000000000000000000000
      0000000000000000000000000000000000004242420000000000424242000000
      000000000000000000000000000000000000E76B5A00EF5A4A00EF5A4A00DE73
      6300A57B73005A739C00297BAD000873B500087BB5000873B500086BA5003939
      5A0000000000000000000000000000000000005200000884210010B5420010AD
      2900089C1800009C0800089C180084D68C00FFFFFF00F7FFF70042BD4A00009C
      0800009C080000A50800007B08000042000000000000D6730000FFFFFF00D673
      0000FFFFFF00FFF7EF00FFEFDE0084BD6300D67300009CCE8C00FFE7CE00FFE7
      CE00FFE7C600FFDEBD00FFDEB500D67300000000000000000000000000000000
      0000424242000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E75A4A00E76B5200B5736B004A8C
      A500217BAD000873B5000873B5000873B5000873B5000863A500315263008484
      8400634A63000000000000000000000000000052000010A5420018B54A0010AD
      310000A51000009C0800009C0800009C080073D67B00FFFFFF00F7FFF70042BD
      4A00009C080000A50800009408000042000000000000D6730000FFFFFF00D673
      0000FFFFFF00FFFFFF00FFF7EF00FFEFDE0042AD3100009C000042AD3100DEDE
      BD00FFDEBD00009C0000FFDEBD00D67300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000636B84001873AD00087B
      B5000894C6000873B500087BB500008CBD0018638400425A6300B5B5B500B5B5
      B500A5A5A5005A4A5A000000000000000000006B100021B5520021B55200BDEF
      CE00BDEFC600B5EFC600B5EFC600B5EFC600B5EFC600F7FFF700FFFFFF00EFFF
      EF0052C65A00009C0800009C0800004A000000000000D6730000FFFFFF00D673
      0000DE8C4200DE8C4200DE8C4200DE8C4200D6730000109C1000009C0000109C
      100042AD3100009C0000FFE7C600D67300000000000000000000000000008484
      8400000000004242420000000000000000000000000042424200000000004242
      42000000000000000000000000000000000000000000000000005A73C6001084
      C600087BB500087BB5000894C60010738C0052636300ADADAD0094949400A5A5
      A500ADADAD006B6B6B0000000000000000000873100039BD6B0029BD5A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00ADE7B500009C0800009C08000052000000000000D6730000FFFFFF00EFC6
      8C00D6730000D6730000D6730000D6730000E7A56300BDE7B500009C0000009C
      0000009C0000009C0000FFE7CE00D67300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000298C
      BD002173BD00086BAD0029638C00737373009C9C9C00949494009C9C9C00A5A5
      A500B5B5B5008C8C8C0000000000000000000873100052C67B0042C6730052C6
      7B0052CE840052CE840052CE84004AC673007BD69400F7FFF700FFFFFF0094DE
      A50018AD310008A51800009C08000042000000000000D6730000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042AD3100009C
      0000009C0000009C0000FFE7CE00D67300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000298CBD0029527B0073737300949494009494940094949400A5A5A500BDBD
      BD009C9C9C00000000000000000000000000087310004ABD6B0084DEA50021B5
      520018B54A0021B5520021B5520052C67B00E7F7EF00FFFFFF0084DE9C0010AD
      310008A5290008A51800008C08000042000000000000D6730000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00009C0000009C0000009C
      0000009C0000009C0000FFEFDE00D67300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000063526300949494009494940094949400A5A5A500ADADAD00BDBD
      BD007B7B7B008C8C8C0000000000000000000000000021A53100ADE7C6006BCE
      8C0010AD4A0018B54A0039BD6B00F7FFF700FFFFFF0084DE9C0010AD310008A5
      290008A5210008AD1800006B08000000000000000000D6730000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFEFDE00D67300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000949494007B7B7B008C8C8C007B7B7B006B6B6B00BDBD
      BD00CECECE007B7B7B008C8C8C00000000000000000021A5310052C67300BDEF
      D60063CE8C0021B5520021B55200ADE7C60094DEB50018B54A0010AD390010AD
      310010AD2900109C2100006B08000000000000000000D6730000D6730000D673
      0000D6730000D6730000D6730000D6730000D6730000D6730000D6730000D673
      0000D6730000D6730000D6730000D66B00000000000000000000000000000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      7300C6C6C600C6C6C6007B7B7B008C8C8C000000000000000000109C21006BCE
      8C00D6F7E7009CE7B50052C67B0039BD630029BD5A0031BD630031BD630021BD
      4A0010A5310000630800000000000000000000000000D6730000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE7310000000000000000000000000000000
      0000000000000000000042424200000000004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000737373007B7B7B008C8C8C00949494000000000000000000000000004ABD
      63004ABD630094DEB500BDEFD600A5E7C60094DEB5007BDE9C004AC67B00189C
      3900189C39000000000000000000000000000000000000000000D6730000D673
      0000D6730000D6730000D6730000D6730000D6730000D6730000D6730000D673
      0000D6730000D6730000D6730000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A5009C9C9C00000000000000000000000000000000000000
      00000000000021A5310039B5520042BD630042BD630029A54A00108C29000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5421000A5421000A5421000A5421000A5421000A5421000A5421000A542
      1000A5421000A5421000A5421000A54210000000000000000000C6A59C0029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD600B5848400000000000000000000000000C6A59C0029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD600B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C0029AD
      D6008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7
      FF008CF7FF0029ADD600B5848400000000000000000000000000C6A59C0029AD
      D6008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7
      FF008CF7FF0029ADD600B584840000000000CE630000CE630000CE630000CE63
      0000CE6300000000000000000000000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000000000
      0000A5421000A5421000A5421000A5421000A542100000000000000000000000
      0000A5421000A5421000A5421000A54210000000000000000000C6ADA50029AD
      D6008CF7FF00EF8C6300EF8C6300EF8C6300E7733900E7733900E7632100E763
      21008CF7FF0029ADD600B5848400000000000000000000000000C6ADA50029AD
      D6008CF7FF00EF8C6300EF8C6300EF8C6300E7733900E7733900E7632100E763
      21008CF7FF0029ADD600B5848400000000000000000000000000CE630000944A
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE630000944A000000000000000000000000000000000000000000000000
      00000000000000000000A5421000A5421000BD6B290000000000000000000000
      000000000000A5421000A5421000000000000000000000000000C6ADA50029AD
      D6008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7
      FF008CF7FF0029ADD600B5848400000000000000000000000000C6ADA50029AD
      D6008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7FF008CF7
      FF008CF7FF0029ADD600B584840000000000000000000000000000000000CE63
      0000944A00000000000000000000000000000000000000000000000000000000
      0000CE630000944A000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5421000A5421000BD6B2900000000000000
      000000000000A5421000A5421000000000000000000000000000CEB5AD0029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD600B5848400000000000000000000000000CEB5AD0029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD600B5848400000000000000000000000000000000000000
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000944A000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5421000A5421000A5421000A542
      1000A5421000A5421000A5421000000000000000000000000000D6B5AD00FFFF
      FF00FFFFFF00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7EF00FFF7EF00B5848400000000000000000000000000D6B5AD00FFFF
      FF00FFFFFF00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7EF00FFF7EF00B5848400000000000000000000000000000000000000
      000000000000CE630000944A0000000000000000000000000000000000000000
      0000CE630000944A000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5421000A5421000BD6B
      290000000000A5421000A5421000000000000000000000000000D6BDB500FFFF
      FF00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFF7EF00B5848400000000000000000000000000D6BDB500FFFF
      FF00FFEFD600FFEFD600FFEFD600000000000000000000000000FFEFD600FFEF
      D600FFEFD600FFF7EF00B5848400000000000000000000000000000000000000
      00000000000000000000CE630000944A00000000000000000000000000000000
      0000CE630000944A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5421000A542
      1000BD6B2900A5421000A5421000000000000000000000000000D6BDB500FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500FFF7F700B5848400000000000000000000000000D6BDB500FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A50000000000FFD6A500FFD6A500FFD6
      A500FFD6A500FFF7F700B5848400000000000000000000000000000000000000
      0000000000000000000000000000CE630000944A000000000000000000000000
      0000CE630000944A000000000000000000000000000000000000848484000000
      000084848400000000000000000000000000000000000000000000000000A542
      1000A5421000A5421000A5421000000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700B5848400000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700B5848400000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000944A0000000000000000
      0000CE630000944A000000000000000000000000000084848400000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000A5421000A5421000A5421000000000000000000000000000DEC6B500FFFF
      FF00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600E7DEC600C6BDAD00B5848400000000000000000000000000DEC6B500FFFF
      FF00FFEFD600FFEFD600FFEFD600FFEFD60000000000FFEFD600FFEFD600FFEF
      D600E7DEC600C6BDAD00B5848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000944A00000000
      0000CE630000944A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5421000A5421000000000000000000000000000E7C6B500FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500C6A5
      9400B5948C00B58C8400B5848400000000000000000000000000E7C6B500FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A50000000000FFD6A500FFD6A500C6A5
      9400B5948C00B58C8400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE630000944A
      0000CE630000944A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B00000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFF7F700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000CE630000944A000000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE94730000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00E7D6CE00C694
      7B00FFC67300CE94730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE630000944A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001894CE001894
      CE001894CE001894CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60031B5DE0021AD
      D600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001894CE00ADF7
      FF007BF7FF006BEFF70031B5DE0031B5DE0031B5DE001894CE001894CE001094
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CDEEF0084EF
      FF004AC6E70021ADD60018A5C60018A5C60018A5C60000000000000000000000
      00000000000000000000000000000000000000000000000000001894CE0084DE
      EF0094FFFF007BF7FF0084F7FF0084F7FF007BF7FF006BE7FF0063DEF70031B5
      DE0031B5DE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60052BDE7009CFF
      FF0094FFFF0073DEF70073DEF70073DEF700D6D6E7004AC6E70021ADD60018A5
      C600000000000000000000000000000000001894CE001894CE001894CE0063C6
      E70094FFFF0073F7FF007BF7FF0073EFFF0073EFFF0073EFFF007BEFFF007BF7
      FF0052C6E7001894CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000008C0800000000000000000029ADD60052BDE700ADFF
      FF008CF7FF008CEFFF008CEFFF00BDCED600848CB500D6D6E70073DEF7004AC6
      EF0021ADD6000000000000000000000000001894CE0073DEF7001894CE001894
      CE0084E7F7007BF7FF007BF7FF0073EFFF0073EFFF0073EFFF0073EFFF0073EF
      FF0052C6E7001894CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000008C080000730800007308000000000029ADD60029ADD600ADDE
      EF0094F7FF0094F7FF00BDCED6008C94CE008C94CE008C94CE00D6D6E70073DE
      F7004AC6EF000000000000000000000000001894CE005ACEEF001894CE005AD6
      EF001894CE0094FFFF0073F7FF007BEFFF0073EFFF0073EFFF0073EFFF0073EF
      FF0052C6E7006BE7FF001894CE0000000000CE630000CE630000CE630000CE63
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000730800000000000000000029ADD60073DEF70029AD
      D6009CFFFF00BDCED6008C94CE008C94DE008C94DE008C94DE008C94CE00D6D6
      E70073DEF70018A5C60000000000000000001894CE005ACEEF001894CE007BF7
      FF001894CE0073CEEF007BDEEF007BDEEF0094EFFF0084F7FF006BEFFF006BEF
      FF0052C6E70073EFFF0042C6E7000000000000000000CE630000944A00000000
      0000000000000000000000000000000000000000000000000000CE630000944A
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000730800000000000000000029ADD60094F7FF0029AD
      D6009CBDC6008C94DE008C94DE008C94DE008C94DE008C94DE008C94DE008C94
      CE00D6D6E70039BDE70000000000000000001894CE005ACEEF001894CE008CFF
      FF0063E7F7001894CE001894CE001894CE005AC6E7007BDEEF008CF7FF007BF7
      FF005AD6EF007BEFFF0073EFFF0018A5D6000000000000000000CE630000944A
      0000000000000000000000000000000000000000000000000000CE630000944A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000730800000000000000000029ADD6009CFFFF005273
      8C008C94CE008C94CE008C94CE008C94CE008C94CE008C94DE008C94DE008C94
      DE008C94CE00BDCED60018A5C600000000001894CE005AD6EF001894CE0084FF
      FF0084FFFF0084FFFF007BF7FF007BF7FF001894CE001894CE006BCEEF0094E7
      F70084DEEF0094E7F700A5F7FF0039ADDE00000000000000000000000000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000944A
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000084848400000000000000
      0000000000000000000000730800000000000000000029ADD60052738C001031
      E7001031E7001031E7001031E7001031E7001031E7008C94CE008C94DE008C94
      DE008C94DE008C94CE007B7B8C00000000001894CE007BF7FF001894CE008CFF
      FF007BF7FF007BF7FF007BF7FF0084F7FF0084FFFF0073F7FF001894CE001894
      CE001894CE001894CE00299CCE001894CE000000000000000000000000000000
      0000CE630000944A000000000000000000000000000000000000CE630000944A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000730800000000000000000052738C001031E700294A
      F700294AF700294AF7002142E7002142E7002142E7002142E7008C94CE008C94
      CE008C94CE008C94CE008C94CE00848CB5001894CE008CFFFF001894CE0084E7
      F70094FFFF008CFFFF0084FFFF0063D6EF001894CE001894CE001894CE001894
      CE001894CE0018A5D60000000000000000000000000000000000000000000000
      000000000000CE630000944A0000000000000000000000000000CE630000944A
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000008484840000000000000000000000
      0000000000000000000000730800000000000000000018297300182973001829
      73001829730018319C00425AF700395AEF00395AEF00395AEF00425AF7001831
      9C001829730018319C0018297300182973001894CE0084FFFF006BEFF7001894
      CE001894CE001894CE001894CE001894CE004AB5DE005AC6E7005AC6E70063C6
      E7006BCEEF0039ADDE0000000000000000000000000000000000000000000000
      00000000000000000000CE630000944A00000000000000000000CE630000944A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008C080000730800007308000000000021ADD6009CDEEF00C6FF
      FF00C6FFFF00182973004A63F7004A63F7004A63F7004A63F7004A63F7001829
      7300000000000000000000000000000000001894CE008CFFFF007BF7FF007BF7
      FF007BF7FF0084F7FF0084FFFF0073F7FF0052D6EF004AC6E70042BDE7001894
      CE00299CCE001894CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000CE630000944A000000000000CE630000944A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000848484000000000000000000000000000000
      00000000000000000000008C080000000000000000000000000031B5DE0029AD
      D60018A5C60018297300738CFF00637BF700637BF700637BF700637BF7001829
      7300000000000000000000000000000000001894CE0084E7F70094FFFF008CFF
      FF0084FFFF0063D6EF001894CE001894CE001894CE001894CE001894CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000944A0000CE630000944A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400395252008484840039525200848484003952
      5200848484003952520084848400000000000000000000000000000000000000
      00000000000018319C00738CFF00738CFF00738CFF00738CFF00738CFF001829
      730000000000000000000000000000000000000000001894CE001894CE001894
      CE001894CE001894CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000944A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001829730018297300182973001829730018297300182973001829
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE630000944A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029A5D600189CCE00088C
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000189CCE00189C
      CE00189CCE00189CCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60031B5DE0021AD
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000219CCE00A5EFF7006BEFFF005ADE
      F70029A5D60029A5D60000000800081010000010100000081000000008000000
      0000000000000000000000000000000000000000000000000000189CCE00ADF7
      FF007BF7FF006BEFF70031B5DE0031B5DE0031B5DE00189CCE00189CCE001094
      CE00000000000000000000000000ADADAD000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CDEEF0084EF
      FF004AC6E70021ADD60018A5C60018A5C60018A5C60000000000000000000000
      000000000000000000000000000000000000088CC6009CDEEF008CFFFF0084FF
      FF0084FFFF0073E7E7001839390073FFFF001873FF00084AFF0018637B001863
      7B0029A5D6000000000000000000000000000000000000000000189CCE0084DE
      EF0094FFFF007BF7FF0084F7FF0084F7FF007BF7FF0073EFFF0063DEF70031B5
      DE0031B5DE0000000000A5A5A500424242000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60052BDE7009CFF
      FF0094FFFF0073DEF70073DEF70073DEF70073DEF7004AC6E70021ADD60018A5
      C600000000000000000000000000000000001094CE0029A5D6009CFFFF0073F7
      FF007BF7FF006BDEE700183139002973FF001042FF001042FF00001052003984
      840029A5D6000000000000000000000000000000000000000000189CCE0063C6
      E70094FFFF0073F7FF007BF7FF0073EFFF0073EFFF0073EFFF0073EFFF007BF7
      FF0052C6E700ADADAD005A5A5A009C9C9C000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60052BDE700ADFF
      FF008CF7FF008CEFFF008CEFFF008CEFFF0073DEF70073DEF70073DEF7004AC6
      EF0021ADD60000000000000000000000000029A5D60029A5D6009CEFF7007BF7
      FF007BF7FF006BDEE7001831390042A5FF0073EFFF0052B5FF000008AD004A9C
      AD0063E7FF00189CD60000000000000000000000000000000000189CCE00189C
      CE0084E7F7007BF7FF007BF7FF0073EFFF0073EFFF0073EFFF0073EFFF0073EF
      FF00BDBDBD006B6B6B009C9C9C00B5B5B5000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60029ADD600ADDE
      EF0094F7FF0094F7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DEF70073DE
      F7004AC6EF0000000000000000000000000029A5D60063DEF70029A5D60084FF
      FF0073F7FF006BDEE7001021210063C6B50052ADB50052A5AD00001084000029
      FF0052C6FF0029A5D60000000000000000000000000000000000189CCE0052DE
      EF00189CCE0094FFFF0073F7FF009C9C9C009C9C9C009C9C9C009C9C9C0073EF
      FF006B6B6B00181818006B6B6B00848484000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60073DEF70029AD
      D6009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF008CEFFF0073DE
      F70073DEF70018A5C600000000000000000029A5D6007BF7FF0029A5D600ADFF
      FF0073F7FF0073EFFF0029636B00295A5A00295A5A00295A5A0029A5D600297B
      FF000029FF0052CEF7001094CE00000000000000000000000000189CCE007BF7
      FF00189CCE0073CEEF00BDBDBD004A4A4A00524A4A004A4A4A0052525200A5A5
      A500393939006B6B6B00BDBDBD00000000000000000000000000000000008C7B
      7300736352000000D6000000D6000000D6000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60094F7FF0029AD
      D600ADDEEF00A5EFF700A5EFF700A5F7FF008CEFFF008CEFFF008CEFFF0073DE
      F70073DEF70039BDE700000000000000000029A5D60084FFFF004ACEE70029A5
      D60094E7F70094E7F7008CDEE7006BCED6005AC6CE005AC6CE005AC6CE0073EF
      EF00297BF7001042FF0029A5D600000000000000000000000000189CCE008CFF
      FF0063E7F70094949C0094846B0084E7F70084E7F70084E7F70084E7F700A594
      84006B6B6B00DEDED60073EFFF0018A5D6000000000000000000000000008C7B
      7300736352000000B5000808E7000808E7000000D6000000D600000000000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF0073DE
      F70029ADD60018A5C60018A5C60018A5C600ADDEEF008CF7FF0084EFFF0084EF
      FF0073DEF70073DEF70018A5C6000000000029A5D60084FFFF007BFFFF0052D6
      EF0029A5D60029A5D6000008100010313900394A420018394A0008212900317B
      8C005AE7FF0084FFFF0063DEF70029A5D6000000000000000000189CCE0084FF
      FF00BDBDBD004239390084E7F70084E7F70084E7F70084E7F70084E7F70084E7
      F7006B636300C6C6C600A5F7FF0039ADDE000000000000000000000000008C7B
      7300736352000000B5000808E7001008F7000808E7000808E7000000D6000000
      D6000000D6000000000000000000000000000000000029ADD6009CFFFF0094F7
      FF0073DEF70073DEF70073DEF7006BDEF70029ADD600ADDEEF0084EFFF0084EF
      FF0084EFFF0094EFFF0031A5D6000000000029A5D60084FFFF007BFFFF0084FF
      FF007BF7FF006BDEE7001839390063FFFF00297BF700316BFF004A7B84004A7B
      840084EFFF009CF7FF0094F7FF0021A5D6000000000000000000189CCE008CFF
      FF00A5A5A500C6B5940073CEEF0084E7F70084E7F70084E7F70084E7F70084E7
      F7009C8C730073737300299CCE00189CCE000000000000000000000000008C7B
      7300736352000000B5000808E7001008F7001008F7000808E7000000D6001008
      F7000808E7000000D6000000D600000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0073DEF70073DEF70029ADD60018A5C60029A5
      D60029A5D60029A5D60018A5C6000000000029A5D60084FFFF007BF7FF007BF7
      FF007BF7FF006BDEE700183939003184FF000831FF000839FF0000084A003973
      7B0029A5D60029A5D60029A5D60029A5D6000000000000000000189CCE0084E7
      F7009C9C9C00D6BDA500FFE7D60073CEEF0073CEEF0073CEEF0084E7F70084E7
      F700AD9C8C008484840000000000000000000000000000000000000000008C7B
      7300736352000000B5000808E7001008F7001008F7000808E7000000D6001008
      F7000808E7000000D6000808E7000000D6000000000029ADD600C6FFFF0094FF
      FF009CFFFF00D6FFFF00D6FFFF008CEFFF0094EFFF0073DEF70073DEF70018AD
      DE000000000000000000000000000000000031ADD6008CFFFF007BF7FF007BF7
      FF007BF7FF006BDEE7001831390042A5FF0073EFFF0052B5FF000008B500429C
      AD0018ADDE00000000000000000000000000000000000000000000000000189C
      CE00B5B5AD00C6BDA500FFD6B500FFDEC600FFF7DE00FFF7DE0073CEEF0073CE
      EF00A5947B0084848C0000000000000000000000000000000000000000008C7B
      7300736352000000B5000808E7001008F7001008F7000808E7000808E7000000
      D6000000D6000000D6000000D600000000000000000021ADD6009CDEEF00C6FF
      FF00C6FFFF009CDEEF0018ADD60018A5C60018A5C60018A5C60018A5C60018A5
      CE0000000000000000000000000000000000219CCE009CEFF70084FFFF007BFF
      FF007BFFFF0063DEE7000810100039636300315A5A0029525A000018A5001852
      FF0018A5CE000000000000000000000000000000000000000000000000000000
      0000CECECE00A59C8C00FFD6AD00FFE7D600F7FFFF00FFFFF700FFDED600FFD6
      B50094947B00A5A5A50000000000000000000000000000000000000000008C7B
      7300736352000000B5000808E7001008F7000000D6000000D6000000D6000000
      000000000000000000000000000000000000000000000000000031B5DE0029AD
      D60018A5C60018A5C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039ADDE006BD6EF006BD6
      EF007BE7F70031B5DE0000000000000000000000000000000000000000000018
      FF000029F7000000000000000000000000000000000000000000000000000000
      000000000000CECECE00BDB59400F7D6AD00FFFFE700FFF7DE00EFD6A500CEBD
      A500BDBDBD000000000000000000000000000000000000000000000000008C7B
      7300736352000000D6000000D6000000D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000108CC600108C
      C600108CC6000000000000000000000000000000000000000000000000000000
      00000018FF000018FF0000000000000000000000000000000000000000000000
      00000000000000000000A5A5A500B5B5A500EFD6A500E7CE9C00CEC6B500A5A5
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001073100010731000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000426BF7000818BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001084100039BD630010731000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000426BF7000021C6000018C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001084100052E77B0039BD630010731000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000426BF7000018BD001029D6000010C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001084100084F7A50039BD630010731000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000426BF7000021C6001031D6000018CE001018BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001084100084F7A50039BD630010731000000000000000
      000000000000000000000000000000000000000000000000000000000000426B
      F7000021C600527BEF000018D6000018D6000010C6000010BD000010B5001021
      BD004A4ABD00424ABD00424ABD006B63C6000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001084100084F7A50039BD630010731000000000000000
      0000000000000000000000000000000000000000000000000000426BF7000021
      C600527BEF001031E7000021CE000018CE000018BD000010C6000010B5000008
      A50000089C000008A5003939B5000008AD000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001084100084F7A50039BD630010731000000000000000
      00000000000000000000000000000000000000000000426BF7000021C600527B
      EF000021E7000029DE000021D6000018CE000018C6000010C6000008B5000010
      AD000000A5000008A50000009C000008AD000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      7300736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001084100084F7A50039BD630010731000000000000000
      000000000000000000000000000000000000426BF7000021C6005273FF00214A
      EF000029EF000021DE000021D6000018CE000018C6000010BD000010B5000008
      AD0008089C000800A5003939B5000008AD000000000000000000000000008C7B
      730073635200BD636300BD636300BD6363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      73007363520008A5180008A5180008A518000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001084100084F7A50052E77B0039BD6300104A1000107310000000
      000000000000000000000000000000000000426BF7000021C600527BEF001042
      E7000021E7000821E7000021CE000018CE000018C6000010BD000008B5000008
      AD000008A5000000A50000009C000008AD000000000000000000000000008C7B
      730073635200B55A0000E7841800E7841800BD636300BD636300000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      73007363520008A5180021B5310021B5310008A5180008A51800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001084100084F7A50052E77B0052E77B0039AD520010631000104A10001073
      10000000000000000000000000000000000000000000426BF7000021C600426B
      F7000821E7000021D6000021D6000018CE000018C6000010BD000010B5000008
      AD000008A5000808A50000009C000008AD000000000000000000000000008C7B
      730073635200B55A0000E7841800EFA55200E7841800E7841800BD636300BD63
      6300BD6363000000000000000000000000000000000000000000000000008C7B
      73007363520008A5180021B5310021D6390021B5310021B5310008A5180008A5
      180008A518000000000000000000000000000000000000000000000000001084
      100084F7A5006BEF8C0063EF840052E77B0039BD5A001094100010631000104A
      1000107310000000000000000000000000000000000000000000426BF7000021
      C600527BEF001031D6000021D6000018CE000018C6000010BD000008AD000010
      AD000808A5000800A5003939B5000008AD000000000000000000000000008C7B
      730073635200B55A0000E7841800EFA55200EFA55200E7841800E7841800EFA5
      5200E7841800BD636300BD636300000000000000000000000000000000008C7B
      73007363520008A5180021B5310021D6390021D6390021B5310021B5310021D6
      390021B5310008A5180008A518000000000000000000000000001084100084F7
      A5006BEF940063EF8C0052E77B004AD6730039BD630039BD6300109410001063
      1000104A1000107310000000000000000000000000000000000000000000426B
      F7000018BD00527BEF000021D6000021CE000018C6000010BD000810BD001021
      BD00424ABD00424ABD00424ABD00736BBD000000000000000000000000008C7B
      730073635200B55A0000E7841800EFA55200EFA55200E7841800E7841800EFA5
      5200E7841800E7841800D6731800BD6363000000000000000000000000008C7B
      73007363520008A5180021B5310021D6390021D6390021B5310021B5310021D6
      390021B5310021B5310021C6310008A51800000000001084100084F7A5006BEF
      940052DE73004AD6630042CE5A0031BD520039BD630039BD630039BD63001094
      100010631000104A100010731000000000000000000000000000000000000000
      0000426BF7000021C6000829D6000818D6000818BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      730073635200B55A0000E7841800EFA55200EFA55200E7841800E7841800BD63
      6300BD636300BD636300BD636300000000000000000000000000000000008C7B
      73007363520008A5180021B5310021D6390021D6390021B5310021B5310008A5
      180008A5180008A5180008A51800000000001084100010841000108410001084
      1000108410001084100010841000108410001084100010841000108410001084
      1000108410001084100010841000108410000000000000000000000000000000
      000000000000426BF7000018BD000021CE000021C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      730073635200B55A0000E7841800EFA55200BD636300BD636300BD6363000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      73007363520008A5180021B5310021D6390008A5180008A5180008A518000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000426BF7000021C6000021C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      730073635200BD636300BD636300BD6363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      73007363520008A5180008A5180008A518000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000426BF7000810BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5636B00A5636B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5636B0084848400A5636B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD4A
      00008C2900008C2900008C2900008C2900008C2900008C2900008C2900008C29
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00CECED60084848400A5636B00000000000000
      00000000000000000000000000000000000000000000BD4A0000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000BD4A000000000000000000000000000000000000BD4A
      00008C2900008C2900008C2900008C2900008C2900008C2900008C2900008C29
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000BD4A00008C2900008C29
      00008C2900008C2900008C2900008C2900008C2900008C2900008C2900008C29
      0000BD4A0000FFFFFF00FFFFFF008400000084000000FFFFFF00FFFFFF00BD4A
      00008C2900008C2900008C2900008C2900008C2900008C2900008C2900008C29
      00008C2900008C290000BD4A000000000000000000000000000000000000BD4A
      00008C2900008C2900008C290000FFFFFF00FFFFFF008C2900008C2900008C29
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000BD4A00008C2900008C29
      00008C2900008C290000FFFFFF008C2900008C2900008C2900008C2900008C29
      0000BD4A0000FFFFFF00FFFFFF008400000084000000FFFFFF00FFFFFF00BD4A
      00008C2900008C2900008C2900008C2900008C290000FFFFFF008C2900008C29
      00008C2900008C290000BD4A000000000000000000000000000000000000BD4A
      00008C2900008C2900008C290000FFFFFF00FFFFFF008C2900008C2900008C29
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5736B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000BD4A00008C2900008C29
      00008C290000FFFFFF00FFFFFF008C2900008C2900008C2900008C2900008C29
      0000BD4A0000FFFFFF00FFFFFF008400000084000000FFFFFF00FFFFFF00BD4A
      00008C2900008C2900008C2900008C2900008C290000FFFFFF00FFFFFF008C29
      00008C2900008C290000BD4A000000000000000000000000000000000000BD4A
      00008C2900008C2900008C290000FFFFFF00FFFFFF008C2900008C2900008C29
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD846B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000BD4A00008C2900008C29
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C29
      0000BD4A0000FFFFFF00FFFFFF008400000084000000FFFFFF00FFFFFF00BD4A
      00008C290000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008C2900008C290000BD4A000000000000000000000000000000000000BD4A
      00008C2900008C2900008C290000FFFFFF00FFFFFF008C2900008C2900008C29
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6946B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000BD4A00008C2900008C29
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C29
      0000BD4A0000FFFFFF00FFFFFF008400000084000000FFFFFF00FFFFFF00BD4A
      00008C290000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008C2900008C290000BD4A000000000000000000000000000000000000BD4A
      00008C290000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C29
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000BD7B5A00EFEFEF00CECED6008484840042424200A5636B000000
      00000000000000000000000000000000000000000000BD4A00008C2900008C29
      00008C290000FFFFFF00FFFFFF008C2900008C2900008C2900008C2900008C29
      0000BD4A0000FFFFFF00FFFFFF008400000084000000FFFFFF00FFFFFF00BD4A
      00008C2900008C2900008C2900008C2900008C290000FFFFFF00FFFFFF008C29
      00008C2900008C290000BD4A000000000000000000000000000000000000BD4A
      00008C2900008C290000FFFFFF00FFFFFF00FFFFFF00FFFFFF008C2900008C29
      0000840000000000000000000000000000000000000000000000000000000000
      0000BD7B5A00EFEFEF00CECED600BDBDBD008C8C8C005A5A5A0042424200A563
      6B000000000000000000000000000000000000000000BD4A00008C2900008C29
      00008C2900008C290000FFFFFF008C2900008C2900008C2900008C2900008C29
      0000BD4A0000FFFFFF00FFFFFF008400000084000000FFFFFF00FFFFFF00BD4A
      00008C2900008C2900008C2900008C2900008C290000FFFFFF008C2900008C29
      00008C2900008C290000BD4A000000000000000000000000000000000000BD4A
      00008C2900008C2900008C290000FFFFFF00FFFFFF008C2900008C2900008C29
      000084000000000000000000000000000000000000000000000000000000BD7B
      5A00EFEFEF00EFEFEF00C6C6C600ADADAD008C8C8C00737373005A5A5A004242
      4200A5636B0000000000000000000000000000000000BD4A00008C2900008C29
      00008C2900008C2900008C2900008C2900008C2900008C2900008C2900008C29
      0000BD4A0000FFFFFF00FFFFFF008400000084000000FFFFFF00FFFFFF00BD4A
      00008C2900008C2900008C2900008C2900008C2900008C2900008C2900008C29
      00008C2900008C290000BD4A000000000000000000000000000000000000BD4A
      00008C2900008C2900008C2900008C2900008C2900008C2900008C2900008C29
      0000840000000000000000000000000000000000000000000000BD7B5A00EFEF
      EF00EFEFEF00CECED600BDBDBD009C9C9C008484840084848400737373005A5A
      5A0042424200A5636B00000000000000000000000000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A000000000000000000000000000000000000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      00008400000000000000000000000000000000000000BD7B5A00EFEFEF00EFEF
      EF00CECED600C6C6C600C6C6C600848484008484840084848400848484007373
      73005A5A5A0042424200A5636B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD4A
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000000000000000000000000000D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD4A
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C6363004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002194
      BD00087BAD000000000000000000000000000000000000000000000000000884
      B5001084B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C6363009C636300BD636300BD6B6B004242420000000000000000000000
      00000000000000000000000000000000000000000000000000001884AD0073D6
      EF004AC6E700087BAD0000000000000000000000000000000000219CC6009CE7
      F70018A5CE001884AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000000000000000000000000000000000000000000008C6363009C63
      6300C66B6B00D66B6B00D66B6B00C66B6B00424242009C6363009C6363009C63
      63009C6363009C6363009C6363000000000000000000000000000000000042AD
      CE007BF7FF0052C6E700087BAD00000000000000000031A5CE00B5F7FF005ADE
      FF0042ADCE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD4A
      00008C2900008C2900008C2900008C2900008C2900008C2900008C2900008C29
      00008400000000000000000000000000000000000000000000009C636300D66B
      6B00D66B6B00D66B6B00CE6B6B00C66B6B0042424200C67B7B00DE8C8C00F794
      9400F7A5A500F7A5A5009C636300000000000000000000000000000000001884
      AD0063DEF7006BEFFF0063D6EF001084B50039ADCE00C6F7FF006BEFFF0063DE
      F7000073A5000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD4A
      00008C2900008C2900008C2900008C2900008C2900008C2900008C2900008C29
      00008400000000000000000000000000000000000000000000009C636300D66B
      6B00D66B6B00D6737300D6737300CE6B73004242420000940000009400000094
      000000940000F7A5A5009C636300000000000000000000000000000000000000
      00001884AD0052E7FF0073E7FF0073DEF700B5F7FF009CF7FF005AE7FF001884
      AD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A00848484004A4A4A0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD4A
      00008C2900008C2900008C290000FFFFFF00FFFFFF008C2900008C2900008C29
      00008400000000000000000000000000000000000000000000009C636300D673
      7300D6737300DE737300DE737300D67373004242420000940000009400000094
      000000940000F7A5A5009C636300000000000000000000000000000000000000
      0000000000001884AD004ADEFF0073E7FF008CEFFF009CF7FF001884AD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A00BDBDBD0094949C00848484004A4A4A00000000000000
      000000000000AD5218000000000000000000000000000000000000000000BD4A
      00008C2900008C290000FFFFFF00FFFFFF00FFFFFF00FFFFFF008C2900008C29
      00008400000000000000000000000000000000000000000000009C636300E77B
      7B00E77B7B00E77B7B00E7848400D67373004242420000940000008400000084
      000000840000F7A5A5009C63630000000000000000000000000000000000087B
      AD001884AD0021D6FF0029D6FF004ADEFF0073E7FF0094F7FF007BDEEF001884
      AD001884AD000000000000000000000000000000000000000000000000000000
      00004A4A4A00C6C6C6009C9C9C00BDBDBD0094949C00848484004A4A4A000000
      000000000000FF6B5200AD52180000000000000000000000000000000000BD4A
      00008C290000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C29
      00008400000000000000000000000000000000000000000000009C636300F784
      8C00EF848400EF949400FFDEDE00DE8C8C004242420000840000008400000063
      000000630000F7A5A5009C63630000000000000000000073A5002994BD0073D6
      EF0063E7FF0031DEFF0018D6FF0031DEFF005ADEFF0073E7FF009CF7FF008CEF
      FF0042BDDE0042BDDE000073A500000000000000000000000000000000005A5A
      5A00BDBDBD007B848400A5A5A500ADADAD00BDBDBD0094949C00848484003131
      310000000000FF6B5200BD5A180000000000000000000000000000000000BD4A
      00008C2900008C2900008C290000FFFFFF00FFFFFF008C2900008C2900008C29
      00008400000000000000000000000000000000000000000000009C636300F784
      8C00EF848400F79C9C00FFFFFF00DE8C8C0042424200FFCEAD00F7B58400F7B5
      8400F7B58400F7A5A5009C63630000000000218CB50084CEDE00DEFFFF00CEFF
      FF0094F7FF006BEFFF0031DEFF0018D6FF0031DEFF005AE7FF007BF7FF00A5FF
      FF00A5FFFF0063DEF70084CEDE000073A50000000000000000005A5A5A00C6C6
      C600FFFFFF00BDBDBD007B848400A5A5A5009C949400BDBDBD0094949C007B84
      840031313100FF6B5200D663210000000000000000000000000000000000BD4A
      00008C2900008C2900008C290000FFFFFF00FFFFFF008C2900008C2900008C29
      00008400000000000000000000000000000000000000000000009C636300F78C
      8C00F78C8C00F78C8C00F78C8C00DE7B840042424200FFCEAD00FFD6BD00FFD6
      BD00FFD6BD00F7A5A5009C636300000000000073A5000073A5000073A5000073
      A5000073A5000073A50073D6EF0029D6FF0018D6FF0029BDE7000073A5000073
      A5000073A5000073A5000073A5000073A5000000000000000000000000005A5A
      5A00C6C6C600FFFFFF00BDBDBD007B8484006B5A5A0084737300BDBDBD008C94
      940073737300FF6B5200FF42420000000000000000000000000000000000BD4A
      00008C2900008C2900008C290000FFFFFF00FFFFFF008C2900008C2900008C29
      00008400000000000000000000000000000000000000000000009C636300F78C
      8C00F7949400F7949400F78C8C00E784840042424200FFCEAD00FFD6BD00FFD6
      BD00FFD6BD00F7A5A5009C636300000000000000000000000000000000000000
      000000000000000000000073A50063E7FF0029D6FF00088CBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005A5A5A00C6C6C600EFEFEF006B737300313131006B737300C6C6C600FF42
      4200FF6B5200FF424200E7B5940000000000000000000000000000000000BD4A
      00008C2900008C2900008C290000FFFFFF00FFFFFF008C2900008C2900008C29
      00008400000000000000000000000000000000000000000000009C636300F78C
      8C00FF949400FF949400F7949400E78C8C0042424200FFCEAD00FFD6BD00FFD6
      BD00FFD6BD00F7A5A5009C636300000000000000000000000000000000000000
      000000000000000000000073A5008CEFFF004ADEFF001084B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A00C6C6C600EFEFEF0031313100C6C6C60084848400E7B5
      9400FF424200E7B594000000000000000000000000000000000000000000BD4A
      00008C2900008C2900008C2900008C2900008C2900008C2900008C2900008C29
      00008400000000000000000000000000000000000000000000009C636300F78C
      8C00FF949400FF9C9C00FF949400E78C8C0042424200FFCEAD00FFD6BD00FFD6
      BD00FFD6BD00F7A5A5009C636300000000000000000000000000000000000000
      000000000000000000000073A500ADF7FF005ACEEF00087BAD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006363630084848400C6C6C60031424A0084848400FF4242000000
      000000000000000000000000000000000000000000000000000000000000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      00008400000000000000000000000000000000000000000000009C6363009C63
      6300E79C9C00FF949400FF9C9C00EF8C940042424200FFCEAD00FFD6BD00FFD6
      BD00FFD6BD00F7A5A5009C636300000000000000000000000000000000000000
      000000000000000000000073A500BDF7FF005AB5D6000073A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B73730000000000848484004A4A4A00E7B59400000000000000
      000000000000000000000000000000000000000000000000000000000000BD4A
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000000000000000000000000
      00009C636300B5737300D6848400DE8C8C00424242009C6363009C6363009C63
      63009C6363009C6363009C636300000000000000000000000000000000000000
      000000000000000000000073A500CEEFF70063B5D6000073A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C0000000000000000006B73730000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD4A
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000000000000000000000000
      000000000000000000009C6363009C6363004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000298CBD001884AD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000094949C008C8C8C0094949C000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD4A
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000527B
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600FFE7C600FFD6AD00FFD6AD00F7D6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6A500EFCE9C00EFCE9C00EFCE
      9400EFCE9400EFCE9C00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000317B
      EF00527BC600296BC60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00BDC6
      C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6C600BDC6
      C600BDC6C600BDC6C600FFD6AD00CE6300000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B58484000000000000000000AD738400B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400B5848400000000000000000000000000397B
      E700007BFF000073F700527BC600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00292929005A524A00ADADAD00FFF7E700FFE7C600FFE7C600FFD6AD00FFD6
      AD00F7D6AD00FFD6AD00FFD6AD00CE6300000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEB500F7D6B500F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B58484000000000000000000AD738400FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700B58484000000000000000000000000000000
      0000009CFF00008CFF00008CFF00527BC6000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00BDC6
      C6005A524A0042424200526363009C9C9C00BDC6C600BDC6C600BDC6C600BDC6
      C600BDC6C600BDC6C600FFD6AD00CE6300000000000000000000CEB5AD00FFFF
      F700FFEFE700F7E7D600F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6
      AD00EFCE9C00EFCE9C00B58484000000000000000000AD738400FFF7F700FFFF
      FF00F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7
      D600FFFFFF00FFFFFF00FFFFFF00B58484000000000000000000000000000000
      00000000000000B5FF00008CFF000094FF00527BC600527BC600000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF0052737B00427BAD0018526B008C5A5200ADADAD00FFE7C600FFE7
      C600FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEBD00F7D6
      AD00F7D6A500F7D6A500B58484000000000000000000AD738400FFF7F700FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFFFFF00FFFFFF00FFFFFF00B58484000000000000000000000000000000
      0000000000000000000000B5FF0008C6FF00009CFF00009CFF00527BC6000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00BDC6
      C600BDC6C60052737B0042739400947B7300C67331008C5A52009C9C9C00BDC6
      C600BDC6C600ADB5BD00FFD6AD00CE6300000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEC600F7DE
      BD00F7D6B500F7D6AD00B58484000000000000000000BD848C00FFF7F700FFFF
      FF00F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7
      D600FFFFFF00FFFFFF00FFFFFF00B58484000000000000000000000000000000
      000000000000000000000000000000B5FF0008BDFF0000ADFF00009CFF00527B
      C6000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007B737B00F7BD8400F7AD5A00C67339008C5A5200ADAD
      AD00FFE7C600FFD6AD00FFD6AD00CE6300000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFF7F700FFF7EF00FFEFE700F7E7D600F7E7CE00F7DEC600F7DE
      BD00F7DEB500F7DEB500B58484000000000000000000BD848C00FFF7F700FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFFFFF00FFFFFF00FFFFFF00B58484000000000000000000000000000000
      0000527BC600527BC600527BC60000C6FF0008FFFF0031F7FF0010BDFF0000AD
      FF00527BC600527BC600000000000000000000000000CE630000FFFFFF00BDC6
      C600BDC6C600BDC6C600AD7B7300FFD6AD00FFC68C00EFA55A00C67339008C5A
      52009C9C9C00BDC6C600FFD6AD00CE6300000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C600F7DEC600F7DEB500B58484000000000000000000BD848C00FFF7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFB56300FFB56300F7E7D600B58484000000000000000000000000000000
      000029ADFF0000C6FF0000EFFF0000F7FF0000F7FF0000FFFF004AEFFF0018CE
      FF0000A5FF00527BC600000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AD7B7300FFD6AD00FFC68C00F7AD5A00C673
      31008C5A5200ADADAD00FFD6AD00CE6300000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7
      D600F7DEC600F7DEC600B58484000000000000000000D69C9400FFF7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFD6A500FFB56300F7E7D600B58484000000000000000000000000000000
      000039A5FF0000C6FF0000EFFF0000F7FF0000EFFF0000DEFF0000FFFF0000FF
      FF0039EFFF0008C6FF00527BC6000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD7B7300FFD6AD00FFC68C00EFA5
      5A00B56B39008C5A52009C9C9C00CE6300000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600F7E7
      D600F7E7D600F7DEC600B58484000000000000000000D69C9400FFF7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7E7D600F7E7D600F7E7D600B58484000000000000000000000000000000
      00000000000008C6FF0039E7FF004AEFFF0042F7FF0018FFFF0000FFFF0000FF
      FF0008FFFF0021FFFF00527BC6000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000AD7B7300FFD6AD009C94
      A50031ADF7000010AD0000009C00CE6300000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7F700FFEF
      DE00F7E7D600F7E7D600B58484000000000000000000D69C9400EFD6BD00EFD6
      BD00EFD6BD00EFD6BD00EFD6BD00EFD6BD00EFD6BD00EFD6BD00EFD6BD00EFD6
      BD00DEC6BD00DEC6BD00CEADA500CEADA5000000000000000000000000000000
      000000000000000000000000000031D6FF0008F7FF0000FFFF0000F7FF0000D6
      FF0000B5FF00527BC60000000000000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000AD7B73004A9C
      EF001029D6001029D6000010AD0000009C000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7
      F700FFEFDE00FFEFDE00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031D6FF0000F7FF0000EF
      FF0000ADFF0000A5FF00527BC600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000018
      C6006B8CFF00106BFF001029D600000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000031D6
      FF0042DEFF0010D6FF005AA5FF00527BC6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000018C6000018C60000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500E7C6B500E7C6B500E7C6
      B500E7C6B500E7C6B500E7C6B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031D6FF0052A5FF00527BC6000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000029ADD60021ADD6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000063636B00525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000029ADD60084EFFF004AC6E7004AC6E70031B5DE0021AD
      D600000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500EFD6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B5848400000000000000000000000000000000000000
      00000000000063636B0094949400A5A5A5003131310000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000029ADD600ADFFFF008CF7FF008CF7FF008CF7FF0063DE
      F70031B5DE0031B5DE0000000000000000000000000000000000C6A59C00FFEF
      D600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600EFCE9C00B5848400000000000000000000000000000000000000
      000063636B0094949400D6D6D600DEDEDE00ADADAD0052525200000000000000
      0000000000000000000000000000000000000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC60084000000FFFFFF008400000084000000D6A5
      A50084000000D6A5A500FFFFFF00840000000000000000000000000000000000
      0000000000000000000029ADD600ADEFF70094F7FF008CF7FF008CF7FF008CEF
      FF008CEFFF0031B5DE0000000000000000000000000000000000C6ADA500FFEF
      E700292929005A524A00D6C6BD00F7DEBD00EFD6AD00EFCE9C00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B5848400000000000000000000000000000000006363
      6B0094949400D6D6D600D6D6D600DEDEDE00DEDEDE00ADADAD00313131000000
      0000000000000000000000000000000000000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C60084000000FFFFFF0084000000AD5A4A008400
      0000AD5A4A0084000000FFFFFF00840000000000000000000000000000000000
      0000A5947B00AD847B0029ADD60029ADD600A5EFF700A5EFF700A5F7FF008CEF
      FF008CEFFF00005A000031B5DE00000000000000000000000000C6ADA500FFF7
      E7005A524A004242420052636300D6C6BD00F7DEB500EFD6AD00EFCE9C00EFCE
      9C00EFCE9C00EFCE9400B5848400000000000000000000000000636363008484
      8400D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00E7E7DE00ADADAD005252
      5200000000000000000000000000000000000000000000000000CEB5AD00FFFF
      F700FFEFE700F7E7D600F7E7D60084000000FFFFFF0084000000FFFFFF008400
      0000FFFFFF0084000000D6A5A50084000000000000000000000000000000A57B
      6300BD633900C663420029ADD60084EFFF0029ADD60029ADD60029ADD600ADEF
      F700005A000042E77300005A000031B5DE000000000000000000CEB5AD00FFFF
      F700C6C6C60052737B00427BAD0018526B008C5A5200C6B5B500C6C6C600C6C6
      C600C6C6C600EFCE9C00B5848400000000000000000063636B007B7B7B00ADAD
      AD00BDBDBD00BDBDBD00CECECE00D6D6D600DEDEDE00DEDEDE00E7E7E700ADAD
      AD00313131000000000000000000000000000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700F7E7D60084000000FFFFFF0084000000FFFFFF008400
      0000FFFFFF0084000000AD5A4A00840000000000000000000000BD734A00C65A
      1800A54218008C52210029ADD60094F7FF0094F7FF008CF7FF006BDEF700005A
      000031CE5A0029C6520018B53100005A00000000000000000000D6B5AD00FFFF
      FF00FFF7EF0052737B0042739400947B7300C67331008C5A5200D6C6BD00EFD6
      AD00EFD6AD00EFD6AD00B5848400000000007B7B7B0063636B00A5A5AD00A5A5
      AD00B5ADBD00BDBDBD00C6C6C600BDBDBD00949494007B7B7B005A525200D6D6
      D600BDBDBD005252520000000000000000000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE00840000008400000084000000840000008400
      00008400000084000000840000008400000000000000BD734A00BD521000A539
      0000AD4200003163000029ADD60094FFFF0094F7FF008CEFFF008CEFFF0094EF
      FF000873100018B5310008841000000000000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF007B737B00F7BD8400F7AD5A00C67339008C5A5200D6C6
      BD00EFD6AD00EFD6AD00B58484000000000084848C0052526300293163002931
      520042426B0063637B00BDC6C600CECECE00B5B5B500949CA5009C9CA500DEDE
      DE00EFEFEF00B5B5B5004A424A00000000000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFF7F700FFF7EF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000B58473009C524200AD420000CE5A
      0000BD6B0000007B000021ADD6009CF7FF009CF7FF006BDEF7006BDEF70029AD
      D60000630800089C1800006B0800000000000000000000000000D6BDB500FFFF
      FF00C6C6C600C6C6C600AD7B7300FFD6AD00FFC68C00EFA55A00C67339008C5A
      5200C6B5B500D6C6BD00BD9494000000000094949C0073849C007394CE007B9C
      CE006B8CC600526BAD002931840021316300526B9C003973A500EFEFEF00EFEF
      EF00EFEFEF00F7F7F700A5A5A500525252000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700840000008400000084000000840000008400
      000084000000840000008400000084000000B58473009C524200CE5A0000D67B
      0000848C000039940000C68400001894CE001894CE001894CE00B58C0000B58C
      0000005A0000008C080000000000000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700AD7B7300FFD6AD00FFC68C00F7AD5A00C673
      31008C5A5200D6C6BD00C6ADAD000000000094949C008494AD008CADDE008CAD
      DE0094B5E7008CA5D6006384C6005A73BD006B7BBD0018217300EFEFEF00EFEF
      EF00EFEFEF00F7F7F700EFEFEF00A5A5A5000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B584840000000000B58473009C524200C673000029A5
      180031AD2100D6AD1800FF9C0800E78C0000E78C0000B58C0000C6840800005A
      0000008C0800005A000000000000000000000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700AD7B7300FFD6AD00FFC68C00EFA5
      5A00B56B39008C5A5200C6B5B50000000000000000000000000084A5DE00738C
      BD00182173001018420052B5DE004294C6006384C6008CA5D600EFEFEF00EFEF
      EF00EFEFEF00F7F7F700DEE7DE00A5A5A5000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B584840000000000B5847300BD734A007B94080010C6
      4A0031CE63007BCE6B00FFCE5A00FFA51000B58C0000005A0000005A0000005A
      0000005A00000000000000000000000000000000000000000000E7C6B500FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600AD7B7300FFD6AD009C94
      A50031ADF7000010AD0000009C00000000000000000000000000ADC6E7007BA5
      D6001821520021426B004A8CC600314A8C0084A5D600A5BDDE00EFEFEF00EFEF
      EF00F7F7F700F7F7F700A5A5A500000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B0000000000B5847300BD734A0031BD390042D6
      7300A5E79C00A5F7B500D6E79400D6B52900B58C0000B58C0000C6840800A594
      7B00000000000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700AD7B73004A9C
      EF001029D6001029D6000010AD0000009C000000000000000000000000006B73
      840052B5DE0052A5CE008CADDE00A5BDDE00DEDEDE00DEDEDE00EFEFEF00EFEF
      EF00DEDEDE009C9C9C0000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE947300000000000000000000000000A5947B0084C6730063DE
      7B00BDF7AD00D6FFBD005ADE840039B53100F78C0000C6840800A5947B000000
      0000000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE000018
      C6006B8CFF00106BFF001029D6000000000000000000000000006B7384002139
      630052A5CE00849CBD00A5BDDE00A5BDDE008C8C8C0094949400EFEFEF00EFEF
      EF009C9C9C000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000A5947B00ADC6
      8C00A5D6840094DE8C0052CE63004AB53900D69C4200A5947B00000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B000018C6000018C6000000000000000000000000006B73840021219C0052A5
      CE000000000000000000949494008C8C8C00F7F7F700E7E7DE00949494009494
      9400000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B0000000000000000000000000000000000000000000000000000000000B584
      7300B5847300B5847300B5847300B5847300B584730000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B000000000000000000000000000000000000000000BDB5EF001818AD000000
      0000000000000000000000000000949494009494940094949400949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A9CC6008484840084A5AD000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000006B8C940073CEE7005A737B000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB5000021A5000021A5000021A5000021A5000021
      A5000021A5000021A5000021A5000021A5000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500318431003184310031843100318431003184
      3100318431003184310031843100318431000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500291873002918730029187300291873002918
      730029187300291873002918730029187300000000004A9CC6008484840084A5
      AD0000000000000000000000000000000000738C94005AB5E700427B9C000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD000021A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000021A5000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD0031843100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00318431000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD004242DE004242DE00E7E7E700D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D6006B63C600000000006BADBD0073C6D6004A63
      6B0000000000000000000000000000000000636B6B00297B9C0029739C007B63
      63009C6B6B000000000000000000000000000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC6000021A500FFFFFF000021A500636BC600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000021A5000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC60031843100FFFFFF003184310031843100FFFF
      FF00429C52003184310031843100318431000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC6004242DE004242DE004242DE00E7E7E700DEDE
      DE00DEDEDE00DEDEDE004242DE006B63C60000000000528494005ABDF7000031
      DE0073636300000000009C737300AD737300AD6B6B0052848C0073CEE7008C73
      7B00D68484000031DE0000000000000000000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C6000021A500FFFFFF000021D6000021A500636B
      C600FFFFFF00FFFFFF00FFFFFF000021A5000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C60031843100FFFFFF00429C5200318431003184
      31003184310031843100FFFFFF00318431000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C6004242DE00E7E7E700E7E7E7004242DE004242
      DE004242DE004242DE004242DE004242DE0000000000000000002184B5000031
      DE000031DE009C6B6B00D6848400DE8C8C00C67B7B006B737B0084DEEF009484
      8C000031DE00AD7373008C8C8C00000000000000000000000000CEB5AD00FFFF
      F700FFEFE700F7E7D600F7E7D6000021A500FFFFFF00FFFFFF000021D6000021
      A5000021A5000021A500FFFFFF000021A5000000000000000000CEB5AD00FFFF
      F700FFEFE700F7E7D600F7E7D60031843100FFFFFF00FFFFFF00429C52003184
      310031843100FFFFFF00FFFFFF00318431000000000000000000CEB5AD00FFFF
      F700FFEFE700F7E7D600F7E7D6004242DE00E7E7E700EFEFEF004242DE00EFEF
      EF004242DE00E7E7E700D6D6D6006B63C60000000000AD737300528CA50073D6
      FF000031DE000031DE00D6848400D6848400D68484007B6363000031DE000031
      DE00D6848400BD7B7B00947B7B00000000000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700F7E7D6000021A500FFFFFF00FFFFFF00FFFFFF000021
      D600739CFF000021A500FFFFFF000021A5000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700F7E7D60031843100FFFFFF00429C5200318431003184
      31003184310031843100FFFFFF00318431000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700F7E7D6004242DE00D6D6D600E7E7E700EFEFEF004242
      DE00EFEFEF00EFEFEF00E7E7E7006B63C60000000000BD7B7B008C84840084DE
      EF0073949C000031DE000031DE00C67B7B009C6B6B000031DE000031DE00CE94
      9400CE949400C68C8C0094848400000000000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE000021A500FFFFFF00FFFFFF00FFFFFF000021
      D6000021A5000021A500FFFFFF000021A5000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE0031843100FFFFFF003184310031843100FFFF
      FF00429C52003184310031843100318431000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE004242DE00D6D6D600DEDEDE00E7E7E7004242
      DE00F7F7F700EFEFEF00E7E7E7006B63C60000000000AD7373009C6B6B00949C
      9C00A5A5A5009C6B6B000031DE000031E7000031DE000031E700DEA5A500DEA5
      A500DEA5A500C68C8C009C848400000000000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFF7F700FFF7EF000021A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000021A5000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFF7F700FFF7EF0031843100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00318431000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFF7F700FFF7EF004242DE00D6D6D600D6D6D600D6D6D6004242
      DE00E7E7E700E7E7E700E7E7E7006B63C60000000000A56B6B00A56B6B00AD73
      7300CE9C9C00DEB5B500EFBDBD000031E7000031E7000031DE000031DE00EFAD
      AD00DEADAD00B58484008C8C8C00000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F7000021A5000021A5000021A5000021A5000021
      A5000021A5000021A5000021A5000021A5000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700318431003184310031843100318431003184
      3100318431003184310031843100318431000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700636BC600636BC600636BC600636BC6004242
      DE00636BC600636BC600636BC600636BC60000000000AD7B7B00EFD6D600FFEF
      EF00FFE7E700EFCECE000031DE000031EF00F7C6C600F7C6C6000031F7000031
      DE00CE9C9C009C84840000000000000000000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B5848400000000000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B5848400000000000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B58484000000000000000000B5848400DECECE00FFF7
      F700FFF7F7000031F7000031EF00EFD6D600F7CECE00F7C6C600F7C6C6000031
      F7009C8484000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B5848400000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B5848400000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B5848400000000000000000000000000B58C8C00CEAD
      AD000031FF000031EF00FFEFEF00FFE7E700EFC6C600EFB5B5009C8484009C84
      84000031F7000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B00000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B00000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B00000000000000000000000000000000000031
      F7000031F700CEB5B500C6ADAD00BDA5A500BDA5A5009C8484008C8484007373
      7300000000000031F70000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE94730000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE94730000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE94730000000000000000000000000000000000000000000031
      F70000000000000000000000000000000000A5A5A500FFFFFF008C8C8C007373
      7300000000000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500FFFFFF008C8C8C007373
      7300000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000031DE000031DE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000031DE000031DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031DE000031DE0000000000B55A0000B55A0000B55A0000B55A
      0000B55A0000B55A0000B55A0000B55A0000B55A0000B55A0000B55A0000B55A
      0000B55A0000B55A0000B55A00000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000007308000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000000000008484840000000000000000000031DE000031DE000031
      DE00000000000000000000000000000000000000000000000000000000000000
      00000031DE000031DE000000000000000000B55A0000FFC6C600FFC6C600FFC6
      C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6
      C600FFC6C600FFC6C600B55A00000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000007308000073
      0800000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000031DE000031DE000031
      DE000031DE000000000000000000000000000000000000000000000000000031
      DE000031DE00000000000000000000000000B55A0000FFDEDE0084848400FFDE
      DE00292929005A524A0084848400FFDEDE0084848400FFDEDE0084848400FFDE
      DE0084848400FFDEDE00B55A00000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB50000C6C60000C6
      C60000C6C60000C6C600FFD6AD00CE630000007308000073080000730800008C
      0800008C08000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000031EF000031
      DE000031DE000031DE00000000000000000000000000000000000031DE000031
      DE0000000000000000000000000000000000E7730000E7730000E7730000E773
      00005A524A004242420052636300B55A0000E7730000E7730000E7730000E773
      0000E7730000E7730000E77300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFFFFF00FFFF
      FF00FFFFFF0000C6C600FFD6AD00CE6300000000000000000000008C0800008C
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000031DE000031DE000031DE00000000000031DE000031DE000031DE000000
      00000000000000000000000000000000000000000000B55A0000FFC6C600FFC6
      C600FFC6C60052737B00427BAD0018526B008C5A5200FFA5A500B55A00000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDE
      B500FFD6AD00FFD6AD00FFD6AD00CE6300000000000000000000008C08000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031DE000031E7000031E7000031E7000031DE00000000000000
      00000000000000000000000000000000000000000000B55A0000FFC6C600B55A
      0000C673390052737B0042739400947B7300C67331008C5A5200000000000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7
      C600FFDEB500FFD6AD00FFD6AD00CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000084848400000000000000000000000000000000000000
      000000000000000000000031E7000031E7000031EF0000000000000000000000
      00000000000000000000000000000000000000000000B55A0000FFC6C600CE63
      000000000000C67339007B737B00F7BD8400F7AD5A00C67339008C5A52000000
      00000000000000000000000000000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00848484008484840084848400FFFFFF0084848400FFF7E7008484
      84008484840084848400FFD6AD00CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031DE000031EF000031E7000031EF000031F700000000000000
      00000000000000000000000000000000000000000000B55A0000FFC6C600CE63
      0000B55A0000FFC6C600AD7B7300FFD6AD00FFC68C00EFA55A00C67339008C5A
      52000000000000000000000000000000000000000000CE6300008484FF000000
      FF008484FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      E700FFEFD600FFE7C600FFDEB500CE6300000000000000000000000000000000
      0000000000000000000084848400000000000000000084848400000000008484
      8400000000000000000084848400000000000000000000000000000000000000
      00000031F7000031EF000031E70000000000000000000031F7000031F7000000
      00000000000000000000000000000000000000000000B55A0000FFC6C600B55A
      0000FFC6C600FFC6C600C6733900AD7B7300FFD6AD00FFC68C00F7AD5A00C673
      31008C5A520000000000000000000000000000000000CE6300000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7E700FFEFD600FFE7C600CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000031
      FF000031EF000031F700000000000000000000000000000000000031FF000031
      F7000000000000000000000000000000000000000000B55A0000FFC6C600FFC6
      C600FFC6C600B55A00000000000000000000AD7B7300FFD6AD00FFC68C00EFA5
      5A00B56B39008C5A5200000000000000000000000000CE6300008484FF000000
      FF008484FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000031F7000031
      F7000031FF000000000000000000000000000000000000000000000000000031
      F7000031F70000000000000000000000000000000000B55A0000FFC6C600FFC6
      C600B55A000000000000000000000000000000000000AD7B7300FFD6AD009C94
      A50031ADF7000010AD0000009C000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000031F7000031F7000031
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000031F700000000000000000000000000B55A0000FFC6C600B55A
      0000000000000000000000000000000000000000000000000000AD7B73004A9C
      EF001029D6001029D6000010AD0000009C0000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000031F7000031F7000031F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B55A0000B55A00000000
      0000000000000000000000000000000000000000000000000000000000000018
      C6006B8CFF00106BFF001029D600000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000084848400000000008484
      8400000000000000000084848400000000000031F7000031F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B55A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000018C6000018C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0084B58400107310001873
      18001873180018731800187B1800187B1800107B1000107B1000087B0800087B
      0800007B0000007300007BB57B00FFFFFF00FFFFFF0052ADFF0018529400185A
      9C00185A9C00185A9C00185AA500185AA500185A9C00185A9C00185294001852
      940018528C00184A84004AADFF00FFFFFF00FFFFFF0084B58400107310001873
      18001873180018731800187B1800187B1800107B1000107B1000087B0800087B
      0800007B0000007300007BB57B00FFFFFF00FFFFFF0052ADFF0018529400185A
      9C00185A9C00185A9C00185AA500185AA500185A9C00185A9C00185294001852
      940018528C00184A84004AADFF00FFFFFF00FFFFFF0010841000218C21002994
      2900319431003194310029942900299C2900219C210018A5180018A5180010A5
      100008A5080000940000006B0000FFFFFF00FFFFFF00185AA500186BBD001873
      CE001873CE001873CE001873CE001873CE001873CE001873CE001873CE00186B
      C600186BBD00185AA500104A7B00FFFFFF00FFFFFF0010841000218C21002994
      2900319431003194310029942900299C2900219C210018A5180018A5180010A5
      100008A5080000940000006B0000FFFFFF00FFFFFF00185AA500186BBD001873
      CE001873CE001873CE001873CE001873CE001873CE001873CE001873CE00186B
      C600186BBD00185AA500104A7B00FFFFFF00FFFFFF00188C180029942900399C
      3900399C3900399C3900FFFFFF00A5D6A5004AA54A004AA54A004AA54A0029A5
      290018A51800009C0000007B0000FFFFFF00FFFFFF001863AD001873CE00187B
      DE00187BDE00187BE7001884E700188CF700188CF700188CF700188CF700187B
      DE00186BC6001863AD0018528C00FFFFFF00FFFFFF00188C180029942900399C
      3900399C3900399C390039A539004AA54A00A5D6A500FFFFFF004AA54A0031A5
      310018A51800009C0000007B0000FFFFFF00FFFFFF001863AD001873CE00187B
      DE00187BDE00187BE700187BE700188CFF00188CFF00188CFF00188CFF00187B
      DE00186BC6001863AD0018528C00FFFFFF00FFFFFF0021942100399C390042A5
      420042A5420042A54200FFFFFF00FFFFFF00A5D6A5004AA54A004AA54A0039A5
      390021A5210008A50800087B0800FFFFFF00FFFFFF00186BC600187BDE001884
      EF001884EF001884EF0084C6FF00188CF700188CF700188CF700188CF7001884
      E7001873CE00186BBD0018529400FFFFFF00FFFFFF0021942100399C390042A5
      420042A5420042A542004AA54A00A5D6A500FFFFFF00FFFFFF004AA54A0039A5
      390021A5210008A50800087B0800FFFFFF00FFFFFF00186BC600187BDE001884
      EF001884EF00FFFFFF00188CFF00ADDEFF00ADDEFF00ADDEFF00188CFF001884
      EF001873CE00186BBD0018529400FFFFFF00FFFFFF0029942900429C42004AA5
      4A0052A552004AA54A00FFFFFF00FFFFFF00FFFFFF00A5D6A5004AA54A0039A5
      390021A5210010A5100008840800FFFFFF00FFFFFF001873CE001884E700188C
      F700188CFF0084C6FF00FFFFFF0084C6FF00188CF700188CF700188CF7001884
      E7001873D600186BC600185A9C00FFFFFF00FFFFFF0029942900429C42004AA5
      4A0052A552004AA54A00A5D6A500FFFFFF00FFFFFF00FFFFFF004AA54A0039A5
      390021A5210010A5100008840800FFFFFF00FFFFFF001873CE00187BE700188C
      FF00188CFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADDEFF001884
      EF001873D600186BC600185A9C00FFFFFF00FFFFFF00319C31004AA54A0052A5
      52004AA54A004AA54A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5D6A50039A5
      390021A5210018A5180010841000FFFFFF00FFFFFF00187BDE00188CF700188C
      FF0084C6FF00FFFFFF0084C6FF00FFFFFF0084C6FF00188CF700188CF7001884
      E7001873D6001873CE00185AA500FFFFFF00FFFFFF00319C31004AA54A0052A5
      52004AA54A00A5D6A500FFFFFF00FFFFFF00FFFFFF00FFFFFF004AA54A0039A5
      390021A5210018A5180010841000FFFFFF00FFFFFF00187BDE00188CFF00188C
      FF00188CFF00FFFFFF00FFFFFF00188CFF00188CFF00188CFF00FFFFFF00187B
      E7001873D6001873CE00185AA500FFFFFF00FFFFFF00429C420052A552004AA5
      4A004AA54A004AA54A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5D6
      A500219C2100219C210018841800FFFFFF00FFFFFF001884E700188CFF0084C6
      FF00FFFFFF0084C6FF00188CF700188CF700FFFFFF0084C6FF001884EF00187B
      DE001873CE001873CE001863AD00FFFFFF00FFFFFF00429C420052A552004AA5
      4A00A5D6A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042A5420031A5
      3100219C2100219C210018841800FFFFFF00FFFFFF00187BE700188CFF00188C
      FF00188CFF00FFFFFF00FFFFFF00FFFFFF00188CFF00188CFF001884EF00187B
      DE001873CE001873CE001863AD00FFFFFF00FFFFFF0042A5420052A5520052A5
      52004AA54A004AA54A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5D6
      A500219C2100219C2100217B2100FFFFFF00FFFFFF001884EF00188CFF00188C
      FF0084C6FF00188CF700188CF700188CF700188CF700FFFFFF0084C6FF001873
      D6001873CE001873CE001863AD00FFFFFF00FFFFFF0042A5420052A5520052A5
      5200A5D6A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00399C3900299C
      2900219C2100219C2100217B2100FFFFFF00FFFFFF001884EF00188CFF00188C
      FF00188CFF00188CFF00188CFF00188CFF00188CFF001884EF00187BE7001873
      D6001873CE001873CE001863AD00FFFFFF00FFFFFF0052A552005AAD5A005AAD
      5A0052A552004AA54A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5D6A5003194
      31002994290029942900217B2100FFFFFF00FFFFFF00188CFF002194FF002194
      FF00188CFF00188CFF00188CF7001884F7001884EF001884EF00FFFFFF0084C6
      FF001873CE001873CE001863AD00FFFFFF00FFFFFF0052A552005AAD5A005AAD
      5A0052A55200A5D6A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00399C39003194
      31002994290029942900217B2100FFFFFF00FFFFFF00188CFF002194FF002194
      FF00188CFF00188CFF00188CFF001884F700FFFFFF00FFFFFF00FFFFFF001873
      CE001873CE001873CE001863AD00FFFFFF00FFFFFF0052A552006BB56B006BB5
      6B005AAD5A0052AD5200FFFFFF00FFFFFF00FFFFFF00A5D6A500399C39003194
      31002994290029942900217B2100FFFFFF00FFFFFF00188CFF0039A5FF0039A5
      FF002194FF001894FF00188CFF00188CFF001884EF001884E700187BDE00FFFF
      FF0084C6FF001873CE001863AD00FFFFFF00FFFFFF0052A552006BB56B006BB5
      6B005AAD5A0052AD5200A5D6A500FFFFFF00FFFFFF00FFFFFF00399C39003194
      31002994290029942900217B2100FFFFFF00FFFFFF00188CFF0039A5FF0039A5
      FF002194FF00FFFFFF00188CFF00188CFF001884EF00FFFFFF00FFFFFF001873
      D6001873CE001873CE001863AD00FFFFFF00FFFFFF005AAD5A007BBD7B0073BD
      730063AD63005AAD5A00FFFFFF00FFFFFF00A5D6A500429C4200429C4200399C
      39003194310031943100217B2100FFFFFF00FFFFFF002194FF0052ADFF004AAD
      FF00299CFF002194FF002194FF001894FF00188CF7001884EF001884E700187B
      DE00FFFFFF001873CE001863AD00FFFFFF00FFFFFF005AAD5A007BBD7B0073BD
      730063AD63005AAD5A005AAD5A00A5D6A500FFFFFF00FFFFFF00429C4200399C
      39003194310031943100217B2100FFFFFF00FFFFFF002194FF0052ADFF004AAD
      FF00299CFF00ADDEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00187B
      DE001873CE001873CE001863AD00FFFFFF00FFFFFF006BB56B008CC68C007BBD
      7B006BB56B0063B56300FFFFFF00A5D6A5005AAD5A0052A552004AA54A0042A5
      4200399C390031943100217B2100FFFFFF00FFFFFF0039A5FF006BBDFF0052AD
      FF0039A5FF00319CFF00299CFF00299CFF002194FF00188CFF001884F7001884
      EF00187BDE001873CE001863AD00FFFFFF00FFFFFF006BB56B008CC68C007BBD
      7B006BB56B0063B5630063AD630063AD6300A5D6A500FFFFFF004AA54A0042A5
      4200399C390031943100217B2100FFFFFF00FFFFFF0039A5FF006BBDFF0052AD
      FF0039A5FF00319CFF00ADDEFF00ADDEFF00ADDEFF00188CFF00FFFFFF001884
      EF00187BDE001873CE001863AD00FFFFFF00FFFFFF0073BD73009CCE9C008CC6
      8C007BBD7B0073BD73006BB56B0063B5630063AD63005AAD5A0052AD52004AA5
      4A0042A542003194310018731800FFFFFF00FFFFFF004AADFF0084C6FF006BBD
      FF0052ADFF004AADFF0039A5FF00319CFF00299CFF002194FF001894FF00188C
      F7001884EF001873CE00185A9C00FFFFFF00FFFFFF0073BD73009CCE9C008CC6
      8C007BBD7B0073BD73006BB56B0063B5630063AD63005AAD5A0052AD52004AA5
      4A0042A542003194310018731800FFFFFF00FFFFFF004AADFF0084C6FF006BBD
      FF0052ADFF004AADFF0039A5FF00319CFF00299CFF002194FF001894FF00188C
      FF001884EF001873CE00185A9C00FFFFFF00FFFFFF00B5DEB50073BD730063B5
      63005AAD5A0052A5520052A552004AA54A004AA54A0042A54200429C4200399C
      390031943100218C21008CBD8C00FFFFFF00FFFFFF00ADDEFF004AADFF00319C
      FF002194FF00188CFF00188CFF00188CF700188CF7001884EF001884E700187B
      DE001873CE00186BBD0063B5FF00FFFFFF00FFFFFF00B5DEB50073BD730063B5
      63005AAD5A0052A5520052A552004AA54A004AA54A0042A54200429C4200399C
      390031943100218C21008CBD8C00FFFFFF00FFFFFF00ADDEFF004AADFF00319C
      FF002194FF00188CFF00188CFF00188CFF00188CFF001884EF00187BE700187B
      DE001873CE00186BBD0063B5FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF006B73FF003131B5003131
      BD003131BD003131BD003131C6003131C6003131BD003131BD003131B5003131
      B5003131AD003131A5006363FF00FFFFFF00FFFFFF00E79C5200734210007342
      100073421000734210007B4210007B4210007342100073421000734210007342
      10006B39100063391000E7944A00FFFFFF00FFFFFF006B73FF003131B5003131
      BD003131BD003131BD003131C6003131C6003131BD003131BD003131B5003131
      B5003131AD003131A5006363FF00FFFFFF00FFFFFF00E79C5200734210007342
      100073421000734210007B4210007B4210007342100073421000734210007342
      10006B39100063391000E7944A00FFFFFF00FFFFFF003131C6003131DE003131
      EF003131F7003131F7003131EF003131F7003131EF003131EF003131EF003131
      E7003131DE003131C60031319C00FFFFFF00FFFFFF007B42100094521800A55A
      1800A55A1800A55A1800A55A1800A55A1800A55A1800A55A1800A55A18009C5A
      1800945218007B4210005A311000FFFFFF00FFFFFF003131C6003131DE003131
      EF003131F7003131F7003131EF003131F7003131EF003131EF003131EF003131
      E7003131DE003131C60031319C00FFFFFF00FFFFFF007B42100094521800A55A
      1800A55A1800A55A1800A55A1800A55A1800A55A1800A55A1800A55A18009C52
      1800945218007B4210005A311000FFFFFF00FFFFFF003131D6003131EF003139
      FF003139FF003139FF003139FF003139FF003139FF003139FF003139FF003139
      FF003131E7003131CE003131AD00FFFFFF00FFFFFF008C4A1800A55A1800E7A5
      6B00B5632100B5632100BD6B2100CE732100CE732100EFBD9400FFFFFF00B563
      21009C5A1800844A10006B391000FFFFFF00FFFFFF003131D6003131EF003139
      FF003139FF003139FF003139FF003139FF003139FF003139FF003139FF003139
      FF003131E7003131CE003131AD00FFFFFF00FFFFFF008C4A1800A55A1800B563
      2100B5632100FFFFFF00EFBD9400CE732100CE732100CE732100CE732100B563
      2100DE843100844A10006B391000FFFFFF00FFFFFF003131E7003139FF003139
      FF003139FF003139FF003139FF003139FF003139FF003139FF003139FF003139
      FF003131F7003131DE003131B500FFFFFF00FFFFFF009C5A1800B5632100FFFF
      FF00C66B2100C66B2100CE732100CE732100EFBD9400FFFFFF00FFFFFF00BD6B
      2100A55A18009452180073421000FFFFFF00FFFFFF003131E7003139FF003139
      FF003139FF003139FF003139FF00FFFFFF00848CFF003139FF003139FF003139
      FF003131F7003131DE003131B500FFFFFF00FFFFFF009C521800B5632100C66B
      2100C66B2100FFFFFF00FFFFFF00EFBD9400CE732100CE732100CE732100BD6B
      2100FFFFFF009452180073421000FFFFFF00FFFFFF003131EF003139FF00848C
      FF00848CFF00848CFF00848CFF00848CFF00848CFF00848CFF00848CFF00848C
      FF00848CFF003131E7003131BD00FFFFFF00FFFFFF00A55A1800BD6B2100FFFF
      FF00D6732100CE732100CE732100EFBD9400FFFFFF00FFFFFF00FFFFFF00BD6B
      2100AD6318009C5A180073421000FFFFFF00FFFFFF003131EF003139FF003139
      FF003139FF003139FF003139FF00FFFFFF00848CFF003139FF003139FF003139
      FF003139FF003131E7003131BD00FFFFFF00FFFFFF00A55A1800BD6B2100CE73
      2100D6732100FFFFFF00FFFFFF00FFFFFF00EFBD9400CE732100CE732100BD6B
      2100FFFFFF009C52180073421000FFFFFF00FFFFFF003139FF003139FF00848C
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848CFF003131EF003131C600FFFFFF00FFFFFF00B5632100CE732100FFFF
      FF00CE732100CE732100EFBD9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00BD6B
      2100AD631800A55A18007B421000FFFFFF00FFFFFF003139FF003139FF003139
      FF003139FF003139FF003139FF00FFFFFF00848CFF003139FF003139FF003139
      FF003139FF003131EF003131C600FFFFFF00FFFFFF00B5632100CE732100D673
      2100CE732100FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFBD9400CE732100BD6B
      2100FFFFFF00A55A18007B421000FFFFFF00FFFFFF003139FF003139FF003139
      FF00848CFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848C
      FF003131F7003131EF003131CE00FFFFFF00FFFFFF00BD6B2100D6732100FFFF
      FF00CE732100EFBD9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B563
      2100A55A1800A55A1800844A1000FFFFFF00FFFFFF003139FF003139FF00848C
      FF00848CFF00848CFF00848CFF00FFFFFF00848CFF00848CFF00848CFF00848C
      FF003131F7003131EF003131CE00FFFFFF00FFFFFF00BD6B2100D6732100CE73
      2100CE732100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFBD9400B563
      2100FFFFFF00A55A1800844A1000FFFFFF00FFFFFF003139FF003139FF003139
      FF003139FF00848CFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848CFF003131
      F7003131EF003131EF003131CE00FFFFFF00FFFFFF00C66B2100D67B2100FFFF
      FF00CE732100EFBD9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD63
      1800A55A1800A55A1800844A1000FFFFFF00FFFFFF003139FF003139FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003131EF003131EF003131CE00FFFFFF00FFFFFF00C66B2100D67B2100D673
      2100CE732100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFBD9400AD63
      1800FFFFFF00A55A1800844A1000FFFFFF00FFFFFF003139FF003942FF003942
      FF003139FF003139FF00848CFF00FFFFFF00FFFFFF00848CFF003139FF003131
      F7003131EF003131EF003131CE00FFFFFF00FFFFFF00D6732100DE843100FFFF
      FF00D67B2100CE732100EFBD9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00A55A
      1800A55A1800A55A1800844A1000FFFFFF00FFFFFF003139FF003942FF003942
      FF003139FF003139FF003139FF00FFFFFF00848CFF003139FF003139FF003131
      F7003131EF003131EF003131CE00FFFFFF00FFFFFF00D6732100DE843100DE7B
      2900D67B2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFBD9400B5632100A55A
      1800FFFFFF00A55A1800844A1000FFFFFF00FFFFFF003139FF005252FF005252
      FF003942FF003139FF003139FF00848CFF00848CFF003139FF003139FF003131
      F7003131EF003131EF003131CE00FFFFFF00FFFFFF00D6732100DE8C4200FFFF
      FF00DE843100DE7B2900D67B2100EFBD9400FFFFFF00FFFFFF00FFFFFF00AD63
      1800A55A1800A55A1800844A1000FFFFFF00FFFFFF003139FF005252FF005252
      FF003942FF003139FF003139FF00FFFFFF00848CFF003139FF003139FF003131
      F7003131EF003131EF003131CE00FFFFFF00FFFFFF00D6732100DE8C4200DE8C
      4200DE843100FFFFFF00FFFFFF00FFFFFF00EFBD9400BD6B2100B5632100AD63
      1800FFFFFF00A55A1800844A1000FFFFFF00FFFFFF003942FF006B6BFF006363
      FF00424AFF003942FF003942FF003139FF003139FF003139FF003139FF003139
      FF003131F7003131F7003131CE00FFFFFF00FFFFFF00DE7B2900E79C5200FFFF
      FF00DE843100DE7B2900DE7B2900D67B2100EFBD9400FFFFFF00FFFFFF00B563
      2100A55A1800A55A1800844A1000FFFFFF00FFFFFF003942FF006B6BFF006363
      FF00424AFF003942FF003942FF00FFFFFF00848CFF003139FF003139FF003139
      FF003131F7003131F7003131CE00FFFFFF00FFFFFF00DE7B2900E79C5200E794
      4A00DE843100FFFFFF00FFFFFF00EFBD9400CE732100C66B2100BD6B2100B563
      2100FFFFFF00A55A1800844A1000FFFFFF00FFFFFF005252FF00848CFF006B6B
      FF005252FF004A4AFF00424AFF00424AFF003139FF003139FF003139FF003139
      FF003139FF003131F7003131CE00FFFFFF00FFFFFF00DE8C4200E7A56B00E7A5
      6B00DE8C4200DE843900DE843100DE843100DE7B2900EFBD9400FFFFFF00C66B
      2100B5632100A55A1800844A1000FFFFFF00FFFFFF005252FF00848CFF006B6B
      FF005252FF004A4AFF00424AFF00FFFFFF00848CFF003139FF003139FF003139
      FF003139FF003131F7003131CE00FFFFFF00FFFFFF00DE8C4200E7A56B00E79C
      5200DE8C4200FFFFFF00EFBD9400DE843100DE7B2900CE732100CE732100C66B
      2100DE843100A55A1800844A1000FFFFFF00FFFFFF006363FF009C9CFF00848C
      FF006B6BFF006363FF005252FF004A4AFF00424AFF003942FF003139FF003139
      FF003139FF003131F7003131BD00FFFFFF00FFFFFF00E7944A00EFB58400E7A5
      6B00E79C5200E7944A00DE8C4200DE843900DE843100DE7B2900DE7B2900CE73
      2100C66B2100A55A180073421000FFFFFF00FFFFFF006363FF009C9CFF00848C
      FF006B6BFF006363FF005252FF004A4AFF00424AFF003942FF003139FF003139
      FF003139FF003131F7003131BD00FFFFFF00FFFFFF00E7944A00EFB58400E7A5
      6B00E79C5200E7944A00DE8C4200DE843900DE843100DE7B2900DE7B2900CE73
      2100C66B2100A55A180073421000FFFFFF00FFFFFF00C6CEFF006363FF004A4A
      FF003942FF003139FF003139FF003139FF003139FF003139FF003139FF003139
      FF003131F7003131DE007B84FF00FFFFFF00FFFFFF00F7CEA500E7944A00DE84
      3900DE7B2900D6732100D6732100CE732100CE732100C66B2100BD6B2100B563
      2100A55A180094521800E7A56300FFFFFF00FFFFFF00C6CEFF006363FF004A4A
      FF003942FF003139FF003139FF003139FF003139FF003139FF003139FF003139
      FF003131F7003131DE007B84FF00FFFFFF00FFFFFF00F7CEA500E7944A00DE84
      3900DE7B2900D6732100D6732100CE732100CE732100C66B2100BD6B2100B563
      2100A55A180094521800E7A56300FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C00000000000000000000000000FFFFFF0052ADFF0018529400185A
      9C00185A9C00185A9C00185AA500185AA500185A9C00185A9C00185294001852
      940018528C00184A84004AADFF00FFFFFF00FFFFFF006B73FF003131B5003131
      BD003131BD003131BD003131C6003131C6003131BD003131BD003131B5003131
      B5003131AD003131A5006363FF00FFFFFF000000000000000000000000000000
      00000000000000000000000000008C8C8C00FFDED600FFE7E700636B5A00FFBD
      BD00FFBDBD008C8C8C0000000000000000000000000000000000000000000000
      00000000000000000000000000008C8C8C00FFDED600FFE7E700636B5A00FFBD
      BD00FFBDBD008C8C8C000000000000000000FFFFFF00185AA500186BBD001873
      CE001873CE001873CE001873CE001873CE001873CE001873CE001873CE00186B
      C600186BBD00185AA500104A7B00FFFFFF00FFFFFF003131C6003131DE003131
      EF003131F7003131F7003131EF003131F7003131EF003131EF003131EF003131
      E7003131DE003131C60031319C00FFFFFF000000000000000000000000000000
      000000000000000000008C8C8C00FFDED600FFE7E700FFCECE00FFCECE00FFCE
      CE00FFBDBD00FFBDBD008C8C8C00000000000000000000000000000000000000
      000000000000000000008C8C8C00FFDED600FFE7E700FFCECE00FFCECE00FFCE
      CE00FFBDBD00FFBDBD008C8C8C0000000000FFFFFF001863AD001873CE00187B
      DE00187BDE00187BE7001884E700188CF700188CF700188CF700188CF700187B
      DE00186BC6001863AD0018528C00FFFFFF00FFFFFF003131D6003131EF003139
      FF003139FF003139FF003139FF003139FF003139FF003139FF003139FF003139
      FF003131E7003131CE003131AD00FFFFFF0000000000395AAD0039529C003952
      9C0039529C0039529C008C8C8C00FFE7E700FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFBDBD008C8C8C0000000000395AAD00395AAD0039529C003952
      9C0039529C0039529C008C8C8C00FFE7E700FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFBDBD008C8C8C0000000000FFFFFF00186BC600187BDE001884
      EF00FFFFFF0084C6FF00188CF700188CF700188CF700188CF70084C6FF00FFFF
      FF001873CE00186BBD0018529400FFFFFF00FFFFFF003131E7003139FF003139
      FF003139FF003139FF003139FF003139FF003139FF003139FF003139FF003139
      FF003131F7003131DE003131B500FFFFFF004A6BBD00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C008C8C8C00636B5A00FFCECE00FFCECE00424242004242
      420042424200636B5A008C8C8C00000000004A6BBD00FFBDBD00FFBDBD00FFBD
      BD00FFBDBD00FFBDBD008C8C8C00636B5A00FFCECE00FFCECE00424242004242
      420042424200636B5A008C8C8C0000000000FFFFFF001873CE001884E700188C
      F700188CFF00FFFFFF0084C6FF00188CF700188CF70084C6FF00FFFFFF001884
      E7001873D600186BC600185A9C00FFFFFF00FFFFFF003131EF003139FF003139
      FF003139FF003139FF003139FF003139FF003139FF003139FF003139FF003139
      FF003139FF003131E7003131BD00FFFFFF004A6BBD00F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F7008C8C8C00FFEFEF00FFCECE00FFCECE0042424200FFCE
      CE00FFCECE00FFBDBD008C8C8C00000000004A6BBD00F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F7008C8C8C00FFEFEF00FFCECE00FFCECE0042424200FFCE
      CE00FFCECE00FFBDBD008C8C8C0000000000FFFFFF00187BDE00188CF700188C
      FF00188CF700188CF700FFFFFF0084C6FF0084C6FF00FFFFFF00188CF7001884
      E7001873D6001873CE00185AA500FFFFFF00FFFFFF003139FF003139FF003139
      FF003139FF003139FF003139FF003139FF003139FF003139FF003139FF003139
      FF003139FF003131EF003131C600FFFFFF004A6BBD00F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F7008C8C8C00FFEFEF00FFE7E700FFCECE0042424200FFCE
      CE00FFBDBD00FFBDBD008C8C8C00000000004A6BBD00F7F7F700F7F7F7004A5A
      5200F7F7F7004A5A52008C8C8C00FFEFEF00FFE7E700FFCECE0042424200FFCE
      CE00FFBDBD00FFBDBD008C8C8C0000000000FFFFFF001884E700188CFF00188C
      F700188CF700188CF700188CF700FFFFFF0084C6FF00188CF7001884EF00187B
      DE001873CE001873CE001863AD00FFFFFF00FFFFFF003139FF003139FF00848C
      FF00848CFF00848CFF00848CFF00848CFF00848CFF00848CFF00848CFF00848C
      FF003131F7003131EF003131CE00FFFFFF004A6BBD00F7F7F700F7F7F7000000
      8400F7F7F70000008400000084008C8C8C00FFEFEF00FFDED600636B5A00FFBD
      BD00FFBDBD008C8C8C0000000000000000004A6BBD00F7F7F700F7F7F7004A5A
      5200F7F7F7004A5A5200F7F7F7008C8C8C00FFEFEF00FFDED600636B5A00FFBD
      BD00FFBDBD008C8C8C000000000000000000FFFFFF001884EF00188CFF00188C
      FF00188CF700188CF70084C6FF00FFFFFF00FFFFFF0084C6FF001884E7001873
      D6001873CE001873CE001863AD00FFFFFF00FFFFFF003139FF003139FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003131EF003131EF003131CE00FFFFFF005A73C600F7F7F700F7F7F7000000
      8400F7F7F70000008400F7F7F700F7F7F7008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000005A73C600F7F7F7004A5A52004A5A
      5200F7F7F700F7F7F7004A5A5200F7F7F7008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C00000000000000000000000000FFFFFF00188CFF002194FF002194
      FF00188CFF0084C6FF00FFFFFF001884F7001884EF00FFFFFF0084C6FF001873
      CE001873CE001873CE001863AD00FFFFFF00FFFFFF003139FF003942FF003942
      FF003139FF003139FF003139FF003139FF003139FF003139FF003139FF003131
      F7003131EF003131EF003131CE00FFFFFF005A73C600F7F7F700000084000000
      8400F7F7F700FFEFDE0000008400F7F7F70039529C0000000000000000000000
      0000000000000000000000000000000000005A73C600F7F7F700F7F7F7004A5A
      5200F7F7F7004A5A52004A5A5200F7F7F70039529C0000000000000000000000
      000000000000000000000000000000000000FFFFFF00188CFF0039A5FF0039A5
      FF0084C6FF00FFFFFF00188CFF00188CFF001884EF001884E700FFFFFF0084C6
      FF001873CE001873CE001863AD00FFFFFF00FFFFFF003139FF005252FF005252
      FF003942FF003139FF003139FF003139FF003139FF003139FF003139FF003131
      F7003131EF003131EF003131CE00FFFFFF005A73C600F7F7F700F7F7F7000000
      8400F7F7F7000000840000008400F7F7F70039529C0000000000000000000000
      0000000000000000000000000000000000005A73C600F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F70039529C0000000000000000000000
      000000000000000000000000000000000000FFFFFF002194FF0052ADFF004AAD
      FF00FFFFFF002194FF002194FF001894FF00188CF7001884EF001884E700FFFF
      FF001873CE001873CE001863AD00FFFFFF00FFFFFF003942FF006B6BFF006363
      FF00424AFF003942FF003942FF003139FF003139FF003139FF003139FF003139
      FF003131F7003131F7003131CE00FFFFFF006384CE00F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F70039529C0000000000000000000000
      0000000000000000000000000000000000006384CE00F7F7F7008C9494008C94
      94008C9494008C8C8C008C8C8C00F7F7F70039529C0000000000000000000000
      000000000000000000000000000000000000FFFFFF0039A5FF006BBDFF0052AD
      FF0039A5FF00319CFF00299CFF00299CFF002194FF00188CFF001884F7001884
      EF00187BDE001873CE001863AD00FFFFFF00FFFFFF005252FF00848CFF006B6B
      FF005252FF004A4AFF00424AFF00424AFF003139FF003139FF003139FF003139
      FF003139FF003131F7003131CE00FFFFFF006384CE00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00395AAD0000000000000000000000
      0000000000000000000000000000000000006384CE00FFBDBD00FFBDBD00FFBD
      BD00FFBDBD00FFBDBD00FFBDBD00FFBDBD00395AAD0000000000000000000000
      000000000000000000000000000000000000FFFFFF004AADFF0084C6FF006BBD
      FF0052ADFF004AADFF0039A5FF00319CFF00299CFF002194FF001894FF00188C
      F7001884EF001873CE00185A9C00FFFFFF00FFFFFF006363FF009C9CFF00848C
      FF006B6BFF006363FF005252FF004A4AFF00424AFF003942FF003139FF003139
      FF003139FF003131F7003131BD00FFFFFF00000000006384CE005A73C6005A73
      C6004A6BBD004A6BBD004A6BBD004A6BBD000000000000000000000000000000
      0000000000000000000000000000000000006384CE006384CE005A73C6005A73
      C6004A6BBD004A6BBD004A6BBD004A6BBD00395AAD0000000000000000000000
      000000000000000000000000000000000000FFFFFF00ADDEFF004AADFF00319C
      FF002194FF00188CFF00188CFF00188CF700188CF7001884EF001884E700187B
      DE001873CE00186BBD0063B5FF00FFFFFF00FFFFFF00C6CEFF006363FF004A4A
      FF003942FF003139FF003139FF003139FF003139FF003139FF003139FF003139
      FF003131F7003131DE007B84FF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C847B007B737B00736B730073737B007373730073737300737373007B7B
      7B00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84009C9C9C00527BC600527BC60073737300ADADAD00B5B5B500BDBDBD00A5A5
      A500848484008484840000000000000000000000000000000000000000008484
      84009C9C9C00737373006363630073737300ADADAD00B5B5B500BDBDBD00A5A5
      A500848484008484840000000000000000000000000000000000000000008484
      84009C9C9C00737373006363630073737300ADADAD00B5B5B500BDBDBD00A5A5
      A500848484008484840000000000000000000000000000000000000000008484
      84009C9C9C00737373006363630073737300ADADAD00B5B5B500BDBDBD00A5A5
      A500848484008484840000000000000000000000000000000000000000004A4A
      4A00DEDEDE0000F7FF00527BC600527BC600A5A5A500BDBDBD00D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004A4A
      4A00DEDEDE0084848400636363007B7B7B00A5A5A500BDBDBD00D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004A4A
      4A00DEDEDE0084848400636363007B7B7B00A5A5A500BDBDBD00D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004A4A
      4A00BDBDBD0084848400636363007B7B7B00A5A5A500BDBDBD00D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004242
      4200D6D6D60039A5FF0000F7FF00527BC600527BC600527BC600D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004242
      4200D6D6D600848484006363630073737300A5A5A500B5B5B500D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004242
      4200D6D6D600848484006363630073737300A5A5A500B5B5B500D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004242
      4200BDBDBD008484840063636300737373000842630008426300D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004A4A
      4A00DEDEDE008484840039A5FF0094FFFF0000F7FF00527BC600527BC600C6C6
      C600A5A5A5009494940000000000000000000000000000000000000000004A4A
      4A00DEDEDE0084848400636363007B7B7B00A5A5A500B5B5B500D6D6D600C6C6
      C600A5A5A500005A000000000000000000000000000000000000000000004A4A
      4A00DEDEDE0084848400636363007B7B7B00A5A5A500B5B5B500D6D6D600C6C6
      C600A5A5A5009494940000000000000000000000000000000000000000004A4A
      4A00BDBDBD0084848400636363007B7B7B008CF7FF00ADCEE70008426300C6C6
      C600A5A5A5009494940000000000000000000000000000000000000000004A4A
      4A00527BC600527BC600527BC600527BC60094FFFF0000F7FF00527BC600527B
      C600848484008484840000000000000000000000000000000000000000004A4A
      4A00A5A5A500737373005A5A5A0073737300A5A5A500B5B5B500BDBDBD00A5A5
      A500005A000029AD4200005A0000000000000000000000000000000000004A4A
      4A00A5A5A500737373005A5A5A0073737300A5A5A500B5B5B500BDBDBD00A5A5
      A500848484008484840000000000000000000000000000000000000000004A4A
      4A00A5A5A500737373005A5A5A0073737300ADCEE7008CF7FF00ADCEE7000842
      6300848484008484840000000000000000000000000000000000000000004242
      420039A5FF0094FFFF0000F7FF0000F7FF0000F7FF0000F7FF0000F7FF00527B
      C600527BC6009C9C9C0000000000000000000000000000000000000000004242
      4200D6D6D600848484006363630073737300A5A5A500B5B5B500D6D6D600005A
      0000189C310042DE730021AD4200005A00000000000000000000000000004242
      4200D6D6D600848484006363630073737300A5A5A500B5B5B500D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004242
      4200BDBDBD00848484006363630073737300A5A5A500ADCEE7008CF7FF00ADCE
      E700084263009C9C9C0000000000000000000000000000000000000000004242
      4200D6D6D60039A5FF0094FFFF0000F7FF00527BC600527BC600D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004242
      4200D6D6D6008C848C0063636B007B737300A5A5A500B5B5B500005A0000109C
      210021AD420029C64A0018AD3100109C21000000000000000000000000004242
      4200D6D6D6008C848C0063636B006B84C6000021A5000021A5000021A5000021
      A5000021A5000021A5000021A500000000000000000000000000000000004242
      4200BDBDBD008C848C0063636B007B737300A5A5A500B5B5B500ADCEE7008CF7
      FF004ABDFF008CF7FF004ABDFF00000000000000000000000000000000004242
      4200DEDEDE008C848C0039A5FF0094FFFF0000F7FF00527BC600527BC600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004242
      4200DEDEDE008C848C00636363007B7B7B00A5A5A500B5B5B500005A0000005A
      0000005A000018AD3100005A0000005A00000000000000000000000000004242
      4200DEDEDE008C848C00636363000021A5000029E7000029E7000029E7000029
      E7000029E7000029E7000029E7000021A5000000000000000000000000004242
      4200BDBDBD008C848C00636363007B7B7B00A5A5A500B5B5B500084263008CF7
      FF008CF7FF008CF7FF008CF7FF004ABDFF000000000000000000000000005242
      4A00A5A5A5007373730039A5FF0094FFFF0000F7FF0000F7FF00527BC600527B
      C6008C8C8C007B7B7B0000000000000000000000000000000000000000005242
      4A00A5A5A500737373006363630073737300A5A5A500B5B5B500CECECE00B5B5
      B500005A000008941800005A0000000000000000000000000000000000005242
      4A00A5A5A50073737300636363006B84C6000021A5000021A5000021A5000021
      A5000021A5000021A5000021A500000000000000000000000000000000005242
      4A00A5A5A500737373006363630073737300A5A5A500B5B5B500CECECE00ADCE
      E7008CF7FF00299CEF008CF7FF008CF7FF000000000000000000000000005242
      4A00E7DED6008C848C006B63630039A5FF0094FFFF0000F7FF0000F7FF00527B
      C600527BC6009494940000000000000000000000000000000000000000005242
      4A00E7DED6008C848C006B63630073737300A5A5A500ADADAD00CECECE00C6C6
      C600005A000000941000005A0000000000000000000000000000000000005242
      4A00E7DED6008C848C006B63630073737300A5A5A500ADADAD00CECECE00C6C6
      C600A5A5A5009494940000000000000000000000000000000000000000005242
      4A00BDBDBD008C848C006B63630073737300A5A5A500ADADAD00CECECE00C6C6
      C600ADCEE7008CF7FF008CF7FF004ABDFF000000000000000000000000005242
      4A00E7DED6008C848C0063635A006B736B0039A5FF0094FFFF0000F7FF0000F7
      FF00527BC600527BC60000000000000000000000000000000000000000005242
      4A00E7DED6008C848C0063635A006B736B009C9C9C00ADADAD00CECECE00005A
      0000009410000073080000000000000000000000000000000000000000005242
      4A00E7DED6008C848C0063635A006B736B009C9C9C00ADADAD00CECECE00BDBD
      BD00A5A5A5009494940000000000000000000000000000000000000000005242
      4A00BDBDBD008C848C0063635A006B736B009C9C9C00ADADAD00CECECE00BDBD
      BD00A5A5A500ADCEE7004ABDFF00000000000000000000000000000000005242
      4A00A5A5A50073737300635A6B006B736B0094949400ADADAD00CECECE00BDBD
      BD00A5A5A5008C8C8C0000000000000000000000000000000000000000005242
      4A00A5A5A50073737300635A6B006B736B0000520000005A0000007B0800007B
      080000630800005A000000000000000000000000000000000000000000005242
      4A00A5A5A50073737300635A6B006B736B0094949400ADADAD00CECECE00BDBD
      BD00A5A5A5008C8C8C0000000000000000000000000000000000000000005242
      4A00A5A5A50073737300635A6B006B736B0094949400ADADAD00CECECE00BDBD
      BD00A5A5A5008C8C8C0000000000000000000000000000000000000000004A52
      4A00ADADB5008C8C8C009CA59400A5A5A500A5A5A500A5A5A500ADADAD00A5A5
      A5008C8C8C007B7B7B0000000000000000000000000000000000000000004A52
      4A00ADADB5008C8C8C009CA59400A5A5A500A5A5A500A5A5A500ADADAD00A5A5
      A5008C8C8C007B7B7B0000000000000000000000000000000000000000004A52
      4A00ADADB5008C8C8C009CA59400A5A5A500A5A5A500A5A5A500ADADAD00A5A5
      A5008C8C8C007B7B7B0000000000000000000000000000000000000000004A52
      4A00ADADB5008C8C8C009CA59400A5A5A500A5A5A500A5A5A500ADADAD00A5A5
      A5008C8C8C007B7B7B0000000000000000000000000000000000000000000000
      00008C847B007B737B00736B730073737B007373730073737300737373007B7B
      7B00848484000000000000000000000000000000000000000000000000000000
      00008C847B007B737B00736B730073737B007373730073737300737373007B7B
      7B00848484000000000000000000000000000000000000000000000000000000
      00008C847B007B737B00736B730073737B007373730073737300737373007B7B
      7B00848484000000000000000000000000000000000000000000000000000000
      00008C847B007B737B00736B730073737B007373730073737300737373007B7B
      7B00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84009C9C9C00737373006363630073737300ADADAD00B5B5B500BDBDBD00A5A5
      A500848484008484840000000000000000000000000000000000000000006B6B
      6B009C9C9C00636363006B6B6B0084848400ADADAD00BDBDBD00BDBDBD00A5A5
      A5008C8C8C009494940000000000000000000000000000000000000000008484
      84009C9C9C00737373006363630073737300ADADAD00B5B5B500BDBDBD00A5A5
      A500848484008484840000000000000000000000000000000000000000008484
      84009C9C9C00737373006363630073737300ADADAD00B5B5B500BDBDBD00A5A5
      A500848484008484840000000000000000000000000000000000000000004A4A
      4A00DEDEDE0084848400636363007B7B7B00A5A5A500BDBDBD00D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000006363
      6300BDBDBD006B6B6B006B6B6B008C8C8C00ADADAD00C6C6C600D6D6D600BDBD
      BD00A5A5A500ADADAD0000000000000000000000000000000000000000004A4A
      4A00DEDEDE0084848400636363007B7B7B00A5A5A500BDBDBD00D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004A4A
      4A00DEDEDE0084848400636363007B7B7B00A5A5A500BDBDBD00D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004242
      4200D6D6D600848484006363630073737300A5A5A500B5B5B500D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000005A5A
      5A00BDBDBD006B6B6B006B6B6B0084848400ADADAD00C6C6C600D6D6D600BDBD
      BD00A5A5A500ADADAD0000000000000000000000000000000000000000004242
      4200D6D6D600848484006363630073737300A5A5A500B5B5B500D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004242
      4200292929005A524A006363630073737300A5A5A500B5B5B500D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004A4A
      4A00DEDEDE0084848400636363007B7B7B00A5A5A500B5B5B500D6D6D600C6C6
      C600A5A5A5009494940000000000000000000000000000000000000000006363
      6300ADADAD00636363005A5A5A006B6B6B007373730084A594000094000073AD
      84009C9C9C008C8C8C0000000000000000000000000000000000000000004A4A
      4A00DEDEDE0084848400636363007B7B7B00A5A5A500B5B5B500D6D6D600C6C6
      C600A5A5A5009494940000000000000000000000000000000000000000004A4A
      4A005A524A0042424200526363007B7B7B00A5A5A500B5B5B500D6D6D600C6C6
      C600A5A5A5009494940000000000000000000000000000000000000000004A4A
      4A00A5A5A500737373005A5A5A0073737300A5A5A500B5B5B500BDBDBD00A5A5
      A500848484008484840000000000000000000000000000000000000000005A5A
      5A00A5A5A500636363006363630084848400ADADAD0000C6000073D67B000094
      00008C8C8C008C8C8C0000000000000000000000000000000000000000004A4A
      4A00A5A5A500737373005A5A5A0073737300A5A5A500B5B5B500BDBDBD00005A
      000000730800007B0800005A0000005A00000000000000000000000000004A4A
      4A00A5A5A50052737B00427BAD0018526B008C5A5200B5B5B500BDBDBD00A5A5
      A500848484008484840000000000000000000000000000000000000000004242
      4200D6D6D600848484006363630073737300A5A5A500B5B5B500D6D6D600C6C6
      C600ADADAD009C9C9C000000000000000000000000000000000000000000635A
      5A00C6BDBD006B6B6B006B636B0084848400ADADAD0000C6000073D67B000094
      0000A5A5A500ADADAD0000000000000000000000000000000000000000004242
      4200D6D6D600848484006363630073737300A5A5A500B5B5B500005200000073
      080000840800005A000000000000000000000000000000000000000000004242
      4200D6D6D60052737B0042739400947B7300C67331008C5A5200D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004242
      4200D6D6D6008C848C0063636B007B737300A5A5A500B5B5B500D6D6D600C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000005A63
      6300BDBDBD006B6B6B0052735200638463007B9C7B0000C6000073D67B000094
      00007B9C7B007B9C840000000000000000000000000000000000000000004242
      4200D6D6D6008C848C0063636B007B737300A5A5A500B5B5B50000840800005A
      0000ADADAD009C9C9C0000000000000000000000000000000000000000004242
      4200D6D6D6008C848C007B737B00F7BD8400F7AD5A00C67339008C5A5200C6C6
      C600ADADAD009C9C9C0000000000000000000000000000000000000000004242
      4200DEDEDE008C848C00636363007B7B7B00A5A5A500B5B5B500D6D6D600C6C6
      C600ADADAD009C9C9C000000000000000000000000000000000000000000635A
      5A00B5B5B50063636B00429C4A00009400000094000000C600004ABD5A000094
      00000094000000940000319C4200000000000000000000000000000000004242
      4200DEDEDE008C848C00636363007B7B7B00A5A5A500B5B5B50000941000005A
      0000ADADAD009C9C9C0000000000000000000000000000000000000000004242
      4200DEDEDE008C848C00AD7B7300FFD6AD00FFC68C00EFA55A00C67339008C5A
      5200ADADAD009C9C9C0000000000000000000000000000000000000000005242
      4A00A5A5A500737373006363630073737300A5A5A500B5B5B500CECECE00B5B5
      B5008C8C8C007B7B7B000000000000000000000000000000000000000000635A
      5A00A5A5A500636B63005AAD5A0084CE7B0084CE7B0084CE7B0073D67B0000C6
      000000C6000000C600005AAD5A00000000000000000000000000000000005242
      4A00A5A5A500737373006363630073737300005A0000005A000018AD310018AD
      3100005A0000005A000000000000000000000000000000000000000000005242
      4A00A5A5A5007373730063636300AD7B7300FFD6AD00FFC68C00F7AD5A00C673
      31008C5A52007B7B7B0000000000000000000000000000000000000000005242
      4A00E7DED6008C848C006B63630073737300A5A5A500ADADAD00CECECE00C6C6
      C600A5A5A500949494000000000000000000000000000000000000000000635A
      5A00C6BDBD006B6B6B0052735200738C7B008CA58C0000C6000073D67B000094
      0000739473007B9C7B0000000000000000000000000000000000000000005242
      4A00E7DED6008C848C006B63630073737300005A0000109C210021B5420029C6
      4A00189C3100005A000000000000000000000000000000000000000000005242
      4A00E7DED6008C848C006B63630073737300AD7B7300FFD6AD00FFC68C00EFA5
      5A00B56B39008C5A520000000000000000000000000000000000000000005242
      4A00E7DED6008C848C0063635A006B736B009C9C9C00ADADAD00CECECE00BDBD
      BD00A5A5A500949494000000000000000000000000000000000000000000635A
      5A00B5B5AD006B6B6B00636363007B8484009C9C9C0000C6000073D67B000094
      00009C9C9C00A5A5A50000000000000000000000000000000000000000005242
      4A00E7DED6008C848C0063635A006B736B009C9C9C00005A000042DE730042DE
      7300005200009494940000000000000000000000000000000000000000005242
      4A00E7DED6008C848C0063635A006B736B009C9C9C00AD7B7300FFD6AD009C94
      A50031ADF7000010AD0000009C00000000000000000000000000000000005242
      4A00A5A5A50073737300635A6B006B736B0094949400ADADAD00CECECE00BDBD
      BD00A5A5A5008C8C8C0000000000000000000000000000000000000000005A5A
      5A0094949400636363005A5A5A006B6B6B007373730000C6000073D67B000094
      00008C8C8C008C8C8C0000000000000000000000000000000000000000005242
      4A00A5A5A50073737300635A6B006B736B0094949400ADADAD00005A0000005A
      0000A5A5A5008C8C8C0000000000000000000000000000000000000000005242
      4A00A5A5A50073737300635A6B006B736B0094949400ADADAD00AD7B73004A9C
      EF001029D6001029D6000010AD0000009C000000000000000000000000004A52
      4A00ADADB5008C8C8C009CA59400A5A5A500A5A5A500A5A5A500ADADAD00A5A5
      A5008C8C8C007B7B7B0000000000000000000000000000000000000000004A52
      4A00949494008484840094948C0094949400949494007B9484006B946B006B9C
      7B008C8C8C007B7B7B0000000000000000000000000000000000000000004A52
      4A00ADADB5008C8C8C009CA59400A5A5A500A5A5A500A5A5A500ADADAD00A5A5
      A5008C8C8C007B7B7B0000000000000000000000000000000000000000004A52
      4A00ADADB5008C8C8C009CA59400A5A5A500A5A5A500A5A5A500ADADAD000018
      C6006B8CFF00106BFF001029D600000000000000000000000000000000000000
      00008C847B007B737B00736B730073737B007373730073737300737373007B7B
      7B00848484000000000000000000000000000000000000000000000000000000
      00008C847B007B737B00736B730073737B007373730073737300737373007B7B
      7B00848484000000000000000000000000000000000000000000000000000000
      00008C847B007B737B00736B730073737B007373730073737300737373007B7B
      7B00848484000000000000000000000000000000000000000000000000000000
      00008C847B007B737B00736B730073737B007373730073737300737373007B7B
      7B000018C6000018C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000084840000848400008484008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000AD3900008C290000000000000000000000000000A54200008C29
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD390000A54200008C290000000000000000000000000000A5420000A542
      00008C2900000000000000000000000000000000000000000000000000000000
      000000000000AD3900008C290000000000000000000000000000A54200008C29
      0000000000000000000000000000000000000000000000000000848484000084
      840000848400008484008484840000848400C6FFFF0084FFFF0084FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000C65A0000A5420000A54200008C29000000000000A5420000AD390000AD39
      00008C290000000000000000000000000000000000000000000000000000C65A
      0000A5420000A5420000A54200008C29000000000000A5420000AD390000A542
      0000AD3900008C29000000000000000000000000000000000000000000000000
      0000C65A0000A5420000A54200008C29000000000000A5420000AD390000AD39
      00008C290000000000000000000000000000000000000000000000848400C6FF
      FF0084FFFF0084FFFF0000848400848484000084840000848400008484008484
      8400008484008484840000000000000000000000000000000000000000000000
      0000AD39000000000000000000008C29000000000000AD390000000000000000
      00008C290000000000000000000000000000000000000000000000000000AD39
      00000000000000000000000000008C29000000000000AD390000000000000000
      0000000000008C29000000000000000000000000000000000000000000000000
      0000AD39000000000000000000008C29000000000000AD390000000000000000
      00008C2900000000000000000000000000000000000000000000848484000084
      8400008484000084840084848400000000000000000000848400C6C6C600C6C6
      C600C6C6C6000084840000000000000000000000000000000000000000000000
      0000AD3900008C290000000000008C29000000000000AD39000000000000C65A
      00008C290000000000000000000000000000000000000000000000000000AD39
      00008C29000000000000000000008C29000000000000AD390000000000000000
      0000C65A00008C29000000000000000000000000000000000000000000000000
      0000AD3900008C290000000000008C29000000000000AD39000000000000C65A
      00008C2900000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000084840000C6C60000C6
      C60000C6C6000084840000000000000000000000000000000000000000000000
      0000C65A0000AD390000AD390000AD390000A5948400AD390000AD390000AD39
      00008C290000000000000000000000000000000000000000000000000000C65A
      0000AD390000A5420000AD390000AD39000000000000AD390000AD390000A542
      0000AD3900008C29000000000000000000000000000000000000000000000000
      0000C65A0000AD390000AD390000AD390000A5948400AD390000AD390000AD39
      00008C29000000000000000000000000000000000000005A0000005A0000005A
      0000005A0000005A0000005A0000005A0000005A000000848400C6C6C600C6C6
      C600C6C6C60000848400005A0000005A00000000000000000000000000000000
      000000000000C65A0000A54200009C4A18008C634A00AD390000A54200008C29
      0000000000000000000000000000000000000000000000000000000000000000
      0000C65A0000A5420000A54200009C4A18008C634A00AD390000A5420000A542
      00008C2900000000000000000000000000000000000000000000000000000000
      000000000000C65A0000A54200009C4A18008C634A00AD390000A54200008C29
      00000000000000000000000000000000000000000000005A0000008400000084
      000000C6000000C6000000C6000000C6000000C600000084840000C6C60000C6
      C60000C6C6000084840000840000005A00000000000000000000000000000000
      00000000000000000000000000008C736B00E7DED60063524200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C736B004242420063524200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C736B00E7DED6008C736B00000000000000
      00000000000000000000000000000000000000000000005A00000084000000C6
      000084FF840084FF840084FF8400424242004242420000848400FFFFFF0084FF
      FF0084FFFF000084840000840000005A00000000000000000000000000000000
      000000000000000000008C736B00E7DED6009C847B00D6CEBD00635242000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C736B009C847B009C847B009C847B00635242000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C736B00E7DED6009C847B00D6CEBD008C736B000000
      00000000000000000000000000000000000000000000005A000000C60000C6FF
      C600C6FFC60084FF840042424200C6C6C600C6C6C60000848400008484000084
      84000084840084FF840000C60000005A00000000000000000000000000000000
      000000000000000000009C847B00E7DED60063524200D6CEBD008C736B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C736B009C847B00B5A59C0000000000B5A59C009C847B006352
      4200000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C847B00E7DED6009C847B00D6CEBD009C847B000000
      00000000000000000000000000000000000000000000005A000000C60000C6FF
      C600C6FFC600C6FFC60042424200C6FFFF00C6C6C600C6C6C6004242420084FF
      840084FF840084FF840000C60000005A00000000000000000000000000000000
      0000000000008C736B00E7DED60063524200000000007B7B7300D6CEBD006352
      4200000000000000000000000000000000000000000000000000000000000000
      00008C736B009C847B00B5A59C00000000000000000000000000B5A59C009C84
      7B00635242000000000000000000000000000000000000000000000000000000
      0000000000008C736B00E7DED6008C736B00000000007B7B7300D6CEBD008C73
      6B000000000000000000000000000000000000000000005A00000084000000C6
      0000C6FFC600C6FFC600C6FFC60042424200424242004242420084FF840084FF
      840084FF840000C6000000840000005A00000000000000000000000000000000
      0000000000009C847B009C847B000000000000000000000000007B7B73008C73
      6B00000000000000000000000000000000000000000000000000000000008C73
      6B009C847B00B5A59C000000000000000000000000000000000000000000B5A5
      9C009C847B006352420000000000000000000000000000000000000000000000
      000000000000D6CEBD008C736B000000000000000000000000008C736B00D6CE
      BD000000000000000000000000000000000000000000005A0000008400000084
      000000C60000C6FFC600C6FFC600C6FFC600C6FFC60084FF840084FF840084FF
      840000C600000084000000840000005A00000000000000000000000000000000
      00008C736B00E7DED600635242000000000000000000000000007B7B7300D6CE
      BD00635242000000000000000000000000000000000000000000000000009C84
      7B00B5A59C000000000000000000000000000000000000000000000000000000
      0000B5A59C009C847B0000000000000000000000000000000000000000000000
      00008C736B00E7DED6009C847B000000000000000000000000009C847B00D6CE
      BD008C736B0000000000000000000000000000000000005A0000005A0000005A
      0000005A0000005A0000005A0000005A0000005A0000005A0000005A0000005A
      0000005A0000005A0000005A0000005A00000000000000000000000000000000
      00007B7B73006352420000000000000000000000000000000000000000007B7B
      73008C736B00000000000000000000000000000000000000000000000000B5A5
      9C00000000000000000000000000000000000000000000000000000000000000
      000000000000B5A59C0000000000000000000000000000000000000000000000
      0000D6CEBD008C736B0000000000000000000000000000000000000000007B7B
      7300D6CEBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000635242000000000000000000000000000000000000000000000000000000
      00007B7B73000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C736B000000000000000000000000000000000000000000000000000000
      00007B7B73000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000094949400948C94008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C008C8C8C008C8C8C00000000000000000000000000000000000000
      000000000000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D694
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000949494008CCE8C008CCE8C008CD69C0094DEA50094DEB5008CDE
      BD008CDEBD0094E7CE008C848400000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7E7CE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D694
      6B00A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C0008520800005208000052080000520800084208000852
      0800A5FFFF009CFFFF008C848400000000000000000000000000000000000000
      000000000000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00EFDECE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5636B00A5636B00A5636B00A563
      6B00A5636B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C006B6B
      6B0073737300A5A5A500004A0000003900000039000000310000004A0000186B
      100084E7B50073E7AD008C848C00000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6946B00D6946B00D694
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B000000000000000000000000000000000094949400948C94008C8C
      8C008C8C8C00A5A5A500186B1000004A0000003900000031000029A542004AC6
      6B0094B54A00B5AD29008C8C94000000000000000000B58C8C008C5A5A008C5A
      5A008C5A5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B630000000000000000008C94A5008C94A500848C
      9400848C9400848C9400848C9400848C9400848C9400848C9400848C9400848C
      9400848C9400848C9400848C94008C94A500000000000000000000000000D694
      6B00A5636B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D694
      6B00A5636B0000000000000000000000000000000000949494008CCE8C008CCE
      8C008CD69C00ADADB5005ABD63000873100000520000085A0000C66B0000CE63
      0000DE6B0000DE730000848C9C000000000000000000B58C8C00FFF7E700F7EF
      DE00F7EFDE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B000000000000000000B5BDBD00B5BDBD00D6D6
      D600C6C6CE00BDC6CE00BDBDC600ADBDC600A5ADBD00A5A5AD0094A5AD0094A5
      AD00737BA5007B8CA5007B8C9400848C9400000000000000000000000000D694
      6B00A5636B00000000000000000000000000000000000000000000000000D694
      6B00A5636B00000000000000000000000000000000009C9C9C00085208000052
      080000520800B5B5B50031AD3900218C1800529C390094944200DE7B2100C65A
      0000BD4A0000C65200008C8C94000000000000000000B58C8C00F7EFDE00F7DE
      CE00F7DEC600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A5004A844A004A84
      4A004A844A004A844A00A57B73000000000000000000B5BDBD00D6D6E700D6D6
      D600C6C6CE00BDBDC600A5A5AD00A5A5AD0094A5AD008C94A5008C94A500737B
      A5002931BD00106BD600528CB500848C9400000000000000000000000000D694
      6B00A5736B00000000000000000000000000000000000000000000000000D694
      6B00A5636B0000000000000000000000000000000000A5A5A500004A00000039
      000000390000BDBDBD008CBD4A00A5BD5A00E7D68400FFEF9C00F7CE7B00DE9C
      4200BD733100AD4A00008C8C94000000000000000000B58C8C00FFF7E700FFD6
      A500FFD6A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D6004A844A0052AD
      520052AD52004A844A00A57B73000000000000000000B5BDBD00CECECE00D6D6
      D600CED6D600CECECE00ADBDC600ADB5BD00A5A5AD00A5A5AD008C94A5007B84
      A5001029BD00316BC6004A84B500848C9400000000000000000000000000D694
      6B00A5736B00000000000000000000000000000000000000000000000000D694
      6B00A5636B0000000000000000000000000000000000A5A5A500186B1000004A
      000000390000C6C6C600F7CE8C00FFB54200FFAD2900FFBD5A00FFBD5A00FFDE
      A500F7EFC600FFFFCE00848484000000000000000000B58C8C00FFF7EF00F7DE
      C600F7DEC600B58C8C00FFFFFF00FFFFFF004A844A004A844A004A844A0052AD
      520052AD52004A844A004A844A004A844A0000000000B5BDBD00C6C6CE00C6C6
      CE00C6CECE00C6C6CE00ADB5BD00A5ADBD00A5ADBD00A5A5AD009494A5008C94
      A500ADBDC600A5ADBD008CA5AD00848C9400000000000000000000000000D694
      6B00A5736B00000000000000000000000000000000000000000000000000D694
      6B00A5736B0000000000000000000000000000000000ADADB5005ABD63000873
      100000520000C6C6C600EFCEA500F7CE9400F7CE8C00F7D6AD00F7D6AD00F7D6
      9C00EFCE9C00F7D69C0084848C000000000000000000B58C8C00FFF7EF00F7E7
      CE00F7DEC600B58C8C00FFFFFF00FFFFFF004A844A0052AD520052AD520052AD
      520052AD520052AD520052AD52004A844A0000000000B5BDBD00E7E7E700E7E7
      E700CED6D600CECED600BDC6CE00BDBDC600ADB5BD00A5ADBD00A5A5AD0094A5
      AD00C6E7EF00BDCED60094A5AD00848C9400000000000000000000000000D694
      6B00A5736B00000000000000000000000000000000000000000000000000D694
      6B00A5736B0000000000000000000000000000000000B5B5B50031AD3900218C
      1800529C3900C6C6C600EFCEA500EFCEA500EFCEA500E7C69C00E7C69C00E7C6
      9C00E7C69C00EFC69400848484000000000000000000B58C8C00FFFFF700FFD6
      A500FFD6A500B58C8C00FFFFFF00FFFFFF004A844A006BCE84006BCE84006BCE
      840052AD520052AD520052AD52004A844A0000000000B5BDBD00E7E7E700E7D6
      E700D6D6D600CECED600BDC6CE00BDBDC600ADB5BD00A5ADBD00A5A5AD0094A5
      AD008C8C94008C94A5008494A500848C9400000000000000000000000000D694
      6B00A5736B00000000000000000000000000000000000000000000000000D694
      6B00A5736B0000000000000000000000000000000000BDBDBD008CBD4A00A5BD
      5A00E7D68400B5B5B500ADB5B500ADADB500ADADAD00A5A5AD00A5A5AD00A5A5
      A5009C9C9C009C9C9C00848484000000000000000000B58C8C00FFFFF700FFE7
      D600FFE7D600B58C8C00B58C8C00B58C8C004A844A004A844A004A844A006BCE
      840052AD52004A844A004A844A004A844A0000000000B5BDBD00D6D6D600CEBD
      BD00B5949400ADA5A500ADA5A500A58C9400A5949400A59494008C7B8400846B
      7300846B730084737B008494A500848C9400000000000000000000000000D694
      6B00A5736B00A5736B00A5736B00A5736B00A5736B00A5736B00A5736B00D694
      6B00A5736B00A5636B00A5636B000000000000000000C6C6C600F7CE8C00FFB5
      4200FFAD2900FFBD5A00FFBD5A00FFDEA500F7EFC600FFFFCE00848484000000
      00000000000000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD004A844A006BCE
      840052AD52004A844A00000000000000000000000000B5BDBD00E7E7E700A57B
      7B00ADA5A500BDBDBD00A5949400ADA5A500A594A50094848C008C7B84008C84
      8C008C8C9400847B84008494A500848C9400000000000000000000000000D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B0000000000C6C6C600EFCEA500F7CE
      9400F7CE8C00F7D6AD00F7D6AD00F7D69C00EFCE9C00F7D69C0084848C000000
      00000000000000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C004A844A004A84
      4A004A844A004A844A00000000000000000000000000B5BDBD00B5BDBD00D6D6
      E700CECECE00CECECE00C6C6CE00BDBDC600BDBDC600B5BDBD00A5A5AD00A5AD
      BD0094A5AD00A5A5AD0094A5AD00848C94000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D694
      6B00A5736B0000000000000000000000000000000000C6C6C600EFCEA500EFCE
      A500EFCEA500E7C69C00E7C69C00E7C69C00E7C69C00EFC69400848484000000
      00000000000000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D694
      6B00A5636B0000000000000000000000000000000000B5B5B500ADB5B500ADAD
      B500ADADAD00A5A5AD00A5A5AD00A5A5A5009C9C9C009C9C9C00848484000000
      00000000000000000000000000000000000000000000B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00BD84840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A9CC6008484840084A5AD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000399C42005AA56300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073849C0000428C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B8C940073CEE7005A737B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084B58C0042A55200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7E7CE008C5A5A00000000000000000000000000000000000000
      000000000000000000002173AD001873AD0029528400297BB50029A5D600295A
      8C00005294000863A5000000000000000000000000004A9CC6008484840084A5
      AD0000000000000000000000000000000000738C94005AB5E700427B9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004AAD5A007BF7A5004AAD5A007BAD
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00EFDECE008C5A5A00000000000000000000000000000000000000
      000000000000000000004AADDE0042B5E7000863A5002994CE0031ADDE00086B
      AD001094C6001094CE000000000000000000000000006BADBD0073C6D6004A63
      6B0000000000000000000000000000000000636B6B00297B9C0029739C007B63
      63009C6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004AB5630073F79C0073E79400318C
      3900000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE008C5A5A00000000000000000000000000000000000000
      00000000000021529400298CC6004ABDEF0042BDEF0042B5E70031ADDE0029A5
      DE0018A5D6001094C60000428C005263840000000000528494005ABDF700426B
      8C0073636300000000009C737300AD737300AD6B6B0052848C0073CEE7008C73
      7B00D68484008C6363000000000000000000000000007BB57B00399442000000
      00000000000000000000000000000000000084B58C0073EF9C0073F79C006BE7
      8C0063A5630000000000000000000000000000000000B58C8C008C5A5A008C5A
      5A008C5A5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B6300000000000000000000000000000000000000
      000000000000214A940042ADE70052C6F7004ABDEF0063BDE7004A849C001873
      A5001094CE001094C600006BA5002163940000000000000000002184B5002973
      94006B4A4A009C6B6B00D6848400DE8C8C00C67B7B006B737B0084DEEF009484
      8C00DE8C8C00AD7373008C8C8C0000000000000000007BB57B0052CE7300399C
      4A000000000000000000000000005AA563006BE7940073EF9C0073EF9C0073F7
      9C0042944A0000000000000000000000000000000000B58C8C00FFF7E700F7EF
      DE00F7EFDE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B00000000000000000000000000000000000000
      0000000000006BC6E70052C6EF004ABDEF006BC6EF00DEDEDE006B6B6B00295A
      73001094C6000894CE00109CCE0063ADBD0000000000AD737300528CA50073D6
      FF00635A5A00A56B6B00D6848400D6848400D68484007B636300C6CECE00B58C
      8C00D6848400BD7B7B00947B7B0000000000000000007BB57B0052CE730052CE
      7B00399C4A0000000000399442005ACE7B006BE794006BE7940073EF9C0073EF
      9C0042944A0000000000000000000000000000000000B58C8C00F7EFDE00F7DE
      CE00F7DEC600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFE7D600A57B7300000000000000000000000000000000000000
      000000000000218C390039A5B5004ABDEF006BC6EF00DEDEDE006B6B6B00316B
      7B0018A5D600189CCE00189CCE000000000000000000BD7B7B008C84840084DE
      EF0073949C009C6B6B00C67B7B00C67B7B009C6B6B00A56B6B00CE8C8C00CE94
      9400CE949400C68C8C009484840000000000000000007BB57B0052CE730052CE
      730052C673003184310052C66B0063DE8C0063E78C006BE794006BE794006BE7
      940042944A0000000000000000000000000000000000B58C8C00FFF7E700FFD6
      A500FFD6A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D600F7E7CE00FFE7
      D600FFF7E700EFDEDE00A57B7300000000000000000063A55A00088C1000007B
      00003994290039CE520031AD9C0042B5DE0063C6D600D6D6D60063636300426B
      7B0029A5D60029A5D600000000000000000000000000AD7373009C6B6B00949C
      9C00A5A5A5009C6B6B009C6B6B00CE8C8C00DEA5A500E7ADAD00DEA5A500DEA5
      A500DEA5A500C68C8C009C84840000000000000000007BB57B004AC663004ACE
      6B0052CE730052CE7B005AD684005AD6840063DE8C0063DE8C006BE794004AAD
      5A0063A5630000000000000000000000000000000000B58C8C00FFF7EF00F7DE
      C600F7DEC600B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700EFDE
      DE00D6C6C600BDADAD00B58473000000000000000000299C29004ADE6B0021B5
      310018AD290039CE520018A5390018A55A0042B54200C6B59C00525252008C73
      630042A5C600189CCE00000000000000000000000000A56B6B00A56B6B00AD73
      7300CE9C9C00DEB5B500EFBDBD00EFB5B500DEA5A500E7A5A500EFADAD00EFAD
      AD00DEADAD00B58484008C8C8C0000000000000000007BB57B004AC663004AC6
      630052CE730052CE73005AD684005AD684005ADE840063DE8C005ACE7B003994
      42000000000000000000000000000000000000000000B58C8C00FFF7EF00F7E7
      CE00F7DEC600B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700B58C
      8C00B58C8C00B58C8C00B58C8C000000000000000000318C18004ADE6B004AE7
      730039D65A0039CE520029C6420021BD310018A51800219418006B8442000000
      00000000000000000000000000000000000000000000AD7B7B00EFD6D600FFEF
      EF00FFE7E700EFCECE00E7C6C600EFC6C600F7C6C600EFBDBD00E7ADAD00EFAD
      AD00CE9C9C009C8484000000000000000000000000007BB57B0042BD520042C6
      5A004AC663004ACE6B0052CE730052CE7B005AD684005AD6840042944A000000
      00000000000000000000000000000000000000000000B58C8C00FFFFF700FFD6
      A500FFD6A500B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C
      8C00EFB56B00C68C7B00000000000000000039A5390021B531004AE773004AE7
      730073D6840073B584001894210010A5180010A51800089C0800529429000000
      00000000000000000000000000000000000000000000B5848400DECECE00FFF7
      F700FFF7F700FFE7E700EFCECE00EFD6D600F7CECE00F7C6C600F7C6C600DEAD
      AD009C848400000000000000000000000000000000007BB57B0042BD520042BD
      52004AC663004AC6630052CE730052CE730052D67B004AB56300000000000000
      00000000000000000000000000000000000000000000B58C8C00FFFFF700FFE7
      D600FFE7D600B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00BD84840000000000000000000000000094E7A5006BF7940052EF7B004ADE
      6B00D6D6D600A5A5A500217B29000894080008A5100010A5180073C663000000
      0000000000000000000000000000000000000000000000000000B58C8C00CEAD
      AD00EFDEDE00FFEFEF00FFEFEF00FFE7E700EFC6C600EFB5B5009C8484009C84
      840000000000000000000000000000000000000000007BB57B0039B5420039BD
      4A0042BD520042C65A004AC663004ACE6B0052CE730052CE7B00318C39000000
      00000000000000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD00B58473000000
      0000000000000000000000000000000000000000000042D663004ADE6B004ADE
      6B00D6D6D600A5A5A500399C420021BD310018A518004AA52900000000000000
      000000000000000000000000000000000000000000000000000000000000AD9C
      9C00C6ADAD00CEB5B500C6ADAD00BDA5A500BDA5A5009C8484008C8484007373
      730000000000000000000000000000000000000000007BB57B0039B5420039B5
      420042BD520042BD52004AC663004AC663004ACE6B0052CE730042AD52004294
      4A000000000000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C00B58C8C000000
      00000000000000000000000000000000000000000000000000005AE77B004ADE
      6B00CECECE008C8C8C005A944A0052BD4A0063C6630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500FFFFFF008C8C8C007373
      730000000000000000000000000000000000000000007BB57B0031AD310031B5
      390039B5420039BD4A0042BD520042C65A004AC663004ACE6B0052CE730052CE
      730042944A0000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B00000000000000
      00000000000000000000000000000000000000000000000000000000000042D6
      6300B5A58C00736B63008CB54A0021B529000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500FFFFFF008C8C8C007373
      730000000000000000000000000000000000000000007BB57B00319C3100319C
      3100319C3900319C390039A5420039A5420039A54A0039A54A0042AD520042AD
      520039944200398C4200000000000000000000000000B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00BD84840000000000000000000000
      0000000000000000000000000000000000000000000000000000BD9C7B00BD9C
      7B00BD9C7B00BD9C7B00BD9C7B00BD9C7B00BD9C7B00BD9C7B00BD9C7B00BD9C
      7B00BD9C7B00BD9C7B00BD9C7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFDEDE00DECECE00CEBDBD00CEB5BD00CEB5BD00CEBDBD00D6C6
      C600EFDEDE000000000000000000000000000000000000000000BD9C7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BD9C7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CEA5A500AD949400C6ADAD00CEB5B500C6ADAD00BD9C9C00A57B7B008452
      5A008C636300C6A5A50000000000000000000000000000000000BD9C7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BD9C7B0000000000C6B5AD00A5948400A5948400A594
      8400A5948400A5948400A5948400A5948400A5948400A5948400A5948400A594
      8400A5948400A5948400A5948400C6BDB5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7C6
      BD00D6CECE00E7E7E700DEDEDE00DED6D600D6BDBD00BD9C9C00A56B6B00BD8C
      8C008C5A6300A57B840000000000000000000000000000000000BD9C7B00FFFF
      FF00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C
      9C00CE9C9C00FFFFFF00BD9C7B00000000008C5A42005A3921005A3921005A39
      21005A3921005A3921005A3921005A3921005A3921005A3921005A3921005A39
      21005A3921005A39210073392100846B5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEC6
      BD00EFEFEF00F7F7F700EFEFEF00DEDEDE00D6C6C600BD8C8C009C5A5A00B584
      8400B5848400B58C8C0000000000000000000000000000000000BD9C7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BD9C7B00000000006B5A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000522910008C7363001894CE001894CE001894CE001894
      CE00000000000000000000000000000000000000000000000000000000000000
      0000007308000000000000000000000000000000000000000000000000000000
      0000EFEFEF00EFE7E700F7F7F700E7E7E700D6B5B500A56363009C525200B584
      8400B58C8C00DEC6BD0000000000000000000000000000000000BD9C7B00FFFF
      FF00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C
      9C00CE9C9C00FFFFFF00BD9C7B00000000006B5A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000522910008C7363001894CE00ADF7FF007BF7FF006BEF
      F70031B5DE0031B5DE0031B5DE001894CE001894CE001094CE00000000000073
      08005AE78C000073080000000000000000000000000000000000000000000000
      0000E7C6C600CE948C00DEB5B500D6A5A500CE9494009C4242009C4242009C63
      6300BD9C9C000000000000000000000000000000000000000000BD9C7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BD9C7B00000000006B5A4A00000000004A4A4A00FFFF
      FF00FFFFFF004A4A4A00000000000000000000000000000000004A4A4A00FFFF
      FF000000000000000000522910008C7363001894CE0084DEEF0094FFFF007BF7
      FF0084F7FF0084F7FF007BF7FF006BE7FF0063DEF70031B5DE000073080052D6
      7B0042D66B0031C64A0000730800000000000000000000000000000000000000
      0000E7BDBD00E7A56300FFB53100F7C67B00DEADA500BD6B6B00A54242007B52
      5A009C737B00CEADAD0000000000000000000000000000000000BD9C7B00FFFF
      FF00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C
      9C00CE9C9C00FFFFFF00BD9C7B00000000006B524A0000000000FFFFFF004A4A
      4A004A4A4A00FFFFFF0000000000FFFFFF000000000000000000FFFFFF004A4A
      4A00000000000000000052291000846B5A001894CE0063C6E70094FFFF0073F7
      FF007BF7FF0073EFFF0073EFFF0073EFFF007BEFFF007BF7FF0052C6E700108C
      210031C64A00109C210000000000000000000000000000000000000000000000
      0000DEB5B500E7A55A00FFB53100FFB53900FFB53900F7BD7300DEA58C00B573
      7B008C525A008C636B0000000000000000000000000000000000BD9C7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BD9C7B000000000063524A0000000000FFFFFF000000
      000000000000000000000000000000000000000000004A4A4A00FFFFFF000000
      00000000000000000000522910008C7363001894CE001894CE0084E7F7007BF7
      FF007BF7FF0073EFFF0073EFFF0073EFFF0073EFFF0073EFFF0052C6E7000884
      100018AD29000884100000000000000000000000000000000000000000000000
      0000D6B5B500EFAD5200FFBD4A00FFC65200FFC65200FFC65200FFBD4A00FFB5
      4A00D68C6B00845A6300000000000000000000000000BD9C7B00BD9C7B00BD9C
      7B00BD9C7B00BD9C7B00BD9C7B00BD9C7B00BD9C7B00BD9C7B00BD9C7B00BD9C
      7B00BD9C7B00BD9C7B00BD9C7B000000000063524A0000000000FFFFFF004A4A
      4A004A4A4A00FFFFFF0000000000FFFFFF0000000000FFFFFF004A4A4A000000
      00000000000000000000522910008C7363001894CE005AD6EF001894CE0094FF
      FF0073F7FF007BEFFF0073EFFF0073EFFF0073EFFF0073EFFF0052C6E700088C
      100008A518000000000000000000000000000000000000000000000000000000
      0000CEADAD00FFC65200FFCE6300FFCE6B00FFCE6B00FFCE6B00FFCE6300FFC6
      5200E7945A00946B7300000000000000000000000000BD9C7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFCE
      BD00FFCEBD00FFCEBD00BD9C7B00000000006B5A4A00000000004A4A4A00FFFF
      FF00FFFFFF004A4A4A00000000000000000000000000FFFFFF00000000000000
      00000000000000000000522910008C7363001894CE007BF7FF001894CE0073CE
      EF007BDEEF007BDEEF0094EFFF0084F7FF006BEFFF006BEFFF00088C100008A5
      180008841000000000000000000000000000000000000000000000000000DEC6
      BD00E7C6B500FFCE6B00FFD67300FFDE8400FFDE8400FFDE8400FFD67B00FFCE
      6B00C68463009C7B7B00000000000000000000000000BD9C7B00FFFFFF00CE9C
      9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00FFFFFF00FFD6
      BD0084634A00FFD6BD00BD9C7B00000000006B524A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000052291000846B5A001894CE008CFFFF0063E7F7001894
      CE001894CE001894CE005AC6E70000730800087B0800088C1000088C1000087B
      080073EFFF0018A5D6000000000000000000000000000000000000000000D6C6
      BD00E7CEA500FFD67B00FFDE8C00FFE79400FFE79C00FFE79400FFDE8C00FFD6
      7B00BD7B6B00AD8C8C00000000000000000000000000BD9C7B00FFFFFF00DEB5
      B500DEB5B500DEB5B500DEB5B500DEB5B500DEB5B500DEB5B500FFFFFF008463
      4A00FFD6BD0084634A00BD9C7B0000000000A57B5200735A3100735A3100735A
      3100735A3100735A3100735A3100735A3100735A3100735A3100736339007363
      3900736339006B5A420084522900846B5A001894CE0084FFFF0084FFFF0084FF
      FF007BF7FF007BF7FF001894CE001894CE006BCEEF0094E7F70084DEEF0094E7
      F700A5F7FF0039ADDE000000000000000000000000000000000000000000D6C6
      C600EFCE9C00FFDE8C00FFE79C00FFEFAD00FFF7B500FFEFAD00FFEF9C00FFDE
      8C00A56B6B00B5949400000000000000000000000000BD9C7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFDE
      D600FFDED600FFDED600BD9C7B0000000000DE842100EF8C1800EF8C1800EF8C
      1800EF8C1800EF8C1800EF8C1800EF8C1800EF8C1800EF8C1800FFB55A00FFAD
      5200FFB56300A58C9400A55A39009C8473001894CE008CFFFF007BF7FF007BF7
      FF007BF7FF0084F7FF0084FFFF0073F7FF001894CE001894CE001894CE001894
      CE00299CCE001894CE000000000000000000000000000000000000000000D6CE
      CE00B59C8C00CEBD9400E7CEA500FFF7BD00FFFFCE00FFFFC600FFEFAD00FFE7
      94009C636B00C6A5A500000000000000000000000000BD9C7B00BD9C7B00BD9C
      7B00BD9C7B00BD9C7B00BD9C7B00BD9C7B00BD9C7B00BD9C7B00BD9C7B00BD9C
      7B00BD9C7B00BD9C7B00BD9C7B0000000000B5845A00BD733900C6734200C673
      4200C6734200C6734200C6734200C6734200C6734200C6734200C67B4200C67B
      4200C67B4200B5734A00AD7B5A00C6BDB5001894CE0084E7F70094FFFF008CFF
      FF0084FFFF0063D6EF001894CE001894CE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      C600D6D6D600CEC6C600D6C6C600C6ADAD00BDA5A500CEB59C00DEC69C00DEBD
      8C00A5737300D6B5AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001894CE001894CE001894
      CE001894CE001894CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E7CEC600DECEC600E7CEC600DEC6BD00D6B5B500C69C
      9C00DEBDB5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005ACEE70031BDE70031BD
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000021A5CE0029ADCE001084AD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005ACEE70094F7FF007BE7
      F70063D6EF005ACEEF0042C6E70021B5DE0000ADDE0000000000000000000000
      00000000000000000000000000000000000000000000000000000000000029A5
      CE0021A5CE0010739C00109CC60021ADD60031B5D600188CB50010739C0042AD
      CE0039ADCE000000000000000000000000000000000042AD420073F7730063EF
      63004ADE4A0042D6420031C6310029BD290021AD210018A51800109C1000109C
      100018941800219C210000000000000000000000000029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD6000000000000000000000000005ACEE700ADFFFF00A5F7
      FF009CF7FF0094F7FF008CEFFF0084E7F70063D6F7005ACEEF0042C6E70021B5
      E70042C6E70000000000000000000000000000000000000000000000000031A5
      CE0031BDDE0010ADDE0010739C0018C6F7004AD6FF0031A5CE005AC6DE0063C6
      DE0039A5C6000000000000000000000000000000000000000000000000000000
      00009CB5A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF006BE7
      FF006BE7FF006BE7FF006BE7FF006BE7FF006BE7FF005ADEFF005ADEFF005ADE
      FF005ADEFF0029ADD6000000000000000000000000005ACEE700ADFFFF00ADFF
      FF00A5F7FF009CF7FF0094EFFF008CE7F70084E7F7007BE7F70073DEF7007BDE
      F7006BD6F7004AC6EF0031BDE7000000000000000000218CB50010739C004AB5
      D60084DEEF0052C6DE0039CEEF0018D6FF0039DEFF005AD6F70073C6DE00B5E7
      EF0094CEE70010739C000000000000000000000000000000000000000000CECE
      CE00107B2100528C630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0084EFFF0084EFFF006BE7FF006BE7FF006BE7FF005ADEFF005ADE
      FF005ADEFF0029ADD6000000000000000000000000005ACEE700B5FFFF00ADFF
      FF00ADFFFF00A5F7FF009CF7FF0094EFFF008CE7F7007BDEEF007BE7F70073DE
      F70073DEF7006BD6F70031BDE700000000000000000063BDD6004AB5D60052BD
      E70094EFFF008CEFFF005AE7FF0021DEFF0018DEFF0052E7FF007BEFFF007BEF
      FF00189CCE0021A5D60029A5CE00000000000000000000000000000000000000
      000031AD310039CE3900006B1800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0084EFFF0084EFFF006BE7FF006BE7FF006BE7FF005ADE
      FF005ADEFF0029ADD6000000000000000000000000005ACEE700B5FFFF00ADFF
      FF00ADFFFF00ADFFFF00A5F7FF009CF7FF0094EFFF00008400006BD6D6007BDE
      F70073DEF7006BD6F70031BDE70000000000000000001094C600189CCE004AC6
      EF0084DEF70094EFFF0073D6EF005ABDCE0052B5CE0029C6EF0000D6FF0000CE
      FF0008D6FF0008CEF70008B5E700000000000000000000000000000000000000
      00007394730031CE6B0008A51800006B18000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0084EFFF0084EFFF006BE7FF006BE7FF006BE7
      FF005ADEFF0029ADD6000000000000000000000000005ACEE700B5FFFF00ADFF
      FF00ADFFFF00ADFFFF00ADFFFF00A5F7FF009CF7FF008CE7F700008400007BE7
      F7007BDEF70073DEF70031BDE7000000000000000000188CBD0029ADDE0039BD
      E7006BD6F70094C6D6009494940094949400949494009494940042BDDE0000D6
      FF0010D6FF00189CCE00089CCE00000000000000000000000000000000000000
      0000000000007B947B00B5F7B5004AC62100299C080000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0094F7FF0084EFFF0084EFFF006BE7FF006BE7
      FF006BE7FF0029ADD6000000000000000000000000005ACEE700ADFFFF00ADFF
      FF00ADFFFF00ADFFFF00ADFFFF00ADF7FF009CF7FF0094F7FF0000A521000084
      00007BE7F70073DEF70031BDE70000000000000000001894BD0021ADDE0031B5
      E7005ACEF70094949400EFE7E700B5B5B500ADA5A500E7B5B500949494005ADE
      FF009CF7FF00B5EFFF00399CBD00000000000000000000000000000000000000
      000000000000000000008C8C8400D6E7CE008494730042524A00000000000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0084EFFF0084EFFF006BE7
      FF006BE7FF0029ADD6000000000000000000000000005ACEE700B5FFFF00ADFF
      FF00ADFFFF006BCEA50000940000ADFFFF00ADF7FF00ADF7FF0000AD21000084
      000084E7F7007BE7F70031BDE7000000000000000000108CBD00189CCE0021AD
      DE0042C6EF0094949400EFE7E700B5B5B500ADA5A500DEB5B500949494007BE7
      FF00ADEFFF008CCEE7004AA5C600000000000000000000000000000000000000
      00000000000000000000000000007B7B7B00F7F7F700BDBDBD004A4A4A000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0084EFFF0084EFFF0084EFFF0084EFFF0084EF
      FF006BE7FF0029ADD6000000000000000000000000005ACEE700DEFFFF00CEFF
      FF00B5EFE700009C2100009C2100ADFFFF00ADF7FF000094000000AD21000084
      00008CE7FF0084E7F70031BDE7000000000000000000000000000884AD0021A5
      D60031BDEF0094949400EFE7E700B5B5B500ADA5A500DEB5B5009494940063E7
      FF006BCEE700007BA50000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400E7E7E700848484004A4A
      4A005A5A5A000000000000000000000000000000000029ADD6009CFFFF009CFF
      FF0094F7FF0084EFFF0084EFFF0029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD60000000000088C1000000000005ACEE70042C6E70042C6
      E700008400004ACE7300008C2100008C21000094000000BD2100008400000094
      000094EFFF0084E7F70031BDE70000000000000000000000000000000000108C
      B500088CBD0094949400EFE7E700B5B5B500ADA5A500E7BDB50094949400189C
      C6002194BD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00BDBDBD005252
      520010001000000000000000000000000000000000000000000029ADD6009CFF
      FF0084EFFF0084EFFF0029ADD600000000000000000000000000000000000000
      0000000000000000000000000000088C1000000000005ACEE7008CEFF70063CE
      C60021A5420073F7A5004AD6730031C65A0021C63100009C000000840000A5F7
      FF009CF7FF008CEFFF0031BDE700000000000000000000000000000000000000
      00000000000094949400E7E7E700ADADAD00ADA5A500DEB5B500949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242001818
      18002108210010001000393939006B6B6B00000000000000000052CEEF0029AD
      D60029ADD60029ADD60052CEEF00000000000000000000000000000000000000
      000018AD290000000000088C100000730800000000005ACEE700B5FFFF000084
      000063E794006BEF9C004AD67300008400000084000000840000ADF7FF00ADFF
      FF00A5F7FF009CF7FF0031BDE700000000000000000000000000000000000000
      00000000000094949400B5B5B500A5A5A5009C949400ADA5A500949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000080808002121
      2100525252003939390010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000088C100018AD2900088C100000000000000000005ACEE700BDFFFF0084E7
      C6000084000042C65A0031C64A00008400008CC6AD00C6EFF700C6E7F700ADE7
      F700B5EFFF009CEFF70031BDE700000000000000000000000000000000000000
      00000000000094949400E7E7E700C6C6C600A5A5A500B5A5A500949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000393939005252520021082100100010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000088C10005AE78C0018AD290000000000000000005ACEE700A5F7FF00B5FF
      FF00A5F7E70042AD630021A5310000840000008400005ACEE7005ACEE7005ACE
      E7005ACEE7005ACEE7005ACEE700000000000000000000000000000000000000
      00000000000094949400E7E7E700EFEFEF00BDBDBD00A59C9C00949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000525252001808180031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000730800007308000073080018AD290000000000000000005ACEE7005ACE
      E7005ACEE7005ACEE7005ACEE700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094949400949494009494940094949400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000299C
      DE00299CDE00299CDE00299CDE00299CDE00299CDE00299CDE00299CDE00299C
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C00949494009494940094949400949494008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000636363005A5A5A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000299CDE008CD6
      EF0084D6F7008CD6EF008CD6EF008CD6EF008CD6EF008CD6EF008CD6EF008CD6
      EF00299CDE000000000000000000000000000000000000000000000000008C8C
      8C009C9C9C006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B009C94
      94008C8C8C000000000000000000000000000000000000000000000000000000
      00006B6B6B0084848400FFA5A500FF9C9C00FF9C9C00FFA5A5004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000299CDE00A5E7FF0094EF
      FF008CF7FF0094EFFF0094EFFF0094EFFF0094EFFF0094EFFF0094EFFF0094EF
      FF00CEEFFF00299CDE00000000000000000000000000000000009C9C9C00B5B5
      B5006B6B6B00ADADAD00ADA59C00ADADA500A5A5AD00ADA59400A59C94006B6B
      6B00B5ADAD008C8C8C0000000000000000000000000000000000000000006B6B
      6B00FFCECE00FFCECE00FFCECE005A5A5A00FFCECE00FFBDBD00FF9C9C00FFA5
      A5004A4A4A0000000000000000000000000000000000B5948C00B5848400B584
      8400B5848400B5848400B5848400B5848400B5948C0000000000000000000000
      00000000000000000000000000000000000000000000299CDE00A5E7FF009CEF
      FF0094EFFF0094EFFF0094EFFF0094EFFF0094EFFF0094EFFF0094EFFF0094EF
      FF00CEEFFF00299CDE000000000000000000000000008C8C8C00B5B5B5006B6B
      6B00ADA59C00D6D6BD00FFEFD600DECED600BDB5D600FFFFE700DEDED6009C94
      8C006B6B6B00B5ADAD008C8C8C000000000000000000000000006B6B6B00FFCE
      CE00FFA5A500FFCECE00FFCECE0084848400FFCECE00FFCECE00FFCECE00FFBD
      BD00FF9C9C004A4A4A00000000000000000000000000B5848400E7CECE00E7CE
      CE00E7CECE00E7CECE00E7CECE00E7CECE00B5848400B5848400000000000000
      00000000000000000000000000000000000000000000299CDE00ADEFFF00ADEF
      FF00ADEFFF00ADEFFF009CEFFF0094EFFF0094EFFF0094EFFF0094EFFF0094EF
      FF00CEEFFF00299CDE00000000000000000000000000ADA5AD0084848400BDCE
      BD00DEDEC600FFF7DE00F7D6A500F7C69400F7BD8400F7CE9C00FFFFE700EFF7
      EF009C9484006B6B6B009C94940000000000000000006B6B6B00FFCECE00FFBD
      BD00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFBDBD00FFA5A5004A4A4A000000000000000000B5848400E7CECE00E7CE
      CE00E7CECE00E7CECE00E7CECE00E7CECE00B5848400C6A59C00B58484000000
      00000000000000000000000000000000000000000000299CDE00B5EFFF00BDF7
      FF00BDF7FF00B5F7FF00ADF7FF00A5F7FF0094EFFF0094EFFF0094EFFF0094EF
      FF00CEEFFF00299CDE0000000000000000008C8C8C0084848400BDCEBD00ADA5
      9C00EFF7EF00FFF7CE00FFFFD600FFF7CE00F7DEAD00F7C69400F7CE9C008484
      7B005A5A5200AD948C006B6B6B00A59C9C00000000006B6B6B00FFBDBD00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FF9C9C004A4A4A000000000000000000B5948C00D6BDB500D6BD
      B500D6BDB500D6BDB500D6BDB500D6BDB500B5848400C6A59C00C6A59C00B584
      84000000000000000000000000000000000000000000299CDE00BDEFFF00C6F7
      FF00BDF7FF00B5F7FF00B5F7FF00ADF7FF009CEFFF0094EFFF0094EFFF0094EF
      FF00CEEFFF00299CDE000000000000000000A59CA50084848400ADA59C00EFF7
      EF00EFF7EF00EFF7EF00FFFFDE00FFFFDE00FFFFD600FFEFBD0084847B005A5A
      5200FFF7DE00A59C8C006B6B6B00A59C9C006B6B6B00FFA5A500FFEFEF00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFBDBD00FFA5A5004A4A4A000000000000000000B5948C00E7C6
      B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500B5848400C6A59C00C6A5
      9C00B584840000000000000000000000000000000000299CDE00C6EFFF00CEF7
      FF00CEF7FF00C6F7FF00B5F7FF00BDF7FF00ADF7FF009CEFFF0094EFFF0094EF
      FF00CEEFFF00299CDE000000000000000000A59CA50084848400ADA59C00EFF7
      EF00EFF7EF00EFF7EF00FFFFDE00C6BDAD0084847B0084847B005A5A5200FFDE
      A500DECED6009C94A5006B6B6B00AD9C9C006B6B6B00FFCECE00848484005A5A
      5A00FFCECE00FFCECE00FFCECE005A5A5A004242420042424200424242004242
      4200FFCECE0042424200FF9C9C004A4A4A00000000000000000000000000B594
      8C00E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500B5848400C6A5
      9C00C6A59C00B5848400000000000000000000000000299CDE00CEEFFF00DEF7
      FF00D6F7FF00CEF7FF00C6F7FF00BDF7FF00BDF7FF00ADEFFF009CEFFF0094EF
      FF00CEEFFF00299CDE000000000000000000A59CA50084848400ADA59C00EFF7
      EF00EFF7EF00FFFFDE00FFFFDE00C6BDAD005252520042423900FFDEA500D6AD
      7B00C6BDCE008C8CA5006B6B6B00AD9C9C0084848400FFCECE00FFFFFF00FFEF
      EF00FFCECE00FFCECE00FFCECE005A5A5A00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FF9C9C004A4A4A000000000000000000000000000000
      0000B5948C00E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500B584
      8400C6A59C00C6A59C00B58484000000000000000000299CDE00CEEFFF00E7FF
      FF00E7FFFF00DEFFFF00CEF7FF00BDF7FF00C6F7FF00BDF7FF00B5F7FF0094EF
      FF00CEEFFF00299CDE000000000000000000A59CA50084848400ADA59C00EFF7
      EF00EFF7EF00FFFFFF00FFFFF700FFFFDE00DEDEC600636B5A0084847B00FFDE
      A500FFF7CE00ADA594006B6B6B00A59C9C0084848400FFA5A500FFFFFF00FFEF
      EF00FFCECE00FFCECE00FFCECE005A5A5A00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFBDBD00FFA5A5004A4A4A000000000000000000000000000000
      000000000000B5948C00E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6
      B500B5848400C6A59C00B58484000000000000000000299CDE00D6F7FF00F7FF
      FF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00DEFFFF00D6F7FF00CEF7FF0094EF
      FF00CEEFFF00299CDE0000000000000000008C8C8C0084848400ADA59C00EFF7
      EF00EFF7EF00EFF7EF00FFFFFF00FFFFF700FFFFEF00EFEFD6005A5A52008484
      7B00DEDEC600B59C9C006B6B6B00A59C9C000000000084848400FFEFEF00FFFF
      FF00FFEFEF00FFCECE00FFCECE005A5A5A00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FF9C9C004A4A4A00000000000000000000000000000000000000
      00000000000000000000B5948C00E7C6B500E7C6B500E7C6B500E7C6B500E7C6
      B500E7C6B500B5848400B58484000000000000000000299CDE00DEF7FF00FFFF
      FF00FFFFFF00FFFFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00BDF7
      FF0084C6DE00299CDE00000000000000000000000000A59CA50084848400ADA5
      9C00EFF7EF00EFF7EF00EFF7EF00EFF7EF00F7F7F700FFFFFF00EFEFD6005A5A
      5200ADA59C006B6B6B00A59C9C00000000000000000084848400FFCECE00FFEF
      EF00FFFFFF00FFEFEF00FFCECE005A5A5A00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFBDBD00FF9C9C004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000B5948C00E7C6B500E7C6B500E7C6B500E7C6
      B500E7C6B500E7C6B500B58484000000000000000000299CDE00DEF7FF00F7F7
      F700ADC6CE00A5C6CE00A5C6CE00A5C6CE00A5C6CE00A5C6CE00B5D6D600DEFF
      FF0084D6F700299CDE000000000000000000000000008C8C8C00B5ADB5008484
      8400ADA59C00EFF7EF00EFF7EF00EFF7EF00EFF7EF00EFEFE700EFEFE700BDB5
      AD006B6B6B00B5A5A5008C8C8C0000000000000000000000000084848400FFCE
      CE00FFEFEF00FFFFFF00FFEFEF00FFCECE00FFCECE00FFCECE00FFCECE00FFBD
      BD00FF9C9C004A4A4A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5948C00B5848400B5848400B584
      8400B5848400B5848400B5948C000000000000000000299CDE00DEF7FF00DECE
      C600BDA59C00A57B7300A57B7300A57B7300A57B7300A57B7300BD9C9400E7EF
      E70094DEF700299CDE000000000000000000000000000000000094949400ADAD
      AD0084848400ADA59C008CAD840094AD8C00ADBD9C00C6C6B500C6B5B5006B6B
      6B00B5A5A5009494940000000000000000000000000000000000000000006B6B
      6B00FFCECE00FFEFEF00FFFFFF005A5A5A00FFCECE00FFCECE00FFBDBD00FF9C
      9C004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000299CDE00B5D6
      E700949C9C00E7DED600F7E7D600F7E7D600F7E7D600CEC6BD00849CA5008CCE
      E700299CDE000000000000000000000000000000000000000000000000008C8C
      8C009C9C9C00848484006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B009C9C
      9C008C8C8C000000000000000000000000000000000000000000000000000000
      00006B6B6B006B6B6B00FFA5A500FFCECE00FFCECE00FFA5A5004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000299C
      DE00299CDE009C948C009C948C009C948C009C948C009C948C00299CDE00299C
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C0094949400949494008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB56B00FFB5
      6B00FFB56B00FFB56B00FFB56B00FFB56B000000000000000000000000000000
      0000108C2100108C2100108C2100108C2100108C21000000000008A51800108C
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000008A5180008A5180008A5180008A5
      180008A51800000000000000000000000000000000000000000008A5180008A5
      180008A5180008A518000000000000000000FFB56B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFB56B0000000000000000000000000008A5
      1800108C210000000000000000000000000008A5180008A51800108C21000000
      00000000000000000000000000000000000008A5180008A5180008A5180008A5
      180000000000000000000000000008A5180008A51800CE630000CE630000CE63
      0000CE63000000000000D6731000CE630000000000000000000008A51800108C
      21000000000000000000000000000000000000000000000000000000000008A5
      1800108C2100000000000000000000000000FFB56B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFB56B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFB56B0000000000000000000000000008A5
      1800000000000000000000000000000000000000000008A51800108C21000000
      0000000000000000000000000000000000000000000008A51800108C21000000
      000000000000000000000000000000000000D6731000CE630000000000000000
      0000D6731000D6731000CE6300000000000000000000000000000000000008A5
      1800108C210000000000000000000000000000000000000000000000000008A5
      1800108C2100000000000000000000000000F7A55A00F7A55A00F7A55A00F7A5
      5A00F7A55A00F7A55A00F7A55A00F7A55A00F7A55A00F7A55A00F7A55A00F7A5
      5A00F7A55A00F7A55A00F7A55A00F7A55A0000000000000000000000000008A5
      1800000000000000000000000000000000000000000008A51800108C21000000
      000000000000000000000000000000000000000000000000000008A51800108C
      210000000000000000000000000000000000D6731000108C2100000000000000
      000000000000D6731000CE630000000000000000000000000000000000000000
      000008A5180008A5180008A5180008A5180008A5180008A5180008A5180008A5
      1800108C2100000000000000000000000000F7A55A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7A55A0000000000000000000000000008A5
      1800108C21000000000000000000000000000000000008A51800108C21000000
      00000000000000000000000000000000000000000000000000000000000008A5
      180008A5180008A5180008A5180008A51800D6731000CE630000000000000000
      000000000000D6731000CE630000000000000000000000000000000000000000
      00000000000008A51800108C21000000000000000000000000000000000008A5
      1800108C2100000000000000000000000000F7A55A00FFFFFF0000730800FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000730800FFFFFF00F7A55A000000000000000000000000000000
      000008A5180008A5180008A5180008A5180008A5180008A51800108C21000000
      0000000000000000000000000000000000000000000000000000000000000000
      000008A51800108C2100000000000000000008A51800D6731000D6731000D673
      1000D6731000D6731000CE630000000000000000000000000000000000000000
      0000000000000000000008A51800108C210000000000000000000000000008A5
      1800108C2100000000000000000000000000F7A55A000073080000730800FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF000073080000730800F7A55A000000000000000000000000000000
      0000000000000000000000000000000000000000000008A51800108C21000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000008A51800108C21000000000008A51800108C2100000000000000
      000000000000D6731000CE630000000000000000000000000000000000000000
      000000000000000000000000000008A51800108C2100000000000000000008A5
      1800108C2100000000000000000000000000008C0800008C0800007308000073
      080000730800FFFFFF00C6C6C600000000000000000000000000FFFFFF000073
      08000073080000730800008C0800008C080000000000000000000000000008A5
      1800000000000000000000000000000000000000000008A51800108C21000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008A51800108C2100D6731000CE630000000000000000
      000000000000D6731000CE630000000000000000000000000000000000000000
      00000000000000000000000000000000000008A51800108C21000000000008A5
      1800108C2100000000000000000000000000F7A55A00008C0800008C0800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00008C0800008C0800F7A55A0000000000000000000000000008A5
      1800108C21000000000000000000000000000000000008A51800108C21000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000008A5180008A51800D6731000D6731000D673
      1000D6731000CE63000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008A51800108C210008A5
      1800108C2100000000000000000000000000F7A55A00FFFFFF00008C0800FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00008C0800FFFFFF00F7A55A000000000000000000000000000000
      000008A5180008A5180008A5180008A5180008A51800108C2100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000008A51800108C2100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008A5180008A5
      1800108C2100000000000000000000000000EF9C2100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EF9C21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000008A5
      1800108C2100000000000000000000000000EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EF9C2100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EF9C21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EF9C2100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EF9C2100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EF9C21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A637B00BD9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B9CC600188CE7004A7BA500C694
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004AB5FF0052B5FF00218CEF004A7B
      A500C69494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A56B6B00A56B
      6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B
      6B00A56B6B00A56B6B00A56B6B00000000000000000000000000A56B6B00A56B
      6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B
      6B00A56B6B00A56B6B00A56B6B00000000000000000052B5FF0052B5FF001884
      E7004A7BA500C69494009C5A5A009C5A5A009C5A5A009C5A5A009C5A5A009C5A
      5A009C5A5A009C5A5A009C5A5A000000000008A5180008A5180008A5180008A5
      180000000000000000000000000008A5180008A5180008A5180008A5180008A5
      18000000000008A51800108C210000000000000000009C5A6B00FFF7F700F7EF
      E700F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7DEBD00F7DE
      BD00F7DEBD00F7D6AD00F7D6AD00A56B6B00000000009C5A6B00FFF7F700F7EF
      E700F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7DEBD00F7DE
      BD00F7DEBD00F7D6AD00F7D6AD00A56B6B00000000008C4A5A0052B5FF004AB5
      FF00188CE7004A7BA500BD949400FFE7CE00FFE7CE00FFE7CE00F7DEB500F7DE
      B500F7DEB500F7D6A500F7D6A5009C5A5A000000000008A51800108C21000000
      00000000000000000000000000000000000008A51800108C21000000000008A5
      1800108C21000000000008A51800108C2100000000009C5A6B00FFF7EF00FFF7
      F700F7EFE700F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7DE
      BD00F7DEBD00F7DEBD00F7D6AD00A56B6B00000000009C5A6B00FFF7EF00FFF7
      F700F7EFE700F7E7CE00F7E7CE00527BC600527BC600F7E7CE00F7E7CE00F7DE
      BD00F7DEBD00F7DEBD00F7D6AD00A56B6B00000000008C4A5A00FFF7EF0052B5
      FF004AB5FF002184DE005A6B73000000D600AD7B7300C6A59C00D6B5A500CEA5
      9C00F7DEB500F7DEB500F7D6A5009C5A5A00000000000000000008A51800108C
      21000000000000000000000000000000000008A51800108C21000000000008A5
      1800108C21000000000008A51800108C2100000000009C636B00FFF7EF00FFF7
      EF00F7EFE700F7EFE700F7EFE700F7EFE700F7E7CE00F7E7CE00F7E7CE00F7E7
      CE00F7E7CE00F7DEBD00F7DEBD00A56B6B00000000009C636B00FFF7EF00FFF7
      EF00F7EFE700F7EFE700F7EFE70000F7FF00527BC600527BC600F7E7CE00F7E7
      CE00F7E7CE00F7DEBD00F7DEBD00A56B6B00000000008C525A00FFF7EF00FFF7
      EF0052BDFF00B5D6EF00A5948C00B59C8C000000FF005252FF005252FF000000
      FF00E7DEBD00CEADA500F7DEB5009C5A5A0000000000000000000000000008A5
      180008A5180008A5180008A5180008A5180008A51800108C21000000000008A5
      1800108C21000000000008A51800108C2100000000009C636B00FFFFFF00FFF7
      EF00FFF7EF00FFF7EF00F7EFE700F7EFE700F7EFE700F7E7CE00F7E7CE00F7E7
      CE00F7E7CE00F7E7CE00F7DEBD00A56B6B00000000009C636B00FFFFFF00A5A5
      A500A5A5A500A5A5A500A5A5A50039A5FF0000F7FF00527BC600527BC600527B
      C600A5A5A500A5A5A500F7DEBD00A56B6B00000000008C525A00FFFFFF00FFF7
      EF00FFF7EF00CEB5B500D6B5A5000000FF005252FF005252FF005252FF000000
      FF00FFFFEF00F7F7EF00B58C8C009C5A5A000000000000000000000000000000
      000008A51800108C2100000000000000000008A51800108C21000000000008A5
      1800108C21000000000008A51800108C210000000000B5737300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7EFE700F7EFE700F7EFE700F7EF
      E700F7E7CE00F7E7CE00F7DEBD00A56B6B0000000000B5737300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7EF00FFF7EF0039A5FF0094FFFF0000F7FF00527B
      C600527BC600F7E7CE00F7DEBD00A56B6B0000000000B56B6B00FFFFFF00FFFF
      FF00FFFFFF00C6948C000000D6000000D6000000FF005252FF005252FF000000
      FF00FFFFF700FFFFFF00DED6BD009C5A5A000000000000000000000000000000
      00000000000008A51800108C21000000000008A51800108C21000000000008A5
      180008A5180008A5180008A518000000000000000000B5737300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFF7EF00F7EFE700F7EF
      E700F7EFE700F7E7CE00F7E7CE00A56B6B0000000000B5737300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00527BC600527BC600527BC600527BC60094FFFF0000F7
      FF00527BC600527BC600F7E7CE00A56B6B0000000000B56B6B00FFFFFF00FFFF
      FF00FFFFFF00DEBDA5000000D6000000D6000000FF005252FF005252FF000000
      FF00FFFFF700FFFFEF00F7EFD600C69C94000000000000000000000000000000
      0000000000000000000008A51800108C210008A51800108C21000000000008A5
      1800108C210000000000000000000000000000000000C67B7300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00F7EFE700A56B6B0000000000C67B7300FFFFFF00A5A5
      A500A5A5A500A5A5A50039A5FF0094FFFF0000F7FF0000F7FF0000F7FF0000F7
      FF0000F7FF00527BC600527BC600A56B6B0000000000BD736B00FFFFFF00FFFF
      FF00FFFFFF00E7C6AD000000D6000000D6000000D6005252FF005252FF000000
      FF00FFFFE700FFFFDE00F7F7D600C6AD9C000000000000000000000000000000
      000000000000000000000000000008A5180008A51800108C21000000000008A5
      1800108C210000000000000000000000000000000000C67B7300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7EF00FFF7EF00FFF7EF00A56B6B0000000000C67B7300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0039A5FF0094FFFF0000F7FF00527BC600527B
      C600FFF7EF00FFF7EF00FFF7EF00A56B6B0000000000BD736B00FFFFFF00FFFF
      FF00FFFFFF00DEBDAD00FFE7B500EFBD8400F7CE9400FFEFC600FFFFDE00FFFF
      DE00FFFFDE00FFFFDE00F7EFD600C6A59C000000000000000000000000000000
      00000000000000000000000000000000000008A5180008A5180008A5180008A5
      1800108C210000000000000000000000000000000000CE847B00FFA53900FFA5
      3900FFA53900FFA53900FFA53900FFA53900FFA53900FFA53900FFA53900FFA5
      3900FFA53900FFA53900FFA539000000000000000000CE847B00FFA53900FFA5
      3900FFA53900FFA53900FFA53900FFA5390039A5FF0094FFFF0000F7FF00527B
      C600527BC600FFA53900FFA539000000000000000000CE7B7300FF9C3100FF9C
      3100FF9C3100C69C9400FFEFC600FFEFC600F7D6A500F7CE9C00F7E7B500FFF7
      CE00FFF7D600FFFFD600E7DEBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D68C7B00FFA53900FFA5
      3900FFA53900FFA53900A56B6B00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D68C7B00FFA53900FFA5
      3900FFA53900FFA53900A56B6B000000000039A5FF0094FFFF0000F7FF0000F7
      FF00527BC600527BC600000000000000000000000000D6847300FF9C3100FF9C
      3100FF9C3100FF9C3100DEC6AD00FFFFFF00FFF7EF00F7CE9400EFBD8400F7CE
      9C00FFE7B500FFF7C600BD9C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D68C7B00D68C
      7B00D68C7B00D68C7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D68C7B00D68C
      7B00D68C7B00D68C7B0000000000000000000000000039A5FF0094FFFF0000F7
      FF0000F7FF00527BC600527BC600000000000000000000000000D6847300D684
      7300D6847300D684730000000000D6BDBD00F7EFD600FFEFC600FFE7AD00FFE7
      B500F7DEB500CEAD9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000039A5FF0094FF
      FF0000F7FF0000F7FF00527BC600527BC6000000000000000000000000000000
      000000000000000000000000000000000000CEAD9400CEAD9C00DEBDA500DEBD
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000021526B0021526B00636363006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002152
      6B0021526B00639CCE0000639C0021526B006363630063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021526B0021526B00296B
      94009CCEFF00639CCE0000639C0000639C0021526B0063636300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021526B00639CCE009CCEFF007BBD
      FF0000639C00639CCE0000639C0000639C0000639C0021526B00636363006363
      6300000000000000000000000000000000000000000000000000A56B6B00A56B
      6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B
      6B00A56B6B00A56B6B00A56B6B000018D6000000000000000000A56B6B00A56B
      6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B
      6B00A56B6B00A56B6B00A56B6B000000000000000000000000009C5A5A009C5A
      5A009C5A5A009C5A5A009C5A5A009C5A5A009C5A5A009C5A5A009C5A5A009C5A
      5A009C5A5A009C5A5A009C5A5A000000000021526B00639CCE00003163000063
      9C0000316300639CCE0000639C009CCEFF0000639C0000639C0021526B006363
      630063636300000000000000000000000000000000009C5A6B00FFF7F700F7EF
      E700F7E7CE00F7E7CE000018D6000018D600F7E7CE00F7E7CE00F7DEBD00F7DE
      BD00F7DEBD00F7D6AD000018D600A56B6B00000000009C5A6B00FFF7F700F7EF
      E700292929005A524A00F7D6AD00F7E7CE00F7E7CE00F7E7CE00F7DEBD00F7DE
      BD00F7DEBD00F7D6AD00F7D6AD00A56B6B00000000008C4A5A00FFFFF700FFF7
      E700FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFDEBD00FFDE
      BD00FFDEBD00FFD6AD00FFD6AD009C5A5A0021526B00639CCE00003163000031
      63009CCEFF009CCEFF007BBDFF00636363009CCEFF0000639C0000639C002152
      6B0063636300636363000000000000000000000000009C5A6B00FFF7EF00FFF7
      F700F7EFE700F7E7CE000018D6000018D6000018D600F7E7CE00F7E7CE00F7DE
      BD00F7DEBD000018D600F7D6AD00A56B6B00000000009C5A6B00FFF7EF00FFF7
      F7005A524A004242420052636300F7D6AD00F7E7CE00F7E7CE00F7E7CE00F7DE
      BD00F7DEBD00F7DEBD00F7D6AD00A56B6B00000000008C4A5A00FFFFF700FFFF
      F700FFF7E7005252FF000000D6000000D6000000D6000000D6000000D600FFDE
      BD00FFDEBD00FFDEBD00FFD6AD009C5A5A0021526B00639CCE009CCEFF009CCE
      FF007BBDFF006363630073DEF70073DEF70029ADD6009CCEFF0000639C000063
      9C0021526B00636363006363630000000000000000009C636B00FFF7EF00FFF7
      EF00F7EFE700F7EFE700F7EFE700F7EFE7000018D6000018D600F7E7CE000018
      D6000018D600F7DEBD00F7DEBD00A56B6B00000000009C636B00FFF7EF00FFF7
      EF00F7EFE70052737B00427BAD0018526B008C5A5200F7D6AD00F7E7CE00F7E7
      CE00F7E7CE00F7DEBD00F7DEBD00A56B6B00000000008C525A00FFFFF700FFFF
      F700FFF7E7005252FF000000FF000000FF000000FF000000FF000000D600FFE7
      CE00FFE7CE00FFDEBD00FFDEBD009C5A5A0021526B009CCEFF007BBDFF001839
      520073DEF70073DEF7008CEFFF008CEFFF0029ADD600636363009CCEFF000063
      9C0000639C0021526B006363630063636300000000009C636B00E7E7E700A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5000018D6000018E7000018
      E7008484840084848400F7DEBD00A56B6B00000000009C636B00FFFFFF00A5A5
      A500A5A5A50052737B0042739400947B7300C67331008C5A52006B6B6B008484
      84008484840084848400F7DEBD00A56B6B00000000008C525A00FFFFFF00FFFF
      F700FFFFF7005252FF000000FF000000FF000000FF000000FF000000D600FFE7
      CE00FFE7CE00FFE7CE00FFDEBD009C5A5A0021526B0000316300003163001839
      52008CEFFF008CEFFF008CEFFF009CFFFF0029ADD60073DEF70029ADD6009CCE
      FF0000639C0000639C0021526B006363630000000000B5737300FFFFFF00FFFF
      FF00FFFFFF00FFF7EF00FFF7EF00FFF7EF00FFF7EF000018D6000018E7000018
      EF00FFFFFF00FFFFFF00F7DEBD00A56B6B0000000000B5737300FFFFFF00FFFF
      FF00FFFFFF00FFF7EF007B737B00F7BD8400F7AD5A00C67339008C5A5200F7DE
      BD00F7EFE700F7E7CE00F7DEBD00A56B6B0000000000B56B6B00FFFFFF00FFFF
      FF00FFFFFF005252FF000000FF000000FF000000FF000000FF000000D600FFF7
      E700FFE7CE00FFE7CE00FFDEBD009C5A5A000000000021526B00003163001839
      52008CEFFF009CFFFF009CFFFF0029ADD60029ADD6008CEFFF0029ADD6006363
      9C009CCEFF0000639C0021526B000000000000000000B5737300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7EF000018F7000018EF00F7EFE700F7EF
      E7000018F700F7E7CE00F7E7CE00A56B6B0000000000B5737300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00AD7B7300FFD6AD00FFC68C00EFA55A00C67339008C5A
      5200F7DEBD00F7EFE700F7E7CE00A56B6B0000000000B56B6B00FFFFFF00FFFF
      FF00FFFFFF005252FF000000FF000000FF000000FF000000FF000000D600FFF7
      E700FFF7E700FFE7CE00FFE7CE009C5A5A00000000000000000021526B001839
      52009CFFFF0029ADD60029ADD6008CEFFF008CEFFF009CFFFF0029ADD60073DE
      F70029ADD6009CCEFF0021526B000000000000000000C67B7300FFFFFF00A5A5
      A500A5A5A500A5A5A500A5A5A5000018F7000018FF00A5A5A500A5A5A500A5A5
      A500A5A5A5000018F700F7EFE700A56B6B0000000000C67B7300FFFFFF00A5A5
      A500A5A5A500A5A5A500A5A5A500AD7B7300FFD6AD00FFC68C00F7AD5A00C673
      31008C5A520084848400F7EFE700A56B6B0000000000BD736B00FFFFFF00FFFF
      FF00FFFFFF005252FF005252FF005252FF005252FF005252FF005252FF00FFFF
      F700FFFFF700FFFFF700FFF7E7009C5A5A000000000000000000000000002152
      6B00183952008CEFFF008CEFFF009CFFFF009CFFFF0029ADD60029ADD6008CEF
      FF0029ADD6000031630021526B000000000000000000C67B7300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000018F7000018F700FFFFFF00FFFFFF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF000018F700A56B6B0000000000C67B7300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD7B7300FFD6AD00FFC68C00EFA5
      5A00B56B39008C5A5200F7DEBD00A56B6B0000000000BD736B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700FFFFF7009C5A5A000000000000000000000000000000
      000021526B009CFFFF009CFFFF0029ADD60029ADD6008CEFFF008CEFFF009CFF
      FF0029ADD60021526B00000000000000000000000000CE847B00FFA53900FFA5
      3900FFA53900FFA539000018F700FFA53900FFA53900FFA53900FFA53900FFA5
      3900FFA53900FFA53900FFA539000000000000000000CE847B00FFA53900FFA5
      3900FFA53900FFA53900FFA53900FFA53900FFA53900AD7B7300FFD6AD009C94
      A50031ADF7000010AD0000009C000000000000000000CE7B7300FF9C3100FF9C
      3100FF9C3100FF9C3100FF9C3100FF9C3100FF9C3100FF9C3100FF9C3100FF9C
      3100FF9C3100FF9C3100FF9C3100000000000000000000000000000000000000
      00000000000021526B00183952008CEFFF008CEFFF009CFFFF009CFFFF0029AD
      D60029ADD60000000000000000000000000000000000D68C7B00FFA53900FFA5
      3900FFA53900FFA53900A56B6B00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D68C7B00FFA53900FFA5
      3900FFA53900FFA53900A56B6B00000000000000000000000000AD7B73004A9C
      EF001029D6001029D6000010AD0000009C0000000000D6847300FF9C3100FF9C
      3100FF9C3100FF9C31009C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000021526B009CFFFF009CFFFF0029ADD60029ADD6000000
      0000000000000000000000000000000000000000000000000000D68C7B00D68C
      7B00D68C7B00D68C7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D68C7B00D68C
      7B00D68C7B00D68C7B0000000000000000000000000000000000000000000018
      C6006B8CFF00106BFF001029D600000000000000000000000000D6847300D684
      7300D6847300D684730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000021526B0021526B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000018C6000018C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000395A
      AD0039529C0039529C0039529C0039529C0039529C0039529C0039529C003952
      9C0039529C00395AAD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      FF001010FF001010FF001010FF001010FF001010FF001010FF001010FF001010
      FF001010FF000000000000000000000000000000000000000000000000000000
      0000A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B
      6B00A56B6B00A56B6B00A56B6B000000000000000000000000004A6BBD00B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A00395AAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E7000000FF000000
      FF000000A5000000B5000000B5000000AD000000E7000000AD000000B5000000
      AD000000D6000000FF000000FF0000000000000000000000000000000000A56B
      6B00FFF7EF00FFF7EF00FFF7EF00F7EFE700F7EFE700F7EFE700F7EFE700F7E7
      CE00F7E7CE00F7E7CE00F7E7CE00A56B6B0000000000000000004A6BBD00B58C
      8C00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE008C5A5A0039529C00000000000000000063735200425242002131
      2900213129002131290021312900213129004252420039424200394242002131
      290021312900213129002131290000000000000000005252FF007B7BDE000000
      FF000000BD0000006B000000730000006B000000CE0000006B00000073000000
      63000000FF000000FF005252FF0000000000000000000000000000000000A56B
      6B00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFF7EF00F7EFE700F7EFE700F7EF
      E700F7EFE700F7E7CE00F7E7CE00A56B6B0000000000000000004A6BBD00B58C
      8C00F7EFDE00F7EFDE00F7EFDE00C6C6C6004A5A52004A5A5200C6C6C600F7EF
      DE00F7EFDE008C5A5A0039529C00000000007B8463005A6342004A5231004A52
      3100425231004A52310042523100395231004A5A4A00637B6B004A6352003942
      4200314A3100395239003952390029422900000000000000FF00949CFF00ADB5
      CE006363FF006363FF006363FF006363FF00A5A5FF006363FF006363FF006363
      FF00949CFF00ADB5CE000800FF0000000000000000000000000000000000A56B
      6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00F7EFE700F7E7CE00A56B6B0000000000000000004A6BBD00B58C
      8C00F7EFDE00F7EFDE00F7EFDE004A5A5200FFFFEF00FFFFEF004A5A5200F7EF
      DE00F7EFDE008C5A5A0039529C000000000073846B0063634200525A39004A52
      31004A52310042523100394A310084948400ADBDB50052635A00A5B5AD00B5C6
      BD0039424200395239003952310029422900000000005252FF00C6CEBD002929
      FF004242FF003939FF003939FF004242FF004242FF004242FF003939FF004242
      FF003131FF006B6BFF005252FF0000000000000000000000000000000000A56B
      6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7EF00F7EFE700F7EFE700A56B6B0000000000000000004A6BBD00B58C
      8C00F7EFDE00F7EFDE00F7EFDE00FFFFEF00FFFFEF00FFFFEF004A5A5200F7EF
      DE00F7EFDE008C5A5A0039529C000000000073846B00636B42004A5A39004A5A
      3900425231004252310084947B00BDCEC60052635A001021210021292900C6D6
      CE0039424200314A31003952310029422900000000005252FF005252FF002121
      FF002121FF003131FF003131FF001010FF000000FF000000FF004A4AFF002121
      FF002121FF004A4AFF006B6BFF000000000000000000A56B6B00A56B6B00B573
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7EF00FFF7EF00A56B6B0000000000000000004A6BBD00B58C
      8C00F7EFDE00F7EFDE00F7EFDE004A5A52004A5A52004A5A5200C6C6C600F7EF
      DE00F7EFDE009C6B6B0039529C000000000073846B00636B4A00526339004A5A
      39004A5A39004A5A390084947B00DEE7E700C6CECE00394A4200949C9C00ADBD
      B50039424200395231003952310029422900000000001818FF003131FF000000
      FF000000B50010105A005252FF000000FF000000FF000000FF004242FF000000
      00000000FF004A4AFF000808FF0000000000A56B6B00FFF7EF00FFF7EF00B573
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7EF00A56B6B0000000000000000004A6BBD00B58C
      8C00FFF7E700FFF7E700FFF7E7004A5A5200FFF7E700FFF7E700FFF7E700FFF7
      E700FFF7E7009C6B6B0039529C000000000073846B00636B4A004A5A39004A5A
      39004A5A3900425A390039523900D6DED600ADBDB5009CB5AD009CB5AD00ADBD
      BD0039424200315231003952310029422900000000001818FF001010FF000000
      FF000000D60000007B0000006B000000630000006B0000006B00000073000000
      7B000000FF001818FF001818FF0000000000A56B6B00FFFFFF00FFFFFF00D68C
      7B00FFA53900FFA53900FFA53900FFA53900FFA53900FFA53900FFA53900FFA5
      3900FFA53900FFA53900FFA539000000000000000000000000005A73C600B58C
      8C00FFFFEF00FFFFEF00FFFFEF004A5A52004A5A52004A5A52004A5A5200FFFF
      EF00FFFFEF009C6B6B0039529C000000000073846B0063735200526342004A5A
      3900425A3900425A39004A634A0018292100949C940094A59C0094A59C001829
      210029423100315231003952310029422900000000000000CE004242FF000808
      2900313110006B6B5A00ADAD9C00E7EFDE00CECEBD00949484004A4A39004A4A
      3900212100000000D6000000CE0000000000A56B6B00FFFFFF00FFFFFF00D68C
      7B00FFA53900FFA53900FFA53900A56B6B00FFF7EF00FFF7EF00F7EFE700F7E7
      CE00A56B6B0000000000000000000000000000000000000000005A73C600B58C
      8C00FFFFEF00FFFFEF00FFFFEF00FFFFEF00FFFFEF00FFFFEF00FFFFEF00FFFF
      EF00FFFFEF00A57B730039529C000000000073846B0063735200526342003139
      310031393100425A3900395A3900182921001021180018212100102118001021
      2100525A5200CED6C600E7E7D6002942290000000000000000001818FF001818
      00005A5A5A00B5B5B500E7E7E700C6BDBD00ADA5A500C6C6C600FFFFFF004242
      42004A4A390000007B000000000000000000A56B6B00FFFFFF00FFFFFF00FFFF
      FF00D68C7B00D68C7B00D68C7B00FFFFFF00FFFFFF00FFF7EF00F7EFE700F7EF
      E700A56B6B0000000000000000000000000000000000000000005A73C600B58C
      8C00FFFFEF00FFFFEF004A5A52004A5A52004A5A52004A5A52004A5A52004A5A
      5200FFFFEF00A57B730039529C000000000073846B00737B5A00425A42001829
      2100313931008C9C8C0084948400213129001021210031393100213129001021
      1800848C8400CED6C600E7E7D6002942290000000000000000001818DE001818
      00008C8C8C003131310052525200525252004A4A4A00424242005A5A5A004A4A
      4A004A4A420018188C000000000000000000B5737300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7
      EF00A56B6B0000000000000000000000000000000000000000006384CE00B58C
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B58C8C0039529C0000000000737B630073846300526B4A00526B
      4A00526B4A00526B4A004A634200425A39004252420039523900395239003952
      39005A735A00527352005273520063735A00000000000000CE002121FF001010
      310000000000B5B5A500BDB5AD002121080000000000B5AD9C00BDB5AD002121
      0800080800002121AD000000CE0000000000B5737300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      EF00A56B6B0000000000000000000000000000000000000000006384CE00B58C
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B58C8C0039529C00000000000000000073846B0073846B007384
      6B0073846B0073846B0073846B0073846B0039524A0042524A0039524A003952
      4A0073846B0073846B0073846B0000000000000000000000FF00ADADFF000000
      FF0029294A0018189400424294000000C6000000C6002121B50042428C000000
      D600000008000000FF000000FF0000000000D68C7B00FFA53900FFA53900FFA5
      3900FFA53900FFA53900FFA53900FFA53900FFA53900FFA53900FFA53900FFA5
      39000000000000000000000000000000000000000000000000006384CE00B58C
      8C00FFFFFF00FFFFFF008C949400FFFFFF00FFFFFF00FFFFFF008C949400FFFF
      FF00FFFFFF00B58C8C0039529C00000000000000000000000000000000000000
      00000000000000000000000000000000000029422900E7EFE700E7EFE7002942
      290000000000000000000000000000000000000000000000FF008484FF003131
      FF002121310000007B0000007B0000007300000073000000730000007B001010
      21000000CE007B7BFF000000FF0000000000D68C7B00FFA53900FFA53900FFA5
      3900A56B6B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006384CE00B58C
      8C00B58C8C00B58C8C004A5A5200B58C8C00B58C8C00B58C8C004A5A5200B58C
      8C00B58C8C00B58C8C00395AAD00000000000000000000000000000000000000
      0000000000000000000000000000000000002942290029422900294229002942
      29000000000000000000000000000000000000000000000000000000FF002929
      FF003939FF004A4A9C002121AD002121AD002121AD002121AD002121A5005252
      EF005252FF000000FF00000000000000000000000000D68C7B00D68C7B00D68C
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006384
      CE005A73C6004A6BBD004A5A52004A6BBD004A6BBD004A6BBD004A5A52004A6B
      BD004A6BBD004A6BBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000395A
      AD0039529C0039529C0039529C0039529C0039529C0039529C0039529C003952
      9C0039529C00395AAD00000000000000000000000000FF630000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5847300A53100008C1000008C1000006B1000006B2908007B6B6300AD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A6BBD00B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A00395AAD0000000000FF630000FF630000FF630000BD4A
      000000000000FF630000D6520000D6520000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A000000000000000000000000000000000000AD84
      7B00AD420000CE630000B5633900EFD6C600E7C6B500D6BDAD00BD7B6300AD52
      31008C10000063210000000000000000000000000000CE520000CE520000CE52
      0000CE520000CE520000CE520000CE520000CE520000CE520000CE520000CE52
      0000CE520000CE520000CE5200000000000000000000000000004A6BBD00B58C
      8C00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE008C5A5A0039529C0000000000FFB55A00FFD6AD00FF630000BD4A
      000000000000FF630000FF630000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF630000FF630000000000000000000000000000AD847B00AD42
      0000D66B0000CE630000B56B4200EFD6CE00E7C6BD00E7BDAD00D6AD9400CEA5
      8C00C68C7300AD7352000000000000000000E7AD1800F7BD9C00F7BD9C00F7BD
      9C00F7BD9C00F7BD9C00F7BD9C00F7BD9C00F7BD9C00F7BD9C00F7BD9C00F7BD
      9C00F7BD9C00F7BD9C00F7BD9C00CE52000000000000000000004A6BBD00B58C
      8C00F7EFDE008484840084848400848484008484840084848400848484008484
      8400F7EFDE008C5A5A0039529C000000000000000000FFB55A00FF6300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C64A0000E773
      0000E76B0000D66B0000B5734A00EFE7D600E7CEBD00C68C7B00CEA58400C68C
      7300CEA58400AD7352000000000000000000E7AD1800FFDEC600F7BD9C00F7BD
      9C00FFD6B500F7BD9C00F7BD9C00FFCEA500F7BD9C00F7BD9C00FFD6B500F7BD
      9C00F7BD9C00FFCEA500F7BD9C00CE52000000000000000000004A6BBD00B58C
      8C00F7EFDE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7
      CE00F7EFDE008C5A5A0039529C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6520000EF7B
      0000E7730000E76B0000BD7B5200F7E7E700E7CECE00086BA500004A8C004A73
      9400CEA58C00AD7352000000000000000000E7AD1800FFEFDE00CE5A2900BD4A
      0000FFD6B500CE520000BD4A0000FFCEA500CE520000BD4A0000FFCEA500CE52
      0000BD4A0000FFCEA500F7BD9C00CE52000000000000000000004A6BBD00B58C
      8C00F7EFDE008484840084848400848484008484840084848400848484008484
      8400F7EFDE008C5A5A0039529C000000000000000000FF630000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6520000F784
      0000E7730000E773000042210800F7EFE700EFE7D600EFD6CE00E7C6BD00D6BD
      AD00D6AD9400AD7352000000000000000000E7AD1800FFEFDE00F7BD9C00F7BD
      9C00FFDEC600F7BD9C00F7BD9C00FFD6B500F7BD9C00F7BD9C00FFCEA500F7BD
      9C00F7BD9C00FFCEA500F7BD9C00CE52000000000000000000004A6BBD00B58C
      8C00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE009C6B6B0039529C0000000000FF630000FF630000FF630000BD4A
      000000000000FF630000D6520000D6520000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000000000000000000000000000CE520000F784
      0000EF7B0000E773000052291000F7E7E700F7E7E700EFD6D600E7CEBD00E7C6
      B500D6B5A500CE9484000000000000000000E7AD1800FFEFDE00CE5A2900BD4A
      0000FFEFDE00CE520000BD4A0000FFD6B500CE520000BD4A0000FFCEA500CE52
      0000BD4A0000FFCEA500F7BD9C00CE52000000000000000000004A6BBD00B58C
      8C00FFF7E700FFF7E70000008400F7EFDE00C6C6C6000000840000008400C6C6
      C600FFF7E7009C6B6B0039529C0000000000FFB55A00FFD6AD00FF630000BD4A
      000000000000FF630000FF630000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF630000FF630000000000000000000000000000CE630000FF8C
      0000F7840000F7941000F7EFE700F7D6BD00F7CEAD00E7BD9400BD7342003900
      00004A210800945239000000000000000000E7AD1800FFEFDE00FFEFDE00FFEF
      DE00FFEFDE00FFEFDE00FFDEC600FFD6B500FFD6B500FFD6B500FFD6B500FFCE
      A500FFCEA500FFCEA500F7BD9C00CE52000000000000000000005A73C600B58C
      8C00FFFFEF00FFFFEF0000008400FFFFEF0000008400FFFFEF00FFFFEF000000
      8400FFFFEF009C6B6B0039529C000000000000000000FFB55A00FF6300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE630000FF8C
      0000F7840000F7941000FFFFFF00F7E7E700F7CEAD00F7CEAD00BD735200BD84
      6B00B5522100733108000000000000000000E7AD1800FFEFDE00CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00FFD6
      B500FFCEA500FFCEA500F7BD9C00CE52000000000000000000005A73C600B58C
      8C00FFFFEF00FFFFEF0000008400FFFFEF00FFFFEF00FFFFEF00FFFFEF000000
      8400FFFFEF00A57B730039529C00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A42004A4A
      42004A4A42004A4A42004A4A42004A4A42000000000000000000CE6B0000F794
      1000FF8C0000F7840000E7CEBD00E7BD9400CE947B00CE948400CEA58C00CEA5
      8C00C68452007B3908000000000000000000E7AD1800FFEFDE00A5636B00FFEF
      DE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00CE8C6B00FFD6
      B500FFD6B500FFCEA500F7BD9C00CE52000000000000000000005A73C600B58C
      8C00FFFFEF00FFFFEF0000008400FFFFEF00000084000000840000008400C6C6
      C600FFFFEF00A57B730039529C000000000000000000FF630000BD4A00000000
      00000000000000000000000000000000000000000000000000004A4A42004A6B
      E7000839EF00FFE7DE00FFE7DE006B6363000000000000000000CE6B0000FFA5
      1000FF8C0000FF8C0000F7E7E700EFD6CE0073848C006B738400B5847300CEA5
      8C00C68452007B3908000000000000000000E7AD1800FFEFDE00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00FFDE
      C600FFD6B500FFD6B500F7BD9C00CE52000000000000000000006384CE00B58C
      8C00FFFFFF000000840000008400FFFFFF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B58C8C0039529C0000000000FF630000FF630000FF630000BD4A
      000000000000FF630000D6520000D6520000BD4A0000BD4A00004A6BE7000839
      EF004A6BE7000839EF00FFE7DE006B6363000000000000000000CE731000FFAD
      2900F7941000FF940000F7E7E700F7E7E700EFD6C600E7CEBD00D6BDAD00D6B5
      A500D6946300843908000000000000000000E7AD1800FFEFDE00FFEFDE00FFEF
      DE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEF
      DE00FFEFDE00FFDEC600F7BD9C00CE52000000000000000000006384CE00B58C
      8C00FFFFFF00FFFFFF0000008400FFFFFF000000840000008400000084000000
      8400FFFFFF00B58C8C0039529C0000000000FFB55A00FFD6AD00FF630000BD4A
      000000000000FF630000FF630000FF630000FF630000FF6300004A4A4200FFE7
      DE00FFE7DE000839EF004A6BE7007B7363000000000000000000CE732100FFB5
      3900FFA51000FF940800F7EFE700F7E7E700EFD6CE00E7CEBD00E7BDAD00D6BD
      AD00D6A56B008C420800000000000000000000000000EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C2100D68418000000000000000000000000006384CE00B58C
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B58C8C0039529C000000000000000000FFB55A00FF6300000000
      00000000000000000000000000000000000000000000000000004A4A4200FFE7
      DE00FFE7DE00FFE7DE000839EF004A6BE7000000000000000000CE7B2900FFC6
      6B00F7CE9400EFD6C600E7CEBD00E7C6BD00E7B59400D6AD8C00D68C5200CE73
      2900CE520000B5734A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006384CE00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00395AAD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A42006B63
      63006B6363006B6363007B7363000839EF00000000000000000000000000AD84
      7B00C68C7300C68C7300BD7B6300BD7B6300BD846B00BD7B6300BD8C7B00AD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006384
      CE005A73C6004A6BBD004A6BBD004A6BBD004A6BBD004A6BBD004A6BBD004A6B
      BD004A6BBD004A6BBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5242005A5242000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005284BD005284BD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF630000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A52420073524A0073524A005A52
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005284BD007BCEFF006BB5F7005284
      BD00000000004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A0000000000FF630000FF630000FF630000BD4A
      000000000000FF630000D6520000D6520000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5848400C6ADAD0073524A005A52
      4200000000005A5242005A5242005A52420073524A0073524A0073524A007352
      4A0073524A0073524A00B5848400000000005284BD00CEE7FF007BCEFF005284
      BD00000000004A844A006BCE84006BCE84006BC6840063C67B005ABD6B0052B5
      6B0052AD5A0052AD52004A8C4A0000000000FFB55A00FFD6AD00FF630000BD4A
      000000000000FF630000FF630000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF630000FF630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5848400B58484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005284BD005284BD000000
      0000000000004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A000000000000000000FFB55A00FF6300000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFEF00FFF7
      E700FFF7DE00F7EFDE00F7EFDE00F7EFDE00FFEFDE00F7E7D6008C5A5A000000
      000000000000C60000000000000000000000000000005A5242005A5242000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005284BD005284BD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF630000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFF7E700F7E7
      CE00F7E7CE00F7DECE00F7DEC600F7DEC600F7E7CE00EFDECE008C5A5A000000
      0000FF000000FF000000C6000000000000005A52420073524A0073524A005A52
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005284BD007BCEFF006BB5F7005284
      BD00000000004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A0000000000FF630000FF630000FF630000BD4A
      000000000000FF630000D6520000D6520000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000000000000000000084848400FFF7EF00FFDE
      B500FFDEB500FFDEB500FFD6B500FFD6B500FFDEBD00EFDECE0094636300FF00
      0000FF000000FF000000FF000000C6000000B5848400C6ADAD0073524A005A52
      4200000000005A5242005A5242005A52420073524A0073524A0073524A007352
      4A0073524A0073524A00B5848400000000005284BD00CEE7FF007BCEFF005284
      BD00000000004A844A006BCE84006BCE84006BC6840063C67B005ABD6B0052B5
      6B0052AD5A0052AD52004A8C4A0000000000FFB55A00FFD6AD00FF630000BD4A
      000000000000FF630000FF630000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF630000FF630000000000000000000084848400FFFFF700FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500F7E7DE00A57B73000000
      0000FF000000FF000000C60000000000000000000000B5848400B58484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005284BD005284BD000000
      0000000000004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A000000000000000000FFB55A00FF6300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFEF
      DE00FFE7D600FFE7D600FFE7D600FFEFD600FFF7E700EFE7DE00C6000000C600
      0000FF000000FF000000C6000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFD6
      A500FFD6A500FFD6A500FFD6A500EFDEDE00FF000000FF000000FF000000FF00
      0000FF000000FF000000C600000000000000000000005A5242005A5242000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005284BD005284BD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF630000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFE7
      D600FFE7D600FFE7D600FFE7D600B58C8C00B58C8C00B58C8C00B58C8C000000
      0000000000000000000000000000000000005A52420073524A0073524A005A52
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005284BD007BCEFF006BB5F7005284
      BD00000000004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A0000000000FF630000FF630000FF630000BD4A
      000000000000FF630000D6520000D6520000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000BD4A0000BD4A0000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B00000000000000
      000000000000000000000000000000000000B5848400C6ADAD0073524A005A52
      4200000000005A5242005A5242005A52420073524A0073524A0073524A007352
      4A0073524A0073524A00B5848400000000005284BD00CEE7FF007BCEFF005284
      BD00000000004A844A006BCE84006BCE84006BC6840063C67B005ABD6B0052B5
      6B0052AD5A0052AD52004A8C4A0000000000FFB55A00FFD6AD00FF630000BD4A
      000000000000FF630000FF630000FF630000FF630000FF630000FF630000FF63
      0000FF630000FF630000FF630000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      00000000000000000000000000000000000000000000B5848400B58484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005284BD005284BD000000
      0000000000004A844A004A844A004A844A004A844A004A844A004A844A004A84
      4A004A844A004A844A004A844A000000000000000000FFB55A00FF6300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018395200183952001839
      5200183952001839520018395200183952001839520018395200183952001839
      5200183952000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018395200009CCE00009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE0000639C0018395200000000000000000000000000000000004A636B002963
      8C0042525A005A5A5A005A5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFD6AD00FFCE9400FFCE9400FFCE
      9400FFCE9400FFCE9400FFCE94000000000018395200009CCE00009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE0000639C0000639C00183952000000000000000000000000004A6BB5004273
      CE00428CDE00398CDE002194D600186B9400315A6B00315A6B006B6B6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000000000
      000000000000000000000000000000000000FFD6AD00FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFCE94000000000018395200009CCE00009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE0000639C0000639C0000639C001839520000000000000000004A6BB500427B
      D600427BD600428CDE003994EF003994EF003194F7002194EF00187BAD002163
      8C00525A5A007373730000000000000000000000000000000000000000000000
      000000000000CE630000FFF7E700FFF7E700FFEFD600FFE7C600FFDEB500FFDE
      B500FFD6AD00FFD6AD00CE630000000000000000000000000000000000000000
      000000000000000000000000000000000000FFD6AD00FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFCE94000000000018395200009CCE00009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE0000639C0000639C0000639C00183952000000000000000000317BBD00427B
      D600427BD600427BD600428CDE00398CDE003994EF003994EF003194F7003194
      FF00319CFF003194F70063636300000000000000000000000000000000000000
      000000000000CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7E700FFEF
      D600FFE7C600FFD6AD00CE63000000000000000000000000000000000000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000FFF7E700FFF7E700FFCE94000000000018395200009CCE00009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE0000639C0000639C0000639C001839520000000000000000004273CE004273
      CE004273CE00427BD600427BD600428CDE003994EF003994EF003994F7003194
      F700319CFF00319CFF0063636300000000000000000000000000000000000000
      000000000000CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      E700FFEFD600FFE7C600CE63000000000000000000000000000000000000CE63
      0000FFFFFF00FFF7E700FFF7E700FFF7E700FFE7C600FFD6AD00FFD6AD00CE63
      0000FFF7E700FFF7E700FFCE94000000000018395200009CCE00009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE0000639C0000639C0000639C00183952000000000000000000427BD6004273
      CE00426BBD004273BD00427BD600427BD600428CDE00398CDE003994EF003994
      EF003194F7003194FF00636363000000000000000000DEBD9400DEBD9400DEBD
      9400DEBD9400CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7E700FFEFD600CE63000000000000000000000000000000000000CE63
      0000FFFFFF00FFFFFF00FFFFFF00FFF7E700FFF7E700FFE7C600FFD6AD00CE63
      0000FFF7E700FFF7E700FFCE9400000000001839520031CEFF0031CEFF0031CE
      FF0031CEFF0031CEFF0031CEFF0031CEFF0031CEFF0031CEFF0031CEFF0031CE
      FF0000639C0000639C0000639C00183952000000000000000000398CD600426B
      B5004A6BB500426BBD004273CE00427BD600427BD600428CDE003994EF003994
      EF003994F7003194F700636363000000000000000000FFD6AD00FFF7E700FFF7
      E700FFF7E700CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7E700CE63000000000000000000000000000000000000CE63
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7E700FFE7C600CE63
      0000FFD6AD00FFD6AD00FFD6AD0000000000000000001839520000639C000063
      9C0000639C00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE0031CEFF0000639C0000639C00183952000000000000000000426BB5003952
      7B004263AD00425A9C0039527B00394A7300395A8C0039639C003973CE00398C
      DE003994EF003994EF00636363000000000000000000FFD6AD00FFFFFF00FFFF
      FF00FFFFFF00CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CE63000000000000FFD6AD00FFCE9400FFCE9400CE63
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7E700CE63
      0000000000000000000000000000000000000000000000000000183952000063
      9C0000639C00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE00009CCE0031CEFF0000639C00183952000000000000000000426B9C00425A
      94004273BD004273BD004273BD004273BD0063ADCE00528CAD00425A7B003952
      7300396BAD003973BD00525252000000000000000000FFD6AD00FFFFFF00FFFF
      FF00FFFFFF00CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE63000000000000FFD6AD00FFF7E700FFF7E700CE63
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7E700CE63
      0000000000000000000000000000000000000000000000000000000000001839
      520000639C00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE00009CCE00009CCE0031CEFF0018395200000000000000000042526B004273
      BD00427BD600427BD600427BD600427BD6005AB5EF0063BDF7004A94DE00427B
      D600427BD600427BD600394A63000000000000000000FFD6AD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE6300000000000000000000FFD6AD00FFF7E700FFF7E700CE63
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7E700CE63
      0000000000000000000000000000000000000000000000000000000000000000
      0000183952000063AD000073C6000073BD000073C6000073BD000073BD000073
      BD000073BD000073BD000063CE001839520000000000000000004A5263008CB5
      DE005294DE004A94DE00428CDE00428CDE00428CDE00428CDE00428CDE00428C
      DE00428CDE00428CDE00394A5A000000000000000000FFD6AD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEBD94000000
      000000000000000000000000000000000000FFD6AD00FFF7E700FFF7E700CE63
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7E700CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000316300004A8C00005A9C0000529C00005A9C0000529C0000529400005A
      9C00005A9C0010529C00183952000000000000000000000000004A5A6B00425A
      7B00396BAD003173CE00529CEF006BADEF008CD6F70094D6FF008CD6F70073CE
      F7004AADF700429CF70042424A000000000000000000FFD6AD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEBD94000000
      000000000000000000000000000000000000FFD6AD00FFF7E700FFF7E700CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000000000000000000000000000000000000000000018395200183952001839
      5200183952000031630000316300003163000031630000316300003163000031
      630000639C001839520000000000000000000000000000000000000000000000
      000000000000183994003142520042526B00426B9C00396BAD004294EF00425A
      7B00396BAD00425A7B005A5A5A000000000000000000FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00DEBD9400DEBD9400DEBD94000000
      000000000000000000000000000000000000FFD6AD00FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFCE9400000000000000000000000000000000000000
      00000000000000000000000000000000000018395200009CCE00009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE00183952000000000000000000000000000000000000000000000000000000
      000000000000397BD60021429C0021398C0029315A0029315A00182163000000
      0000000000000000000000000000000000000000000000000000FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00DEBD9400000000000000
      000000000000000000000000000000000000FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00000000000000000000000000000000000000
      0000000000000000000000000000000000001839520000316300003163000031
      6300003163000031630000316300003163000031630000316300003163000031
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000005294BD001852D6001852D6001039B5001031B50018296B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031000000420000005200000052000000420000003100000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000042
      000000420000007B0800009C0800009C0800009C0800009C0800007B0800004A
      0000004A0000000000000000000000000000FFB55A00FF9C3100FF9C3100F794
      2900845A210094A594007BCEFF00319CFF00319CFF002984DE00295A520094A5
      9400A56BFF009C63FF009C63FF006B42AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021526B0018395200183952001839
      5200183952001839520018395200183952001839520018395200183952001839
      5200000000000000000000000000000000000000000000000000004A08000063
      080000A5100000A50800009C0800009C0800009C0800009C080000A5080000A5
      0800006B0800003100000000000000000000FFB55A00FF9C3100FF9C3100F794
      2900845A210094A594007BCEFF00319CFF00319CFF002984DE00295A520094A5
      9400A56BFF009C63FF009C63FF006B42AD000000000094423100944231009442
      3100944231009442310094423100944231009442310094423100944231009442
      31009442310094423100000000000000000021526B0031CEFF00009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE001839520000000000000000000000000000000000004A0800006B100008A5
      210008A51800009C0800009C0800009C0800009C0800009C0800009C0800009C
      080000A50800006B0800004A000000000000FFB55A00FF9C3100FF9C3100F794
      2900845A210094A594007BCEFF00319CFF00319CFF002984DE00295A520094A5
      9400A56BFF009C63FF009C6BFF006B42AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021526B0031CEFF00009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE0000639C0018395200000000000000000000000000004A080010AD310008AD
      290008A5180000A510004AC65200E7F7EF00D6F7DE0010AD2100009C0800009C
      0800009C080000A50800004A000000000000FFB55A00FF9C3100FF9C3100F794
      2900845A210094A594007BCEFF00319CFF00319CFF002184DE00295A520094A5
      9400A56BFF009C63FF009C6BFF006B42AD0000000000FF840000000000000000
      0000000000000000000000000000FF8400000000000000000000000000000000
      000000000000FF840000000000000000000021526B0031CEFF00009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE0000639C0000639C001839520000000000005200000884210010B5420010A5
      3100089C180042BD4A00F7FFF700FFFFFF0084D68C0000A51000009C0800009C
      0800009C080000A50800007B080000420000FFB55A00FF9C3100FF9C3100F794
      2900845A210094A594007BCEFF00319CFF00319CFF002984DE00295A52000000
      0000C6A5F700AD84FF009C63FF006B42AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021526B0031CEFF00009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE0000639C0000639C0000639C00183952000052000010A5420018B54A0010AD
      310042BD4A00F7FFF700FFFFFF0073D67B00009C0800009C0800009C0800009C
      0800009C080000A508000094080000420000FFB55A00FF9C3100FF9C3100F794
      2900845A210094A594007BCEFF00319CFF00319CFF002984DE00295A52000000
      000000000000C6A5F700AD84FF008463B50000000000FF840000000000000000
      0000000000000000000000000000FF8400000000000000000000000000000000
      000000000000FF840000000000000000000021526B0031CEFF00009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE0000639C0000639C0000639C0018395200006B100021B5520021B5520073D6
      9400EFFFEF00FFFFFF00F7FFF700B5EFC600B5E7BD00ADE7B500ADE7B500ADE7
      B500ADE7B500009C0800009C0800004A0000FFB55A00FF9C3100FF9C3100F794
      2900845A210094A594007BCEFF00319CFF00319CFF002184DE00295A52000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021526B0031CEFF00009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE0000639C0000639C0000639C00183952000873100039BD6B0029BD5A00BDEF
      CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00009C0800009C080000520000DEAD7B00FFA53900FFA53900F794
      2900845A210094A594007BCEFF00319CFF00319CFF002984DE00295A52000000
      00000000000000000000000000000000000000000000FF84000000000000FF84
      000000000000FF84000000000000FF84000000000000FF84000000000000FF84
      000000000000FF840000000000000000000021526B0031CEFF00009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE0000639C0000639C0000639C00183952000873100052C67B0042C6730029BD
      5A00A5E7BD00FFFFFF00F7FFF70084DEA50042BD5A0042BD5A0042BD5A0042BD
      5A0042BD5A0008A51800009C08000042000000000000F7AD6300FFA53900FFA5
      3900946B3900ADAD94007BCEFF00319CFF00319CFF002984DE00295A52000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003131310000639C00003163000031
      6300003163000031630000316300003163000031630000316300003163000031
      630000639C0000639C0000639C0018395200087310004ABD6B0084DEA50021B5
      520021B5520094DEB500FFFFFF00E7F7EF0052C6730010AD310010AD310010AD
      310008A5290008A51800008C080000420000000000000000000000000000DEAD
      7B00946B3900ADAD94007BCEFF00319CFF00319CFF002984DE00295A52000000
      00000000000000000000000000000000000000000000FF840000000000000000
      0000000000000000000000000000FF8400000000000000000000000000000000
      000000000000FF840000000000000000000000316300009CCE00009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE0021526B0000639C0000639C00183952000000000021A53100ADE7C6006BCE
      8C0010AD4A0018B54A008CDEAD00FFFFFF00F7FFF70029BD520010A5310008A5
      290008A5210008AD1800006B0800000000000000000000000000000000000000
      000000000000000000007BCEFF00319CFF00319CFF002984DE00295A52000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021526B0031CEFF0031CEFF0031CE
      FF0031CEFF0031CEFF0031CEFF0031CEFF0031CEFF0031CEFF0031CEFF0031CE
      FF0021526B0000639C0000639C00183952000000000021A5310052C67300BDEF
      D60063CE8C0021B5520018B5520094DEB500ADE7C60021B5520010AD390010AD
      310010AD3100109C2100006B0800000000000000000000000000000000000000
      0000000000000000000094C6F70042ADFF005AB5FF002984DE00295A52000000
      00000000000000000000000000000000000000000000FF840000000000000000
      0000000000000000000000000000FF8400000000000000000000000000000000
      000000000000FF84000000000000000000000000000021526B0063CEFF0063CE
      FF0063CEFF0063CEFF0063CEFF0063CEFF0063CEFF0063CEFF0063CEFF0063CE
      FF0063CEFF0021526B0000639C00183952000000000000000000109C21006BCE
      8C00D6F7E7009CE7B50052C67B0039BD630029BD5A0031BD630031BD630021BD
      4A0010A531000063080000000000000000000000000000000000000000000000
      000000000000000000000000000094C6F7005AB5FF005AB5FF005A7373000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000021526B0063CE
      FF0063CEFF0063CEFF0063CEFF0063CEFF0063CEFF0063CEFF0063CEFF0063CE
      FF0063CEFF0063CEFF0021526B00183952000000000000000000000000004ABD
      63004ABD630094DEB500BDEFD600A5E7C6008CDEAD007BDE9C004AC67B00189C
      3900189C39000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094423100944231009442
      3100944231009442310094423100944231009442310094423100944231009442
      3100944231009442310000000000000000000000000000000000000000002152
      6B0021526B0021526B0021526B0021526B0021526B0021526B0021526B002152
      6B0021526B0021526B0021526B00183952000000000000000000000000000000
      00000000000021A5310039B5520042BD630042BD630029A54A00108C29000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C7B0084634A00841800008418000084180000841800008463
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A004A4A4A004A4A
      4A004A4A4A000000000094949400948C94008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C000000000000000000000000000000
      0000AD392100C6290000FF846300E7ADA500E7ADA500E7ADA500E7ADA500FF6B
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000004242420042424200424242004242420042424200000000000000
      0000000000000000000000000000000000004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A0000000000000000005A5A5A00DE080800DE08
      08004A4A4A0000000000949494008CCE8C008CCE8C008CD69C0094DEA50094DE
      B5008CDEBD008CDEBD0094E7CE008C848400000000000000000000000000C629
      0000FF310000E794840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424242008484840000000000000000000000000084848400424242000000
      0000000000000000000000000000000000004A4A4A00A5A5A500527BC600527B
      C600FFFFFF00FFFFFF00A5A5A500FFFFFF00FFFFFF00FFFFFF00A5A5A500FFFF
      FF00FFFFFF00FFFFFF004A4A4A0000000000000000005A5A5A00CE082900FF08
      31004A4A4A00000000009C9C9C00085208000052080000520800005208000842
      080008520800A5FFFF009CFFFF008C8484000000000000000000FF6B4200FF31
      0000DE846B0000000000B58C7B006B3931006B3931008C6B630084634A006B39
      31006B3931006B3931007B4A4200000000000000000000000000000000000000
      0000848484000000000000000000424242000000000000000000424242000000
      0000000000000000000000000000000000004A4A4A00A5A5A50000F7FF00527B
      C600527BC600FFFFFF00A5A5A500FFFFFF00FFFFFF00FFFFFF00A5A5A500FFFF
      FF00FFFFFF00FFFFFF004A4A4A000000000000000000737B7B00C6181000FF18
      08004A4A4A0000000000A5A5A500004A0000003900000039000000310000004A
      0000186B100084E7B50073E7AD008C848C000000000000000000FF6B4200CE63
      310000000000DE846B00C6290000FF310000FF6B4200FF6B4200FF310000C629
      0000FF6B4200E7948400C6290000B58C7B000000000000000000000000000000
      0000848484000000000084848400000000004242420000000000424242000000
      0000000000000000000000000000000000004A4A4A00A5A5A50039A5FF0000F7
      FF00527BC600527BC600527BC600A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A5004A4A4A0000000000000000008C8C8C00CE4A0800FF5A
      08004A4A4A0000000000A5A5A500186B1000004A0000003900000031000029A5
      42004AC66B0094B54A00B5AD29008C8C940000000000FF6B4200FF310000B58C
      7B0000000000FF6B4200FF310000DE846B000000000000000000E7948400C629
      00000000000000000000FF6B4200841800000000000000000000000000000000
      0000848484000000000084848400000000004242420000000000424242000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A50039A5
      FF0094FFFF0000F7FF00527BC600527BC600FFFFFF00FFFFFF00A5A5A500FFFF
      FF00FFFFFF00FFFFFF004A4A4A0000000000000000008C8C8C00C6B50800FFEF
      08004A4A4A0000000000ADADB5005ABD63000873100000520000085A0000C66B
      0000CE630000DE6B0000DE730000848C9C0000000000FF846300C62900000000
      000000000000FF6B4200C6290000000000000000000000000000FF6B42008418
      00000000000000000000FF6B4200841800000000000000000000000000000000
      0000848484000000000084848400000000004242420000000000424242000000
      0000000000000000000000000000000000004A4A4A00527BC600527BC600527B
      C600527BC60094FFFF0000F7FF00527BC600527BC600FFFFFF00A5A5A500FFFF
      FF00FFFFFF00FFFFFF004A4A4A0000000000000000009C9C9C00ADCE0800CEFF
      08004A4A4A0000000000B5B5B50031AD3900218C1800529C390094944200DE7B
      2100C65A0000BD4A0000C65200008C949C0000000000FF846300841800000000
      000000000000FF6B420084180000000000000000000000000000FF6B42008418
      00000000000000000000FF846300841800000000000000000000000000000000
      0000848484000000000084848400000000004242420000000000424242000000
      0000000000000000000000000000000000004A4A4A0039A5FF0094FFFF0000F7
      FF0000F7FF0000F7FF0000F7FF0000F7FF00527BC600527BC600A5A5A500A5A5
      A500A5A5A500A5A5A5004A4A4A0000000000000000009C9C9C0039CE080042FF
      08004A4A4A0000000000BDBDBD008CBD4A00A5BD5A00E7D68400FFEF9C00F7CE
      7B00DE9C4200BD733100AD4A00008C949C0000000000FF947300C62900000000
      000000000000FF6B420084180000000000000000000000000000FF6B42008418
      00000000000000000000FF846300841800000000000000000000000000000000
      0000848484000000000084848400000000004242420000000000424242000000
      0000000000000000000000000000000000004A4A4A00A5A5A50039A5FF0094FF
      FF0000F7FF00527BC600527BC600FFFFFF00FFFFFF00FFFFFF00A5A5A500FFFF
      FF00FFFFFF00FFFFFF004A4A4A0000000000000000009C9C9C0010CE100010FF
      10004A4A4A0000000000C6C6C600F7CE8C00FFB54200FFAD2900FFBD5A00FFBD
      5A00FFDEA500F7EFC600FFFFCE008484840000000000E7948400FF3100009C84
      840000000000E7948400FF3100008C6B63000000000000000000FF3100008418
      00000000000000000000FF6B4200C62900000000000000000000000000000000
      0000848484000000000084848400000000004242420000000000424242000000
      0000000000000000000000000000000000004A4A4A004A4A4A004A4A4A0039A5
      FF0094FFFF0000F7FF00527BC600527BC6004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A0000000000000000009C9C9C0008CE730008FF
      94004A4A4A0000000000C6C6C600EFCEA500F7CE9400F7CE8C00F7D6AD00F7D6
      AD00F7D69C00EFCE9C00F7D69C0084848C000000000000000000FF6B42008463
      4A000000000000000000E7948400C62900006B393100AD392100FF3100008418
      00000000000000000000FF31000084634A000000000000000000000000000000
      0000848484000000000084848400000000004242420000000000424242000000
      0000000000000000000000000000000000004A4A4A00EF9C2100EF9C210039A5
      FF0094FFFF0000F7FF0000F7FF00527BC600527BC600EF9C2100EF9C2100EF9C
      2100EF9C2100EF9C21004A4A4A0000000000000000009C9C9C0010C6AD0008FF
      DE004A4A4A0000000000C6C6C600EFCEA500EFCEA500EFCEA500E7C69C00E7C6
      9C00E7C69C00E7C69C00EFC694008C8C94000000000000000000E7948400C629
      0000948C8C000000000000000000E7948400FF947300E7948400E7948400FF31
      000000000000FF6B4200FF310000000000000000000000000000000000000000
      0000848484000000000084848400000000004242420000000000424242000000
      0000000000000000000000000000000000004A4A4A00EF9C2100EF9C2100EF9C
      210039A5FF0094FFFF0000F7FF0000F7FF00527BC600527BC600EF9C2100EF9C
      2100EF9C2100EF9C21004A4A4A0000000000000000009C9C9C000884CE00089C
      FF004A4A4A0000000000C6C6C600B5B5B500ADB5B500ADADB500ADADAD00A5A5
      AD00A5A5AD00A5A5A5009C9C9C009C9C9C00000000000000000000000000E794
      8400C62900009C84840000000000000000000000000000000000000000000000
      0000FF6B4200FF310000E7948400000000000000000000000000000000000000
      0000000000000000000084848400000000004242420000000000424242000000
      0000000000000000000000000000000000004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A0039A5FF0094FFFF0000F7FF0000F7FF00527BC600527BC6004A4A
      4A004A4A4A004A4A4A004A4A4A0000000000000000009C9C9C00084ACE00085A
      FF004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7948400FF310000AD392100847B7B00948C8C00948C8C008C6B6300AD39
      2100FF310000E794840000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C000808DE000808
      DE004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E7948400FF6B4200FF6B4200FF6B4200FF846300E794
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500A5A5A500A5A5
      A500A5A5A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A637B00BD9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029188C0029298C002929
      7B00291873002918730029187300291873002918730029187300291873002929
      7300292973000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000006B9CC600188CE7004A7BA500C694
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003921DE007B6BFF009C8CFF008C8C
      FF009473E7008C6BD6008C63CE008463C600735AC6006B5AC6006B63C6006B6B
      C6006B5AC6005242B5000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF00008484840000000000000000000000000084848400FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000848484008484
      8400848484008484840000000000000000004AB5FF0052B5FF00218CEF004A7B
      A500C69494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002921D600C6C6EF00F7F7F700E7E7
      E700DEDEDE00CECECE00CECECE00BDBDBD00BDBDBD00B5B5B500ADADAD00ADAD
      AD009494BD005252B5000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FFFF0000848484000000000000000000FFFF0000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFFF
      0000848484008484840084848400000000000000000052B5FF0052B5FF001884
      E7004A7BA500C694940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003929DE00BDBDE700E7E7E700D6D6
      D600C6C6C600CECECE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600BDBD
      BD00A5A5C6005252B5000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FFFF00008484840000000000FFFF0000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000848484008484840000000000000000000000000052B5FF004AB5
      FF00188CE7004A7BA500BD949400000000000000000000000000000000000000
      0000000000000000000000000000000000004231DE00BDBDE700DEDEDE008484
      D6005A5ACE009C9CBD00CECECE00CECECE00D6D6D600D6D6D600D6D6D600CECE
      CE00B5B5D6006363BD00000000000000000000000000FFFF0000FF000000FF00
      0000FF000000FF000000FFFF0000848484008484840084848400FFFF0000FF00
      0000FF000000FFFF00000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FFFF00008484840000000000FF000000FF000000FF000000FF00
      0000FF000000FFFF0000848484000000000000000000000000000000000052B5
      FF004AB5FF002184DE005A6B730000000000AD7B7300C6A59C00D6B5A500CEA5
      9C00000000000000000000000000000000004242DE00ADADD600CECECE00BDBD
      D6007373D6005A52D600C6C6C600DEDEDE00E7E7E700EFEFEF00E7E7E700DEDE
      DE00BDBDE700636BC6000000000000000000000000000000000000000000FFFF
      0000FF000000FF000000FF000000FF000000FFFF000084848400848484008484
      840000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000848484000000000000000000FFFF0000FF000000FF000000FF00
      0000FF000000FFFF000084848400000000000000000000000000000000000000
      000052BDFF00B5D6EF00A5948C00B59C8C00F7E7CE00FFFFD600FFFFD600FFFF
      D600E7DEBD00CEADA50000000000000000004242DE00A5A5CE00C6C6C600CECE
      CE00C6C6CE009494E7006B6BD600E7E7E700F7F7F700FFFFFF00F7F7F700EFEF
      EF00D6CEF7008484C600ADADCE00E7E7EF000000000000000000848484008484
      8400FFFF0000FF000000FF000000FF000000FF000000FF000000848484008484
      840084848400000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000008484840084848400FF000000FF000000FF000000FF00
      0000FF0000008484840000000000000000000000000000000000000000000000
      000000000000CEB5B500D6B5A500FFEFC600FFFFD600FFFFD600FFFFD600FFFF
      DE00FFFFEF00F7F7EF00B58C8C00000000004242DE009C9CC600BDBDBD00C6C6
      C600CECECE00DEDEDE009C9CEF009494E7009494E7009494E7009494E7009494
      E7009494E7006B6BD6006363D6003939AD000000000084848400848484008484
      84008484840084848400FFFF0000FF000000FF000000FF000000FF000000FFFF
      0000848484008484840000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FFFF
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000C6948C00F7DEB500F7D6A500FFF7CE00FFFFD600FFFFDE00FFFF
      EF00FFFFF700FFFFFF00DED6BD00000000004242DE008C8CB500ADADAD00C6C6
      C600D6D6D600E7E7E700EFEFF7006B6BE700F7F7F700E7E7FF009494F7004242
      F7006363FF005252D6006363E700B5B5FF00FFFF0000FF000000FF000000FF00
      0000FF000000848484008484840000000000FF000000FF000000FF000000FF00
      0000FFFF00008484840084848400000000000000000000000000848484008484
      84008484840084848400FF000000FF000000FF000000FF000000FF000000FFFF
      0000848484008484840000000000000000000000000000000000000000000000
      000000000000DEBDA500FFE7AD00F7CE9400E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600FFFFEF00F7EFD600C69C94004242DE008C8CB500ADADAD00C6C6
      C600D6D6D600E7E7E700EFEFEF009C9CF700ADADE700D6D6FF008484EF00F7F7
      FF00E7E7FF008484C6000000000000000000FFFF0000FF000000FF000000FF00
      0000FF000000848484008484840000000000FFFF0000FF000000FF000000FF00
      0000FF000000FFFF000084848400000000000000000084848400848484008484
      8400848484008484840084848400FFFF0000FF000000FF000000FF000000FF00
      0000FFFF00008484840084848400000000000000000000000000000000000000
      000000000000E7C6AD00FFDEAD00EFBD8400B55A1800B55A1800B55A1800B55A
      1800B55A1800FFFFDE00F7F7D600C6AD9C005A42DE008484AD00A5A5A500BDBD
      BD00D6D6D600DEDEDE00EFEFEF00E7E7FF006B6BE7007B7BF700F7F7FF00FFFF
      FF00D6CEF700736BC6000000000000000000FFFF0000FF000000FF000000FF00
      0000FF000000848484008484840084848400FFFF0000FF000000FF000000FF00
      0000FF000000FFFF00008484840000000000FFFF0000FF000000FF000000FF00
      0000FF000000FFFF00008484840084848400FF000000FF000000FF000000FF00
      0000FF0000008484840084848400000000000000000000000000000000000000
      000000000000DEBDAD00FFE7B500EFBD8400F7CE9400FFEFC600FFFFDE00FFFF
      DE00FFFFDE00FFFFDE00F7EFD600C6A59C006342DE008484AD009C9C9C00ADAD
      AD00C6C6C600D6D6D600DEDEDE00EFEFEF008484EF009494E700F7F7F700EFEF
      EF00C6C6EF006B63C6000000000000000000FFFF0000FF000000FF000000FF00
      0000FF000000FFFF00008484840084848400FF000000FF000000FF000000FF00
      0000FF000000FFFF00008484840000000000FFFF0000FF000000FF000000FF00
      0000FF000000FFFF00008484840084848400FF000000FF000000FF000000FF00
      0000FF0000008484840000000000000000000000000000000000000000000000
      000000000000C69C9400FFEFC600FFEFC600F7D6A500F7CE9C00F7E7B500FFF7
      CE00FFF7D600FFFFD600E7DEBD00000000006342DE00736BB5008C73AD008C7B
      AD009484C6009C8CCE00AD9CCE00ADADCE007B73E7009494E700ADADD600ADA5
      CE008C84E7005252C600000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF00000084848400000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FFFF00000000000000000000000000000000000000000000000000000000
      00000000000000000000DEC6AD00FFFFFF00FFF7EF00F7CE9400EFBD8400F7CE
      9C00FFE7B500FFF7C600BD9C8C000000000000000000636BC600636BC600636B
      C600636BC600636BC600636BC6009C8CFF004239D6005A5ACE00636BC600636B
      C600636BC6000000000000000000000000000000000000000000FFFF0000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFFF
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDBD00F7EFD600FFEFC600FFE7AD00FFE7
      B500F7DEB500CEAD9C0000000000000000000000000000000000000000000000
      00000000000000000000000000008484EF009C9CFF006363BD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEAD9400CEAD9C00DEBDA500DEBD
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B6BF7007B7BDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031638C00426BB500318C
      D6002194D600186B9400295A6B00636363000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A005A5A5A005A5A
      5A004A4A4A00000000005A5A5A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000008484
      8400000000000000000000000000848484000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      84008484840000000000000000000000000000000000396B9C004A6BB500427B
      D600428CDE003994EF002994EF00188CB500186B94004A5A5A006B6B6B000000
      000000000000000000000000000000000000000000005A5A5A005A5A5A005A5A
      5A004A4A4A000000000063636300B5734200B5734200C6843100C6843100B573
      4200B5734200B5734200FFFFFF00000000000000000084848400000000008484
      8400848484000000000000000000848484000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      000084848400000000000000000000000000000000003973B500426BBD00427B
      D600427BD600428CDE00398CDE003994EF003994EF003194F7003194FF002194
      EF001894D600295A73007373730000000000000000006B7373006B737300636B
      6B006342630000000000737B7B00FFFFEF00FFB58400A5847B00637B8400CE8C
      5200C6843100FFFFFF00FFFFFF0000000000000000008484840084848400FFFF
      FF00C6C6C600C6C6C60000000000848484000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000FFFF0000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFFF
      00008484840000000000000000000000000000000000317BBD004273CE004273
      CE00427BD600427BD600428CDE003994EF003994EF003994F7003194F700319C
      FF00319CFF00188CBD006363630000000000000000007B8484007B8484006B6B
      730063426300000000007B848400FFFFFF00FFFFFF007B949C00527BAD00C6A5
      7B00FFE7C600FFFFFF00FFFFFF000000000084848400FFFFFF00C6C6C600C6C6
      C600000000008484840084848400848484000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000FFFF0000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFFF
      00000000000000000000000000000000000000000000318CDE00427BD600426B
      BD004273BD00427BD600427BD600428CDE00398CDE003994EF003994EF003194
      F7003194FF00188CCE00636363000000000000000000A5A5A500A5A5A500948C
      94006B4A6B00000000008C8C8C00FFFFFF00BDC6E7008CA5DE009CC6DE008CA5
      DE00F7F7F700FFFFFF00F7F7F7000000000084848400C6C6C600000000008484
      84008484840084848400FFFFFF00C6C6C600C6C6C60000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF00000084848400848484000000
      00000000000000000000000000000000000000000000318CDE00427BD6004A6B
      B500426BBD004273CE00427BD600427BD600428CDE003994EF003994EF003994
      F7003194F700188CCE00636363000000000000000000A5A5A500A5A5A5009C9C
      9C004A4A4A000000000094949400FFFFFF00E7E7F700A5ADAD00BDE7FF000894
      94007B7B9C00FFFFFF00F7F7F700000000008484840084848400848484008484
      8400FFFFFF0084848400C6C6C600C6C6C60084848400FFFFFF00000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF00000084848400848484000000
      000000000000000000000000000000000000000000003994EF004273BD00394A
      6B00394A6B00425A94004263AD00427BD600427BD600428CDE00398CDE003994
      EF003994EF00188CBD00636363000000000000000000ADADAD00ADADAD00A5A5
      A5004A4A4A00000000009C9C9C00FFFFFF00BDC6E70008949400107B7B00107B
      7B0008949400FFFFFF00EFEFEF00000000008484840084848400FFFFFF00C6C6
      C600C6C6C600C6C6C60084848400FFFFFF00C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000848484000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF00000084848400848484000000
      000000000000000000000000000000000000000000004294EF00426BB5004A6B
      B5004263AD00425A940039527B0039527300395A8C003973B5003973CE003994
      EF003994EF00188CBD00636363000000000000000000ADADAD00B5B5B500A5A5
      A5004A4A4A00000000009C9C9C00FFFFFF00E7F7FF00107B7B00107B7B000894
      9400FFFFFF00FFFFFF00EFEFEF0000000000FFFFFF00C6C6C600C6C6C600C6C6
      C60084848400FFFFFF00C6C6C600C6C6C600FFFFFF00FFFFFF00C6C6C600C6C6
      C600000000000000000000000000848484000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF00000084848400848484000000
      000000000000000000000000000000000000000000004A94DE0042638C004273
      CE004273CE004273CE004273CE005294D60094EFFF008CDEFF005294D600426B
      B5004263AD0039527B0039424A000000000000000000B5B5B500BDBDBD00ADAD
      AD004A4A4A0000000000A5A5A500EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF000000000000000000C6C6C60084848400FFFF
      FF00C6C6C600C6C6C600FFFFFF0084848400C6C6C600C6C6C600FFFFFF00C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      000084848400FF000000FF000000FF000000FF00000084848400848484000000
      000000000000000000000000000000000000000000005294D60042526B00427B
      D600427BD600427BD600427BD6004A94DE005AB5EF0063CEF7004A94DE00427B
      D600427BD600427BD600394A63000000000000000000BDBDBD00BDBDBD00ADAD
      AD004A4A4A0000000000A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500000000000000000000000000C6C6C600C6C6
      C600FFFFFF0000000000C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600C6C6C60000000000000000000000000000000000FFFF00008484
      840084848400FF000000FF000000FF000000FF00000084848400848484000000
      00000000000000000000000000000000000000000000396394004A8CCE009CCE
      F700ADD6F700ADD6F7009CCEF7006BADEF00529CEF004294EF003994EF003994
      EF003994EF00398CDE00394A52000000000000000000C6C6C600CECECE00BDBD
      BD004A4A4A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C6000000000000000000FFFFFF00FFFFFF00FFFFFF000000000084848400FFFF
      FF00C6C6C600C6C6C60000000000000000000000000000000000FFFF0000FF00
      0000FFFF0000FF000000FF000000FF000000FF00000084848400848484000000
      000000000000000000000000000000000000000000005A636B004A5A6B003963
      9400396BAD00428CDE00529CEF007BBDEF008CD6F70094D6FF008CD6F7005AB5
      EF004AADF7003994EF0042424A000000000000000000D6D6D600DEDEDE00CECE
      CE004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000000000000000000000000084848400FFFFFF0084848400C6C6
      C600000000000000000000000000000000000000000000000000FFFF0000FF00
      0000FF000000FF000000FF000000FF000000FF00000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001842AD0039424A00000000000000000008086B00181852004252
      6B00425A7B007B7B7B00000000000000000000000000E7EFEF00F7F7F700DEDE
      DE004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000FFFFFF0084848400C6C6C600000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF00000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002163D60021429C0021396B0029315A0008188C00182163000000
      00000000000000000000000000000000000000000000E7E7E700EFEFEF00DEE7
      E7004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FF000000FF000000FF000000FF00000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007BB5FF00A5EFFF00A5EFFF00A5EFFF005294FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A5A00DED6FF00DED6FF00DED6FF00DED6
      FF00E7DEFF00CECEEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008CA5EF00ADF7FF00A5EFFF009CDEFF009CE7FF0094DEFF005A84
      D600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6BDDE00DED6FF00DED6FF00DED6FF00DED6
      FF00DEDEFF00DEDEF7004A4A5A00000000000000000052ADFF00006BCE000063
      BD000063BD000063BD000063BD000063B5000063B5000063B5000063BD00005A
      AD000063B500000000000000000000000000000000006B84EF001831B5001029
      AD001031AD001029AD001031AD000831AD000029B5000829AD000829B5000021
      AD000831AD000000000000000000000000001008420010084A0008003900316B
      CE004A7BE700A5EFFF009CE7FF009CE7FF00A5EFFF00ADF7FF008CC6F70073BD
      FF005A84D60000000000737BAD00000000000000000000000000000000000000
      000000000000000000004A4A5A00E7DEFF00E7DEFF00DED6FF00DED6FF00DED6
      FF00DEDEFF00E7DEFF004A4A5A000000000000000000007BDE00008CFF001894
      FF001894FF001894FF001894FF001094FF001094FF00008CFF00008CFF00007B
      E700007BDE00000000000000000000000000000000000831D6002142DE003152
      E7003152E7003152E7003152E7002952E7002152EF00104AEF001042EF000031
      E7000029DE00000000000000000000000000737BAD00212984002952DE008CCE
      FF00A5EFFF00ADF7FF005263CE005263D6005A6BD6007B8CDE00ADE7F700A5EF
      FF007BB5FF0008004A0010084A00737BAD000000000000000000000000000000
      0000000000004A4A5A00EFE7FF00DED6FF00DED6FF00DED6FF00DED6FF00DED6
      FF00DED6FF00E7DEFF00BDBDCE0000000000000000000084EF00088CFF00299C
      FF00299CFF00299CFF00299CFF001094FF001094FF00088CFF00008CFF000084
      F700007BDE00000000000000000000000000000000001039DE00294ADE00395A
      EF00395AEF00395AEF00395AEF00295AE700295AE7001852EF00104AEF000839
      EF000031DE00000000000000000000000000000000003163EF009CE7FF00A5EF
      FF00A5EFFF006B7BD600E7EFF700FFFFFF00FFFFFF00C6CEEF002131CE007BAD
      E700A5EFFF00639CFF0018186B00000000000000000000000000000000000000
      00004A4A5A00EFE7FF00DED6FF00DED6FF00DED6FF00DED6FF00E7DEFF00C6C6
      EF008C6BDE00D6D6F700DED6FF0000000000000000000084EF00219CFF0031A5
      FF0031A5FF0084C6FF00299CFF001894FF001094FF00FFFFFF00008CFF00008C
      FF00007BE700000000000000000000000000000000002142DE00395AE7004A63
      E7004A63E7004A63E7009CADEF008494EF002963E7002152E700184AE7001042
      EF000839DE00000000000000000000000000316BCE005A8CEF00A5EFFF009CEF
      FF00EFE7EF006B94F700294AC60018296B00214ABD006B8CEF00FFFFFF005A6B
      D60094CEEF00A5EFFF003963E700000000000000000000000000000000004A4A
      5A00EFE7FF00DED6FF00DED6FF00DEDEFF00E7DEFF00C6BDDE0039316B002118
      A5003121AD0052528C00E7DEFF004A4A5A00000000001894FF00299CFF0039A5
      FF0039A5FF00FFFFFF0084C6FF001894FF0084C6FF00088CFF00008CFF00008C
      FF000084EF0000000000000000000000000000000000214ADE003963EF00526B
      E700526BE7004A6BE7009CADEF008494EF00315AE7002152E700184AE700104A
      EF001042DE000000000000000000000000002142BD00315AD600B5FFFF00A5B5
      DE003173FF0018105200000010000800180008001000101852003973F700FFFF
      FF0042396B00ADF7FF0084BDF7003152BD00734ADE00A573FF00A573FF008C7B
      C600E7DEFF00DED6FF00E7DEFF009C9CCE00E7E7FF00848C9400E7E7FF00DED6
      FF0039316B00A5A5BD00DEDEFF004A4A5A00000000001894FF0042ADFF0042AD
      FF0039A5FF0031A5FF0031A5FF00FFFFFF001094FF00088CFF00008CFF001094
      FF000084F700000000000000000000000000000000003152E700526BEF009CAD
      EF008494EF008494EF008494EF008494EF008494EF008494EF008494EF00214A
      EF00184ADE00000000000000000000000000396BCE00395AE700396BF7003963
      EF003963D60000001000080018000800180008001800080010003152C6004273
      EF00BDBDC6008CC6EF009CE7FF003152BD00A57BFF00A57BFF00AD84FF00B58C
      FF00C6C6EF00E7DEFF00DED6FF00D6D6EF00B5B5CE00E7DEFF00E7DEFF007363
      BD00DED6FF00D6CEEF00E7DEFF004A4A5A000000000031A5FF0039A5FF0042AD
      FF0042ADFF0031A5FF0084C6FF00FFFFFF0084C6FF001094FF001094FF00088C
      FF00008CFF0000000000000000000000000000000000425AEF005273E700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00214A
      E700214ADE00000000000000000000000000294ABD004273FF00427BFF00427B
      FF00316BD6000800180008001800080018000800100000001000315ACE00427B
      FF00314ABD0031428C004273EF003152BD00A57BFF00A57BFF00AD84FF009C73
      F700E7DEFF00DED6FF00DED6FF00E7DEFF009CA5B500E7DEFF007363BD00A57B
      FF00A584EF00CECEEF00E7DEFF004A4A5A000000000031A5FF0052ADFF004AAD
      FF0042ADFF00FFFFFF0031A5FF001894FF001094FF0084C6FF00088CFF001094
      FF00088CFF00000000000000000000000000000000004A63E7006B7BE700637B
      E7005A73E7004A63E7009CADEF008494EF002952E700214AE700214AE7002952
      E700294ADE00000000000000000000000000000000002142C6003973F7004A52
      9400CECEE7005A73D60018216B000808210018216B00316BF7004273F700397B
      FF004273F700427BFF003963EF0000000000AD84FF00A57BFF00A57BFF00734A
      DE00EFE7FF00E7DEFF007B7B9C00DEDEFF00E7D6FF00D6CEEF007363BD00AD7B
      FF009C84D600ADA5D600F7EFFF004A4A5A000000000031A5FF005AB5FF0052AD
      FF0084C6FF0031A5FF0039A5FF00219CFF001894FF00FFFFFF0084C6FF001094
      FF00008CFF00000000000000000000000000000000004A63E7006B84EF00637B
      EF006373E7004A63E7009CADEF008494EF003152E7002952DE00294AE7002952
      E700294AD600000000000000000000000000000000000000000008003900FFFF
      FF00FFFFFF00ADA5AD004273FF00396BEF00396BEF00FFFFFF00FFFFFF008C84
      9C003152C600427BFF00294ABD0000000000A57BFF00AD84FF00A57BFF008C5A
      F700E7E7FF00DED6FF00E7E7FF00E7DEFF00ADB5C600CECEE700C6CEDE00C6CE
      DE00E7E7F700F7EFFF004A4A5A00000000000000000042ADFF007BC6FF0063B5
      FF005AB5FF004AADFF0042ADFF0031A5FF0031A5FF0031A5FF00219CFF001894
      FF00008CFF00000000000000000000000000000000005A73E7008C9CEF00738C
      EF006B84EF006373E7005A73E7004A6BE7004A63E7004263EF00425ADE003152
      E700294AD600000000000000000000000000000000000000000008003900FFFF
      FF00FFFFFF00FFFFFF005A8CEF003973FF00EFF7FF00847B8C00FFFFFF00E7DE
      E700100842007B94DE000000000000000000A57BFF00A57BFF00AD84FF00948C
      B500D6D6F700E7DEFF00CECEE700B5B5E700948CB500EFE7FF004A4A5A004A4A
      5A004A4A5A00000000000000000000000000000000004AADFF008CCEFF0073C6
      FF0063B5FF005AB5FF0052ADFF004AADFF004AADFF0039A5FF0031A5FF00219C
      FF00088CFF0000000000000000000000000000000000637BE7009CADEF008494
      EF00738CEF006B7BEF006B7BE700637BE7006373E700526BE7004A6BE7003952
      E700294ADE00000000000000000000000000000000000000000039427300CEC6
      CE00FFFFFF00FFFFFF00316BEF00316BF700FFFFFF00FFFFFF00FFFFFF00A59C
      B500526BA500000000000000000000000000CEBDFF00CEBDFF004A4A5A000000
      0000ADADB500DED6FF00E7E7FF00E7DEFF00EFEFFF004A4A5A00000000000000
      00000000000000000000000000000000000000000000ADDEFF005AB5FF0039A5
      FF0031A5FF00299CFF00299CFF0031A5FF00219CFF001894FF001894FF000084
      EF000084EF00000000000000000000000000000000006B84EF006B84EF00526B
      E7004A6BE700425AE7004263E700425AEF00395AE7003152E7003152E7002142
      DE00214ACE000000000000000000000000000000000000000000000000000000
      2900BDBDC600524A73004284FF00427BFF00C6C6C600FFFFFF00E7E7E7001808
      4200000000000000000000000000000000000000000000000000000000004A4A
      5A00B58CFF00AD9CE700847BB50073639C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000524A
      73001008310010184A001018DE001829E7000800290018104A00080029000000
      000000000000000000000000000000000000000000000000000000000000947B
      C600A57BFF00A57BFF00AD84FF00A573FF004A4A5A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B84AD001018BD001018D6000818CE001029940000000800000000000000
      00000000000000000000000000000000000000000000000000004A4A5A00B58C
      FF00AD84FF00A573FF00AD7BFF00847BBD004A4A5A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484006B6B6B00636363005A5A5A005A5A5A006B6B6B007B7B7B00A5A5
      A500848484000000000000000000000000000000000000000000000000000000
      0000848484006B6B6B00636363005A5A5A005A5A5A006B6B6B007B7B7B00A5A5
      A500848484000000000000000000000000000000000000000000000000000000
      0000848484006B6B6B00636363005A5A5A005A5A5A006B6B6B007B7B7B00A5A5
      A500848484000000000000000000000000000000000000000000000000000000
      0000848484006B6B6B00636363005A5A5A005A5A5A006B6B6B007B7B7B00A5A5
      A500848484000000000000000000000000000000000000000000000000006363
      63009C9C9C005A5A5A00636363008C8C8C00ADADAD00BDBDBD00BDBDBD008C8C
      8C00848484008484840000000000000000000000000000000000000000006363
      63009C9C9C005A5A5A00636363008C8C8C00ADADAD00BDBDBD00BDBDBD008C8C
      8C00848484008484840000000000000000000000000000000000000000006363
      63009C9C9C005A5A5A00636363008C8C8C00ADADAD00BDBDBD00BDBDBD008C8C
      8C00848484008484840000000000000000000000000000000000000000006363
      63009C9C9C005A5A5A00636363008C8C8C00ADADAD00BDBDBD00BDBDBD008C8C
      8C008484840084848400000000004A637B000000000000000000000000006B6B
      6B00DEDEDE00636363006363630094949400A5A5A500CECECE00D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6B00DEDEDE00636363006363630094949400A5A5A500CECECE00D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6B00DEDEDE00636363006363630094949400A5A5A500CECECE00D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6B00DEDEDE00636363006363630094949400A5A5A500CECECE00D6D6D600B5B5
      B500ADADAD00C69494004A7BA50052B5FF000000000000000000000000006B6B
      6B00D6D6D60063636300636363008C8C8C00A5A5A500C6C6C600D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6B00D6D6D60063636300636363005A524A00B5B5B500C6C6C600D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6B00D6D6D60063636300636363008C8C8C00A5A5A500C6C6C600D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6B00D6D6D60063636300636363008C8C8C00A5A5A500C6C6C600D6D6D600B5B5
      B500ADADAD004A7BA5001884E70052B5FF000000000000000000000000006B6B
      6B00C6C6C6005A5A5A00525252005A5A5A005A5A5A006B6B6B007B7B7B009494
      940000520000005A0000005A0000000000000000000000000000000000006B6B
      6B00C6C6C6005A5A5A005252520052737B00428CDE008C5A52007B7B7B009494
      94009C9C9C00B5B5B50000000000000000000000000000000000000000006B6B
      6B00C6C6C6005A5A5A00525252005A5A5A005A5A5A006B6B6B007B7B7B009494
      94009C9C9C00086B080000000000000000000000000000000000000000006B6B
      6B00C6C6C6005A5A5A00525252005A5A5A005A5A5A00D6B5A500C6A59C009494
      94005A6B73004AB5FF0052B5FF00000000000000000000000000000000005A5A
      5A00A5A5A5005A5A5A005A5A5A008C8C8C00A5A5A500BDBDBD00BDBDBD000063
      080000730800007B0800006B0800005200000000000000000000000000005A5A
      5A00A5A5A5005A5A5A005A5A5A0052737B00297B9C00D67318008C5A52008C8C
      8C0084848400ADADAD0000000000000000000000000000000000000000005A5A
      5A00A5A5A5005A5A5A005A5A5A008C8C8C00A5A5A500BDBDBD00BDBDBD008C8C
      8C00005A000031C65A00086B0800000000000000000000000000000000005A5A
      5A00A5A5A5005A5A5A005A5A5A00CEADA500E7DEBD00FFFFD600FFFFD600B59C
      8C00A5948C0052BDFF0000000000000000000000000000000000000000006B6B
      6300E7DED60063635A00635A63008C948C00A5A5A500005A0000006B08000084
      0800005A0000B5B5B50000000000000000000000000000000000000000006B6B
      6300E7DED60063635A00635A63008C948C00847B7B00FFC68400FFB563008C5A
      52008C8C8C00B5B5B50000000000000000000000000000000000000000006B6B
      6300E7DED60063635A00635A63008C948C00A5A5A500CECECE00D6D6D6001894
      310042E77B0029C65200109C2100005A00000000000000000000000000006B6B
      6300E7DED60063635A00635A6300FFFFFF00FFFFF700FFFFDE00FFFFD600F7D6
      A500F7DEB500B5B5B50000000000000000000000000000000000000000006B73
      7300D6D6D6005A635A0063636B008C8C8C00A5A5A500005A000000840800006B
      0800ADADAD00B5B5B50000000000000000000000000000000000000000006B73
      7300D6D6D6005A635A0063636B008C8C8C00A5A5A500FFD6AD00FFC68400D673
      18008C5A5200B5B5B50000000000000000000000000000000000000000006B73
      7300D6D6D6005A635A0063636B008C8C8C00A5A5A500CECECE00005A0000189C
      310021AD420021B5420018AD3100109C21000000000000000000000000006B73
      7300D6D6D6005A635A00C69C9400FFFFEF00FFFFF700FFFFE700FFFFDE00F7CE
      9400FFE7AD00B5B5B50000000000000000000000000000000000000000006B63
      6300CECECE00525263005A5A5A005A5A5A005A5A5A00005A000010A52100005A
      00009C9C9C00B5B5B50000000000000000000000000000000000000000006B63
      6300CECECE00525263005A5A5A005A5A5A005A5A5A006B6B6B00AD7B7300FFC6
      8400FFB563008C5A520000000000000000000000000000000000000000006B63
      6300CECECE00525263005A5A5A005A5A5A005A5A5A006B6B6B00848484009494
      9400005A000010A52100005A0000000000000000000000000000000000006B63
      6300CECECE0052526300C6A59C00FFFFDE00FFFFDE00FFFFDE00FFEFC600EFBD
      8400FFE7B500B5B5B50000000000000000000000000000000000000000006B63
      6300A5A5A5005A63520063636300005A0000005A0000005A000018AD3100005A
      0000005A0000005A000000000000000000000000000000000000000000006B63
      6300A5A5A5005A635200636363008C8C8C00A5A5A500C6C6C600CECECE00FFCE
      9400BD8484004ABDFF000863A500000000000000000000000000000000006B63
      6300A5A5A5005A635200636363008C8C8C00A5A5A500C6C6C600CECECE009C9C
      9C00005A000000941000005A0000000000000000000000000000000000006B63
      6300A5A5A5005A63520063636300FFFFD600FFF7D600F7E7B500F7CE9C00FFEF
      C600FFEFC600ADADAD0000000000000000000000000000000000000000006B63
      6300E7DED6005A635A0063635A00848C8C00005A0000109C210029C6520042E7
      7B0018943100ADADAD0000000000000000000000000000000000000000006B63
      6300E7DED6005A635A0063635A00848C8C009C9C9C00C6C6C600CECECE00ADAD
      AD004ABDFF000831CE001029D6000018C6000000000000000000000000006B63
      6300E7DED6005A635A0063635A00848C8C009C9C9C00C6C6C600CECECE00005A
      000000840800006B0800005A0000000000000000000000000000000000006B63
      6300E7DED6005A635A0063635A00CEAD9C00F7DEB500FFE7AD00FFEFC600D6BD
      BD00A5A5A500ADADAD0000000000000000000000000000000000000000006B63
      6300E7DED6005A5A630063635A00848C8C009C9C9C0021AD420042DE7300189C
      310000520000ADADAD0000000000000000000000000000000000000000006B63
      6300E7DED6005A5A630063635A00848C8C009C9C9C00C6C6C600CECECE00ADAD
      AD00A5A5A5006B8CFF00106BFF00000000000000000000000000000000006B63
      6300E7DED6005A5A630063635A00848C8C009C9C9C00C6C6C600CECECE000084
      0800009410000052000000000000000000000000000000000000000000006B63
      6300E7DED6005A5A630063635A00848C8C009C9C9C00DEBDA500CEAD9C00ADAD
      AD00A5A5A500ADADAD0000000000000000000000000000000000000000006363
      6B00A5A5A5005A52630052525200635A6300636363006B6B6B00086B08008484
      840084848400ADADAD0000000000000000000000000000000000000000006363
      6B00A5A5A5005A52630052525200635A6300636363006B6B6B007B7B7B008484
      840084848400ADADAD0000000000000000000000000000000000000000006363
      6B00A5A5A5005A52630052525200635A630063636300005A0000005A00000052
      000084848400ADADAD0000000000000000000000000000000000000000006363
      6B00A5A5A5005A52630052525200635A6300636363006B6B6B007B7B7B008484
      840084848400ADADAD0000000000000000000000000000000000000000006B73
      6B00ADADB500949494009CA59400ADADAD00A5A5A500ADADAD00ADADAD009C9C
      9C008C8C8C009C9C9C0000000000000000000000000000000000000000006B73
      6B00ADADB500949494009CA59400ADADAD00A5A5A500ADADAD00ADADAD009C9C
      9C008C8C8C009C9C9C0000000000000000000000000000000000000000006B73
      6B00ADADB500949494009CA59400ADADAD00A5A5A500ADADAD00ADADAD009C9C
      9C008C8C8C009C9C9C0000000000000000000000000000000000000000006B73
      6B00ADADB500949494009CA59400ADADAD00A5A5A500ADADAD00ADADAD009C9C
      9C008C8C8C009C9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484006B6B6B00636363005A5A5A005A5A5A006B6B6B007B7B7B00A5A5
      A500848484000000000000000000000000000000000000000000000000000000
      0000848484006B6B6B00636363005A5A5A005A5A5A006B6B6B007B7B7B00A5A5
      A500848484000000000000000000000000000000000000000000000000000000
      0000848484006B6B6B00636363005A5A5A005A5A5A006B6B6B007B7B7B00A5A5
      A500848484000000000000000000000000000000000000000000000000000000
      0000848484006B6B6B00636363005A5A5A005A5A5A006B6B6B007B7B7B00A5A5
      A500848484000000000000000000000000000000000000000000000000006363
      63009C9C9C005A5A5A00636363008C8C8C00ADADAD00BDBDBD00BDBDBD008C8C
      8C00848484008484840000000000000000000000000000000000000000006363
      63009C9C9C005A5A5A00636363008C8C8C00ADADAD00BDBDBD00BDBDBD008C8C
      8C00848484008484840000000000000000000000000000000000000000006363
      63009C9C9C005A5A5A00636363008C8C8C00ADADAD00BDBDBD00BDBDBD008C8C
      8C00848484008484840000000000000000000000000000000000000000006363
      63009C9C9C005A5A5A00636363008C8C8C00ADADAD00BDBDBD00BDBDBD008C8C
      8C00848484008484840000000000000000000000000000000000000000006B6B
      6B00DEDEDE00636363006363630094949400A5A5A500CECECE00D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6B00DEDEDE00636363006363630094949400A5A5A500CECECE00D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6B00DEDEDE00636363006363630094949400A5A5A500CECECE00D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6B00DEDEDE00636363006363630094949400A5A5A500CECECE00D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6B00D6D6D60063636300636363008C8C8C00A5A5A500C6C6C600D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6B00D6D6D60063636300636363008C8C8C00A5A5A500C6C6C600D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6B00D6D6D60063636300636363008C8C8C00A5A5A500C6C6C600D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6B00D6D6D60063636300636363008C8C8C00A5A5A500C6C6C600D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6B00C6C6C6005A5A5A00525252005A5A5A005A5A5A006B6B6B007B7B7B009494
      94009C9C9C00B5B5B50000000000000000000000000000000000000000006B6B
      6B00C6C6C6005A5A5A00525252005A5A5A005A5A5A006B6B6B007B7B7B009494
      94009C9C9C00B5B5B50000000000000000000000000000000000000000006B6B
      6B00C6C6C6005A5A5A00525252005A5A5A005A5A5A006BAD8400218429006BAD
      84009C9C9C00B5B5B50000000000000000000000000000000000000000006B6B
      6B00C6C6C6005A5A5A00525252005A5A5A005A5A5A006B6B6B007B7B7B009494
      94009C9C9C00B5B5B50000000000000000000000000000000000000000005A5A
      5A00A5A5A5005A5A5A005A5A5A008C8C8C00A5A5A500BDBDBD00BDBDBD008C8C
      8C0084848400ADADAD0000000000000000000000000000000000000000005A5A
      5A00A5A5A5005A5A5A005A5A5A008C8C8C00A5A5A500BDBDBD00BDBDBD008C8C
      8C0084848400ADADAD0000000000000000000000000000000000000000005A5A
      5A00A5A5A5005A5A5A005A5A5A008C8C8C00A5A5A50063A5630094DE8C002184
      290084848400ADADAD0000000000000000000000000000000000000000005A5A
      5A00A5A5A5005A5A5A005A5A5A008C8C8C00A5A5A500BDBDBD00BDBDBD008C8C
      8C0084848400ADADAD0000000000000000000000000000000000000000006B6B
      6300E7DED60063635A00635A63008C948C00A5A5A500CECECE00D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6300E7DED60063635A00635A63008C948C00A5A5A500CECECE00D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6300E7DED60063635A00635A63008C948C00A5A5A50063A5630094DE8C002184
      2900ADADAD00B5B5B50000000000000000000000000000000000000000006B6B
      6300E7DED60063635A00635A63008C948C00A5A5A500CECECE00D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B73
      7300D6D6D6005A635A0063636B008C8C8C00A5A5A500CECECE00D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000000000006B73
      7300D6D6D6005A635A0063636B000021A5000021A5000021A5000021A5000021
      A5000021A5000021A5000021A5006B84C6000000000000000000000000006B73
      7300D6D6D6005A635A0063636B008C8C8C00A5A5A50063A5630094DE8C002184
      2900ADADAD00B5B5B50000000000000000000000000000000000000000006B73
      7300D6D6D6005A635A0063636B008C8C8C00A5A5A500CECECE00D6D6D6009CB5
      FF004A73FF00B5B5B50000000000000000000000000000000000000000006B63
      6300CECECE00525263005A5A5A005A5A5A005A5A5A006B6B6B00848484009494
      94009C9C9C00B5B5B50000000000000000000000000000000000000000006B63
      6300CECECE00525263005A5A5A00B5C6FF009CBDFF009CB5FF009CB5FF00638C
      F700638CF700638CF700526BF7000021A5000000000000000000000000006B63
      6300CECECE005252630063A5630039B5520039B5520039B5520039B5520039B5
      520039B5520039B5520039B55200000000000000000000000000000000006B63
      6300CECECE00525263005A5A5A005A5A5A005A5A5A002142EF002142EF002142
      EF000031FF005A7BF7001042FF00000000000000000000000000000000006B63
      6300A5A5A5005A635200636363008C8C8C00A5A5A500C6C6C600CECECE009C9C
      9C008C8C8C00ADADAD0000000000000000000000000000000000000000006B63
      6300A5A5A5005A635200636363000021A5000021A5000021A5000021A5000021
      A5000021A5000021A5000021A5006B84C6000000000000000000000000006B63
      6300A5A5A5005A63520063A5630094DE8C0094DE8C0094DE8C0094DE8C0094DE
      8C0094DE8C0094DE8C0094DE8C00000000000000000000000000000000006B63
      6300A5A5A5005A635200636363008C8C8C00A5A5A5009CB5FF000031FF00295A
      DE000052FF000031FF009CB5FF00000000000000000000000000000000006B63
      6300E7DED6005A635A0063635A00848C8C009C9C9C00C6C6C600CECECE00ADAD
      AD00A5A5A500ADADAD0000000000000000000000000000000000000000006B63
      6300E7DED6005A635A0063635A00848C8C009C9C9C00C6C6C600CECECE00ADAD
      AD00A5A5A500ADADAD0000000000000000000000000000000000000000006B63
      6300E7DED6005A635A0063635A00848C8C009C9C9C0063A5630094DE8C002184
      2900A5A5A500ADADAD0000000000000000000000000000000000000000006B63
      6300E7DED6005A635A0063635A00848C8C004A73FF000031FF000039FF009CEF
      FF00D6F7FF000052FF000031FF004A73FF000000000000000000000000006B63
      6300E7DED6005A5A630063635A00848C8C009C9C9C00C6C6C600CECECE00ADAD
      AD00A5A5A500ADADAD0000000000000000000000000000000000000000006B63
      6300E7DED6005A5A630063635A00848C8C009C9C9C00C6C6C600CECECE00ADAD
      AD00A5A5A500ADADAD0000000000000000000000000000000000000000006B63
      6300E7DED6005A5A630063635A00848C8C009C9C9C0063A5630094DE8C002184
      2900A5A5A500ADADAD0000000000000000000000000000000000000000006B63
      6300E7DED6005A5A630063635A00848C8C009CB5FF007384E7005273EF006BE7
      FF008CEFFF00397BFF00738CF7009CB5FF000000000000000000000000006363
      6B00A5A5A5005A52630052525200635A6300636363006B6B6B007B7B7B008484
      840084848400ADADAD0000000000000000000000000000000000000000006363
      6B00A5A5A5005A52630052525200635A6300636363006B6B6B007B7B7B008484
      840084848400ADADAD0000000000000000000000000000000000000000006363
      6B00A5A5A5005A52630052525200635A63006363630063A5630094DE8C002184
      290084848400ADADAD0000000000000000000000000000000000000000006363
      6B00A5A5A5005A52630052525200635A630063636300738CFF000031FF00638C
      FF000039FF000031FF00315AFF00000000000000000000000000000000006B73
      6B00ADADB500949494009CA59400ADADAD00A5A5A500ADADAD00ADADAD009C9C
      9C008C8C8C009C9C9C0000000000000000000000000000000000000000006B73
      6B00ADADB500949494009CA59400ADADAD00A5A5A500ADADAD00ADADAD009C9C
      9C008C8C8C009C9C9C0000000000000000000000000000000000000000006B73
      6B00ADADB500949494009CA59400ADADAD00A5A5A5006BAD840063A563006BAD
      84008C8C8C009C9C9C0000000000000000000000000000000000000000006B73
      6B00ADADB500949494009CA59400ADADAD00A5A5A5007B9CFF006B8CFF007B9C
      FF000031FF009CB5FF004A73FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009CB5
      FF004A73FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B73
      7B0042638C006394CE00528CBD00295A7B00424A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B737B005A94
      C6006394CE006394CE00528CBD00316B9400295A7B0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6B5AD00F7EFE700F7E7
      CE00F7E7CE00F7E7CE000018D600F7DEBD00F7DEBD00F7DEBD00F7DEBD00F7DE
      BD00F7D6AD00F7D6AD000018D60000000000000000006394CE006394CE00528C
      BD00316B94006B9CD600528CBD00316B9400316B9400295A7B00394A4A000000
      00000000000000000000000000000000000000000000D6B5AD00F7EFE700F7E7
      CE00F7E7CE00F7E7CE00F7E7CE00F7DEBD00F7DEBD00F7DEBD00F7DEBD00F7DE
      BD00F7D6AD00F7D6AD00D6B5AD000000000000000000D6B5AD00F7EFE700F7E7
      CE00F7E7CE00F7E7CE00F7E7CE00F7DEBD00F7DEBD00F7DEBD00F7DEBD00F7DE
      BD00F7D6AD00F7D6AD00D6B5AD000000000000000000FFF7F700FFF7F700F7EF
      E700F7E7CE00F7E7CE000018D6000018D600F7E7CE00F7DEBD00F7DEBD00F7DE
      BD00F7DEBD000018D6000018D60000000000000000006394CE0021528400316B
      940008396B006394CE00528CBD006B9CCE00316B9400316B9400295A7B008484
      84000000000000000000000000000000000000000000FFF7F700FFF7F700F7EF
      E700F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7DEBD00F7DEBD00F7DE
      BD00F7DEBD00F7D6AD00F7D6AD000000000000000000FFF7F700FFF7F700F7EF
      E700F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7DEBD00F7DEBD00F7DE
      BD00F7DEBD00F7D6AD00F7D6AD000000000000000000FFF7F700E7E7E700A5A5
      A500A5A5A500A5A5A500A5A5A5000018D6000018D600A5A5A500A5A5A5008484
      84000018D60084848400F7D6AD0000000000000000006394CE0021528400639C
      D6007BADE7009CB5D600B5B5BD00847B8400A5B5C600316B9400316B9400295A
      7B00394A4A0000000000000000000000000000000000FFF7F700E7E7E700A5A5
      A500A5A5A5008484840084848400F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7
      CE00F7DEBD00F7D6AD00F7D6AD000000000000000000FFF7F700FFF7EF00F7EF
      E700F7EFE700F7EFE700F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7
      CE00F7DEBD00F7D6AD00F7D6AD000000000000000000FFF7F700FFF7EF00FFF7
      EF00F7EFE700F7EFE700F7EFE700F7E7CE000018D6000018D600F7E7CE000018
      D6000018D600F7DEBD00F7DEBD0000000000000000006394CE00639CD6008CBD
      EF009CB5D600CEC6CE00D6CED600948C9400B5B5B500528CB500316B9400316B
      9400295A7B0084848400000000000000000000000000FFF7F700FFF7EF00FFF7
      EF00F7EFE700F7EFE70029292900B5B5B500F7E7CE00F7E7CE00F7E7CE00F7E7
      CE00F7E7CE00F7DEBD00F7DEBD000000000000000000FFF7F700FFF7EF00FFF7
      EF00F7EFE700F7EFE700F7EFE700F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7
      CE00F7E7CE00F7DEBD00F7DEBD000000000000000000FFF7F700FFFFFF00FFFF
      FF00FFF7EF00FFF7EF00FFF7EF00F7EFE700F7EFE7000018E7000018E700F7E7
      CE00F7E7CE00F7E7CE00F7DEBD0000000000000000004A7BB500949CA500E7E7
      E700E7E7E700EFEFEF00DED6DE00B5ADB500BDBDBD008C848C00ADBDC600316B
      9400316B9400295A7B00424A4A000000000000000000FFF7F700FFFFFF00FFFF
      FF00FFF7EF00FFF7EF00D6D6D600428CDE0018526B00D6D6D600F7E7CE00F7E7
      CE00F7E7CE00F7E7CE00F7DEBD000000000000000000FFF7F700FFFFFF00FFFF
      FF00FFF7EF00FFF7EF00FFF7EF00F7EFE700F7EFE700F7EFE700F7E7CE00F7E7
      CE00F7E7CE00F7E7CE00F7DEBD000000000000000000FFF7F700E7E7E700A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5000018EF000018E7000018
      F7008484840084848400F7DEBD0000000000000000003963940094949C00EFEF
      EF00E7EFEF00ADADAD008C8C8C00DED6DE00B5ADB50094949400C6BDC600528C
      B500316B9400316B9400214252000000000000000000FFF7F700E7E7E700A5A5
      A500A5A5A500A5A5A500A5A5A500297B9C008C7B7B008C5A5200848484008484
      84008484840084848400F7DEBD000000000000000000FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFF7EF00FFF7EF00FFF7EF00F7EFE700F7EFE700F7EFE700F7E7
      CE00F7E7CE00F7E7CE00F7DEBD000000000000000000FFF7F700E7E7E700A5A5
      A500A5A5A500A5A5A500A5A5A5000018FF000018EF00A5A5A500A5A5A5008484
      84000018FF0084848400F7E7CE00000000000000000000000000527B520039A5
      5A0029733100CE8CCE0094849400D6CED600D6CED600B5ADB500C6C6C6008484
      8400B5BDCE00316B9400214252000000000000000000FFF7F700E7E7E700A5A5
      A500A5A5A500A5A5A500A5A5A500847B7B00FFCE9400FFB56300D67318008484
      84008484840084848400F7E7CE000000000000000000FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFF7EF00F7EF
      E700F7EFE700F7EFE700F7E7CE000000000000000000FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000018F7000018FF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF000018F700F7EFE700000000000000000000000000396B3900525A
      5200AD6BAD009C319C00947B8C00BDB5BD009C949C00DED6DE00BDBDBD009494
      9400CECECE004A84AD00214252000000000000000000FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD7B7300FFC68400FFB563008C5A
      5200D6D6D600F7EFE700F7EFE7000000000000000000FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00F7EFE700F7EFE7000000000000000000EF8C3900EF8C3900EF8C
      3900EF8C39000018F7000018F700EF8C3900EF8C3900EF8C3900EF8C3900EF8C
      3900EF8C3900EF8C3900EF8C390000000000000000000000000000000000734A
      73007B394200F7944200D64A310073E7E70084A5A500CEC6CE00DED6DE00A5A5
      A500D6CED6004A6B8C00848C94000000000000000000EF8C3900EF8C3900EF8C
      3900EF8C3900EF8C3900EF8C3900EF8C3900EF8C3900AD7B7300FFD6AD00FFB5
      6300D6731800CE847B00EF8C39000000000000000000EF8C3900EF8C3900EF8C
      3900EF8C3900EF8C3900EF8C3900EF8C3900EF8C3900EF8C3900EF8C3900EF8C
      3900EF8C3900EF8C3900EF8C39000000000000000000EFC68C00FFA53900FFA5
      3900FFA539000018F7000018F700FFA53900FFA53900FFA53900FFA53900FFA5
      3900FFA53900FFA53900FFA53900000000000000000000000000000000000000
      00009C4A4A00945A63005AC6CE005ADEF7007B949C00C6BDC60094949400DED6
      DE00CEC6CE0000000000000000000000000000000000EFC68C00FFA53900FFA5
      3900FFA53900FFA53900FFA53900FFA53900FFA53900FFA53900AD7B7300BD84
      8400299CEF000863A500CE847B000000000000000000EFC68C00FFA53900FFA5
      3900FFA53900FFA53900FFA53900FFA53900FFA53900FFA53900FFA53900FFA5
      3900FFA53900FFA53900FFA539000000000000000000EFC68C00EFC68C00EFB5
      7300EFB57300FFB55200A56B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000738494004A6352004ABD730029943900C694C600A58CA5000000
      00000000000000000000000000000000000000000000EFC68C00EFC68C00EFB5
      7300EFB57300FFB55200A56B6B00000000000000000000000000000000004ABD
      FF00299CEF001029D6000010AD000000000000000000EFC68C00EFC68C00EFB5
      7300EFB57300FFB55200A56B6B00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6B5AD00D6B5AD00D6B5
      AD00D6B5AD00D6B5AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005A7B5A004A6B4A00A57BA500AD42AD008C638C000000
      00000000000000000000000000000000000000000000D6B5AD00D6B5AD00D6B5
      AD00D6B5AD00D6B5AD0000000000000000000000000000000000000000000000
      00000018C600106BFF000018C6000000000000000000D6B5AD00D6B5AD00D6B5
      AD00D6B5AD00D6B5AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF00000084000000840000000000000000000000000000000000
      0000000000000000000000000000002100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000084000000
      000084848400000084000000840000008400000000000000000084000000FF00
      0000FF000000FFFF0000FF000000840000000000000000000000000000000000
      0000000000000000000000210000008C0000008C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000000000000000000000008400C6C6C600C6C6
      C6000084840000000000C6C6C600C6C6C600000000000000840084848400FF00
      0000FFFF0000FFFF0000FFFF0000FF0000000000000000000000000000000000
      0000000000000000000000BD0000008C00000000FF0000210000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000063636300DEDEDE0084848400000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000008400C6C6C600C6C6C60000848400C6C6C600FFFFFF00C6C6
      C600FFFF0000FFFF0000FFFF0000FF0000000000000000000000000000000000
      0000000000000000000000BD0000008C0000FFFFFF0000210000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000063636300DEDEDE00DEDEDE00734A0000DEDEDE00636363000000
      00000000000000000000000000000000000000008400C6C6C600C6C6C6000084
      840000000000008484000000840000848400C6C6C60000848400C6C6C600C6C6
      C600FF000000FFFF0000FF000000848400000000000000000000000000000000
      000000000000000000000000FF00008C0000008C000000210000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00848484000000
      0000000000000000000000000000000000000000840000000000000000008484
      8400848484000000000084848400FFFFFF00FFFFFF0000848400000000000000
      0000848400008484000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00008C0000008C000000210000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600000000000000000000000000000000006363630039393900DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE006363
      63000000000000000000000000000000000000000000C6C6C600C6C6C6008484
      8400C6C6C60000008400FFFFFF00FFFFFF00FFFFFF0000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000BD0000008C00000000FF0000210000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039393900393939001818
      1800DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE008484
      84000000000000000000000000000000000000008400C6C6C60000848400C6C6
      C6000000000000008400FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000210000008C0000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000393939003939
      3900DEDEDE00DEDEDE00DEDEDE00734A0000DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00636363000000000000000000000000000000000000008400C6C6C600C6C6
      C6000000000000848400FFFFFF00FFFFFF008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000002100000000FF00008C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      FF000000FF000000000000000000000000000000000000000000393939003939
      390018181800DEDEDE00DEDEDE00DEDEDE00DEDEDE00734A0000DEDEDE00DEDE
      DE00848484000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000848400000000000000000000000000C6C6
      C6000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000210000FFFFFF00008C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF0000000000000000000000FF00000000000000
      FF00000000000000000000000000000000000000000000000000848484003939
      390039393900DEDEDE00DEDEDE00734A0000B5B5B500B5B5B500734A0000DEDE
      DE00DEDEDE006363630000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      84000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000000021000000BD0000008C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      FF0000000000000000000000000000000000000000000000000000000000DEDE
      DE003939390018181800DEDEDE00DEDEDE00734A0000DEDEDE00DEDEDE00DEDE
      DE00DEDEDE008484840000000000000000000000000000000000000000000000
      00000000000000848400008484000000000000000000C6C6C6000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000021000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000009C9C
      9C003939390039393900DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE0063636300000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C6000000000000000000C6C6C600C6C6C600C6C6
      C6000000FF0000008400C6C6C600000000000000000000000000000000000000
      0000000000000021000000BD0000FFFFFF00002100000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000393939003939390018181800DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00636363000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C60000848400000000000000000000000000C6C6
      C6000000FF000000000000000000000000000000000000000000000000000000
      00000021000000BD000000210000002100000000000000210000008C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000FF0000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000003939390039393900DEDEDE00DEDEDE00DEDEDE00636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000008400FFFFFF00FFFFFF00000000000000000000000000C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000002100000021000000210000002100000021000000210000008C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000FF00000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000003939390039393900181818006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000210000008C000000BD000000BD000000BD00000000FF0000BD00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFEFFF00E7CEE700DECEDE00EFD6FF00FFEFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD846B00944A210094422100A54A21009C4A21009C4A21009C5231000000
      000000000000000000000000000000000000000000000000000000000000F7DE
      FF00C6B5D600BDB5CE00D6BDD600DEC6DE00DECEDE00DECEDE00E7CEE700F7DE
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000002121001094A5000894A5000894A5000094A50000949C00086B6B003942
      420000000000000000000000000000000000000000000000000000000000A552
      2900A54A21009C4A210094422100944221009442210094422100944221009442
      2100AD6B4A000000000000000000000000000000000000000000CEBDDE00BDA5
      BD00BDA5BD00BDA5BD00DEA59400EF946B00EFA58400CEB5C600DECEDE00DECE
      EF00F7DEFF00FFF7FF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00D6FFFF00D6FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000089C
      9C000094A50010424A000000080000000000000010000094A5001094A5000094
      A500105A5A001010100000000000000000000000000000000000BD5A3100BD5A
      2900B5522100B5522100B5522100BD522100B55221009C4A2100944221008C42
      210094422100AD6B4A00000000000000000000000000D6BDDE00A59CBD00A59C
      BD00FF9C6300FF944200FF730000FF730000C65A0000C6520000E7630000CEBD
      CE00EFD6EF00F7DEFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF00D6FFFF00D6FFFF00ADFFFF007B7B7B00000000000000
      000000000000000000000000000000000000000000000029290000A5B50000A5
      B500009CB5000818180008000000000000000000000000949C000094A5000094
      A5000094A500107B8400101010000000000000000000D67B4A00D6632900CE63
      2900CE632900DE6B2900F7733900FF8C5200FF946300F7945A00D66B31009442
      210094422100944221000000000000000000EFDEFF009C849C009C8CA500FF9C
      5A00FF9C5200FF842900FF842100FF730000DE630000BD5200009C420000A54A
      0000CEBDCE00EFD6EF00FFE7FF00000000000000000000000000000000000000
      0000FFFFFF00D6FFFF00D6FFFF00ADFFFF00ADFFFF008CFFFF00000000000000
      0000000000000000000000000000000000000000000000ADB50000B5C60000B5
      BD0008ADB500000810000008180000101800001018000894A5000094A5000094
      A5000094A5000094A500214A52000000000000000000EF732900EF732900E76B
      2900E76B2900F7733100FF844200FF945A00FFA57300FFAD8C00FFAD8C00CE63
      310094422100944221009C52310000000000A59CBD00947B9400C68C7300FFAD
      6B00FFA56300FF9C5200FF842900FF730000E7630000DE630000BD5200009C42
      0000CE5A0000DECEDE00E7CEF700000000000000000000000000000000000000
      0000D6FFFF00D6FFFF00ADFFFF00ADFFFF008CFFFF0063FFFF007B7B7B000000
      000000000000000000000000000000000000187B840000BDCE0000BDCE0000BD
      CE0000B5C600219CA500188C9C00188C9C0010848C00009CAD000094A5000094
      A5000094A5000094A5000894A50029292900FFB59400FF733900EF732900E76B
      2900D6632900EF732900FF7B3900FF8C4A00FF9C6B00FFAD8400FFB59400FFA5
      7B00B5522100944221009442210000000000846384007B6B7B00FFB57B00FFB5
      8400FFA56300FF9C5200FF842900FF842100FF730000DE630000DE630000BD52
      0000AD4A0000BDB5CE00E7CEE700FFEFFF00000000000000000000000000D6FF
      FF00D6FFFF00ADFFFF00ADFFFF00424A42002121210063FFFF0063FFFF000000
      00000000000000000000000000000000000018BDCE0008C6DE0000C6D60000C6
      D60000BDCE0000000000000000000800000000000000089CAD0000A5B5000094
      A5000094A5000094A5000094A500314A4A00FF9C6300FF843900FF7B3900D663
      2900C65A2900DE6B2900F7733100FF844200FF8C5200FF9C6B00FFAD8400FFAD
      8400D66B31009C4A2100A54A210000000000735A7300735A7300FFBD8400FFBD
      8C00FFAD6B00FFA56300FF9C5200FF842900FF730000FF730000DE630000DE63
      0000C6520000CE948C00DECEDE00EFD6FF00000000000000000000000000D6FF
      FF00ADFFFF00ADFFFF008CFFFF00A5ADA500BDBDBD0063FFFF0042FFFF007B7B
      7B000000000000000000000000000000000000C6D60000D6E70000D6E70000D6
      E70000CEDE00081829000000000000000000080000000021290008ADB50000A5
      B500009CA5000094A5000094A50010636B00FF9C7300FF8C5200FF844200CE63
      2100B5522100D6632900EF732900FF7B3100FF844200FF945A00FF9C7300FFA5
      7B00DE734200AD522100AD522100000000006B526B006B526B00FFCEA500FFC6
      A500FFB58400FFA56300FFA55A00FF944200FF842900FF842100FF730000EF63
      0000E7630000D69C8C00DEC6DE00E7CEE7000000000000000000D6FFFF00ADFF
      FF00ADFFFF008CFFFF0063FFFF000000000063FFFF0042FFFF0042FFFF0021FF
      FF000000000000000000000000000000000000D6E70000D6E70000D6E70000D6
      E70008D6E70010A5B500000000000000000008000000000000000021210010AD
      AD0000A5B50000949C000894A500186B7300FFBD9C00FF946300FF945A00CE63
      2900A54A2100BD5A2900DE6B2900EF732900FF7B3900FF844200FF8C5200FF94
      5A00E76B3100BD5A2900BD5A290000000000634263005A425A00FFBD8400FFCE
      AD00FFBD8C00FFB57B00FFA56300FFA55A00FF9C5200FF842900FF842100FF73
      0000FF730000B5A5BD00D6BDD600EFD6FF000000000000000000ADFFFF00ADFF
      FF008CFFFF0063FFFF0063FFFF000000000042FFFF0042FFFF0021FFFF0021FF
      FF007B7B7B0000000000000000000000000000DEF70000DEEF0000D6EF0000D6
      F70008DEF70010E7F700109C9C00000000000000000000000000080000000018
      210000ADB50000A5A5000094A50029737B0000000000FFA57B00FF9C7300EF7B
      4200A54A2100AD4A2100C65A2900E76B2900EF732900F7733100FF7B3900FF7B
      3900DE6B2900CE632900CE63310000000000634263005A425A00E7845200FFCE
      AD00FFC6A500FFBD8C00FFB57B00FFA56300FFA55A00FF9C5200FF9C5200FF84
      2900FF842900BDADBD00CEBDD600FFEFFF0000000000ADFFFF00ADFFFF008CFF
      FF0063FFFF0063FFFF00BDBDBD0084848400BDBDBD0021FFFF0021FFFF0000FF
      FF0000FFFF0000000000000000000000000021E7F70000E7F70008DEF70021E7
      F7004AF7FF0042FFFF0021F7FF0018B5C6000008080000000000000000000800
      0000108C8C0000A5B5001094A5000000000000000000FFB59400FFAD8400FFA5
      7300DE6B3100AD4A2100B5522100CE632900D6632900E76B2900EF732900F773
      3100EF732900DE6B2900EFA58400000000009C94AD004229420052315200FFCE
      AD00FFCEAD00FFC6A500FFBD8C00FFB57B00FFA56300FFA56300FF9C5200FF9C
      5200C69CAD00BDA5BD00CEBDD60000000000000000008CFFFF008CFFFF0063FF
      FF0063FFFF0063FFFF00848484009C9C9C008484840021FFFF0000FFFF0000FF
      FF0000DEDE007B7B7B00000000000000000008737B0000E7F70021C6D6000808
      0800424242004A6B6B0039FFFF0010E7F70029ADBD0000000800000000000000
      000008848C0010A5C600089CA5000000000000000000FFEFEF00FFB58C00FFB5
      9400FFA57300EF7B4200C65A2100C65A2100D6632900EF733100F77B3100F773
      3100F7733100EF7B390000000000000000000000000052395200422942005A42
      5A00FFCEB500FFCEAD00FFCEAD00FFC6A500FFBD8C00FFAD6B00FFA56300D6A5
      9C00A59CBD00BDA5BD00EFD6FF00000000008CFFFF008CFFFF0063FFFF0063FF
      FF0063FFFF0042FFFF009C9C9C00A5ADA5009C9C9C0000FFFF0000FFFF0000FF
      FF0000B5B50000B5B50000000000000000000000000039EFFF0008EFFF000808
      1800101010002931310021636B0029B5BD001039390000000000000000000000
      000000B5BD0008ADB50000000000000000000000000000000000FFDED600FFBD
      A500FFBD9C00FFAD8C00FF9C7300FF8C5A00FF8C5200FF8C5200FF844200FF84
      3900FF84420000000000000000000000000000000000D6BDD600422942004229
      420052395200D68C6B00FFBD8400FFCEA500FFC69C00FFAD8C00A594AD00A58C
      A500A59CBD00CEB5D60000000000000000008CFFFF0063FFFF0063FFFF0063FF
      FF0042FFFF0042FFFF00BDBDBD00A5ADA500BDBDBD0000FFFF0000DEDE0000B5
      B50000B5B500009494007B7B7B0000000000000000000000000029EFFF0010E7
      F70008001000000000000800000000000000000000000800000000001000109C
      A50010B5BD00002929000000000000000000000000000000000000000000FFF7
      F700FFBDA500FFB59400FFB58C00FFA57B00FF9C7300FF9C6B00FF8C5A00FFA5
      7300000000000000000000000000000000000000000000000000D6BDD6005239
      52004A314A005A425A005A425A006B526B007B637B008C738C00947B9400A58C
      A500C6B5D60000000000000000000000000063FFFF0063FFFF0063FFFF0042FF
      FF0042FFFF0021FFFF0021FFFF0000FFFF0000FFFF0000DEDE0000B5B50000B5
      B5000094940000736B007B7B7B000000000000000000000000000000000018B5
      BD0010EFFF0010B5C6000842520000181800002929000884940008CEDE0018BD
      CE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCEBD00FFBD9C00FFBD9C00FFCEBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C8CAD0063426300634263006B526B007B637B008C738C00A594B500EFD6
      FF000000000000000000000000000000000063FFFF0063FFFF0042FFFF0042FF
      FF0021FFFF0021FFFF0000FFFF0000FFFF0000FFFF0000B5B50000B5B5000094
      940000736B00004A4A0000000000000000000000000000000000000000000000
      0000000000000873730018E7EF0010E7EF0010CEE70000636B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400848484008484840000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF000084840000848400000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000848400008484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000084840000000000000000000000000000000000000000000000
      000000000000000000000000FF00C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000848484008484840000000000000000008484
      840084848400848484000000000000000000FF000000FF0000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000FF00000000000000848484000000000000000000008484000084
      84000084840000848400008484000084840000FFFF0000FFFF0000FFFF000084
      840000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000FF00C6C6C6000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6008484
      840084848400848484000000000000FFFF0000FFFF0000000000C6C6C6008484
      84008484840084848400C6C6C60000000000FF000000FF0000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000848484000000000000848400008484000084
      84000084840000848400008484000084840000FFFF0000FFFF000084840000FF
      FF0000FFFF000084840000FFFF00000000000000000000000000000000000000
      0000000000000000000000008400C6C6C6000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6008484
      840084848400848484008484840000FFFF0000FFFF0084848400848484008484
      84000084840000848400C6C6C60000000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FF000000000000008484840000848400000000000000000000FF
      FF0000FFFF0000FFFF00008484000084840000FFFF0000FFFF000084840000FF
      FF00000000000084840000FFFF00000000000000000000000000000000000000
      0000000000000000FF0000000000C6C6C60000000000C6C6C600000000000000
      00000000000000000000000000000000000000000000848484008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00C6C6C6000000000000000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FF00000000000000848484000084840000848400008484000084
      84000084840000848400008484000084840000FFFF00008484000084840000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000FF0000008400C6C6C600000000000000FF00000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840000FFFF0000FFFF00C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FF
      FF008484840084848400C6C6C60000000000FF000000FF0000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000FF00000000000000848484000000000000000000008484000084
      840000000000000000000000000000000000000000000084840000FFFF000084
      84000084840000FFFF0000000000000000000000000000000000000000000000
      000000000000000084000000FF00C6C6C600000000000000FF00000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840000FFFF0000FFFF00C6C6C600848484000084840000FFFF0000FFFF0000FF
      FF0084848400848484008484840000000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FF0000000000000084848400000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084840000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000FF00C6C6C6000000000000008400C6C6C6000000
      000000000000000000000000000000000000C6C6C600C6C6C60000FFFF0000FF
      FF0000FFFF00C6C6C60000FFFF0000FFFF00008484000084840000FFFF0000FF
      FF000084840000FFFF00C6C6C60000000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FF00000000000000848484000000000000000000000000000000
      000000FFFF00C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000000000000000C6C6C60000000000000084000000FF000000
      0000000000000000000000000000000000000000000000000000C6C6C6000084
      840000FFFF0000FFFF0000FFFF0000FFFF00008484000084840000FFFF000084
      840000848400000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF0000000000000084848400000000000000000000848400C6C6
      C6000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000008400C6C6
      C600000000000000000000000000000000000000000000000000C6C6C60000FF
      FF0000FFFF00C6C6C60000FFFF0000FFFF00008484000084840000FFFF0000FF
      FF0000848400848484000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000848484000000000000000000000000000084
      840000848400FFFFFF00FFFFFF00FFFFFF000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      84000000000000008400C6C6C600C6C6C600C6C6C60000000000000000000000
      840000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C60000FFFF0000FFFF000084840000848400C6C6C600C6C6
      C60000FFFF00C6C6C6000000000000000000FF000000FF000000000000000000
      0000FF000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FF000000FF00
      0000FF000000FF00000000000000848484000000000000000000000000000000
      0000008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      840000008400C6C6C600000000000000000000000000C6C6C600000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C6000084840000848400000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000C6C6C600C6C6C600C6C6C600C6C6C600FF000000C6C6C600C6C6C600FF00
      0000FF000000FF00000000000000848484000000000000000000000000000000
      00000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008484000084
      8400000000000000000000000000000000000000000000000000000084000000
      8400C6C6C6000000840000000000000000000000000000008400C6C6C6000000
      00000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C60084848400000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000C6C6C600C6C6C600C6C6C600C6C6C600FF000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000008400C6C6
      C6000000840000000000000000000000FF000000FF000000840000008400C6C6
      C600000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600FF000000FF00
      0000C6C6C600C6C6C600C6C6C600C6C6C600FF000000C6C6C600C6C6C600FF00
      0000FF000000FF00000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      84000000000000000000000000000000FF000000FF000000FF00000084000000
      8400C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000FFFF0000FFFF00000000000000000000FFFF0000FF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000008484840084848400FFFFFF00FFFFFF0084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000000000000000000000000000FF
      FF00000000000000000000000000C6C6C6000000000000000000000000008484
      840000000000C6C6C600FFFFFF00FFFFFF00FFFFFF0000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF00000000000000
      0000FFFFFF00FFFFFF0000000000C6C6C6000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00848484008484840000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000FFFF000000000000FFFF0000FFFF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      00000000000000000000FFFFFF0000000000C6C6C6000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000000000008400C6C6C600000000000000
      0000FFFFFF00FFFFFF0000000000C6C6C60084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6008484840084848400FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00C6C6C600FF00FF0000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      000000000000FFFFFF0000000000C6C6C6000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000008400C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000FFFFFF0000000000C6C6C6000000000000000000C6C6C600FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FF00
      0000FF000000FFFFFF00FFFFFF000000000000008400C6C6C600FF000000FF00
      0000FFFFFF00FFFFFF0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FFFF
      FF0000000000C6C6C6000000000000000000C6C6C600FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FF000000FFFFFF00FFFFFF000000000000008400C6C6C600FF000000FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400FF00FF00FF00FF00FF00FF00FF00
      FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF000000
      0000C6C6C6000000000000000000C6C6C600FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FF000000FFFFFF00FFFFFF000000000000008400C6C6C600FF000000FF00
      0000FFFFFF00FFFFFF0000000000C6C6C600C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FF00FF00FF00FF00FF00FF000000
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FF00
      0000FF000000FFFFFF0000000000FFFFFF0000008400C6C6C600FF000000FF00
      0000FFFFFF00FFFFFF0000000000C6C6C60084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000FF00FF00FF00FF00FF00FF000000
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000FFFFFF00C6C6C600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C6000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FF00FF00FF00FF0000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000C6C6C6000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C60000000000000000000000000000000000FF00FF000000FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600FFFFFF00FFFFFF00FFFFFF0084848400848484000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B636300211008008484
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084847B0008081800A5525200C6423900C6423900A5A5
      A500292929000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000FFFFFF00CEC6
      8C00C6ADAD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000009C8C
      9C00181818005A5A84005A7BBD005A7BBD007B7B9400C6423900C64239009C9C
      A5004A524A005A635A00524A5200000000000000000000000000000000000000
      0000CEFFFF0000000000CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00000000000000000052CE4A0029942900FFFFFF00C6AD
      AD00C6ADAD00000000009CAD84003131310084ADD60000423900000000006B7B
      94009C8452000000000084ADD600524273000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000084847B005A181800C642
      3900524A52005A7BBD005A7BBD005A7BBD005A7BBD006B73B500C6423900A5A5
      A500524A52005A635A001008080000000000000000000000000000000000CEFF
      FF0000000000B5DEF700B5DEF700000000000000000000000000000000000000
      0000000000000000000000000000000000009CAD840052845200C6ADAD000031
      420052313900000000009CAD8400213918003994EF0000423900000000006B73
      84009C8452000000000018211800000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600000000000000000000000000524A52005A313100C642
      3900524A52005A7BBD005A7BBD005A94CE005A7BBD005A7BBD006B73B500A5A5
      A5004A524A005A635A0010080800000000000000000000000000CEFFFF000000
      0000B5DEF700B5DEF700B5DEF700CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF000000000000000000000000005284520000000000FFFFFF00C6AD
      AD00A5949400000000009CAD8400313131003994EF003994EF00000000006363
      A5009C8452000000000084ADD6005242730000000000C6C6C600C6C6C600C6C6
      C600C6C6C600848484000000000000008400000084000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C6000000000000000000524A52005A181800C642
      39004A524A005A7BBD005A7BBD005A7BBD005A7BBD005A7BBD005A7BBD00A5A5
      A5005A635A006B63630000080000000000000000FF00B5DEF700B5DEF700CEFF
      FF00B5DEF700B5DEF700B5DEF700000000000000000000000000000000000000
      0000000000000000000000000000000000009CAD840052845200FFFFFF00CEBD
      B500948C8C00000000009CAD84002139180084ADD60018ADEF00000000001821
      18003931420000000000A5ADE700525252000000000000000000000000008484
      8400000000000000840000008400000084000000840000008400000084000000
      00008484840000000000000000000000000000000000524A52005A313100C642
      3900524A52005A7BBD005A7BBD005A7BBD005A94CE005A7BBD005A7BBD00A5A5
      A5005A635A00847B840000080000000000000000FF00B5DEF700B5DEF700CEFF
      FF00B5DEF700B5DEF700B5DEF700CEFFFF00CEFFFF0000000000CEFFFF00CEFF
      FF000000000000000000000000000000000052CE4A0029942900FFFFFF00C6AD
      AD00A5949400000000009CAD84003131310084ADD6004AADCE00000000000042
      3900182118000000000084ADD600524273000000000084848400000000000000
      8400000084000000840000008400000084000000840000008400000084000000
      840000008400000000008484840000000000000000004A524A005A181800C642
      3900524A52005A7BBD005A7BBD005A7BBD005A7BBD005A7BBD005A7BBD00A59C
      9C005A635A0084847B0000080000000000000000FF00B5DEF700B5DEF700CEFF
      FF00B5DEF700B5DEF700B5DEF700CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF000000000000000000000000009CAD840052845200FFFFFF00CEBD
      B500A5949400000000009CAD84002139180084ADD60084ADD600000000000042
      39000042390000000000A5ADE70039525A000000000000008400000084000000
      8400000084000000840000008400000084000000840000008400000084000000
      84000000840000008400000084000000000000000000524A52005A313100C642
      390031394A005A7BBD005A7BBD005A94CE005A7BBD005A7BBD00944A84009C9C
      A500736B6B009494940000080000000000000000FF00B5DEF700B5DEF700CEFF
      FF00B5DEF700B5DEF700B5DEF7000000000000000000CEFFFF00CEFFFF000000
      0000CEFFFF000000000000000000000000005284520000000000FFFFFF00C6AD
      AD00A5949400000000009CAD8400313131003994EF0084ADD600000000008C84
      84008C8C94000000000084ADD600524273000000000000000000000000000000
      0000000084000000840000008400000084000000840000008400000084000000
      84000000000000000000000000000000000000000000524A52005A313100A552
      52004A524A005A7BBD005A7BBD005A94CE005A7BBD005A7BBD00C6423900A5A5
      A500737373009C9C9C0000080000000000000000FF00B5DEF700B5DEF700CEFF
      FF00B5DEF700B5DEF700B5DEF700000000000000000000000000000000000000
      0000000000000000000000000000000000009CAD840052845200FFFFFF00CEBD
      B500948C8C000000000052313900000000003994EF0084ADD600000000000042
      39003931420000000000A5ADE700525252000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000084000000
      000000000000000000000000000000000000000000004A524A005A181800C642
      390031394A005A7BBD005A7BBD006B73B5005A7BBD00C6423900C64239009C9C
      A500737373009CA59C0000080000000000000000FF00B5DEF700B5DEF700CEFF
      FF00B5DEF700B5DEF700B5DEF70000000000CEFFFF0000000000000000000000
      0000CEFFFF0000000000000000000000000052CE4A00299429007B94AD000821
      420000525200000000009CAD8400313131000821420031427B00000000000000
      0000FFFFFF000000000084ADD600524273000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      000000000000000000000000000000000000000000004A524A0084292900C642
      390031394A005A7BBD005A7BBD005A94CE007B7B9400C6423900C6423900A5A5
      A500847B8400ADADAD0010080800000000000000FF00B5DEF700B5DEF700CEFF
      FF00B5DEF700B5DEF700B5DEF700CEFFFF0000000000CEFFFF00CEFFFF000000
      000000000000000000000000000000000000EFF7EF00FFFFFF006B84A5002121
      100039292900000000009CAD8400213918000821420008214200000000000000
      0000FFFFFF00FFFFFF00A5ADE70039525A000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      00000000000000000000000000000000000000000000524A52005A181800C642
      390031394A005A7BBD005A7BBD005A7BBD00C6423900A5525200DEBDA5009494
      940084847B00B5B5B50010080800000000000000FF00B5DEF700B5DEF700CEFF
      FF00B5DEF70000000000CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF0000000000000000000000000000000000000000005A7BB5000821
      42000052520000000000525252009C9CA500DEFFEF00EFFFEF00000000000000
      000000000000FFFFFF0018211800000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      00000000000000000000000000000000000000000000524A520084292900C642
      3900524A52005A94CE005A94CE00294A7300736B6B00737373005A635A00ADAD
      AD00A5ADAD00ADBDAD0010000000000000000000FF00B5DEF700B5DEF700CEFF
      FF00948473000000000094847300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6ADAD00000000000000000000000000EFFFEF00FFFFFF00525252000000
      000000000000FFFFFF00A5ADA500000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000524A5200E7BDA5005A18
      18001818180039393100524A52004A524A007373730094949400ADADAD009494
      9400736B6B0031394A0010000000000000000000FF00B5DEF700B5DEF700CEFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001029
      2100FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000A5ADE700FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6847B00D68C
      7300C6847B00A55252005A94CE0039529C0021294A0021294A004A524A00524A
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000008400
      0000FFFFFF00FFFFFF0084000000840000008400000084000000840000008400
      00008400000084000000FFFFFF00840000000000000000000000000000008400
      0000FFFFFF00FFFFFF0084000000840000008400000084000000840000008400
      00008400000084000000FFFFFF00840000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000008400
      0000FFFFFF00FFFFFF0084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000008400
      0000FFFFFF00FFFFFF0084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000008400
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000000000000000000008400
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF008400
      000084000000840000008400000084000000840000008400000084000000FFFF
      FF00840000000000000000000000000000000000000084000000FFFFFF008400
      000084000000840000008400000084000000840000008400000084000000FFFF
      FF00840000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084000000FFFFFF008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000FFFFFF008400000000000000000000000000000084000000840000008400
      00008400000084000000FFFFFF00840000008400000084000000840000008400
      0000FFFFFF008400000000000000000000000000000084000000840000008400
      00008400000084000000840000008400000084000000FFFFFF00840000000000
      0000000000000000000000000000000000000000000084000000840000008400
      00008400000084000000840000008400000084000000FFFFFF00840000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039396B0029298C001818
      AD001818AD001818AD001818A5001818A5001818A5001818A5001818A5001818
      A5001818A5001818A5001818A50029294A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000029299C002121B5002121C6001818
      FF001818FF001818FF001818FF001818FF001818FF001818FF001818FF001818
      FF001818FF001818FF001818F70018186B000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002121AD002121B5002121C6001818
      FF001818FF001818FF001818FF001818FF001818FF001818FF001818FF001818
      FF001818FF001818FF001818FF0018186B000000000084848400848484008484
      8400848484008484840000FFFF008484840000FFFF0084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      00000084840000848400C6C6C600000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002121AD002121B5002121C6001818
      FF001818FF001818FF001818FF001818FF001818FF001818FF001818FF001818
      FF001818FF001818FF001818FF0018186B0000000000FFFF0000FFFF0000FFFF
      0000FFFF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00848484008484
      8400FFFF0000FFFF0000C6C6C600848484000000000000000000000000000000
      00000000000000848400008484000000000000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002121AD002121B5002121CE001818
      FF001818FF001818FF001818FF001818FF001818FF001818FF001818FF001818
      FF001818FF001818FF001818FF001818730000000000FFFF0000FFFF0000FFFF
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      840084848400FFFF0000C6C6C600848484000000000000000000000000000084
      8400000000000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000084840000FFFF000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000002121B5002121BD002121CE001818
      FF001818FF001818FF001818FF001818FF001818FF001818FF001818FF001818
      FF001818FF001818FF001818FF001818730000000000FFFF0000FFFF000000FF
      FF0000FFFF00FFFF000000FFFF008484840000FFFF008484840000FFFF0000FF
      FF0084848400FFFF0000C6C6C600848484000000000000000000000000000084
      84000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000FFFF0000FFFF000000
      0000000000000000000000000000000000002121B5002121BD002121CE002121
      FF002121FF002121FF002121FF002121FF001818FF001818FF001818FF001818
      FF001818FF001818FF001818FF001818730000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000FFFF008484840000FFFF008484840000FFFF0000FF
      FF0084848400FFFF0000C6C6C600848484000000000000FFFF0000FFFF00C6C6
      C600008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000002121B5002121BD002121CE003131
      FF003939FF004242FF004242FF003131FF002121FF002121FF001818FF001818
      FF001818FF001818FF001818FF001818730000000000FFFF0000FFFF0000FFFF
      0000FF000000FFFF000000FFFF008484840000FFFF008484840000FFFF0000FF
      FF00848484008484840084848400848484000000000000FFFF0000FFFF0000FF
      FF0000848400C6C6C6000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000002121B5002121BD002929D6005A5A
      FF008C8CFF00A5A5FF009494FF006363FF003939FF002121FF001818FF001818
      FF001818FF001818FF001818FF0018187B0000000000FFFF000000FFFF00FFFF
      0000FFFF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      84008484840084848400C6C6C6008484840000000000000000000000000000FF
      FF0000FFFF0000FFFF00C6C6C6000084840000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000084
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000002121B5002121BD003131D600B5B5
      FF00F7F7FF00FFFFFF00FFFFFF00C6C6FF006363FF003131FF002121FF001818
      FF001818FF001818FF001818FF0018187B0000000000FFFF000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00FFFF00000000
      000000000000FFFF0000C6C6C600848484000000000000000000000000000000
      00000000000000FFFF0000FFFF0000848400C6C6C60000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000084840000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000002121B5002121BD004242D600F7F7
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9CFF004242FF002121FF001818
      FF001818FF001818FF001818FF0018187B0000000000FFFF0000FFFF000000FF
      FF0000FFFF008484840000FFFF008484840000FFFF0084848400FFFF0000FFFF
      000084848400FFFF0000C6C6C600000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000848400C6C6C6000084840000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000002121B5002121C600424AD600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADFF004A4AFF002121FF001818
      FF001818FF001818FF001818FF0018187B0000000000000000000000000000FF
      FF0000FFFF008484840000FFFF008484840000FFFF00848484008484840000FF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00008484000084
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000008484000084840000000000000000000000
      0000000000000000000000000000000000004242A5002929BD004242CE00D6D6
      F700DEDEF700DEDEF700DEDEF700DEDEF7008484F7003939F7002121F7001818
      F7001818F7001818F7001818F700181873000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      84000084840000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A9C003131AD002121
      CE002121CE002121CE002121CE002121CE002121CE002121C6002121C6002121
      C6002121C6002121BD002121BD00292963000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042429C002121
      C6002121C6002121C6002121C6002121C6002121C6002121BD002121BD002121
      BD002121BD002121BD002121AD00424263000000000000000000000000000000
      0000000000000000000000FFFF008484840000FFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003939
      AD002121BD002121BD002121BD002121BD002121BD002121B5002121B5002121
      B5002121B5002121B50031319400000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF7001873AD001894C60000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70010CED600108CDE00187BFF0039A5FF001094FF0010D6EF0000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70008EFE700182184002131A50000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF700315273001818BD002121FF007B7BFF001821FF00296BC60000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF7001894A50018189C001818B50018B5CE0000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70021849C001818B5002929FF007B7BFF002121EF0021A5CE0000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70018B5B500181873001818BD001818CE002121AD0018D6DE0000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70018D6CE0021ADAD0000FFF70000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF70000FFF70021ADAD0018D6CE0000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70018DED600181894002929F7006B6BFF002121D60008F7EF0000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70029526B0010108C001818C6001818DE001818C6002973AD0000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70018B5B50029526B00181852001863940000FFF70000FFF70008F7EF0018DE
      D60021849C003152730010CED600000000000000000010CED600315273002184
      9C0018DED60008F7EF0000FFF70000FFF700186394001818520029526B0018B5
      B50000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70008F7EF0021218C002121F7005A5AFF003139D60000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70018D6CE001818520010109C001818D6001818E7001818D60029299C0010EF
      E70000FFF70000FFF70000FFF700000000000000000000FFF70008EFE7001894
      A5001818730010108C0010109C001821A5002939940029298C0021218C001818
      94001818B5001818BD00108CDE000000000000000000108CDE001818BD001818
      B5001818940021218C0029298C00293994001821A50010109C0010108C001818
      73001894A50008EFE70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70029298C002121F7004242FF00294AD60000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70021ADAD00186394001821A5001818E7001818F7002131DE001863CE0018BD
      CE0000FFF70000FFF70000FFF70000000000000000001873AD00182184001818
      9C001818BD001818C6001818D6001818E7001818F7002121F7002121F7002929
      F7002929FF002121FF00187BFF000000000000000000187BFF002121FF002929
      FF002929F7002121F7002121F7001818F7001818E7001818D6001818C6001818
      BD0018189C00182184001873AD00000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF700293994001818F7002929FF00295ACE0000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF700293994001818F7002929FF00295ACE0000FFF70000FF
      F70000FFF70000FFF70000FFF70000000000000000001894C6002131A5001818
      B5001818CE001818DE001818E7001818F7002929FF004242FF005A5AFF006B6B
      FF007B7BFF007B7BFF0039A5FF00000000000000000039A5FF007B7BFF007B7B
      FF006B6BFF005A5AFF004242FF002929FF001818F7001818E7001818DE001818
      CE001818B5002131A5001894C600000000000000000000FFF70000FFF70000FF
      F70021ADAD00186394001821A5001818E7001818F7002131DE001863CE0018BD
      CE0000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70029298C002121F7004242FF00294AD60000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70018B5
      CE002121AD001818C6001818D6002131DE00295ACE00294AD6003139D6002121
      D6002121EF001821FF001094FF0000000000000000001094FF001821FF002121
      EF002121D6003139D600294AD600295ACE002131DE001818D6001818C6002121
      AD0018B5CE0000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70018D6CE001818520010109C001818D6001818E7001818D60029299C0010EF
      E70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70008F7EF0021218C002121F7005A5AFF003139D60000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70018D6DE002973AD0029299C001863CE0000FFF70000FFF70000FFF70008F7
      EF0021A5CE00296BC60010D6EF00000000000000000010D6EF00296BC60021A5
      CE0008F7EF0000FFF70000FFF70000FFF7001863CE0029299C002973AD0018D6
      DE0000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70029526B0010108C001818C6001818DE001818C6002973AD0000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70018DED600181894002929F7006B6BFF002121D60008F7EF0000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70010EFE70018BDCE0000FFF70000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF70000FFF70018BDCE0010EFE70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70018B5B500181873001818BD001818CE002121AD0018D6DE0000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70021849C001818B5002929FF007B7BFF002121EF0021A5CE0000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF7001894A50018189C001818B50018B5CE0000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF700315273001818BD002121FF007B7BFF001821FF00296BC60000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70008EFE700182184002131A50000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70010CED600108CDE00187BFF0039A5FF001094FF0010D6EF0000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF7001873AD001894C60000FFF70000FFF70000FF
      F70000FFF70000FFF70000FFF700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005231
      2900422121004221210042212100422121004221210042212100422121004221
      21004A3929000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000000000000000000000000000000000005A4239004A21
      21004A2118004A21180042211800422118004221180042211800422118004221
      1800422121004242390000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084000000000000000000000000000000634239006B3129007B21
      18007B2118007B2118007B2118007B2118007B2118007B211800732118007321
      1800732118003929290042423100000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000007B3929008429210094292100BD29
      1800BD291800BD291800BD291800BD291800BD291800BD291800B5291800B529
      1800B52918004A211800422118004A3121000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00840000000000000000000000842921008C29210094292100C629
      1800C6291800C6291800C6291800C6291800BD291800BD291800BD291800BD29
      1800B52918004A21180042211800422118000000000000000000000000008400
      0000FFFFFF00FFFFFF0084000000840000008400000084000000840000008400
      00008400000084000000FFFFFF00840000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00840000000000000000000000842921008C2921009C292100C629
      1800C6291800C6291800C6291800C6291800C6291800BD291800BD291800BD29
      1800B52918005221180042211800422118000000000000000000000000008400
      0000FFFFFF00FFFFFF0084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00840000000000000000000000842921008C2921009C292100C629
      1800C6291800C6291800C6291800C6291800C6291800C6291800BD291800BD29
      1800BD2918005221180042211800422118000000000000000000000000008400
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00840000000000000000000000842921008C2921009C292100CE31
      2100CE312100CE312100C6312100C6291800C6291800C6291800C6291800BD29
      1800BD2918005221180042211800422118000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00840000000000000000000000842921008C2921009C312100CE42
      3100D6524200D64A4200CE423100CE312100C6311800C6291800C6291800C629
      1800BD2918005221180042211800422118000000000084000000FFFFFF008400
      000084000000840000008400000084000000840000008400000084000000FFFF
      FF00840000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000008C2921008C292100A5312900DE6B
      5A00EFADA500E79C9400DE736300D64A3900CE312100C6291800C6291800C629
      1800BD2918005221180042211800422118000000000084000000FFFFFF008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000008C2921008C312100A5423100EFBD
      B500FFFFFF00FFFFFF00F7C6C600DE736300CE423100C6312100C6291800C629
      1800BD2918005221180042211800422118000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000008C3121008C312100A54A4200FFF7
      F700FFFFFF00FFFFFF00FFFFFF00E79C9400D64A4200CE312100C6291800C629
      1800BD291800522118004A211800422118000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000FFFFFF008400000000000000000000000000000084000000840000008400
      00008400000084000000FFFFFF00840000008400000084000000840000008400
      0000FFFFFF00840000000000000000000000944A31008C312900A54A4200EFD6
      CE00EFDED600EFDED600EFD6D600DE847B00C64A3900C6312100BD291800BD29
      1800B5291800522118004A212100634229000000000084000000840000008400
      00008400000084000000840000008400000084000000FFFFFF00840000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000000000000000000000000000008C523900843931009429
      2100942921009429210094292100942921009429210094292100942921008C29
      21008C292100523129006B4A3100000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C5239009431
      210094292100942921008C2921008C2921008C2921008C2921008C2921008C29
      21007B2921006B4A310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009442
      29008C2921008C2921008C2921008C2921008C29210084292100842921008429
      210084422900000000000000000000000000424D3E000000000000003E000000
      2800000040000000000600000100010000000000003000000000000000000000
      000000000000000000000000FFFFFF001FFF9FFF000000000FFF0FFF00000000
      07FF07FF0000000083FF83FF000000000003C1FF000000000003E10F00000000
      0003F003000000000003F801000000000003F801000000000003F80000000000
      0003F800000000000003F800000000000003F801000000000003FC0100000000
      0003FE03000000000003FF0F00000000FFFFFFFBFFFFC0008080FFF1007DC000
      8000FFE00078C0008000FFC10070C0008000FF830061C0018000F3070003C001
      8000F20F0007C0018000F01F000FC0018000C03F0007C0018000C07F0007C001
      8000001F0007C0018000001F0007C0018000C0FFC007C001C081C0FFE00FC003
      FFFFF3FFF01FC007FFFFF3FFF83FC00FFFFFFFFFFFFFFFFF8000FFFF8000F800
      8000FFFF8000F8008000F7FF8000F8008000E7FF8000F8008000C7FF80000000
      8000801F80000000800000008000000080008000800000008000C60080000001
      8000E600800000018000F600800080018000FE008000F801C001FE00C001F801
      FFC3FF01FFFFF801FFFFFFFFFFFFFC03FFFFFFFFFFFFFFFF8000F0018000FFFF
      8000F0018000FFFF8000F0018000FFEF8000C0018000FFE78000C0018000FFE3
      8000C0018000F801800000018000000080000001800000018000000380000063
      8000000780000067800000078000006F8000000F8000007FC001001FC001007F
      FFFF001FFFFF80FFFFFF803FFFFFFFFFFC1FFFFFFFFFF00FF0078FFFFFFFE003
      E003807F00FF4001C001800F00000001C001800700000000C001800780000000
      C0018003C0010000C0018003C0030000E003800180C30000FFC7800180810000
      F1C7800180810000F1C7800380810001F1C78007C0810001F007E3EFC1C10003
      F80FFFFFFFC3C007FC1FFFFFFFFFE00FFFFFF8FFFE1FFF8FFC63F87FFC0FFF87
      C001F07FFC0FFFC3C001F03FFC0FFFE1C001E03FDC0E8031C003E01FE8058030
      C003E01FF0038078C003F30FB00381F8C007FF0FC00080F8C00FFF87E0018878
      FC1FFF87C0008C00F83FFFC3A0018E01F87FFFC7F0039F03F83FFFEFF003FFFF
      F83FFFFFCC0CFFFFFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7FFE7FFE7FFE7F
      FC3FFC3FFC3FFC3FF81FF81FF81FF81FF00FF00FF00FF00FFE7FFE7FFE7FFE7F
      FE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7F
      FE7FFE6FFE7FFE7FFE7FFE47FE07E07FFE7FFE6FFE07E07FFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00180008000FFFFC001
      800080008307C001800080008307C00180008000B337C00180008000E79FC001
      80008000EFDFC00180008000CFCFC001800080009FE7C001800080009FE7C001
      800080009FE7C00180008000CFCFC00180008000E01FC001C001C001F03FC003
      FFFFFFFFFFFFC007FFFFFFFFFFFFC00FFFFFC001FFFF8001F9FFC001FFFF0000
      F0FFC00180070000E0FFC00180070000C07FC00180070000863FC00180070000
      CF3FC00180070000FF9FC00180070000FFCFC00180070000FFE7C00180070000
      A883C00180070000AAB9C0018007000088BDC00180070000AABFC00380070000
      888FC007FFFF0000FFFFC00FFFFF8001F801FFFFFFFFFFFFF801FFFFFF0181F7
      F801F801FF019DE3F801F801FF01CFE38001F801E001E7C18001F801E001F380
      80018001E001B9F780018001E00181F780018001000FFFF780018001000F88F7
      80038003000F9CF78007801F000FC1F7801F801F000FC9F7801F801F01FFE3F7
      803FC03F01FFE3F7807FFFFFFFFFF7F79FFFFFFFC00180010FFFFFF3C0010000
      07FFFFE1C001000083FFFFC1C0010000C1FFFF83C0010000E00FFF07C0010000
      F003E10FC0010000F801C01FC0010000E001803FC0010000C000003FC0010000
      C000003FC00100008000003FC00100000001003FC0010000C001003FC0030000
      C203807FC0070000E00FC0FFC00F8001FC00FFFFFFFF9FFF0000801FC0030FFF
      0000001FC00307FF00000007E00783FF000000078001C1FF000000010000E10F
      000000010000F003000000010000F801000000010000F801000000010000F800
      000700010000F800000700010000F8000007C0010000F801000FC0010000FC01
      001FF0010000FE03003FF0018001FF0FC001FC00FFFFFC008000FC00BFFD0000
      8000FC00DFFB00008000FC00E00700008000F000E00700008000E000E0070000
      8000C000E007000080008000E007000080000000E007000080000000E0070000
      8000000FE00700078000000FE00700078000000FE00700078000801FDFFB000F
      8000C03FBFFD001FC001E07FFFFF003FFFFFFFFFFFFFF7FFFFFF80010000E3FF
      F81F80010000C1FFF00F8001000080FFE18780010000007FC7E380010000803F
      CFE380010000C01FCFF380010000E00FCFB380010000F007C79380010000F803
      C78380010000FC01E78780010000FE00FF8380010000FF01FF8180010000FF83
      FFFF80010000FFC7FFFFFFFFFFFFFFEFF1FFC001FFFFFF91E1FFC001F007FF01
      C3FFC001E003FF0387FFC001E003FFC78C01C001E00300001C01C001E0030000
      1E01C001E00300001F81C001E00300001F01C001E00300001E11C001E0030000
      0031C001C00100008071C001C0010000C0F9C001C0010000FFFFC003E003FF01
      FFFFC007F98FFF01FFFFC00FFC1FFF11F007FFFFFFFFFFFFE003FFFFFFFFF01F
      E0038000F81FE00FE0038000F00FC007E0038000E007C003E0038000C003C003
      E0038000C0038003E003E3FFC0038003E00323FFC0038003E00307FFC0038003
      E00303FFC0038003F00703FFE0078003F00707FFF00F8003E0030FFFF81FFE03
      E0031FFFFFFFFFC3F0073FFFFFFFFFFFFFFFC001FFFFFFFEF80FC001BFFFFFFC
      F007C0019FFFFFF9E003C001CFFFFE738001C001F01FFC070000C001F01FFC07
      0000C001F01FFC070000C001F01FF8070000C001F00FF0070000C001F0038007
      0000C001F001003F8000C001FF01007FF800C001FF8100FFF800C003FF8301FF
      F800C007FFC781FFF800C00FFFFFC1FFFDC7C001FFFFFDC7F003C001F80FF003
      C0018001F007C0010001C001E00300010001C001800100010001C00100000001
      0001C001000000018001C00100008001C003C0010000C003E007C0010000E007
      F00FC0010000F000F03FC0018001F000F03FC001F80FF000F03FC003F80FF000
      E03FC007F81FE000E07FC00FF83FE040FFFFFE7FC0018001F803FC7FC0010000
      F003F87FC0010000F003F07FC0010000F003E000C0010000E003C000C0010000
      C0038000C001000080030000C001000088070000C0010000980F8000C0010000
      F8FFC000C0010000F8FFE000C0010000F8FFF07FC0010000F8FFF87FC0030000
      F8FFFC7FC0070000FDFFFE7FC00F8001FFFFFFFFFFFFFFFFFFFFE01FFFFFFC3F
      FFFFC007F8FFFC3FFFFF8003F87FFC3FE7C30001F83FFC3FF3990001F81FFC3F
      F9990001F80F8001FCC30001F8078001FE7F0001F8078001FF3F0001F80F8001
      E19F0001F81FFC3FCCCF8003F83FFC3FCCE7C007F87FFC3FE1F3F01FF8FFFC3F
      FFFFFFFFFFFFFC3FFFFFFFFFFFFFFFFFE001E001FC1FFFFFC001C001FC1FFFFF
      80018001F80FCFFF80018001FC1FC7FF80018001F80FE1FF80018001F80FE0FF
      80018001F007F07F80018001F007F03F80018001F80FF81F80038001F80FFC0F
      80038001FC1FFE0780038001FC1FFF0380038003FE3FFF8180038003FE3FFFC0
      C007C007FF7FFFE1E00FE00FFF7FFFF3FFFFFFFFFFFFFF1FFFFF80658065FC0F
      81D780658065F007FFD78065FFE5C003FFD7FFE5FFE5800181D781C581C58000
      FF17818581858001FF178105FF0580018117FF05FF058001FF03810181018001
      FFFF818081808001800381C0FFC0C001FFFFFFFFFFFFE003FFFFF003F003F00F
      F803F003F003F83FFFFFF003FFFFFCFFFFFFC001C001C0010021C001C001C001
      0029C001C001C0010021C001C001C0010021C001C001C001FFFE4001C001C001
      00210001C001C00100291FFFC001C00100211FFFC001C00100210001C001C001
      FFFE4001C001C0010021C001C001C0010029C001C001C0010021C001C003C003
      0021C001C007C007FFFEC001C00FC00FFFFFFFFFFFFFFFFFFE1F8FFF8FFF8000
      FC0F807F807F8000F807800F800F8000F8078007800780000007800780078000
      00008003800380008000800380038000C000800180018000E200800180018000
      F600800180018000FE00800380038000FE00800780038000FE00C3C7C003C001
      FE00FE0FF003FFFFFFFFFFFFF003FFFFE0F0FFFFFFFFFFFFF9F93FFF38013FFF
      FCF9DFFFD801D803FE01B803B801B80303391FFF1FFF1FFFCE99FFFFFFFFFFFF
      CC491FFF18011FFFC821BFFFB801B803CC71D803D801D803CC793FFF3FFF3FFF
      CCFFFFFFFFFFFFFFC8FF1FFF18011FFF01FFBFFFB801B8038FFF380338013803
      CFFFBFFFBFFFBFFFEFFFFFFFFFFFFFFFFFFFC001FEFFF070FFFFC001FE7FFCF9
      FFFFC001FE3FFE73FFFFC001FE1FFF278000C001024F030F8001C001CE67CE0F
      8001C001CE73CC078001C001CE79CE338001C001CC7CCC398001C001C830C830
      8001C001CC7FCC7F8001C001CC7FC0FF8001C0010CFF0FFF8001C00388FF8FFF
      FFFFC007C1FFCFFFFFFFC00FEFFFEFFF8001C001FFFFFFFF0000C001FFFFFFFF
      0000C001FFFFFFFF0000C001FFFFFFFF0000C001800180010000C00180018001
      0000C001800180010000C001800180010000C001800180010000C00180018001
      0000C001800180010000C001800180010000C001800180010000C00380018000
      0000C007FFFFFFE18001C00FFFFFFFF3FFFFFFFFFE7FC00180008000FE3FC001
      80008000FE1FC00180008000FE0FC001800080000007C001800080000003C001
      800080000001C001800080000000C001800080000000C001800080000001C001
      800080000003C001800080000007C00180008000FE0FC001C0018000FE1FC003
      FFFF8000FE3FC007FFFFFFFFFE7FC00FFFFFC001FFFFFFFFFFFFC0018FFFE001
      0000C001807FE0010000C001800FE0010000C0018007E0010000C0018007E001
      0000C0018003E0010000C0018003E0010000C0018000E0010000C0018000C001
      0000C0018000C0010000C001800000010000C001800000010000C003C3C00003
      0000C007FFF3C007FFFFC00FFFFFC00FFFFFF00F9FFFFFDFFFFFE00700FFFF8F
      FFFFC003000FFF07FFFF80010007FEDBFFFF80010003FCD9FFFF800100017800
      8001800100013CD98001C00300011EDB8001C003000100078001E0070000018F
      FFFFF00F000003DFFFFFFC3F000707FFFFFFFC3F00070FFFFFFFF81F801F1FFF
      FFFFF00FC03F3FFFFFFFFFFFC07F7FFF8001803FC0019F0F00008003C0018F0F
      00008000C001830F00008000C001810F00008000C001C00F00008000C001E00F
      00008000C001F01F00008000C001F80300008000C001FC0100008000C001FE01
      00008000C001FE008001C000C001FE00E007E001C001FE00F00FF003C001FE01
      FC3FF807C001FF03FFFFFC1FC001FFC7FFFFFFFFFFFFFC1FFFFFFFFFFF09F007
      FFFF8001FE01E00380018001FC00C00180018001F801C00180018001F001C001
      8001FFFFE081C001FFFF8001E181C00180018001C0C1E00380018001C003F1C7
      8001FFFFC007F1C7FFFF8001E00FF00780018001C01FF80F8001FFFFC03FFC1F
      FFFFFFFFA47FFFFFFFFFFFFFFFFFFFFFFFFFEE00FFFFFFFF00FFC600EE03FFFF
      00FF8200C603FFFF81FF01FF83FF80018000C607000080018000C607C6008001
      C000FE07C7FFFFFFE000FFFFFE03FFFFC000FE00FE0380018000C600FFFF8001
      8000C600C600FFFF800001FFC600FFFF0000820701FF80010000C6078203FFFF
      E000EE07C603FFFFF001FFFFEFFFFFFFFFFFFFFFFF11FE7FFFE3FFFFFF01FE3F
      FFC1FFFFFF81FE1FFF81FFFFFF81FE0FFF018001FF010007FC038001FC030003
      C0078001C0070001800F80018007000000078001000700000003800100070001
      0001800100070003000F800100070007000780010003FE0F0003C0030001FE1F
      8001FFFF8001FE3FC0C0FFFFC011FE7FFFFFFFFF8001FFFFFFFFFFFF0000FFE3
      FC3FFFFF0000FFC1F81FFFFF0000FF81F00FE07F0000FF01E007F8FF0000FC03
      C003F8FF0000C007C003FC7F0000800FC003FC7F0000001FC003FE3F0000003F
      C003FE3F0000003FE007FF1F0000003FF00FFE0F0000003FF81FFFFF0000003F
      FFFFFFFF0000807FFFFFFFFF8001C0FFFFFFC001C001FFFFFC3FC001C0018001
      F81FC001C0018001F00FC001C0018001E007C001C0018001C003C001C0018001
      8001C00100018001800180010001000180018001000100018001800100010001
      C003800100010001E007800100010001F00F800100010001F81FC00300038001
      FC3FC00700078001FFFFC00FC00F8001FFFFFFFFFFFFFFFFFFFF000FFE7FF3FF
      FFFF000FFC3FF1FF0007FFFFF81FF0FFFFFF5E07F00FF00FDFFFCE07E007C003
      CE070607C0038001060703FF8001000003FF0600800100000600CE00C0030000
      CE00DE00E0070000DFFFFFFFF00F0000FFFF000FF81F80010007000FFC3FC003
      FFFFFFFFFE7FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFF000FFEFF
      FFFFFFFF000FFFFFC27F0007FFFFC27FFFFFFFFFEE07FFFFC200EFFFCE07C200
      FFFFCE078207FFFFDE07820703FFDE079E0703FF8200CE0707FF8200CE0007FF
      9E00CE00EE00CE00DE00EFFFFFFFDE00FFFFFFFF000FFFFFC2000007000FC200
      FFFFFFFFFFFFFFFFFEFFFFFFFFFFFEFF8000C3FFFFFFFFFF000000038001FFFF
      000000038001C843000000038001CB5B000000038001FB5B000000038001FB5B
      000000038001FB5B000000038001F843000000038001FFFF000000038000FE43
      000000018000DE5B0000000080009FDB00000000800007DB0000FFF880009FDB
      0000FFFF8000DFC30001FFFF8001FFFFFFFFF81FF0FFFFFFFFFFE007E00F8001
      FFFFC003C0030000FFFF800180010000FFFF800100010000E0FF000000010000
      E07F000000010000F03F000000010000F81F000000010000FC0F000000010000
      FE07000080030000FF038001C0070000FF818001E00F0000FFC1C003F01F0000
      FFE3E007F99F8001FFFFF81FFF9FFFFFF000C001FFEFF00FF000C001FFCFE003
      8000C001FF8FC0018000C001C00780018000C00180038000801FC00180030000
      801FC00180030000801FC00180030000801FC00180030000801FC00180030000
      8000C001800300008000C001800300018000C00180038001F000C00380038003
      F000C0078003C007FFFFC00FC007E00FC001C001FFD7EBFFC001C001FFD3CBFF
      C001C001FFD18BFFC001C001FFD00BFFC001C001FFD18BFFC001C00101D3C80F
      C001C00101D7E80FC001C00101FFF80FC001C00101FFF80FC001C00101FFF80F
      C001C00101FFF80FC001C001000FF800C001C001000FF800C003C003E00FFF00
      C007C007E00FFF00C00FC00FFFFFFFFFFFFFFC00FFFFF81F8001E0008000F81F
      8001EC008000F81F8001EFFF8000F81F8001EC008000FC3F8001E0008000FC3F
      8001EC008000FC3F8001EFFF8000FC3F8001EC008000FC3F8001E0008000FC3E
      8000EC008000981C8000EFFF800000008000801F800000018000801FC0010003
      8000801FFFFF0007FFC0FFFFFFFF981FFFFFFFFFFFFFFFFF800180018001FFFF
      8001800180010000800180018001000080018001800100008001800180010000
      8001800180010000800180018001000080018001800100008001800180010000
      8001800180010000800180018001000080018001800100008001800180010000
      8001800180010000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDE00800180018001
      8E008001800180010600800180018001DE00800180018001DE00800180018001
      FE00800180018001FE00800180018001FE00800180018001DE00800180018001
      DE0080018001800106008001800180018E00800180018001DE00800180018001
      FFFF800180018001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFC0FFC0FFC00000FFC0FFC0FFC00000FFC0FFC0FFC00000FFC0FFC0FFC00000
      0340034003400000033F033F033F0000001F001F001F0000033F033F033F0000
      0340034003400000FFC0FFC0FFC00000FFC0FFC0FFC00000FFC0FFC0FFC00000
      FFC0FFC0FFC00000FFFFFFFFFFFFFFFF838383838383FFFF838383838383FFFF
      838383838383FFC0838383838383FFC0838383838383FFC0828382838283FFC0
      FC7FFC7FFC7F0340F83FF83FF83F033FFEFFFEFFFEFF001FFEFFFEFFFEFF033F
      F83FF83FF83F0340F83FF83FF83FFFC0F83FF83FF83FFFC0F83FF83FF83FFFC0
      F83FF83FF83FFFC0F83FF83FF83FFFFFFFFFFFFFFFFF8383FEFFFFFFFFFF8383
      FC7F00FF00FF8383F83F00FF00FF8383FEFF00FF00FF8383FEFF00FF00FF8283
      F83F001B001BFC7FF83F00190019F83FF83F00000000FEFFF83F00190019FEFF
      F83F001B001BF83F800300FF00FFF83F800300FF00FFF83F800300FF00FFF83F
      800300FF00FFF83F8003FFFFFFFFF83FFFFF8003FFFFFFFF800180038001FEFF
      800180038001FC7F800180038001F83F800180038001FEFF800180038001FEFF
      800180038001F83F800180038001F83F800180038001F83F8001FFFF8001F83F
      8001FFFF8001F83F8001EFEF800180038001CFE7800180038001838380018003
      8001CFE780018003FFFFEFEFFFFF8003F0FFC001C001C001E03FC001C001C001
      C00FC001C001C001C007C001C001C001C0074001C0014001C0070001C0010001
      C007000180000001C007000180000001E007000180000001F0074001C0014001
      F38FC001C001C001F3FFC001C001C001E3FFC001C001C001E7FFC003C001C003
      C7FFC007C001C007CFFFC00FC001C00F801FF81FFFFFFFFFC03FE0078000FFFF
      E07FC0038000BFFFC03F80018000CFFF801F80018000EE4F000F00008000E717
      000700008000E68F800300008000E327C00300008000F3FFE00300008000F3FF
      F00700008000E0FFF80380018000F9FFFC0180018000F93FFFE0C0038000FC7F
      FFF0E007C001FFFFFFF9F81FFFFFFFFFFFFFC001C001FFFFF000C001C001FFFF
      FFFFC001C00107C1F070C001C001CFF3FC79C001C001E7F3FE39C001C001F003
      FF01C001C001F9F3FF89C001C001FCF3BBC1C001C001FE7393E1C001C001FF33
      83F1C001C001FF93D7F9C001C001FFC3D7FFC001C001FFE3C7FFC003C003FFF3
      EFFFC007C007FFFFFFFFC00FC00FFFFFFFFFC3FFFFFFFFFF8FFFC00FFFFFFFFF
      807FC007FFFFFFFF800F0003FFFF0F0580070003FFFF9F88800700010F87CF1D
      800300019FCFC01D80030000CFCFE63D80010000E00FE23D80010000F3CFF07D
      80000003F9CFF07D80000003FCCFF8F8800F0003FE4FF8FDC00F001FFF0FFC01
      F80F83FFFF8FFFFFF80FFFFFFFCFFFFFFFFFFFFF8FFFC3FFE7FF8FFF001FC00E
      E7FF807F0007C004E7FF800F0007C000E7FF80070003C000E7FF80070003C000
      E7FF80030001C001E0FF80030001C000E03F80010000C000E00780010000C000
      E00180010000C003E000800F0007E003E001800F0007F003E01FC3FF83E7F807
      E0FFFFFFC7F3FC0FFFFFFFFFFFFFFFFFFF3FFE7FFFFFFFFFFE3FFC7FE7FFE7FF
      FC3FF87FE7FFE7FFFC3FF07FE7FFE7FFFC3FE000E7FFE7FFFC3FC000E7FFE7FF
      FC3F8000E7FFE7FFFC3F0000E0FFE0FFF81F0000E03FE03FF00F8000E007E007
      E007C000E001E001C003E000E000E0008001F07FE001E0010000F87FE01FE01F
      FFFFFC7FE0FFE0FFFFFFFE7FFFFFFFFFFFFFFFFFFFFFFF3FFFFFFFFFE007FE3F
      FFFFFFFFE007FC3F80000001E007FC3F80000001E007FC3F80000001E007FC3F
      80000001E007FC3F80000001E007FC3F80000001E007F81F80000001E007F00F
      80000001E007E00780000001E007C00380000001E0078001FFFFFFFFE0070000
      FFFFFFFFE007FFFFFFFFFFFFE007FFFFFE7FE7E7FFFFFFFFF07FC3C3FFFFE007
      C001E187FFFFE007C001E007FEFFE007C001F00FFC7FE007C001F81FF83BE007
      C001E007F019E007C0018001E009E007C0010000C001E007C0010000E001E007
      C001FC3FF001E007C001FC3FF803E007C001FC3FF81FE007C001FC3FFA3FE007
      F001FC3FFB7FE007FC7FFE7FF8FFE007FFFFC001FFFFFFFF8000C001FFFFEFFF
      8000C001FFFFE3FF8000C0018000E1FF8000C0018000F0FF8000C0018000F83F
      8000C0018000FC1F8000C0018000FE0F8000C0018000F0038000C0018000F003
      8000C0018000F0018000C0018000F8018000C0018000FE03C000C001FFFFFF81
      FFE1C001FFFFFFE0FFF3C001FFFFFFF8C001FCFFC001FCFFC000FC0FC001F87F
      C000FC03C001F03FC000FC03C001E01FC000F001C001C00FC000E000C0018007
      C000C000C0010003C0008001C0010001C0000001C0010000C0000003C0010000
      C0010003C001C000C0010007C001C001C001000FC000E003C003801FC001C007
      C007C03FC0038C0FC00FE07FC00F9E1FFF1FC001C001C001FF1FC000C000C000
      8F1FC000C000C0008F07C000C000C0008403C000C000C000C001C000C000C000
      8001C000C000C0008001C000C000C0008001C000C000C0008001C000C000C000
      8003C001C001C0018007C001C001C001C007C001C001C001E00BC003C003C003
      EF0FC007C007C007FF0FC00FC00FC00FFFFFFFFCFFFFFFFFFFFF9FF900018000
      DF218FF300018000CF2D87E70001800007EDC3CF00018000CFEDF11F801F8000
      DFEDF83F803F8000FFE1FC7F881F8000FFFFF83F800F8000E421F19F80078000
      E5ADE3CF83038000FDADC7E787818000FDAD8FFB8FC08000FDAD1FFF9FE1C001
      FC213FFFBFF3FFFFFFFFFFFFFFFFFFFF80018001800180010000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800180018001800180018001800180010000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000008001800180018001FFFFFFFF80018001FF07FF0700000000
      FE03FE0300000000FC01FC010000000080010001000000000001000100000000
      0001000100000000000100010000000000030003000000000007000700000000
      007F007F00000000007F007F00000000007F007F00000000007F007F00000000
      80FF007F00000000FFFFFFFF80018001FFFFFFFFFFFFFFFFF007FFFFFFFFFFFF
      E003E003E003E003E003E003E003E003E003E003E003E003E003E003E003E003
      E003E001E003E003E003E000E003E003E003E000E001E001E003E000E000E000
      E003E001E001E000E003E001E003E000E003E003E003E001E003E003E003E003
      E003E003E003E003F007F007F007F007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      E003E003E003E003E003E003E003E003E003E003E003E003E003E003E003E003
      E003E003E000E003E003E003E003E003E003E003E003E003E003E001E003E003
      E003E001E003E003E003E003E003E003E003E003E003E001E003E003E003E000
      E003E003E003E001F007F007F007F003FFFFFFFFFFFFFFFFFE0FF9CFF1C7F9CF
      C00FF087E083F087C003F6B7EEBBF6B7C183F2A7E6B3F2A7FF83F007E083F007
      8000F80FF007F80F8000FE3FFE3FFE3F8000FC1FFC1FFC1F8000FC1FF88FFC1F
      8000F88FF1C7F88F8000F9CFE3E3F9CF8000F1C7E7F3F1C78000F3E7EFFBF3E7
      FFFFF7F7FFFFF7F7FFFFFFFFFFFFFFFFF801F801FFFFEFFFF801F801FFFFE7FF
      F801F801FFFF07FFC001F801FFFF8007800180018000E007800180018000E7E7
      800180018000E7E7800180018000E7E7800180008000E7E7800180008000E7E7
      800180008000E7E7800180008000E001801F80038000E000801F80038000FFE7
      801F803FFFFFFFE7801F807FFFFFFFF7FFFFFF1FFF3FF801FF9FFF1FFF3FF801
      FC038F1FFF0FF801FC038F07FF0FF801F80084039F078001F800C0018E078001
      F800800184078001F801800180078001800380018007800180038001800F8001
      801F8003801F8003001F8007803F8007001FC00F801F801F803FE00F800F801F
      C07FFF0F8007803FE0FFFF0F8003807FC001FFFFB6DBF807C001FFFFAAABF003
      C0010000AAABE003C0010000B6DBE003C00100000FF7F003C00100000023F007
      C00100000001F003C00100000003F003C00100000003F003800100000007F003
      800100000007E003800100000003E003800100000003E003800100000003E003
      8001000000FFE003FFFFFFFF83FFFC07FFFF8FFFFE3FFFFFFFFF807FE0078003
      80038007E007F7FF800380018003E3FF800380018001F1FF800380018001F0FF
      800380018001F87F800380018001FC3F800380018001FE1F80038001C003FF03
      80028001E007FF83C1FE8001F81FFFC0C1F48001F81FFFC0FFF18001F81FFFF0
      FFF18001F81FFFF1FFF0C1FFFC3FFFFFFFFFE00FF81FFC3FFFFFC007E007F00F
      FFFF8003C003E007807F80038001C003803F800380018001801F800300008001
      800F800300000000C007800300000000E003800300000000F001800300000000
      F801800300008001FC01800380018001FE0180038001C003FF018003C003E007
      FFFFC007E007F00FFFFFE00FF81FFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      F04FFFFF07C30000E71F0E04CFE70000EF9F9F31E7E70000EF9FCF39F0070000
      E79FE039F9E70000F01FF301FCE70000FF9FF939FE670000EF9FFC39FF270000
      E79FFE03FF870000F03FFF3FFFC70000FFFFFFFFFFE70000FFFFFFFFFFFF0000
      FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFF9FFFFFFFFFFFFFFF0FFFFFFF
      FFFFFFFF07FFFFFFC001C00180010E098000800080009F24800080008000CF24
      800080008000E024800080008000F324800080008000F921800080008000FC27
      800080008000FE27800080008000FF07800180018001FFFF81FF81038001FFFF
      C3FFC381C203FFFFFFFFFFC0FF0FFFFFF87FFFFFFFFFFFFFE03FFFFFFFFFFFFF
      801FFFFFFFFFFFFF000FC000C001C00100078000800080000003800080008000
      0001800080008000000080008000800000008000800080008001800080008000
      C001800080008000E001800080008000F003800180018001F80781FF81C081FF
      FC1FC3FFC3E1C3FFFE7FFFFFFFF3FFFFE003FFFFE007F001C001FFFF8001E000
      C00180018001E000C00100008001E000C00100008001E000C001000080018000
      C001000080010000C001000080010001C001000080010007C0010000C0030007
      C0010000C0030007C001000080010007C00180018001000FC001FF0F800107FF
      C001FF0FC0038FFFE003FFFFFFFFFFFFFFFFFFFFFFFFE0039FFFF00FFFFFC001
      0801E0038001C0010801C0030000C0019FFFC0030000C001FFFFC0030000C001
      9FFFC0030000C0010801C0030000C0010801C0030000C0019FFFC0030000C001
      FFC0C0030000C0019FC0C0030000C0010800C0030000C0010800C0038001C001
      9FC0C003FFFFC001FFC0E00FFFFFE003DDBBFFFFFFFFFFFFAD5B9FFF9FFF9FFF
      AD5B0FFF08010801A953080108010801DDBB9FFF98019FFF801FFFFFFFFFFFFF
      801B9FFF9FFF9FFF80110FFF08010801800008010801080180119FFF98019FFF
      8001FFFFFFFFFFFF80019FFF9FFF9FFF801F0FFF08010801803F080108010801
      807F9FFF98019FFFFFFFFFFFFFFFFFFF8007FFFFFFFFFFFF0003C1FFFFFFFF01
      0001C01FF801FF010000C003F801FF010000C001F801E0010000C001F801E001
      0000C0018001E0010000C0018001E0018000C0018001000FC000C0018001000F
      E000C0018003000FF000C001801F000FF001C001801F000F8003F801801F01FF
      0007F81FC03F01FF000FF81FFFFFFFFFF81FFFFFFFFFFFFFE0070000FFFF000F
      C00300008003000780010000FFFF000380010000BEFB000100000010FFFF0000
      00000018BEFB00000000001FFFFF00000000001FAAAB00000000801FFFFF0000
      0000E01FBEFB00008001FC1FFFFF00008001FC1FBEFB8000C003FE1FFFFFC000
      E007FFFF8003E000F81FFFFFFFFFFFFFFFFFF80FFFFFFFFF8400F00FF83F0001
      8400E3FFF39F00018400C401F6DF00018400C800F55F0001840088CCF55F0001
      840099CCF55F0001840099CCF55F0001840099CCF55F0001840088CCF55F0001
      8400CC0CF55F00018400C609F55F00018400E3F1FD5F000187FFF003FDDFFFFF
      87FFFC0FFE3FFFFF87FFFFFFFFFFFFFFFFFFFFFF9FFF80078001F00F0FFF0003
      0001C00307FF00030001800183FF000300010001C1FF000380030101E10F0003
      E00F0301F0030000C0070403F80100008003FC07F80100000101C003F8000003
      01018001F800000300010001F800000300010003F801000380038007FC018007
      C00FC00FFE03FE3FF03FF03FFF0FFF3FFFFFFFFFFBFFFFFF80FF8401E03FF007
      801F8401801FC00780018401000FC007800184010007C00F800184010003F81F
      800184010001F81F800184010000F81F800184010000F81F800184010001F01F
      800184018001C01F800187FFC001C01F800187FFE007C01FF98387FFF01FE01F
      F81F87FFF87FF03FFFFFFFFFFDFFFC7FFFFFFFFFFC1FFE03FFFFFFFFF80FFE01
      800780070005FC01800780070000F801800780078001F001800780070001E000
      8007800700000000800780070000000080078007000000008007800780010000
      80078007C001000180078007C003000780078007C007103F80078007E00FE0FF
      FFFFFFFFE01FE07FFFFFFFFFF03FC07FFFFFFFFFFFFFFFFFF007F007F007F007
      E003E003E003E002E003E003E003E000E003E003E003E000E001E003E003E001
      E000E003E001E003E003E003E000E003E003E003E000E003E003E003E001E003
      E003E001E001E003E003E000E001E003E003E001E003E003E003E003E003E003
      E003E003E003E003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007F007F007F007
      E003E003E003E003E003E003E003E003E003E003E003E003E003E003E003E003
      E003E003E003E003E003E003E003E003E003E000E003E003E003E000E001E001
      E003E000E001E001E003E003E003E000E003E003E003E000E003E003E003E001
      E003E003E003E001FFFFFFFFFFFFFFE7FFFFFCFFFFFFFFFFFFFFE07FFFFFFFFF
      FFFFC03FFFFFFFFF8001801F800180018001800F800180018001800780018001
      8001800380018001800180018001800180018001800180018001C00180018001
      8001C001800180018001E001800180018001F0078001800181FFF81F81E181FF
      83FFFC1F83F183FFFFFFFFFFFFFFFFFFFFE0FEFFFE43FFFF8080FC7FFE0CFFBF
      8000FC3FFF4CFE3F8000FC3FFF10F81F0000FC3FFF94E01F0013FC3FDFC3800F
      003FFC3F07E4800F007FFC7F07F0C007807FFC7F8C20C007F8E7FC7FDDADC003
      F9E7FC7F24EFE003F981FE7F766FE001F981F83F8F6FF007F8E7F09FAD6FF81F
      F8E7F01FDD4FF87FFCFFF01FDC6FFDFFFFFFF83FFEFFFFFFF01FE007FC7FF00F
      E007C003F83FE003C0038001F83F800180030001F01F800180010001F01F0000
      00010000E00F000000010000E00F000000010000C007000000010000C0070000
      800100008003000180010001800300018003800100018003C00780030001C003
      E00FC0070001E00FFC3FF00F0001F83FFFFFFEFFFFFF8000C003FEFFFFFF0000
      8001FC7FE66300008001FC7FC24100040001FC7FC00100000001F83F80030000
      0001F83F000100008001F83F000100008003F01F00010000800FF01FC0070000
      800FF10FC0030000C007E00FE0030000E007E007F83F0000E007C007FC3F0000
      F81FC007FFFF0000FFFFC007FFFF0003FFBFFFFFFFFFFF3FFF3FFF81FFFFFC0F
      FE3FFE07FFC70000F80FFE0FFF930000E007FC1FFF330000C003FC3FFE670000
      80010100FC4F000000000000F88F000000000000F10F000000000000E21F0000
      00000000C43F000000010000807F00000003000090FF00008007000099FF0001
      C00F0000C3FFFFFFF01F0000FFFFFFFFFFFFFF8FF3FFFFFFFE7FFC07E000C707
      F81FE001C0000000F00F800180000000C0038001000000008001800100000000
      E00780010000000080018001000000000000800100000000F00F800100000000
      F81F800100000000F81F800100000000FC3F80010001C018FC3F80010403C318
      FE7F80010FFFE3F9FFFFC00F1FFFFFFFFC00FC00FFFFFFFFFC00FC0080038003
      FC00FC0080038003FC00FC0080038003E000E00080038003E000E00080038003
      E000E00080038003E007E0078003800380078007800380038007800780038003
      8007800780038003801F801F80038003801F801F80038003801F801F80038003
      801F801FFFFFFFFFFFFFFFFFFFFFFFFF8000FFFFFFFFFFFF0000FEBFF3FFFFFF
      00008000F13FFFFF00008000E01FF7EF00008000E00FF3CF00008000C00FF81F
      000080000007F81F000080000007F00F00008000C007E00700008000F003FC3F
      00008001FC03FE7F0000E007FF03FE7F0000F00FFFC1FFFF8000F01FFFF1FFFF
      C000FC3FFFFCFFFFE001FD7FFFFFFFFFFFFFFFFFFFFFFFFF8001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001FFFFFFFFFFFFFFFFFC00FFFFFFFFE007FC0080038003C003
      FC00800380038001FC00800380030000E000800380030000E000800380030000
      E000800380030000E00780038003000080078003800300008007800380030000
      8007800380030000801F800380030000801F800380030000801F800380038001
      801FFFFFFFFFC003FFFFFFFFFFFFE00700000000000000000000000000000000
      000000000000}
  end
  object DSInOut: TJvDataSource
    DataSet = QueryInOut
    OnFieldChanged = DSInOutFieldChanged
    Left = 300
    Top = 197
  end
  object QueryInOut: TFDQuery
    Connection = DM.FDConnection
    Transaction = TransInOut
    UpdateTransaction = TransInOut
    FetchOptions.AssignedValues = [evAutoClose]
    FetchOptions.AutoClose = False
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvUpdateMode, uvUpdateNonBaseFields, uvAutoCommitUpdates]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.UpdateTableName = 'INOUTGSM'
    SQL.Strings = (
      'SEE DMUnit'
      ''
      'select '
      '   i.id,'
      '    iif( i.direction = 0,'#39#1056#1072#1089#1093#1086#1076#39','#39#1055#1088#1080#1093#1086#1076#39') as dir,'
      '   cast(s.startdatetime as date) as sdate,'
      '    c.name as clientname,'
      '    cn.nomer || '#39' '#39' || cn.name as contract,'
      '    p.name as paymentmode,'
      '    w.name as fuelname,'
      '    w.code as fuelcode,'
      '   i.ei,'
      '   i.volume,'
      '   i.price,'
      ''
      '   i.density,'
      '   round(volume * density / 1000,3) as mass,'
      '   i.nds, -- '#1089#1090#1072#1074#1082#1072
      '    round(amount * cast(nds as double precision) / '
      '       (100+cast(nds as double precision)), 2) as sumnds,'
      '    amount as whole,'
      '    round(amount - amount * '
      '      cast(nds as double precision) / '
      '     (100+cast(nds as double precision)), 2) as amount0'
      ''
      '   from inoutgsm i'
      '   join sessions s on s.id = i.session_id'
      '   join wares w on w.code=i.ware_code'
      '   join contragents c on c.code=i.client_code'
      '   join contracts cn on cn.partner_code=c.code'
      '   join paymentmodes p on p.code=i.payment_code'
      ''
      
        '      where /*s.startdatetime >= cast(:start_session_t as TIMEST' +
        'AMP)*/'
      '      s.id = :session_id'
      '      and i.azscode=:azscode'
      ''
      '   order by s.startdatetime, i.direction,paymentmode,clientname')
    Left = 364
    Top = 197
    ParamData = <
      item
        Name = 'SESSION_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'AZSCODE'
        DataType = ftWideString
        ParamType = ptInput
        Size = 10
      end>
    object QueryInOutID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryInOutDIR: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'DIR'
      Origin = 'DIR'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 6
    end
    object QueryInOutSDATE: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'SDATE'
      Origin = 'SDATE'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryInOutCLIENTNAME: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLIENTNAME'
      Origin = 'NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QueryInOutCONTRACT: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONTRACT'
      Origin = 'CONTRACT'
      ProviderFlags = []
      ReadOnly = True
      Size = 229
    end
    object QueryInOutPAYMENTMODE: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'PAYMENTMODE'
      Origin = 'NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QueryInOutFUELNAME: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'FUELNAME'
      Origin = 'NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QueryInOutFUELCODE: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'FUELCODE'
      Origin = 'CODE'
      ProviderFlags = []
      ReadOnly = True
      Size = 16
    end
    object QueryInOutEI: TWideStringField
      FieldName = 'EI'
      Origin = 'EI'
      Size = 10
    end
    object QueryInOutVOLUME: TFloatField
      FieldName = 'VOLUME'
      Origin = 'VOLUME'
      Required = True
    end
    object QueryInOutPRICE: TFloatField
      FieldName = 'PRICE'
      Origin = 'PRICE'
      Required = True
    end
    object QueryInOutDENSITY: TFloatField
      FieldName = 'DENSITY'
      Origin = 'DENSITY'
      Required = True
    end
    object QueryInOutNDS: TWideStringField
      FieldName = 'NDS'
      Origin = 'NDS'
      Required = True
      Size = 10
    end
    object QueryInOutSUMNDS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'SUMNDS'
      Origin = 'SUMNDS'
      ProviderFlags = []
    end
    object QueryInOutWHOLE: TFloatField
      FieldName = 'WHOLE'
      Origin = 'AMOUNT'
      Required = True
    end
    object QueryInOutAMOUNT0: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'AMOUNT0'
      Origin = 'AMOUNT0'
      ProviderFlags = []
    end
    object QueryInOutMASS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'MASS'
      Origin = 'MASS'
      ProviderFlags = []
    end
  end
  object DSIOTH: TJvDataSource
    DataSet = QueryIOTH
    OnFieldChanged = DSIOTHFieldChanged
    Left = 124
    Top = 93
  end
  object QueryIOTH: TFDQuery
    BeforeInsert = QueryIOTHBeforeInsert
    CachedUpdates = True
    Connection = DM.FDConnection
    Transaction = TransIOTH
    UpdateTransaction = TransIOTH
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.UpdateTableName = 'IOTANKSHOSES'
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'select'
      '    i. id,'
      '    i.session_id,'
      '    cast(s.startdatetime as date) as stdt,'
      '    w.name as fuelname,'
      '    i.tanknum,'
      '    i.startfuelvolume,'
      '--    round(i.invol, 3) as calcin,'
      'i.invol as calcin,'
      
        '--   (select volume from calcoutcomes(s.id, i.tanknum,i.hosenum)' +
        ') as calc,'
      '    i.volume as calc,'
      '    (select volume from '
      '       calcrest(s.id, i.tanknum)) as calcrest,'
      '    (select volume from '
      '       calcrestprev(s.id, i.tanknum)) as calcrestprev,'
      '    '
      '    i.endfactvolume,'
      '    round(i.endfactvolume -(select volume from '
      '       calcrest(s.id, i.tanknum)), 3) as vdiff,'
      '    i.hosenum,'
      '    i.startcounter as stcnt,'
      '    endcounter as ecnt,'
      '    density,'
      '    temperature,'
      '    height,'
      '    mass,'
      '    water,'
      '    (select volume from '
      
        '       getprevcounter(s.id, i.tanknum, i.hosenum)) as prevcounte' +
        'r,'
      '    warecode,'
      '    round(i.endfactvolume - i.startfuelvolume, 3) as fact,'
      '    round(endcounter - startcounter /* - '
      '      coalesce(invol, 0, invol)'
      ''
      '       - (select volume '
      '              from outcomepm(:session_id, '#39'01'#1058#1055'00'#39'))'
      '*/'
      '    , 3)'
      '        as outcome '
      '    from iotankshoses i'
      '      join sessions s on s.id = i.session_id'
      '      join wares w on w.code = i.warecode'
      '    where '
      '    /*s.startdatetime >= cast(:start_session_t as TIMESTAMP)*/'
      '   s.id = :session_id'
      '   and i.azscode=:azscode'
      'order by s.startdatetime asc ,i.tanknum,i.hosenum')
    Left = 196
    Top = 93
    ParamData = <
      item
        Name = 'SESSION_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'AZSCODE'
        DataType = ftWideString
        ParamType = ptInput
        Size = 10
      end>
    object QueryIOTHID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryIOTHSESSION_ID: TIntegerField
      FieldName = 'SESSION_ID'
      Origin = 'SESSION_ID'
      Required = True
    end
    object QueryIOTHSTDT: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'STDT'
      Origin = 'STDT'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryIOTHFUELNAME: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'FUELNAME'
      Origin = 'NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QueryIOTHTANKNUM: TWideStringField
      FieldName = 'TANKNUM'
      Origin = 'TANKNUM'
      Required = True
      Size = 10
    end
    object QueryIOTHSTARTFUELVOLUME: TFloatField
      FieldName = 'STARTFUELVOLUME'
      Origin = 'STARTFUELVOLUME'
      Required = True
    end
    object QueryIOTHCALCIN: TFloatField
      FieldName = 'CALCIN'
      Origin = 'INVOL'
      Required = True
    end
    object QueryIOTHCALC: TFloatField
      FieldName = 'CALC'
      Origin = 'VOLUME'
      Required = True
    end
    object QueryIOTHCALCREST: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'CALCREST'
      Origin = 'VOLUME'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryIOTHENDFACTVOLUME: TFloatField
      FieldName = 'ENDFACTVOLUME'
      Origin = 'ENDFACTVOLUME'
      Required = True
    end
    object QueryIOTHHOSENUM: TIntegerField
      FieldName = 'HOSENUM'
      Origin = 'HOSENUM'
      Required = True
    end
    object QueryIOTHSTCNT: TFloatField
      FieldName = 'STCNT'
      Origin = 'STARTCOUNTER'
      Required = True
    end
    object QueryIOTHECNT: TFloatField
      FieldName = 'ECNT'
      Origin = 'ENDCOUNTER'
      Required = True
    end
    object QueryIOTHDENSITY: TFloatField
      FieldName = 'DENSITY'
      Origin = 'DENSITY'
      Required = True
    end
    object QueryIOTHTEMPERATURE: TFloatField
      FieldName = 'TEMPERATURE'
      Origin = 'TEMPERATURE'
      Required = True
    end
    object QueryIOTHHEIGHT: TFloatField
      FieldName = 'HEIGHT'
      Origin = 'HEIGHT'
      Required = True
    end
    object QueryIOTHMASS: TFloatField
      FieldName = 'MASS'
      Origin = 'MASS'
      Required = True
    end
    object QueryIOTHWATER: TFloatField
      FieldName = 'WATER'
      Origin = 'WATER'
      Required = True
    end
    object QueryIOTHWARECODE: TWideStringField
      FieldName = 'WARECODE'
      Origin = 'WARECODE'
      Required = True
      Size = 16
    end
    object QueryIOTHFACT: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'FACT'
      Origin = 'FACT'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryIOTHOUTCOME: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'OUTCOME'
      Origin = 'OUTCOME'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryIOTHCALCRESTPREV: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'CALCRESTPREV'
      Origin = 'VOLUME'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryIOTHPREVCOUNTER: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'PREVCOUNTER'
      Origin = 'VOLUME'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryIOTHVDIFF: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VDIFF'
      Origin = 'VDIFF'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object FuelPopupMenu: TPopupMenu
    Left = 28
    Top = 101
    object ggg1: TMenuItem
      Caption = 'ggg'
      OnClick = ggg1Click
    end
  end
  object DSRealPM: TJvDataSource
    DataSet = QueryRealPM
    OnFieldChanged = DSRealPMFieldChanged
    Left = 124
    Top = 149
  end
  object QueryRealPM: TFDQuery
    Connection = DM.FDConnection
    Transaction = TransPM
    UpdateTransaction = TransPM
    Left = 204
    Top = 149
  end
  object QuerySST: TFDQuery
    Connection = DM.FDConnection
    Transaction = GenUpdTrans
    UpdateTransaction = GenUpdTrans
    SQL.Strings = (
      'select first 1 startdatetime from ('
      'select first :cnt'
      '   startdatetime'
      '  from sessions'
      '  where azscode = :azs'
      '  order by startdatetime desc'
      '  )'
      '  order by startdatetime asc')
    Left = 28
    Top = 397
    ParamData = <
      item
        Name = 'CNT'
        ParamType = ptInput
      end
      item
        Name = 'AZS'
        ParamType = ptInput
      end>
  end
  object TransInOut: TFDTransaction
    Options.AutoStop = False
    Connection = DM.FDConnection
    Left = 508
    Top = 189
  end
  object TransIOTH: TFDTransaction
    Options.AutoStop = False
    Connection = DM.FDConnection
    AfterCommit = TransIOTHAfterCommit
    Left = 260
    Top = 93
  end
  object TransPM: TFDTransaction
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = DM.FDConnection
    Left = 276
    Top = 149
  end
  object QueryWL: TFDQuery
    Connection = DM.FDConnection
    Transaction = GenUpdTrans
    UpdateTransaction = GenUpdTrans
    ResourceOptions.AssignedValues = [rvMacroExpand]
    SQL.Strings = (
      'select * from wares where incl > 0 order by code ')
    Left = 116
    Top = 405
  end
  object StartVPMenu: TPopupMenu
    Left = 28
    Top = 181
    object SetPrevSessionData1: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1089' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1081' '#1089#1084#1077#1085#1099
      OnClick = SetPrevSessionData1Click
    end
  end
  object GenUpdQuery: TFDQuery
    Connection = DM.FDConnection
    Transaction = GenUpdTrans
    UpdateTransaction = GenUpdTransUPD
    Left = 36
    Top = 269
  end
  object GenUpdTrans: TFDTransaction
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = DM.FDConnection
    Left = 116
    Top = 277
  end
  object GenUpdTransUPD: TFDTransaction
    Options.Isolation = xiSnapshot
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = DM.FDConnection
    Left = 196
    Top = 277
  end
  object QueryRealPmSum: TFDQuery
    Connection = DM.FDConnection
    Transaction = TransPM
    UpdateTransaction = TransPM
    Left = 340
    Top = 149
  end
  object SCNTPMenu: TPopupMenu
    Left = 28
    Top = 141
    object SCNT1: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1089' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1081' '#1089#1084#1077#1085#1099
      OnClick = SCNT1Click
    end
  end
  object RestoreIOTHRec: TFDStoredProc
    Connection = DM.FDConnection
    Transaction = GenUpdTrans
    UpdateTransaction = GenUpdTransUPD
    StoredProcName = 'RESTOREIOTHREC'
    Left = 340
    Top = 93
  end
  object TransINOutUpd: TFDTransaction
    Options.Isolation = xiSnapshot
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = DM.FDConnection
    Left = 636
    Top = 133
  end
  object QueryIOTHSum: TFDQuery
    BeforeInsert = QueryIOTHBeforeInsert
    CachedUpdates = True
    Connection = DM.FDConnection
    Transaction = TransIOTH
    UpdateTransaction = TransIOTH
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.KeyFields = 'CALC;OUTCOME'
    SQL.Strings = (
      'select sum(calc) as calc, sum(outcome) as OUTCOME, '
      '     sum(calcin) as calcin, '
      '     sum(calcrest) as calcrest, '
      '     sum(calcrestprev) as calcrestprev,'
      '     sum(prevcounter) as prevcounter,'
      '     sum(vdiff) as vbdiff'
      'from'
      '('
      'select'
      '    i. id,'
      '    i.session_id,'
      '    cast(s.startdatetime as date) as stdt,'
      '    w.name as fuelname,'
      '    i.tanknum,'
      '    i.startfuelvolume,'
      '    round(i.invol, 3) as calcin,'
      
        '    -- (select volume from calcoutcomes(s.id, i.tanknum,i.hosenu' +
        'm)) as calc,'
      '    i.volume as calc,'
      '    (select volume from calcrest(s.id, i.tanknum)) as calcrest,'
      '    (select volume from '
      '       calcrestprev(s.id, i.tanknum)) as calcrestprev,'
      '    '
      '    i.endfactvolume,'
      '    round((select volume from '
      
        '       calcrest(s.id, i.tanknum)) - i.endfactvolume, 3) as vdiff' +
        ','
      ''
      '    i.hosenum,'
      '    i.startcounter as stcnt,'
      '    endcounter as ecnt,'
      '    density,'
      '    temperature,'
      '    height,'
      '    mass,'
      '    water,'
      '    (select volume from '
      
        '       getprevcounter(s.id, i.tanknum, i.hosenum)) as prevcounte' +
        'r,'
      '    warecode,'
      '    round(i.endfactvolume - i.startfuelvolume, 3) as fact,'
      '    round(endcounter - startcounter /* - '
      '      coalesce(invol, 0, invol) '
      ''
      '       - (select volume '
      '              from outcomepm(:session_id, '#39'01'#1058#1055'00'#39'))'
      '*/'
      ', 3)'
      ''
      '        as outcome '
      '    from iotankshoses i'
      '      join sessions s on s.id = i.session_id'
      '      join wares w on w.code = i.warecode'
      '    where '
      '    /*s.startdatetime >= cast(:start_session_t as TIMESTAMP)*/'
      '   s.id = :session_id'
      '   and i.azscode=:azscode'
      ')')
    Left = 420
    Top = 93
    ParamData = <
      item
        Name = 'SESSION_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'AZSCODE'
        DataType = ftWideString
        ParamType = ptInput
        Size = 10
      end>
    object QueryIOTHSumCALC: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'CALC'
      Origin = 'CALC'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryIOTHSumOUTCOME: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'OUTCOME'
      Origin = 'OUTCOME'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryIOTHSumCALCIN: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'CALCIN'
      Origin = 'CALCIN'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryIOTHSumCALCREST: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'CALCREST'
      Origin = 'CALCREST'
      ProviderFlags = []
      ReadOnly = True
      OnChange = QueryIOTHSumCALCRESTChange
    end
    object QueryIOTHSumCALCRESTPREV: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'CALCRESTPREV'
      Origin = 'CALCRESTPREV'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryIOTHSumPREVCOUNTER: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'PREVCOUNTER'
      Origin = 'PREVCOUNTER'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryIOTHSumVBDIFF: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VBDIFF'
      Origin = 'VBDIFF'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object QueryInOutSum: TFDQuery
    Connection = DM.FDConnection
    Transaction = TransInOut
    UpdateTransaction = TransInOut
    FetchOptions.AssignedValues = [evAutoClose]
    FetchOptions.AutoClose = False
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvUpdateMode, uvUpdateNonBaseFields, uvAutoCommitUpdates]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.UpdateTableName = 'INOUTGSM'
    SQL.Strings = (
      'SEE DMUnit'
      ''
      
        'select sum(volume) as volume,sum(amount0) as amount0, sum(sumnds' +
        ') as sumnds, sum(whole) as whole, sum(mass) as mass'
      'from ('
      ''
      'select '
      '   i.id,'
      '    iif( i.direction = 0,'#39#1056#1072#1089#1093#1086#1076#39','#39#1055#1088#1080#1093#1086#1076#39') as dir,'
      '   cast(s.startdatetime as date) as sdate,'
      '    c.name as clientname,'
      '    cn.nomer || '#39' '#39' || cn.name as contract,'
      '    p.name as paymentmode,'
      '    w.name as fuelname,'
      '    w.code as fuelcode,'
      '   i.ei,'
      '   i.volume,'
      '   i.price,'
      'i.density,'
      '   round(volume * density / 1000,3) as mass,'
      '   i.nds, -- '#1089#1090#1072#1074#1082#1072
      '    round(amount * cast(nds as double precision) / '
      '       (100+cast(nds as double precision)), 2) as sumnds,'
      '    amount as whole,'
      '    round(amount - amount * '
      '      cast(nds as double precision) / '
      '     (100+cast(nds as double precision)), 2) as amount0'
      ''
      '   from inoutgsm i'
      '   join sessions s on s.id = i.session_id'
      '   join wares w on w.code=i.ware_code'
      '   join contragents c on c.code=i.client_code'
      '   join contracts cn on cn.partner_code=c.code'
      '   join paymentmodes p on p.code=i.payment_code'
      ''
      
        '      where /*s.startdatetime >= cast(:start_session_t as TIMEST' +
        'AMP)*/'
      '      s.id = :session_id'
      '      and i.azscode=:azscode'
      ''
      '   order by s.startdatetime, i.direction,paymentmode,clientname'
      ')')
    Left = 436
    Top = 197
    ParamData = <
      item
        Name = 'SESSION_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'AZSCODE'
        DataType = ftWideString
        ParamType = ptInput
        Size = 10
      end>
  end
  object QueryInOutItems: TFDQuery
    Connection = DM.FDConnection
    Transaction = TransInOutItems
    UpdateTransaction = TransInOutItems
    FetchOptions.AssignedValues = [evAutoClose]
    FetchOptions.AutoClose = False
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvUpdateMode, uvGeneratorName, uvUpdateNonBaseFields, uvAutoCommitUpdates]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.GeneratorName = 'GEN_INOUTITEMS_ID'
    UpdateOptions.UpdateTableName = 'INOUTITEMS'
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      ''
      'select '
      '   i.id,'
      '    iif( i.direction = 0,'#39#1056#1072#1089#1093#1086#1076#39','#39#1055#1088#1080#1093#1086#1076#39') as dir,'
      '   cast(s.startdatetime as date) as sdate,'
      '    c.name as clientname,'
      '    cn.nomer || '#39' '#39' || cn.name as contract,'
      '    p.name as paymentmode,'
      '    w.name as itemname,'
      '    w.code as itemcode,'
      '    i.amount,'
      '    i.ei,'
      '    i.quantity,'
      '    i.price,'
      '    i.nds,'
      '    round(quantity * price * '
      
        '        cast(nds as double precision) / (100+cast(nds as double ' +
        'precision) ), 2) as sumnds,'
      '    round(quantity * price,2) as whole,'
      '    round(quantity * price '
      '          - quantity * price '
      
        '          * cast(nds as double precision) / (100+cast(nds as dou' +
        'ble precision) ), 2) as summ'
      ''
      '   from inoutitems i'
      '   join sessions s on s.id = i.session_id'
      '   join items w on w.code=i.item_code'
      '   join contragents c on c.code=i.client_code'
      '   join contracts cn on cn.partner_code=c.code'
      '   join paymentmodes p on p.code=i.payment_code'
      ''
      
        '      where /*s.startdatetime >= cast(:start_session_t as TIMEST' +
        'AMP)*/'
      '      s.id = :session_id'
      '      and i.azscode=:azscode'
      '      and i.direction=1'
      ''
      '   order by s.startdatetime, i.direction,paymentmode,clientname')
    Left = 380
    Top = 277
    ParamData = <
      item
        Name = 'SESSION_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'AZSCODE'
        DataType = ftWideString
        ParamType = ptInput
        Size = 10
      end>
    object QueryInOutItemsID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QueryInOutItemsDIR: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'DIR'
      Origin = 'DIR'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 6
    end
    object QueryInOutItemsSDATE: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'SDATE'
      Origin = 'SDATE'
      ProviderFlags = []
      ReadOnly = True
    end
    object QueryInOutItemsCLIENTNAME: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLIENTNAME'
      Origin = 'NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QueryInOutItemsCONTRACT: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONTRACT'
      Origin = 'CONTRACT'
      ProviderFlags = []
      ReadOnly = True
      Size = 229
    end
    object QueryInOutItemsPAYMENTMODE: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'PAYMENTMODE'
      Origin = 'NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QueryInOutItemsITEMNAME: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'ITEMNAME'
      Origin = 'NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QueryInOutItemsITEMCODE: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'ITEMCODE'
      Origin = 'CODE'
      ProviderFlags = []
      ReadOnly = True
      Size = 16
    end
    object QueryInOutItemsAMOUNT: TFloatField
      FieldName = 'AMOUNT'
      Origin = 'AMOUNT'
      Required = True
    end
    object QueryInOutItemsEI: TWideStringField
      FieldName = 'EI'
      Origin = 'EI'
      Required = True
      Size = 10
    end
    object QueryInOutItemsQUANTITY: TIntegerField
      FieldName = 'QUANTITY'
      Origin = 'QUANTITY'
      Required = True
    end
    object QueryInOutItemsPRICE: TFloatField
      FieldName = 'PRICE'
      Origin = 'PRICE'
      Required = True
    end
    object QueryInOutItemsNDS: TWideStringField
      FieldName = 'NDS'
      Origin = 'NDS'
      Required = True
      Size = 10
    end
    object QueryInOutItemsSUMM: TFloatField
      FieldName = 'SUMM'
      Origin = 'SUMM'
      Required = True
    end
    object QueryInOutItemsWHOLE: TFloatField
      FieldName = 'WHOLE'
      Origin = 'WHOLE'
      Required = True
    end
    object QueryInOutItemsSUMNDS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'SUMNDS'
      Origin = 'SUMNDS'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object TransInOutItems: TFDTransaction
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = DM.FDConnection
    Left = 476
    Top = 277
  end
  object DSInOutItems: TJvDataSource
    DataSet = QueryInOutItems
    OnFieldChanged = DSInOutItemsFieldChanged
    Left = 300
    Top = 277
  end
  object QueryInOutItemsSum: TFDQuery
    Connection = DM.FDConnection
    Transaction = TransInOutItems
    UpdateTransaction = TransInOutItems
    FetchOptions.AssignedValues = [evAutoClose]
    FetchOptions.AutoClose = False
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvUpdateMode, uvUpdateNonBaseFields, uvAutoCommitUpdates]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.UpdateTableName = 'INOUTITEMS'
    SQL.Strings = (
      
        'select sum (amount) as amount, sum(summ) as summ, sum(sumnds) as' +
        ' sumnds, sum(whole) as whole from'
      '(select '
      '   i.id,'
      '    iif( i.direction = 0,'#39#1056#1072#1089#1093#1086#1076#39','#39#1055#1088#1080#1093#1086#1076#39') as dir,'
      '   cast(s.startdatetime as date) as sdate,'
      '    c.name as clientname,'
      '    cn.nomer || '#39' '#39' || cn.name as contract,'
      '    p.name as paymentmode,'
      '    w.name as itemname,'
      '    w.code as itemcode,'
      '    i.amount,'
      '    i.ei,'
      '    i.quantity,'
      '    i.price,'
      '    i.nds,'
      '    round(quantity * price * '
      
        '        cast(nds as double precision) / (100+cast(nds as double ' +
        'precision) ), 2) as sumnds,'
      '    round(quantity * price,2) as whole,'
      '    round(quantity * price '
      '          - quantity * price '
      
        '          * cast(nds as double precision) / (100+cast(nds as dou' +
        'ble precision) ), 2) as summ'
      ''
      '   from inoutitems i'
      '   join sessions s on s.id = i.session_id'
      '   join items w on w.code=i.item_code'
      '   join contragents c on c.code=i.client_code'
      '   join contracts cn on cn.partner_code=c.code'
      '   join paymentmodes p on p.code=i.payment_code'
      ''
      
        '      where /*s.startdatetime >= cast(:start_session_t as TIMEST' +
        'AMP)*/'
      '      s.id = :session_id'
      '      and i.azscode=:azscode'
      '      and direction = 1'
      ''
      ')')
    Left = 572
    Top = 277
    ParamData = <
      item
        Name = 'SESSION_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'AZSCODE'
        DataType = ftWideString
        ParamType = ptInput
        Size = 10
      end>
  end
  object QIOIUpdateSQL: TFDUpdateSQL
    Connection = DM.FDConnection
    ModifySQL.Strings = (
      'UPDATE INOUTITEMS'
      'SET AMOUNT = :NEW_AMOUNT, EI = :NEW_EI, PRICE = :NEW_PRICE, '
      
        '  SUMM = :NEW_SUMM, NDS = :NEW_NDS, WHOLE = :NEW_WHOLE, QUANTITY' +
        ' = :NEW_QUANTITY'
      'WHERE ID = :ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, SESSION_ID, TBL, DIRECTION, CLIENT_CODE, CONTRACT_ID,' +
        ' PAYMENT_CODE, '
      '  ITEM_CODE, AMOUNT, EI, PRICE, SUMM, NDS, WHOLE, QUANTITY, '
      '  LASTUSER_ID, UPDATED_AT, STATE, AZSCODE'
      'FROM INOUTITEMS'
      'WHERE ID = :ID')
    Left = 660
    Top = 277
  end
  object InOutUPDSql: TFDUpdateSQL
    Connection = DM.FDConnection
    ModifySQL.Strings = (
      'UPDATE INOUTGSM'
      'SET EI = :NEW_EI, VOLUME = :NEW_VOLUME, DENSITY = :NEW_DENSITY, '
      '  PRICE = :NEW_PRICE, NDS = :NEW_NDS, AMOUNT = :NEW_AMOUNT'
      'WHERE ID = :ID'
      'RETURNING ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, SESSION_ID, TBL, DIRECTION, CLIENT_CODE, CONTRACT_ID,' +
        ' PAYMENT_CODE, '
      '  WARE_CODE, AMOUNT, EI, VOLUME, DENSITY, PRICE, SUMM, NDS, '
      '  WHOLE, LASTUSER_ID, UPDATED_AT, STATE, AZSCODE, TANKNUM'
      'FROM INOUTGSM'
      'WHERE ID = :ID')
    Left = 588
    Top = 197
  end
  object GenQuery: TFDQuery
    Connection = DM.FDConnection
    Transaction = GenTrans
    Left = 44
    Top = 341
  end
  object GenTrans: TFDTransaction
    Connection = DM.FDConnection
    Left = 108
    Top = 333
  end
  object DSOutItems: TJvDataSource
    DataSet = QueryOutItems
    OnActiveChanged = DSOutItemsActiveChanged
    OnFieldChanged = DSOutItemsFieldChanged
    Left = 300
    Top = 333
  end
  object QueryOutItems: TFDQuery
    Connection = DM.FDConnection
    Transaction = TransOutItems
    UpdateTransaction = TransOutItems
    FetchOptions.AssignedValues = [evAutoClose]
    FetchOptions.AutoClose = False
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvUpdateMode, uvGeneratorName, uvUpdateNonBaseFields, uvAutoCommitUpdates]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.GeneratorName = 'GEN_INOUTITEMS_ID'
    UpdateOptions.UpdateTableName = 'INOUTITEMS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = QIOIUpdateSQL
    SQL.Strings = (
      ''
      'select '
      '   i.id,'
      '    iif( i.direction = 0,'#39#1056#1072#1089#1093#1086#1076#39','#39#1055#1088#1080#1093#1086#1076#39') as dir,'
      '   cast(s.startdatetime as date) as sdate,'
      '    c.name as clientname,'
      '    cn.nomer || '#39' '#39' || cn.name as contract,'
      '    p.name as paymentmode,'
      '    w.name as itemname,'
      '    w.code as itemcode,'
      '    i.amount,'
      '    i.ei,'
      '    i.quantity,'
      '    i.price,'
      '    i.nds,'
      '    round(quantity * price * '
      
        '        cast(nds as double precision) / (100+cast(nds as double ' +
        'precision) ), 2) as sumnds,'
      '    round(quantity * price,2) as whole,'
      '    round(quantity * price '
      '          - quantity * price '
      
        '          * cast(nds as double precision) / (100+cast(nds as dou' +
        'ble precision) ), 2) as summ'
      ''
      '   from inoutitems i'
      '   join sessions s on s.id = i.session_id'
      '   join items w on w.code=i.item_code'
      '   join contragents c on c.code=i.client_code'
      '   join contracts cn on cn.partner_code=c.code'
      '   join paymentmodes p on p.code=i.payment_code'
      ''
      
        '      where /*s.startdatetime >= cast(:start_session_t as TIMEST' +
        'AMP)*/'
      '      s.id = :session_id'
      '      and i.azscode=:azscode'
      '      and i.direction=0'
      ''
      '   order by s.startdatetime, i.direction,paymentmode,clientname')
    Left = 380
    Top = 333
    ParamData = <
      item
        Name = 'SESSION_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'AZSCODE'
        DataType = ftWideString
        ParamType = ptInput
        Size = 10
      end>
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object WideStringField1: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'DIR'
      Origin = 'DIR'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 6
    end
    object DateField1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'SDATE'
      Origin = 'SDATE'
      ProviderFlags = []
      ReadOnly = True
    end
    object WideStringField2: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLIENTNAME'
      Origin = 'NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object WideStringField3: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONTRACT'
      Origin = 'CONTRACT'
      ProviderFlags = []
      ReadOnly = True
      Size = 229
    end
    object WideStringField4: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'PAYMENTMODE'
      Origin = 'NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object WideStringField5: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'ITEMNAME'
      Origin = 'NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object WideStringField6: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'ITEMCODE'
      Origin = 'CODE'
      ProviderFlags = []
      ReadOnly = True
      Size = 16
    end
    object FloatField1: TFloatField
      FieldName = 'AMOUNT'
      Origin = 'AMOUNT'
      Required = True
    end
    object WideStringField7: TWideStringField
      FieldName = 'EI'
      Origin = 'EI'
      Required = True
      Size = 10
    end
    object IntegerField2: TIntegerField
      FieldName = 'QUANTITY'
      Origin = 'QUANTITY'
      Required = True
    end
    object FloatField2: TFloatField
      FieldName = 'PRICE'
      Origin = 'PRICE'
      Required = True
    end
    object WideStringField8: TWideStringField
      FieldName = 'NDS'
      Origin = 'NDS'
      Required = True
      Size = 10
    end
    object FloatField3: TFloatField
      FieldName = 'SUMM'
      Origin = 'SUMM'
      Required = True
    end
    object FloatField4: TFloatField
      FieldName = 'WHOLE'
      Origin = 'WHOLE'
      Required = True
    end
    object FloatField5: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'SUMNDS'
      Origin = 'SUMNDS'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object TransOutItems: TFDTransaction
    Options.AutoStart = False
    Options.AutoStop = False
    Connection = DM.FDConnection
    Left = 468
    Top = 333
  end
  object QueryOutItemsSum: TFDQuery
    Connection = DM.FDConnection
    Transaction = TransOutItems
    UpdateTransaction = TransOutItems
    FetchOptions.AssignedValues = [evAutoClose]
    FetchOptions.AutoClose = False
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvUpdateMode, uvUpdateNonBaseFields, uvAutoCommitUpdates]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.UpdateTableName = 'INOUTITEMS'
    SQL.Strings = (
      'select sum (amount) as amount, sum(summ) as summ, '
      '       sum(sumnds) as sumnds, sum(whole) as whole from'
      '(select '
      '   i.id,'
      '    iif( i.direction = 0,'#39#1056#1072#1089#1093#1086#1076#39','#39#1055#1088#1080#1093#1086#1076#39') as dir,'
      '   cast(s.startdatetime as date) as sdate,'
      '    c.name as clientname,'
      '    cn.nomer || '#39' '#39' || cn.name as contract,'
      '    p.name as paymentmode,'
      '    w.name as itemname,'
      '    w.code as itemcode,'
      '    i.amount,'
      '    i.ei,'
      '    i.quantity,'
      '    i.price,'
      '    i.nds,'
      '    round(quantity * price * '
      
        '        cast(nds as double precision) / (100+cast(nds as double ' +
        'precision) ), 2) as sumnds,'
      '    round(quantity * price,2) as whole,'
      '    round(quantity * price '
      '          - quantity * price '
      
        '          * cast(nds as double precision) / (100+cast(nds as dou' +
        'ble precision) ), 2) as summ'
      ''
      '   from inoutitems i'
      '   join sessions s on s.id = i.session_id'
      '   join items w on w.code=i.item_code'
      '   join contragents c on c.code=i.client_code'
      '   join contracts cn on cn.partner_code=c.code'
      '   join paymentmodes p on p.code=i.payment_code'
      ''
      
        '      where /*s.startdatetime >= cast(:start_session_t as TIMEST' +
        'AMP)*/'
      '      s.id = :session_id'
      '      and i.azscode=:azscode'
      '      and direction=0 and payment_code = '#39'01'#1041#1057#1058'0'#39
      ''
      ''
      ')')
    Left = 556
    Top = 333
    ParamData = <
      item
        Name = 'SESSION_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'AZSCODE'
        DataType = ftWideString
        ParamType = ptInput
        Size = 10
      end>
  end
  object QueryOutItemsSum2: TFDQuery
    Connection = DM.FDConnection
    Transaction = TransOutItems
    UpdateTransaction = TransOutItems
    FetchOptions.AssignedValues = [evAutoClose]
    FetchOptions.AutoClose = False
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvUpdateMode, uvUpdateNonBaseFields, uvAutoCommitUpdates]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.UpdateTableName = 'INOUTITEMS'
    SQL.Strings = (
      'select sum (amount) as amount, sum(summ) as summ, '
      '       sum(sumnds) as sumnds, sum(whole) as whole from'
      '(select '
      '   i.id,'
      '    iif( i.direction = 0,'#39#1056#1072#1089#1093#1086#1076#39','#39#1055#1088#1080#1093#1086#1076#39') as dir,'
      '   cast(s.startdatetime as date) as sdate,'
      '    c.name as clientname,'
      '    cn.nomer || '#39' '#39' || cn.name as contract,'
      '    p.name as paymentmode,'
      '    w.name as itemname,'
      '    w.code as itemcode,'
      '    i.amount,'
      '    i.ei,'
      '    i.quantity,'
      '    i.price,'
      '    i.nds,'
      '    round(quantity * price * '
      
        '        cast(nds as double precision) / (100+cast(nds as double ' +
        'precision) ), 2) as sumnds,'
      '    round(quantity * price,2) as whole,'
      '    round(quantity * price '
      '          - quantity * price '
      
        '          * cast(nds as double precision) / (100+cast(nds as dou' +
        'ble precision) ), 2) as summ'
      ''
      '   from inoutitems i'
      '   join sessions s on s.id = i.session_id'
      '   join items w on w.code=i.item_code'
      '   join contragents c on c.code=i.client_code'
      '   join contracts cn on cn.partner_code=c.code'
      '   join paymentmodes p on p.code=i.payment_code'
      ''
      
        '      where /*s.startdatetime >= cast(:start_session_t as TIMEST' +
        'AMP)*/'
      '      s.id = :session_id'
      '      and i.azscode=:azscode'
      '      and direction=0 and payment_code = '#39'02'#1041#1057#1058'0'#39
      ''
      ')')
    Left = 556
    Top = 389
    ParamData = <
      item
        Name = 'SESSION_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'AZSCODE'
        DataType = ftWideString
        ParamType = ptInput
        Size = 10
      end>
  end
  object setprevvolproc: TFDStoredProc
    Connection = DM.FDConnection
    Transaction = GenTrans
    UpdateTransaction = GenUpdTransUPD
    StoredProcName = 'SETPREVVOLUME'
    Left = 188
    Top = 373
  end
end
