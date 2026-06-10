object frmManualGuidance: TfrmManualGuidance
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmManualGuidance'
  ClientHeight = 92
  ClientWidth = 210
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
    Width = 249
    Height = 145
    BevelOuter = bvNone
    TabOrder = 0
    object lblManualGuidance: TLabel
      Left = 64
      Top = 7
      Width = 97
      Height = 16
      Caption = 'Manual Guidance'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDegMinus: TLabel
      Left = 20
      Top = 39
      Width = 31
      Height = 16
      Caption = 'Deg -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDegPlus: TLabel
      Left = 169
      Top = 39
      Width = 34
      Height = 16
      Caption = 'Deg +'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblcourse: TLabel
      Left = 8
      Top = 63
      Width = 75
      Height = 16
      Caption = 'Course (deg)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCourse: TEdit
      Left = 139
      Top = 64
      Width = 65
      Height = 21
      Color = clBlack
      MaxLength = 360
      TabOrder = 0
      Text = '0.0'
    end
  end
end
