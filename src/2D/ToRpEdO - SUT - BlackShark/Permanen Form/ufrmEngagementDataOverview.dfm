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
      Left = 775
      Top = 24
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
      Left = 775
      Top = 48
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
      Left = 823
      Top = 24
      Width = 50
      Height = 16
      Caption = '00.00.41'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblRunLength: TLabel
      Left = 823
      Top = 48
      Width = 50
      Height = 16
      Caption = '        0.7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblApproachTime: TLabel
      Left = 887
      Top = 24
      Width = 50
      Height = 16
      Caption = '00.03.43'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblApproachLength: TLabel
      Left = 887
      Top = 48
      Width = 50
      Height = 16
      Caption = '        4.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSearchTime: TLabel
      Left = 951
      Top = 24
      Width = 50
      Height = 16
      Caption = '00.11.09'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSearchLength: TLabel
      Left = 951
      Top = 48
      Width = 49
      Height = 16
      Caption = '      12.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 1012
      Top = 24
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
      Left = 1012
      Top = 48
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
      Left = 1071
      Top = 24
      Width = 25
      Height = 16
      Caption = '75.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblWireLeft: TLabel
      Left = 1071
      Top = 48
      Width = 25
      Height = 16
      Caption = '23.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 1103
      Top = 24
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
      Left = 1103
      Top = 48
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
      Left = 8
      Top = 11
      Width = 753
      Height = 49
      OnPaint = pbTrackBarPaint
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
  end
  object tmrUpdateTorpInfo: TTimer
    OnTimer = tmrUpdateTorpInfoTimer
    Left = 648
    Top = 24
  end
end
