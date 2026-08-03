object frmEngagementDataOverview: TfrmEngagementDataOverview
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 73
  ClientWidth = 1325
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 1321
    Height = 73
    BevelEdges = [beLeft, beRight]
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 1292
      Top = 47
      Width = 22
      Height = 16
      Caption = 'm/s'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblTimeBBRF: TLabel
      Left = 1256
      Top = 47
      Width = 32
      Height = 16
      Caption = '00.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 650
      Top = 16
      Width = 29
      Height = 16
      Caption = 'Time'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 650
      Top = 40
      Width = 38
      Height = 16
      Caption = 'Length'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblRunTime: TLabel
      Left = 696
      Top = 16
      Width = 52
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '00:00:41'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblRunLength: TLabel
      Left = 698
      Top = 40
      Width = 50
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '        0.7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblApproachTime: TLabel
      Left = 760
      Top = 16
      Width = 52
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '00:03:43'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblApproachLength: TLabel
      Left = 762
      Top = 40
      Width = 50
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '        4.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSearchTime: TLabel
      Left = 824
      Top = 16
      Width = 52
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '00:11:09'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSearchLength: TLabel
      Left = 826
      Top = 40
      Width = 49
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '      12.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 887
      Top = 16
      Width = 34
      Height = 16
      Caption = 'h:m:s'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 887
      Top = 40
      Width = 17
      Height = 16
      Caption = 'km'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblBatteryCapacity: TLabel
      Left = 946
      Top = 16
      Width = 25
      Height = 16
      Alignment = taRightJustify
      Caption = '75.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblWireLeft: TLabel
      Left = 946
      Top = 40
      Width = 25
      Height = 16
      Alignment = taRightJustify
      Caption = '10.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 978
      Top = 16
      Width = 25
      Height = 16
      Caption = 'kWh'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 978
      Top = 40
      Width = 17
      Height = 16
      Caption = 'km'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pbTrackBar: TPaintBox
      Left = 0
      Top = 8
      Width = 630
      Height = 40
      OnPaint = pbTrackBarPaint
    end
    object Label8: TLabel
      Left = 1012
      Top = 40
      Width = 47
      Height = 16
      Caption = 'Run Dist'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblRunDist: TLabel
      Left = 1062
      Top = 40
      Width = 28
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 1095
      Top = 40
      Width = 17
      Height = 16
      Caption = 'km'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pbMinuteTick: TPaintBox
      Left = 0
      Top = 48
      Width = 630
      Height = 25
      OnPaint = pbMinuteTickPaint
    end
    object rbBBRFSolution: TRadioGroup
      Left = 1135
      Top = 5
      Width = 185
      Height = 62
      Caption = 'BBRF Solution'
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 1143
      Top = 3
      Width = 113
      Height = 17
      BevelOuter = bvNone
      Caption = 'BBRF Solution'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object pnlValueMin: TPanel
      Left = 632
      Top = 54
      Width = 27
      Height = 15
      BevelOuter = bvNone
      Caption = 'min'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object tmrUpdateTorpInfo: TTimer
    OnTimer = tmrUpdateTorpInfoTimer
    Left = 1040
    Top = 8
  end
end
