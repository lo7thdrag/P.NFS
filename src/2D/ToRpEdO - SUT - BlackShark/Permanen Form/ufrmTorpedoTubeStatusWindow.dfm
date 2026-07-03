object frmTorpedoTubeStatusWindow: TfrmTorpedoTubeStatusWindow
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 337
  ClientWidth = 296
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
    Width = 296
    Height = 337
    BevelEdges = []
    BevelOuter = bvNone
    TabOrder = 0
    object pnlTorpedo2: TPanel
      Left = 8
      Top = 6
      Width = 140
      Height = 80
      TabOrder = 0
      object lblTorpedo2: TLabel
        Left = 37
        Top = 1
        Width = 73
        Height = 14
        Caption = 'TORP READY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblNumber2: TLabel
        Left = 11
        Top = 20
        Width = 7
        Height = 14
        Caption = '2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblWTSRC2: TLabel
        Left = 123
        Top = 40
        Width = 12
        Height = 14
        Caption = 'W'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pbTubeSymbol2: TPaintBox
        Tag = 1
        Left = 69
        Top = 23
        Width = 51
        Height = 51
        OnPaint = pbTubeSymbol1Paint
      end
    end
    object pnlTorpedo4: TPanel
      Left = 7
      Top = 87
      Width = 140
      Height = 80
      TabOrder = 1
      object lblTorpedo4: TLabel
        Left = 38
        Top = 2
        Width = 73
        Height = 14
        Caption = 'TORP READY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblNumber4: TLabel
        Left = 8
        Top = 29
        Width = 7
        Height = 14
        Caption = '4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblWTSRC4: TLabel
        Left = 123
        Top = 38
        Width = 12
        Height = 14
        Caption = 'W'
        FocusControl = pnlTorpedo2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pbTubeSymbol4: TPaintBox
        Tag = 3
        Left = 69
        Top = 23
        Width = 51
        Height = 51
        OnPaint = pbTubeSymbol1Paint
      end
    end
    object pnlTorpedo6: TPanel
      Left = 7
      Top = 168
      Width = 140
      Height = 80
      TabOrder = 2
      object lblTorpedo6: TLabel
        Left = 43
        Top = 3
        Width = 64
        Height = 14
        Caption = 'MAN-HORIZ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblNumber6: TLabel
        Left = 10
        Top = 24
        Width = 7
        Height = 14
        Caption = '6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblWTSRC6: TLabel
        Left = 123
        Top = 39
        Width = 12
        Height = 14
        Caption = 'W'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pbTubeSymbol6: TPaintBox
        Tag = 5
        Left = 69
        Top = 23
        Width = 51
        Height = 51
        OnPaint = pbTubeSymbol1Paint
      end
    end
    object pnlTorpedo8: TPanel
      Left = 8
      Top = 249
      Width = 140
      Height = 80
      TabOrder = 3
      object lblTorpedo8: TLabel
        Left = 39
        Top = 2
        Width = 73
        Height = 14
        Caption = 'TORP READY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblNumber8: TLabel
        Left = 10
        Top = 22
        Width = 7
        Height = 14
        Caption = '8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblWTSRC8: TLabel
        Left = 123
        Top = 39
        Width = 12
        Height = 14
        Caption = 'W'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pbTubeSymbol8: TPaintBox
        Tag = 7
        Left = 69
        Top = 23
        Width = 51
        Height = 51
        OnPaint = pbTubeSymbol1Paint
      end
    end
    object pnlTorpedo1: TPanel
      Left = 149
      Top = 6
      Width = 140
      Height = 80
      TabOrder = 4
      object lblTorpedo1: TLabel
        Left = 35
        Top = 1
        Width = 73
        Height = 14
        Caption = 'TORP READY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
        OnClick = lblTorpedo1Click
      end
      object lblNumber1: TLabel
        Left = 10
        Top = 19
        Width = 7
        Height = 14
        Caption = '1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblWTSRC1: TLabel
        Left = 123
        Top = 39
        Width = 12
        Height = 14
        Caption = 'W'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pbTubeSymbol1: TPaintBox
        Left = 69
        Top = 23
        Width = 51
        Height = 51
        OnPaint = pbTubeSymbol1Paint
      end
    end
    object pnlTorpedo3: TPanel
      Left = 149
      Top = 87
      Width = 140
      Height = 80
      TabOrder = 5
      object lblTorpedo3: TLabel
        Left = 38
        Top = 2
        Width = 64
        Height = 14
        Caption = 'MSI-SRC-SA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblNumber3: TLabel
        Left = 10
        Top = 25
        Width = 7
        Height = 14
        Caption = '3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblWTSRC3: TLabel
        Left = 123
        Top = 39
        Width = 12
        Height = 14
        Caption = 'W'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pbTubeSymbol3: TPaintBox
        Tag = 2
        Left = 69
        Top = 23
        Width = 51
        Height = 51
        OnPaint = pbTubeSymbol1Paint
      end
    end
    object pnlTorpedo5: TPanel
      Left = 149
      Top = 168
      Width = 140
      Height = 80
      TabOrder = 6
      object lblTorpedo5: TLabel
        Left = 38
        Top = 2
        Width = 73
        Height = 14
        Caption = 'TORP READY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblNumber5: TLabel
        Left = 10
        Top = 22
        Width = 7
        Height = 14
        Caption = '5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblWTSRC5: TLabel
        Left = 123
        Top = 39
        Width = 12
        Height = 14
        Caption = 'W'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pbTubeSymbol5: TPaintBox
        Tag = 4
        Left = 69
        Top = 23
        Width = 51
        Height = 51
        OnPaint = pbTubeSymbol1Paint
      end
    end
    object pnlTorpedo7: TPanel
      Left = 149
      Top = 249
      Width = 140
      Height = 80
      TabOrder = 7
      object lblTorpedo7: TLabel
        Left = 39
        Top = 1
        Width = 73
        Height = 14
        Caption = 'TORP READY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblNumber7: TLabel
        Left = 11
        Top = 20
        Width = 7
        Height = 14
        Caption = '7'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblWTSRC7: TLabel
        Left = 123
        Top = 39
        Width = 12
        Height = 16
        Caption = 'W'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pbTubeSymbol7: TPaintBox
        Tag = 6
        Left = 69
        Top = 23
        Width = 51
        Height = 51
        OnPaint = pbTubeSymbol1Paint
      end
    end
  end
  object tmrDrawTube: TTimer
    OnTimer = tmrDrawTubeTimer
    Left = 136
    Top = 40
  end
end
