object TFLogBridge: TTFLogBridge
  Left = 419
  Top = 484
  BorderStyle = bsNone
  Caption = 'Bridge'
  ClientHeight = 333
  ClientWidth = 250
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 250
    Height = 333
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 284
    ExplicitHeight = 261
    object Splitter1: TSplitter
      Left = 257
      Top = 1
      Width = 4
      Height = 300
      ExplicitLeft = 253
      ExplicitTop = 0
      ExplicitHeight = 292
    end
    object Splitter2: TSplitter
      Left = 525
      Top = 1
      Width = 4
      Height = 300
      ExplicitTop = 2
      ExplicitHeight = 292
    end
    object Splitter3: TSplitter
      Left = 795
      Top = 1
      Width = 4
      Height = 300
      ExplicitTop = 0
      ExplicitHeight = 292
    end
    object pnlClient: TPanel
      Left = 1
      Top = 1
      Width = 256
      Height = 300
      Align = alLeft
      TabOrder = 0
      ExplicitHeight = 259
      object mLogClient: TMemo
        Left = 1
        Top = 50
        Width = 254
        Height = 208
        Align = alClient
        BorderStyle = bsNone
        ScrollBars = ssBoth
        TabOrder = 0
        ExplicitHeight = 167
      end
      object pnlClientUp: TPanel
        Left = 1
        Top = 1
        Width = 254
        Height = 49
        Align = alTop
        Caption = 'Client 3D'
        TabOrder = 1
      end
      object pnlClientBottom: TPanel
        Left = 1
        Top = 258
        Width = 254
        Height = 41
        Align = alBottom
        Caption = 'Status : Not Connected'
        TabOrder = 2
        ExplicitTop = 217
      end
    end
    object pnlServer: TPanel
      Left = 261
      Top = 1
      Width = 264
      Height = 300
      Align = alLeft
      TabOrder = 1
      ExplicitHeight = 259
      object mLogServer: TMemo
        Left = 1
        Top = 50
        Width = 262
        Height = 249
        Align = alClient
        BorderStyle = bsNone
        ScrollBars = ssBoth
        TabOrder = 0
        ExplicitHeight = 208
      end
      object pnlServerUp: TPanel
        Left = 1
        Top = 1
        Width = 262
        Height = 49
        Align = alTop
        Caption = 'Server 2D'
        TabOrder = 1
      end
    end
    object pnlSetting: TPanel
      Left = 529
      Top = 1
      Width = 266
      Height = 300
      Align = alLeft
      TabOrder = 2
      ExplicitHeight = 259
      object pnlSettingUp: TPanel
        Left = 1
        Top = 1
        Width = 264
        Height = 49
        Align = alTop
        Caption = 'Setting'
        TabOrder = 0
      end
      object mLogSetting: TMemo
        Left = 1
        Top = 50
        Width = 264
        Height = 249
        Align = alClient
        BorderStyle = bsNone
        ScrollBars = ssBoth
        TabOrder = 1
        ExplicitHeight = 208
      end
    end
    object pnlPacket: TPanel
      Left = 799
      Top = 1
      Width = 232
      Height = 300
      Align = alClient
      Caption = 'pnlPacket'
      TabOrder = 3
      ExplicitWidth = 257
      ExplicitHeight = 259
      object pnlUppacket: TPanel
        Left = 1
        Top = 1
        Width = 230
        Height = 49
        Align = alTop
        Caption = 'Packet'
        TabOrder = 0
        ExplicitWidth = 255
      end
      object mmoPacket: TMemo
        Left = 1
        Top = 50
        Width = 230
        Height = 249
        Align = alClient
        Alignment = taCenter
        BorderStyle = bsNone
        ScrollBars = ssBoth
        TabOrder = 1
        ExplicitWidth = 255
        ExplicitHeight = 208
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 301
      Width = 248
      Height = 31
      Align = alBottom
      TabOrder = 4
      ExplicitTop = 477
      ExplicitWidth = 967
      DesignSize = (
        248
        31)
      object btnBack: TButton
        Left = 156
        Top = 3
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Back'
        TabOrder = 0
        OnClick = btnBackClick
        ExplicitLeft = 875
      end
    end
  end
  object pnl1Home: TAdvSmoothPanel
    Left = 0
    Top = 0
    Width = 250
    Height = 333
    Cursor = crDefault
    Caption.Location = plTopCenter
    Caption.HatchStyle = HatchStyleDiagonalBrick
    Caption.HTMLFont.Charset = DEFAULT_CHARSET
    Caption.HTMLFont.Color = clWindowText
    Caption.HTMLFont.Height = -13
    Caption.HTMLFont.Name = 'Tahoma'
    Caption.HTMLFont.Style = []
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -16
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = [fsBold]
    Caption.Top = 20
    Caption.ColorStart = clWhite
    Caption.ColorEnd = clWhite
    Caption.GradientType = gtHorizontal
    Caption.LineColor = clBlack
    Caption.Line = False
    Fill.Color = 5788239
    Fill.ColorTo = 15000804
    Fill.ColorMirror = 15000804
    Fill.ColorMirrorTo = 5788239
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = clSilver
    Fill.BorderWidth = 5
    Fill.Rounding = 10
    Fill.ShadowColor = clNone
    Fill.ShadowOffset = 10
    Fill.Glow = gmNone
    Version = '1.6.0.1'
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 1032
    ExplicitHeight = 509
    TMSStyle = 0
    object lbljudul: TLabel
      Left = 0
      Top = 0
      Width = 250
      Height = 301
      Align = alClient
      Alignment = taCenter
      Caption = 'BRIGDE NAFS'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5788239
      Font.Height = -40
      Font.Name = 'Deusex'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 196
      ExplicitHeight = 40
    end
    object btn1: TButton
      Left = 0
      Top = 301
      Width = 250
      Height = 32
      Align = alBottom
      Caption = 'Show Log'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btn1Click
      ExplicitTop = 229
      ExplicitWidth = 284
    end
  end
  object tmrShutdownServer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrShutdownServerTimer
    Left = 361
    Top = 58
  end
end
