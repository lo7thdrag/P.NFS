object frmControlByNumber: TfrmControlByNumber
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 191
  ClientWidth = 223
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 274
    Height = 241
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    object lblApply: TLabel
      Left = 20
      Top = 165
      Width = 31
      Height = 16
      Caption = 'Apply'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblClose: TLabel
      Left = 164
      Top = 165
      Width = 31
      Height = 16
      Caption = 'Close'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 28
      Top = 125
      Width = 51
      Height = 16
      Caption = 'Track No'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 55
      Top = 42
      Width = 49
      Height = 16
      Caption = 'MSI TNo'
      Color = -1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 54
      Top = 74
      Width = 60
      Height = 16
      Caption = 'Link Y TNo'
      Color = -1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object edtTrackNo: TEdit
      Left = 136
      Top = 123
      Width = 73
      Height = 24
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Panel1: TPanel
      Left = -9
      Top = 160
      Width = 234
      Height = 1
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
    end
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 13
      Width = 185
      Height = 105
      TabOrder = 4
    end
    object btnLinkY: TRadioButton
      Left = 32
      Top = 72
      Width = 25
      Height = 25
      Caption = 'MSI TNo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object btnMSITNo: TRadioButton
      Left = 32
      Top = 40
      Width = 25
      Height = 25
      Caption = 'MSI TNo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 27
      Top = 8
      Width = 125
      Height = 17
      BevelOuter = bvNone
      Caption = 'Control By Number'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
end
