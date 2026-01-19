object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'System Server'
  ClientHeight = 701
  ClientWidth = 947
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
  object Splitter1: TSplitter
    Left = 0
    Top = 344
    Width = 947
    Height = 4
    Cursor = crVSplit
    Align = alTop
  end
  object pnlContent2D: TPanel
    Left = 0
    Top = 0
    Width = 947
    Height = 344
    Align = alTop
    TabOrder = 0
    object pnlServer2D: TPanel
      Left = 1
      Top = 1
      Width = 945
      Height = 41
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 13
        Top = 14
        Width = 128
        Height = 13
        Caption = 'Listen Port Server For 2D :'
      end
      object lbl2DServerPort: TLabel
        Left = 147
        Top = 14
        Width = 24
        Height = 13
        Caption = '5001'
      end
    end
    object pnlLogServer2D: TPanel
      Left = 1
      Top = 42
      Width = 945
      Height = 301
      Align = alClient
      TabOrder = 1
      object Splitter3: TSplitter
        Left = 209
        Top = 1
        Width = 4
        Height = 299
        ExplicitLeft = 217
        ExplicitTop = 2
      end
      object mmoLogClient2D: TMemo
        Left = 1
        Top = 1
        Width = 208
        Height = 299
        Align = alLeft
        BorderStyle = bsNone
        TabOrder = 0
      end
      object mmoLogClientData2D: TMemo
        Left = 213
        Top = 1
        Width = 731
        Height = 299
        Align = alClient
        BorderStyle = bsNone
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
        ExplicitLeft = 228
        ExplicitWidth = 735
      end
    end
  end
  object pnlContent3D: TPanel
    Left = 0
    Top = 348
    Width = 947
    Height = 353
    Align = alClient
    TabOrder = 1
    ExplicitTop = 368
    ExplicitHeight = 357
    object pnlServer3D: TPanel
      Left = 1
      Top = 1
      Width = 945
      Height = 41
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 13
        Top = 14
        Width = 128
        Height = 13
        Caption = 'Listen Port Server For 3D :'
      end
      object lbl3DServerPort: TLabel
        Left = 147
        Top = 14
        Width = 24
        Height = 13
        Caption = '5002'
      end
    end
    object pnlLogServer3D: TPanel
      Left = 1
      Top = 42
      Width = 945
      Height = 310
      Align = alClient
      TabOrder = 1
      ExplicitHeight = 314
      object Splitter2: TSplitter
        Left = 209
        Top = 1
        Width = 4
        Height = 308
      end
      object mmoLog3D: TMemo
        Left = 213
        Top = 1
        Width = 731
        Height = 308
        Align = alClient
        BevelInner = bvLowered
        BevelOuter = bvNone
        BorderStyle = bsNone
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
        ExplicitLeft = 248
        ExplicitWidth = 696
        ExplicitHeight = 312
      end
      object lbClients3D: TListBox
        Left = 1
        Top = 1
        Width = 208
        Height = 308
        Align = alLeft
        BorderStyle = bsNone
        ItemHeight = 13
        TabOrder = 1
        ExplicitHeight = 307
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
