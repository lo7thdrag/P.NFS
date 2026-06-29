object frmCursor: TfrmCursor
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 113
  ClientWidth = 480
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
    Width = 480
    Height = 113
    BevelOuter = bvNone
    TabOrder = 0
    object lblLat: TLabel
      Left = 232
      Top = 26
      Width = 71
      Height = 16
      Caption = '00'#176'00.000N '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblLong: TLabel
      Left = 232
      Top = 50
      Width = 81
      Height = 16
      Caption = '000'#176'00.000NE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 338
      Top = 26
      Width = 58
      Height = 16
      Caption = 'Depth (m)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDepth: TLabel
      Left = 416
      Top = 26
      Width = 39
      Height = 16
      Caption = '9999.9'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 182
      Top = 26
      Width = 17
      Height = 16
      Caption = 'Lat'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 182
      Top = 50
      Width = 27
      Height = 16
      Caption = 'Long'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbCursorPosition: TComboBox
      Left = 16
      Top = 24
      Width = 153
      Height = 24
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Lat/Long'
      Items.Strings = (
        'Lat/Long'
        'B/R OS'
        'UTM'
        'B/R Track'
        'CCG')
    end
  end
end
