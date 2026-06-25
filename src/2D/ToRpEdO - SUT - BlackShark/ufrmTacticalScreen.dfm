object FrmTacticalScreen: TFrmTacticalScreen
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmTacticalScreen'
  ClientHeight = 1080
  ClientWidth = 1920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBase: TPanel
    Left = 0
    Top = 0
    Width = 1920
    Height = 1080
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    object pnlUpperInfo: TPanel
      Left = 0
      Top = 0
      Width = 1440
      Height = 202
      Caption = 'pnlUpperInfo'
      TabOrder = 0
      object pnlOwnShip: TPanel
        Left = 0
        Top = 0
        Width = 240
        Height = 162
        Caption = 'Own Ship'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object pnlAlert: TPanel
        Left = 240
        Top = 0
        Width = 650
        Height = 162
        Caption = 'Alert'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object pnlSystemStatus: TPanel
        Left = 890
        Top = 0
        Width = 550
        Height = 162
        Caption = 'System Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object pnlOperatorMessages: TPanel
        Left = 0
        Top = 162
        Width = 1440
        Height = 40
        Caption = 'OperatorMessages'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object pnlRight: TPanel
      Left = 1440
      Top = 0
      Width = 480
      Height = 1080
      Caption = 'pnlUpperInfo'
      TabOrder = 1
      object pnlSystemInfo: TPanel
        Left = 0
        Top = 0
        Width = 480
        Height = 202
        Caption = 'SystemInfo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object pnlObjectInControl: TPanel
        Left = 0
        Top = 202
        Width = 480
        Height = 193
        Caption = 'Object In Control'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object pnlToolArea: TPanel
        Left = 0
        Top = 395
        Width = 480
        Height = 572
        Caption = 'Tool Area'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object pnlCursor: TPanel
        Left = 0
        Top = 967
        Width = 480
        Height = 113
        Caption = 'Cursor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object pnlTPGroup: TPanel
      Left = 0
      Top = 202
      Width = 1440
      Height = 878
      Caption = 'pnlUpperInfo'
      TabOrder = 2
      object pnlTacticalPicture: TPanel
        Left = 0
        Top = 0
        Width = 1440
        Height = 878
        Caption = 'Tactical Picture'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object tmrUpdateTP: TTimer
    OnTimer = tmrUpdateTPTimer
    Left = 944
    Top = 528
  end
end
