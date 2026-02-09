object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'System Server'
  ClientHeight = 300
  ClientWidth = 300
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
    Width = 300
    Height = 300
    Align = alClient
    Caption = 'SERVER NAFS'
    Color = clBackground
    ParentBackground = False
    TabOrder = 0
    object pnlContent2D: TPanel
      Left = 1
      Top = 1
      Width = 298
      Height = 344
      Align = alTop
      TabOrder = 0
      object pnlServer2D: TPanel
        Left = 1
        Top = 1
        Width = 296
        Height = 41
        Align = alTop
        Color = 13666138
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          296
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
          Left = 211
          Top = 8
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Back'
          TabOrder = 0
          OnClick = btnBackClick
        end
      end
      object pnlLogServer2D: TPanel
        Left = 1
        Top = 42
        Width = 296
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
          Width = 82
          Height = 299
          Align = alClient
          BorderStyle = bsNone
          ScrollBars = ssBoth
          TabOrder = 1
          WordWrap = False
        end
      end
    end
    object pnlContent3D: TPanel
      Left = 1
      Top = 345
      Width = 298
      Height = 4
      Align = alClient
      TabOrder = 1
      object pnlServer3D: TPanel
        Left = 1
        Top = 1
        Width = 296
        Height = 41
        Align = alTop
        Color = 13666138
        ParentBackground = False
        TabOrder = 0
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
        Width = 296
        Height = 17
        Align = alClient
        TabOrder = 1
        object Splitter2: TSplitter
          Left = 209
          Top = 1
          Width = 4
          Height = 15
          ExplicitHeight = 308
        end
        object mmoLog3D: TMemo
          Left = 213
          Top = 1
          Width = 82
          Height = 15
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvNone
          BorderStyle = bsNone
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
        object lbClients3D: TListBox
          Left = 1
          Top = 1
          Width = 208
          Height = 15
          Align = alLeft
          BorderStyle = bsNone
          ItemHeight = 13
          TabOrder = 1
        end
      end
    end
  end
  object pnl1Home: TAdvSmoothPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 300
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
    TMSStyle = 0
    object lbljudul: TLabel
      Left = 0
      Top = 0
      Width = 300
      Height = 268
      Align = alClient
      Alignment = taCenter
      Caption = 'SERVER NAFS'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5788239
      Font.Height = -40
      Font.Name = 'Deusex'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 200
      ExplicitHeight = 40
    end
    object btn1: TButton
      Left = 0
      Top = 268
      Width = 300
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
