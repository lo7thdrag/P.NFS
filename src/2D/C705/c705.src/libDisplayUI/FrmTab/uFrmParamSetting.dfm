object frmParamSetting: TfrmParamSetting
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmParamSetting'
  ClientHeight = 850
  ClientWidth = 954
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 27
    Top = 731
    Width = 445
    Height = 9
    Shape = bsBottomLine
  end
  object Label51: TLabel
    Left = 32
    Top = 756
    Width = 257
    Height = 18
    Caption = 'For select,Press [Up] or [down]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label53: TLabel
    Left = 32
    Top = 788
    Width = 264
    Height = 18
    Caption = '[Enter] for confir,[Esc] for return'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object pnlTgtChContent: TPanel
    Left = 248
    Top = 24
    Width = 681
    Height = 473
    BevelInner = bvRaised
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 4
    object Label3: TLabel
      Left = 10
      Top = 415
      Width = 429
      Height = 18
      Caption = 'For select,Press [Up] or [down],or Press the number'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 10
      Top = 439
      Width = 281
      Height = 18
      Caption = '[Enter] for confirm,[Esc] for return'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object pnlSeaState_Low: TPanel
      Left = 258
      Top = 79
      Width = 207
      Height = 32
      Alignment = taLeftJustify
      Caption = '1: Low'
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object pnlSeaState_High: TPanel
      Left = 258
      Top = 117
      Width = 207
      Height = 32
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '2: High'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
    object pnlHeader_SeaState: TPanel
      Left = 24
      Top = 24
      Width = 185
      Height = 41
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelKind = bkSoft
      BevelOuter = bvNone
      Caption = 'Sea State'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6168865
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Panel5: TPanel
      Left = 207
      Top = 24
      Width = 330
      Height = 41
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelKind = bkSoft
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6168865
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object pnlCaptureModeContent: TPanel
    Left = 248
    Top = 24
    Width = 681
    Height = 473
    BevelInner = bvRaised
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 5
    object Label1: TLabel
      Left = 10
      Top = 415
      Width = 429
      Height = 18
      Caption = 'For select,Press [Up] or [down],or Press the number'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 439
      Width = 281
      Height = 18
      Caption = '[Enter] for confirm,[Esc] for return'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 10
      Top = 391
      Width = 316
      Height = 18
      Caption = 'For change missile number,Press [Tab]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object pnlCaptureMode_Big: TPanel
      Left = 258
      Top = 79
      Width = 207
      Height = 32
      Alignment = taLeftJustify
      Caption = '1: Select the Big'
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object pnlCaptureMode_Left: TPanel
      Left = 258
      Top = 117
      Width = 207
      Height = 32
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '2: Select the Left'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
    object pnlHeader_CaptureMode: TPanel
      Left = 24
      Top = 24
      Width = 185
      Height = 41
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelKind = bkSoft
      BevelOuter = bvNone
      Caption = 'Missile No. 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6168865
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Panel6: TPanel
      Left = 207
      Top = 24
      Width = 330
      Height = 41
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelKind = bkSoft
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6168865
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object pnlCaptureMode_Right: TPanel
      Left = 258
      Top = 155
      Width = 207
      Height = 32
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '3: Select the Right'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
    end
    object pnlCaptureMode_Near: TPanel
      Left = 258
      Top = 193
      Width = 207
      Height = 32
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '4: Select the Near'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
    end
    object pnlCaptureMode_Far: TPanel
      Left = 258
      Top = 231
      Width = 207
      Height = 32
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '5: Select the Far'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 6
    end
    object pnlCaptureMode_Control: TPanel
      Left = 258
      Top = 269
      Width = 207
      Height = 32
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '6: Select the Control'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 7
    end
  end
  object pnlCaptureMode: TPanel
    Left = 24
    Top = 24
    Width = 185
    Height = 41
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 'CaptureMode'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 11754291
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pnlSeaState: TPanel
    Left = 24
    Top = 80
    Width = 185
    Height = 41
    BevelInner = bvRaised
    Caption = 'Sea State'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object pnlSeaTgtR: TPanel
    Left = 24
    Top = 136
    Width = 185
    Height = 41
    BevelInner = bvRaised
    Caption = 'Sea TGT R'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object pnlSeaTgtRContent: TPanel
    Left = 248
    Top = 24
    Width = 681
    Height = 473
    BevelInner = bvRaised
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 3
    object Label6: TLabel
      Left = 10
      Top = 439
      Width = 51
      Height = 18
      Caption = 'Target'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 106
      Top = 439
      Width = 74
      Height = 18
      Caption = 'NO       :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblTgtNoSea: TLabel
      Left = 186
      Top = 439
      Width = 100
      Height = 18
      Caption = '[0000,0000]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Panel36: TPanel
      Left = 42
      Top = 27
      Width = 159
      Height = 35
      Alignment = taLeftJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label40: TLabel
        Left = 10
        Top = 9
        Width = 28
        Height = 18
        Caption = 'No.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
    object pnlSeaTgtNo: TPanel
      Left = 200
      Top = 27
      Width = 159
      Height = 35
      Alignment = taLeftJustify
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object lblSeaTgtNoVal: TLabel
        Left = 10
        Top = 9
        Width = 7
        Height = 18
        Caption = '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel2: TPanel
      Left = 42
      Top = 62
      Width = 159
      Height = 35
      Alignment = taLeftJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label8: TLabel
        Left = 10
        Top = 9
        Width = 89
        Height = 18
        Caption = 'Range(km)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
    object pnlSeaTgtRng: TPanel
      Left = 200
      Top = 62
      Width = 159
      Height = 35
      Alignment = taLeftJustify
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      object lblSeaTgtRngVal: TLabel
        Left = 10
        Top = 9
        Width = 7
        Height = 18
        Caption = '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel4: TPanel
      Left = 42
      Top = 97
      Width = 159
      Height = 35
      Alignment = taLeftJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object Label10: TLabel
        Left = 10
        Top = 9
        Width = 117
        Height = 18
        Caption = 'Azimuth (deg)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
    object pnSeaTgtAzimuth: TPanel
      Left = 200
      Top = 97
      Width = 159
      Height = 35
      Alignment = taLeftJustify
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
      object lbSeaTgtAzimuthVal: TLabel
        Left = 10
        Top = 9
        Width = 7
        Height = 18
        Caption = '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel8: TPanel
      Left = 42
      Top = 132
      Width = 159
      Height = 35
      Alignment = taLeftJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object Label12: TLabel
        Left = 10
        Top = 9
        Width = 89
        Height = 18
        Caption = 'Speed (kn)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
    object pnlSeaTgtSpd: TPanel
      Left = 200
      Top = 132
      Width = 159
      Height = 35
      Alignment = taLeftJustify
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 7
      object lblSeaTgtSpdVal: TLabel
        Left = 10
        Top = 9
        Width = 7
        Height = 18
        Caption = '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel10: TPanel
      Left = 42
      Top = 167
      Width = 159
      Height = 35
      Alignment = taLeftJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      object Label14: TLabel
        Left = 10
        Top = 9
        Width = 117
        Height = 18
        Caption = 'Heading (deg)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
    object pnlSeaTgtHdg: TPanel
      Left = 200
      Top = 167
      Width = 159
      Height = 35
      Alignment = taLeftJustify
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 9
      object lblSeaTgtHdgVal: TLabel
        Left = 10
        Top = 9
        Width = 7
        Height = 18
        Caption = '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object pnlLandTgtA: TPanel
    Left = 24
    Top = 248
    Width = 185
    Height = 41
    BevelInner = bvRaised
    Caption = 'Land TGT A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object pnlSeaTgtA: TPanel
    Left = 24
    Top = 192
    Width = 185
    Height = 41
    BevelInner = bvRaised
    Caption = 'Sea TGT A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object Panel1: TPanel
    Left = 24
    Top = 304
    Width = 185
    Height = 41
    BevelInner = bvRaised
    Caption = 'Ship Attitude'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Visible = False
  end
end
