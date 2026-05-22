object frmMainFCC: TfrmMainFCC
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FCC'
  ClientHeight = 1024
  ClientWidth = 1280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 28
    Top = 235
    Width = 39
    Height = 16
    Caption = 'Radar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label16: TLabel
    Left = 132
    Top = 235
    Width = 24
    Height = 16
    Caption = '----'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnlRevise: TPanel
    Left = 1068
    Top = 626
    Width = 212
    Height = 351
    ParentBackground = False
    TabOrder = 10
    object lblReviseBE: TLabel
      Left = 11
      Top = 53
      Width = 17
      Height = 18
      Caption = 'BE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblReviseEL: TLabel
      Left = 11
      Top = 109
      Width = 15
      Height = 18
      Caption = 'EL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblReviseELsat: TLabel
      Left = 174
      Top = 109
      Width = 34
      Height = 18
      Caption = 'mrad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblReviseBEsat: TLabel
      Left = 174
      Top = 53
      Width = 34
      Height = 18
      Caption = 'mrad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pnlReviseHeader: TPanel
      Left = 1
      Top = 1
      Width = 210
      Height = 28
      Align = alTop
      Caption = 'Revise'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object edtReviseBEVal: TEdit
      Left = 83
      Top = 50
      Width = 90
      Height = 24
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0.00'
    end
    object dtReviseELVal: TEdit
      Left = 83
      Top = 106
      Width = 90
      Height = 24
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '0.00'
    end
  end
  object pnlDiagnosis: TPanel
    Left = 642
    Top = 485
    Width = 638
    Height = 491
    ParentBackground = False
    TabOrder = 8
    object lblTVVideo: TLabel
      Left = 16
      Top = 48
      Width = 59
      Height = 18
      Caption = 'TV Video'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblIRVideo: TLabel
      Left = 16
      Top = 93
      Width = 55
      Height = 18
      Caption = 'IR Video'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblLRPumpPower: TLabel
      Left = 216
      Top = 48
      Width = 107
      Height = 18
      Caption = 'LR Pump&&power'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblLRPrecombust: TLabel
      Left = 216
      Top = 93
      Width = 98
      Height = 18
      Caption = 'LR Precombust'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDC801: TLabel
      Left = 424
      Top = 48
      Width = 88
      Height = 18
      Caption = 'DC80V/20A-1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDC802: TLabel
      Left = 424
      Top = 93
      Width = 88
      Height = 18
      Caption = 'DC80V/20A-2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblTVTrackBoard: TLabel
      Left = 16
      Top = 137
      Width = 94
      Height = 18
      Caption = 'TVTrackBoard'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblIRTrackBoard: TLabel
      Left = 16
      Top = 182
      Width = 90
      Height = 18
      Caption = 'IRTrackBoard'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblLRDischarge: TLabel
      Left = 216
      Top = 182
      Width = 84
      Height = 18
      Caption = 'LR Discharge'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblLRCharge: TLabel
      Left = 216
      Top = 137
      Width = 67
      Height = 18
      Caption = 'LR Charge'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblTVState: TLabel
      Left = 424
      Top = 182
      Width = 53
      Height = 18
      Caption = 'TVState'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDC8010A: TLabel
      Left = 424
      Top = 137
      Width = 75
      Height = 18
      Caption = 'DC80V/10A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblServoBoard: TLabel
      Left = 16
      Top = 227
      Width = 96
      Height = 18
      Caption = 'Servo CtlBoard'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblBEDriveBoard: TLabel
      Left = 16
      Top = 272
      Width = 88
      Height = 18
      Caption = 'BEDriveBoard'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblELDriveBoard: TLabel
      Left = 16
      Top = 316
      Width = 81
      Height = 18
      Caption = 'ElDriveBoard'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblAC26V: TLabel
      Left = 16
      Top = 361
      Width = 43
      Height = 18
      Caption = 'AC26V'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblLRNoLight: TLabel
      Left = 216
      Top = 227
      Width = 74
      Height = 18
      Caption = 'LR No Light'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblBEGyro: TLabel
      Left = 216
      Top = 272
      Width = 53
      Height = 18
      Caption = 'BE Gyro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblELGyro: TLabel
      Left = 216
      Top = 316
      Width = 51
      Height = 18
      Caption = 'EL Gyro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDC28V13A: TLabel
      Left = 216
      Top = 361
      Width = 75
      Height = 18
      Caption = 'DC28V/13A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblIRState: TLabel
      Left = 424
      Top = 227
      Width = 49
      Height = 18
      Caption = 'IRState'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblLRState: TLabel
      Left = 424
      Top = 272
      Width = 50
      Height = 18
      Caption = 'LRState'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSVState: TLabel
      Left = 424
      Top = 316
      Width = 51
      Height = 18
      Caption = 'SVState'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pnlDiagnosisHeader: TPanel
      Left = 1
      Top = 1
      Width = 636
      Height = 28
      Align = alTop
      Caption = 'DIAGNOSIS'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object edtTVVideoVal: TEdit
      Left = 134
      Top = 45
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = 'normal'
    end
    object Edit2: TEdit
      Left = 134
      Top = 90
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = 'normal'
    end
    object Edit3: TEdit
      Left = 334
      Top = 45
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = 'normal'
    end
    object Edit4: TEdit
      Left = 334
      Top = 90
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = 'normal'
    end
    object Edit5: TEdit
      Left = 542
      Top = 45
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = 'normal'
    end
    object Edit6: TEdit
      Left = 542
      Top = 90
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      Text = 'normal'
    end
    object Edit1: TEdit
      Left = 134
      Top = 134
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Text = 'normal'
    end
    object Edit7: TEdit
      Left = 134
      Top = 179
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      Text = 'normal'
    end
    object Edit8: TEdit
      Left = 334
      Top = 134
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
      Text = 'normal'
    end
    object Edit9: TEdit
      Left = 334
      Top = 179
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
      Text = 'normal'
    end
    object Edit10: TEdit
      Left = 542
      Top = 134
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
      Text = 'normal'
    end
    object Edit11: TEdit
      Left = 542
      Top = 179
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
      Text = 'normal'
    end
    object Edit13: TEdit
      Left = 134
      Top = 358
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
      Text = 'normal'
    end
    object Edit14: TEdit
      Left = 134
      Top = 313
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 14
      Text = 'normal'
    end
    object Edit15: TEdit
      Left = 134
      Top = 269
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
      Text = 'normal'
    end
    object Edit16: TEdit
      Left = 134
      Top = 224
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 16
      Text = 'normal'
    end
    object Edit17: TEdit
      Left = 334
      Top = 358
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
      Text = 'normal'
    end
    object Edit18: TEdit
      Left = 334
      Top = 313
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 18
      Text = 'normal'
    end
    object Edit19: TEdit
      Left = 334
      Top = 269
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 19
      Text = 'normal'
    end
    object Edit20: TEdit
      Left = 334
      Top = 224
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 20
      Text = 'normal'
    end
    object Edit22: TEdit
      Left = 542
      Top = 313
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 21
      Text = 'normal'
    end
    object Edit23: TEdit
      Left = 542
      Top = 269
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 22
      Text = 'normal'
    end
    object Edit24: TEdit
      Left = 542
      Top = 224
      Width = 70
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 23
      Text = 'normal'
    end
  end
  object pnlUpper: TPanel
    Left = 0
    Top = 0
    Width = 1280
    Height = 1027
    TabOrder = 0
    object pnlViewer3DTV: TPanel
      Left = 0
      Top = 0
      Width = 640
      Height = 480
      BevelOuter = bvNone
      Caption = 'pnlViewer3DTV'
      Color = clBlack
      ParentBackground = False
      TabOrder = 0
      object Shape1: TShape
        Left = 325
        Top = 0
        Width = 1
        Height = 501
        Pen.Color = clWhite
        Visible = False
      end
      object Shape2: TShape
        Left = 0
        Top = 251
        Width = 649
        Height = 1
        Pen.Color = clWhite
        Visible = False
      end
      object pnlViewerTV: TPanel
        Left = 0
        Top = 448
        Width = 640
        Height = 32
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object lblValBearTop: TPanel
          Left = 185
          Top = 0
          Width = 176
          Height = 32
          Align = alClient
          BevelOuter = bvNone
          Caption = 'BE 000.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Consolas'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object lblValElevTop: TPanel
          Left = 361
          Top = 0
          Width = 279
          Height = 32
          Align = alRight
          BevelOuter = bvNone
          Caption = 'EL 0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Consolas'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object lblValRangeTop: TPanel
          Left = 0
          Top = 0
          Width = 185
          Height = 32
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'R 00000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Consolas'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object pnlViewer3DIR: TPanel
      Left = 640
      Top = 0
      Width = 640
      Height = 480
      BevelOuter = bvNone
      Caption = 'pnlViewer3D'
      Color = clBlack
      ParentBackground = False
      TabOrder = 1
      object Shape3: TShape
        Left = 325
        Top = 0
        Width = 1
        Height = 501
        Pen.Color = clWhite
        Visible = False
      end
      object Shape4: TShape
        Left = 0
        Top = 251
        Width = 649
        Height = 1
        Pen.Color = clWhite
        Visible = False
      end
    end
  end
  object pnlEOData: TPanel
    Left = 642
    Top = 626
    Width = 213
    Height = 351
    ParentBackground = False
    TabOrder = 2
    object lblEODistance: TLabel
      Left = 7
      Top = 120
      Width = 55
      Height = 18
      Caption = 'Distance'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblBEDif: TLabel
      Left = 7
      Top = 176
      Width = 39
      Height = 18
      Caption = 'BE Dif'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblELDif: TLabel
      Left = 7
      Top = 232
      Width = 37
      Height = 18
      Caption = 'EL Dif'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblEODistancesat: TLabel
      Left = 176
      Top = 120
      Width = 13
      Height = 18
      Caption = 'm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblBEDifsat: TLabel
      Left = 176
      Top = 176
      Width = 34
      Height = 18
      Caption = 'mrad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblELDifsat: TLabel
      Left = 176
      Top = 232
      Width = 34
      Height = 18
      Caption = 'mrad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pnlHeaderEOData: TPanel
      Left = 1
      Top = 1
      Width = 211
      Height = 28
      Align = alTop
      Caption = 'EO DATA'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object edtEODistanceVal: TEdit
      Left = 79
      Top = 117
      Width = 97
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '00000'
    end
    object edtBEDifVal: TEdit
      Left = 79
      Top = 173
      Width = 97
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '00.00'
    end
    object edtELDifVal: TEdit
      Left = 79
      Top = 229
      Width = 97
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = '00.00'
    end
  end
  object pnlState: TPanel
    Left = 642
    Top = 484
    Width = 638
    Height = 143
    ParentBackground = False
    TabOrder = 1
    object lblCtlMode: TLabel
      Left = 16
      Top = 48
      Width = 52
      Height = 18
      Caption = 'CtlMode'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblWorkMode: TLabel
      Left = 16
      Top = 96
      Width = 70
      Height = 18
      Caption = 'WorkMode'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblWorkState: TLabel
      Left = 216
      Top = 48
      Width = 68
      Height = 18
      Caption = 'WorkState'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblTrackState: TLabel
      Left = 216
      Top = 96
      Width = 71
      Height = 18
      Caption = 'TrackState'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblEOState: TLabel
      Left = 424
      Top = 48
      Width = 53
      Height = 18
      Caption = 'EOState'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCtlState: TLabel
      Left = 424
      Top = 96
      Width = 50
      Height = 18
      Caption = 'CtlState'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pnlStateHeader: TPanel
      Left = 1
      Top = 1
      Width = 636
      Height = 28
      Align = alTop
      Caption = 'STATE'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object edtCtlModeVal: TEdit
      Left = 88
      Top = 45
      Width = 105
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = 'Local'
    end
    object edtWorkModeVal: TEdit
      Left = 88
      Top = 93
      Width = 105
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = 'Combat'
    end
    object edtWorkStateVal: TEdit
      Left = 288
      Top = 45
      Width = 105
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = 'Wait'
    end
    object edtTrackStateVal: TEdit
      Left = 288
      Top = 93
      Width = 105
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = 'Lost'
    end
    object edtEOStateVal: TEdit
      Left = 496
      Top = 45
      Width = 105
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = 'Normal'
    end
    object edtCtlStateVal: TEdit
      Left = 496
      Top = 93
      Width = 105
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      Text = 'None'
    end
  end
  object pnlBearElev: TPanel
    Left = 0
    Top = 484
    Width = 640
    Height = 478
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 3
    object vrAngularElev: TVrAngularMeter
      Left = 219
      Top = 1
      Width = 443
      Height = 408
      MaxValue = 90.000000000000000000
      MinValue = -90.000000000000000000
      Decimals = 0
      Angle = 180
      AngleOffset = 180
      Spacing = 30
      Ticks = 180
      TicksMin = 1
      TicksMax = 3
      TicksEnlarge = 5
      ColorZone1 = clLime
      ColorZone2 = clRed
      ColorZone3 = clSkyBlue
      Percent1 = 50
      Percent2 = 50
      Labels = 0
      LabelsOffset = 15
      NeedleBaseWidth = 1
      NeedleColor = clWhite
      CenterDotWidth = 1
      LabelsFont.Charset = DEFAULT_CHARSET
      LabelsFont.Color = clWhite
      LabelsFont.Height = -11
      LabelsFont.Name = 'Tahoma'
      LabelsFont.Style = []
      Caption = '|VrAngularMeter|1000 X'
      Color = clNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object vrAngularBearing: TVrAngularMeter
      Left = -18
      Top = 2
      Width = 442
      Height = 408
      MaxValue = 180.000000000000000000
      MinValue = -180.000000000000000000
      Decimals = 0
      Angle = 0
      AngleOffset = 360
      Spacing = 30
      Ticks = 360
      TicksMin = 1
      TicksMax = 4
      TicksEnlarge = 5
      ColorZone1 = clRed
      ColorZone2 = clLime
      ColorZone3 = clSkyBlue
      Percent1 = 50
      Percent2 = 50
      Labels = 12
      LabelsOffset = 15
      NeedleBaseWidth = 1
      NeedleColor = clWhite
      CenterDotWidth = 1
      LabelsFont.Charset = DEFAULT_CHARSET
      LabelsFont.Color = clWhite
      LabelsFont.Height = -11
      LabelsFont.Name = 'Tahoma'
      LabelsFont.Style = []
      Caption = '|VrAngularMeter|1000 X'
      Color = clNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lineBearHor: TShape
      Left = 28
      Top = 205
      Width = 350
      Height = 1
      Pen.Color = clWhite
    end
    object lineBearVer: TShape
      Left = 203
      Top = 30
      Width = 1
      Height = 350
      Pen.Color = clWhite
    end
    object lineElevHor: TShape
      Left = 440
      Top = 205
      Width = 175
      Height = 1
      Pen.Color = clWhite
    end
    object lineElevVer: TShape
      Left = 440
      Top = 30
      Width = 1
      Height = 350
      Pen.Color = clWhite
    end
    object pnlValBearElev: TPanel
      Left = 0
      Top = 437
      Width = 640
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'pnlValBearElev'
      TabOrder = 0
      object pnlValBearingBottom: TPanel
        Left = 0
        Top = 0
        Width = 361
        Height = 41
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'BE:     0.00 deg'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object pnlValElevBottom: TPanel
        Left = 361
        Top = 0
        Width = 279
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        Caption = 'EL:    0.00 deg'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object lbl0: TPanel
      Left = 612
      Top = 189
      Width = 25
      Height = 33
      AutoSize = True
      BevelOuter = bvNone
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object lblMin30: TPanel
      Left = 595
      Top = 286
      Width = 25
      Height = 33
      AutoSize = True
      BevelOuter = bvNone
      Caption = '-30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object lbl90: TPanel
      Left = 426
      Top = -2
      Width = 25
      Height = 33
      AutoSize = True
      BevelOuter = bvNone
      Caption = '90'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object lbl60: TPanel
      Left = 524
      Top = 24
      Width = 25
      Height = 33
      AutoSize = True
      BevelOuter = bvNone
      Caption = '60'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object lbl30: TPanel
      Left = 596
      Top = 98
      Width = 25
      Height = 33
      AutoSize = True
      BevelOuter = bvNone
      Caption = '30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object lblMin90: TPanel
      Left = 427
      Top = 375
      Width = 25
      Height = 33
      AutoSize = True
      BevelOuter = bvNone
      Caption = '-90'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object lblMin60: TPanel
      Left = 526
      Top = 354
      Width = 25
      Height = 33
      AutoSize = True
      BevelOuter = bvNone
      Caption = '-60'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
  end
  object pnlControl: TPanel
    Left = 0
    Top = 960
    Width = 640
    Height = 64
    ParentBackground = False
    TabOrder = 4
    object Image2: TImage
      Left = 579
      Top = 27
      Width = 36
      Height = 36
    end
    object lblControlTrack: TLabel
      Left = 8
      Top = 36
      Width = 37
      Height = 18
      Caption = 'Track'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblControlAction: TLabel
      Left = 192
      Top = 36
      Width = 39
      Height = 18
      Caption = 'Action'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblControlSensor: TLabel
      Left = 382
      Top = 36
      Width = 44
      Height = 18
      Caption = 'Sensor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pnlControlHeader: TPanel
      Left = 1
      Top = 1
      Width = 638
      Height = 28
      Align = alTop
      Caption = 'CONTROL'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object edtControlTrackVal: TEdit
      Left = 80
      Top = 35
      Width = 97
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = 'Auto'
    end
    object edtControlActionVal: TEdit
      Left = 264
      Top = 35
      Width = 97
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = 'None'
    end
    object edtControlSensorVal: TEdit
      Left = 454
      Top = 35
      Width = 97
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = 'TV'
    end
  end
  object pnlNavData: TPanel
    Left = 855
    Top = 626
    Width = 213
    Height = 351
    ParentBackground = False
    TabOrder = 5
    object Label11: TLabel
      Left = 10
      Top = 120
      Width = 45
      Height = 18
      Caption = 'Course'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNavPitch: TLabel
      Left = 10
      Top = 176
      Width = 30
      Height = 18
      Caption = 'Pitch'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNavRoll: TLabel
      Left = 10
      Top = 232
      Width = 21
      Height = 18
      Caption = 'Roll'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNavState: TLabel
      Left = 16
      Top = 64
      Width = 34
      Height = 18
      Caption = 'State'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object imgNavState: TImage
      Left = 95
      Top = 53
      Width = 36
      Height = 36
    end
    object lblNavRollsat: TLabel
      Left = 180
      Top = 232
      Width = 24
      Height = 18
      Caption = 'deg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNavPitchsat: TLabel
      Left = 180
      Top = 176
      Width = 24
      Height = 18
      Caption = 'deg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNavCoursesat: TLabel
      Left = 180
      Top = 120
      Width = 24
      Height = 18
      Caption = 'deg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pnlNavDataHeader: TPanel
      Left = 1
      Top = 1
      Width = 211
      Height = 28
      Align = alTop
      Caption = 'NAV DATA'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object edtNavCourseVal: TEdit
      Left = 82
      Top = 117
      Width = 97
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '000.00'
    end
    object edtNavPitchVal: TEdit
      Left = 82
      Top = 173
      Width = 97
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '000.00'
    end
    object edtNavRollVal: TEdit
      Left = 82
      Top = 229
      Width = 97
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = '000.00'
    end
  end
  object pnlInformation: TPanel
    Left = 641
    Top = 977
    Width = 639
    Height = 49
    ParentBackground = False
    TabOrder = 7
    object lblDateNow: TLabel
      Left = 41
      Top = 13
      Width = 92
      Height = 22
      Caption = '2026/12/31'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblTimeNow: TLabel
      Left = 497
      Top = 13
      Width = 72
      Height = 22
      Caption = '12:30:30'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlSetIndication: TPanel
    Left = 1068
    Top = 626
    Width = 212
    Height = 351
    ParentBackground = False
    TabOrder = 9
    object lblSetIndRange: TLabel
      Left = 11
      Top = 120
      Width = 9
      Height = 18
      Caption = 'R'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSetIndBE: TLabel
      Left = 11
      Top = 176
      Width = 17
      Height = 18
      Caption = 'BE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSetIndEL: TLabel
      Left = 11
      Top = 232
      Width = 15
      Height = 18
      Caption = 'EL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSetINDType: TLabel
      Left = 11
      Top = 64
      Width = 34
      Height = 18
      Caption = 'Type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSetIndELsat: TLabel
      Left = 182
      Top = 232
      Width = 24
      Height = 18
      Caption = 'deg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSetIndBEsat: TLabel
      Left = 182
      Top = 176
      Width = 24
      Height = 18
      Caption = 'deg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSetIndRangesat: TLabel
      Left = 182
      Top = 120
      Width = 13
      Height = 18
      Caption = 'm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblTypeInd: TLabel
      Left = 11
      Top = 280
      Width = 128
      Height = 36
      Caption = 'Type 1: IndicationA'#13#10'Type 2: IndicationB'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pnlSetIndicationHeader: TPanel
      Left = 1
      Top = 1
      Width = 210
      Height = 28
      Align = alTop
      Caption = 'Set Indication'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object edtSetIndRangeVal: TEdit
      Left = 83
      Top = 117
      Width = 97
      Height = 24
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object edtSetIndBEVal: TEdit
      Left = 83
      Top = 173
      Width = 97
      Height = 24
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '0.00'
    end
    object edtSetIndELVal: TEdit
      Left = 83
      Top = 229
      Width = 97
      Height = 24
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '0.00'
    end
    object edtSetIndTypeVal: TEdit
      Left = 83
      Top = 61
      Width = 97
      Height = 24
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '0'
    end
  end
  object pnlIndication: TPanel
    Left = 1068
    Top = 626
    Width = 212
    Height = 351
    ParentBackground = False
    TabOrder = 6
    object lblIndDistance: TLabel
      Left = 11
      Top = 120
      Width = 55
      Height = 18
      Caption = 'Distance'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblIndAzimuth: TLabel
      Left = 11
      Top = 176
      Width = 52
      Height = 18
      Caption = 'Azimuth'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblIndElev: TLabel
      Left = 11
      Top = 232
      Width = 57
      Height = 18
      Caption = 'Elevation'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblIndType: TLabel
      Left = 11
      Top = 64
      Width = 34
      Height = 18
      Caption = 'Type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblIndElevsat: TLabel
      Left = 182
      Top = 232
      Width = 24
      Height = 18
      Caption = 'deg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblIndAzimuthsat: TLabel
      Left = 182
      Top = 176
      Width = 24
      Height = 18
      Caption = 'deg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblIndDistancesat: TLabel
      Left = 182
      Top = 120
      Width = 13
      Height = 18
      Caption = 'm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pnlIndicationHeader: TPanel
      Left = 1
      Top = 1
      Width = 210
      Height = 28
      Align = alTop
      Caption = 'INDICATION'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object edtIndDistanceVal: TEdit
      Left = 83
      Top = 117
      Width = 97
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '00000'
    end
    object edtIndAzimuthVal: TEdit
      Left = 83
      Top = 173
      Width = 97
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '000.00'
    end
    object edtIndElevVal: TEdit
      Left = 83
      Top = 229
      Width = 97
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = '000.00'
    end
    object edtIndTypeVal: TEdit
      Left = 83
      Top = 61
      Width = 97
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = 'None'
    end
  end
  object tmrUpdateShipPos: TTimer
    Interval = 500
    OnTimer = UpdatePosition
    Left = 808
    Top = 384
  end
  object tmrUpdateForm: TTimer
    OnTimer = tmrUpdateFormTimer
    Left = 737
    Top = 409
  end
  object imgListLight: TImageList
    Left = 881
    Top = 393
    Bitmap = {
      494C010107001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000032C0370031AF34003AC13F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000516B9800485F95005A72990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005D99850056928300659A890000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000029BC2A0021711C00266520000775000026642000286C24003BB43D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000415AA2000A10980000009500000095000000910011168F0054689B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004F9D8D00278688002085890000987700208084002F7D800062968B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000027C7
      2B00246F20000C8A02000E9200000E9200000E8E00000A820000265F20003BB3
      3D00000000000000000000000000000000000000000000000000000000003F59
      AD000000A0000000AC000000B4000000B3000000AE000000A00000008D005368
      9B00000000000000000000000000000000000000000000000000000000004AAA
      980020919B0000B49A0000B99C0000B7970000B18F0000A48200207C7F006296
      8B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000218B
      25000EA20F000FA90B0010A8040010A701000FA000000E9500000A820000296D
      2100000000000000000000000000000000000000000000000000000000000308
      AD000000B6000000C4000000CA000000CB000000C4000000B6000000A2000D11
      920000000000000000000000000000000000000000000000000000000000219D
      A80000C3B10000CCB70000D0B50000CFB10000C7A60000B9980000A685002A80
      8300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000043DD4F002496
      37000FBF220011BE150011BE0B0012BD040011B3010010A200000E9100002566
      200040C7440000000000000000000000000000000000000000005C77C9000000
      B3000000C7000000D3000000DC000000E0000000D7000000C6000000B2000000
      96005D76A100000000000000000000000000000000000000000062CCBC0020A7
      BA0000D4C80000DACA0000E0CA0000E2C70000DABC0000CAAB0000B797002086
      8B0068A292000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003BD64F0007C0
      30000FD1390011CD260011CB150012CA0B0012C0050011AE02000F990000067A
      00003CBA3D0000000000000000000000000000000000000000004F67CD000000
      BA000000CF000000DA000000E6000000EC000000E2000000CF000000BB000000
      9D004F64A300000000000000000000000000000000000000000055CFC30000CA
      BF0000DDD50000E2D60000E8D70000ECD50000E4CB0000D4BB0000C1A70000A3
      85005CA193000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003BE0510027AE
      54000FDB4E000FD83D0011D2270012CE150012C50B0011B705000FA20200256F
      200046D1490000000000000000000000000000000000000000005570CB000000
      BE000000D1000000DB000000E4000000E7000000E0000000D1000000BE000000
      A1006179AE00000000000000000000000000000000000000000058D0C10020B5
      CD0000E1DC0000E5DE0000E9DE0000EADB0000E4D20000D8C50000C7B3002093
      9C006AB0A0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000024B2
      4F000DDC58000EE0540010DA3E0011D4280012CB160012BF0B000EA602002883
      1F0000000000000000000000000000000000000000000000000000000000060B
      C3000000CC000000D8000000DC000000DD000000D8000000CE000000B900090D
      A9000000000000000000000000000000000000000000000000000000000022B6
      CA0000DFDC0000E5E30000E7E20000E6DE0000E1D70000D8CC0000C6B500269A
      A200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000025D9
      410028B35D000DDE59000EDF510010DB3C0011D2260011BF1100238A200055D0
      5400000000000000000000000000000000000000000000000000000000003952
      C4000000C5000000CD000000D4000000D4000000D0000000C3000000AE006A7F
      D100000000000000000000000000000000000000000000000000000000003FC6
      BC0020BAD40000E2DF0000E4E20000E3DF0000DFD90000D3CA0020A1B20071CD
      C500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000021D73D0024B74F002AB659000DCE37002AAB3D0027A2290043D444000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000344DC100080EC7000000C6000000C6000000C000090EBB00586ECC000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003AC3BA0021BCCF0020BDD80000D8D20020B7CF0025AEBF005FCAC1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000025DE3B0027D4390030E03E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F5BBC00374EBE004A65BF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000041C5B5003DC1B9004CC6B80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000142EC500142FC800142FC8002438B300B9BEDF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A8A8A8009D9D9D00A7A7A700BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000068716800696C69007076710000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004AE96F004BF5730049EB6F0047EB6E004FE9740085E39A00BBE9C5000000
      000000000000000000000000000000000000000000000000000000000000142F
      C8001631C500142FC700142FC800142FC8001A33C0005B6BCE007480CC00E9EA
      F300000000000000000000000000000000000000000000000000000000000000
      000093949400929292009D9D9D00989898009C9C9C009D9D9D00B4B4B400B7B7
      B700000000000000000000000000000000000000000000000000000000000000
      000062666200654B65006F4F6F005C5C5C006E4E6E00694D6900727072000000
      0000000000000000000000000000000000000000000000000000000000004BF8
      74004BF673004BF774004BF874004BF874004BF874004CF6740060EC81008DE0
      9F00000000000000000000000000000000000000000000000000142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC8002840C700A4AB
      DD00000000000000000000000000000000000000000000000000000000009393
      930094949400959595009595950095959500959595009595950096969600A0A0
      A000A4A4A4000000000000000000000000000000000000000000000000006368
      63006C4B6B00686867006E6E6E00707070006E6E6D00666666006B4B6B007270
      72000000000000000000000000000000000000000000000000004AF573004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF8740060EC
      8100BBE9C50000000000000000000000000000000000142DC100142FC600142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC8002A41
      C500616FC5000000000000000000000000000000000000000000929292009595
      9500959595009595950095959500959595009595950095959500959595009696
      9600AAAAAA00D5D5D5000000000000000000000000000000000000000000664A
      660068686800727272007B7B7B007E7E7E007B7B7B0072727200666666006A4E
      6A000000000000000000000000000000000000000000000000004AEF71004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004CF6
      740086E39C0000000000000000000000000000000000142FC700142FC700142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC8001530
      C7005161C3000000000000000000000000000000000092929200949494009595
      9500959595009595950095959500959595009595950095959500959595009595
      95009B9B9B00B7B7B70000000000000000000000000000000000838C83006E4E
      6E006E6E6E007B7B7C00888888008D8D8D00888888007B7B7B006E6E6E006F4F
      6F00777F780000000000000000000000000000000000000000004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74008AEAA100DFEDE100000000000000000000000000142EC400142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C8006776CE00D3D4E20000000000000000000000000094949400959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      950095959500A4A4A40000000000000000000000000000000000808680005C5C
      5D00707070007F7F7F008E8E8E00969696008E8E8E007F7F7F00707070005C5C
      5C007777770000000000000000000000000000000000000000004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74007FEA9800D0E9D500000000000000000000000000142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C8005566CA00B5B9D70000000000000000000000000094949400959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      950095959500B4B4B400000000000000000000000000000000007E887E007050
      70006E6E6E007C7C7C00898989008F8F8F00898989007C7C7C006E6E6E006F4F
      6F008088810000000000000000000000000000000000000000004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      740072E68D00D8E9DB00000000000000000000000000142EC400142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C8006776CF00D3D4E20000000000000000000000000093939300959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      950095959500B3B3B30000000000000000000000000000000000000000006A4E
      6A0069696900737373007D7C7C00808080007C7C7C0073737300676767006D51
      6D000000000000000000000000000000000000000000E5F1E70071EB8E004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004DF4
      75008EE3A200000000000000000000000000000000005D6ED100142FC700142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC8001530
      C7005262C3000000000000000000000000000000000094949400949494009595
      9500959595009595950095959500959595009595950095959500959595009595
      950095959500B2B2B2000000000000000000000000000000000000000000686C
      670073527200696969006E6E6E00717171006F6F6F00686868006A4A6A009898
      990000000000000000000000000000000000000000000000000049EE70004AF5
      73004BF874004BF874004BF874004BF874004BF874004BF874004CF7740073EA
      8E00B3E5BE0000000000000000000000000000000000162FBF00142FC600142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC8002C42
      C6006371C4000000000000000000000000000000000097979700959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      950098989800B0B0B00000000000000000000000000000000000000000000000
      0000636763006C526C007555750062626200725272006D516C00898A89000000
      0000000000000000000000000000000000000000000000000000000000004AF4
      72004BF372004BF673004BF874004BF874004BF874004FF276007AE99400C1EA
      CA00000000000000000000000000000000000000000000000000142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC8002139C600A3AB
      DD00000000000000000000000000000000000000000000000000959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      9500A6A6A600BEBEBE0000000000000000000000000000000000000000000000
      00000000000000000000677368006B6E6B00747E750000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000048EB6F004BF874004BF874004AF6730061E07F00CAEAD1000000
      000000000000000000000000000000000000000000000000000000000000142F
      C7001630C300152FC600142EC500142EC5001F37C1004256C6007581CE000000
      00000000000000000000000000000000000000000000000000009A9A9A00B0B0
      B00096969600959595009595950095959500959595009595950095959500B1B1
      B100D5D5D5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000172FBE00132DC200132DC0003043B70099A0CD00000000000000
      000000000000000000000000000000000000000000000000000000000000DDDD
      DD0095959500A1A1A1009696960095959500969696009F9F9F00A2A2A200D7D7
      D700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EBEBEB00D9D9D900E8E8E80000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      FFFFFFFFFFFF0000FC7FFC7FFC7F0000F01FF01FF01F0000E00FE00FE00F0000
      E00FE00FE00F0000C007C007C0070000C007C007C0070000C007C007C0070000
      E00FE00FE00F0000E00FE00FE00F0000F01FF01FF01F0000FC7FFC7FFC7F0000
      FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFF83FFC3FFC7FF01FE00FF00FF01FE00FC00FE007E00FC0078007C003
      E00FC00780078003C007C00380038003C007C00380038003C007C00380038003
      E00F800780078003E00FC00780078003F01FE00FC00FC003FC7FF81FE01FC007
      FFFFFFFFF83FE00FFFFFFFFFFFFFFC7F00000000000000000000000000000000
      000000000000}
  end
  object NLDJoystick1: TNLDJoystick
    Active = True
    OnButtonDown = NLDJoystick1ButtonDown
    OnButtonUp = NLDJoystick1ButtonUp
    OnMove = NLDJoystick1Move
    PollingInterval = -1
    Left = 656
    Top = 400
  end
  object TimerBeEl: TTimer
    Interval = 100
    OnTimer = TimerBeElTimer
    Left = 936
    Top = 400
  end
end
