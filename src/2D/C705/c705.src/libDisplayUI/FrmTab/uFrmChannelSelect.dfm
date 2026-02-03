object frmChannelSelect: TfrmChannelSelect
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 889
  ClientWidth = 970
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
    Top = 752
    Width = 445
    Height = 9
    Shape = bsBottomLine
  end
  object Label51: TLabel
    Left = 32
    Top = 777
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
    Top = 809
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
  object pnlPlanCh: TPanel
    Left = 24
    Top = 24
    Width = 185
    Height = 41
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 'Plan Channel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 11754291
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pnlTgtCh: TPanel
    Left = 24
    Top = 80
    Width = 185
    Height = 41
    BevelInner = bvRaised
    Caption = 'Tgt. Channel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object pnlNavCh: TPanel
    Left = 24
    Top = 136
    Width = 185
    Height = 41
    BevelInner = bvRaised
    Caption = 'Nav. Channel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object pnlNavChContent: TPanel
    Left = 248
    Top = 24
    Width = 681
    Height = 521
    BevelInner = bvRaised
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 5
    object Label5: TLabel
      Left = 10
      Top = 463
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
    object Label6: TLabel
      Left = 10
      Top = 487
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
    object pnlNavContent_GyroCom: TPanel
      Left = 258
      Top = 79
      Width = 207
      Height = 32
      Alignment = taLeftJustify
      Caption = '1: Gyro. COM'
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
    object pnlNavContent_GyroNet: TPanel
      Left = 258
      Top = 117
      Width = 207
      Height = 32
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '2: Gyro. NET'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
    object Panel9: TPanel
      Left = 24
      Top = 24
      Width = 185
      Height = 41
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelKind = bkSoft
      BevelOuter = bvNone
      Caption = 'Nav. Channel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6168865
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Panel10: TPanel
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
  object pnlTgtChContent: TPanel
    Left = 248
    Top = 24
    Width = 681
    Height = 521
    BevelInner = bvRaised
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 4
    object Label3: TLabel
      Left = 10
      Top = 463
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
      Top = 487
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
    object pnlTgtContent_CCS: TPanel
      Left = 258
      Top = 79
      Width = 207
      Height = 32
      Alignment = taLeftJustify
      Caption = '1: CCS'
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
    object pnlTgtContent_SearchRadar: TPanel
      Left = 258
      Top = 117
      Width = 207
      Height = 32
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '2: Search Radar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 24
      Top = 24
      Width = 185
      Height = 41
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelKind = bkSoft
      BevelOuter = bvNone
      Caption = 'Target Channel'
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
  object pnlPlanChContent: TPanel
    Left = 248
    Top = 24
    Width = 681
    Height = 521
    BevelInner = bvRaised
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = 10
      Top = 463
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
      Top = 487
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
    object pnlPlanContent_RPSPlan: TPanel
      Left = 258
      Top = 79
      Width = 207
      Height = 32
      Alignment = taLeftJustify
      Caption = '1: RPS Plan'
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
    object pnlPlanContent_WCCPlan: TPanel
      Left = 258
      Top = 117
      Width = 207
      Height = 32
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '2: WCC Plan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
    object pnlHeader_PlanChannel: TPanel
      Left = 24
      Top = 24
      Width = 185
      Height = 41
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelKind = bkSoft
      BevelOuter = bvNone
      Caption = 'Plan Channel'
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
  end
end
