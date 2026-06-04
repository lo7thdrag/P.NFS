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
    object Label1: TLabel
      Left = 76
      Top = 53
      Width = 62
      Height = 19
      Caption = 'MSI TNo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 84
      Top = 61
      Width = 62
      Height = 19
      Caption = 'MSI TNo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 28
      Top = 125
      Width = 64
      Height = 19
      Caption = 'Track No'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object rdControlBynumber: TRadioGroup
      Left = 8
      Top = 16
      Width = 209
      Height = 137
      Caption = 'Control By Number'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      StyleElements = []
    end
    object btnMSITNo: TRadioButton
      Left = 32
      Top = 48
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
    object RadioButton1: TRadioButton
      Left = 32
      Top = 80
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
      TabOrder = 2
    end
    object edtTrackNo: TEdit
      Left = 136
      Top = 123
      Width = 73
      Height = 25
      TabOrder = 3
    end
  end
end
