object frmAlertsandOpearatorMassage: TfrmAlertsandOpearatorMassage
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 161
  ClientWidth = 321
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 321
    Height = 161
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 2
      Width = 33
      Height = 16
      Caption = 'Alerts'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblOperatorMassage: TLabel
      Left = 8
      Top = 65
      Width = 279
      Height = 16
      Caption = 'Torpedo who catrorpd target 1100005 to MSI-01'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNumberAlert: TLabel
      Left = 56
      Top = 2
      Width = 14
      Height = 16
      Caption = '11'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pnlAlerts: TPanel
      Left = 8
      Top = 28
      Width = 281
      Height = 25
      BevelOuter = bvNone
      Caption = 'The at Threshold extended for surface black'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
end
