object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'System Server'
  ClientHeight = 261
  ClientWidth = 284
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
  object pnl2Log: TPanel
    Left = 0
    Top = 0
    Width = 284
    Height = 261
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 208
    ExplicitTop = 304
    ExplicitWidth = 185
    ExplicitHeight = 41
    object pnlContent2D: TPanel
      Left = 1
      Top = 1
      Width = 282
      Height = 344
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 569
      object pnlServer2D: TPanel
        Left = 1
        Top = 1
        Width = 280
        Height = 41
        Align = alTop
        Color = 13666138
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 597
        DesignSize = (
          280
          41)
        object Label1: TLabel
          Left = 13
          Top = 14
          Width = 153
          Height = 16
          Caption = 'Listen Port Server For 2D :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl2DServerPort: TLabel
          Left = 176
          Top = 14
          Width = 28
          Height = 16
          Caption = '5001'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object btnBack: TButton
          Left = 195
          Top = 8
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Back'
          TabOrder = 0
          OnClick = btnBackClick
          ExplicitLeft = 492
        end
      end
      object pnlLogServer2D: TPanel
        Left = 1
        Top = 42
        Width = 280
        Height = 301
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 567
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
          Width = 66
          Height = 299
          Align = alClient
          BorderStyle = bsNone
          ScrollBars = ssBoth
          TabOrder = 1
          WordWrap = False
          ExplicitWidth = 353
        end
      end
    end
    object pnlContent3D: TPanel
      Left = 1
      Top = 345
      Width = 282
      Height = 281
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 0
      ExplicitTop = 4
      ExplicitWidth = 569
      ExplicitHeight = 582
      object pnlServer3D: TPanel
        Left = 1
        Top = 1
        Width = 280
        Height = 41
        Align = alTop
        Color = 13666138
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 567
        object Label2: TLabel
          Left = 13
          Top = 14
          Width = 153
          Height = 16
          Caption = 'Listen Port Server For 3D :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl3DServerPort: TLabel
          Left = 176
          Top = 14
          Width = 28
          Height = 16
          Caption = '5002'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
      object pnlLogServer3D: TPanel
        Left = 1
        Top = 42
        Width = 280
        Height = 238
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 567
        ExplicitHeight = 539
        object Splitter2: TSplitter
          Left = 209
          Top = 1
          Width = 4
          Height = 236
          ExplicitHeight = 308
        end
        object mmoLog3D: TMemo
          Left = 213
          Top = 1
          Width = 66
          Height = 236
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvNone
          BorderStyle = bsNone
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
          ExplicitWidth = 353
          ExplicitHeight = 537
        end
        object lbClients3D: TListBox
          Left = 1
          Top = 1
          Width = 208
          Height = 236
          Align = alLeft
          BorderStyle = bsNone
          ItemHeight = 13
          TabOrder = 1
          ExplicitHeight = 537
        end
      end
    end
  end
  object pnl1Home: TPanel
    Left = 0
    Top = 0
    Width = 284
    Height = 261
    Align = alClient
    Caption = 'SERVER NAFS'
    Color = 13666138
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 1
    ExplicitTop = -8
    ExplicitWidth = 432
    ExplicitHeight = 393
    object btn1: TButton
      Left = 1
      Top = 228
      Width = 282
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
      ExplicitLeft = 89
      ExplicitTop = 217
      ExplicitWidth = 97
    end
  end
  object tmrShutdownServer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrShutdownServerTimer
    Left = 9
    Top = 10
  end
end
