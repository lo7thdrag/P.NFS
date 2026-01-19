object TFLogBridge: TTFLogBridge
  Left = 419
  Top = 484
  Caption = 'Bridge'
  ClientHeight = 294
  ClientWidth = 1058
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
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 1058
    Height = 294
    Align = alClient
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 257
      Top = 1
      Width = 4
      Height = 292
      ExplicitLeft = 253
      ExplicitTop = 0
    end
    object Splitter2: TSplitter
      Left = 525
      Top = 1
      Width = 4
      Height = 292
      ExplicitTop = 2
    end
    object Splitter3: TSplitter
      Left = 795
      Top = 1
      Width = 4
      Height = 292
      ExplicitTop = 0
    end
    object pnlClient: TPanel
      Left = 1
      Top = 1
      Width = 256
      Height = 292
      Align = alLeft
      TabOrder = 0
      object mLogClient: TMemo
        Left = 1
        Top = 50
        Width = 254
        Height = 200
        Align = alClient
        BorderStyle = bsNone
        ScrollBars = ssBoth
        TabOrder = 0
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
        Top = 250
        Width = 254
        Height = 41
        Align = alBottom
        Caption = 'Status : Not Connected'
        TabOrder = 2
      end
    end
    object pnlServer: TPanel
      Left = 261
      Top = 1
      Width = 264
      Height = 292
      Align = alLeft
      TabOrder = 1
      ExplicitLeft = 257
      object mLogServer: TMemo
        Left = 1
        Top = 50
        Width = 262
        Height = 241
        Align = alClient
        BorderStyle = bsNone
        ScrollBars = ssBoth
        TabOrder = 0
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
      Height = 292
      Align = alLeft
      TabOrder = 2
      ExplicitLeft = 521
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
        Height = 241
        Align = alClient
        BorderStyle = bsNone
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object pnlPacket: TPanel
      Left = 799
      Top = 1
      Width = 258
      Height = 292
      Align = alClient
      Caption = 'pnlPacket'
      TabOrder = 3
      ExplicitLeft = 797
      ExplicitWidth = 270
      object pnlUppacket: TPanel
        Left = 1
        Top = 1
        Width = 256
        Height = 49
        Align = alTop
        Caption = 'Packet'
        TabOrder = 0
        ExplicitWidth = 268
      end
      object mmoPacket: TMemo
        Left = 1
        Top = 50
        Width = 256
        Height = 241
        Align = alClient
        BorderStyle = bsNone
        ScrollBars = ssBoth
        TabOrder = 1
        ExplicitWidth = 268
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
