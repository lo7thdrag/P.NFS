object frmTorpedoVerticalView: TfrmTorpedoVerticalView
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 459
  ClientWidth = 928
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
    Width = 921
    Height = 465
    BevelEdges = []
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 692
      Top = 29
      Width = 82
      Height = 16
      Caption = 'Min Depth (m)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 691
      Top = 61
      Width = 85
      Height = 16
      Caption = 'Max Depth (m)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 686
      Top = 114
      Width = 115
      Height = 16
      Caption = 'Start Distance (km) '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 686
      Top = 146
      Width = 109
      Height = 16
      Caption = 'Stop Distance (km)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 678
      Top = 189
      Width = 55
      Height = 16
      Caption = 'Run Time'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblRuntime: TLabel
      Left = 813
      Top = 189
      Width = 52
      Height = 16
      Caption = '00:00:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 877
      Top = 189
      Width = 33
      Height = 16
      Caption = 'h m/s'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblRunLength: TLabel
      Left = 678
      Top = 213
      Width = 64
      Height = 16
      Caption = 'Run Length'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 813
      Top = 213
      Width = 50
      Height = 16
      Caption = '        0.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 877
      Top = 213
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
    object Label6: TLabel
      Left = 678
      Top = 237
      Width = 87
      Height = 16
      Caption = 'Approach Time'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblApproachTime: TLabel
      Left = 813
      Top = 237
      Width = 52
      Height = 16
      Caption = '00:00:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 877
      Top = 237
      Width = 33
      Height = 16
      Caption = 'h m/s'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 678
      Top = 261
      Width = 96
      Height = 16
      Caption = 'Approach Length'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblApproachLength: TLabel
      Left = 813
      Top = 261
      Width = 54
      Height = 16
      Caption = '         0.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 877
      Top = 261
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
    object Label12: TLabel
      Left = 678
      Top = 285
      Width = 73
      Height = 16
      Caption = 'Search Time'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 813
      Top = 285
      Width = 52
      Height = 16
      Caption = '00:00:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 877
      Top = 285
      Width = 33
      Height = 16
      Caption = 'h m/s'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 678
      Top = 309
      Width = 82
      Height = 16
      Caption = 'Search Length'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSearchLength: TLabel
      Left = 813
      Top = 309
      Width = 54
      Height = 16
      Caption = '         0.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 877
      Top = 309
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
    object Label16: TLabel
      Left = 678
      Top = 333
      Width = 111
      Height = 16
      Caption = 'Own Ship Wire Left'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblOwnShipwireLeft: TLabel
      Left = 813
      Top = 333
      Width = 54
      Height = 16
      Caption = '         0.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 877
      Top = 333
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
      Left = 678
      Top = 357
      Width = 92
      Height = 16
      Caption = 'Battery Capacity'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblBatteryCapacity1: TLabel
      Left = 813
      Top = 357
      Width = 54
      Height = 16
      Caption = '         0.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 877
      Top = 357
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
    object lbl2: TLabel
      Left = 678
      Top = 381
      Width = 70
      Height = 16
      Caption = 'ToSo Range'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblToSoRange: TLabel
      Left = 813
      Top = 381
      Width = 51
      Height = 16
      Caption = '           0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 877
      Top = 381
      Width = 11
      Height = 16
      Caption = 'm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblClose: TLabel
      Left = 885
      Top = 416
      Width = 31
      Height = 16
      Caption = 'Close'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pbHorizontalView: TPaintBox
      Left = 176
      Top = 40
      Width = 481
      Height = 329
      OnPaint = pbHorizontalViewPaint
    end
    object pbVerticalView: TPaintBox
      Left = 14
      Top = 40
      Width = 145
      Height = 337
      OnPaint = pbVerticalViewPaint
    end
    object RadioGroup1: TRadioGroup
      Left = 680
      Top = 5
      Width = 193
      Height = 84
      Caption = 'Depth Scale'
      TabOrder = 3
    end
    object edtMaxDepth: TEdit
      Left = 803
      Top = 61
      Width = 65
      Height = 24
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
    end
    object edtMinDepth: TEdit
      Left = 804
      Top = 29
      Width = 65
      Height = 24
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object Panel1: TPanel
      Left = 688
      Top = 5
      Width = 81
      Height = 17
      BevelEdges = []
      BevelOuter = bvNone
      Caption = 'Depth Scale'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object RadioGroup2: TRadioGroup
      Left = 680
      Top = 90
      Width = 193
      Height = 84
      Caption = 'Depth Scale'
      TabOrder = 7
    end
    object Panel2: TPanel
      Left = 690
      Top = 89
      Width = 81
      Height = 17
      BevelEdges = []
      BevelOuter = bvNone
      Caption = 'Distance Scale'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object edtStopDistance: TEdit
      Left = 803
      Top = 146
      Width = 65
      Height = 24
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '15.0'
    end
    object edtStartDistance: TEdit
      Left = 804
      Top = 114
      Width = 65
      Height = 24
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = '0.0'
    end
    object Panel3: TPanel
      Left = 672
      Top = 409
      Width = 256
      Height = 1
      Color = clWhite
      ParentBackground = False
      TabOrder = 8
    end
  end
end
