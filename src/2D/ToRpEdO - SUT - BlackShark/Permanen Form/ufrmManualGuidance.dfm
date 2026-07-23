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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 249
    Height = 145
    BevelOuter = bvNone
    TabOrder = 0
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
    object lblCourseVal: TLabel
      Left = 151
      Top = 64
      Width = 53
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCourse: TEdit
      Left = 151
      Top = 64
      Width = 53
      Height = 21
      Alignment = taRightJustify
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 360
      ParentFont = False
      TabOrder = 0
      Text = '0'
      Visible = False
      OnEnter = edtCourseEnter
    end
    object pnlManualGuidance: TPanel
      Left = 5
      Top = 7
      Width = 198
      Height = 25
      Caption = 'Manual Guidance'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = pnlManualGuidanceClick
    end
    object pnlDegMinus: TPanel
      Left = 5
      Top = 38
      Width = 52
      Height = 20
      Caption = 'Deg -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = ChangeCourseDegree
    end
    object pnlDegPlus: TPanel
      Tag = 1
      Left = 151
      Top = 38
      Width = 52
      Height = 20
      Caption = 'Deg +'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = ChangeCourseDegree
    end
  end
  object tmrUpdateTorpCourse: TTimer
    OnTimer = tmrUpdateTorpCourseTimer
    Left = 104
    Top = 48
  end
end
