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
      TicksMin = 0
      TicksMax = 6
      TicksEnlarge = 5
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
      TicksMin = 0
      TicksMax = 6
      TicksEnlarge = 5
      ColorZone1 = clRed
      ColorZone2 = clGreen
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
      Left = 614
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
      Top = 296
      Width = 25
      Height = 17
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
      Top = 8
      Width = 25
      Height = 16
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
      Left = 526
      Top = 32
      Width = 19
      Height = 17
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
      Top = 105
      Width = 25
      Height = 17
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
      Top = 386
      Width = 25
      Height = 15
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
      Top = 360
      Width = 25
      Height = 25
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
      Text = 'Manual'
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
      Left = 261
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
      Left = 548
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
    object btnCatchEO: TFlatButton
      Tag = 1
      Left = 17
      Top = 8
      Width = 105
      Height = 30
      Cursor = crHandPoint
      AllowAllUp = True
      Color = clSilver
      ColorDown = clLime
      GroupIndex = 1
      Caption = 'CATCH'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentColor = False
      TabOrder = 0
      OnMouseDown = btnCatchEOMouseDown
    end
    object btnTrackEO: TFlatButton
      Tag = 2
      Left = 139
      Top = 8
      Width = 105
      Height = 30
      Cursor = crHandPoint
      AllowAllUp = True
      Color = clSilver
      ColorDown = clLime
      GroupIndex = 1
      Caption = 'TRACK'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentColor = False
      TabOrder = 1
      OnMouseDown = btnCatchEOMouseDown
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
    Height = 32
    Width = 32
    Left = 881
    Top = 393
    Bitmap = {
      494C010107000C00040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000004000000001002000000000000080
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF32C0370032C0370031AF340031AF34003AC13F003AC13F00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF516B9800516B9800485F9500485F95005A7299005A729900FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF5D9985005D9985005692830056928300659A8900659A8900FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF32C0370032C0370031AF340031AF34003AC13F003AC13F00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF516B9800516B9800485F9500485F95005A7299005A729900FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF5D9985005D9985005692830056928300659A8900659A8900FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29BC2A0029BC2A0021711C002171
      1C00266520002665200007750000077500002664200026642000286C2400286C
      24003BB43D003BB43D00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF415AA200415AA2000A1098000A10
      980000009500000095000000950000009500000091000000910011168F001116
      8F0054689B0054689B00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F9D8D004F9D8D00278688002786
      88002085890020858900009877000098770020808400208084002F7D80002F7D
      800062968B0062968B00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29BC2A0029BC2A0021711C002171
      1C00266520002665200007750000077500002664200026642000286C2400286C
      24003BB43D003BB43D00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF415AA200415AA2000A1098000A10
      980000009500000095000000950000009500000091000000910011168F001116
      8F0054689B0054689B00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F9D8D004F9D8D00278688002786
      88002085890020858900009877000098770020808400208084002F7D80002F7D
      800062968B0062968B00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF27C72B0027C72B00246F2000246F20000C8A02000C8A
      02000E9200000E9200000E9200000E9200000E8E00000E8E00000A8200000A82
      0000265F2000265F20003BB33D003BB33D00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF3F59AD003F59AD000000A0000000A0000000AC000000
      AC000000B4000000B4000000B3000000B3000000AE000000AE000000A0000000
      A00000008D0000008D0053689B0053689B00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF4AAA98004AAA980020919B0020919B0000B49A0000B4
      9A0000B99C0000B99C0000B7970000B7970000B18F0000B18F0000A4820000A4
      8200207C7F00207C7F0062968B0062968B00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF27C72B0027C72B00246F2000246F20000C8A02000C8A
      02000E9200000E9200000E9200000E9200000E8E00000E8E00000A8200000A82
      0000265F2000265F20003BB33D003BB33D00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF3F59AD003F59AD000000A0000000A0000000AC000000
      AC000000B4000000B4000000B3000000B3000000AE000000AE000000A0000000
      A00000008D0000008D0053689B0053689B00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF4AAA98004AAA980020919B0020919B0000B49A0000B4
      9A0000B99C0000B99C0000B7970000B7970000B18F0000B18F0000A4820000A4
      8200207C7F00207C7F0062968B0062968B00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF218B2500218B25000EA20F000EA20F000FA90B000FA9
      0B0010A8040010A8040010A7010010A701000FA000000FA000000E9500000E95
      00000A8200000A820000296D2100296D2100FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0308AD000308AD000000B6000000B6000000C4000000
      C4000000CA000000CA000000CB000000CB000000C4000000C4000000B6000000
      B6000000A2000000A2000D1192000D119200FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF219DA800219DA80000C3B10000C3B10000CCB70000CC
      B70000D0B50000D0B50000CFB10000CFB10000C7A60000C7A60000B9980000B9
      980000A6850000A685002A8083002A808300FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF218B2500218B25000EA20F000EA20F000FA90B000FA9
      0B0010A8040010A8040010A7010010A701000FA000000FA000000E9500000E95
      00000A8200000A820000296D2100296D2100FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0308AD000308AD000000B6000000B6000000C4000000
      C4000000CA000000CA000000CB000000CB000000C4000000C4000000B6000000
      B6000000A2000000A2000D1192000D119200FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF219DA800219DA80000C3B10000C3B10000CCB70000CC
      B70000D0B50000D0B50000CFB10000CFB10000C7A60000C7A60000B9980000B9
      980000A6850000A685002A8083002A808300FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF43DD4F0043DD4F0024963700249637000FBF22000FBF220011BE150011BE
      150011BE0B0011BE0B0012BD040012BD040011B3010011B3010010A2000010A2
      00000E9100000E910000256620002566200040C7440040C74400FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF5C77C9005C77C9000000B3000000B3000000C7000000C7000000D3000000
      D3000000DC000000DC000000E0000000E0000000D7000000D7000000C6000000
      C6000000B2000000B20000009600000096005D76A1005D76A100FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF62CCBC0062CCBC0020A7BA0020A7BA0000D4C80000D4C80000DACA0000DA
      CA0000E0CA0000E0CA0000E2C70000E2C70000DABC0000DABC0000CAAB0000CA
      AB0000B7970000B7970020868B0020868B0068A2920068A29200FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF43DD4F0043DD4F0024963700249637000FBF22000FBF220011BE150011BE
      150011BE0B0011BE0B0012BD040012BD040011B3010011B3010010A2000010A2
      00000E9100000E910000256620002566200040C7440040C74400FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF5C77C9005C77C9000000B3000000B3000000C7000000C7000000D3000000
      D3000000DC000000DC000000E0000000E0000000D7000000D7000000C6000000
      C6000000B2000000B20000009600000096005D76A1005D76A100FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF62CCBC0062CCBC0020A7BA0020A7BA0000D4C80000D4C80000DACA0000DA
      CA0000E0CA0000E0CA0000E2C70000E2C70000DABC0000DABC0000CAAB0000CA
      AB0000B7970000B7970020868B0020868B0068A2920068A29200FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF3BD64F003BD64F0007C0300007C030000FD139000FD1390011CD260011CD
      260011CB150011CB150012CA0B0012CA0B0012C0050012C0050011AE020011AE
      02000F9900000F990000067A0000067A00003CBA3D003CBA3D00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF4F67CD004F67CD000000BA000000BA000000CF000000CF000000DA000000
      DA000000E6000000E6000000EC000000EC000000E2000000E2000000CF000000
      CF000000BB000000BB0000009D0000009D004F64A3004F64A300FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF55CFC30055CFC30000CABF0000CABF0000DDD50000DDD50000E2D60000E2
      D60000E8D70000E8D70000ECD50000ECD50000E4CB0000E4CB0000D4BB0000D4
      BB0000C1A70000C1A70000A3850000A385005CA193005CA19300FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF3BD64F003BD64F0007C0300007C030000FD139000FD1390011CD260011CD
      260011CB150011CB150012CA0B0012CA0B0012C0050012C0050011AE020011AE
      02000F9900000F990000067A0000067A00003CBA3D003CBA3D00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF4F67CD004F67CD000000BA000000BA000000CF000000CF000000DA000000
      DA000000E6000000E6000000EC000000EC000000E2000000E2000000CF000000
      CF000000BB000000BB0000009D0000009D004F64A3004F64A300FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF55CFC30055CFC30000CABF0000CABF0000DDD50000DDD50000E2D60000E2
      D60000E8D70000E8D70000ECD50000ECD50000E4CB0000E4CB0000D4BB0000D4
      BB0000C1A70000C1A70000A3850000A385005CA193005CA19300FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF3BE051003BE0510027AE540027AE54000FDB4E000FDB4E000FD83D000FD8
      3D0011D2270011D2270012CE150012CE150012C50B0012C50B0011B7050011B7
      05000FA202000FA20200256F2000256F200046D1490046D14900FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF5570CB005570CB000000BE000000BE000000D1000000D1000000DB000000
      DB000000E4000000E4000000E7000000E7000000E0000000E0000000D1000000
      D1000000BE000000BE000000A1000000A1006179AE006179AE00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF58D0C10058D0C10020B5CD0020B5CD0000E1DC0000E1DC0000E5DE0000E5
      DE0000E9DE0000E9DE0000EADB0000EADB0000E4D20000E4D20000D8C50000D8
      C50000C7B30000C7B30020939C0020939C006AB0A0006AB0A000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF3BE051003BE0510027AE540027AE54000FDB4E000FDB4E000FD83D000FD8
      3D0011D2270011D2270012CE150012CE150012C50B0012C50B0011B7050011B7
      05000FA202000FA20200256F2000256F200046D1490046D14900FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF5570CB005570CB000000BE000000BE000000D1000000D1000000DB000000
      DB000000E4000000E4000000E7000000E7000000E0000000E0000000D1000000
      D1000000BE000000BE000000A1000000A1006179AE006179AE00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF58D0C10058D0C10020B5CD0020B5CD0000E1DC0000E1DC0000E5DE0000E5
      DE0000E9DE0000E9DE0000EADB0000EADB0000E4D20000E4D20000D8C50000D8
      C50000C7B30000C7B30020939C0020939C006AB0A0006AB0A000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF24B24F0024B24F000DDC58000DDC58000EE054000EE0
      540010DA3E0010DA3E0011D4280011D4280012CB160012CB160012BF0B0012BF
      0B000EA602000EA6020028831F0028831F00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF060BC300060BC3000000CC000000CC000000D8000000
      D8000000DC000000DC000000DD000000DD000000D8000000D8000000CE000000
      CE000000B9000000B900090DA900090DA900FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF22B6CA0022B6CA0000DFDC0000DFDC0000E5E30000E5
      E30000E7E20000E7E20000E6DE0000E6DE0000E1D70000E1D70000D8CC0000D8
      CC0000C6B50000C6B500269AA200269AA200FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF24B24F0024B24F000DDC58000DDC58000EE054000EE0
      540010DA3E0010DA3E0011D4280011D4280012CB160012CB160012BF0B0012BF
      0B000EA602000EA6020028831F0028831F00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF060BC300060BC3000000CC000000CC000000D8000000
      D8000000DC000000DC000000DD000000DD000000D8000000D8000000CE000000
      CE000000B9000000B900090DA900090DA900FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF22B6CA0022B6CA0000DFDC0000DFDC0000E5E30000E5
      E30000E7E20000E7E20000E6DE0000E6DE0000E1D70000E1D70000D8CC0000D8
      CC0000C6B50000C6B500269AA200269AA200FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF25D9410025D9410028B35D0028B35D000DDE59000DDE
      59000EDF51000EDF510010DB3C0010DB3C0011D2260011D2260011BF110011BF
      1100238A2000238A200055D0540055D05400FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF3952C4003952C4000000C5000000C5000000CD000000
      CD000000D4000000D4000000D4000000D4000000D0000000D0000000C3000000
      C3000000AE000000AE006A7FD1006A7FD100FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF3FC6BC003FC6BC0020BAD40020BAD40000E2DF0000E2
      DF0000E4E20000E4E20000E3DF0000E3DF0000DFD90000DFD90000D3CA0000D3
      CA0020A1B20020A1B20071CDC50071CDC500FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF25D9410025D9410028B35D0028B35D000DDE59000DDE
      59000EDF51000EDF510010DB3C0010DB3C0011D2260011D2260011BF110011BF
      1100238A2000238A200055D0540055D05400FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF3952C4003952C4000000C5000000C5000000CD000000
      CD000000D4000000D4000000D4000000D4000000D0000000D0000000C3000000
      C3000000AE000000AE006A7FD1006A7FD100FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF3FC6BC003FC6BC0020BAD40020BAD40000E2DF0000E2
      DF0000E4E20000E4E20000E3DF0000E3DF0000DFD90000DFD90000D3CA0000D3
      CA0020A1B20020A1B20071CDC50071CDC500FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF21D73D0021D73D0024B74F0024B7
      4F002AB659002AB659000DCE37000DCE37002AAB3D002AAB3D0027A2290027A2
      290043D4440043D44400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF344DC100344DC100080EC700080E
      C7000000C6000000C6000000C6000000C6000000C0000000C000090EBB00090E
      BB00586ECC00586ECC00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3AC3BA003AC3BA0021BCCF0021BC
      CF0020BDD80020BDD80000D8D20000D8D20020B7CF0020B7CF0025AEBF0025AE
      BF005FCAC1005FCAC100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF21D73D0021D73D0024B74F0024B7
      4F002AB659002AB659000DCE37000DCE37002AAB3D002AAB3D0027A2290027A2
      290043D4440043D44400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF344DC100344DC100080EC700080E
      C7000000C6000000C6000000C6000000C6000000C0000000C000090EBB00090E
      BB00586ECC00586ECC00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3AC3BA003AC3BA0021BCCF0021BC
      CF0020BDD80020BDD80000D8D20000D8D20020B7CF0020B7CF0025AEBF0025AE
      BF005FCAC1005FCAC100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF25DE3B0025DE3B0027D4390027D4390030E03E0030E03E00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF3F5BBC003F5BBC00374EBE00374EBE004A65BF004A65BF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF41C5B50041C5B5003DC1B9003DC1B9004CC6B8004CC6B800FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF25DE3B0025DE3B0027D4390027D4390030E03E0030E03E00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF3F5BBC003F5BBC00374EBE00374EBE004A65BF004A65BF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF41C5B50041C5B5003DC1B9003DC1B9004CC6B8004CC6B800FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF142EC500142E
      C500142FC800142FC800142FC800142FC8002438B3002438B300B9BEDF00B9BE
      DF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFA8A8A800A8A8A8009D9D9D009D9D9D00A7A7A700A7A7A700BFBFBF00BFBF
      BF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF142EC500142E
      C500142FC800142FC800142FC800142FC8002438B3002438B300B9BEDF00B9BE
      DF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFA8A8A800A8A8A8009D9D9D009D9D9D00A7A7A700A7A7A700BFBFBF00BFBF
      BF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF6871680068716800696C6900696C69007076710070767100FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4AE96F004AE96F004BF573004BF5
      730049EB6F0049EB6F0047EB6E0047EB6E004FE974004FE9740085E39A0085E3
      9A00BBE9C500BBE9C500FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF142FC800142FC8001631C5001631C500142FC700142F
      C700142FC800142FC800142FC800142FC8001A33C0001A33C0005B6BCE005B6B
      CE007480CC007480CC00E9EAF300E9EAF300FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9394940093949400929292009292
      92009D9D9D009D9D9D0098989800989898009C9C9C009C9C9C009D9D9D009D9D
      9D00B4B4B400B4B4B400B7B7B700B7B7B700FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF6871680068716800696C6900696C69007076710070767100FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4AE96F004AE96F004BF573004BF5
      730049EB6F0049EB6F0047EB6E0047EB6E004FE974004FE9740085E39A0085E3
      9A00BBE9C500BBE9C500FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF142FC800142FC8001631C5001631C500142FC700142F
      C700142FC800142FC800142FC800142FC8001A33C0001A33C0005B6BCE005B6B
      CE007480CC007480CC00E9EAF300E9EAF300FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9394940093949400929292009292
      92009D9D9D009D9D9D0098989800989898009C9C9C009C9C9C009D9D9D009D9D
      9D00B4B4B400B4B4B400B7B7B700B7B7B700FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6266620062666200654B6500654B
      65006F4F6F006F4F6F005C5C5C005C5C5C006E4E6E006E4E6E00694D6900694D
      69007270720072707200FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF4BF874004BF874004BF673004BF673004BF774004BF7
      74004BF874004BF874004BF874004BF874004BF874004BF874004CF674004CF6
      740060EC810060EC81008DE09F008DE09F00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C8002840C7002840C700A4ABDD00A4ABDD00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF93939300939393009494940094949400959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      95009696960096969600A0A0A000A0A0A000A4A4A400A4A4A400FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6266620062666200654B6500654B
      65006F4F6F006F4F6F005C5C5C005C5C5C006E4E6E006E4E6E00694D6900694D
      69007270720072707200FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF4BF874004BF874004BF673004BF673004BF774004BF7
      74004BF874004BF874004BF874004BF874004BF874004BF874004CF674004CF6
      740060EC810060EC81008DE09F008DE09F00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C8002840C7002840C700A4ABDD00A4ABDD00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF93939300939393009494940094949400959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      95009696960096969600A0A0A000A0A0A000A4A4A400A4A4A400FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF63686300636863006C4B6B006C4B6B00686867006868
      67006E6E6E006E6E6E0070707000707070006E6E6D006E6E6D00666666006666
      66006B4B6B006B4B6B007270720072707200FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF4AF573004AF573004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF8740060EC810060EC8100BBE9C500BBE9C500FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF142DC100142D
      C100142FC600142FC600142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC8002A41C5002A41C500616FC500616FC500FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF929292009292920095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      950095959500959595009696960096969600AAAAAA00AAAAAA00D5D5D500D5D5
      D500FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF63686300636863006C4B6B006C4B6B00686867006868
      67006E6E6E006E6E6E0070707000707070006E6E6D006E6E6D00666666006666
      66006B4B6B006B4B6B007270720072707200FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF4AF573004AF573004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF8740060EC810060EC8100BBE9C500BBE9C500FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF142DC100142D
      C100142FC600142FC600142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC8002A41C5002A41C500616FC500616FC500FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF929292009292920095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      950095959500959595009696960096969600AAAAAA00AAAAAA00D5D5D500D5D5
      D500FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF664A6600664A66006868680068686800727272007272
      72007B7B7B007B7B7B007E7E7E007E7E7E007B7B7B007B7B7B00727272007272
      720066666600666666006A4E6A006A4E6A00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF4AEF71004AEF71004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004CF674004CF6740086E39C0086E39C00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF142FC700142F
      C700142FC700142FC700142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC8001530C7001530C7005161C3005161C300FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF929292009292
      9200949494009494940095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009B9B9B009B9B9B00B7B7B700B7B7
      B700FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF664A6600664A66006868680068686800727272007272
      72007B7B7B007B7B7B007E7E7E007E7E7E007B7B7B007B7B7B00727272007272
      720066666600666666006A4E6A006A4E6A00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF4AEF71004AEF71004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004CF674004CF6740086E39C0086E39C00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF142FC700142F
      C700142FC700142FC700142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC8001530C7001530C7005161C3005161C300FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF929292009292
      9200949494009494940095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009B9B9B009B9B9B00B7B7B700B7B7
      B700FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF838C8300838C83006E4E6E006E4E6E006E6E6E006E6E6E007B7B7C007B7B
      7C0088888800888888008D8D8D008D8D8D0088888800888888007B7B7B007B7B
      7B006E6E6E006E6E6E006F4F6F006F4F6F00777F7800777F7800FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF4BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874008AEAA1008AEAA100DFEDE100DFED
      E100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF142EC400142E
      C400142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC8006776CE006776CE00D3D4E200D3D4
      E200FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF949494009494
      9400959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500A4A4A400A4A4
      A400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF838C8300838C83006E4E6E006E4E6E006E6E6E006E6E6E007B7B7C007B7B
      7C0088888800888888008D8D8D008D8D8D0088888800888888007B7B7B007B7B
      7B006E6E6E006E6E6E006F4F6F006F4F6F00777F7800777F7800FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF4BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874008AEAA1008AEAA100DFEDE100DFED
      E100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF142EC400142E
      C400142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC8006776CE006776CE00D3D4E200D3D4
      E200FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF949494009494
      9400959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500A4A4A400A4A4
      A400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF80868000808680005C5C5D005C5C5D0070707000707070007F7F7F007F7F
      7F008E8E8E008E8E8E0096969600969696008E8E8E008E8E8E007F7F7F007F7F
      7F0070707000707070005C5C5C005C5C5C007777770077777700FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF4BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874007FEA98007FEA9800D0E9D500D0E9
      D500FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC8005566CA005566CA00B5B9D700B5B9
      D700FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF949494009494
      9400959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500B4B4B400B4B4
      B400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF80868000808680005C5C5D005C5C5D0070707000707070007F7F7F007F7F
      7F008E8E8E008E8E8E0096969600969696008E8E8E008E8E8E007F7F7F007F7F
      7F0070707000707070005C5C5C005C5C5C007777770077777700FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF4BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874007FEA98007FEA9800D0E9D500D0E9
      D500FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC8005566CA005566CA00B5B9D700B5B9
      D700FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF949494009494
      9400959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500B4B4B400B4B4
      B400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF7E887E007E887E0070507000705070006E6E6E006E6E6E007C7C7C007C7C
      7C0089898900898989008F8F8F008F8F8F0089898900898989007C7C7C007C7C
      7C006E6E6E006E6E6E006F4F6F006F4F6F008088810080888100FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF4BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF8740072E68D0072E68D00D8E9DB00D8E9
      DB00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF142EC400142E
      C400142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC8006776CF006776CF00D3D4E200D3D4
      E200FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF939393009393
      9300959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500B3B3B300B3B3
      B300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF7E887E007E887E0070507000705070006E6E6E006E6E6E007C7C7C007C7C
      7C0089898900898989008F8F8F008F8F8F0089898900898989007C7C7C007C7C
      7C006E6E6E006E6E6E006F4F6F006F4F6F008088810080888100FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF4BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF8740072E68D0072E68D00D8E9DB00D8E9
      DB00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF142EC400142E
      C400142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC8006776CF006776CF00D3D4E200D3D4
      E200FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF939393009393
      9300959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500B3B3B300B3B3
      B300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF6A4E6A006A4E6A006969690069696900737373007373
      73007D7C7C007D7C7C0080808000808080007C7C7C007C7C7C00737373007373
      730067676700676767006D516D006D516D00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5F1E700E5F1
      E70071EB8E0071EB8E004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004DF475004DF475008EE3A2008EE3A200FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D6ED1005D6E
      D100142FC700142FC700142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC8001530C7001530C7005262C3005262C300FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF949494009494
      9400949494009494940095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500B2B2B200B2B2
      B200FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF6A4E6A006A4E6A006969690069696900737373007373
      73007D7C7C007D7C7C0080808000808080007C7C7C007C7C7C00737373007373
      730067676700676767006D516D006D516D00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5F1E700E5F1
      E70071EB8E0071EB8E004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004BF874004BF874004DF475004DF475008EE3A2008EE3A200FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D6ED1005D6E
      D100142FC700142FC700142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC8001530C7001530C7005262C3005262C300FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF949494009494
      9400949494009494940095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500B2B2B200B2B2
      B200FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF686C6700686C67007352720073527200696969006969
      69006E6E6E006E6E6E0071717100717171006F6F6F006F6F6F00686868006868
      68006A4A6A006A4A6A009898990098989900FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF49EE700049EE70004AF573004AF573004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004CF774004CF7740073EA8E0073EA8E00B3E5BE00B3E5BE00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF162FBF00162F
      BF00142FC600142FC600142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC8002C42C6002C42C6006371C4006371C400FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF979797009797
      9700959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009898980098989800B0B0B000B0B0
      B000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF686C6700686C67007352720073527200696969006969
      69006E6E6E006E6E6E0071717100717171006F6F6F006F6F6F00686868006868
      68006A4A6A006A4A6A009898990098989900FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF49EE700049EE70004AF573004AF573004BF874004BF874004BF874004BF8
      74004BF874004BF874004BF874004BF874004BF874004BF874004BF874004BF8
      74004CF774004CF7740073EA8E0073EA8E00B3E5BE00B3E5BE00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF162FBF00162F
      BF00142FC600142FC600142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC8002C42C6002C42C6006371C4006371C400FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF979797009797
      9700959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009898980098989800B0B0B000B0B0
      B000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF63676300636763006C526C006C52
      6C007555750075557500626262006262620072527200725272006D516C006D51
      6C00898A8900898A8900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF4AF472004AF472004BF372004BF372004BF673004BF6
      73004BF874004BF874004BF874004BF874004BF874004BF874004FF276004FF2
      76007AE994007AE99400C1EACA00C1EACA00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C8002139C6002139C600A3ABDD00A3ABDD00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      950095959500959595009595950095959500A6A6A600A6A6A600BEBEBE00BEBE
      BE00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF63676300636763006C526C006C52
      6C007555750075557500626262006262620072527200725272006D516C006D51
      6C00898A8900898A8900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF4AF472004AF472004BF372004BF372004BF673004BF6
      73004BF874004BF874004BF874004BF874004BF874004BF874004FF276004FF2
      76007AE994007AE99400C1EACA00C1EACA00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C800142FC800142FC800142FC800142FC800142FC800142FC800142FC800142F
      C8002139C6002139C600A3ABDD00A3ABDD00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      950095959500959595009595950095959500A6A6A600A6A6A600BEBEBE00BEBE
      BE00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF67736800677368006B6E6B006B6E6B00747E7500747E7500FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF48EB6F0048EB
      6F004BF874004BF874004BF874004BF874004AF673004AF6730061E07F0061E0
      7F00CAEAD100CAEAD100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF142FC700142FC7001630C3001630C300152FC600152F
      C600142EC500142EC500142EC500142EC5001F37C1001F37C1004256C6004256
      C6007581CE007581CE00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF9A9A9A009A9A9A00B0B0B000B0B0B0009696960096969600959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      95009595950095959500B1B1B100B1B1B100D5D5D500D5D5D500FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF67736800677368006B6E6B006B6E6B00747E7500747E7500FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF48EB6F0048EB
      6F004BF874004BF874004BF874004BF874004AF673004AF6730061E07F0061E0
      7F00CAEAD100CAEAD100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF142FC700142FC7001630C3001630C300152FC600152F
      C600142EC500142EC500142EC500142EC5001F37C1001F37C1004256C6004256
      C6007581CE007581CE00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF9A9A9A009A9A9A00B0B0B000B0B0B0009696960096969600959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      95009595950095959500B1B1B100B1B1B100D5D5D500D5D5D500FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF172FBE00172F
      BE00132DC200132DC200132DC000132DC0003043B7003043B70099A0CD0099A0
      CD00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFDDDDDD00DDDDDD009595950095959500A1A1A100A1A1
      A1009696960096969600959595009595950096969600969696009F9F9F009F9F
      9F00A2A2A200A2A2A200D7D7D700D7D7D700FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF172FBE00172F
      BE00132DC200132DC200132DC000132DC0003043B7003043B70099A0CD0099A0
      CD00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFDDDDDD00DDDDDD009595950095959500A1A1A100A1A1
      A1009696960096969600959595009595950096969600969696009F9F9F009F9F
      9F00A2A2A200A2A2A200D7D7D700D7D7D700FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFEBEBEB00EBEBEB00D9D9D900D9D9D900E8E8E800E8E8E800FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFEBEBEB00EBEBEB00D9D9D900D9D9D900E8E8E800E8E8E800FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF424D3E000000000000003E000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
    Interval = 500
    OnTimer = TimerBeElTimer
    Left = 936
    Top = 400
  end
end
