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
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlUpper: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 1024
    TabOrder = 0
    object pnlSituationZone: TPanel
      Left = 1
      Top = 1
      Width = 1008
      Height = 1020
      Color = clMedGray
      ParentBackground = False
      TabOrder = 0
      object imgFcc1Image: TImage
        Left = 851
        Top = 690
        Width = 58
        Height = 87
        Stretch = True
      end
      object imgBackgrounSituationZone: TImage
        Left = 1
        Top = 1
        Width = 1006
        Height = 1018
        Align = alClient
        ExplicitWidth = 822
        ExplicitHeight = 798
      end
      object lblMap48Km: TLabel
        Left = 92
        Top = 43
        Width = 32
        Height = 16
        Caption = '48Km'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblMap24Km: TLabel
        Left = 92
        Top = 74
        Width = 32
        Height = 16
        Caption = '24Km'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblMap12Km: TLabel
        Left = 92
        Top = 105
        Width = 32
        Height = 16
        Caption = '12Km'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblMap6Km: TLabel
        Left = 99
        Top = 136
        Width = 25
        Height = 16
        Caption = '6Km'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblMap3Km: TLabel
        Left = 103
        Top = 167
        Width = 25
        Height = 16
        Caption = '3Km'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblMap1point5Km: TLabel
        Left = 92
        Top = 198
        Width = 36
        Height = 16
        Caption = '1.5Km'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object imgCompas: TImage
        Left = 146
        Top = 8
        Width = 80
        Height = 80
        Visible = False
        OnClick = imgCompasClick
      end
      object lblMapLat: TLabel
        Left = 847
        Top = 926
        Width = 18
        Height = 13
        Caption = 'LAT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblMapLon: TLabel
        Left = 847
        Top = 944
        Width = 20
        Height = 13
        Caption = 'LON'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object btnMapIncrement: TButton
        Left = 27
        Top = 8
        Width = 46
        Height = 25
        Caption = '+'
        TabOrder = 1
        OnClick = btnMapIncrementClick
      end
      object btnMapDecrement: TButton
        Left = 27
        Top = 225
        Width = 46
        Height = 25
        Caption = '-'
        TabOrder = 2
        OnClick = btnMapDecrementClick
      end
      object pnlMap48km: TPanel
        Tag = 5
        Left = 11
        Top = 39
        Width = 75
        Height = 25
        BevelOuter = bvNone
        Color = clAqua
        ParentBackground = False
        TabOrder = 3
        OnClick = pnlMapRangeClick
      end
      object pnlMap24km: TPanel
        Tag = 4
        Left = 11
        Top = 70
        Width = 75
        Height = 25
        BevelOuter = bvNone
        Color = clAqua
        ParentBackground = False
        TabOrder = 4
        OnClick = pnlMapRangeClick
      end
      object pnlMap12km: TPanel
        Tag = 3
        Left = 11
        Top = 101
        Width = 75
        Height = 25
        BevelOuter = bvNone
        Color = clAqua
        ParentBackground = False
        TabOrder = 5
        OnClick = pnlMapRangeClick
      end
      object pnlMap6km: TPanel
        Tag = 2
        Left = 11
        Top = 132
        Width = 75
        Height = 25
        BevelOuter = bvNone
        Color = clAqua
        ParentBackground = False
        TabOrder = 6
        OnClick = pnlMapRangeClick
      end
      object pnlMap3km: TPanel
        Tag = 1
        Left = 11
        Top = 163
        Width = 75
        Height = 25
        BevelOuter = bvNone
        Color = clAqua
        ParentBackground = False
        TabOrder = 7
        OnClick = pnlMapRangeClick
      end
      object pnlMap1point5km: TPanel
        Left = 11
        Top = 194
        Width = 75
        Height = 25
        BevelOuter = bvNone
        Color = clAqua
        ParentBackground = False
        TabOrder = 8
        OnClick = pnlMapRangeClick
      end
      object acbxDisRing: TAdvOfficeCheckBox
        Tag = 1
        Left = 767
        Top = 47
        Width = 120
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        Visible = False
        OnClick = acbxTargetParaClick
        Alignment = taLeftJustify
        Caption = 'Dis Ring'
        ReturnIsTab = False
        Version = '1.6.1.0'
      end
      object acbxShootArea: TAdvOfficeCheckBox
        Tag = 2
        Left = 767
        Top = 72
        Width = 120
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        Visible = False
        OnClick = acbxTargetParaClick
        Alignment = taLeftJustify
        Caption = 'Shoot Area'
        ReturnIsTab = False
        Version = '1.6.1.0'
      end
      object acbxTrackerArea: TAdvOfficeCheckBox
        Tag = 3
        Left = 767
        Top = 97
        Width = 124
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        Visible = False
        OnClick = acbxTargetParaClick
        Alignment = taLeftJustify
        Caption = 'Tracker Area'
        ReturnIsTab = False
        Version = '1.6.1.0'
      end
      object acbxTargetPara: TAdvOfficeCheckBox
        Left = 767
        Top = 22
        Width = 120
        Height = 25
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        Visible = False
        OnClick = acbxTargetParaClick
        Alignment = taLeftJustify
        Caption = 'Target Para'
        ReturnIsTab = False
        State = cbChecked
        Version = '1.6.1.0'
      end
      object FMap: TMap
        Left = 1
        Top = 1
        Width = 1006
        Height = 1018
        ParentColor = False
        Align = alClient
        TabOrder = 0
        Visible = False
        OnMouseUp = FMapMouseUp
        OnMouseMove = FMapMouseMove
        OnMouseDown = FMapMouseDown
        OnDrawUserLayer = FMapDrawUserLayer
        ExplicitWidth = 822
        ExplicitHeight = 653
        ControlData = {
          8A1A0600F96700003769000001000000FFFFFF000D47656F44696374696F6E61
          727905456D70747900E8030000000000000000000002000E001E000000000000
          0000000000000000000000000000000000000000000600010000000000500001
          010000640000000001F4010000050000800C000000000000000000000000FFFF
          FF000100000000000000000000000000000000000000000000000352E30B918F
          CE119DE300AA004BB85101000000900194C90B0005417269616C000352E30B91
          8FCE119DE300AA004BB851010000009001348C030005417269616C0000000000
          00000000000000000000000000000000000000000000000000000000000000FF
          FFFF000000000000000001370000000000FFFFFF000000000000000352E30B91
          8FCE119DE300AA004BB851010000009001DC7C010005417269616C000352E30B
          918FCE119DE300AA004BB851010200009001A42C02000B4D61702053796D626F
          6C730000000000000001000100FFFFFF000200FFFFFF00000000000001000000
          010001180100006025872A01000000CC9156771C000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000002
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          8076C000000000008056C0000000000080764000000000008056400100000018
          0100006025872A01000000881300C01C00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000200000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000088CB97003D8BDC7621
          00000000000000208BDC7618CD62082E60BA56C8CB9700000000000000000000
          000088B3400000000000408F400001000001}
      end
    end
  end
  object pnlTarget: TPanel
    Left = 1008
    Top = 512
    Width = 272
    Height = 512
    Color = clSilver
    ParentBackground = False
    TabOrder = 2
    object Label27: TLabel
      Left = 20
      Top = 55
      Width = 41
      Height = 16
      Caption = 'TgtNo.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTgtNo: TLabel
      Left = 124
      Top = 55
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
    object Label30: TLabel
      Left = 20
      Top = 83
      Width = 19
      Height = 16
      Caption = 'Dis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTgtDistance: TLabel
      Left = 124
      Top = 83
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
    object Label32: TLabel
      Left = 197
      Top = 83
      Width = 19
      Height = 16
      Caption = 'Km'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label33: TLabel
      Left = 20
      Top = 115
      Width = 28
      Height = 16
      Caption = 'Azm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTgtAzimut: TLabel
      Left = 124
      Top = 115
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
    object Label35: TLabel
      Left = 197
      Top = 115
      Width = 11
      Height = 16
      Caption = ' '#176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label36: TLabel
      Left = 20
      Top = 151
      Width = 24
      Height = 16
      Caption = 'Spd'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTgtSpd: TLabel
      Left = 124
      Top = 151
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
    object Label38: TLabel
      Left = 197
      Top = 151
      Width = 16
      Height = 16
      Caption = 'Kn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label39: TLabel
      Left = 20
      Top = 187
      Width = 24
      Height = 16
      Caption = 'Cou'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTgtCourse: TLabel
      Left = 124
      Top = 187
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
    object Label41: TLabel
      Left = 197
      Top = 187
      Width = 11
      Height = 16
      Caption = ' '#176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 273
      Height = 44
      BevelInner = bvLowered
      Caption = 'Informasi Kapal Target'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnlOwnShip: TPanel
    Left = 1008
    Top = 0
    Width = 272
    Height = 512
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
    object Label17: TLabel
      Left = 20
      Top = 368
      Width = 51
      Height = 16
      Caption = 'PROFILE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblProfile: TLabel
      Left = 124
      Top = 368
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
    object Label21: TLabel
      Left = 124
      Top = 335
      Width = 72
      Height = 16
      Caption = 'TX MASTER'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 20
      Top = 335
      Width = 39
      Height = 16
      Caption = 'STATE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 20
      Top = 306
      Width = 74
      Height = 16
      Caption = 'FREQ. BAND'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 124
      Top = 306
      Width = 50
      Height = 16
      Caption = 'X-BAND'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 20
      Top = 277
      Width = 47
      Height = 16
      Caption = 'RADAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 124
      Top = 277
      Width = 50
      Height = 16
      Caption = 'NAVR-S'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 20
      Top = 196
      Width = 24
      Height = 16
      Caption = 'LON'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblLongtitude: TLabel
      Left = 124
      Top = 196
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
    object lblLatitude: TLabel
      Left = 124
      Top = 168
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
    object Label9: TLabel
      Left = 20
      Top = 168
      Width = 24
      Height = 16
      Caption = 'LAT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 20
      Top = 134
      Width = 22
      Height = 16
      Caption = 'TTG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 20
      Top = 106
      Width = 24
      Height = 16
      Caption = 'ETA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEta: TLabel
      Left = 124
      Top = 106
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
    object lblTtg: TLabel
      Left = 124
      Top = 134
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
    object Label25: TLabel
      Left = 197
      Top = 106
      Width = 62
      Height = 16
      Caption = 'hh:mm:ss'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 197
      Top = 134
      Width = 43
      Height = 16
      Caption = 'hh:mm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 197
      Top = 168
      Width = 8
      Height = 16
      Caption = 'N'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 197
      Top = 196
      Width = 7
      Height = 16
      Caption = 'E'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 197
      Top = 50
      Width = 19
      Height = 16
      Caption = 'NM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 197
      Top = 78
      Width = 18
      Height = 16
      Caption = ' '#176'T'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblRange: TLabel
      Left = 124
      Top = 50
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
    object lblBearing: TLabel
      Left = 124
      Top = 78
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
    object Label1: TLabel
      Left = 20
      Top = 50
      Width = 25
      Height = 16
      Caption = 'RNG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 20
      Top = 78
      Width = 25
      Height = 16
      Caption = 'BRG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 20
      Top = 222
      Width = 25
      Height = 16
      Caption = 'SPD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSpeed: TLabel
      Left = 124
      Top = 222
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
    object Label8: TLabel
      Left = 197
      Top = 222
      Width = 16
      Height = 16
      Caption = 'Kn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 20
      Top = 250
      Width = 26
      Height = 16
      Caption = 'HDG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblHeading: TLabel
      Left = 124
      Top = 250
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
    object Label29: TLabel
      Left = 197
      Top = 250
      Width = 11
      Height = 16
      Caption = ' '#176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblJoystickVal: TLabel
      Left = 124
      Top = 400
      Width = 24
      Height = 16
      Caption = '----'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblJoystick: TLabel
      Left = 20
      Top = 400
      Width = 52
      Height = 16
      Caption = 'Joystick'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label10: TLabel
      Left = 164
      Top = 400
      Width = 8
      Height = 16
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblJoystickVal1: TLabel
      Left = 124
      Top = 422
      Width = 24
      Height = 16
      Caption = '----'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label23: TLabel
      Left = 164
      Top = 422
      Width = 8
      Height = 16
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblJoystickVal2: TLabel
      Left = 124
      Top = 444
      Width = 24
      Height = 16
      Caption = '----'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label28: TLabel
      Left = 164
      Top = 444
      Width = 8
      Height = 16
      Caption = '2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Shape1: TShape
      Left = 200
      Top = 414
      Width = 33
      Height = 32
      Visible = False
    end
    object pnl160: TPanel
      Left = 0
      Top = 0
      Width = 273
      Height = 44
      BevelInner = bvLowered
      Caption = 'Own Ship'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object tmrUpdateShipPos: TTimer
    Interval = 100
    OnTimer = UpdatePosition
    Left = 624
    Top = 496
  end
  object tmrUpdateForm: TTimer
    OnTimer = tmrUpdateFormTimer
    Left = 513
    Top = 233
  end
  object NLDJoystick1: TNLDJoystick
    Active = True
    OnButtonDown = NLDJoystick1ButtonDown
    OnButtonUp = NLDJoystick1ButtonUp
    OnMove = NLDJoystick1Move
    PollingInterval = -1
    Left = 713
    Top = 345
  end
end
