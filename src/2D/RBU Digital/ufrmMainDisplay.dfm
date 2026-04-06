object frmMainDisplay: TfrmMainDisplay
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  BorderStyle = bsNone
  Caption = 'ANTI SUB MARINE SYSTEM (BURJA)'
  ClientHeight = 1200
  ClientWidth = 1920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnPaint = FormPaint
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 510
    Height = 1200
    Align = alClient
    BevelOuter = bvNone
    DoubleBuffered = True
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 0
    object pnlLTop: TPanel
      Left = 0
      Top = 0
      Width = 510
      Height = 697
      Align = alTop
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object pnlLTRight: TPanel
        Left = 319
        Top = 1
        Width = 190
        Height = 695
        Align = alRight
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object grpEquipmentStatus: TGroupBox
          Left = 1
          Top = 1
          Width = 188
          Height = 256
          Align = alTop
          Caption = 'Equipment Status'
          Color = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object pnlRRRT: TPanel
            Left = 9
            Top = 20
            Width = 175
            Height = 117
            Color = clBlack
            ParentBackground = False
            TabOrder = 0
            object imgRBUTrainLInRange: TImage
              Left = 138
              Top = 9
              Width = 30
              Height = 20
              Stretch = True
            end
            object imgRBUTrainRInRange: TImage
              Left = 138
              Top = 35
              Width = 30
              Height = 20
              Stretch = True
            end
            object imgRBUElevInRange: TImage
              Left = 138
              Top = 60
              Width = 30
              Height = 20
              Stretch = True
            end
            object imgRBUTargetDetected: TImage
              Left = 138
              Top = 86
              Width = 30
              Height = 20
              Stretch = True
            end
            object edtRBUTrainLInRange: TEdit
              Left = 8
              Top = 8
              Width = 121
              Height = 22
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Text = 'RBU TrainL in Range'
            end
            object edtRBUTrainRInRange: TEdit
              Left = 8
              Top = 34
              Width = 121
              Height = 22
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Text = 'RBU TrainR in Range'
            end
            object edtRBUElevInRange: TEdit
              Left = 8
              Top = 60
              Width = 121
              Height = 22
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              Text = 'RBU Elev. in Range'
            end
            object edtRBUTargetDetected: TEdit
              Left = 8
              Top = 86
              Width = 121
              Height = 22
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              Text = 'Target Detected'
            end
          end
          object pnlPwrRef: TPanel
            Left = 9
            Top = 141
            Width = 175
            Height = 66
            Color = clBlack
            ParentBackground = False
            TabOrder = 1
            object imgPwr: TImage
              Left = 138
              Top = 9
              Width = 30
              Height = 20
              Stretch = True
            end
            object imgRef: TImage
              Left = 138
              Top = 35
              Width = 30
              Height = 20
              Stretch = True
            end
            object edtPwr: TEdit
              Left = 8
              Top = 8
              Width = 121
              Height = 22
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Text = 'Pwr  400 Vac/50Hz'
            end
            object edtRef: TEdit
              Left = 8
              Top = 34
              Width = 121
              Height = 22
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Text = 'Ref  110 Vac/400Hz'
            end
          end
          object pnlVoltRef: TPanel
            Left = 9
            Top = 211
            Width = 175
            Height = 37
            Color = clBlack
            ParentBackground = False
            TabOrder = 2
            object edtVoltRef: TEdit
              Left = 8
              Top = 8
              Width = 65
              Height = 22
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Text = 'Volt Ref :'
            end
            object edtVoltRefValue: TEdit
              Left = 73
              Top = 8
              Width = 88
              Height = 22
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Text = '00000'
            end
          end
        end
        object grpFiringModeRBU: TGroupBox
          Left = 1
          Top = 257
          Width = 188
          Height = 437
          Align = alClient
          Caption = 'Firing Mode RBU'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object pnlSistemBurja: TPanel
            Left = 9
            Top = 25
            Width = 175
            Height = 66
            Color = clBlack
            ParentBackground = False
            TabOrder = 0
            object imgSistemBurjaLama: TImage
              Left = 138
              Top = 9
              Width = 30
              Height = 20
              Stretch = True
            end
            object imgSistemBurjaBaru: TImage
              Left = 138
              Top = 35
              Width = 30
              Height = 20
              Stretch = True
            end
            object edtSistemBurjaLama: TEdit
              Left = 8
              Top = 8
              Width = 121
              Height = 22
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Text = 'SISTEM BURJA LAMA'
            end
            object edtSistemBurjaBaru: TEdit
              Left = 8
              Top = 34
              Width = 121
              Height = 22
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Text = 'SISTEM BURJA BARU'
            end
          end
          object pnlSalvoSelect: TPanel
            Left = 9
            Top = 95
            Width = 175
            Height = 330
            Color = clBlack
            ParentBackground = False
            TabOrder = 1
            object pnlLabelSalvoL: TPanel
              Left = 8
              Top = 15
              Width = 75
              Height = 20
              Caption = 'KIRI'
              TabOrder = 0
            end
            object pnlLabelSalvoR: TPanel
              Left = 93
              Top = 15
              Width = 75
              Height = 20
              Caption = 'KANAN'
              TabOrder = 1
            end
            object btnSalvo12L: TFlatButton
              Tag = 12
              Left = 8
              Top = 290
              Width = 75
              Height = 30
              Color = clYellow
              ColorDown = clLime
              GroupIndex = 1
              Caption = 'SALVO 12'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 2
              OnClick = FiringMode
            end
            object btnSalvo8L: TFlatButton
              Tag = 8
              Left = 8
              Top = 250
              Width = 75
              Height = 30
              Color = clYellow
              ColorDown = clLime
              GroupIndex = 1
              Caption = 'SALVO 8'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 3
              OnClick = FiringMode
            end
            object btnSalvo4L: TFlatButton
              Tag = 4
              Left = 8
              Top = 210
              Width = 75
              Height = 30
              Color = clYellow
              ColorDown = clLime
              GroupIndex = 1
              Caption = 'SALVO 4'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 4
              OnClick = FiringMode
            end
            object btnSingle11L: TFlatButton
              Tag = 11
              Left = 8
              Top = 170
              Width = 75
              Height = 30
              Color = clYellow
              ColorDown = clLime
              GroupIndex = 1
              Caption = 'SINGLE 11'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 5
              OnClick = FiringMode
            end
            object btnSingle6L: TFlatButton
              Tag = 6
              Left = 8
              Top = 130
              Width = 75
              Height = 30
              Color = clYellow
              ColorDown = clLime
              GroupIndex = 1
              Caption = 'SINGLE 6'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 6
              OnClick = FiringMode
            end
            object btnSingle12L: TFlatButton
              Tag = 12
              Left = 8
              Top = 90
              Width = 75
              Height = 30
              Color = clYellow
              ColorDown = clLime
              GroupIndex = 1
              Caption = 'SINGLE 12'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 7
              OnClick = FiringMode
            end
            object btnNoSelectL: TFlatButton
              Left = 8
              Top = 50
              Width = 75
              Height = 30
              Color = clYellow
              ColorDown = clLime
              GroupIndex = 1
              Down = True
              Caption = 'NO SELECT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 8
              OnClick = FiringMode
            end
            object btnNoSelectR: TFlatButton
              Left = 93
              Top = 50
              Width = 75
              Height = 30
              Color = clYellow
              ColorDown = clLime
              GroupIndex = 2
              Down = True
              Caption = 'NO SELECT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 9
              OnClick = FiringMode
            end
            object btnSingle12R: TFlatButton
              Tag = 12
              Left = 93
              Top = 90
              Width = 75
              Height = 30
              Color = clYellow
              ColorDown = clLime
              GroupIndex = 2
              Caption = 'SINGLE 12'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 10
              OnClick = FiringMode
            end
            object btnSingle6R: TFlatButton
              Tag = 6
              Left = 93
              Top = 130
              Width = 75
              Height = 30
              Color = clYellow
              ColorDown = clLime
              GroupIndex = 2
              Caption = 'SINGLE 6'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 11
              OnClick = FiringMode
            end
            object btnSingle11R: TFlatButton
              Tag = 11
              Left = 93
              Top = 170
              Width = 75
              Height = 30
              Color = clYellow
              ColorDown = clLime
              GroupIndex = 2
              Caption = 'SINGLE 11'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 12
              OnClick = FiringMode
            end
            object btnSalvo4R: TFlatButton
              Tag = 4
              Left = 93
              Top = 210
              Width = 75
              Height = 30
              Color = clYellow
              ColorDown = clLime
              GroupIndex = 2
              Caption = 'SALVO 4'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 13
              OnClick = FiringMode
            end
            object btnSalvo8R: TFlatButton
              Tag = 8
              Left = 93
              Top = 250
              Width = 75
              Height = 30
              Color = clYellow
              ColorDown = clLime
              GroupIndex = 2
              Caption = 'SALVO 8'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 14
              OnClick = FiringMode
            end
            object btnSalvo12R: TFlatButton
              Tag = 12
              Left = 93
              Top = 290
              Width = 75
              Height = 30
              Color = clYellow
              ColorDown = clLime
              GroupIndex = 2
              Caption = 'SALVO 12'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 15
              OnClick = FiringMode
            end
          end
        end
      end
      object pnlLTLeft: TPanel
        Left = 1
        Top = 1
        Width = 318
        Height = 695
        Align = alClient
        Color = clBlue
        ParentBackground = False
        TabOrder = 1
        object grpLoadingManual: TGroupBox
          Left = 1
          Top = 77
          Width = 316
          Height = 452
          Align = alTop
          Caption = 'Loading Manual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object pnlLoadingManual: TPanel
            Left = 8
            Top = 20
            Width = 285
            Height = 45
            Color = clBlack
            ParentBackground = False
            TabOrder = 0
            object edtTgtSwap: TEdit
              Left = 16
              Top = 12
              Width = 114
              Height = 22
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Text = 'Trgt. Swap(Sec)'
            end
            object edtTgtSwapValue: TEdit
              Left = 197
              Top = 12
              Width = 80
              Height = 22
              Alignment = taCenter
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Text = '39'
            end
          end
          object pnlTargetDepth: TPanel
            Left = 8
            Top = 70
            Width = 285
            Height = 90
            Color = clBlack
            ParentBackground = False
            TabOrder = 1
            object lbl0: TLabel
              Left = 16
              Top = 69
              Width = 7
              Height = 16
              Caption = '0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl1: TLabel
              Left = 252
              Top = 69
              Width = 21
              Height = 16
              Caption = '500'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl2: TLabel
              Left = 128
              Top = 69
              Width = 34
              Height = 16
              Caption = 'meter'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtTargetDepth: TEdit
              Left = 16
              Top = 12
              Width = 114
              Height = 22
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Text = 'Target Depth'
            end
            object edtTargetDepthValue: TEdit
              Left = 197
              Top = 12
              Width = 80
              Height = 22
              Alignment = taCenter
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Text = '0'
              OnKeyPress = edtTargetDepthValueKeyPress
            end
            object scrlbrTagetDepth: TScrollBar
              Left = 16
              Top = 44
              Width = 257
              Height = 17
              Max = 500
              PageSize = 0
              TabOrder = 2
              OnChange = scrlbrTagetDepthChange
            end
          end
          object pnlShipHeading: TPanel
            Left = 8
            Top = 165
            Width = 285
            Height = 45
            Color = clBlack
            ParentBackground = False
            TabOrder = 2
            object edtShipHeading: TEdit
              Left = 16
              Top = 12
              Width = 90
              Height = 22
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Text = 'Ship Heading'
            end
            object edtShipHeadingValue: TEdit
              Left = 197
              Top = 12
              Width = 80
              Height = 22
              Alignment = taCenter
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Text = '0'
            end
            object btnGYR: TFlatButton
              Left = 116
              Top = 8
              Width = 75
              Height = 30
              Color = clYellow
              ColorDown = clLime
              Caption = 'GYR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 2
              OnClick = btnGYRClick
            end
          end
          object pnlRangeBearing: TPanel
            Left = 8
            Top = 215
            Width = 285
            Height = 230
            Color = clBlack
            ParentBackground = False
            TabOrder = 3
            object lbl3: TLabel
              Left = 16
              Top = 69
              Width = 7
              Height = 16
              Caption = '0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl4: TLabel
              Left = 245
              Top = 69
              Width = 28
              Height = 16
              Caption = '6000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl5: TLabel
              Left = 128
              Top = 69
              Width = 34
              Height = 16
              Caption = 'meter'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl6: TLabel
              Left = 16
              Top = 151
              Width = 26
              Height = 16
              Caption = '-180'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl7: TLabel
              Left = 56
              Top = 151
              Width = 40
              Height = 16
              Caption = 'degree'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl8: TLabel
              Left = 252
              Top = 151
              Width = 21
              Height = 16
              Caption = '180'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl9: TLabel
              Left = 141
              Top = 151
              Width = 7
              Height = 16
              Caption = '0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtTargetRange: TEdit
              Left = 16
              Top = 12
              Width = 114
              Height = 22
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Text = 'Target Range'
            end
            object edtTargetRangeValue: TEdit
              Left = 197
              Top = 12
              Width = 80
              Height = 22
              Alignment = taCenter
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Text = '0'
            end
            object scrlbrTargetRange: TScrollBar
              Left = 16
              Top = 44
              Width = 257
              Height = 17
              Max = 6000
              PageSize = 0
              TabOrder = 2
              OnChange = scrlbrTargetRangeChange
            end
            object edtBearingRelTarget: TEdit
              Left = 16
              Top = 100
              Width = 114
              Height = 22
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              Text = 'Bearing Rel. Target'
            end
            object edtBearingRelTargetVal: TEdit
              Left = 197
              Top = 100
              Width = 80
              Height = 22
              Alignment = taCenter
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
              Text = '0'
            end
            object btnActual: TFlatButton
              Left = 117
              Top = 190
              Width = 75
              Height = 30
              Color = clYellow
              ColorDown = clLime
              Caption = 'ACTUAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 5
              OnClick = btnActualClick
            end
            object btnStandByPos: TFlatButton
              Left = 18
              Top = 191
              Width = 93
              Height = 30
              Color = clMaroon
              ColorDown = clLime
              Caption = 'STANDBY'#13#10' POS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 6
              OnClick = btnStandByPosClick
            end
            object btnExecute: TFlatButton
              Left = 198
              Top = 190
              Width = 75
              Height = 30
              Color = clMaroon
              ColorDown = clLime
              Caption = 'EXECUTE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 7
              OnClick = btnExecuteClick
            end
            object scrlbrBearingRelTarget: TScrollBar
              Left = 16
              Top = 130
              Width = 257
              Height = 17
              Max = 180
              Min = -180
              PageSize = 0
              TabOrder = 8
              OnChange = scrlbrBearingRelTargetChange
            end
          end
        end
        object grpControlMode: TGroupBox
          Left = 1
          Top = 1
          Width = 316
          Height = 76
          Align = alTop
          Caption = 'Control Mode'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object pnlTgtSwap: TPanel
            Left = 8
            Top = 20
            Width = 285
            Height = 45
            Color = clBlack
            ParentBackground = False
            TabOrder = 0
            object btnCmManual: TFlatButton
              Left = 10
              Top = 8
              Width = 100
              Height = 30
              Color = clMaroon
              ColorDown = clLime
              GroupIndex = 1
              Down = True
              Caption = 'MANUAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 0
            end
            object btnCmAuto: TFlatButton
              Left = 157
              Top = 8
              Width = 120
              Height = 30
              Color = clMaroon
              ColorDown = clLime
              GroupIndex = 1
              Caption = 'AUTO '#13#10'NEW TARGET'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 1
            end
          end
        end
        object grpDirectPosisition: TGroupBox
          Left = 1
          Top = 529
          Width = 316
          Height = 165
          Align = alClient
          Caption = 'Direct Posisition'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object pnlDirectPosisition: TPanel
            Left = 8
            Top = 20
            Width = 285
            Height = 133
            Color = clBlack
            ParentBackground = False
            TabOrder = 0
            object lbl10: TLabel
              Left = 10
              Top = 34
              Width = 19
              Height = 16
              Caption = '-90'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl11: TLabel
              Left = 49
              Top = 34
              Width = 47
              Height = 16
              Caption = 'Training'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl12: TLabel
              Left = 107
              Top = 34
              Width = 7
              Height = 16
              Caption = '0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl13: TLabel
              Left = 188
              Top = 34
              Width = 22
              Height = 16
              Caption = '+90'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl14: TLabel
              Left = 10
              Top = 81
              Width = 7
              Height = 16
              Caption = '0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl15: TLabel
              Left = 49
              Top = 81
              Width = 51
              Height = 16
              Caption = 'Elevation'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl17: TLabel
              Left = 188
              Top = 81
              Width = 22
              Height = 16
              Caption = '+50'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtTrainingValue: TEdit
              Left = 212
              Top = 8
              Width = 65
              Height = 22
              Alignment = taCenter
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Text = '0'
            end
            object edtElevationValue: TEdit
              Left = 212
              Top = 55
              Width = 65
              Height = 22
              Alignment = taCenter
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Text = '0'
            end
            object btnTrnElv: TFlatButton
              Left = 98
              Top = 99
              Width = 90
              Height = 30
              Color = clYellow
              ColorDown = clLime
              Caption = 'Trn / Elv'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentColor = False
              TabOrder = 2
              OnClick = btnTrnElvClick
            end
            object trcbrTraining: TVrTrackBar
              Left = 10
              Top = 8
              Width = 200
              Height = 22
              MaxValue = 900
              MinValue = -900
              BorderWidth = 0
              GutterBevel.InnerShadow = clBtnShadow
              GutterBevel.InnerHighlight = clBtnHighlight
              GutterBevel.InnerWidth = 1
              GutterBevel.InnerStyle = bsNone
              GutterBevel.InnerSpace = 0
              GutterBevel.InnerColor = clBtnFace
              GutterBevel.OuterShadow = clBtnShadow
              GutterBevel.OuterHighlight = clBtnHighlight
              GutterBevel.OuterStyle = bsLowered
              GutterBevel.OuterOutline = osNone
              GutterWidth = 1
              GutterColor = clGray
              TickMarks = tmNone
              ScaleOffset = 10
              OnChange = trcbrTrainingChange
              Color = clBtnFace
              ParentColor = False
              TabOrder = 3
            end
            object trcbrElevation: TVrTrackBar
              Left = 10
              Top = 55
              Width = 200
              Height = 22
              MaxValue = 500
              BorderWidth = 0
              GutterBevel.InnerShadow = clBtnShadow
              GutterBevel.InnerHighlight = clBtnHighlight
              GutterBevel.InnerWidth = 1
              GutterBevel.InnerStyle = bsNone
              GutterBevel.InnerSpace = 0
              GutterBevel.InnerColor = clBtnFace
              GutterBevel.OuterShadow = clBtnShadow
              GutterBevel.OuterHighlight = clBtnHighlight
              GutterBevel.OuterStyle = bsLowered
              GutterBevel.OuterOutline = osNone
              GutterWidth = 1
              GutterColor = clGray
              TickMarks = tmNone
              ScaleOffset = 10
              OnChange = trcbrElevationChange
              Color = clBtnFace
              ParentColor = False
              TabOrder = 4
            end
          end
        end
      end
    end
    object pnlLCenter: TPanel
      Left = 0
      Top = 697
      Width = 510
      Height = 210
      Align = alTop
      Color = clBlue
      ParentBackground = False
      TabOrder = 1
      object grpControlRoom: TGroupBox
        Left = 321
        Top = 1
        Width = 188
        Height = 208
        Align = alRight
        Caption = 'Control Room'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object pnlControlRoom: TPanel
          Left = 8
          Top = 20
          Width = 175
          Height = 180
          Color = clBlack
          ParentBackground = False
          TabOrder = 0
          object btnBurya: TFlatButton
            Left = 27
            Top = 12
            Width = 120
            Height = 40
            Color = clMaroon
            ColorDown = clLime
            GroupIndex = 1
            Caption = 'BURYA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ParentColor = False
            TabOrder = 0
          end
          object btnBridge: TFlatButton
            Left = 28
            Top = 100
            Width = 120
            Height = 40
            Color = clMaroon
            ColorDown = clLime
            GroupIndex = 1
            Down = True
            Caption = 'BRIDGE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ParentColor = False
            TabOrder = 1
          end
        end
      end
      object grpRbuCorrection: TGroupBox
        Left = 1
        Top = 1
        Width = 320
        Height = 208
        Align = alClient
        Caption = 'Rbu Correction'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object pnlRbuCorrection: TPanel
          Left = 8
          Top = 20
          Width = 285
          Height = 180
          Color = clBlack
          ParentBackground = False
          TabOrder = 0
          object lbl16: TLabel
            Left = 16
            Top = 69
            Width = 12
            Height = 16
            Caption = '-3'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl18: TLabel
            Left = 266
            Top = 69
            Width = 7
            Height = 16
            Caption = '3'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl19: TLabel
            Left = 141
            Top = 69
            Width = 7
            Height = 16
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl20: TLabel
            Left = 16
            Top = 151
            Width = 12
            Height = 16
            Caption = '-3'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl22: TLabel
            Left = 266
            Top = 151
            Width = 7
            Height = 16
            Caption = '3'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl23: TLabel
            Left = 141
            Top = 151
            Width = 7
            Height = 16
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edtRbuTrngCorrection: TEdit
            Left = 16
            Top = 12
            Width = 120
            Height = 22
            Color = clWhite
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = 'Rbu Trng. Correction'
          end
          object edtRbuTrngCorrectionValue: TEdit
            Left = 197
            Top = 12
            Width = 80
            Height = 22
            Alignment = taCenter
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Text = '0'
          end
          object scrlbrRbuTrngCorrection: TScrollBar
            Left = 16
            Top = 44
            Width = 257
            Height = 17
            Max = 30
            Min = -30
            PageSize = 0
            TabOrder = 2
            OnChange = scrlbrRbuTrngCorrectionChange
          end
          object edtRbuElvCorrection: TEdit
            Left = 16
            Top = 100
            Width = 120
            Height = 22
            Color = clWhite
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            Text = 'Rbu Elv. Correction'
          end
          object edtRbuElvCorrectionValue: TEdit
            Left = 197
            Top = 100
            Width = 80
            Height = 22
            Alignment = taCenter
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            Text = '0'
          end
          object scrlbrRbuElvCorrection: TScrollBar
            Left = 16
            Top = 130
            Width = 257
            Height = 17
            Max = 30
            Min = -30
            PageSize = 0
            TabOrder = 5
            OnChange = scrlbrRbuElvCorrectionChange
          end
        end
      end
    end
    object pnlLBottom: TPanel
      Left = 0
      Top = 907
      Width = 510
      Height = 293
      Align = alClient
      Color = clBlue
      ParentBackground = False
      TabOrder = 2
      object grpUnitSelect: TGroupBox
        Left = 1
        Top = 1
        Width = 320
        Height = 291
        Align = alClient
        Caption = 'Unit Select'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object btnBurjaLama: TFlatButton
          Left = 8
          Top = 30
          Width = 120
          Height = 40
          Color = clYellow
          ColorDown = clLime
          GroupIndex = 1
          Caption = 'BURJA LAMA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentColor = False
          TabOrder = 0
          OnClick = btnUnitSelectClick
        end
        object btnBurjaBaru: TFlatButton
          Left = 173
          Top = 30
          Width = 120
          Height = 40
          Color = clYellow
          ColorDown = clLime
          GroupIndex = 1
          Down = True
          Caption = 'BURJA BARU'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentColor = False
          TabOrder = 1
          OnClick = btnUnitSelectClick
        end
      end
      object grpEndProcess: TGroupBox
        Left = 321
        Top = 1
        Width = 188
        Height = 291
        Align = alRight
        Caption = 'End Process'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object btnExit: TFlatButton
          Left = 36
          Top = 30
          Width = 120
          Height = 40
          Color = clMaroon
          ColorDown = clLime
          Caption = 'E X I T'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentColor = False
          TabOrder = 0
          OnClick = btnExitClick
        end
      end
    end
  end
  object pnlCenter: TPanel
    Left = 510
    Top = 0
    Width = 1040
    Height = 1200
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object imgBackgroundZone: TImage
      Left = 0
      Top = 0
      Width = 1040
      Height = 1200
      Align = alClient
      ExplicitLeft = 640
      ExplicitTop = 312
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
    object FMap: TMap
      Left = 0
      Top = 0
      Width = 1040
      Height = 1200
      ParentColor = False
      Align = alClient
      TabOrder = 0
      OnMouseDown = FMapMouseDown
      OnDrawUserLayer = FMapDrawUserLayer
      ExplicitTop = 1000
      ExplicitHeight = 1041
      ControlData = {
        8A1A06007D6B0000067C0000010000000F0000FF0D47656F44696374696F6E61
        727905456D70747900E8030000000000000000000002000E001E000000000000
        0000000000000000000000000000000000000000000600010000000000500001
        010000640000000001F4010000050000800C000000000000000000000000FFFF
        FF000100000000000000000000000000000000000000000000000352E30B918F
        CE119DE300AA004BB851010000009001A0BB0D0005417269616C000352E30B91
        8FCE119DE300AA004BB851010000009001348C030005417269616C0000000000
        00000000000000000000000000000000000000000000000000000000000000FF
        FFFF000000000000000001370000000000FFFFFF000000000000000352E30B91
        8FCE119DE300AA004BB851010000009001DC7C010005417269616C000352E30B
        918FCE119DE300AA004BB851010200009001A42C02000B4D61702053796D626F
        6C730000000000000001000100FFFFFF000200FFFFFF00000000000001000000
        0100011801000040C76A2A0100000079FA45761C000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000002
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        8076C000000000008056C0000000000080764000000000008056400100000018
        01000040C76A2A010000006E0064001C00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000200000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000058E7970008
        E3970005FA457658E3970000040000F0E29700810AE624000000000000000000
        000088B3400000000000408F400001000001}
    end
    object pnlTCP_PCOM: TPanel
      Left = 8
      Top = 9
      Width = 210
      Height = 41
      BevelOuter = bvNone
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clBlack
      ParentBackground = False
      TabOrder = 1
      object imgTCP_PCOM: TImage
        Left = 8
        Top = 9
        Width = 20
        Height = 20
        Stretch = True
      end
      object lbl21: TLabel
        Left = 33
        Top = 12
        Width = 73
        Height = 14
        Caption = 'TCP_PCOM : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblTCP_PCOMStatus: TLabel
        Left = 111
        Top = 12
        Width = 69
        Height = 13
        Caption = 'not connected'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object edtDate: TEdit
      Left = 880
      Top = 1149
      Width = 60
      Height = 22
      TabStop = False
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = 'DATE  : '
    end
    object edtDateValue: TEdit
      Left = 940
      Top = 1149
      Width = 100
      Height = 22
      TabStop = False
      Alignment = taCenter
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object edtTime: TEdit
      Left = 880
      Top = 1171
      Width = 60
      Height = 22
      TabStop = False
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      Text = 'TIME  : '
    end
    object edtTimeValue: TEdit
      Left = 940
      Top = 1171
      Width = 100
      Height = 22
      TabStop = False
      Alignment = taCenter
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object pnlStatusBalistik: TPanel
      Left = 965
      Top = 21
      Width = 75
      Height = 21
      Caption = 'NO BALSTK'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
    end
    object pnlStatusTarget: TPanel
      Left = 965
      Top = 0
      Width = 75
      Height = 21
      Caption = 'NO TRGT'
      Color = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
    end
  end
  object pnlRight: TPanel
    Left = 1550
    Top = 0
    Width = 370
    Height = 1200
    Align = alRight
    BevelOuter = bvNone
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    object pnlR1: TPanel
      Left = 0
      Top = 0
      Width = 370
      Height = 185
      Align = alTop
      TabOrder = 0
      object pnlR1L: TPanel
        Left = 1
        Top = 1
        Width = 183
        Height = 183
        Align = alLeft
        Color = clBlue
        ParentBackground = False
        TabOrder = 0
        object imgTrainingBg: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object imgTrainingNdl: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object edtLblTraining: TEdit
          Left = 0
          Top = 0
          Width = 75
          Height = 22
          TabStop = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'Training'
        end
        object edtValTrainingRelative: TEdit
          Left = 133
          Top = 0
          Width = 50
          Height = 22
          TabStop = False
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '-3.15'
        end
        object edtValTrainingTrue: TEdit
          Left = 133
          Top = 161
          Width = 50
          Height = 22
          TabStop = False
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = '356.85'
        end
      end
      object pnlR1R: TPanel
        Left = 186
        Top = 1
        Width = 183
        Height = 183
        Align = alRight
        Color = clBlue
        ParentBackground = False
        TabOrder = 1
        object imgElevationBg: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object imgElevationNdl: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object edtLblElevation: TEdit
          Left = 0
          Top = 0
          Width = 75
          Height = 22
          TabStop = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'Elevation'
        end
        object edtValElevation: TEdit
          Left = 133
          Top = 0
          Width = 50
          Height = 22
          TabStop = False
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '10.2'
        end
      end
    end
    object pnlR2: TPanel
      Left = 0
      Top = 185
      Width = 370
      Height = 185
      Align = alTop
      TabOrder = 1
      object pnlR2L: TPanel
        Left = 1
        Top = 1
        Width = 183
        Height = 183
        Align = alLeft
        Color = clBlack
        ParentBackground = False
        TabOrder = 0
        object imgRangeTrgtBg: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object imgRangeTrgtNdl: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object edtLblRangeTrgt: TEdit
          Left = 0
          Top = 0
          Width = 75
          Height = 22
          TabStop = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'Range Trgt'
        end
        object edtValRangeTrgt: TEdit
          Left = 133
          Top = 0
          Width = 50
          Height = 22
          TabStop = False
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
      end
      object pnlR2R: TPanel
        Left = 186
        Top = 1
        Width = 183
        Height = 183
        Align = alRight
        Color = clBlack
        ParentBackground = False
        TabOrder = 1
        object imgBrngTrgtBG: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object edtLblBrngTrgt: TEdit
          Left = 0
          Top = 0
          Width = 75
          Height = 22
          TabStop = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'Brng Trgt'
        end
        object edtValBrngTrgt: TEdit
          Left = 133
          Top = 0
          Width = 50
          Height = 22
          TabStop = False
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '0.1'
        end
        object edtValBrngTrgt1: TEdit
          Left = 133
          Top = 161
          Width = 50
          Height = 22
          TabStop = False
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = '0.1'
        end
      end
    end
    object pnlR3: TPanel
      Left = 0
      Top = 370
      Width = 370
      Height = 185
      Align = alTop
      TabOrder = 2
      object pnlR3L: TPanel
        Left = 1
        Top = 1
        Width = 183
        Height = 183
        Align = alLeft
        Color = clBlack
        ParentBackground = False
        TabOrder = 0
        object imgHdngShpBg: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object edtLblHdngShp: TEdit
          Left = 0
          Top = 0
          Width = 75
          Height = 22
          TabStop = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'Hdng Shp'
        end
        object edtLblHdngTrgt: TEdit
          Left = 0
          Top = 161
          Width = 75
          Height = 22
          TabStop = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = 'Hdng Trgt'
        end
        object edtValHdngShp: TEdit
          Left = 133
          Top = 0
          Width = 50
          Height = 22
          TabStop = False
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = '0.1'
        end
        object edtValHdngTrgt: TEdit
          Left = 133
          Top = 161
          Width = 50
          Height = 22
          TabStop = False
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '0.2'
        end
      end
      object pnlR3R: TPanel
        Left = 186
        Top = 1
        Width = 183
        Height = 183
        Align = alRight
        Color = clBlack
        ParentBackground = False
        TabOrder = 1
        object imgBrngTrgt2Bg: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object imgBrngTrgt2Ndl: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object edtLblBrngTrgt2: TEdit
          Left = 0
          Top = 0
          Width = 75
          Height = 22
          TabStop = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'Brng Trgt'
        end
        object edtValBrngTrgt2: TEdit
          Left = 133
          Top = 0
          Width = 50
          Height = 22
          TabStop = False
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '0.1'
        end
      end
    end
    object pnlR4: TPanel
      Left = 0
      Top = 555
      Width = 370
      Height = 185
      Align = alTop
      TabOrder = 3
      object pnlR4L: TPanel
        Left = 1
        Top = 1
        Width = 183
        Height = 183
        Align = alLeft
        Color = clBlack
        ParentBackground = False
        TabOrder = 0
        object imgShpTrgtBg: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object imgShpTrgtNdl: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object edtLblShpTrgt: TEdit
          Left = 0
          Top = 0
          Width = 75
          Height = 22
          TabStop = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'Shp Trgt'
        end
        object edtValShpTrgt: TEdit
          Left = 133
          Top = 0
          Width = 50
          Height = 22
          TabStop = False
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
      end
      object pnlR4R: TPanel
        Left = 186
        Top = 1
        Width = 183
        Height = 183
        Align = alRight
        Color = clBlack
        ParentBackground = False
        TabOrder = 1
        object imgTrgtShpBg: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object imgTrgtShpNdl: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object edtLblTrgtShp: TEdit
          Left = 0
          Top = 0
          Width = 75
          Height = 22
          TabStop = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'Trgt Shp'
        end
        object edtValTrgtShp: TEdit
          Left = 133
          Top = 0
          Width = 50
          Height = 22
          TabStop = False
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '180'
        end
      end
    end
    object pnlR5: TPanel
      Left = 0
      Top = 740
      Width = 370
      Height = 185
      Align = alTop
      TabOrder = 4
      object pnlR5L: TPanel
        Left = 1
        Top = 1
        Width = 183
        Height = 183
        Align = alLeft
        Color = clGray
        ParentBackground = False
        TabOrder = 0
        object imgShpSpeedBg: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object imgShpSpeedNdl: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object edtLblShpSpeed: TEdit
          Left = 0
          Top = 0
          Width = 75
          Height = 22
          TabStop = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'Shp Speed'
        end
        object edtValShpSpeed: TEdit
          Left = 133
          Top = 0
          Width = 50
          Height = 22
          TabStop = False
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
      end
      object pnlR5R: TPanel
        Left = 186
        Top = 1
        Width = 183
        Height = 183
        Align = alRight
        Color = clGray
        ParentBackground = False
        TabOrder = 1
        object imgTrgtSpeedBg: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object imgTrgtSpeedNdl: TImage
          Left = 17
          Top = 17
          Width = 148
          Height = 148
          Stretch = True
        end
        object edtLblTrgtSpeed: TEdit
          Left = 0
          Top = 0
          Width = 75
          Height = 22
          TabStop = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'Trgt Speed'
        end
        object edtValTrgtSpeed: TEdit
          Left = 133
          Top = 0
          Width = 50
          Height = 22
          TabStop = False
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
      end
    end
    object pnlRBottom: TPanel
      Left = 0
      Top = 925
      Width = 370
      Height = 275
      Align = alClient
      Color = clBlue
      ParentBackground = False
      TabOrder = 5
      object edtTrgtRange: TEdit
        Left = 0
        Top = 0
        Width = 92
        Height = 22
        TabStop = False
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = 'Trgt. Range'
      end
      object edtTrgtRangeValue: TEdit
        Left = 92
        Top = 0
        Width = 92
        Height = 22
        TabStop = False
        Alignment = taCenter
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '0'
      end
      object edtTrgtBearing: TEdit
        Left = 185
        Top = 0
        Width = 92
        Height = 22
        TabStop = False
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = 'Trgt. Bearing'
      end
      object edtTrgtBearingValue: TEdit
        Left = 277
        Top = 0
        Width = 92
        Height = 22
        TabStop = False
        Alignment = taCenter
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = '0'
      end
      object edtTimeProjectile: TEdit
        Left = 0
        Top = 22
        Width = 92
        Height = 22
        TabStop = False
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = 'Time Pojectile'
      end
      object edtTimeProjectileValue: TEdit
        Left = 92
        Top = 22
        Width = 92
        Height = 22
        TabStop = False
        Alignment = taCenter
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = '0'
      end
      object edtTrgtDepth: TEdit
        Left = 185
        Top = 22
        Width = 92
        Height = 22
        TabStop = False
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Text = 'Trgt. Depth'
      end
      object edtTrgtDepthValue: TEdit
        Left = 277
        Top = 22
        Width = 92
        Height = 22
        TabStop = False
        Alignment = taCenter
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        Text = '0'
      end
      object edtWindSpeed: TEdit
        Left = 0
        Top = 44
        Width = 92
        Height = 22
        TabStop = False
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Text = 'Wind Speed'
      end
      object edtWindSpeedValue: TEdit
        Left = 92
        Top = 44
        Width = 92
        Height = 22
        TabStop = False
        Alignment = taCenter
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        Text = '0'
      end
      object edtWindDirect: TEdit
        Left = 185
        Top = 44
        Width = 92
        Height = 22
        TabStop = False
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        Text = 'Wind Direct'
      end
      object edtWindDirectValue: TEdit
        Left = 277
        Top = 44
        Width = 92
        Height = 22
        TabStop = False
        Alignment = taCenter
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
        Text = '0'
      end
    end
  end
  object ilLed: TImageList
    Height = 32
    Width = 32
    Left = 638
    Top = 112
    Bitmap = {
      494C010104000C00040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000004000000001002000000000000080
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
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
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
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
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
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
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
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
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
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
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
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000058585800505050004949
      4900434343003C3C3C0039393900373737003636360035353500343434003434
      3400343434003434340034343400343434003434340034343400343434003434
      34003434340034343400353535003636360037373700393939003C3C3C004343
      4300494949005050500058585800000000000000000058585800505050004949
      4900434343003C3C3C0039393900373737003636360035353500343434003434
      3400343434003434340034343400343434003434340034343400343434003434
      34003434340034343400353535003636360037373700393939003C3C3C004343
      4300494949005050500058585800000000000000000058585800505050004949
      4900434343003C3C3C0039393900373737003636360035353500343434003434
      3400343434003434340034343400343434003434340034343400343434003434
      34003434340034343400353535003636360037373700393939003C3C3C004343
      430049494900505050005858580000000000000000FF58585800505050004949
      4900434343003C3C3C0039393900373737003636360035353500343434003434
      3400343434003434340034343400343434003434340034343400343434003434
      34003434340034343400353535003636360037373700393939003C3C3C004343
      4300494949005050500058585800000000FF000000004F4F4F00434444003B3B
      3B003B3B3B003B3B3B003B3B3B003B3B3A003B3B3B003B3B3B003B3B3B003B3A
      3B003B3B3A003B3B3B003B3B3B003B3A3B003B3B3A003B3B3B003B3A3B003A3B
      3B003A3B3B003A3B3B003B3B3B003B3B3B003B3B3B003A3A3B003A3B3B003B3B
      3B003B3B3B00434343004F4F4F0000000000000000004F4F4F003A5934001E80
      08001A8802001A8702001A8702001A8702001A8702001A8702001A8702001A87
      02001A8702001A8702001A8702001A8702001A8702001A8703001A8702001A87
      02001A8702001A8702001A8702001A8702001A8702001A870200198702001A87
      02001E8008003A5A33004F4F4F0000000000000000004F4F4F00356573000FA7
      D2000AB2E2000AB2E2000AB2E2000AB1E2000AB2E2000AB2E2000BB2E2000AB1
      E2000AB2E2000AB2E2000AB2E2000AB1E2000AB2E2000AB2E2000AB1E2000AB2
      E20009B2E20009B2E2000AB2E2000AB2E2000AB2E20009B1E20009B2E2000AB2
      E2000FA6D200356675004F4F4F0000000000000000FF4F4F4F00363565000F0D
      A6000A08B1000A08B1000A07B1000A07B1000A07B1000A08B1000A07B1000A07
      B1000A07B1000A07B1000A08B1000A07B1000A07B1000A07B1000A07B1000A07
      B1000B09B1000A07B1000A07B1000A08B1000A08B1000A07B1000A07B1000A08
      B1000F0DA600353466004F4F4F00000000FF000000004F4F4F00434444003B3B
      3B003B3B3B003B3B3B003B3B3B003B3B3A003B3B3B003B3B3B003B3B3B003B3A
      3B003B3B3A003B3B3B003B3B3B003B3A3B003B3B3A003B3B3B003B3A3B003A3B
      3B003A3B3B003A3B3B003B3B3B003B3B3B003B3B3B003A3A3B003A3B3B003B3B
      3B003B3B3B00434343004F4F4F0000000000000000004F4F4F003A5934001E80
      08001A8802001A8702001A8702001A8702001A8702001A8702001A8702001A87
      02001A8702001A8702001A8702001A8702001A8702001A8703001A8702001A87
      02001A8702001A8702001A8702001A8702001A8702001A870200198702001A87
      02001E8008003A5A33004F4F4F0000000000000000004F4F4F00356573000FA7
      D2000AB2E2000AB2E2000AB2E2000AB1E2000AB2E2000AB2E2000BB2E2000AB1
      E2000AB2E2000AB2E2000AB2E2000AB1E2000AB2E2000AB2E2000AB1E2000AB2
      E20009B2E20009B2E2000AB2E2000AB2E2000AB2E20009B1E20009B2E2000AB2
      E2000FA6D200356675004F4F4F0000000000000000FF4F4F4F00363565000F0D
      A6000A08B1000A08B1000A07B1000A07B1000A07B1000A08B1000A07B1000A07
      B1000A07B1000A07B1000A08B1000A07B1000A07B1000A07B1000A07B1000A07
      B1000B09B1000A07B1000A07B1000A08B1000A08B1000A07B1000A07B1000A08
      B1000F0DA600353466004F4F4F00000000FF00000000494949003D3D3D003D3D
      3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D
      3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D
      3D003D3D3D003D3D3D003D3D3D003E3D3D003E3D3D003D3D3D003D3D3D003D3D
      3D003D3D3D003D3D3D00494949000000000000000000494949001E7F09001A87
      02001A8702001A8702001A8702001A8702001A870200198702001A8702001A87
      02001A8702001A8702001A8702001A8702001A8702001A8702001A8702001A87
      02001A870200198702001A8702001A8702001A8702001A8702001A8702001A87
      0200198702001E7F09004949490000000000000000004949490010A4CF000AB2
      E2000AB2E20009B1E2000AB2E2000AB2E2000AB2E20009B1E2000AB1E2000DAA
      D7000AB1E1000AB1E2000AB2E2000AB2E2000AB2E2000AB2E20009B2E20009B2
      E2000AB1E20009B1E2000AB2E2000AB2E2000AB2E2000AB2E2000AB2E2000AB2
      E20009B2E20010A4CF004949490000000000000000FF49494900100EA4000A07
      B1000A07B1000A07B1000A07B1000A07B1000A07B1000A07B1000A07B1000A07
      B1000A07B0000A07B1000A07B1000A07B1000A07B1000A07B1000A07B1000D0B
      A9000A07B1000A07B1000A07B1000A08B1000A07B1000A07B1000A07B1000A07
      B1000A07B100100EA40049494900000000FF0000000043434300404040004040
      400040404000403F4000403F400040404000404040003F404000404040003F40
      40004040400040404000404040004040400040403F00404040003F4040004040
      4000403F4000403F40004040400040404000404040004040400040403F003F40
      400040403F004040400043434300000000000000000043434300238C1400228B
      1400228C1400228B1400228B1400228C1500228C1400228B1500228B1400228C
      1400228B1400238B1400228C1500228C1400238B1400228C1400228B1400238B
      1400228B1400228B1400238C1400228B1400228B1500228C1400228B1400228C
      1400228C1400238B1500434343000000000000000000434343001BB5E3001BB5
      E3001BB5E4001BB4E4001BB4E3001BB5E4001BB5E3001BB5E4001BB5E3001BB5
      E3001BB5E3001BB5E3001BB5E4001BB5E3001CB5E3001BB5E3001BB5E4001BB5
      E3001BB4E4001BB4E3001CB5E3001BB5E4001BB5E4001BB5E3001BB5E3001BB5
      E4001BB5E3001BB5E4004343430000000000000000FF43434300181CB500171B
      B500171BB500171BB500171BB500171BB600171BB500171BB600171BB500171C
      B500171BB500171BB500171CB600171CB500181BB500171CB500171BB500181B
      B500171BB500171BB500181BB500171BB500171BB600171BB500171BB500171B
      B500171BB500181BB60043434300000000FF000000003D3D3D00434343004343
      4300434443004343430043434300434343004343430043434300434343004343
      4300434343004343430043434300434343004443430043434300434343004343
      4300434443004343430043434300434443004344430043434300434343004343
      430043434300434343003D3D3D0000000000000000003D3D3D002B9122002B91
      22002C9122002C9123002C9122002C9122002C9122002B9122002B9122002C90
      22002C9122002C9122002C9122002B9022002C9122002B9123002C9023002B91
      22002B9122002B9122002B9122002B9123002C9122002B9023002B9123002C91
      22002B9022002C9022003D3D3D0000000000000000003D3D3D0029B9E50029B9
      E50029BAE50029B9E60029B9E50029B9E50029B9E50029B9E50029B9E50029B9
      E50029B9E50029B9E50029B9E50029B9E5002AB9E50029B9E60029B9E60029B9
      E50029BAE50029B9E50029B9E50029BAE50029B9E50029B9E50029B9E50029B9
      E50029B9E50029B9E5003D3D3D0000000000000000FF3D3D3D00242CBA00242B
      BA00242CBA00242CBB00242BBB00242BBA00242BBA00242CBB00242BBA00242B
      BA00242BBA00242BBA00242CBA00242BBA00242BBA00242BBB00242BBB00242B
      BA00242CBA00242BBB00242BBA00242CBB00242CBB00242BBB00242BBB00242C
      BA00242BBA00242BBA003D3D3D00000000FF000000003D3D3D00434343004343
      4300434443004343430043434300434343004343430043434300434343004343
      4300434343004343430043434300434343004443430043434300434343004343
      4300434443004343430043434300434443004344430043434300434343004343
      430043434300434343003D3D3D0000000000000000003D3D3D002B9122002B91
      22002C9122002C9123002C9122002C9122002C9122002B9122002B9122002C90
      22002C9122002C9122002C9122002B9022002C9122002B9123002C9023002B91
      22002B9122002B9122002B9122002B9123002C9122002B9023002B9123002C91
      22002B9022002C9022003D3D3D0000000000000000003D3D3D0029B9E50029B9
      E50029BAE50029B9E60029B9E50029B9E50029B9E50029B9E50029B9E50029B9
      E50029B9E50029B9E50029B9E50029B9E5002AB9E50029B9E60029B9E60029B9
      E50029BAE50029B9E50029B9E50029BAE50029B9E50029B9E50029B9E50029B9
      E50029B9E50029B9E5003D3D3D0000000000000000FF3D3D3D00242CBA00242B
      BA00242CBA00242CBB00242BBB00242BBA00242BBA00242CBB00242BBA00242B
      BA00242BBA00242BBA00242CBA00242BBA00242BBA00242BBB00242BBB00242B
      BA00242CBA00242BBB00242BBA00242CBB00242CBB00242BBB00242BBB00242C
      BA00242BBA00242BBA003D3D3D00000000FF0000000039393900474646004747
      4600464746004646470046474600464746004647460046464700464647004747
      4600464646004746470047474600474747004746460046464700464647004647
      4700474646004646470047474700474746004746470047474700464646004647
      460046474600474646003939390000000000000000003939390036972F003698
      2F0035972F0035972F0035972F0035982F0036982F0035973000359730003697
      2F0035972F003697300036982F003698300036972F003597300035972F003598
      300036972F0035972F003698300036982F0036972F003698300035972F003597
      2F0035972F0036972F003939390000000000000000003939390036BEE70036BE
      E70036BEE70036BEE80036BEE70036BEE70036BEE70036BEE80036BEE80036BE
      E70036BEE70036BEE80036BEE70036BEE80036BEE70036BEE80036BEE70036BE
      E80036BEE70035BEE70036BEE80036BFE70036BEE70036BEE80036BEE70036BE
      E70036BEE70036BEE7003939390000000000000000FF39393900313AC000313B
      C000313BC000313AC100313BC000313BC000313BC000313AC100313AC100323B
      C000313AC000313AC100313BC000313BC100323AC000313AC100313AC100313B
      C100323AC000313AC100313BC100323BC000323AC100323BC100313AC000313A
      C000313AC000323AC00039393900000000FF00000000393939004A4A4A004A4A
      4A004A4A4B004A4A4A004A4A4B004A4A4A004A4B4A004B4A4A004A4A4A004B4A
      4A004A4A4A004A4A4A004A4A4B004A4A4A004A4A4A004A4A4B004A4A4A004A4A
      4B004B4B4B004A4A4A004B4A4A004A4B4A004A4A4A004A4A4A004A4B4A004B4A
      4A004A4B4A004A4A4A0039393900000000000000000039393900409E3B00409F
      3C00409F3C00409F3C00409E3C00409F3C00409F3C00419E3B00409E3C00419F
      3C00409E3C00409E3C00409E3C00409E3C00409F3C00409F3C00409E3C00409F
      3C00419F3C00409E3C00419E3C00409F3C00409F3B00409E3C00409F3C00419E
      3C00409F3C00409E3B003939390000000000000000003939390042C3E90042C4
      EA0042C4EA0042C4E90042C3EA0042C4EA0042C4EA0043C3E90042C3EA0043C4
      EA0042C3EA0042C3EA0042C3EA0042C3EA0042C4EA0042C4EA0042C3EA0042C4
      EA0042C4EA0042C3E90043C3E90042C4EA0042C4E90042C4E90042C4EA0043C3
      EA0042C4EA0042C3E9003939390000000000000000FF393939003F49C7003F49
      C8003F49C8003F49C7003F49C8003F49C7003F4AC7004049C7003F49C700404A
      C8003F49C7003F49C8003F49C8003F49C7003F49C7003F4AC8003F49C7003F49
      C800404AC8003F49C7004049C7003F4AC7003F49C7003F49C7003F4AC8004049
      C8003F4AC7003F49C70039393900000000FF00000000383838004E4E4E004E4E
      4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E
      4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E
      4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004D4E4E004E4E
      4E004E4E4E004E4E4E00383838000000000000000000383838004BA749004BA7
      48004CA748004CA749004CA749004CA748004CA749004BA749004BA749004BA6
      49004CA748004CA749004CA749004BA749004CA748004BA749004CA649004BA7
      49004BA749004BA749004BA749004BA749004CA749004BA649004BA749004CA7
      49004BA649004CA74800383838000000000000000000383838004DCAEC004ECA
      EC004ECAEC004ECAED004ECAEC004ECAEC004ECAEC004ECAEC004ECAEC004EC9
      EC004ECAEC004ECAEC004ECAEC004ECAEC004ECAEC004ECAED004ECAED004ECA
      EC004ECAEC004DCAEC004ECAEC004ECAED004ECAEC004DCAED004DCAED004ECA
      EC004ECAEC004ECAEC003838380000000000000000FF383838004D59CF004E58
      CE004E59CE004E59CF004E58CF004E58CE004E58CF004E59CF004D58CF004E58
      CF004E58CE004E58CF004E59CF004E58CF004E58CE004E59CF004E58CF004D58
      CF004D59CF004D59CF004E59CF004E59CF004E59CF004D58CF004D58CF004E59
      CF004E58CF004E58CE0038383800000000FF00000000383838004E4E4E004E4E
      4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E
      4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E
      4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004D4E4E004E4E
      4E004E4E4E004E4E4E00383838000000000000000000383838004BA749004BA7
      48004CA748004CA749004CA749004CA748004CA749004BA749004BA749004BA6
      49004CA748004CA749004CA749004BA749004CA748004BA749004CA649004BA7
      49004BA749004BA749004BA749004BA749004CA749004BA649004BA749004CA7
      49004BA649004CA74800383838000000000000000000383838004DCAEC004ECA
      EC004ECAEC004ECAED004ECAEC004ECAEC004ECAEC004ECAEC004ECAEC004EC9
      EC004ECAEC004ECAEC004ECAEC004ECAEC004ECAEC004ECAED004ECAED004ECA
      EC004ECAEC004DCAEC004ECAEC004ECAED004ECAEC004DCAED004DCAED004ECA
      EC004ECAEC004ECAEC003838380000000000000000FF383838004D59CF004E58
      CE004E59CE004E59CF004E58CF004E58CE004E58CF004E59CF004D58CF004E58
      CF004E58CE004E58CF004E59CF004E58CF004E58CE004E59CF004E58CF004D58
      CF004D59CF004D59CF004E59CF004E59CF004E59CF004D58CF004D58CF004E59
      CF004E58CF004E58CE0038383800000000FF0000000039393900525251005252
      5100525252005151520052525100515252005252510051515200515252005252
      5100515151005251520052525200525252005252510051525200515252005152
      5200525152005151520052525200525252005252520052525200515251005152
      510051525100525151003939390000000000000000003939390057AF550057B0
      550057B0550057AF550057B0550057B0550057B0550057AF550057AF550057B0
      550057AF550057AF550057B0550057B0550058AF550057AF560057AF550057B0
      560057AF550057AF550057B0560058B0550058B0550058B0560057AF550057B0
      550057B0550057AF55003939390000000000000000003939390059D0EF0059D1
      EF0059D1EF0059D0EF0059D1EF0059D1EF0059D1EF0059D0EF0059D0EF0059D1
      EF0059D0EF0059D0EF0059D1EF0059D1EF005AD0EF0059D0EF0059D0EF0059D1
      EF005AD0EF0059D0EF0059D1EF005AD1EF005AD0EF005AD1EF0059D0EF0059D0
      EF0059D0EF005AD0EF003939390000000000000000FF393939005D67D5005D68
      D5005D67D6005C67D6005D67D6005C67D6005D68D5005C67D6005C67D6005D67
      D6005C67D5005D67D6005D68D6005D68D6005D67D5005C67D6005C67D6005C68
      D6005D67D6005C67D6005D68D6005D68D6005D67D6005D68D6005C67D6005D67
      D6005C67D6005D67D60039393900000000FF0000000039393900555555005555
      5600555556005555550055555600555555005556550056555500555555005656
      5500555555005555550056555600555555005555550055565600555555005555
      5600565656005555550056555500555655005555550055555500555656005655
      560055565500555555003939390000000000000000003939390063B8620063B9
      620063B9620063B9620063B8620063B9620063B9620064B8620063B8620064B9
      620063B8620063B8620063B8620063B8620063B9620063B9620063B8620063B9
      620063B9620063B8620064B8620063B9620063B9610063B8620063B9620064B8
      620063B9620063B862003939390000000000000000003939390067D8F20067D9
      F30066D9F30066D9F20067D8F30066D9F20066D9F20067D8F20066D8F20067D9
      F20066D8F20066D8F20067D8F30066D8F20066D8F20066D9F30066D8F20067D9
      F30067D9F30067D8F20067D8F20066D9F20067D8F20066D8F20066D9F30067D8
      F30066D9F20066D8F2003939390000000000000000FF393939006F79DE006F79
      DF006F79DF006F79DE006F79DF006F79DF006F7ADF007079DE006F79DE00707A
      DF006F79DF006F79DF007079DF006F79DF006F79DE006F7ADF006F79DF006F79
      DF00707ADF006F79DE007079DE006F7ADF006F79DE006F79DE006F7ADF007079
      DF006F7ADF006F79DE0039393900000000FF000000003D3D3D00595859005958
      5800585958005959590059595900595859005958590059595800595858005959
      5800595858005858590059585900585958005859590059585900595859005959
      5800595858005859580058595800595958005958580058585900585858005959
      590059585800585859003D3D3D0000000000000000003D3D3D006FC26F006FC2
      6F006FC26F006FC26F006FC26F006FC26F006FC26F006FC26E006FC26E006FC2
      6E0070C26E006FC26F006FC26F006FC26E006FC26F006FC26F006FC26F006FC2
      6E0070C16E006FC26E006FC26E006FC26E006FC26E006FC26F006FC26E006FC2
      6F006FC26E006FC26F003D3D3D0000000000000000003D3D3D007CE6F8007CE6
      F8007BE6F8007CE6F8007CE6F8007CE6F8007BE6F8007CE7F7007CE6F7007CE7
      F7007CE6F7007BE6F8007CE6F8007BE7F7007BE7F8007BE6F8007CE6F8007CE6
      F7007CE6F7007BE6F7007BE6F7007CE6F8007CE6F7007BE6F8007BE6F7007BE7
      F8007CE6F7007BE6F8003D3D3D0000000000000000FF3D3D3D008F97ED008F97
      ED008F97ED008F97ED008F97ED008F97ED008F97ED008F97EC008F97EC008F97
      EC008F97EC008E96ED008F97ED008F97EC008E97ED008F97ED008F96ED008F97
      EC008F96EC008F97EC008E97EC008F97EC008F97EC008E97ED008E97EC008F97
      ED008F97EC008E97ED003D3D3D00000000FF000000003D3D3D00595859005958
      5800585958005959590059595900595859005958590059595800595858005959
      5800595858005858590059585900585958005859590059585900595859005959
      5800595858005859580058595800595958005958580058585900585858005959
      590059585800585859003D3D3D0000000000000000003D3D3D006FC26F006FC2
      6F006FC26F006FC26F006FC26F006FC26F006FC26F006FC26E006FC26E006FC2
      6E0070C26E006FC26F006FC26F006FC26E006FC26F006FC26F006FC26F006FC2
      6E0070C16E006FC26E006FC26E006FC26E006FC26E006FC26F006FC26E006FC2
      6F006FC26E006FC26F003D3D3D0000000000000000003D3D3D007CE6F8007CE6
      F8007BE6F8007CE6F8007CE6F8007CE6F8007BE6F8007CE7F7007CE6F7007CE7
      F7007CE6F7007BE6F8007CE6F8007BE7F7007BE7F8007BE6F8007CE6F8007CE6
      F7007CE6F7007BE6F7007BE6F7007CE6F8007CE6F7007BE6F8007BE6F7007BE7
      F8007CE6F7007BE6F8003D3D3D0000000000000000FF3D3D3D008F97ED008F97
      ED008F97ED008F97ED008F97ED008F97ED008F97ED008F97EC008F97EC008F97
      EC008F97EC008E96ED008F97ED008F97EC008E97ED008F97ED008F96ED008F97
      EC008F96EC008F97EC008E97EC008F97EC008F97EC008E97ED008E97EC008F97
      ED008F97EC008E97ED003D3D3D00000000FF00000000434343005B5B5B005C5C
      5B005C5C5C005C5B5C005C5C5B005B5C5B005B5C5B005C5B5C005B5B5C005B5C
      5B005C5B5B005B5B5C005C5C5C005C5C5C005C5B5B005B5C5C005B5B5C005C5C
      5C005B5B5B005B5B5C005C5C5C005B5C5B005B5C5C005B5C5C005C5C5B005C5C
      5B005B5C5B005B5B5B00434343000000000000000000434343009DE69D009DE6
      9D009DE69E009DE59E009DE69E009DE69E009DE69D009DE69E009DE69E009DE6
      9D009DE69D009DE69E009DE69E009DE69E009DE69D009DE69E009DE69E009DE6
      9E009DE69E009DE59E009DE69E009DE69E009DE69E009DE69E009DE69D009DE6
      9E009DE69D009DE59D00434343000000000000000000434343008CF2FC008DF2
      FC008DF2FC008DF1FC008DF2FC008CF2FC008CF2FC008DF2FC008CF2FC008CF2
      FC008DF2FC008CF2FC008CF2FC008CF2FC008DF2FC008CF2FC008CF2FC008DF2
      FC008CF2FC008CF1FC008DF2FC008CF2FC008CF2FC008CF2FC008DF2FC008DF2
      FC008CF2FC008CF1FC004343430000000000000000FF43434300AAB0F700AAB0
      F700AAB0F800AAAFF800AAB0F700AAB0F800AAB0F700AAAFF800AAB0F800AAB0
      F700AAAFF700AAB0F800AAB0F800AAB0F800AAB0F700AAB0F800AAB0F800AAB0
      F800AAAFF800AAAFF800AAB0F800AAB0F800A9B0F800AAB0F800AAB0F700AAB0
      F800A9B0F700AAAFF70043434300000000FF00000000494949005A5A5A005E5E
      5E005E5E5E005E5E5E005E5E5E005E5E5E005E5F5E005E5E5E005E5E5E005E5E
      5E005E5E5E005E5E5E005E5E5E005E5E5E005E5E5E005E5E5F005E5E5E005E5E
      5E005E5F5F005E5E5E005E5E5E005F5F5E005E5E5E005E5E5E005E5E5E005E5E
      5E005E5E5E005B5A5A0049494900000000000000000049494900AEE9AF00BDFF
      BE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFF
      BE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFF
      BE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFF
      BE00BDFFBE00AEE9AF00494949000000000000000000494949008EE4E90098FA
      FF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FA
      FF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FA
      FF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FA
      FF0098FAFF008EE4E9004949490000000000000000FF49494900AEB2E900BDC1
      FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1
      FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1
      FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1
      FF00BDC1FF00AEB2E90049494900000000FF000000004F4F4F004E4E4E005D5D
      5D00606060006060600060606000606060006060600060606000606060006060
      600060605F00606060006060600060605F006060600060606000606060006060
      5F0060606000606060006060600060606000606060005F606000606060006060
      60005D5D5D004E4E4E004F4F4F0000000000000000004F4F4F00687B6900B0EC
      B100BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFF
      BE00BDFFBD00BDFFBE00BDFFBE00BDFFBD00BDFFBE00BDFFBE00BDFFBE00BDFF
      BD00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFF
      BE00B0ECB100697C6A004F4F4F0000000000000000004F4F4F005E7A7B008FE7
      EC0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FA
      FF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FA
      FF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FA
      FF008FE7EC005F7B7C004F4F4F0000000000000000FF4F4F4F0068697B00B0B4
      EC00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1
      FF00BDC1FE00BDC1FF00BDC1FF00BDC1FE00BDC1FF00BDC1FF00BDC1FF00BDC1
      FE00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1
      FF00B0B4EC00696A7C004F4F4F00000000FF000000004F4F4F004E4E4E005D5D
      5D00606060006060600060606000606060006060600060606000606060006060
      600060605F00606060006060600060605F006060600060606000606060006060
      5F0060606000606060006060600060606000606060005F606000606060006060
      60005D5D5D004E4E4E004F4F4F0000000000000000004F4F4F00687B6900B0EC
      B100BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFF
      BE00BDFFBD00BDFFBE00BDFFBE00BDFFBD00BDFFBE00BDFFBE00BDFFBE00BDFF
      BD00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFFBE00BDFF
      BE00B0ECB100697C6A004F4F4F0000000000000000004F4F4F005E7A7B008FE7
      EC0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FA
      FF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FA
      FF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FAFF0098FA
      FF008FE7EC005F7B7C004F4F4F0000000000000000FF4F4F4F0068697B00B0B4
      EC00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1
      FF00BDC1FE00BDC1FF00BDC1FF00BDC1FE00BDC1FF00BDC1FF00BDC1FF00BDC1
      FE00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1FF00BDC1
      FF00B0B4EC00696A7C004F4F4F00000000FF0000000058585800505050004949
      4900434343003C3C3C0039393900373737003636360035353500343434003434
      3400343434003434340034343400343434003434340034343400343434003434
      34003434340034343400353535003636360037373700393939003C3C3C004343
      4300494949005050500058585800000000000000000058585800505050004949
      4900434343003C3C3C0039393900373737003636360035353500343434003434
      3400343434003434340034343400343434003434340034343400343434003434
      34003434340034343400353535003636360037373700393939003C3C3C004343
      4300494949005050500058585800000000000000000058585800505050004949
      4900434343003C3C3C0039393900373737003636360035353500343434003434
      3400343434003434340034343400343434003434340034343400343434003434
      34003434340034343400353535003636360037373700393939003C3C3C004343
      430049494900505050005858580000000000000000FF58585800505050004949
      4900434343003C3C3C0039393900373737003636360035353500343434003434
      3400343434003434340034343400343434003434340034343400343434003434
      34003434340034343400353535003636360037373700393939003C3C3C004343
      4300494949005050500058585800000000FF0000000000000000000000000000
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
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
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
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
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
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
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
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
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
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
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
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF424D3E000000000000003E000000
      2800000080000000400000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80000001800000018000000180000001
      8000000180000001800000018000000180000001800000018000000180000001
      8000000180000001800000018000000180000001800000018000000180000001
      8000000180000001800000018000000180000001800000018000000180000001
      8000000180000001800000018000000180000001800000018000000180000001
      8000000180000001800000018000000180000001800000018000000180000001
      8000000180000001800000018000000180000001800000018000000180000001
      8000000180000001800000018000000180000001800000018000000180000001
      8000000180000001800000018000000180000001800000018000000180000001
      8000000180000001800000018000000180000001800000018000000180000001
      80000001800000018000000180000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object tmrRotate: TTimer
    OnTimer = tmrRotateTimer
    Left = 1478
    Top = 952
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 1422
    Top = 952
  end
end
