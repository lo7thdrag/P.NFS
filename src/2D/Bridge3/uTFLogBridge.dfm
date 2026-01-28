object TFLogBridge: TTFLogBridge
  Left = 419
  Top = 484
  Caption = 'Bridge'
  ClientHeight = 379
  ClientWidth = 1057
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1Home: TAdvSmoothPanel
    Left = 0
    Top = 0
    Width = 1057
    Height = 379
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
    ExplicitTop = -6
    ExplicitWidth = 300
    ExplicitHeight = 300
    TMSStyle = 0
    object lbljudul: TLabel
      Left = 0
      Top = 0
      Width = 1057
      Height = 347
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
      Top = 347
      Width = 1057
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
      ExplicitTop = 268
      ExplicitWidth = 300
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 1057
    Height = 379
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1058
    ExplicitHeight = 294
    object Splitter1: TSplitter
      Left = 257
      Top = 1
      Width = 4
      Height = 377
      ExplicitLeft = 253
      ExplicitTop = 0
      ExplicitHeight = 292
    end
    object Splitter2: TSplitter
      Left = 525
      Top = 1
      Width = 4
      Height = 377
      ExplicitTop = 2
      ExplicitHeight = 292
    end
    object Splitter3: TSplitter
      Left = 795
      Top = 1
      Width = 4
      Height = 377
      ExplicitTop = 0
      ExplicitHeight = 292
    end
    object pnlClient: TPanel
      Left = 1
      Top = 1
      Width = 256
      Height = 377
      Align = alLeft
      TabOrder = 0
      ExplicitHeight = 292
      object mLogClient: TMemo
        Left = 1
        Top = 50
        Width = 254
        Height = 285
        Align = alClient
        BorderStyle = bsNone
        ScrollBars = ssBoth
        TabOrder = 0
        ExplicitHeight = 200
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
        Top = 335
        Width = 254
        Height = 41
        Align = alBottom
        Caption = 'Status : Not Connected'
        TabOrder = 2
        ExplicitTop = 250
      end
    end
    object pnlServer: TPanel
      Left = 261
      Top = 1
      Width = 264
      Height = 377
      Align = alLeft
      TabOrder = 1
      ExplicitHeight = 292
      object mLogServer: TMemo
        Left = 1
        Top = 50
        Width = 262
        Height = 326
        Align = alClient
        BorderStyle = bsNone
        ScrollBars = ssBoth
        TabOrder = 0
        ExplicitHeight = 241
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
      Height = 377
      Align = alLeft
      TabOrder = 2
      ExplicitHeight = 292
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
        Height = 326
        Align = alClient
        BorderStyle = bsNone
        ScrollBars = ssBoth
        TabOrder = 1
        ExplicitHeight = 241
      end
    end
    object pnlPacket: TPanel
      Left = 799
      Top = 1
      Width = 257
      Height = 377
      Align = alClient
      Caption = 'pnlPacket'
      TabOrder = 3
      ExplicitWidth = 258
      ExplicitHeight = 292
      object pnlUppacket: TPanel
        Left = 1
        Top = 1
        Width = 255
        Height = 49
        Align = alTop
        Caption = 'Packet'
        TabOrder = 0
        ExplicitWidth = 256
      end
      object mmoPacket: TMemo
        Left = 1
        Top = 50
        Width = 255
        Height = 326
        Align = alClient
        BorderStyle = bsNone
        ScrollBars = ssBoth
        TabOrder = 1
        ExplicitWidth = 256
        ExplicitHeight = 241
      end
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
