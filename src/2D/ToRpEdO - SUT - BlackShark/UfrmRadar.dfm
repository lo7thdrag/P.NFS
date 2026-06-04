object frmRadar: TfrmRadar
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmRadar'
  ClientHeight = 850
  ClientWidth = 954
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTopRadar: TPanel
    Left = 0
    Top = 0
    Width = 954
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnZoomIn: TButton
      Left = 7
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Zoom IN'
      TabOrder = 0
      OnClick = btnZoomInClick
    end
    object btnZoomOut: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Zoom Out'
      TabOrder = 1
      OnClick = btnZoomOutClick
    end
  end
  object pnlBtmRadar: TPanel
    Left = 0
    Top = 41
    Width = 954
    Height = 809
    Align = alClient
    TabOrder = 1
    object PaintBox1: TPaintBox
      Left = 1
      Top = 1
      Width = 952
      Height = 807
      Align = alClient
      ExplicitLeft = 0
      ExplicitTop = -2
      ExplicitHeight = 598
    end
  end
  object tmrDisplay: TTimer
    Enabled = False
    OnTimer = tmrDisplayTimer
    Left = 280
    Top = 96
  end
end
