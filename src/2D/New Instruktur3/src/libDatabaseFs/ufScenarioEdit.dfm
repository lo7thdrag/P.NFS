object frmSceEditor: TfrmSceEditor
  Left = 1600
  Top = 432
  BorderStyle = bsNone
  Caption = 'Scenario Editor'
  ClientHeight = 1109
  ClientWidth = 1926
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AdvSmoothLabel10: TAdvSmoothLabel
    Left = 25
    Top = 28
    Width = 109
    Height = 20
    AutoSize = True
    Fill.ColorMirror = clNone
    Fill.ColorMirrorTo = clNone
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtSolid
    Fill.BorderColor = clNone
    Fill.Rounding = 0
    Fill.ShadowOffset = 0
    Fill.Glow = gmNone
    Caption.Text = 'Available KRI :'
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -13
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = [fsBold]
    Caption.ColorStart = clSilver
    Caption.ColorEnd = clWhite
    CaptionShadow.Text = 'Available KRI :'
    CaptionShadow.Font.Charset = DEFAULT_CHARSET
    CaptionShadow.Font.Color = clWindowText
    CaptionShadow.Font.Height = -27
    CaptionShadow.Font.Name = 'Tahoma'
    CaptionShadow.Font.Style = []
    Version = '1.6.1.0'
  end
  object pnlMain: TAdvSmoothPanel
    Left = 0
    Top = 0
    Width = 576
    Height = 1046
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
    Fill.Color = 7301478
    Fill.ColorTo = 10066329
    Fill.ColorMirror = 10066329
    Fill.ColorMirrorTo = 7301478
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
    TabOrder = 0
    TMSStyle = 0
    object pnlGeneral: TAdvSmoothPanel
      Left = 0
      Top = 0
      Width = 576
      Height = 275
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
      Fill.Color = 7301478
      Fill.ColorTo = 10066329
      Fill.ColorMirror = 10066329
      Fill.ColorMirrorTo = 7301478
      Fill.GradientType = gtVertical
      Fill.GradientMirrorType = gtVertical
      Fill.BorderColor = clSilver
      Fill.BorderWidth = 5
      Fill.Rounding = 10
      Fill.ShadowColor = clNone
      Fill.ShadowOffset = 10
      Fill.Glow = gmNone
      Version = '1.6.0.1'
      Align = alTop
      TabOrder = 0
      TMSStyle = 0
      object advsmthlbl1: TAdvSmoothLabel
        Left = 20
        Top = 70
        Width = 110
        Height = 20
        AutoSize = True
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtSolid
        Fill.BorderColor = clNone
        Fill.Rounding = 0
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Caption.Text = 'Scenario Name'
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clWindowText
        Caption.Font.Height = -13
        Caption.Font.Name = 'Tahoma'
        Caption.Font.Style = [fsBold]
        Caption.ColorStart = clSilver
        Caption.ColorEnd = clWhite
        CaptionShadow.Text = 'AdvSmoothLabel'
        CaptionShadow.Font.Charset = DEFAULT_CHARSET
        CaptionShadow.Font.Color = clWindowText
        CaptionShadow.Font.Height = -27
        CaptionShadow.Font.Name = 'Tahoma'
        CaptionShadow.Font.Style = []
        Version = '1.6.1.0'
      end
      object advsmthlbl2: TAdvSmoothLabel
        Left = 20
        Top = 135
        Width = 85
        Height = 20
        AutoSize = True
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtSolid
        Fill.BorderColor = clNone
        Fill.Rounding = 0
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Caption.Text = 'Description'
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clWindowText
        Caption.Font.Height = -13
        Caption.Font.Name = 'Tahoma'
        Caption.Font.Style = [fsBold]
        Caption.ColorStart = clSilver
        Caption.ColorEnd = clWhite
        CaptionShadow.Text = 'AdvSmoothLabel'
        CaptionShadow.Font.Charset = DEFAULT_CHARSET
        CaptionShadow.Font.Color = clWindowText
        CaptionShadow.Font.Height = -27
        CaptionShadow.Font.Name = 'Tahoma'
        CaptionShadow.Font.Style = []
        Version = '1.6.1.0'
      end
      object advsmthlbl3: TAdvSmoothLabel
        Left = 371
        Top = 135
        Width = 36
        Height = 20
        AutoSize = True
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtSolid
        Fill.BorderColor = clNone
        Fill.Rounding = 0
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Caption.Text = 'Port'
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clWindowText
        Caption.Font.Height = -13
        Caption.Font.Name = 'Tahoma'
        Caption.Font.Style = [fsBold]
        Caption.ColorStart = clSilver
        Caption.ColorEnd = clWhite
        CaptionShadow.Text = 'AdvSmoothLabel'
        CaptionShadow.Font.Charset = DEFAULT_CHARSET
        CaptionShadow.Font.Color = clWindowText
        CaptionShadow.Font.Height = -27
        CaptionShadow.Font.Name = 'Tahoma'
        CaptionShadow.Font.Style = []
        Version = '1.6.1.0'
      end
      object pnlPicture: TAdvSmoothPanel
        Left = 616
        Top = 11
        Width = 249
        Height = 185
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
        Fill.Color = 7301478
        Fill.ColorTo = 10066329
        Fill.ColorMirror = 10066329
        Fill.ColorMirrorTo = 7301478
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtVertical
        Fill.BorderColor = clSilver
        Fill.BorderWidth = 5
        Fill.Rounding = 10
        Fill.ShadowColor = clNone
        Fill.ShadowOffset = 10
        Fill.Glow = gmNone
        Version = '1.6.0.1'
        TabOrder = 4
        TMSStyle = 0
        object imgShip: TImage
          Left = 0
          Top = 0
          Width = 249
          Height = 185
          Align = alClient
          ParentShowHint = False
          ShowHint = True
          Stretch = True
          ExplicitLeft = 16
          ExplicitTop = -3
        end
      end
      object btnEditDatabase: TAdvSmoothButton
        Left = 380
        Top = 290
        Width = 114
        Height = 50
        Appearance.Font.Charset = DEFAULT_CHARSET
        Appearance.Font.Color = clWhite
        Appearance.Font.Height = -13
        Appearance.Font.Name = 'Tahoma'
        Appearance.Font.Style = [fsBold]
        Status.Caption = '0'
        Status.Appearance.Fill.Color = clRed
        Status.Appearance.Fill.ColorMirror = clNone
        Status.Appearance.Fill.ColorMirrorTo = clNone
        Status.Appearance.Fill.GradientType = gtSolid
        Status.Appearance.Fill.GradientMirrorType = gtSolid
        Status.Appearance.Fill.BorderColor = clGray
        Status.Appearance.Fill.Rounding = 0
        Status.Appearance.Fill.ShadowOffset = 0
        Status.Appearance.Fill.Glow = gmNone
        Status.Appearance.Font.Charset = DEFAULT_CHARSET
        Status.Appearance.Font.Color = clWhite
        Status.Appearance.Font.Height = -11
        Status.Appearance.Font.Name = 'Tahoma'
        Status.Appearance.Font.Style = []
        BevelColor = clGray
        Caption = 'Edit Scenario'
        Color = clBlack
        ParentFont = False
        TabOrder = 1
        Version = '2.1.3.0'
        OnClick = btnEditDatabaseClick
        TMSStyle = 0
      end
      object cbbPort: TComboBox
        Left = 414
        Top = 134
        Width = 136
        Height = 21
        TabOrder = 2
        Text = 'Surabaya'
        OnCloseUp = cbbPortCloseUp
        Items.Strings = (
          'Surabaya'
          'Jakarta'
          'Lepas Pantai '
          'BalikPapan'
          'Medan'
          'Makassar'
          'Karimunjawa'
          'Sangatta'
          'Situbondo')
      end
      object btnPortMore: TAdvSmoothButton
        Left = 500
        Top = 290
        Width = 100
        Height = 50
        Appearance.Font.Charset = DEFAULT_CHARSET
        Appearance.Font.Color = clWhite
        Appearance.Font.Height = -13
        Appearance.Font.Name = 'Tahoma'
        Appearance.Font.Style = [fsBold]
        Status.Caption = '0'
        Status.Appearance.Fill.Color = clRed
        Status.Appearance.Fill.ColorMirror = clNone
        Status.Appearance.Fill.ColorMirrorTo = clNone
        Status.Appearance.Fill.GradientType = gtSolid
        Status.Appearance.Fill.GradientMirrorType = gtSolid
        Status.Appearance.Fill.BorderColor = clGray
        Status.Appearance.Fill.Rounding = 0
        Status.Appearance.Fill.ShadowOffset = 0
        Status.Appearance.Fill.Glow = gmNone
        Status.Appearance.Font.Charset = DEFAULT_CHARSET
        Status.Appearance.Font.Color = clWhite
        Status.Appearance.Font.Height = -11
        Status.Appearance.Font.Name = 'Tahoma'
        Status.Appearance.Font.Style = []
        BevelColor = clGray
        Caption = 'More'
        Color = clBlack
        ParentFont = False
        TabOrder = 3
        Version = '2.1.3.0'
        OnClick = btnPortMoreClick
        TMSStyle = 0
      end
      object edtScenarioName: TCurvyEdit
        Left = 20
        Top = 96
        Width = 530
        Height = 24
        TabOrder = 0
        TabStop = False
        Version = '1.2.1.2'
        Controls = <>
        ImeName = ''
        Text = ''
      end
      object mmoKetSce: TMemo
        Left = 20
        Top = 161
        Width = 530
        Height = 92
        Lines.Strings = (
          '')
        TabOrder = 5
      end
      object AdvSmoothPanel13: TAdvSmoothPanel
        Left = 0
        Top = 0
        Width = 576
        Height = 55
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
        Fill.Color = 7301478
        Fill.ColorTo = 10066329
        Fill.ColorMirror = 10066329
        Fill.ColorMirrorTo = 7301478
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtVertical
        Fill.BorderColor = clSilver
        Fill.BorderWidth = 5
        Fill.Rounding = 10
        Fill.ShadowColor = clNone
        Fill.ShadowOffset = 10
        Fill.Glow = gmNone
        Version = '1.6.0.1'
        Align = alTop
        TabOrder = 6
        TMSStyle = 0
        object Label8: TLabel
          Left = 0
          Top = 0
          Width = 576
          Height = 55
          Align = alClient
          Alignment = taCenter
          Caption = 'General'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 59
          ExplicitHeight = 18
        end
      end
    end
    object pnlEnvirontment: TAdvSmoothPanel
      Left = 0
      Top = 275
      Width = 576
      Height = 771
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
      Fill.Color = 7301478
      Fill.ColorTo = 10066329
      Fill.ColorMirror = 10066329
      Fill.ColorMirrorTo = 7301478
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
      ExplicitLeft = -3
      ExplicitTop = 277
      DesignSize = (
        576
        771)
      TMSStyle = 0
      object AdvSmoothLabel3: TAdvSmoothLabel
        Left = 246
        Top = 25
        Width = 132
        Height = 27
        AutoSize = True
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtSolid
        Fill.BorderColor = clNone
        Fill.Rounding = 0
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Caption.Text = 'Environment'
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clWindowText
        Caption.Font.Height = -19
        Caption.Font.Name = 'Tahoma'
        Caption.Font.Style = [fsBold]
        Caption.ColorStart = clSilver
        Caption.ColorEnd = clWhite
        CaptionShadow.Text = 'Environment'
        CaptionShadow.Font.Charset = DEFAULT_CHARSET
        CaptionShadow.Font.Color = clWindowText
        CaptionShadow.Font.Height = -27
        CaptionShadow.Font.Name = 'Tahoma'
        CaptionShadow.Font.Style = []
        Version = '1.6.1.0'
      end
      object AdvSmoothLabel4: TAdvSmoothLabel
        Left = 26
        Top = 77
        Width = 72
        Height = 20
        AutoSize = True
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtSolid
        Fill.BorderColor = clNone
        Fill.Rounding = 0
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Caption.Text = 'Sea State'
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clWindowText
        Caption.Font.Height = -13
        Caption.Font.Name = 'Tahoma'
        Caption.Font.Style = [fsBold]
        Caption.ColorStart = clSilver
        Caption.ColorEnd = clWhite
        CaptionShadow.Text = 'AdvSmoothLabel'
        CaptionShadow.Font.Charset = DEFAULT_CHARSET
        CaptionShadow.Font.Color = clWindowText
        CaptionShadow.Font.Height = -27
        CaptionShadow.Font.Name = 'Tahoma'
        CaptionShadow.Font.Style = []
        Version = '1.6.1.0'
        Anchors = [akTop, akRight]
        ExplicitLeft = 20
      end
      object AdvSmoothLabel5: TAdvSmoothLabel
        Left = 26
        Top = 139
        Width = 109
        Height = 20
        AutoSize = True
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtSolid
        Fill.BorderColor = clNone
        Fill.Rounding = 0
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Caption.Text = 'Wind Direction'
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clWindowText
        Caption.Font.Height = -13
        Caption.Font.Name = 'Tahoma'
        Caption.Font.Style = [fsBold]
        Caption.ColorStart = clSilver
        Caption.ColorEnd = clWhite
        CaptionShadow.Text = 'AdvSmoothLabel'
        CaptionShadow.Font.Charset = DEFAULT_CHARSET
        CaptionShadow.Font.Color = clWindowText
        CaptionShadow.Font.Height = -27
        CaptionShadow.Font.Name = 'Tahoma'
        CaptionShadow.Font.Style = []
        Version = '1.6.1.0'
        Anchors = [akTop, akRight]
        ExplicitLeft = 20
      end
      object advsmthlbl4: TAdvSmoothLabel
        Left = 26
        Top = 201
        Width = 105
        Height = 20
        AutoSize = True
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtSolid
        Fill.BorderColor = clNone
        Fill.Rounding = 0
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Caption.Text = 'Current Speed'
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clWindowText
        Caption.Font.Height = -13
        Caption.Font.Name = 'Tahoma'
        Caption.Font.Style = [fsBold]
        Caption.ColorStart = clSilver
        Caption.ColorEnd = clWhite
        CaptionShadow.Text = 'AdvSmoothLabel'
        CaptionShadow.Font.Charset = DEFAULT_CHARSET
        CaptionShadow.Font.Color = clWindowText
        CaptionShadow.Font.Height = -27
        CaptionShadow.Font.Name = 'Tahoma'
        CaptionShadow.Font.Style = []
        Version = '1.6.1.0'
        Anchors = [akTop, akRight]
        ExplicitLeft = 20
      end
      object AdvSmoothLabel14: TAdvSmoothLabel
        Left = 116
        Top = 295
        Width = 109
        Height = 20
        AutoSize = True
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtSolid
        Fill.BorderColor = clNone
        Fill.Rounding = 0
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Caption.Text = 'Wind Direction'
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clWindowText
        Caption.Font.Height = -13
        Caption.Font.Name = 'Tahoma'
        Caption.Font.Style = [fsBold]
        Caption.ColorStart = clSilver
        Caption.ColorEnd = clWhite
        CaptionShadow.Text = 'AdvSmoothLabel'
        CaptionShadow.Font.Charset = DEFAULT_CHARSET
        CaptionShadow.Font.Color = clWindowText
        CaptionShadow.Font.Height = -27
        CaptionShadow.Font.Name = 'Tahoma'
        CaptionShadow.Font.Style = []
        Version = '1.6.1.0'
        Anchors = [akTop, akRight]
        ExplicitLeft = 110
      end
      object AdvSmoothLabel15: TAdvSmoothLabel
        Left = 339
        Top = 295
        Width = 126
        Height = 20
        AutoSize = True
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtSolid
        Fill.BorderColor = clNone
        Fill.Rounding = 0
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Caption.Text = 'Current Direction'
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clWindowText
        Caption.Font.Height = -13
        Caption.Font.Name = 'Tahoma'
        Caption.Font.Style = [fsBold]
        Caption.ColorStart = clSilver
        Caption.ColorEnd = clWhite
        CaptionShadow.Text = 'AdvSmoothLabel'
        CaptionShadow.Font.Charset = DEFAULT_CHARSET
        CaptionShadow.Font.Color = clWindowText
        CaptionShadow.Font.Height = -27
        CaptionShadow.Font.Name = 'Tahoma'
        CaptionShadow.Font.Style = []
        Version = '1.6.1.0'
        Anchors = [akTop, akRight]
        ExplicitLeft = 333
      end
      object advsmthlbl5: TAdvSmoothLabel
        Left = 26
        Top = 461
        Width = 96
        Height = 20
        AutoSize = True
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtSolid
        Fill.BorderColor = clNone
        Fill.Rounding = 0
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Caption.Text = 'Temperature'
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clWindowText
        Caption.Font.Height = -13
        Caption.Font.Name = 'Tahoma'
        Caption.Font.Style = [fsBold]
        Caption.ColorStart = clSilver
        Caption.ColorEnd = clWhite
        CaptionShadow.Text = 'AdvSmoothLabel'
        CaptionShadow.Font.Charset = DEFAULT_CHARSET
        CaptionShadow.Font.Color = clWindowText
        CaptionShadow.Font.Height = -27
        CaptionShadow.Font.Name = 'Tahoma'
        CaptionShadow.Font.Style = []
        Version = '1.6.1.0'
        Anchors = [akTop, akRight]
        ExplicitLeft = 20
      end
      object advsmthlbl7: TAdvSmoothLabel
        Left = 26
        Top = 523
        Width = 144
        Height = 20
        AutoSize = True
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtSolid
        Fill.BorderColor = clNone
        Fill.Rounding = 0
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Caption.Text = 'Barometer Pressure'
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clWindowText
        Caption.Font.Height = -13
        Caption.Font.Name = 'Tahoma'
        Caption.Font.Style = [fsBold]
        Caption.ColorStart = clSilver
        Caption.ColorEnd = clWhite
        CaptionShadow.Text = 'AdvSmoothLabel'
        CaptionShadow.Font.Charset = DEFAULT_CHARSET
        CaptionShadow.Font.Color = clWindowText
        CaptionShadow.Font.Height = -27
        CaptionShadow.Font.Name = 'Tahoma'
        CaptionShadow.Font.Style = []
        Version = '1.6.1.0'
        Anchors = [akTop, akRight]
        ExplicitLeft = 20
      end
      object advsmthlbl6: TAdvSmoothLabel
        Left = 26
        Top = 585
        Width = 69
        Height = 20
        AutoSize = True
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtSolid
        Fill.BorderColor = clNone
        Fill.Rounding = 0
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Caption.Text = 'Humidity'
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clWindowText
        Caption.Font.Height = -13
        Caption.Font.Name = 'Tahoma'
        Caption.Font.Style = [fsBold]
        Caption.ColorStart = clSilver
        Caption.ColorEnd = clWhite
        CaptionShadow.Text = 'AdvSmoothLabel'
        CaptionShadow.Font.Charset = DEFAULT_CHARSET
        CaptionShadow.Font.Color = clWindowText
        CaptionShadow.Font.Height = -27
        CaptionShadow.Font.Name = 'Tahoma'
        CaptionShadow.Font.Style = []
        Version = '1.6.1.0'
        Anchors = [akTop, akRight]
        ExplicitLeft = 20
      end
      object advsmthlbl8: TAdvSmoothLabel
        Left = 26
        Top = 647
        Width = 82
        Height = 20
        AutoSize = True
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtSolid
        Fill.BorderColor = clNone
        Fill.Rounding = 0
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Caption.Text = 'Fog Height'
        Caption.Font.Charset = DEFAULT_CHARSET
        Caption.Font.Color = clWindowText
        Caption.Font.Height = -13
        Caption.Font.Name = 'Tahoma'
        Caption.Font.Style = [fsBold]
        Caption.ColorStart = clSilver
        Caption.ColorEnd = clWhite
        CaptionShadow.Text = 'AdvSmoothLabel'
        CaptionShadow.Font.Charset = DEFAULT_CHARSET
        CaptionShadow.Font.Color = clWindowText
        CaptionShadow.Font.Height = -27
        CaptionShadow.Font.Name = 'Tahoma'
        CaptionShadow.Font.Style = []
        Version = '1.6.1.0'
        Anchors = [akTop, akRight]
        ExplicitLeft = 20
      end
      object vrwhlSeaDirection: TVrWheel
        Left = 352
        Top = 324
        Width = 100
        Height = 100
        MaxValue = 360
        BackImage.Data = {
          66750000424D6675000000000000360000002800000064000000640000000100
          18000000000030750000C30E0000C30E00000000000000000000009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          960000960000960000960000960073BA7389C2899CC89CA7CCA7AFCFAFB4D0B4
          B4D0B4B1CFB1A9CCA99FC99F8EC48E78BC785CB25C0096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          960000960000960053AF5387C287B3D1B3CFD9CFDDDBDDE1DAE1DFD7DFDBD2DB
          D6CED6D3CCD3D1CAD1D3CDD3D3CDD3D3CDD3D7D0D7D6CED6DAD1DADFD6DFE1DA
          E1DFDBDFD3DAD3BAD3BA91C69100960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600269F2669B869ABCFABD6DCD6E4DEE4DFD7DFD3CCD3C5C2C5
          BBB9BBB3B2B3ADADADA8A8A8A6A6A69A9A9A9595957F7F7F8080808484847A7B
          7AA3A4A3A8A8A8ACACACB2B2B2B9B8B9C3C0C3D0CAD0DED5DEE5DCE5DBDDDBB6
          D2B677BD77009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600A2CDA2DADEDAE6DDE6D9D2D9C6C3C6
          B8B7B8ADADADA4A4A49D9D9D9797979191918D8D8D8A8A8A8B8B8B7070705B5B
          5B4C4C4C4646464C4C4C5151517878788C8C8C8C8C8C9191919595959B9B9BA3
          A3A3ACACACB6B5B6C3C1C3D5CFD5E5DCE5DFDFDF009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600C0D7C0E8E2E8DED7DE
          C9C6C9B7B7B7ABABABA0A0A09696968E8E8E8888888282827E7E7E7A7A7A7878
          787676767575755050505454544141413939394F4F4F55555565656578787877
          77777B7B7B7E7E7E8181818787878E8E8E9696969F9F9FA9AAA9B5B5B5C5C3C5
          DBD4DBEAE1EACDDCCD78BD780096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600C8DBC8
          EBE3EBD9D3D9C1C0C1B1B1B1A4A4A49999998E8E8E8686867F7F7F7A7A7A7575
          757272726F6F6F6D6D6D6B6B6B6A6A6A6B6B6B3F3F3F4F4F4F44444440404041
          41413B3B3B6464646B6B6B6B6B6B6D6D6D7070707373737575757979797E7E7E
          8585858D8D8D979797A2A2A2B0B0B0BEBEBED4D0D4EBE1EBD5DFD579BE790096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600BDD8BDEEE5EEDAD5DAC1C1C1B1B1B1A2A2A29696968B8B8B8282827B7B
          7B7575757171716D6D6D6A6A6A69696966666665656564646463636363636364
          64646262626060606262626060605F5F5F646464636363646464646564676667
          6969696A6A6A6E6E6E7171717575757A7A7A818181898989949494A1A1A1AEAF
          AFBFBFBFD5D1D5EDE3EDCFDECF5EB55E00960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600008F00009600009600ECE8ECE3DBE3C6C6C6B5B4B4A5A4A49797978B8B
          8B8181817979797474746F6F6F6B6B6B69696967676765656563636361616161
          61616060606060605F5F5F6060606060605858585555556060606060605F5F5F
          6060606060606262626161616363636565656666666969696C6C6C7070707373
          737979798080808A8A8A959595A3A3A3B2B2B2C2C3C2DDD7DDF0E8F0B0D4AF00
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000090004CAF4CD2E1D2F0E6F0D1D0D1BCBCBCABAB
          AB9C9C9C8E8E8E8383837B7B7B7474746F6F6F6B6B6B68686865656563636362
          62626262626262626161615757576363636464646464646565656B6B6B3C3C3C
          2D2D2D6B6B6B6565656565656565656565655757576161616363636363636262
          626464646666666868686C6C6C6F6F6F7474747A7A7A8383838D8D8D9A9A9AA9
          A9A9BABABACCCCCCEBE2EBE3E6E3009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          00960000960000960000960000960000960000960006940683C583F1ECF1E4DE
          E4C8C8C8B6B6B6A4A4A49595958888887E7E7E7777777171716C6C6C69696966
          66666464646464646464646565656767676A6A6A6E6E6E5B5B5B707070797979
          7B7B7B7C7C7C8383834949493838388484847C7C7C7B7B7B7A7A7A7575755B5B
          5B6D6D6D6B6B6B6868686666666565656666666565656767676A6A6A6D6D6D71
          71717777777E7E7E888888939393A2A2A2B3B3B3C4C5C4DDDADDF5ECF5A2D0A2
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600009600009600009600009600009600009600009600009600009600199B
          19AFD5AFF7EDF7D9D7D9C4C4C4B1B1B1A0A0A09292928686867C7C7C75757570
          70706C6C6C6969696767676868686262625959597171717575757B7B7B838383
          8E8E8E7777778B8B8B9E9E9EA0A0A0A1A1A1AEAEAE5B5B5B444444AEAEAEA3A3
          A3A1A1A1A0A0A09090907373738F8F8F8585857D7D7D7676767272725E5E5E5F
          5F5F6969696868686A6A6A6D6D6D7171717575757C7C7C8484849090909E9E9E
          AFAFAFC1C1C1D4D3D4F4EAF4CBE1CB0096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960029A229CCE2CCF5EBF5D4D4D4C1C1C1AFAFAF9D9D9D90909085
          85857C7C7C7575757171716F6F6F6A6A6A6A6A6A6B6B6B7070707676765F5F5F
          8383839494949E9E9EA9A9A9B3B3B3B6B6B6BEBEBEC7C7C7C9C9C9CACACAD4D4
          D49292927F7F7FD4D4D4CCCCCCCACACAC7C7C7BFBFBFB4B4B4B5B5B5ABABABA0
          A0A09696968B8B8B6262627474747272726D6D6D6B6B6B6B6B6B707070727272
          7575757B7B7B8484848E8E8E9C9C9CACACACBEBFBED1D1D1EEE7EEE3EAE348AE
          4800960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960035A735DDE8DDF2EAF2D4D4D4C2C2C2AF
          AFAF9D9D9D9090908585857C7C7C7676767373736A6A6A666666737373747474
          7C7C7C8787879797978F8F8FA2A2A2BDBDBDC6C6C6CECECED6D6D6DDDDDDE3E3
          E3E7E7E7EAEAEAECECECECECECEFEFEFF0F0F0ECECECECECECEBEBEBE8E8E8E4
          E4E4E0E0E0D8D8D8D0D0D0C8C8C8BFBFBFA9A9A98E8E8E9A9A9A8A8A8A7F7F7F
          7777777474746969696969697474747777777D7D7D8484848F8F8F9C9C9CACAC
          ACBEBEBED0D1D0EBE6EBEFEFEF59B45900960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          000096000096000096000096000096000096000096000096003AA93AE5ECE5F1
          EAF1D4D4D4C3C3C3B0B0B09F9F9F9292928787877F7F7F797979757575757575
          6565652424247D7D7D8D8D8D999999AAAAAAB9B9B9C8C8C8D2D2D2DCDCDCE4E4
          E4EDEDEDF4F4F4F9F9F9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFEFAFAFAF5F5F5EEEEEEE6E6E6DDDDDDD4D4D4
          CBCBCBBCBCBCADADAD9D9D9D8F8F8F8787872B2B2B5858587979797676767A7A
          7A7F7F7F8787879191919F9F9FAEAEAEC0C0C0D2D3D2EAE6EAF6F2F65FB75F00
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600E4EEE4F3ECF3D7D8D7C6C6C6B4B4B4A3A3A39696968A8A8A838383
          7D7D7D7979797878787B7B7B898989424242525252B6B6B6BDBDBDCCCCCCD8D8
          D8E3E3E3EEEEEEF7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8EC
          ECECEBEBEBECECECECECECEBEBEBECECECF8F8F8FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF9F9F9F0F0F0E6E6E6DADADACFCFCFC0C0C0BABABA6E6E6E3232
          328888887E7E7E7A7A7A7A7A7A7E7E7E8383838B8B8B959595A1A1A1B2B2B2C3
          C3C3D4D5D4EDE8EDF7F3F7009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600DEEBDEF7EFF7DBDCDBCCCCCCB9B9B9A8A8A8
          9A9A9A8F8F8F8787878383838080807E7E7E8383838C8C8C9E9E9EA0A0A03030
          30AFAFAFDFDFDFE6E6E6F2F2F2FCFCFCFFFFFFFFFFFFFFFFFFF5F5F5CCCCCC9D
          9D9D7272724C4C4C363636232323232323232323232323232323232323363636
          4C4C4C7272729D9D9DCCCCCCF5F5F5FFFFFFFFFFFFFFFFFFFEFEFEF5F5F5E9E9
          E9E0E0E0C3C3C3313131909090A5A5A58F8F8F86868680808081818184848487
          87878F8F8F999999A7A7A7B6B6B6C8C8C8D9DAD9F0EBF0F3F4F3009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600149A14CCE5CCFCF3FCE0E0E0
          D0D0D0BEBEBEAEAEAEA0A0A09595958D8D8D8888887B7B7B8282828C8C8C9696
          96A6A6A6B9B9B9D0D0D0ABABABCBCBCBF8F8F8FEFEFEFFFFFFFFFFFFF7F7F7B8
          B8B86D6D6D3131311010100303030303030606060909090D0D0D0D0D0D0D0D0D
          0D0D0D0D0D0D0D0D0D0909090606060303030303031010103131316D6D6DB8B8
          B8F7F7F7FFFFFFFFFFFFFFFFFFF9F9F9D8D8D8A0A0A0D2D2D2BDBDBDAAAAAA9A
          9A9A8F8F8F8686867A7A7A8888888D8D8D9494949F9F9FACACACBCBCBCCECECE
          DDDEDDF5F0F5E8F0E82EA62E0096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          ABD9ABFFF8FFE5E5E5D6D6D6C5C5C5B4B4B4A6A6A69A9A9A9292928D8C8C8C8C
          8C7E7E7E6B6B6B9D9D9DB0B0B0C2C2C2D3D3D3E0E0E0F7F7F7FFFFFFFFFFFFFF
          FFFFE4E4E48C8C8C3333330909090202020A0A0A101010121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          121010100A0A0A0202020909093333338C8C8CE4E4E4FFFFFFFFFFFFFFFFFFFB
          FBFBE3E3E3D6D6D6C7C7C7B4B4B4A5A5A57272727979798E8E8E8D8D8D929292
          9A9A9AA5A5A5B2B2B2C2C2C2D2D2D2E2E3E2FDF4FDD1E8D10096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096007AC57AFFFBFFEBEAEBDBDBDBCBCBCBBABABAACACACA0A0
          A09797979292928F8F8F9191919D9D9D8D8D8D9F9F9FCDCDCDD9D9D9E7E7E7F7
          F7F7FFFFFFFFFFFFEAEAEA818181202020020202090909111111121212121212
          121212121212121212111111111111100F0F0F0F0F0F0F0F0F0F0F0F0F0F100F
          0F11111111111112121212121212121212121212121211111109090902020220
          2020818181EAEAEAFFFFFFFFFFFFFAFAFAEBEBEBDCDCDCD1D1D1AAAAAA898989
          A0A0A0949494919191939393989898A0A0A0ABABABB9B9B9C9C9C9DADAD9E7E8
          E7FFFAFF00960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096003FAD3FF8F8F8F3EFF3E1E1E1D2D2
          D2C2C2C2B3B3B3A7A7A79E9E9E9898989595959696969E9E9EABABABBFBFBFCD
          CDCDDDDDDDEDEDEDFCFCFCFFFFFFFFFFFFA3A3A32929290101010C0C0C121212
          1212121212121212121212121212121314141718181E1E1E2425252D2E2E2E2F
          2F2E2F2F2E2F2F2E2F2F2D2E2E2425251E1E1E17181813141412121212121212
          12121212121212121212120C0C0C010101292929A3A3A3FFFFFFFFFFFFFDFDFD
          F0F0F0E0E0E0D0D0D0C3C3C3B0B0B0A2A2A29999999797979898989E9E9EA7A7
          A7B2B2B2C0C0C0D0D0D0E0E0E0EDECEDFFFCFF00960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600009600009600009600009600009600009600009600009600009600D1EA
          D1FDF6FDE7E7E7D9D9D9C9C9C9BABABAADADADA3A3A39D9D9D9D9D9D9B9B9BA1
          A1A1AEAEAEC1C1C1D2D2D2E0E0E0F0F0F0FEFEFEFFFFFFE0E0E0585858040404
          0909091212121212121212121313131211111414141D1D1D2A2B2B3536363D3E
          3E4142424445454445454445454445454445454445454445454445454142423D
          3E3E3536362A2B2B1D1D1D141414121111131313121212121212121212090909
          040404585858E0E0E0FFFFFFFFFFFFF4F4F4E3E3E3D6D6D6C5C5C5B3B3B3A5A5
          A59D9D9D9E9E9E9E9E9EA3A3A3ACACACB8B8B8C6C6C6D7D7D7E5E5E5F7F3F7EE
          F5EE009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960089CC89FFFDFFEBECEBDFDFDFD0D0D0C0C0C0B3B3B3A8A8A8A2
          A2A2989898808080A4A4A4B1B1B1C1C1C1D2D2D2E0E0E0F2F2F2FFFFFFFFFFFF
          BDBDBD2626260202021111111212121212121213131111111717172627273838
          3841434344454543444442434341424241424241424241424241424241424241
          4242414242414242414242424343434444444545414343383838262727171717
          111111121313121212121212111111010101262626BDBDBDFFFFFFFFFFFFF6F6
          F6E4E4E4D6D6D6C6C6C6B5B5B5ABABAB848484959595A3A3A3A8A8A8B2B2B2BE
          BEBECDCDCDDDDDDDEAEAEAFFFAFFB5DEB5009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960034A934F6F9F6F5F2F5E5E5E5D7D7D7C7
          C7C7B9B9B9AEAEAEA6A6A6A1A1A1A1A1A1888888828282BEBEBED3D3D3DFDFDF
          F2F2F2FFFFFFFFFFFF9B9B9B0D0D0D0808081414141212121313131212121515
          152928293D3E3E44454543444441424241424241424241424241424241424241
          4242414242414242414242414242414242414242414242414242414242414242
          4142424344444445453D3E3E2929281515151212121313131212121313130808
          080D0D0D9B9B9BFFFFFFFFFFFFF6F6F6E3E3E3D6D6D6C5C5C58B8B8B858585A2
          A2A2A2A2A2A6A6A6ADADADB8B8B8C5C5C5D5D5D5E3E3E3F1EFF1FFFDFF009600
          0096000096000096000096000096000096000096000096000096000096000096
          00009600009600009600009600009600009600009600009600009600B5DEB5FF
          FBFFEAEBEADDDDDDCFCFCFC0C0C0B4B4B4AAAAAAA4A4A4A2A2A2A5A5A5B3B3B3
          B1B1B1CCCCCCDFDFDFF1F1F1FFFFFFFFFFFF8B8B8B0707070D0D0D1515151414
          141414141212122021213A3B3B44454543444441424241424241424241424241
          4242414242414242414242414242414242414242414242414242414242414242
          4142424142424142424142424142424142424142424344444445453A3B3B2021
          211212121313131313131414140D0D0D0707078B8B8BFFFFFFFFFFFFF5F5F5E2
          E2E2D2D2D2B0B0B0B6B6B6A9A9A9A4A4A4A6A6A6AAAAAAB3B3B3BEBEBECCCCCC
          DCDCDCE8E9E8FBF7FBDBEEDB0096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          96000096004DB34DFEFDFEF2F1F2E5E5E5D7D7D7C7C7C7BBBBBBB0B0B0A8A8A8
          A5A5A5A7A7A7AFAFAFBCBCBCD0D0D0DCDCDCEEEEEEFFFFFFFFFFFF8C8C8C0303
          030E0E0E1414141414141313131414142D2E2E43444443444441424241424241
          4242414242414242414242414242414242414242414242414242414242414242
          4142424142424142424142424142424142424142424142424142424142424142
          424142424142424344444344432D2F2E1515151313131414141414140E0E0E03
          03038C8C8CFFFFFFFFFFFFF2F2F2DFDFDFD5D5D5C1C1C1B3B3B3AAAAAAA7A7A7
          A9A9A9B0B0B0BABABAC6C6C6D4D4D4E3E3E3EFEFEFFFFEFF7BC67B0096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600C2E4C2FFFBFFEBEBEBDEDEDECFCFCF
          C1C1C1B5B5B5AEAEAEAFAFAFAAAAAAADADADBABABACACACAD8D8D8E8E8E8FBFB
          FBFFFFFF9C9C9C0707070F0F0F14141414141413121218181836373744454541
          4242404141404141404141404142404141404141404141404141404141404141
          4041414041414041414041414041414041414041414041414041414041414041
          4140414140414140414140414140414140414140414141424244454537373718
          19191312121414141414140F0F0F0707079C9C9CFFFFFFFDFDFDEDEDEDDCDCDC
          CECECEBEBEBEB1B1B1ACACACB2B2B2AFAFAFB5B5B5C1C1C1CECECEDCDCDCE9E9
          E9FAF6FAE5F2E5189D1800930000960000960000960000960000960000960000
          96000096000096000096000096000096000096000096000096004BB44BFEFDFE
          F3F1F3E6E6E6D7D7D7C8C8C8BBBBBBB3B3B3A9A9A9787878A5A5A5C0C0C0C6C6
          C6D4D4D4E2E2E2F7F7F7FFFFFFBDBDBD0E0E0E0E0E0E1414141515151414141A
          1A1A3A3B3B4243433F40403F40403F40403F40403F40403F40403F40403F4040
          3F40403F40403F40403F40403F40403F40403F40403F40403F40403F40403F40
          403F40403F40403F40403F40403F40403F40403F40403F40403F40403F40403F
          40403F40403F40404243433A3B3B1A1A1A1313131515151414140E0E0E0E0E0E
          BDBDBDFFFFFFF9F9F9E7E7E7D7D7D7CACACAC4C4C4B1B1B1787878A2A2A2B4B4
          B4BBBBBBC8C8C8D6D6D6E3E3E3EFEFEFFFFFFF7AC67A008F0000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600009600B5DFB5FFFBFFECECECDFDFDFD1D1D1C3C3C3B7B7B7B1B1B1ACAC
          AC575757323232888888CFCFCFDCDCDCEFEFEFFFFFFFE2E2E22727270A0A0A14
          14141515151414141A1A1A3B3B3B4041413E3F3F3E3F3F3E3F3F3E3F3F3E3F3F
          3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F
          3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E
          3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F4041413B3B3C1A1A1A
          1413131515151515150A0A0A272727E2E2E2FFFFFFF4F4F4E0E0E0D6D6D69999
          993A3A3A464646A5A5A5B3B3B3B7B7B7C2C2C2CFCFCFDEDEDEEAEAEAFBF7FBDC
          EFDC0F9A0F009600009600009600009600009600009600009600009600009600
          009600009600009600009600009600009600F8FAF8F5F3F5E7E7E7DADADACBCB
          CBBEBEBEB4B4B4AEAEAEADADADB8B8B89C9C9C464646828282EFEFEFFBFBFBFD
          FDFD5858580303031414141515151615151818183839393F40403C3D3E3D3E3E
          3D3E3D3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3D3D3E
          3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3C3E3E3D
          3E3E3D3E3E3D3E3D3D3E3E3D3E3E3D3E3D3D3E3D3D3E3E3D3E3E3D3D3E3D3D3E
          3D3E3E3C3D3D3F4040383938181818161615161616151515030303585858FDFD
          FDFBFBFBF4F4F49E9E9E3737378D8D8DBBBBBBB1B1B1B0B0B0B5B5B5BDBDBDCA
          CACAD7D7D7E5E5E5F1F0F1FFFFFF5FBB5F009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096008DCE8DFFFE
          FFEEEEEEE3E3E3D4D4D4C6C6C6BABABAB2B2B2AFAFAFAFAFAFB5B5B5C9C9C9D1
          D1D1CFCFCFF3F3F3FFFFFFA3A3A3050505131313161616181818151515323333
          3E3F3F3B3C3B3B3C3C3B3C3C3B3C3C3B3C3C3C3C3C3B3C3C3B3C3C3B3C3C3B3C
          3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3D3C3B3C3B3B3C3C3B
          3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3C3C3C
          3C3D3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3E3F3F3233331515151718
          18161616131313050505A3A3A3FFFFFFF6F6F6D5D5D5D0D0D0D0D0D0BABABAB2
          B2B2B0B0B0B3B3B3BABABAC6C6C6D2D2D2E0E0E0ECECECFFFCFFBBE1BB019301
          0096000096000096000096000096000096000096000096000096000096000096
          000096000E9A0EDBEEDBFCF8FCEAEAEADDDDDDCFCFCFC2C2C2B8B8B8B0B0B0AF
          AFAFB3B3B3BCBCBCC9C9C9D8D8D8EAEAEAFCFCFCE9E9E92929290B0B0B161616
          1A1A1A1415152829283C3D3D393A3A3A3A3A3A3B3B393B3B3A3B3B393B3B393B
          3B393B3B3A3B3B3A3B3B3A3B3B3A3B3A393B3A393A3B3A3B3B3A3B3B3A3B3A3A
          3B3B393B3A3A3B3A3A3A3A3A3A3B3A3A3B3A3B3A3A3B3A393B3B3A3B3B3A3A3B
          3A3A3B3A3B3B3A3B3B3A3B3A3A3B3B393B3B393B3B3A3B3B3A3B3A3A3B3A393B
          3B393A3A3D3D3D2829291515151919191616160B0B0B292929E9E9E9FCFCFCEE
          EEEEDCDCDCCECECEC0C0C0B6B6B6B1B1B1B3B3B3B8B8B8C2C2C2CECECEDBDBDB
          E8E8E8F7F4F7F6F9F62DA62D0096000096000096000096000096000096000096
          000096000096000096000096000096004BB34BFEFDFEF3F2F3E6E6E6D9D9D9CA
          CACABEBEBEB6B6B6B3B3B3B3B3B3B7B7B7C2C2C2D0D1D1DCDBDBF0F0F0FFFFFF
          8181810202021515151919191919191D1D1D393A3A393A393839383839393739
          3938383938383938383838383838393938383838383938393938383938383938
          3939383939383838383839383938383838383839383839383939383939383839
          3838393839383838393839383839383838383838383738393838393838383838
          39383839383939383938383939383939393A39393A3A1D1D1D18181819191915
          1515020202818181FFFFFFF3F3F3E0E0E0D4D4D4C7C7C7BBBBBBB5B5B5B6B6B6
          B7B7B7BFBFBFCACACAD6D6D6E5E5E5F0F0F0FFFFFF79C6790096000096000096
          0000960000960000960000960000960000960000960000960000960095D295FF
          FDFFEEEEEEE3E3E3D5D5D5C7C7C7BDBDBDB6B6B6A1A1A1A6A6A6BEBEBEC9C9C9
          D4D5D5E4E3E3F9F9F9E0E0E02121200E0E0E1717171E1E1E1716173030303839
          3936373737373737373736373737373736373737373737373737373736373736
          3737373737363737363737363837363737363737363737363737373737373737
          3737373637373637383737373737373737373637373737373737373737373637
          3736373736373637373737373736373737383737373737373737373736373738
          39393030311616161D1D1D1818180E0E0E202020E1E1E1FAFAFAE8E8E8D9D9D9
          CDCDCDC1C1C1ADADAD9F9F9FB7B7B7BDBDBDC6C6C6D2D2D2E1E1E1EDEDEDFFFB
          FFC1E4C102940200960000960000960000960000960000960000960000960000
          9600009600009600D4EBD4FDF9FDEBEBEBDFDFDFD1D1D1C5C5C5BBBBBBB6B6B6
          A5A5A48C8C8C9E9E9ECECECEDADADAEBEBEBFFFFFF8989890303031515151D1D
          1D1B1B1B20212137383834353535363635353535353535363535363535353535
          3535353535353636353535353535353635353535343636343635353635353635
          3535363535353535363535353536353535353535353536353536353536363536
          3635353535353535363535353635353635363535353535353535353535353635
          36363535353535353535363436353738382021211B1B1B1E1E1E161616030303
          898989FFFFFFEFEFEFDDDDDDD4D4D4ABABAB8F8F8FA1A1A1B9B9B9BCBCBCC4C4
          C4D0D0D0DDDDDDEAEAEAF8F5F8F3F8F325A32500960000960000960000960000
          9600009600009600009600009600009600009600F9FBF9F6F4F6E9E9E9DCDCDC
          CFCFCFC3C3C3BABABAB5B5B5B8B8B8BFBFBFC0C0C0D1D1D1DEDEDEF2F2F2EDEE
          EE3333330B0B0B1A1A1A2222221717172E2F2F34343532333333343433333433
          3333333333333433333333333333333334333433333333333333333334333334
          3334333333333334333334333333343333333333333333333332333333333334
          3233343333333333333333343333333333333333343333343333333433343433
          33333333333334333333333334343334333333333333333233333434352F2E2F
          1717172222221A1A1A0C0C0C333333EDEDEDF3F3F3E3E3E3D6D6D6C7C7C7C1C1
          C1BCBCBCB8B8B8BCBCBCC3C3C3CECECEDADADAE7E7E7F3F2F3FFFFFF5EBA5E00
          9600009600009600009600009600009600009600009600009600009600009600
          FFFFFFF1F1F1E7E7E7D9D9D9CCCCCCC1C1C1BABABAB7B7B7B9B9B9C0C0C0CCCC
          CCD5D5D5E3E3E3FAFAFAB3B4B40A0A0A1515152020201E1E1E1D1D1D32333331
          3231313132313132313131313131313132313232313231313231313131313131
          3131313131323130323131323132313131313132323132323132323132313131
          3031313131313131313131323131323131313131313131323131313131313231
          3231313231313132313132313131313231313132313231313132313131313131
          3131313131313131323333331D1D1D1F1F1F2020201515150A0A0AB3B3B3FBFB
          FBE8E8E8DADADAD0D0D0C4C4C4BBBBBBB9B9B9BBBBBBC2C2C2CCCCCCD7D7D7E4
          E4E4EFEFEFFFFEFF97D397009600009600009600009600009600009600009600
          0096000096000096009DD59DFFFFFFEFEFEFE4E4E4D6D6D6CACACAC1C1C1BABA
          BAB8B8B8BCBCBCC3C3C3CFCFCFD9D9D9E8E8E8FBFBFB6A6A6A0606061B1B1B26
          27261919192828283031312E2F2F2F2F2F2F2F302F2F2F2F2F2F2F30302F2F30
          2F30302F30302F2F2F2F2F302F30302F30302F2F302F2F302F302F2F2F2F2F30
          302F2F302F30302F302F2F2F2F2F2F302F302F2F2F2F2F2F2F2F2F302F302F2F
          2F2F2F302F2F2F2F2F2E2F2F2F2F2F302F2F2F302F2F302F2F2F2F30302F2F30
          2F302F2F2F2F2F2F302E2F2F2F302F2F2F2F2E2F2F3031312727281A1A1A2727
          271B1B1B0606066B6B6BFBFBFBEAEAEADDDDDDD3D3D3C8C8C8BFBFBFBBBBBBBC
          BCBCC1C1C1CACACAD5D5D5E3E3E3EDEDEDFFFAFFC7E7C7009600009600009600
          009600009600009600009600009600009600009600C7E7C7FFFBFFEDEDEDE2E2
          E2D5D5D5CACACAC1C1C1BCBCBCBBBBBBBEBEBEC7C7C7D2D2D2DCDCDCECECECE7
          E7E73131320F0F0F2122212827271918192C2D2C2C2E2E2D2D2D2D2D2D2D2E2E
          2D2E2E2D2E2E2D2E2E2D2D2E2D2E2E2D2E2E2D2D2E2D2D2E2D2E2E2D2E2E2D2E
          2E2D2E2E2D2E2E2D2E2E2D2D2D2D2D2E2D2D2E2D2D2D2D2E2E2D2E2E2D2E2E2D
          2E2E2D2D2E2D2D2D2D2E2D2D2D2D2D2E2E2D2E2D2D2D2D2D2D2D2D2E2D2D2D2E
          2D2D2E2D2D2D2D2D2E2D2E2E2D2E2D2D2E2D2D2E2E2D2E2E2D2E2D2D2E2D2D2E
          2E2D2E2E2C2D2D191919282828212121100F10323232E7E7E7EDEDEDE0E0E0D6
          D6D6CCCCCCC3C3C3BFBFBFBEBEBEC2C2C2C9C9C9D4D4D4E0E0E0ECECECFBF7FB
          EBF4EB0096000096000096000096000096000096000096000096000096000096
          00E8F3E8FBF8FBECECECE0E0E0D3D3D3C9C9C9C1C1C1BABABAB8B8B8C1C1C1CB
          CBCBD5D5D5DFDFDFF2F2F2C1C1C11313131918192829282424241C1D1D2C2D2D
          2A2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2C2B2B2B2B2B2B2B2B2C2C2B2B2C2B2B2B2B2B2B2B2B2B2B2C2B2B2B2B
          2B2C2B2B2B2B2A2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2A2B2B2C2D2D1C1C1C2525252A292919181913
          1413C2C2C2F2F2F2E2E2E2D8D8D8CFCFCFC6C6C6BBBBBBBCBCBCC2C2C2C9C9C9
          D3D3D3DFDFDFEBEBEBF6F5F6FCFCFC0096000096000096000096000096000096
          0000960000960000960033A833F9FBF9F7F5F7EBEBEBDFDFDFD3D3D3C9C9C9C3
          C3C3B5B5B59191919E9E9EC5C5C5D9D9D9E1E1E1F4F4F49494940A0A0A1E1F1E
          2F2F2F1F201F2021212A2A2A2929292928292928292928292928282929282929
          2929282829292929292929292929292929292929292829282929282929292929
          2929292929292929292928292929292929292928292928292929292829292929
          292929292829292A292929292929292928292828292929292929292929292929
          292929292929292928292929282829292928292929292929292929292A2A2A20
          20211F201F3030301E1E1E0A0A0A949494F6F6F6E3E3E3DCDCDCC9C9C9A2A2A2
          939393B1B1B1C6C6C6CACACAD2D2D2DEDEDEE9E9E9F4F3F4FFFFFF5CBA5C0096
          000096000096000096000096000096000096000096004EB34EFFFEFFF5F4F5EA
          EAEADFDFDFD3D3D3CACACAC2C2C2C0C0C0C0C0C0C2C2C2CDCDCDD9D9D9E2E2E2
          F2F2F26C6B6B0C0C0B2424243333331A1B1B2324242728272727262727262726
          2627262727272727272727262727272627272627262627262627272727272727
          2627272727272727272626272626272626272626272727272727272627272626
          2726272726262726272727272727272726272727262727272727272727272726
          2627262727272627272627262627272727272727272727272727262627262627
          27272727272726262727272324231B1B1B3535352424240B0B0C6B6C6CF3F3F3
          E4E4E4DDDDDDD1D1D1C3C3C3C3C3C3C2C2C2C5C5C5CACACAD2D2D2DDDDDDE8E8
          E8F2F2F2FFFFFF7AC77A00960000960000960000960000960000960000960000
          960064BD64FFFFFFF4F3F4EAEAEADEDEDED2D2D2CACACAC3C3C3C1C1C1C3C3C3
          CBCBCBD3D3D3DBDBDBE2E2E2EAEAEA4B4B4B1111112B2A2B3534351918192424
          2424252525252425252525252525252525242525252425252425252525242525
          2425252424252425252425252425252524252524252424252425252524252524
          2525252525252524242524252525242524252525252525242525252525252524
          2525252425252525252525252525252525252525242425252525242425252525
          2525252525252525252525252525252425252425242525242424191919363636
          2A2B2B1111114C4C4CEBEBEBE3E3E3DEDEDED8D8D8CFCFCFC7C7C7C4C4C4C6C6
          C6CACACAD2D2D2DDDDDDE8E8E8F2F2F2FFFFFF95D29500960000960000960000
          960000960000960000960000960079C779FFFFFFF4F4F4E9E9E9DDDDDDD3D3D3
          CCCCCCC6C6C6C2C2C2C5C5C5CBCBCBD5D5D5DDDDDDE2E2E2DEDEDE3939391717
          1731303034343417171723232323232323232323222323232323232223232223
          2323232323232323232323232323232323232323232322232322232322232323
          2323232323232323232323232323222322232323232323232323232323232323
          2323232323232323232223232323232323232323232323232323232323232323
          2323232323232323232223232323232223232323232323232323232323232323
          232223232323171817343534313132171716393939DFDFDFE3E3E3DEDEDED8D8
          D8D0D0D0C9C9C9C6C6C6C7C7C7CCCCCCD3D3D3DDDDDDE8E8E8F2F2F2FFFFFFA8
          DAA800960000960000960000960000960000960000960000960089CD89FFFEFF
          EEEEEEE9E9E9E1E1E1D6D6D6CBCBCBC9C9C9C5C5C5C7C7C7CECECED7D7D7DEDE
          DEE3E3E3D1D1D12828281C1D1C37373730303015151521212121212121212121
          2121212021212120212121212021212021212120212120212121212121212121
          2121212021202021212121212121212121202120212121212121212121212121
          2121212021212121212021212021212121202121202121212021202121202121
          2121212121212121212120212121212120212121212121212021212121212020
          2121202121212121202121202120202221221717173131313837381D1D1D2829
          29D1D1D2E3E3E3DFDFDFD9D9D9D1D1D1CBCBCBC8C8C8C8C8C8D1D1D1DEDEDEE3
          E3E3F1F1F1F6F6F6FFFEFFB5DFB5009600009600009600009600009600009600
          00960000960096D596B2A9B2B2B2B2C4C4C4BEBEBEB7B7B76D6D6DA2A2A2D6D6
          D6D3D3D3DADADAE2E2E2DFDFDFE1E1E1CFCFCE292929201F1F3C3C3C32323214
          14141F20201F1E1F1E1E1F1E1E1E1F1F1E1F1F1F1E1F1E1F1E1F1E1F1F1E1E1E
          1F1E1F1F1E1E1E1E1E1E1E1E1E1E1E1E1F1F1E1E1F1F1E1F1E1E1F1E1E1F1F1F
          1F1F1F1F1F1F1F1E1E1F1E1F1E1E1E1F1E1E1E1E1E1F1F1E1E1F1E1E1F1F1F1F
          1E1E1F1E1E1F1E1E1F1F1E1F1F1F1F1F1F1E1F1E1E1E1F1F1E1F1F1E1F1F1E1E
          1E1E1F1E1E1E1F1E1E1F1E1F1F1E1F1E1E1E1E1E1E1E1E1F1F1F1F20201F1616
          163434343C3C3C1F1F20292929CFCFD0E1E1E1DFDFDFE3E3E3DEDEDED6D6D6D2
          D2D2CFCFCFB7B7B79C9C9CC5C5C5A4A4A4DADADAFFFEFFBDE3BD009600009600
          0096000096000096000096000096000096009CD89CC7C0C79E9E9ED7D7D79898
          989E9E9E9F9F9F8D8D8D8282826868686D6D6D7B7B7BD5D5D5E2E2E2CDCDCD2A
          292A2222224040403535351313131D1E1E1C1D1D1D1D1D1D1D1D1C1D1D1C1D1D
          1D1D1D1C1D1C1D1C1D1D1D1D1C1D1D1C1D1D1D1D1D1D1D1C1D1D1D1D1D1D1D1D
          1D1C1D1D1D1D1D1D1D1D1C1E1D1C1D1D1C1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1C1D1D1C1D1D1C1D1D1C1D1D1C1D1D1C1D1D1C1D1C1C1D1D1C1D1D1D1E1D
          1D1D1D1C1D1D1C1D1D1C1D1D1D1D1D1D1D1D1C1D1D1C1D1D1C1D1D1D1D1D1D1D
          1D1D1D1D1C1D1D1E1E1E151515363636404040212121292929CECECEE0E0E0E1
          E1E18F8F8F6868686A6A6A707070C6C6C6AEAEAE7F7F7F6B6B6B959595A9A9A9
          FFFFFFC2E5C200960000960000960000960000960000960000960000960099D6
          99DAD3DA848484C0C0C09999997D7D7D8E8E8E8F8F8FA3A3A3919191949494A2
          A2A2DADADADFDFDFCBCBCB2A2B2A2323234343433738371212121B1B1B1B1B1C
          1B1C1B1B1C1B1B1B1C1B1C1C1B1C1C1B1C1B1B1B1B1B1B1C1B1C1B1B1C1C1B1C
          1B1C1C1B1B1B1C1B1B1C1B1C1B1B1C1B1B1B1C1B1B1B1B1C1B1B1C1C1B1C1C1B
          1B1B1C1B1B1B1B1B1B1C1B1B1C1B1B1B1B1B1C1C1B1B1B1B1C1B1B1B1C1B1B1C
          1B1B1B1B1C1C1B1C1C1B1C1C1B1C1C1B1C1B1B1C1C1B1B1C1B1B1B1B1C1C1B1C
          1C1B1C1C1B1C1C1B1B1B1B1B1B1B1C1C1B1C1C1B1B1C14141437373742414123
          23232A2A2ACBCBCBDDDDDDE0E0E0B1B1B1969696949494969696CECECE989898
          828282606060B9B9B9ACACACFFFFFFC2E5C20096000096000096000096000096
          0000960000960000960097D597D6D1D6A6A6A6CACACAA6A6A6B4B4B48A8A8AB8
          B8B8D7D7D7D6D6D6DDDDDDE4E4E4E1E1E1DBDBDBC8C8C82A2A2A242424454545
          3939391111111A1A1A1A19191A1A191A1A191A19191A191A1A191A1A191A1A1A
          191A1A191A19191A1A191A191A19191A1A19191A1A191A19191A1A1A191A191A
          1A191A191A1A19191A191A19191A19191A191A1A1A191A1A191A1A1A1A1A1A1A
          1A1A1A1A1A1A1A1A1A1A1A191A1A1A1A19191A191A1A191A1A1A191A191A1A1A
          191A1A19191A1A1A1A1A1A191A1A191A1A191A1A1A191A1A191A191A1A19191A
          1A1A1313133737374343432424242A2A2AC9C9C8D9D9D9E0E0E0E7E7E7E0E0E0
          DADADAD6D6D6D6D6D6A1A1A1818181969696808080B9B9B9FFFFFFBCE3BC0096
          0000960000960000960000960000960000960000960086CC86FFFFFFFFFFFFF1
          F1F1EBEBEBE2E2E2DDDDDDD3D3D3CCCCCCCFCFCFD4D4D4DCDCDCE1E1E1D8D8D8
          C6C6C62B2B2B2525254747473A3A3A1011101818191818181817181817181718
          1818181717181718181818181817181818181818181818181818181818181817
          1818171818181718181818181818171818181818181818171818181818181818
          1818181818181818181818171818171718181718181818181818181818181818
          1718181717191818181818181817181818181817171717181817181818181818
          18181718181718171718181819181212123838384343432424242A2A2BC7C7C7
          D7D7D7E1E1E1E1E1E1D8D8D8D2D2D2CECECED0D0D0D6D6D6D2D2D2E8E8E8E3E3
          E3F5F5F5FFFFFFB3DFB300960000960000960000960000960000960000960000
          960075C675FFFFFFF6F6F6EFEFEFE6E6E6DDDDDDD7D7D7D2D2D2D0D0D0D0D0D0
          D6D6D6DEDEDEE3E3E3D4D4D4CECECE3B3B3B2323234646464545451213121616
          1616171716161716161716171716161616161616171616171716161716171716
          1616161616161616161716161617161617161617171616161617161616161616
          1616161617161617161616161616161616161616161716161716161616161616
          1616161716161716171717161616171616171716171616161616161716161716
          1616161716161716161616171617161617161616161616151616121312414141
          4241422121213B3B3BCFCFCFD3D3D3E1E1E1E2E2E2DADADAD3D3D3D1D1D1D2D2
          D2D7D7D7E0E0E0E6E6E6F0F0F0F5F5F5FFFFFFA5D9A500960000960000960000
          9600009600009600009600009600009600FFFFFFF8F8F8F0F0F0E8E8E8E0E0E0
          D9D9D9D4D4D4D2D2D2D4D4D4DADADADFDFDFE4E4E4D3D3D3D3D3D34D4D4D2020
          204343434E4E4F16161614141415151515151515151515151515151515151515
          1515151515151515151515151515151515151515151515151515151515151515
          1515151515151515151515151515151515151515151515151515151515151515
          1515151515151515151515151515151515151515151515151515151515151515
          1515151515151515151515151515151515151515151515151515151515151515
          1515151414141616164848483E3E3F1E1E1E4D4C4CD5D5D5D0D0D0E3E3E3E3E3
          E3DEDEDED7D7D7D4D4D4D4D4D4D8D8D8DFDFDFE7E7E7EFEFEFF6F6F6FFFFFF91
          D091009600009600009600009600009600009600009600009600009600FEFEFE
          FAF9FAF1F1F1EAEAEAE3E3E3DBDBDBD6D6D6D4D4D4CACACAC7C7C7D9D9D9E7E7
          E7D4D4D4D4D4D46766671D1D1D3F403F5655551E1E1E11121114141414141414
          1414141414141414141414141414141414141414141414141414141414141414
          1414141414141414141414141414141414141414141414141414141414141414
          1414141414141414141414141414141414141414141414141414131414141414
          1414141414141414141414141414141414141414141414141414141414141414
          1414141414141414141414141414141212111C1D1D4C4C4C3A3A391B1B1B6767
          66D5D5D5D0D0D0E8E8E8DBDBDBC6C6C6CBCBCBD4D4D4D6D6D6DADADAE2E2E2EA
          EAEAF1F1F1F7F7F7FFFFFF76C576009600009600009600009600009600009600
          009600009600009600F8FBF8FDFAFDF4F4F4ECECECE5E5E5DDDDDDDADADACBCB
          CBABABABB3B3B3D8D8D8E9E9E9D8D8D8D0D0D08686861D1D1D3B3A3B5857572C
          2C2C0E0E0E131313131313131313131313131313131313131313131313131313
          1313131313131313131313131313131313131313131313131313121313131313
          1313131313131313131313131313131313131313131313131313131313131313
          1313131313131313131313131313131313131313131313131313131313131313
          1313131313131313131313131313131313131313131313131313130F0F0F2828
          284D4D4D3535361B1B1B868686D1D1D1D2D2D2EAEAEADCDCDCB6B6B6ABABABC7
          C7C7DBDBDBDDDDDDE5E5E5ECECECF2F2F2F9F8F9FFFFFF57B857009600009600
          009600009600009600009600009600009600009600E3F2E3FFFDFFF5F5F5EEEE
          EEE7E7E7E0E0E0DBDBDBD7D7D7D9D9D9DEDEDEE0E1E1E7E7E7DEDEDECACACAA7
          A7A72525253535355554553E3E3F0D0D0D121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121312121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          121212121212120E0E0E363636494949303030222323A7A7A7CACACAD9D9D9EA
          EAEAE2E2E2E0E0E0DDDDDDD9D9D9DBDBDBDFDFDFE7E7E7EEEEEEF3F3F3FCFAFC
          FBFDFB36AA360096000096000096000096000096000096000096000096000194
          01C0E4C0FFFFFFF6F6F6F1F1F1EAEAEAE3E3E3DDDDDDDADADADADADADBDBDBDF
          DFDFE7E7E7E6E6E6C7C7C7BEBEBE3B3B3B2C2C2C4D4D4D505050131313111111
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          121212121212121212121212121212121111111414144444444241422828283A
          3A3ABFBFBFC3C3C3E1E1E1E9E9E9E1E1E1DCDCDCDBDBDBDBDBDBDDDDDDE2E2E2
          E9E9E9EFEFEFF6F6F6FFFDFFE7F5E70096000096000096000096000096000096
          0000960000960000960000900093D293FFFFFFF8F9F8F3F3F3ECECECE6E6E6E1
          E1E1DCDCDCDBDBDBDCDCDCE0E0E0E5E5E5ECECECCCCCCCC6C6C6646364242323
          4343435959592525250E0E0E1212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          121212121212121212121212121212121212121212121212121212120F0F0F21
          2121494A493A3A3A202020636363C7C7C7C4C4C4E9E9E9E8E8E8E2E2E2DDDDDD
          DCDCDCDDDDDDE0E0E0E5E5E5ECECECF2F2F2F7F8F7FFFFFFBFE4BF0096000096
          00009600009600009600009600009600009600009600008F005EBB5EFFFFFFFB
          FBFBF5F5F5EEEEEEE9E9E9E4E4E4DFDFDFDDDDDDDDDDDDE2E2E2E8E8E8EEEEEE
          D8D8D8C0C0C09494942525253B3B3B5555553F40400E0E0E1212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212120F0F0F353535464646333333222223949494C0C0C0CECECE
          EEEEEEEAEAEAE4E4E4DEDEDEDEDEDEE0E0E0E3E3E3E8E8E8EEEEEEF4F4F4F9FA
          F9FFFFFF8DCF8D00960000960000960000960000960000960000960000960000
          960000960029A529F6FBF6FEFCFEF7F7F7F2F2F2ECECECE6E6E6E3E3E3DFDFDF
          E2E2E2DCDCDCD0D0D0EBEBEBE8E8E8BCBCBCB5B5B53F3F3F2F2F2F4A4A4A5354
          541A1A1A10101012121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212121212121212121212121010101918194545453E3E3E2A2A2A
          3D3D3DB7B7B7B8B8B8E1E1E1EFEFEFD0D0D0D8D8D8E4E4E4E0E0E0E3E3E3E6E6
          E6EBEBEBF1F1F1F6F6F6FCFBFCFFFFFF53B65300960000960000960000960000
          9600009600009600009600009600009600009600CAE8CAFFFEFFF8F8F8F4F4F4
          EEEEEEE8E8E8E5E5E5E6E6E6C6C6C6AAAAAABFBFBFE9E9E9F2F2F2C9C9C9BBBB
          BB7575752525254040405555553838380E0E0E12121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212121212121212121212121212121212121212121212120F0F0F
          2F2F2F454545373737222222737373BDBDBDBFBFBFEFEFEFEDEDEDC8C8C8AAAA
          AABEBEBEE4E4E4E6E6E6E8E8E8EDEDEDF3F3F3F8F8F8FFFDFFEEF7EE00960000
          9600009600009600009600009600009600009600009600009600009600009600
          87CD87FFFFFFFBFBFBF7F7F7F1F1F1EBEBEBE8E8E8E6E6E6DBDBDBE1E1E1EAEA
          EAE9E9E9F1F1F1E0E0E0B2B2B2A6A6A63434343434344949495252521C1C1C0F
          0F0F121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121010101A1A1A4343433E3E3E2E2E2E323232A6A6A6B0B0B0D5D5
          D5F3F3F3EAEAEAEBEBEBE4E4E4D9D9D9E5E5E5E8E8E8EAEAEAF0F0F0F6F6F6FA
          FAFAFFFFFFB5E0B5009600009600009600009600009600009600009600009600
          0096000096000096000096003DAE3DFDFEFDFEFDFEF9F9F9F5F5F5EFEFEFEAEA
          EAE7E7E7E8E8E8E7E7E7E6E6E6E9E9E9EEEEEEF3F3F3BEBEBEB3B3B36C6C6C27
          2828403F405151513F3F3F0F0F0F111111121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121111111010103535354444443737382424
          246B6B6BB6B5B5B4B4B4EEEEEEF0F0F0EAEAEAE7E7E7E6E6E6E7E7E7E8E8E8EA
          EAEAEDEDEDF3F3F3F8F8F8FCFBFCFFFFFF6AC16A009600009600009600009600
          009600009600009600009600009600009600009600009600009600D0EBD0FFFF
          FFFAFAFAF7F7F7F2F2F2EDEDEDEAEAEAE7E7E7E8E8E8E8E8E8E9E9E9EDEDEDFA
          FAFAE6E6E6A9A9A9A3A3A33B3A3B3332324546465253532A2A2A0D0D0D121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212120F0F0F2525
          254544453C3C3C2D2E2E393939A4A4A4A6A6A6D7D7D7FDFDFDEDEDEDE9E9E9E8
          E8E8E7E7E7E7E7E7EBEBEBEDEDEDF1F1F1F6F6F6FAFAFAFFFEFFF0F9F0009600
          0096000096000096000096000096000096000096000096000096000096000096
          000096000096007BC87BFFFFFFFCFBFCF9F9F9F6F6F6F0F0F0EDEDEDEAEAEAE9
          E9E9E8E8E8ECECECFBFBFBD7D7D7CBCBCBC1C1C1A8A8A87B7B7A2A292A3B3B3B
          4A4A4A4C4C4C1B1B1B0F0F0F1212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          121212120F0F0F1A1A1A4241414040403536362727277A7A7AAAAAAAB5B5B5D0
          D0D0CACACAFAFAFAEEEEEEE8E8E8E9E9E9EAEAEAEDEDEDF0F0F0F4F4F4F9F9F9
          FBFBFBFFFFFFAADCAA0096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960023A323F2FAF2FFFEFFFAFAFAF7
          F7F7F3F3F3EEEEEEECECECEAEAEAECECECE9E9E98D8D8D373737A7A7A7F0F0F0
          A3A3A3A4A4A45353532D2D2D4040404D4D4E4343431314141010101212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          121212121212121212121212121010101313133B3B3B4343433A3A3B2A2A2A52
          5251A5A5A59C9C9CE3E3E3C4C4C43C3C3C777777E0E0E0EDEDEDEAEAEAEBEBEB
          EEEEEEF1F1F1F6F6F6FAFAFAFEFDFEFFFFFF0096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600A2D8A2FFFFFFFBFBFBF8F8F8F5F5F5EFEFEFECECECECECECE6E6E65B5B5B
          5E5E5ED1D1D1F8F8F8F8F8F8CBCBCB9796969291913A3A3B3434344343434E4E
          4E3C3D3D12121210101012121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121210101012121237373746
          46463D3D3D30313139393A929292969696BABABAF6F6F6F9F9F9E3E3E3717171
          474747D6D6D6EEEEEEEBEBEBEFEFEFF3F3F3F7F7F7FAFAFAFFFFFFCDEACD0096
          0000960000960000960000960000960000960000960000960000960000960000
          960000960000960000960000960038AB38FAFDFAFEFDFEFAFAFAF6F6F6F1F1F1
          EDEDEDEAEAEAE5E5E5C8C8C8EFEFEFEFEFEFEAEAEAF0F0F0F5F5F5ADADAD9191
          917B7B7B3231323839384444444F4F4F3B3B3B12121210101012121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121210
          10101212123737374949494040403636363030307B7B7B9494949D9D9DEDEDED
          F3F3F3EBEBEBEDEDEDF1F1F1CACACADFDFDFEBEBEBECECECF0F0F0F5F5F5F9F9
          F9FCFCFCFFFFFF64BE6400960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009200ADDDAD
          FFFFFFFAFAFAF6F6F6F1F1F1ECECECE7E7E7E5E5E5E9E9E9E2E2E2E1E1E1E5E5
          E5EAEAEAF2F2F2E8E8E89494948C8C8C6969693131313C3B3B4545454F4F4F3D
          3D3C1314140F0F0F121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212120F0F0F1313133B3B3B4C4C4C434343393939303030686868
          8E8E8E898989DBDBDBF5F5F5EAEAEAE6E6E6E2E2E2E1E1E1E6E6E6E4E4E4E7E7
          E7EBEBEBEFEFEFF5F5F5F9F9F9FFFFFFD6EED600960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          00960000960000960036AB36F9FDF9FDFCFDF7F7F7F1F1F1EBEBEBE6E6E6E2E2
          E2DEDEDEDCDCDCDBDBDBDDDDDDE2E2E2EBEBEBF4F4F4D8D8D88383838585855F
          5F5E3231313C3C3C4646475050504444441B1B1B0D0D0D111111121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212121212121212121111110D0D0D1B1B1B4444444F504F454545
          3C3C3B3131315E5E5E8787877C7C7CC6C6C6F5F5F5ECECECE3E3E3DDDDDDDCDC
          DCDBDBDBDDDDDDE0E0E0E5E5E5EAEAEAF0F0F0F5F5F5FCFAFCFFFFFF61BD6100
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096009CD69CFFFFFFFAF9
          FAF4F4F4ECECECE6E6E6E0E0E0DBDBDBD9D9D9D6D6D6D9D9D9DDDDDDC0C0C0DE
          DEDEF5F5F5CBCBCB7878787B7B7B5A5A5A3535353E3D3E4747485151514E4F4E
          2A2A2A0F0F0F0F0F0F1212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212121212121212121212121212121212120E0E0E0E0E0E2B2B2B
          5151515353534848483D3D3D3535345A5A5A7D7E7E727272B8B8B8F5F5F5E4E4
          E4B7B7B7D8D8D8D9D9D9D6D6D6D7D7D7DADADADEDEDEE4E4E4EAEAEAF1F1F1F7
          F7F7FFFFFFC8E8C8009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          00009600009600E9F6E9FFFDFFF5F5F5EEEEEEE6E6E6E0E0E0D9D9D9D4D4D4D2
          D2D2CFCFCFA0A0A0A9A9A9DADADAE3E3E3F2F2F2C3C3C37070707474745D5C5C
          3837383D3D3D4848485151515858584242421C1C1C0C0C0C0F0F0F1212121212
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212121212121212121212121212121212121212121212120F0F0F
          0C0C0C1C1C1C4546465D5D5D5555554A4A4B3E3E3E3838385C5C5C7676766B6B
          6BAFAFAFF1F1F1E5E5E5DEDEDEB1B1B1999999CACACAD1D1D1D2D2D2D7D7D7DD
          DDDDE4E4E4ECECECF3F3F3FCFAFCFCFDFC009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          00009600009600009600009600009600009600009600FFFFFFF8F7F8F0F0F0E9
          E9E9E1E1E1D8D8D8D1D1D1CECECEC4C4C4B3B3B3CFCFCFCFCFCFD6D6D6E0E0E0
          F0F0F0C4C4C46D6D6D6B6A6A6060603E3E3E3C3C3C4848485150515C5C5C5A5A
          5A3C3C3C1B1B1B0D0D0D0D0D0D11111112121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1111110D0D0D0C0C0C1B1C1C4041416262626363635656564C4C4C3F3E3F4040
          406060616D6D6D666565B0B1B1EFEFEFE2E2E2D7D7D7CFCECECFCFCFB4B4B4BD
          BDBDCCCCCCCECECED6D6D6DEDEDEE6E6E6EEEEEEF6F5F6FFFFFF9AD59A009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600B9E1B9FFFFFFF3F3F3ECECECE3E3E3D9D9D9D0D0D0CACACAC5C5C5C5C5C5
          C0C0C0C2C2C2C8C8C8D0D0D0DCDCDCEEEEEECDCDCD7171715F5F5F6263634848
          483C3C3C4646465151515B5C5B6666666262624848492828281313130C0B0B0C
          0C0C0E0E0E101010111111121212121212121212121212121212121212111111
          1010100E0E0E0B0B0B0B0B0B1313132B2B2B4E4E4E6B6B6B706F706363635757
          584B4A4B3F3F3F4A4949636363616161666666BABABAF0F0F0DFDFDFD1D1D1C9
          C9C9C1C1C1BDBDBDC2C2C2C3C3C3C7C7C7CECECED6D6D6E0E0E0E9E9E9F1F1F1
          FFFCFFDCF0DC0096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600E9F6E9FDFAFDEFEFEFE7E7E7DCDCDC
          D2D2D2C9C9C9C1C1C1BCBCBCB8B8B8B7B7B7BABABAC2C2C2C9C9C9CDCDCDEAEA
          EADBDBDB8484845656565F5F5F5454544243434343434E4E4E59595964646470
          6F707373736666664E4E4E3535352222221515150E0E0E0A0A0A0A0A0A0A0A0A
          0A0A0A0A0A0A0A0A0A0E0E0E1616162323233838385353546F6F6F7E7E7E7B7B
          7B6E6E6E616261555555474747454445555555616161555555747474CDCDCDEC
          ECECD0D0D0C7C7C7C3C3C3B9B9B9B5B5B5B5B5B5B9B9B9BEBEBEC5C5C5CFCFCF
          D9D9D9E4E4E4EDEDEDF8F7F8FCFDFC0096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          FFFEFFF7F5F7ECECECE1E1E1D4D4D4CBCBCBC1C1C1B9B9B9B2B2B2AFAFAFAEAE
          AEB4B4B4919191A7A7A7D3D3D3E0E0E0E7E7E7A6A6A65C5C5C535353595A5A4D
          4D4E4545454949495353535F5F5F6B6A6A767676818081858585828282797979
          6C6C6C5E5E5D5F5F5F6060606161616161616061607171718080808A8A8A8F8F
          8E8B8B8B8181817474746868685C5C5B4E4E4E4848484F4F505B5B5B55555555
          5555949494E1E1E1E5E5E5D4D4D4B2B2B2898989B2B2B2ADADADACACACAFAFAF
          B4B4B4BDBDBDC6C6C6D1D1D1DDDDDDE9E9E9F3F2F3FFFFFF84CB840096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          00960000960000960000960088CC88FFFFFFF1F0F1E7E7E7DADADACDCDCDC2C2
          C2B8B8B8AFAFAFA9A9A9A8A8A88F8F8F838383B1B1B1BABABAC6C6C6D5D5D5E7
          E7E7D5D5D58383834E4E4E4F4F4F5454544E4E4E4A494A4C4D4D565656616061
          6C6C6C7575757F7F7F8787878F8E8F9595949797979999999A9A9A9A9A9A9A99
          9A9595958E8E8E8686867D7D7D7374736869685D5D5D5252524D4D4D50505055
          55555151514B4B4B737373C8C8C8EAEAEAD9D9D9C8C8C8BABABAB3B3B3898989
          848484A5A5A5A6A6A6ABABABB3B3B3BDBDBDCACACAD6D6D6E4E4E4EDEDEDFFFE
          FFB3DFB300960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600009600009600009600009600009600009600009600009600ACDCACFFFD
          FFEEEDEEE2E2E2D4D4D4C6C6C6BBBBBBB0B0B0A7A7A7A1A1A19898989B9B9B9C
          9D9DA3A3A3ADADADBABABAD2D2D28C8C8CBEBEBEC2C2C27474744B4B4B494949
          5050505151514F4F4F4F4F4F5454545B5C5C6464636C6C6C7272727777777B7B
          7B7C7C7D7D7D7D7D7D7D7B7A7B76767670707069686860606058585853535352
          52525353535252524A4A4A484848686868B2B2B2CBCBCB808080CECECEBEBEBE
          AEAEAEA3A3A39B9B9B9999999393939C9C9CA2A2A2ABABABB6B6B6C2C2C2D0D0
          D0DDDDDDE9E9E9FFF9FFD2EAD200960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          00009600009600129812C4E4C4FFFAFFEAEAEADDDDDDCECECEC1C1C1B2B2B2A7
          A7A79E9E9E9898989292928F8F8F919191969696A5A5A5949494313131B9B9B9
          E3E3E3E3E3E3BDBDBD7F7F7F5252524343434646464D4D4D5050505151515353
          535555555858585A5A5A5D5C5D5E5E5E5E5E5E5E5E5E5C5C5C5A5A5A57575755
          55555353535151514F4F4F4949494242424C4C4C747474B2B2B2E0E0E0E4E4E4
          CCCCCC3A3A3A7A7A7AABABAB9696969090908D8D8D8E8E8E949494999999A2A2
          A2ADADADBCBCBCCACACAD9D9D9E6E6E6FCF5FCE1F0E100960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          000096000096000096000096000096000096000096001B9C1BCEE7CEFFF8FFE7
          E7E7D9D9D9CACACABABABAACACACA0A0A09797978F8F8F898989868686888888
          8E8E8E323232666666B3B3B3B8B8B8C8C8C8DBDBDBE5E5E5D0D0D0A1A1A17373
          735252524343434040404343434747474B4B4B4C4C4C4D4D4D4E4E4E4E4E4E4D
          4D4D4C4C4C4B4B4B4848484343434040404141414D4D4D6B6B6B989898C9C9C9
          E4E4E4DFDFDFCCCCCCBBBBBBB4B4B48282822929298787878787878484848787
          878B8B8B9292929B9B9BA7A7A7B5B5B5C5C5C5D4D4D4E2E3E2FAF4FAE7F2E700
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600CEE6CEFFF7FFE5E5E5D6D6D6C7C7C7B6B6B6A7A7A79B9B9B
          9191918888888282828181816B6B6B3737378686868D8D8D979797A5A5A5B3B3
          B3BFBFBFCECECEDFDFDFE2E2E2D2D2D2B5B5B594949477777762626253535350
          50504F4F4F5151515252524F4F4F4F504F5252525E5E5E7272728F8F8FAEAEAE
          CECECEE1E1E1E2E2E2D3D3D3C2C2C2B6B6B6A8A8A89B9B9B8E8E8E8B8B8B4040
          405D5D5D8181817F7F7F8585858D8D8D969696A2A2A2B1B1B1C2C2C2D1D1D1DF
          E0DFF8F1F8E6F1E639AA39009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600C3E1C3FFF6FFE5E4E5
          D6D6D6C6C6C6B4B4B4A5A5A59898988D8D8D8484847D7D7D7777777777777676
          767777777C7C7C858585939393808080979797B6B6B6BFBFBFCBCBCBD7D7D7E2
          E2E2E3E3E3DDDDDDD7D7D7D6D6D6D7D7D7D0D0D0CDCDCDD7D7D7D6D6D6D7D7D7
          DCDCDCE3E3E3E4E4E4DBDBDBCFCFCFC2C2C2B8B8B8A3A3A37F7F7F9595958888
          887F7F7F7878787575757676767676767A7A7A818181898989939393A0A0A0AF
          AFAFC0C0C0D1D1D1DFDFDFFBF2FBDDECDD009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600139813ACD8ACFFF7FFE7E5E7D5D5D5C5C5C5B4B4B4A4A4A49797978B8B
          8B8181817A7A7A7575757070706F6F6F6E6E6E7171717272725E5E5E8383838E
          8E8E979797A0A0A0AAAAAAA8A8A8B2B2B2C1C1C1C6C6C6C8C8C8D4D4D4808080
          676767D2D2D2C8C8C8C7C7C7C3C3C3B7B7B7A6A6A6AEAEAEA4A4A49A9A9A9191
          918989896262627070707474746F6F6F6E6E6E6F6F6F7474747878787E7E7E87
          87879292929F9F9FAFAFAFC0C0C0D1D1D1E0E0E0FDF3FDCBE4CB009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          00960000960000960000960000960000960000960088C988FBF5FBEDE8EDD7D7
          D7C7C7C7B6B6B6A6A6A69898988B8B8B8181817979797272726D6D6D6A6A6A6A
          6A6A6464645E5E5E6F6F6F7171717878787D7D7D878787707070828282979797
          9A9A9A9B9B9BA6A6A65A5A5A424242A5A5A59C9C9C9A9A9A9898988A8A8A6E6E
          6E8888888080807979797373737070706262626262626A6A6A6969696D6D6D71
          71717777777E7E7E878787939393A2A2A2B1B1B1C2C2C2D2D2D2E6E3E6FEF4FE
          AAD6AA0096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          000096005BB65BE5EDE5F8EEF8DCDBDCCCCCCCBBBBBBAAAAAA9C9C9C8F8F8F84
          84847B7B7B7474746E6E6E6A6A6A676767676766646464656565666666686869
          6C6C6C5959596D6D6D7474747676767777777E7E7E4545453434347F7F7F7777
          7777777775757573737358585869696969696967676764646464646467676768
          68686969696D6D6D7272727878788080808B8B8B979797A6A6A6B6B6B6C6C7C6
          D7D7D7F0E9F0F2F0F27AC27A0096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          00009600009600009600009600009600009600009600B5DAB5FBF2FBE7E3E7D2
          D2D2C2C2C2B1B1B1A2A2A29595958A8A8A8080807878787272726D6D6D686868
          6565656464646262626161626060605A5A5A6262626363636262626363636868
          683F3F3F3434346868686363636262626262626262625B5B5B60606061616162
          62626363636565656767676B6B6B7070707676767D7D7D8686869191919E9E9E
          AEAEAEBEBEBECDCDCDE0DEE0F9F0F9CDE3CD3FAB3F0096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600E2EAE2F7EDF7DDDBDDCBCBCBBBBBBBACACAC9F9F9F929292
          8888887F7F7F7878787272726D6D6D6969696666666464646161616060605E5E
          5E5F5F5F5F5F5F5E5E5E5D5D5D5D5D5D5D5D5C5E5E5E5F5F5F5E5E5E5E5E5E5F
          5F5F6161616262626464646666666969696D6D6D7070707676767C7C7C858585
          8E8E8E9B9B9BA9A9A9B8B8B8C6C7C6D7D6D7F1E9F1EDEDED88C7880096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600EEEDEEF1E8F1
          D9D7D9C8C8C8B9B9B9ACACAC9F9F9F9494948A8A8A8282827B7B7B7676767171
          716D6D6D6A6A6A67676765656563636363636362626261616162626262626262
          62626262626363636464646665666767676A6A6A6D6D6D7070707575757B7B7B
          8080808888889292929C9C9CA9A9A9B6B6B6C4C4C4D4D3D4EBE4EBF4EEF4B0D6
          B000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600009600009600A9D3A9EEECEEF0E7F0DAD7DAC9C9C9BCBCBCB0B0B0A5A5
          A59B9B9B9292928A8A8A8383837E7E7E7A7A7A7676767272727070706E6E6E6D
          6D6D6D6D6D4545454141416969696D6D6D6E6E6E707070737273757575797979
          7C7C7C8282828888888F8F8F989898A2A2A2ADADADB9B9B9C5C6C5D5D4D5EBE4
          EBF3ECF3BBDABB00960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600009600009600009600009600009600009600009600009600009600E4E8
          E4F3E9F3E3DDE3D0CFD0C3C3C3B8B8B8AFAFAFA6A6A69D9D9D9696969090908C
          8C8C8787878484848181818080807878785757575454546F6F6F818181818181
          8484848787878A8A8A8F8F8F9595959B9B9BA3A3A3ACACACB6B6B6C0C1C0CDCC
          CDDDD9DDF0E7F0EAEAEAAFD5AF00960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960078C178C6DDC6ECE9ECEFE6EFE1DBE1D2D0D2C6
          C6C6BDBDBDB5B5B5AEAEAEA8A8A8A4A4A4A0A0A09D9D9D9B9B9B9393935E5E5E
          5B5B5B8989899C9C9C9C9C9C9F9F9FA3A3A3A9A9A9ADADADB4B4B4BBBBBBC4C4
          C4CFCECFDED9DEEDE4EDEFE9EFD0E0D08AC68A00960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          960084C484C1DBC1E4E7E4EFE7EFEBE2EBE1DBE1D7D3D7CDCBCDC6C6C6C1C0C1
          BDBDBDBABABABABABA8A8A8A858585B9B9B9BABABABDBDBDC1C1C1C6C5C6CCCA
          CCD4D1D4DFD9DFE9E1E9EFE7EFE8E7E8CADECA91C9914CAE4C00960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          96000096000096000096000096000096000096002BA22B5CB55C8EC88EB9D7B9
          D3E0D3E4E6E4ECE7ECEDE6EDEDE4EDEAE1EAE8DFE8EDE4EDEEE5EEE8DFE8E9E0
          E9ECE3ECEDE5EDECE6ECE7E6E7D7E2D7BED9BE97CC9766B96600960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          00960000960000960000960000960000960049AD495DB65D73BE7381C3818CC7
          8C91C99192C9928DC88D84C48477BF7762B8624EAF4E00960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          00009600009600009600}
        HandleImage.Data = {
          BE000000424DBE00000000000000760000002800000009000000090000000100
          0400000000004800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333000
          0000333000333000000033099903300000003099999030000000309999903000
          0000307999903000000033077903300000003330003330000000333333333000
          0000}
        Anchors = [akTop, akRight]
      end
      object vrwhlWindDirec: TVrWheel
        Left = 120
        Top = 321
        Width = 100
        Height = 100
        MaxValue = 360
        BackImage.Data = {
          66750000424D6675000000000000360000002800000064000000640000000100
          18000000000030750000C30E0000C30E00000000000000000000009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          960000960000960000960000960073BA7389C2899CC89CA7CCA7AFCFAFB4D0B4
          B4D0B4B1CFB1A9CCA99FC99F8EC48E78BC785CB25C0096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          960000960000960053AF5387C287B3D1B3CFD9CFDDDBDDE1DAE1DFD7DFDBD2DB
          D6CED6D3CCD3D1CAD1D3CDD3D3CDD3D3CDD3D7D0D7D6CED6DAD1DADFD6DFE1DA
          E1DFDBDFD3DAD3BAD3BA91C69100960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600269F2669B869ABCFABD6DCD6E4DEE4DFD7DFD3CCD3C5C2C5
          BBB9BBB3B2B3ADADADA8A8A8A6A6A69A9A9A9595957F7F7F8080808484847A7B
          7AA3A4A3A8A8A8ACACACB2B2B2B9B8B9C3C0C3D0CAD0DED5DEE5DCE5DBDDDBB6
          D2B677BD77009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600A2CDA2DADEDAE6DDE6D9D2D9C6C3C6
          B8B7B8ADADADA4A4A49D9D9D9797979191918D8D8D8A8A8A8B8B8B7070705B5B
          5B4C4C4C4646464C4C4C5151517878788C8C8C8C8C8C9191919595959B9B9BA3
          A3A3ACACACB6B5B6C3C1C3D5CFD5E5DCE5DFDFDF009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600C0D7C0E8E2E8DED7DE
          C9C6C9B7B7B7ABABABA0A0A09696968E8E8E8888888282827E7E7E7A7A7A7878
          787676767575755050505454544141413939394F4F4F55555565656578787877
          77777B7B7B7E7E7E8181818787878E8E8E9696969F9F9FA9AAA9B5B5B5C5C3C5
          DBD4DBEAE1EACDDCCD78BD780096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600C8DBC8
          EBE3EBD9D3D9C1C0C1B1B1B1A4A4A49999998E8E8E8686867F7F7F7A7A7A7575
          757272726F6F6F6D6D6D6B6B6B6A6A6A6B6B6B3F3F3F4F4F4F44444440404041
          41413B3B3B6464646B6B6B6B6B6B6D6D6D7070707373737575757979797E7E7E
          8585858D8D8D979797A2A2A2B0B0B0BEBEBED4D0D4EBE1EBD5DFD579BE790096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600BDD8BDEEE5EEDAD5DAC1C1C1B1B1B1A2A2A29696968B8B8B8282827B7B
          7B7575757171716D6D6D6A6A6A69696966666665656564646463636363636364
          64646262626060606262626060605F5F5F646464636363646464646564676667
          6969696A6A6A6E6E6E7171717575757A7A7A818181898989949494A1A1A1AEAF
          AFBFBFBFD5D1D5EDE3EDCFDECF5EB55E00960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600008F00009600009600ECE8ECE3DBE3C6C6C6B5B4B4A5A4A49797978B8B
          8B8181817979797474746F6F6F6B6B6B69696967676765656563636361616161
          61616060606060605F5F5F6060606060605858585555556060606060605F5F5F
          6060606060606262626161616363636565656666666969696C6C6C7070707373
          737979798080808A8A8A959595A3A3A3B2B2B2C2C3C2DDD7DDF0E8F0B0D4AF00
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000090004CAF4CD2E1D2F0E6F0D1D0D1BCBCBCABAB
          AB9C9C9C8E8E8E8383837B7B7B7474746F6F6F6B6B6B68686865656563636362
          62626262626262626161615757576363636464646464646565656B6B6B3C3C3C
          2D2D2D6B6B6B6565656565656565656565655757576161616363636363636262
          626464646666666868686C6C6C6F6F6F7474747A7A7A8383838D8D8D9A9A9AA9
          A9A9BABABACCCCCCEBE2EBE3E6E3009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          00960000960000960000960000960000960000960006940683C583F1ECF1E4DE
          E4C8C8C8B6B6B6A4A4A49595958888887E7E7E7777777171716C6C6C69696966
          66666464646464646464646565656767676A6A6A6E6E6E5B5B5B707070797979
          7B7B7B7C7C7C8383834949493838388484847C7C7C7B7B7B7A7A7A7575755B5B
          5B6D6D6D6B6B6B6868686666666565656666666565656767676A6A6A6D6D6D71
          71717777777E7E7E888888939393A2A2A2B3B3B3C4C5C4DDDADDF5ECF5A2D0A2
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600009600009600009600009600009600009600009600009600009600199B
          19AFD5AFF7EDF7D9D7D9C4C4C4B1B1B1A0A0A09292928686867C7C7C75757570
          70706C6C6C6969696767676868686262625959597171717575757B7B7B838383
          8E8E8E7777778B8B8B9E9E9EA0A0A0A1A1A1AEAEAE5B5B5B444444AEAEAEA3A3
          A3A1A1A1A0A0A09090907373738F8F8F8585857D7D7D7676767272725E5E5E5F
          5F5F6969696868686A6A6A6D6D6D7171717575757C7C7C8484849090909E9E9E
          AFAFAFC1C1C1D4D3D4F4EAF4CBE1CB0096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960029A229CCE2CCF5EBF5D4D4D4C1C1C1AFAFAF9D9D9D90909085
          85857C7C7C7575757171716F6F6F6A6A6A6A6A6A6B6B6B7070707676765F5F5F
          8383839494949E9E9EA9A9A9B3B3B3B6B6B6BEBEBEC7C7C7C9C9C9CACACAD4D4
          D49292927F7F7FD4D4D4CCCCCCCACACAC7C7C7BFBFBFB4B4B4B5B5B5ABABABA0
          A0A09696968B8B8B6262627474747272726D6D6D6B6B6B6B6B6B707070727272
          7575757B7B7B8484848E8E8E9C9C9CACACACBEBFBED1D1D1EEE7EEE3EAE348AE
          4800960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960035A735DDE8DDF2EAF2D4D4D4C2C2C2AF
          AFAF9D9D9D9090908585857C7C7C7676767373736A6A6A666666737373747474
          7C7C7C8787879797978F8F8FA2A2A2BDBDBDC6C6C6CECECED6D6D6DDDDDDE3E3
          E3E7E7E7EAEAEAECECECECECECEFEFEFF0F0F0ECECECECECECEBEBEBE8E8E8E4
          E4E4E0E0E0D8D8D8D0D0D0C8C8C8BFBFBFA9A9A98E8E8E9A9A9A8A8A8A7F7F7F
          7777777474746969696969697474747777777D7D7D8484848F8F8F9C9C9CACAC
          ACBEBEBED0D1D0EBE6EBEFEFEF59B45900960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          000096000096000096000096000096000096000096000096003AA93AE5ECE5F1
          EAF1D4D4D4C3C3C3B0B0B09F9F9F9292928787877F7F7F797979757575757575
          6565652424247D7D7D8D8D8D999999AAAAAAB9B9B9C8C8C8D2D2D2DCDCDCE4E4
          E4EDEDEDF4F4F4F9F9F9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFEFAFAFAF5F5F5EEEEEEE6E6E6DDDDDDD4D4D4
          CBCBCBBCBCBCADADAD9D9D9D8F8F8F8787872B2B2B5858587979797676767A7A
          7A7F7F7F8787879191919F9F9FAEAEAEC0C0C0D2D3D2EAE6EAF6F2F65FB75F00
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600E4EEE4F3ECF3D7D8D7C6C6C6B4B4B4A3A3A39696968A8A8A838383
          7D7D7D7979797878787B7B7B898989424242525252B6B6B6BDBDBDCCCCCCD8D8
          D8E3E3E3EEEEEEF7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8EC
          ECECEBEBEBECECECECECECEBEBEBECECECF8F8F8FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF9F9F9F0F0F0E6E6E6DADADACFCFCFC0C0C0BABABA6E6E6E3232
          328888887E7E7E7A7A7A7A7A7A7E7E7E8383838B8B8B959595A1A1A1B2B2B2C3
          C3C3D4D5D4EDE8EDF7F3F7009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600DEEBDEF7EFF7DBDCDBCCCCCCB9B9B9A8A8A8
          9A9A9A8F8F8F8787878383838080807E7E7E8383838C8C8C9E9E9EA0A0A03030
          30AFAFAFDFDFDFE6E6E6F2F2F2FCFCFCFFFFFFFFFFFFFFFFFFF5F5F5CCCCCC9D
          9D9D7272724C4C4C363636232323232323232323232323232323232323363636
          4C4C4C7272729D9D9DCCCCCCF5F5F5FFFFFFFFFFFFFFFFFFFEFEFEF5F5F5E9E9
          E9E0E0E0C3C3C3313131909090A5A5A58F8F8F86868680808081818184848487
          87878F8F8F999999A7A7A7B6B6B6C8C8C8D9DAD9F0EBF0F3F4F3009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600149A14CCE5CCFCF3FCE0E0E0
          D0D0D0BEBEBEAEAEAEA0A0A09595958D8D8D8888887B7B7B8282828C8C8C9696
          96A6A6A6B9B9B9D0D0D0ABABABCBCBCBF8F8F8FEFEFEFFFFFFFFFFFFF7F7F7B8
          B8B86D6D6D3131311010100303030303030606060909090D0D0D0D0D0D0D0D0D
          0D0D0D0D0D0D0D0D0D0909090606060303030303031010103131316D6D6DB8B8
          B8F7F7F7FFFFFFFFFFFFFFFFFFF9F9F9D8D8D8A0A0A0D2D2D2BDBDBDAAAAAA9A
          9A9A8F8F8F8686867A7A7A8888888D8D8D9494949F9F9FACACACBCBCBCCECECE
          DDDEDDF5F0F5E8F0E82EA62E0096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          ABD9ABFFF8FFE5E5E5D6D6D6C5C5C5B4B4B4A6A6A69A9A9A9292928D8C8C8C8C
          8C7E7E7E6B6B6B9D9D9DB0B0B0C2C2C2D3D3D3E0E0E0F7F7F7FFFFFFFFFFFFFF
          FFFFE4E4E48C8C8C3333330909090202020A0A0A101010121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          121010100A0A0A0202020909093333338C8C8CE4E4E4FFFFFFFFFFFFFFFFFFFB
          FBFBE3E3E3D6D6D6C7C7C7B4B4B4A5A5A57272727979798E8E8E8D8D8D929292
          9A9A9AA5A5A5B2B2B2C2C2C2D2D2D2E2E3E2FDF4FDD1E8D10096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096007AC57AFFFBFFEBEAEBDBDBDBCBCBCBBABABAACACACA0A0
          A09797979292928F8F8F9191919D9D9D8D8D8D9F9F9FCDCDCDD9D9D9E7E7E7F7
          F7F7FFFFFFFFFFFFEAEAEA818181202020020202090909111111121212121212
          121212121212121212111111111111100F0F0F0F0F0F0F0F0F0F0F0F0F0F100F
          0F11111111111112121212121212121212121212121211111109090902020220
          2020818181EAEAEAFFFFFFFFFFFFFAFAFAEBEBEBDCDCDCD1D1D1AAAAAA898989
          A0A0A0949494919191939393989898A0A0A0ABABABB9B9B9C9C9C9DADAD9E7E8
          E7FFFAFF00960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096003FAD3FF8F8F8F3EFF3E1E1E1D2D2
          D2C2C2C2B3B3B3A7A7A79E9E9E9898989595959696969E9E9EABABABBFBFBFCD
          CDCDDDDDDDEDEDEDFCFCFCFFFFFFFFFFFFA3A3A32929290101010C0C0C121212
          1212121212121212121212121212121314141718181E1E1E2425252D2E2E2E2F
          2F2E2F2F2E2F2F2E2F2F2D2E2E2425251E1E1E17181813141412121212121212
          12121212121212121212120C0C0C010101292929A3A3A3FFFFFFFFFFFFFDFDFD
          F0F0F0E0E0E0D0D0D0C3C3C3B0B0B0A2A2A29999999797979898989E9E9EA7A7
          A7B2B2B2C0C0C0D0D0D0E0E0E0EDECEDFFFCFF00960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600009600009600009600009600009600009600009600009600009600D1EA
          D1FDF6FDE7E7E7D9D9D9C9C9C9BABABAADADADA3A3A39D9D9D9D9D9D9B9B9BA1
          A1A1AEAEAEC1C1C1D2D2D2E0E0E0F0F0F0FEFEFEFFFFFFE0E0E0585858040404
          0909091212121212121212121313131211111414141D1D1D2A2B2B3536363D3E
          3E4142424445454445454445454445454445454445454445454445454142423D
          3E3E3536362A2B2B1D1D1D141414121111131313121212121212121212090909
          040404585858E0E0E0FFFFFFFFFFFFF4F4F4E3E3E3D6D6D6C5C5C5B3B3B3A5A5
          A59D9D9D9E9E9E9E9E9EA3A3A3ACACACB8B8B8C6C6C6D7D7D7E5E5E5F7F3F7EE
          F5EE009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960089CC89FFFDFFEBECEBDFDFDFD0D0D0C0C0C0B3B3B3A8A8A8A2
          A2A2989898808080A4A4A4B1B1B1C1C1C1D2D2D2E0E0E0F2F2F2FFFFFFFFFFFF
          BDBDBD2626260202021111111212121212121213131111111717172627273838
          3841434344454543444442434341424241424241424241424241424241424241
          4242414242414242414242424343434444444545414343383838262727171717
          111111121313121212121212111111010101262626BDBDBDFFFFFFFFFFFFF6F6
          F6E4E4E4D6D6D6C6C6C6B5B5B5ABABAB848484959595A3A3A3A8A8A8B2B2B2BE
          BEBECDCDCDDDDDDDEAEAEAFFFAFFB5DEB5009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960034A934F6F9F6F5F2F5E5E5E5D7D7D7C7
          C7C7B9B9B9AEAEAEA6A6A6A1A1A1A1A1A1888888828282BEBEBED3D3D3DFDFDF
          F2F2F2FFFFFFFFFFFF9B9B9B0D0D0D0808081414141212121313131212121515
          152928293D3E3E44454543444441424241424241424241424241424241424241
          4242414242414242414242414242414242414242414242414242414242414242
          4142424344444445453D3E3E2929281515151212121313131212121313130808
          080D0D0D9B9B9BFFFFFFFFFFFFF6F6F6E3E3E3D6D6D6C5C5C58B8B8B858585A2
          A2A2A2A2A2A6A6A6ADADADB8B8B8C5C5C5D5D5D5E3E3E3F1EFF1FFFDFF009600
          0096000096000096000096000096000096000096000096000096000096000096
          00009600009600009600009600009600009600009600009600009600B5DEB5FF
          FBFFEAEBEADDDDDDCFCFCFC0C0C0B4B4B4AAAAAAA4A4A4A2A2A2A5A5A5B3B3B3
          B1B1B1CCCCCCDFDFDFF1F1F1FFFFFFFFFFFF8B8B8B0707070D0D0D1515151414
          141414141212122021213A3B3B44454543444441424241424241424241424241
          4242414242414242414242414242414242414242414242414242414242414242
          4142424142424142424142424142424142424142424344444445453A3B3B2021
          211212121313131313131414140D0D0D0707078B8B8BFFFFFFFFFFFFF5F5F5E2
          E2E2D2D2D2B0B0B0B6B6B6A9A9A9A4A4A4A6A6A6AAAAAAB3B3B3BEBEBECCCCCC
          DCDCDCE8E9E8FBF7FBDBEEDB0096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          96000096004DB34DFEFDFEF2F1F2E5E5E5D7D7D7C7C7C7BBBBBBB0B0B0A8A8A8
          A5A5A5A7A7A7AFAFAFBCBCBCD0D0D0DCDCDCEEEEEEFFFFFFFFFFFF8C8C8C0303
          030E0E0E1414141414141313131414142D2E2E43444443444441424241424241
          4242414242414242414242414242414242414242414242414242414242414242
          4142424142424142424142424142424142424142424142424142424142424142
          424142424142424344444344432D2F2E1515151313131414141414140E0E0E03
          03038C8C8CFFFFFFFFFFFFF2F2F2DFDFDFD5D5D5C1C1C1B3B3B3AAAAAAA7A7A7
          A9A9A9B0B0B0BABABAC6C6C6D4D4D4E3E3E3EFEFEFFFFEFF7BC67B0096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600C2E4C2FFFBFFEBEBEBDEDEDECFCFCF
          C1C1C1B5B5B5AEAEAEAFAFAFAAAAAAADADADBABABACACACAD8D8D8E8E8E8FBFB
          FBFFFFFF9C9C9C0707070F0F0F14141414141413121218181836373744454541
          4242404141404141404141404142404141404141404141404141404141404141
          4041414041414041414041414041414041414041414041414041414041414041
          4140414140414140414140414140414140414140414141424244454537373718
          19191312121414141414140F0F0F0707079C9C9CFFFFFFFDFDFDEDEDEDDCDCDC
          CECECEBEBEBEB1B1B1ACACACB2B2B2AFAFAFB5B5B5C1C1C1CECECEDCDCDCE9E9
          E9FAF6FAE5F2E5189D1800930000960000960000960000960000960000960000
          96000096000096000096000096000096000096000096000096004BB44BFEFDFE
          F3F1F3E6E6E6D7D7D7C8C8C8BBBBBBB3B3B3A9A9A9787878A5A5A5C0C0C0C6C6
          C6D4D4D4E2E2E2F7F7F7FFFFFFBDBDBD0E0E0E0E0E0E1414141515151414141A
          1A1A3A3B3B4243433F40403F40403F40403F40403F40403F40403F40403F4040
          3F40403F40403F40403F40403F40403F40403F40403F40403F40403F40403F40
          403F40403F40403F40403F40403F40403F40403F40403F40403F40403F40403F
          40403F40403F40404243433A3B3B1A1A1A1313131515151414140E0E0E0E0E0E
          BDBDBDFFFFFFF9F9F9E7E7E7D7D7D7CACACAC4C4C4B1B1B1787878A2A2A2B4B4
          B4BBBBBBC8C8C8D6D6D6E3E3E3EFEFEFFFFFFF7AC67A008F0000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600009600B5DFB5FFFBFFECECECDFDFDFD1D1D1C3C3C3B7B7B7B1B1B1ACAC
          AC575757323232888888CFCFCFDCDCDCEFEFEFFFFFFFE2E2E22727270A0A0A14
          14141515151414141A1A1A3B3B3B4041413E3F3F3E3F3F3E3F3F3E3F3F3E3F3F
          3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F
          3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E
          3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F3E3F3F4041413B3B3C1A1A1A
          1413131515151515150A0A0A272727E2E2E2FFFFFFF4F4F4E0E0E0D6D6D69999
          993A3A3A464646A5A5A5B3B3B3B7B7B7C2C2C2CFCFCFDEDEDEEAEAEAFBF7FBDC
          EFDC0F9A0F009600009600009600009600009600009600009600009600009600
          009600009600009600009600009600009600F8FAF8F5F3F5E7E7E7DADADACBCB
          CBBEBEBEB4B4B4AEAEAEADADADB8B8B89C9C9C464646828282EFEFEFFBFBFBFD
          FDFD5858580303031414141515151615151818183839393F40403C3D3E3D3E3E
          3D3E3D3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3D3D3E
          3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3D3E3E3C3E3E3D
          3E3E3D3E3E3D3E3D3D3E3E3D3E3E3D3E3D3D3E3D3D3E3E3D3E3E3D3D3E3D3D3E
          3D3E3E3C3D3D3F4040383938181818161615161616151515030303585858FDFD
          FDFBFBFBF4F4F49E9E9E3737378D8D8DBBBBBBB1B1B1B0B0B0B5B5B5BDBDBDCA
          CACAD7D7D7E5E5E5F1F0F1FFFFFF5FBB5F009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096008DCE8DFFFE
          FFEEEEEEE3E3E3D4D4D4C6C6C6BABABAB2B2B2AFAFAFAFAFAFB5B5B5C9C9C9D1
          D1D1CFCFCFF3F3F3FFFFFFA3A3A3050505131313161616181818151515323333
          3E3F3F3B3C3B3B3C3C3B3C3C3B3C3C3B3C3C3C3C3C3B3C3C3B3C3C3B3C3C3B3C
          3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3D3C3B3C3B3B3C3C3B
          3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3C3C3C
          3C3D3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3B3C3C3E3F3F3233331515151718
          18161616131313050505A3A3A3FFFFFFF6F6F6D5D5D5D0D0D0D0D0D0BABABAB2
          B2B2B0B0B0B3B3B3BABABAC6C6C6D2D2D2E0E0E0ECECECFFFCFFBBE1BB019301
          0096000096000096000096000096000096000096000096000096000096000096
          000096000E9A0EDBEEDBFCF8FCEAEAEADDDDDDCFCFCFC2C2C2B8B8B8B0B0B0AF
          AFAFB3B3B3BCBCBCC9C9C9D8D8D8EAEAEAFCFCFCE9E9E92929290B0B0B161616
          1A1A1A1415152829283C3D3D393A3A3A3A3A3A3B3B393B3B3A3B3B393B3B393B
          3B393B3B3A3B3B3A3B3B3A3B3B3A3B3A393B3A393A3B3A3B3B3A3B3B3A3B3A3A
          3B3B393B3A3A3B3A3A3A3A3A3A3B3A3A3B3A3B3A3A3B3A393B3B3A3B3B3A3A3B
          3A3A3B3A3B3B3A3B3B3A3B3A3A3B3B393B3B393B3B3A3B3B3A3B3A3A3B3A393B
          3B393A3A3D3D3D2829291515151919191616160B0B0B292929E9E9E9FCFCFCEE
          EEEEDCDCDCCECECEC0C0C0B6B6B6B1B1B1B3B3B3B8B8B8C2C2C2CECECEDBDBDB
          E8E8E8F7F4F7F6F9F62DA62D0096000096000096000096000096000096000096
          000096000096000096000096000096004BB34BFEFDFEF3F2F3E6E6E6D9D9D9CA
          CACABEBEBEB6B6B6B3B3B3B3B3B3B7B7B7C2C2C2D0D1D1DCDBDBF0F0F0FFFFFF
          8181810202021515151919191919191D1D1D393A3A393A393839383839393739
          3938383938383938383838383838393938383838383938393938383938383938
          3939383939383838383839383938383838383839383839383939383939383839
          3838393839383838393839383839383838383838383738393838393838383838
          39383839383939383938383939383939393A39393A3A1D1D1D18181819191915
          1515020202818181FFFFFFF3F3F3E0E0E0D4D4D4C7C7C7BBBBBBB5B5B5B6B6B6
          B7B7B7BFBFBFCACACAD6D6D6E5E5E5F0F0F0FFFFFF79C6790096000096000096
          0000960000960000960000960000960000960000960000960000960095D295FF
          FDFFEEEEEEE3E3E3D5D5D5C7C7C7BDBDBDB6B6B6A1A1A1A6A6A6BEBEBEC9C9C9
          D4D5D5E4E3E3F9F9F9E0E0E02121200E0E0E1717171E1E1E1716173030303839
          3936373737373737373736373737373736373737373737373737373736373736
          3737373737363737363737363837363737363737363737363737373737373737
          3737373637373637383737373737373737373637373737373737373737373637
          3736373736373637373737373736373737383737373737373737373736373738
          39393030311616161D1D1D1818180E0E0E202020E1E1E1FAFAFAE8E8E8D9D9D9
          CDCDCDC1C1C1ADADAD9F9F9FB7B7B7BDBDBDC6C6C6D2D2D2E1E1E1EDEDEDFFFB
          FFC1E4C102940200960000960000960000960000960000960000960000960000
          9600009600009600D4EBD4FDF9FDEBEBEBDFDFDFD1D1D1C5C5C5BBBBBBB6B6B6
          A5A5A48C8C8C9E9E9ECECECEDADADAEBEBEBFFFFFF8989890303031515151D1D
          1D1B1B1B20212137383834353535363635353535353535363535363535353535
          3535353535353636353535353535353635353535343636343635353635353635
          3535363535353535363535353536353535353535353536353536353536363536
          3635353535353535363535353635353635363535353535353535353535353635
          36363535353535353535363436353738382021211B1B1B1E1E1E161616030303
          898989FFFFFFEFEFEFDDDDDDD4D4D4ABABAB8F8F8FA1A1A1B9B9B9BCBCBCC4C4
          C4D0D0D0DDDDDDEAEAEAF8F5F8F3F8F325A32500960000960000960000960000
          9600009600009600009600009600009600009600F9FBF9F6F4F6E9E9E9DCDCDC
          CFCFCFC3C3C3BABABAB5B5B5B8B8B8BFBFBFC0C0C0D1D1D1DEDEDEF2F2F2EDEE
          EE3333330B0B0B1A1A1A2222221717172E2F2F34343532333333343433333433
          3333333333333433333333333333333334333433333333333333333334333334
          3334333333333334333334333333343333333333333333333332333333333334
          3233343333333333333333343333333333333333343333343333333433343433
          33333333333334333333333334343334333333333333333233333434352F2E2F
          1717172222221A1A1A0C0C0C333333EDEDEDF3F3F3E3E3E3D6D6D6C7C7C7C1C1
          C1BCBCBCB8B8B8BCBCBCC3C3C3CECECEDADADAE7E7E7F3F2F3FFFFFF5EBA5E00
          9600009600009600009600009600009600009600009600009600009600009600
          FFFFFFF1F1F1E7E7E7D9D9D9CCCCCCC1C1C1BABABAB7B7B7B9B9B9C0C0C0CCCC
          CCD5D5D5E3E3E3FAFAFAB3B4B40A0A0A1515152020201E1E1E1D1D1D32333331
          3231313132313132313131313131313132313232313231313231313131313131
          3131313131323130323131323132313131313132323132323132323132313131
          3031313131313131313131323131323131313131313131323131313131313231
          3231313231313132313132313131313231313132313231313132313131313131
          3131313131313131323333331D1D1D1F1F1F2020201515150A0A0AB3B3B3FBFB
          FBE8E8E8DADADAD0D0D0C4C4C4BBBBBBB9B9B9BBBBBBC2C2C2CCCCCCD7D7D7E4
          E4E4EFEFEFFFFEFF97D397009600009600009600009600009600009600009600
          0096000096000096009DD59DFFFFFFEFEFEFE4E4E4D6D6D6CACACAC1C1C1BABA
          BAB8B8B8BCBCBCC3C3C3CFCFCFD9D9D9E8E8E8FBFBFB6A6A6A0606061B1B1B26
          27261919192828283031312E2F2F2F2F2F2F2F302F2F2F2F2F2F2F30302F2F30
          2F30302F30302F2F2F2F2F302F30302F30302F2F302F2F302F302F2F2F2F2F30
          302F2F302F30302F302F2F2F2F2F2F302F302F2F2F2F2F2F2F2F2F302F302F2F
          2F2F2F302F2F2F2F2F2E2F2F2F2F2F302F2F2F302F2F302F2F2F2F30302F2F30
          2F302F2F2F2F2F2F302E2F2F2F302F2F2F2F2E2F2F3031312727281A1A1A2727
          271B1B1B0606066B6B6BFBFBFBEAEAEADDDDDDD3D3D3C8C8C8BFBFBFBBBBBBBC
          BCBCC1C1C1CACACAD5D5D5E3E3E3EDEDEDFFFAFFC7E7C7009600009600009600
          009600009600009600009600009600009600009600C7E7C7FFFBFFEDEDEDE2E2
          E2D5D5D5CACACAC1C1C1BCBCBCBBBBBBBEBEBEC7C7C7D2D2D2DCDCDCECECECE7
          E7E73131320F0F0F2122212827271918192C2D2C2C2E2E2D2D2D2D2D2D2D2E2E
          2D2E2E2D2E2E2D2E2E2D2D2E2D2E2E2D2E2E2D2D2E2D2D2E2D2E2E2D2E2E2D2E
          2E2D2E2E2D2E2E2D2E2E2D2D2D2D2D2E2D2D2E2D2D2D2D2E2E2D2E2E2D2E2E2D
          2E2E2D2D2E2D2D2D2D2E2D2D2D2D2D2E2E2D2E2D2D2D2D2D2D2D2D2E2D2D2D2E
          2D2D2E2D2D2D2D2D2E2D2E2E2D2E2D2D2E2D2D2E2E2D2E2E2D2E2D2D2E2D2D2E
          2E2D2E2E2C2D2D191919282828212121100F10323232E7E7E7EDEDEDE0E0E0D6
          D6D6CCCCCCC3C3C3BFBFBFBEBEBEC2C2C2C9C9C9D4D4D4E0E0E0ECECECFBF7FB
          EBF4EB0096000096000096000096000096000096000096000096000096000096
          00E8F3E8FBF8FBECECECE0E0E0D3D3D3C9C9C9C1C1C1BABABAB8B8B8C1C1C1CB
          CBCBD5D5D5DFDFDFF2F2F2C1C1C11313131918192829282424241C1D1D2C2D2D
          2A2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2C2B2B2B2B2B2B2B2B2C2C2B2B2C2B2B2B2B2B2B2B2B2B2B2C2B2B2B2B
          2B2C2B2B2B2B2A2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2A2B2B2C2D2D1C1C1C2525252A292919181913
          1413C2C2C2F2F2F2E2E2E2D8D8D8CFCFCFC6C6C6BBBBBBBCBCBCC2C2C2C9C9C9
          D3D3D3DFDFDFEBEBEBF6F5F6FCFCFC0096000096000096000096000096000096
          0000960000960000960033A833F9FBF9F7F5F7EBEBEBDFDFDFD3D3D3C9C9C9C3
          C3C3B5B5B59191919E9E9EC5C5C5D9D9D9E1E1E1F4F4F49494940A0A0A1E1F1E
          2F2F2F1F201F2021212A2A2A2929292928292928292928292928282929282929
          2929282829292929292929292929292929292929292829282929282929292929
          2929292929292929292928292929292929292928292928292929292829292929
          292929292829292A292929292929292928292828292929292929292929292929
          292929292929292928292929282829292928292929292929292929292A2A2A20
          20211F201F3030301E1E1E0A0A0A949494F6F6F6E3E3E3DCDCDCC9C9C9A2A2A2
          939393B1B1B1C6C6C6CACACAD2D2D2DEDEDEE9E9E9F4F3F4FFFFFF5CBA5C0096
          000096000096000096000096000096000096000096004EB34EFFFEFFF5F4F5EA
          EAEADFDFDFD3D3D3CACACAC2C2C2C0C0C0C0C0C0C2C2C2CDCDCDD9D9D9E2E2E2
          F2F2F26C6B6B0C0C0B2424243333331A1B1B2324242728272727262727262726
          2627262727272727272727262727272627272627262627262627272727272727
          2627272727272727272626272626272626272626272727272727272627272626
          2726272726262726272727272727272726272727262727272727272727272726
          2627262727272627272627262627272727272727272727272727262627262627
          27272727272726262727272324231B1B1B3535352424240B0B0C6B6C6CF3F3F3
          E4E4E4DDDDDDD1D1D1C3C3C3C3C3C3C2C2C2C5C5C5CACACAD2D2D2DDDDDDE8E8
          E8F2F2F2FFFFFF7AC77A00960000960000960000960000960000960000960000
          960064BD64FFFFFFF4F3F4EAEAEADEDEDED2D2D2CACACAC3C3C3C1C1C1C3C3C3
          CBCBCBD3D3D3DBDBDBE2E2E2EAEAEA4B4B4B1111112B2A2B3534351918192424
          2424252525252425252525252525252525242525252425252425252525242525
          2425252424252425252425252425252524252524252424252425252524252524
          2525252525252524242524252525242524252525252525242525252525252524
          2525252425252525252525252525252525252525242425252525242425252525
          2525252525252525252525252525252425252425242525242424191919363636
          2A2B2B1111114C4C4CEBEBEBE3E3E3DEDEDED8D8D8CFCFCFC7C7C7C4C4C4C6C6
          C6CACACAD2D2D2DDDDDDE8E8E8F2F2F2FFFFFF95D29500960000960000960000
          960000960000960000960000960079C779FFFFFFF4F4F4E9E9E9DDDDDDD3D3D3
          CCCCCCC6C6C6C2C2C2C5C5C5CBCBCBD5D5D5DDDDDDE2E2E2DEDEDE3939391717
          1731303034343417171723232323232323232323222323232323232223232223
          2323232323232323232323232323232323232323232322232322232322232323
          2323232323232323232323232323222322232323232323232323232323232323
          2323232323232323232223232323232323232323232323232323232323232323
          2323232323232323232223232323232223232323232323232323232323232323
          232223232323171817343534313132171716393939DFDFDFE3E3E3DEDEDED8D8
          D8D0D0D0C9C9C9C6C6C6C7C7C7CCCCCCD3D3D3DDDDDDE8E8E8F2F2F2FFFFFFA8
          DAA800960000960000960000960000960000960000960000960089CD89FFFEFF
          EEEEEEE9E9E9E1E1E1D6D6D6CBCBCBC9C9C9C5C5C5C7C7C7CECECED7D7D7DEDE
          DEE3E3E3D1D1D12828281C1D1C37373730303015151521212121212121212121
          2121212021212120212121212021212021212120212120212121212121212121
          2121212021202021212121212121212121202120212121212121212121212121
          2121212021212121212021212021212121202121202121212021202121202121
          2121212121212121212120212121212120212121212121212021212121212020
          2121202121212121202121202120202221221717173131313837381D1D1D2829
          29D1D1D2E3E3E3DFDFDFD9D9D9D1D1D1CBCBCBC8C8C8C8C8C8D1D1D1DEDEDEE3
          E3E3F1F1F1F6F6F6FFFEFFB5DFB5009600009600009600009600009600009600
          00960000960096D596B2A9B2B2B2B2C4C4C4BEBEBEB7B7B76D6D6DA2A2A2D6D6
          D6D3D3D3DADADAE2E2E2DFDFDFE1E1E1CFCFCE292929201F1F3C3C3C32323214
          14141F20201F1E1F1E1E1F1E1E1E1F1F1E1F1F1F1E1F1E1F1E1F1E1F1F1E1E1E
          1F1E1F1F1E1E1E1E1E1E1E1E1E1E1E1E1F1F1E1E1F1F1E1F1E1E1F1E1E1F1F1F
          1F1F1F1F1F1F1F1E1E1F1E1F1E1E1E1F1E1E1E1E1E1F1F1E1E1F1E1E1F1F1F1F
          1E1E1F1E1E1F1E1E1F1F1E1F1F1F1F1F1F1E1F1E1E1E1F1F1E1F1F1E1F1F1E1E
          1E1E1F1E1E1E1F1E1E1F1E1F1F1E1F1E1E1E1E1E1E1E1E1F1F1F1F20201F1616
          163434343C3C3C1F1F20292929CFCFD0E1E1E1DFDFDFE3E3E3DEDEDED6D6D6D2
          D2D2CFCFCFB7B7B79C9C9CC5C5C5A4A4A4DADADAFFFEFFBDE3BD009600009600
          0096000096000096000096000096000096009CD89CC7C0C79E9E9ED7D7D79898
          989E9E9E9F9F9F8D8D8D8282826868686D6D6D7B7B7BD5D5D5E2E2E2CDCDCD2A
          292A2222224040403535351313131D1E1E1C1D1D1D1D1D1D1D1D1C1D1D1C1D1D
          1D1D1D1C1D1C1D1C1D1D1D1D1C1D1D1C1D1D1D1D1D1D1D1C1D1D1D1D1D1D1D1D
          1D1C1D1D1D1D1D1D1D1D1C1E1D1C1D1D1C1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1C1D1D1C1D1D1C1D1D1C1D1D1C1D1D1C1D1D1C1D1C1C1D1D1C1D1D1D1E1D
          1D1D1D1C1D1D1C1D1D1C1D1D1D1D1D1D1D1D1C1D1D1C1D1D1C1D1D1D1D1D1D1D
          1D1D1D1D1C1D1D1E1E1E151515363636404040212121292929CECECEE0E0E0E1
          E1E18F8F8F6868686A6A6A707070C6C6C6AEAEAE7F7F7F6B6B6B959595A9A9A9
          FFFFFFC2E5C200960000960000960000960000960000960000960000960099D6
          99DAD3DA848484C0C0C09999997D7D7D8E8E8E8F8F8FA3A3A3919191949494A2
          A2A2DADADADFDFDFCBCBCB2A2B2A2323234343433738371212121B1B1B1B1B1C
          1B1C1B1B1C1B1B1B1C1B1C1C1B1C1C1B1C1B1B1B1B1B1B1C1B1C1B1B1C1C1B1C
          1B1C1C1B1B1B1C1B1B1C1B1C1B1B1C1B1B1B1C1B1B1B1B1C1B1B1C1C1B1C1C1B
          1B1B1C1B1B1B1B1B1B1C1B1B1C1B1B1B1B1B1C1C1B1B1B1B1C1B1B1B1C1B1B1C
          1B1B1B1B1C1C1B1C1C1B1C1C1B1C1C1B1C1B1B1C1C1B1B1C1B1B1B1B1C1C1B1C
          1C1B1C1C1B1C1C1B1B1B1B1B1B1B1C1C1B1C1C1B1B1C14141437373742414123
          23232A2A2ACBCBCBDDDDDDE0E0E0B1B1B1969696949494969696CECECE989898
          828282606060B9B9B9ACACACFFFFFFC2E5C20096000096000096000096000096
          0000960000960000960097D597D6D1D6A6A6A6CACACAA6A6A6B4B4B48A8A8AB8
          B8B8D7D7D7D6D6D6DDDDDDE4E4E4E1E1E1DBDBDBC8C8C82A2A2A242424454545
          3939391111111A1A1A1A19191A1A191A1A191A19191A191A1A191A1A191A1A1A
          191A1A191A19191A1A191A191A19191A1A19191A1A191A19191A1A1A191A191A
          1A191A191A1A19191A191A19191A19191A191A1A1A191A1A191A1A1A1A1A1A1A
          1A1A1A1A1A1A1A1A1A1A1A191A1A1A1A19191A191A1A191A1A1A191A191A1A1A
          191A1A19191A1A1A1A1A1A191A1A191A1A191A1A1A191A1A191A191A1A19191A
          1A1A1313133737374343432424242A2A2AC9C9C8D9D9D9E0E0E0E7E7E7E0E0E0
          DADADAD6D6D6D6D6D6A1A1A1818181969696808080B9B9B9FFFFFFBCE3BC0096
          0000960000960000960000960000960000960000960086CC86FFFFFFFFFFFFF1
          F1F1EBEBEBE2E2E2DDDDDDD3D3D3CCCCCCCFCFCFD4D4D4DCDCDCE1E1E1D8D8D8
          C6C6C62B2B2B2525254747473A3A3A1011101818191818181817181817181718
          1818181717181718181818181817181818181818181818181818181818181817
          1818171818181718181818181818171818181818181818171818181818181818
          1818181818181818181818171818171718181718181818181818181818181818
          1718181717191818181818181817181818181817171717181817181818181818
          18181718181718171718181819181212123838384343432424242A2A2BC7C7C7
          D7D7D7E1E1E1E1E1E1D8D8D8D2D2D2CECECED0D0D0D6D6D6D2D2D2E8E8E8E3E3
          E3F5F5F5FFFFFFB3DFB300960000960000960000960000960000960000960000
          960075C675FFFFFFF6F6F6EFEFEFE6E6E6DDDDDDD7D7D7D2D2D2D0D0D0D0D0D0
          D6D6D6DEDEDEE3E3E3D4D4D4CECECE3B3B3B2323234646464545451213121616
          1616171716161716161716171716161616161616171616171716161716171716
          1616161616161616161716161617161617161617171616161617161616161616
          1616161617161617161616161616161616161616161716161716161616161616
          1616161716161716171717161616171616171716171616161616161716161716
          1616161716161716161616171617161617161616161616151616121312414141
          4241422121213B3B3BCFCFCFD3D3D3E1E1E1E2E2E2DADADAD3D3D3D1D1D1D2D2
          D2D7D7D7E0E0E0E6E6E6F0F0F0F5F5F5FFFFFFA5D9A500960000960000960000
          9600009600009600009600009600009600FFFFFFF8F8F8F0F0F0E8E8E8E0E0E0
          D9D9D9D4D4D4D2D2D2D4D4D4DADADADFDFDFE4E4E4D3D3D3D3D3D34D4D4D2020
          204343434E4E4F16161614141415151515151515151515151515151515151515
          1515151515151515151515151515151515151515151515151515151515151515
          1515151515151515151515151515151515151515151515151515151515151515
          1515151515151515151515151515151515151515151515151515151515151515
          1515151515151515151515151515151515151515151515151515151515151515
          1515151414141616164848483E3E3F1E1E1E4D4C4CD5D5D5D0D0D0E3E3E3E3E3
          E3DEDEDED7D7D7D4D4D4D4D4D4D8D8D8DFDFDFE7E7E7EFEFEFF6F6F6FFFFFF91
          D091009600009600009600009600009600009600009600009600009600FEFEFE
          FAF9FAF1F1F1EAEAEAE3E3E3DBDBDBD6D6D6D4D4D4CACACAC7C7C7D9D9D9E7E7
          E7D4D4D4D4D4D46766671D1D1D3F403F5655551E1E1E11121114141414141414
          1414141414141414141414141414141414141414141414141414141414141414
          1414141414141414141414141414141414141414141414141414141414141414
          1414141414141414141414141414141414141414141414141414131414141414
          1414141414141414141414141414141414141414141414141414141414141414
          1414141414141414141414141414141212111C1D1D4C4C4C3A3A391B1B1B6767
          66D5D5D5D0D0D0E8E8E8DBDBDBC6C6C6CBCBCBD4D4D4D6D6D6DADADAE2E2E2EA
          EAEAF1F1F1F7F7F7FFFFFF76C576009600009600009600009600009600009600
          009600009600009600F8FBF8FDFAFDF4F4F4ECECECE5E5E5DDDDDDDADADACBCB
          CBABABABB3B3B3D8D8D8E9E9E9D8D8D8D0D0D08686861D1D1D3B3A3B5857572C
          2C2C0E0E0E131313131313131313131313131313131313131313131313131313
          1313131313131313131313131313131313131313131313131313121313131313
          1313131313131313131313131313131313131313131313131313131313131313
          1313131313131313131313131313131313131313131313131313131313131313
          1313131313131313131313131313131313131313131313131313130F0F0F2828
          284D4D4D3535361B1B1B868686D1D1D1D2D2D2EAEAEADCDCDCB6B6B6ABABABC7
          C7C7DBDBDBDDDDDDE5E5E5ECECECF2F2F2F9F8F9FFFFFF57B857009600009600
          009600009600009600009600009600009600009600E3F2E3FFFDFFF5F5F5EEEE
          EEE7E7E7E0E0E0DBDBDBD7D7D7D9D9D9DEDEDEE0E1E1E7E7E7DEDEDECACACAA7
          A7A72525253535355554553E3E3F0D0D0D121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121312121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          121212121212120E0E0E363636494949303030222323A7A7A7CACACAD9D9D9EA
          EAEAE2E2E2E0E0E0DDDDDDD9D9D9DBDBDBDFDFDFE7E7E7EEEEEEF3F3F3FCFAFC
          FBFDFB36AA360096000096000096000096000096000096000096000096000194
          01C0E4C0FFFFFFF6F6F6F1F1F1EAEAEAE3E3E3DDDDDDDADADADADADADBDBDBDF
          DFDFE7E7E7E6E6E6C7C7C7BEBEBE3B3B3B2C2C2C4D4D4D505050131313111111
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          121212121212121212121212121212121111111414144444444241422828283A
          3A3ABFBFBFC3C3C3E1E1E1E9E9E9E1E1E1DCDCDCDBDBDBDBDBDBDDDDDDE2E2E2
          E9E9E9EFEFEFF6F6F6FFFDFFE7F5E70096000096000096000096000096000096
          0000960000960000960000900093D293FFFFFFF8F9F8F3F3F3ECECECE6E6E6E1
          E1E1DCDCDCDBDBDBDCDCDCE0E0E0E5E5E5ECECECCCCCCCC6C6C6646364242323
          4343435959592525250E0E0E1212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          121212121212121212121212121212121212121212121212121212120F0F0F21
          2121494A493A3A3A202020636363C7C7C7C4C4C4E9E9E9E8E8E8E2E2E2DDDDDD
          DCDCDCDDDDDDE0E0E0E5E5E5ECECECF2F2F2F7F8F7FFFFFFBFE4BF0096000096
          00009600009600009600009600009600009600009600008F005EBB5EFFFFFFFB
          FBFBF5F5F5EEEEEEE9E9E9E4E4E4DFDFDFDDDDDDDDDDDDE2E2E2E8E8E8EEEEEE
          D8D8D8C0C0C09494942525253B3B3B5555553F40400E0E0E1212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212120F0F0F353535464646333333222223949494C0C0C0CECECE
          EEEEEEEAEAEAE4E4E4DEDEDEDEDEDEE0E0E0E3E3E3E8E8E8EEEEEEF4F4F4F9FA
          F9FFFFFF8DCF8D00960000960000960000960000960000960000960000960000
          960000960029A529F6FBF6FEFCFEF7F7F7F2F2F2ECECECE6E6E6E3E3E3DFDFDF
          E2E2E2DCDCDCD0D0D0EBEBEBE8E8E8BCBCBCB5B5B53F3F3F2F2F2F4A4A4A5354
          541A1A1A10101012121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212121212121212121212121010101918194545453E3E3E2A2A2A
          3D3D3DB7B7B7B8B8B8E1E1E1EFEFEFD0D0D0D8D8D8E4E4E4E0E0E0E3E3E3E6E6
          E6EBEBEBF1F1F1F6F6F6FCFBFCFFFFFF53B65300960000960000960000960000
          9600009600009600009600009600009600009600CAE8CAFFFEFFF8F8F8F4F4F4
          EEEEEEE8E8E8E5E5E5E6E6E6C6C6C6AAAAAABFBFBFE9E9E9F2F2F2C9C9C9BBBB
          BB7575752525254040405555553838380E0E0E12121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212121212121212121212121212121212121212121212120F0F0F
          2F2F2F454545373737222222737373BDBDBDBFBFBFEFEFEFEDEDEDC8C8C8AAAA
          AABEBEBEE4E4E4E6E6E6E8E8E8EDEDEDF3F3F3F8F8F8FFFDFFEEF7EE00960000
          9600009600009600009600009600009600009600009600009600009600009600
          87CD87FFFFFFFBFBFBF7F7F7F1F1F1EBEBEBE8E8E8E6E6E6DBDBDBE1E1E1EAEA
          EAE9E9E9F1F1F1E0E0E0B2B2B2A6A6A63434343434344949495252521C1C1C0F
          0F0F121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121010101A1A1A4343433E3E3E2E2E2E323232A6A6A6B0B0B0D5D5
          D5F3F3F3EAEAEAEBEBEBE4E4E4D9D9D9E5E5E5E8E8E8EAEAEAF0F0F0F6F6F6FA
          FAFAFFFFFFB5E0B5009600009600009600009600009600009600009600009600
          0096000096000096000096003DAE3DFDFEFDFEFDFEF9F9F9F5F5F5EFEFEFEAEA
          EAE7E7E7E8E8E8E7E7E7E6E6E6E9E9E9EEEEEEF3F3F3BEBEBEB3B3B36C6C6C27
          2828403F405151513F3F3F0F0F0F111111121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121111111010103535354444443737382424
          246B6B6BB6B5B5B4B4B4EEEEEEF0F0F0EAEAEAE7E7E7E6E6E6E7E7E7E8E8E8EA
          EAEAEDEDEDF3F3F3F8F8F8FCFBFCFFFFFF6AC16A009600009600009600009600
          009600009600009600009600009600009600009600009600009600D0EBD0FFFF
          FFFAFAFAF7F7F7F2F2F2EDEDEDEAEAEAE7E7E7E8E8E8E8E8E8E9E9E9EDEDEDFA
          FAFAE6E6E6A9A9A9A3A3A33B3A3B3332324546465253532A2A2A0D0D0D121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212120F0F0F2525
          254544453C3C3C2D2E2E393939A4A4A4A6A6A6D7D7D7FDFDFDEDEDEDE9E9E9E8
          E8E8E7E7E7E7E7E7EBEBEBEDEDEDF1F1F1F6F6F6FAFAFAFFFEFFF0F9F0009600
          0096000096000096000096000096000096000096000096000096000096000096
          000096000096007BC87BFFFFFFFCFBFCF9F9F9F6F6F6F0F0F0EDEDEDEAEAEAE9
          E9E9E8E8E8ECECECFBFBFBD7D7D7CBCBCBC1C1C1A8A8A87B7B7A2A292A3B3B3B
          4A4A4A4C4C4C1B1B1B0F0F0F1212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          121212120F0F0F1A1A1A4241414040403536362727277A7A7AAAAAAAB5B5B5D0
          D0D0CACACAFAFAFAEEEEEEE8E8E8E9E9E9EAEAEAEDEDEDF0F0F0F4F4F4F9F9F9
          FBFBFBFFFFFFAADCAA0096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960023A323F2FAF2FFFEFFFAFAFAF7
          F7F7F3F3F3EEEEEEECECECEAEAEAECECECE9E9E98D8D8D373737A7A7A7F0F0F0
          A3A3A3A4A4A45353532D2D2D4040404D4D4E4343431314141010101212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          121212121212121212121212121010101313133B3B3B4343433A3A3B2A2A2A52
          5251A5A5A59C9C9CE3E3E3C4C4C43C3C3C777777E0E0E0EDEDEDEAEAEAEBEBEB
          EEEEEEF1F1F1F6F6F6FAFAFAFEFDFEFFFFFF0096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600A2D8A2FFFFFFFBFBFBF8F8F8F5F5F5EFEFEFECECECECECECE6E6E65B5B5B
          5E5E5ED1D1D1F8F8F8F8F8F8CBCBCB9796969291913A3A3B3434344343434E4E
          4E3C3D3D12121210101012121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121210101012121237373746
          46463D3D3D30313139393A929292969696BABABAF6F6F6F9F9F9E3E3E3717171
          474747D6D6D6EEEEEEEBEBEBEFEFEFF3F3F3F7F7F7FAFAFAFFFFFFCDEACD0096
          0000960000960000960000960000960000960000960000960000960000960000
          960000960000960000960000960038AB38FAFDFAFEFDFEFAFAFAF6F6F6F1F1F1
          EDEDEDEAEAEAE5E5E5C8C8C8EFEFEFEFEFEFEAEAEAF0F0F0F5F5F5ADADAD9191
          917B7B7B3231323839384444444F4F4F3B3B3B12121210101012121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121210
          10101212123737374949494040403636363030307B7B7B9494949D9D9DEDEDED
          F3F3F3EBEBEBEDEDEDF1F1F1CACACADFDFDFEBEBEBECECECF0F0F0F5F5F5F9F9
          F9FCFCFCFFFFFF64BE6400960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009200ADDDAD
          FFFFFFFAFAFAF6F6F6F1F1F1ECECECE7E7E7E5E5E5E9E9E9E2E2E2E1E1E1E5E5
          E5EAEAEAF2F2F2E8E8E89494948C8C8C6969693131313C3B3B4545454F4F4F3D
          3D3C1314140F0F0F121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212120F0F0F1313133B3B3B4C4C4C434343393939303030686868
          8E8E8E898989DBDBDBF5F5F5EAEAEAE6E6E6E2E2E2E1E1E1E6E6E6E4E4E4E7E7
          E7EBEBEBEFEFEFF5F5F5F9F9F9FFFFFFD6EED600960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          00960000960000960036AB36F9FDF9FDFCFDF7F7F7F1F1F1EBEBEBE6E6E6E2E2
          E2DEDEDEDCDCDCDBDBDBDDDDDDE2E2E2EBEBEBF4F4F4D8D8D88383838585855F
          5F5E3231313C3C3C4646475050504444441B1B1B0D0D0D111111121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212121212121212121111110D0D0D1B1B1B4444444F504F454545
          3C3C3B3131315E5E5E8787877C7C7CC6C6C6F5F5F5ECECECE3E3E3DDDDDDDCDC
          DCDBDBDBDDDDDDE0E0E0E5E5E5EAEAEAF0F0F0F5F5F5FCFAFCFFFFFF61BD6100
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096009CD69CFFFFFFFAF9
          FAF4F4F4ECECECE6E6E6E0E0E0DBDBDBD9D9D9D6D6D6D9D9D9DDDDDDC0C0C0DE
          DEDEF5F5F5CBCBCB7878787B7B7B5A5A5A3535353E3D3E4747485151514E4F4E
          2A2A2A0F0F0F0F0F0F1212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212121212121212121212121212121212120E0E0E0E0E0E2B2B2B
          5151515353534848483D3D3D3535345A5A5A7D7E7E727272B8B8B8F5F5F5E4E4
          E4B7B7B7D8D8D8D9D9D9D6D6D6D7D7D7DADADADEDEDEE4E4E4EAEAEAF1F1F1F7
          F7F7FFFFFFC8E8C8009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          00009600009600E9F6E9FFFDFFF5F5F5EEEEEEE6E6E6E0E0E0D9D9D9D4D4D4D2
          D2D2CFCFCFA0A0A0A9A9A9DADADAE3E3E3F2F2F2C3C3C37070707474745D5C5C
          3837383D3D3D4848485151515858584242421C1C1C0C0C0C0F0F0F1212121212
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212121212121212121212121212121212121212121212120F0F0F
          0C0C0C1C1C1C4546465D5D5D5555554A4A4B3E3E3E3838385C5C5C7676766B6B
          6BAFAFAFF1F1F1E5E5E5DEDEDEB1B1B1999999CACACAD1D1D1D2D2D2D7D7D7DD
          DDDDE4E4E4ECECECF3F3F3FCFAFCFCFDFC009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          00009600009600009600009600009600009600009600FFFFFFF8F7F8F0F0F0E9
          E9E9E1E1E1D8D8D8D1D1D1CECECEC4C4C4B3B3B3CFCFCFCFCFCFD6D6D6E0E0E0
          F0F0F0C4C4C46D6D6D6B6A6A6060603E3E3E3C3C3C4848485150515C5C5C5A5A
          5A3C3C3C1B1B1B0D0D0D0D0D0D11111112121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1111110D0D0D0C0C0C1B1C1C4041416262626363635656564C4C4C3F3E3F4040
          406060616D6D6D666565B0B1B1EFEFEFE2E2E2D7D7D7CFCECECFCFCFB4B4B4BD
          BDBDCCCCCCCECECED6D6D6DEDEDEE6E6E6EEEEEEF6F5F6FFFFFF9AD59A009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600B9E1B9FFFFFFF3F3F3ECECECE3E3E3D9D9D9D0D0D0CACACAC5C5C5C5C5C5
          C0C0C0C2C2C2C8C8C8D0D0D0DCDCDCEEEEEECDCDCD7171715F5F5F6263634848
          483C3C3C4646465151515B5C5B6666666262624848492828281313130C0B0B0C
          0C0C0E0E0E101010111111121212121212121212121212121212121212111111
          1010100E0E0E0B0B0B0B0B0B1313132B2B2B4E4E4E6B6B6B706F706363635757
          584B4A4B3F3F3F4A4949636363616161666666BABABAF0F0F0DFDFDFD1D1D1C9
          C9C9C1C1C1BDBDBDC2C2C2C3C3C3C7C7C7CECECED6D6D6E0E0E0E9E9E9F1F1F1
          FFFCFFDCF0DC0096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600E9F6E9FDFAFDEFEFEFE7E7E7DCDCDC
          D2D2D2C9C9C9C1C1C1BCBCBCB8B8B8B7B7B7BABABAC2C2C2C9C9C9CDCDCDEAEA
          EADBDBDB8484845656565F5F5F5454544243434343434E4E4E59595964646470
          6F707373736666664E4E4E3535352222221515150E0E0E0A0A0A0A0A0A0A0A0A
          0A0A0A0A0A0A0A0A0A0E0E0E1616162323233838385353546F6F6F7E7E7E7B7B
          7B6E6E6E616261555555474747454445555555616161555555747474CDCDCDEC
          ECECD0D0D0C7C7C7C3C3C3B9B9B9B5B5B5B5B5B5B9B9B9BEBEBEC5C5C5CFCFCF
          D9D9D9E4E4E4EDEDEDF8F7F8FCFDFC0096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          FFFEFFF7F5F7ECECECE1E1E1D4D4D4CBCBCBC1C1C1B9B9B9B2B2B2AFAFAFAEAE
          AEB4B4B4919191A7A7A7D3D3D3E0E0E0E7E7E7A6A6A65C5C5C535353595A5A4D
          4D4E4545454949495353535F5F5F6B6A6A767676818081858585828282797979
          6C6C6C5E5E5D5F5F5F6060606161616161616061607171718080808A8A8A8F8F
          8E8B8B8B8181817474746868685C5C5B4E4E4E4848484F4F505B5B5B55555555
          5555949494E1E1E1E5E5E5D4D4D4B2B2B2898989B2B2B2ADADADACACACAFAFAF
          B4B4B4BDBDBDC6C6C6D1D1D1DDDDDDE9E9E9F3F2F3FFFFFF84CB840096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          00960000960000960000960088CC88FFFFFFF1F0F1E7E7E7DADADACDCDCDC2C2
          C2B8B8B8AFAFAFA9A9A9A8A8A88F8F8F838383B1B1B1BABABAC6C6C6D5D5D5E7
          E7E7D5D5D58383834E4E4E4F4F4F5454544E4E4E4A494A4C4D4D565656616061
          6C6C6C7575757F7F7F8787878F8E8F9595949797979999999A9A9A9A9A9A9A99
          9A9595958E8E8E8686867D7D7D7374736869685D5D5D5252524D4D4D50505055
          55555151514B4B4B737373C8C8C8EAEAEAD9D9D9C8C8C8BABABAB3B3B3898989
          848484A5A5A5A6A6A6ABABABB3B3B3BDBDBDCACACAD6D6D6E4E4E4EDEDEDFFFE
          FFB3DFB300960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600009600009600009600009600009600009600009600009600ACDCACFFFD
          FFEEEDEEE2E2E2D4D4D4C6C6C6BBBBBBB0B0B0A7A7A7A1A1A19898989B9B9B9C
          9D9DA3A3A3ADADADBABABAD2D2D28C8C8CBEBEBEC2C2C27474744B4B4B494949
          5050505151514F4F4F4F4F4F5454545B5C5C6464636C6C6C7272727777777B7B
          7B7C7C7D7D7D7D7D7D7D7B7A7B76767670707069686860606058585853535352
          52525353535252524A4A4A484848686868B2B2B2CBCBCB808080CECECEBEBEBE
          AEAEAEA3A3A39B9B9B9999999393939C9C9CA2A2A2ABABABB6B6B6C2C2C2D0D0
          D0DDDDDDE9E9E9FFF9FFD2EAD200960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          00009600009600129812C4E4C4FFFAFFEAEAEADDDDDDCECECEC1C1C1B2B2B2A7
          A7A79E9E9E9898989292928F8F8F919191969696A5A5A5949494313131B9B9B9
          E3E3E3E3E3E3BDBDBD7F7F7F5252524343434646464D4D4D5050505151515353
          535555555858585A5A5A5D5C5D5E5E5E5E5E5E5E5E5E5C5C5C5A5A5A57575755
          55555353535151514F4F4F4949494242424C4C4C747474B2B2B2E0E0E0E4E4E4
          CCCCCC3A3A3A7A7A7AABABAB9696969090908D8D8D8E8E8E949494999999A2A2
          A2ADADADBCBCBCCACACAD9D9D9E6E6E6FCF5FCE1F0E100960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          000096000096000096000096000096000096000096001B9C1BCEE7CEFFF8FFE7
          E7E7D9D9D9CACACABABABAACACACA0A0A09797978F8F8F898989868686888888
          8E8E8E323232666666B3B3B3B8B8B8C8C8C8DBDBDBE5E5E5D0D0D0A1A1A17373
          735252524343434040404343434747474B4B4B4C4C4C4D4D4D4E4E4E4E4E4E4D
          4D4D4C4C4C4B4B4B4848484343434040404141414D4D4D6B6B6B989898C9C9C9
          E4E4E4DFDFDFCCCCCCBBBBBBB4B4B48282822929298787878787878484848787
          878B8B8B9292929B9B9BA7A7A7B5B5B5C5C5C5D4D4D4E2E3E2FAF4FAE7F2E700
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600CEE6CEFFF7FFE5E5E5D6D6D6C7C7C7B6B6B6A7A7A79B9B9B
          9191918888888282828181816B6B6B3737378686868D8D8D979797A5A5A5B3B3
          B3BFBFBFCECECEDFDFDFE2E2E2D2D2D2B5B5B594949477777762626253535350
          50504F4F4F5151515252524F4F4F4F504F5252525E5E5E7272728F8F8FAEAEAE
          CECECEE1E1E1E2E2E2D3D3D3C2C2C2B6B6B6A8A8A89B9B9B8E8E8E8B8B8B4040
          405D5D5D8181817F7F7F8585858D8D8D969696A2A2A2B1B1B1C2C2C2D1D1D1DF
          E0DFF8F1F8E6F1E639AA39009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600C3E1C3FFF6FFE5E4E5
          D6D6D6C6C6C6B4B4B4A5A5A59898988D8D8D8484847D7D7D7777777777777676
          767777777C7C7C858585939393808080979797B6B6B6BFBFBFCBCBCBD7D7D7E2
          E2E2E3E3E3DDDDDDD7D7D7D6D6D6D7D7D7D0D0D0CDCDCDD7D7D7D6D6D6D7D7D7
          DCDCDCE3E3E3E4E4E4DBDBDBCFCFCFC2C2C2B8B8B8A3A3A37F7F7F9595958888
          887F7F7F7878787575757676767676767A7A7A818181898989939393A0A0A0AF
          AFAFC0C0C0D1D1D1DFDFDFFBF2FBDDECDD009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600139813ACD8ACFFF7FFE7E5E7D5D5D5C5C5C5B4B4B4A4A4A49797978B8B
          8B8181817A7A7A7575757070706F6F6F6E6E6E7171717272725E5E5E8383838E
          8E8E979797A0A0A0AAAAAAA8A8A8B2B2B2C1C1C1C6C6C6C8C8C8D4D4D4808080
          676767D2D2D2C8C8C8C7C7C7C3C3C3B7B7B7A6A6A6AEAEAEA4A4A49A9A9A9191
          918989896262627070707474746F6F6F6E6E6E6F6F6F7474747878787E7E7E87
          87879292929F9F9FAFAFAFC0C0C0D1D1D1E0E0E0FDF3FDCBE4CB009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          00960000960000960000960000960000960000960088C988FBF5FBEDE8EDD7D7
          D7C7C7C7B6B6B6A6A6A69898988B8B8B8181817979797272726D6D6D6A6A6A6A
          6A6A6464645E5E5E6F6F6F7171717878787D7D7D878787707070828282979797
          9A9A9A9B9B9BA6A6A65A5A5A424242A5A5A59C9C9C9A9A9A9898988A8A8A6E6E
          6E8888888080807979797373737070706262626262626A6A6A6969696D6D6D71
          71717777777E7E7E878787939393A2A2A2B1B1B1C2C2C2D2D2D2E6E3E6FEF4FE
          AAD6AA0096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          000096005BB65BE5EDE5F8EEF8DCDBDCCCCCCCBBBBBBAAAAAA9C9C9C8F8F8F84
          84847B7B7B7474746E6E6E6A6A6A676767676766646464656565666666686869
          6C6C6C5959596D6D6D7474747676767777777E7E7E4545453434347F7F7F7777
          7777777775757573737358585869696969696967676764646464646467676768
          68686969696D6D6D7272727878788080808B8B8B979797A6A6A6B6B6B6C6C7C6
          D7D7D7F0E9F0F2F0F27AC27A0096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          00009600009600009600009600009600009600009600B5DAB5FBF2FBE7E3E7D2
          D2D2C2C2C2B1B1B1A2A2A29595958A8A8A8080807878787272726D6D6D686868
          6565656464646262626161626060605A5A5A6262626363636262626363636868
          683F3F3F3434346868686363636262626262626262625B5B5B60606061616162
          62626363636565656767676B6B6B7070707676767D7D7D8686869191919E9E9E
          AEAEAEBEBEBECDCDCDE0DEE0F9F0F9CDE3CD3FAB3F0096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600E2EAE2F7EDF7DDDBDDCBCBCBBBBBBBACACAC9F9F9F929292
          8888887F7F7F7878787272726D6D6D6969696666666464646161616060605E5E
          5E5F5F5F5F5F5F5E5E5E5D5D5D5D5D5D5D5D5C5E5E5E5F5F5F5E5E5E5E5E5E5F
          5F5F6161616262626464646666666969696D6D6D7070707676767C7C7C858585
          8E8E8E9B9B9BA9A9A9B8B8B8C6C7C6D7D6D7F1E9F1EDEDED88C7880096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600EEEDEEF1E8F1
          D9D7D9C8C8C8B9B9B9ACACAC9F9F9F9494948A8A8A8282827B7B7B7676767171
          716D6D6D6A6A6A67676765656563636363636362626261616162626262626262
          62626262626363636464646665666767676A6A6A6D6D6D7070707575757B7B7B
          8080808888889292929C9C9CA9A9A9B6B6B6C4C4C4D4D3D4EBE4EBF4EEF4B0D6
          B000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600009600009600A9D3A9EEECEEF0E7F0DAD7DAC9C9C9BCBCBCB0B0B0A5A5
          A59B9B9B9292928A8A8A8383837E7E7E7A7A7A7676767272727070706E6E6E6D
          6D6D6D6D6D4545454141416969696D6D6D6E6E6E707070737273757575797979
          7C7C7C8282828888888F8F8F989898A2A2A2ADADADB9B9B9C5C6C5D5D4D5EBE4
          EBF3ECF3BBDABB00960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          009600009600009600009600009600009600009600009600009600009600E4E8
          E4F3E9F3E3DDE3D0CFD0C3C3C3B8B8B8AFAFAFA6A6A69D9D9D9696969090908C
          8C8C8787878484848181818080807878785757575454546F6F6F818181818181
          8484848787878A8A8A8F8F8F9595959B9B9BA3A3A3ACACACB6B6B6C0C1C0CDCC
          CDDDD9DDF0E7F0EAEAEAAFD5AF00960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960078C178C6DDC6ECE9ECEFE6EFE1DBE1D2D0D2C6
          C6C6BDBDBDB5B5B5AEAEAEA8A8A8A4A4A4A0A0A09D9D9D9B9B9B9393935E5E5E
          5B5B5B8989899C9C9C9C9C9C9F9F9FA3A3A3A9A9A9ADADADB4B4B4BBBBBBC4C4
          C4CFCECFDED9DEEDE4EDEFE9EFD0E0D08AC68A00960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          960084C484C1DBC1E4E7E4EFE7EFEBE2EBE1DBE1D7D3D7CDCBCDC6C6C6C1C0C1
          BDBDBDBABABABABABA8A8A8A858585B9B9B9BABABABDBDBDC1C1C1C6C5C6CCCA
          CCD4D1D4DFD9DFE9E1E9EFE7EFE8E7E8CADECA91C9914CAE4C00960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          96000096000096000096000096000096000096002BA22B5CB55C8EC88EB9D7B9
          D3E0D3E4E6E4ECE7ECEDE6EDEDE4EDEAE1EAE8DFE8EDE4EDEEE5EEE8DFE8E9E0
          E9ECE3ECEDE5EDECE6ECE7E6E7D7E2D7BED9BE97CC9766B96600960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          00960000960000960000960000960000960049AD495DB65D73BE7381C3818CC7
          8C91C99192C9928DC88D84C48477BF7762B8624EAF4E00960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          0000960000960000960000960000960000960000960000960000960000960000
          9600009600009600009600009600009600009600009600009600009600009600
          0096000096000096000096000096000096000096000096000096000096000096
          00009600009600009600}
        HandleImage.Data = {
          BE000000424DBE00000000000000760000002800000009000000090000000100
          0400000000004800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333000
          0000333000333000000033099903300000003099999030000000309999903000
          0000307999903000000033077903300000003330003330000000333333333000
          0000}
        OnChange = vrwhlWindDirecChange
        Anchors = [akTop, akRight]
      end
      object tbFogH: TTrackBar
        Left = 20
        Top = 673
        Width = 489
        Height = 28
        Max = 100
        Min = 1
        Position = 1
        TabOrder = 0
        OnChange = tbFogHChange
      end
      object tbHumidity: TTrackBar
        Left = 18
        Top = 609
        Width = 489
        Height = 28
        Max = 100
        Min = 1
        Position = 1
        TabOrder = 1
        OnChange = tbHumidityChange
      end
      object tbBaroPressure: TTrackBar
        Left = 18
        Top = 549
        Width = 489
        Height = 28
        Max = 5000
        Min = 1
        Frequency = 100
        Position = 1
        TabOrder = 2
        OnChange = tbBaroPressureChange
      end
      object tbTemp: TTrackBar
        Left = 18
        Top = 487
        Width = 489
        Height = 28
        Max = 100
        Min = 1
        Position = 1
        TabOrder = 3
        OnChange = tbTempChange
      end
      object tbSeaSpeed: TTrackBar
        Left = 20
        Top = 225
        Width = 489
        Height = 28
        Max = 50
        Min = 1
        Position = 1
        TabOrder = 4
        OnChange = tbSeaSpeedChange
      end
      object tbWindSpeed: TTrackBar
        Left = 20
        Top = 165
        Width = 489
        Height = 28
        Max = 50
        Min = 1
        Position = 1
        TabOrder = 5
        OnChange = tbWindSpeedChange
      end
      object tbSeaState: TTrackBar
        Left = 20
        Top = 101
        Width = 489
        Height = 28
        Max = 5
        Min = 1
        Position = 1
        TabOrder = 6
        OnChange = tbSeaStateChange
      end
      object AdvSmoothPanel11: TAdvSmoothPanel
        Left = 0
        Top = 0
        Width = 576
        Height = 55
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
        Fill.Color = 7301478
        Fill.ColorTo = 10066329
        Fill.ColorMirror = 10066329
        Fill.ColorMirrorTo = 7301478
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtVertical
        Fill.BorderColor = clSilver
        Fill.BorderWidth = 5
        Fill.Rounding = 10
        Fill.ShadowColor = clNone
        Fill.ShadowOffset = 10
        Fill.Glow = gmNone
        Version = '1.6.0.1'
        Align = alTop
        TabOrder = 7
        TMSStyle = 0
        object Label7: TLabel
          Left = 0
          Top = 0
          Width = 576
          Height = 55
          Align = alClient
          Alignment = taCenter
          Caption = 'Environment'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 94
          ExplicitHeight = 18
        end
      end
      object edtBaroPressure: TEdit
        Left = 513
        Top = 552
        Width = 38
        Height = 21
        Alignment = taCenter
        MaxLength = 4
        NumbersOnly = True
        TabOrder = 8
        OnKeyPress = edtBaroPressureKeyPress
      end
      object edtHumidity: TEdit
        Left = 513
        Top = 612
        Width = 38
        Height = 21
        Alignment = taCenter
        MaxLength = 3
        NumbersOnly = True
        TabOrder = 9
        OnKeyPress = edtHumidityKeyPress
      end
      object edtFogH: TEdit
        Left = 513
        Top = 676
        Width = 38
        Height = 21
        Alignment = taCenter
        MaxLength = 3
        NumbersOnly = True
        TabOrder = 10
        OnKeyPress = edtFogHKeyPress
      end
      object edtTemp: TEdit
        Left = 513
        Top = 490
        Width = 38
        Height = 21
        Alignment = taCenter
        MaxLength = 3
        NumbersOnly = True
        TabOrder = 11
        OnKeyPress = edtTempKeyPress
      end
      object edtSeaSpeed: TEdit
        Left = 513
        Top = 228
        Width = 38
        Height = 21
        Alignment = taCenter
        MaxLength = 2
        NumbersOnly = True
        TabOrder = 12
        OnKeyPress = edtSeaSpeedKeyPress
      end
      object edtWindSpeed: TEdit
        Left = 513
        Top = 168
        Width = 38
        Height = 21
        Alignment = taCenter
        MaxLength = 2
        NumbersOnly = True
        TabOrder = 13
        OnKeyPress = edtWindSpeedKeyPress
      end
      object edtSeaState: TEdit
        Left = 513
        Top = 104
        Width = 38
        Height = 21
        Alignment = taCenter
        MaxLength = 1
        NumbersOnly = True
        TabOrder = 14
        OnKeyPress = edtSeaStateKeyPress
      end
      object edtSeaDirection: TEdit
        Left = 458
        Top = 363
        Width = 47
        Height = 21
        MaxLength = 3
        TabOrder = 15
        Text = '0'
        OnKeyPress = edtSeaDirectionKeyPress
      end
      object edtWindDirec: TEdit
        Left = 226
        Top = 363
        Width = 47
        Height = 21
        MaxLength = 3
        NumbersOnly = True
        TabOrder = 16
        Text = '0'
        OnKeyPress = edtWindDirecKeyPress
      end
    end
  end
  object pnlPlatform: TAdvSmoothPanel
    Left = 576
    Top = 0
    Width = 1350
    Height = 1046
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
    Fill.Color = 7301478
    Fill.ColorTo = 10066329
    Fill.ColorMirror = 10066329
    Fill.ColorMirrorTo = 7301478
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = clSilver
    Fill.BorderWidth = 5
    Fill.Rounding = 10
    Fill.ShadowColor = clNone
    Fill.ShadowOffset = 10
    Fill.Glow = gmNone
    Version = '1.6.0.1'
    Align = alRight
    TabOrder = 1
    TMSStyle = 0
    object Label62: TLabel
      Left = 0
      Top = 55
      Width = 1350
      Height = 991
      Align = alClient
      Alignment = taCenter
      Caption = 'Weapon Editor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 109
      ExplicitHeight = 18
    end
    object TabSelection: TAdvSmoothTabPager
      Left = 0
      Top = 55
      Width = 1350
      Height = 991
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.GradientType = gtVertical
      Fill.GradientMirrorType = gtSolid
      Fill.BorderColor = clNone
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      Transparent = False
      Align = alClient
      ActivePage = tsShipKRI
      Color = 7301478
      TabPosition = tpTopLeft
      TabSettings.LeftMargin = 0
      TabSettings.RightMargin = 0
      TabSettings.StartMargin = 10
      TabSettings.Height = 40
      TabSettings.Spacing = 0
      TabSettings.Width = 442
      TabReorder = False
      OnChange = TabSelectionChange
      TabOrder = 0
      TMSStyle = 0
      object tsShipKRI: TAdvSmoothTabPage
        Left = 1
        Top = 40
        Width = 1348
        Height = 949
        Caption = 'KRI'
        PageAppearance.Color = 7301478
        PageAppearance.ColorTo = clSilver
        PageAppearance.ColorMirror = clSilver
        PageAppearance.ColorMirrorTo = 7301478
        PageAppearance.GradientType = gtVertical
        PageAppearance.GradientMirrorType = gtVertical
        PageAppearance.BorderColor = clNone
        PageAppearance.Rounding = 0
        PageAppearance.ShadowColor = 3355443
        PageAppearance.ShadowOffset = 0
        PageAppearance.Glow = gmNone
        TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Appearance.Font.Color = clWhite
        TabAppearance.Appearance.Font.Height = -13
        TabAppearance.Appearance.Font.Name = 'Tahoma'
        TabAppearance.Appearance.Font.Style = [fsBold]
        TabAppearance.Status.Caption = '0'
        TabAppearance.Status.Appearance.Fill.Color = clRed
        TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
        TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
        TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
        TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
        TabAppearance.Status.Appearance.Fill.BorderColor = clGray
        TabAppearance.Status.Appearance.Fill.Rounding = 0
        TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
        TabAppearance.Status.Appearance.Fill.Glow = gmNone
        TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Status.Appearance.Font.Color = clWhite
        TabAppearance.Status.Appearance.Font.Height = -11
        TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
        TabAppearance.Status.Appearance.Font.Style = []
        TabAppearance.Bevel = False
        TabAppearance.BevelColor = clBlack
        TabAppearance.BevelColorDown = clBlack
        TabAppearance.BevelColorSelected = clBlack
        TabAppearance.BevelColorHot = clBlack
        TabAppearance.BevelColorDisabled = clBlack
        TabAppearance.ColorDown = clBlack
        TabAppearance.ColorSelected = clBlack
        TabAppearance.ColorHot = clSilver
        TabAppearance.ColorDisabled = 7301478
        TMSStyle = 0
        object btnAddWarShip: TAdvSmoothButton
          Left = 393
          Top = 422
          Width = 81
          Height = 50
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -13
          Appearance.Font.Name = 'Tahoma'
          Appearance.Font.Style = [fsBold]
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Tahoma'
          Status.Appearance.Font.Style = []
          BevelColor = clGray
          Caption = '>>'
          Color = clBlack
          ParentFont = False
          TabOrder = 0
          Version = '2.1.3.0'
          TMSStyle = 0
        end
        object btnRemoveWarShip: TAdvSmoothButton
          Left = 393
          Top = 476
          Width = 81
          Height = 50
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -13
          Appearance.Font.Name = 'Tahoma'
          Appearance.Font.Style = [fsBold]
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Tahoma'
          Status.Appearance.Font.Style = []
          BevelColor = clGray
          Caption = '<<'
          Color = clBlack
          ParentFont = False
          TabOrder = 1
          Version = '2.1.3.0'
          TMSStyle = 0
        end
        object btnWeaponList: TAdvSmoothButton
          Left = 393
          Top = 599
          Width = 81
          Height = 50
          Cursor = crHandPoint
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -13
          Appearance.Font.Name = 'Tahoma'
          Appearance.Font.Style = [fsBold]
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Tahoma'
          Status.Appearance.Font.Style = []
          BevelColor = clGray
          Caption = 'Ship Editor'
          Color = clBlack
          ParentFont = False
          TabOrder = 2
          Visible = False
          Version = '2.1.3.0'
          OnClick = btnWeaponListClick
          TMSStyle = 0
        end
        object pnlScenarioList: TAdvSmoothPanel
          Left = 10
          Top = 10
          Width = 375
          Height = 899
          Cursor = crDefault
          ResizeHandleColor = clSilver
          Caption.HTMLFont.Charset = DEFAULT_CHARSET
          Caption.HTMLFont.Color = clWindowText
          Caption.HTMLFont.Height = -11
          Caption.HTMLFont.Name = 'Tahoma'
          Caption.HTMLFont.Style = []
          Caption.Font.Charset = DEFAULT_CHARSET
          Caption.Font.Color = clWindowText
          Caption.Font.Height = -16
          Caption.Font.Name = 'Tahoma'
          Caption.Font.Style = []
          Fill.Color = 7301478
          Fill.ColorTo = 10066329
          Fill.ColorMirror = 10066329
          Fill.ColorMirrorTo = 7301478
          Fill.GradientType = gtVertical
          Fill.GradientMirrorType = gtVertical
          Fill.BorderColor = clSilver
          Fill.BorderWidth = 5
          Fill.Rounding = 10
          Fill.ShadowColor = clNone
          Fill.ShadowOffset = 10
          Fill.Glow = gmNone
          Version = '1.6.0.1'
          TabOrder = 3
          TMSStyle = 4
          object AdvSmoothLabel6: TAdvSmoothLabel
            Left = 17
            Top = 20
            Width = 109
            Height = 20
            AutoSize = True
            Fill.ColorMirror = clNone
            Fill.ColorMirrorTo = clNone
            Fill.GradientType = gtVertical
            Fill.GradientMirrorType = gtSolid
            Fill.BorderColor = clNone
            Fill.Rounding = 0
            Fill.ShadowOffset = 0
            Fill.Glow = gmNone
            Caption.Text = 'Available KRI :'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -13
            Caption.Font.Name = 'Tahoma'
            Caption.Font.Style = [fsBold]
            Caption.ColorStart = clSilver
            Caption.ColorEnd = clWhite
            CaptionShadow.Text = 'Available KRI :'
            CaptionShadow.Font.Charset = DEFAULT_CHARSET
            CaptionShadow.Font.Color = clWindowText
            CaptionShadow.Font.Height = -27
            CaptionShadow.Font.Name = 'Tahoma'
            CaptionShadow.Font.Style = []
            Version = '1.6.1.0'
          end
          object lvWarShipAll: TListView
            Left = 17
            Top = 44
            Width = 341
            Height = 834
            Columns = <
              item
                Caption = 'Ship Name'
                Width = 210
              end
              item
                Alignment = taCenter
                Caption = 'Domain'
                Width = 100
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            GridLines = True
            MultiSelect = True
            ReadOnly = True
            RowSelect = True
            ParentFont = False
            SortType = stBoth
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object AdvSmoothPanel1: TAdvSmoothPanel
          Left = 482
          Top = 10
          Width = 858
          Height = 899
          Cursor = crDefault
          Caption.HTMLFont.Charset = DEFAULT_CHARSET
          Caption.HTMLFont.Color = clWindowText
          Caption.HTMLFont.Height = -11
          Caption.HTMLFont.Name = 'Tahoma'
          Caption.HTMLFont.Style = []
          Caption.Font.Charset = DEFAULT_CHARSET
          Caption.Font.Color = clWindowText
          Caption.Font.Height = -16
          Caption.Font.Name = 'Tahoma'
          Caption.Font.Style = []
          Fill.Color = 7301478
          Fill.ColorTo = 10066329
          Fill.ColorMirror = 10066329
          Fill.ColorMirrorTo = 7301478
          Fill.GradientType = gtVertical
          Fill.GradientMirrorType = gtVertical
          Fill.BorderColor = clSilver
          Fill.BorderWidth = 5
          Fill.Rounding = 10
          Fill.ShadowColor = clNone
          Fill.ShadowOffset = 10
          Fill.Glow = gmNone
          Version = '1.6.0.1'
          TabOrder = 4
          TMSStyle = 4
          object AdvSmoothLabel1: TAdvSmoothLabel
            Left = 18
            Top = 19
            Width = 127
            Height = 20
            AutoSize = True
            Fill.ColorMirror = clNone
            Fill.ColorMirrorTo = clNone
            Fill.GradientType = gtVertical
            Fill.GradientMirrorType = gtSolid
            Fill.BorderColor = clNone
            Fill.Rounding = 0
            Fill.ShadowOffset = 0
            Fill.Glow = gmNone
            Caption.Text = 'KRI on Scenario :'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -13
            Caption.Font.Name = 'Tahoma'
            Caption.Font.Style = [fsBold]
            Caption.ColorStart = clSilver
            Caption.ColorEnd = clWhite
            CaptionShadow.Text = 'KRI on Scenario :'
            CaptionShadow.Font.Charset = DEFAULT_CHARSET
            CaptionShadow.Font.Color = clWindowText
            CaptionShadow.Font.Height = -27
            CaptionShadow.Font.Name = 'Tahoma'
            CaptionShadow.Font.Style = []
            Version = '1.6.1.0'
          end
          object AdvSmoothLabel2: TAdvSmoothLabel
            Left = 18
            Top = 452
            Width = 123
            Height = 20
            AutoSize = True
            Fill.ColorMirror = clNone
            Fill.ColorMirrorTo = clNone
            Fill.GradientType = gtVertical
            Fill.GradientMirrorType = gtSolid
            Fill.BorderColor = clNone
            Fill.Rounding = 0
            Fill.ShadowOffset = 0
            Fill.Glow = gmNone
            Caption.Text = 'Weapon on KRI :'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -13
            Caption.Font.Name = 'Tahoma'
            Caption.Font.Style = [fsBold]
            Caption.ColorStart = clSilver
            Caption.ColorEnd = clWhite
            CaptionShadow.Text = 'Weapon on KRI :'
            CaptionShadow.Font.Charset = DEFAULT_CHARSET
            CaptionShadow.Font.Color = clWindowText
            CaptionShadow.Font.Height = -27
            CaptionShadow.Font.Name = 'Tahoma'
            CaptionShadow.Font.Style = []
            Version = '1.6.1.0'
          end
          object lvWarShipSelect: TListView
            Left = 17
            Top = 44
            Width = 823
            Height = 386
            Columns = <
              item
                Caption = 'Ship Name'
                Width = 200
              end
              item
                Alignment = taCenter
                Caption = 'Domain'
                Width = 100
              end
              item
                Alignment = taCenter
                Caption = 'Longitude'
                Width = 110
              end
              item
                Alignment = taCenter
                Caption = 'Latitude'
                Width = 110
              end
              item
                Alignment = taCenter
                Caption = 'Altitude'
                Width = 90
              end
              item
                Alignment = taCenter
                Caption = 'Heading'
                Width = 90
              end
              item
                Alignment = taCenter
                Caption = 'Speed'
                Width = 90
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            GridLines = True
            MultiSelect = True
            RowSelect = True
            ParentFont = False
            SortType = stBoth
            TabOrder = 0
            ViewStyle = vsReport
          end
          object lvWeaponSelected: TListView
            Left = 18
            Top = 480
            Width = 823
            Height = 398
            Columns = <
              item
                Caption = 'Weapon Name'
                Width = 490
              end
              item
                Alignment = taCenter
                Caption = 'Launcher'
                Width = 150
              end
              item
                Alignment = taCenter
                Caption = 'Enable'
                Width = 150
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            GridLines = True
            RowSelect = True
            ParentFont = False
            TabOrder = 1
            ViewStyle = vsReport
            OnClick = lvWeaponSelectedClick
          end
        end
      end
      object tsShipTarget: TAdvSmoothTabPage
        Left = 1
        Top = 40
        Width = 1348
        Height = 949
        Caption = 'Target'
        PageAppearance.Color = 7301478
        PageAppearance.ColorTo = clSilver
        PageAppearance.ColorMirror = clSilver
        PageAppearance.ColorMirrorTo = 7301478
        PageAppearance.GradientType = gtVertical
        PageAppearance.GradientMirrorType = gtVertical
        PageAppearance.BorderColor = clNone
        PageAppearance.Rounding = 0
        PageAppearance.ShadowColor = 3355443
        PageAppearance.ShadowOffset = 0
        PageAppearance.Glow = gmNone
        TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Appearance.Font.Color = clWhite
        TabAppearance.Appearance.Font.Height = -13
        TabAppearance.Appearance.Font.Name = 'Tahoma'
        TabAppearance.Appearance.Font.Style = [fsBold]
        TabAppearance.Status.Caption = '0'
        TabAppearance.Status.Appearance.Fill.Color = clRed
        TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
        TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
        TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
        TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
        TabAppearance.Status.Appearance.Fill.BorderColor = clGray
        TabAppearance.Status.Appearance.Fill.Rounding = 0
        TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
        TabAppearance.Status.Appearance.Fill.Glow = gmNone
        TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Status.Appearance.Font.Color = clWhite
        TabAppearance.Status.Appearance.Font.Height = -11
        TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
        TabAppearance.Status.Appearance.Font.Style = []
        TabAppearance.Bevel = False
        TabAppearance.BevelColor = clBlack
        TabAppearance.BevelColorDown = clBlack
        TabAppearance.BevelColorSelected = clBlack
        TabAppearance.BevelColorHot = clBlack
        TabAppearance.BevelColorDisabled = clBlack
        TabAppearance.ColorDown = clBlack
        TabAppearance.ColorSelected = clBlack
        TabAppearance.ColorHot = clSilver
        TabAppearance.ColorDisabled = 7301478
        TMSStyle = 0
        object TabTargetShip: TAdvSmoothTabPager
          Left = 1336
          Top = 2
          Width = 10
          Height = 945
          Fill.ColorMirror = clNone
          Fill.ColorMirrorTo = clNone
          Fill.GradientType = gtVertical
          Fill.GradientMirrorType = gtSolid
          Fill.BorderColor = clNone
          Fill.Rounding = 0
          Fill.ShadowOffset = 0
          Fill.Glow = gmNone
          Transparent = False
          Align = alRight
          ActivePage = tsAir
          TabPosition = tpBottomLeft
          TabSettings.LeftMargin = 0
          TabSettings.RightMargin = 0
          TabSettings.StartMargin = 4
          TabSettings.Height = 25
          TabSettings.Spacing = 0
          TabSettings.Width = 200
          TabReorder = False
          Visible = False
          OnChange = TabTargetShipChange
          TabOrder = 0
          TMSStyle = 0
          object tsSurface: TAdvSmoothTabPage
            Left = 1
            Top = 2
            Width = 8
            Height = 918
            Caption = 'Surface'
            PageAppearance.Color = 7301478
            PageAppearance.ColorTo = clSilver
            PageAppearance.ColorMirror = clSilver
            PageAppearance.ColorMirrorTo = 7301478
            PageAppearance.GradientType = gtVertical
            PageAppearance.GradientMirrorType = gtVertical
            PageAppearance.BorderColor = clNone
            PageAppearance.Rounding = 0
            PageAppearance.ShadowOffset = 0
            PageAppearance.Glow = gmNone
            TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
            TabAppearance.Appearance.Font.Color = clWhite
            TabAppearance.Appearance.Font.Height = -11
            TabAppearance.Appearance.Font.Name = 'Tahoma'
            TabAppearance.Appearance.Font.Style = [fsBold]
            TabAppearance.Status.Caption = '0'
            TabAppearance.Status.Appearance.Fill.Color = clRed
            TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
            TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
            TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
            TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
            TabAppearance.Status.Appearance.Fill.BorderColor = clGray
            TabAppearance.Status.Appearance.Fill.Rounding = 0
            TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
            TabAppearance.Status.Appearance.Fill.Glow = gmNone
            TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
            TabAppearance.Status.Appearance.Font.Color = clWhite
            TabAppearance.Status.Appearance.Font.Height = -11
            TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
            TabAppearance.Status.Appearance.Font.Style = []
            TabAppearance.Bevel = False
            TabAppearance.BevelColor = clBlack
            TabAppearance.BevelColorDown = clBlack
            TabAppearance.BevelColorSelected = clBlack
            TabAppearance.BevelColorHot = clBlack
            TabAppearance.BevelColorDisabled = clBlack
            TabAppearance.Color = 7301478
            TabAppearance.ColorDown = clBlack
            TabAppearance.ColorSelected = clBlack
            TabAppearance.ColorHot = clSilver
            TabAppearance.ColorDisabled = 7301478
            TMSStyle = 0
          end
          object tsSubsurface: TAdvSmoothTabPage
            Left = 1
            Top = 2
            Width = 8
            Height = 918
            Caption = 'Subsurface'
            PageAppearance.Color = 7301478
            PageAppearance.ColorTo = clSilver
            PageAppearance.ColorMirror = clSilver
            PageAppearance.ColorMirrorTo = 7301478
            PageAppearance.GradientType = gtVertical
            PageAppearance.GradientMirrorType = gtVertical
            PageAppearance.BorderColor = clNone
            PageAppearance.Rounding = 0
            PageAppearance.ShadowOffset = 0
            PageAppearance.Glow = gmNone
            TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
            TabAppearance.Appearance.Font.Color = clWhite
            TabAppearance.Appearance.Font.Height = -11
            TabAppearance.Appearance.Font.Name = 'Tahoma'
            TabAppearance.Appearance.Font.Style = [fsBold]
            TabAppearance.Status.Caption = '0'
            TabAppearance.Status.Appearance.Fill.Color = clRed
            TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
            TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
            TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
            TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
            TabAppearance.Status.Appearance.Fill.BorderColor = clGray
            TabAppearance.Status.Appearance.Fill.Rounding = 0
            TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
            TabAppearance.Status.Appearance.Fill.Glow = gmNone
            TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
            TabAppearance.Status.Appearance.Font.Color = clWhite
            TabAppearance.Status.Appearance.Font.Height = -11
            TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
            TabAppearance.Status.Appearance.Font.Style = []
            TabAppearance.Bevel = False
            TabAppearance.BevelColor = clBlack
            TabAppearance.BevelColorDown = clBlack
            TabAppearance.BevelColorSelected = clBlack
            TabAppearance.BevelColorHot = clBlack
            TabAppearance.BevelColorDisabled = clBlack
            TabAppearance.Color = 7301478
            TabAppearance.ColorDown = clBlack
            TabAppearance.ColorSelected = clBlack
            TabAppearance.ColorDisabled = 7301478
            TMSStyle = 0
            object btnAddTargetSubsurface: TAdvSmoothButton
              Left = 352
              Top = 316
              Width = 120
              Height = 50
              Cursor = crHandPoint
              Appearance.Font.Charset = DEFAULT_CHARSET
              Appearance.Font.Color = clWhite
              Appearance.Font.Height = -13
              Appearance.Font.Name = 'Tahoma'
              Appearance.Font.Style = [fsBold]
              Status.Caption = '0'
              Status.Appearance.Fill.Color = clRed
              Status.Appearance.Fill.ColorMirror = clNone
              Status.Appearance.Fill.ColorMirrorTo = clNone
              Status.Appearance.Fill.GradientType = gtSolid
              Status.Appearance.Fill.GradientMirrorType = gtSolid
              Status.Appearance.Fill.BorderColor = clGray
              Status.Appearance.Fill.Rounding = 0
              Status.Appearance.Fill.ShadowOffset = 0
              Status.Appearance.Fill.Glow = gmNone
              Status.Appearance.Font.Charset = DEFAULT_CHARSET
              Status.Appearance.Font.Color = clWhite
              Status.Appearance.Font.Height = -11
              Status.Appearance.Font.Name = 'Tahoma'
              Status.Appearance.Font.Style = []
              BevelColor = clGray
              Caption = '>>'
              Color = clBlack
              ParentFont = False
              TabOrder = 0
              Version = '2.1.3.0'
              TMSStyle = 0
            end
            object btnRemoveTargetSubsurface: TAdvSmoothButton
              Left = 352
              Top = 366
              Width = 120
              Height = 50
              Cursor = crHandPoint
              Appearance.Font.Charset = DEFAULT_CHARSET
              Appearance.Font.Color = clWhite
              Appearance.Font.Height = -13
              Appearance.Font.Name = 'Tahoma'
              Appearance.Font.Style = [fsBold]
              Status.Caption = '0'
              Status.Appearance.Fill.Color = clRed
              Status.Appearance.Fill.ColorMirror = clNone
              Status.Appearance.Fill.ColorMirrorTo = clNone
              Status.Appearance.Fill.GradientType = gtSolid
              Status.Appearance.Fill.GradientMirrorType = gtSolid
              Status.Appearance.Fill.BorderColor = clGray
              Status.Appearance.Fill.Rounding = 0
              Status.Appearance.Fill.ShadowOffset = 0
              Status.Appearance.Fill.Glow = gmNone
              Status.Appearance.Font.Charset = DEFAULT_CHARSET
              Status.Appearance.Font.Color = clWhite
              Status.Appearance.Font.Height = -11
              Status.Appearance.Font.Name = 'Tahoma'
              Status.Appearance.Font.Style = []
              BevelColor = clGray
              Caption = '<<'
              Color = clBlack
              ParentFont = False
              TabOrder = 1
              Version = '2.1.3.0'
              TMSStyle = 0
            end
            object AdvSmoothPanel5: TAdvSmoothPanel
              Left = 1
              Top = 1
              Width = 342
              Height = 700
              Cursor = crDefault
              Caption.HTMLFont.Charset = DEFAULT_CHARSET
              Caption.HTMLFont.Color = clWindowText
              Caption.HTMLFont.Height = -11
              Caption.HTMLFont.Name = 'Tahoma'
              Caption.HTMLFont.Style = []
              Caption.Font.Charset = DEFAULT_CHARSET
              Caption.Font.Color = clWindowText
              Caption.Font.Height = -16
              Caption.Font.Name = 'Tahoma'
              Caption.Font.Style = []
              Fill.Color = 7301478
              Fill.ColorTo = 10066329
              Fill.ColorMirror = 10066329
              Fill.ColorMirrorTo = 7301478
              Fill.GradientType = gtVertical
              Fill.GradientMirrorType = gtVertical
              Fill.BorderColor = clSilver
              Fill.BorderWidth = 5
              Fill.Rounding = 10
              Fill.ShadowColor = clNone
              Fill.ShadowOffset = 10
              Fill.Glow = gmNone
              Version = '1.6.0.1'
              TabOrder = 2
              TMSStyle = 4
              object Label2: TLabel
                Left = 17
                Top = 17
                Width = 107
                Height = 18
                Caption = 'Scenario List :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lvTargetSubsurfaceAll: TListView
                Left = 17
                Top = 46
                Width = 306
                Height = 639
                Columns = <
                  item
                    Caption = 'Ship Name'
                    Width = 200
                  end>
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                GridLines = True
                MultiSelect = True
                RowSelect = True
                ParentFont = False
                SortType = stBoth
                TabOrder = 0
                ViewStyle = vsReport
              end
            end
            object AdvSmoothPanel2: TAdvSmoothPanel
              Left = 482
              Top = 1
              Width = 703
              Height = 700
              Cursor = crDefault
              Caption.HTMLFont.Charset = DEFAULT_CHARSET
              Caption.HTMLFont.Color = clWindowText
              Caption.HTMLFont.Height = -11
              Caption.HTMLFont.Name = 'Tahoma'
              Caption.HTMLFont.Style = []
              Caption.Font.Charset = DEFAULT_CHARSET
              Caption.Font.Color = clWindowText
              Caption.Font.Height = -16
              Caption.Font.Name = 'Tahoma'
              Caption.Font.Style = []
              Fill.Color = 7301478
              Fill.ColorTo = 10066329
              Fill.ColorMirror = 10066329
              Fill.ColorMirrorTo = 7301478
              Fill.GradientType = gtVertical
              Fill.GradientMirrorType = gtVertical
              Fill.BorderColor = clSilver
              Fill.BorderWidth = 5
              Fill.Rounding = 10
              Fill.ShadowColor = clNone
              Fill.ShadowOffset = 10
              Fill.Glow = gmNone
              Version = '1.6.0.1'
              TabOrder = 3
              TMSStyle = 4
              object lvTargetSubsurfaceSelect: TListView
                Left = 17
                Top = 17
                Width = 669
                Height = 668
                Columns = <
                  item
                    Caption = 'Ship Name'
                    Width = 200
                  end
                  item
                    Caption = 'X Coord'
                    Width = 100
                  end
                  item
                    Caption = 'Y Coord'
                    Width = 100
                  end
                  item
                    Caption = 'Z Coord'
                    Width = 100
                  end
                  item
                    Caption = 'Heading'
                    Width = 100
                  end
                  item
                    Caption = 'Speed'
                  end>
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                GridLines = True
                MultiSelect = True
                RowSelect = True
                ParentFont = False
                SortType = stBoth
                TabOrder = 0
                ViewStyle = vsReport
              end
            end
          end
          object tsAir: TAdvSmoothTabPage
            Left = 1
            Top = 2
            Width = 8
            Height = 918
            Caption = 'Air'
            PageAppearance.Color = 7301478
            PageAppearance.ColorTo = clSilver
            PageAppearance.ColorMirror = clSilver
            PageAppearance.ColorMirrorTo = 7301478
            PageAppearance.GradientType = gtVertical
            PageAppearance.GradientMirrorType = gtVertical
            PageAppearance.BorderColor = clNone
            PageAppearance.Rounding = 0
            PageAppearance.ShadowOffset = 0
            PageAppearance.Glow = gmNone
            TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
            TabAppearance.Appearance.Font.Color = clWhite
            TabAppearance.Appearance.Font.Height = -11
            TabAppearance.Appearance.Font.Name = 'Tahoma'
            TabAppearance.Appearance.Font.Style = [fsBold]
            TabAppearance.Status.Caption = '0'
            TabAppearance.Status.Appearance.Fill.Color = clRed
            TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
            TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
            TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
            TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
            TabAppearance.Status.Appearance.Fill.BorderColor = clGray
            TabAppearance.Status.Appearance.Fill.Rounding = 0
            TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
            TabAppearance.Status.Appearance.Fill.Glow = gmNone
            TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
            TabAppearance.Status.Appearance.Font.Color = clWhite
            TabAppearance.Status.Appearance.Font.Height = -11
            TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
            TabAppearance.Status.Appearance.Font.Style = []
            TabAppearance.Bevel = False
            TabAppearance.BevelColor = clBlack
            TabAppearance.BevelColorDown = clBlack
            TabAppearance.BevelColorSelected = clBlack
            TabAppearance.BevelColorHot = clBlack
            TabAppearance.BevelColorDisabled = clBlack
            TabAppearance.Color = 7301478
            TabAppearance.ColorDown = clBlack
            TabAppearance.ColorSelected = clBlack
            TabAppearance.ColorHot = clSilver
            TabAppearance.ColorDisabled = 7301478
            TMSStyle = 0
            object btnAddTargetAir: TAdvSmoothButton
              Left = 352
              Top = 315
              Width = 120
              Height = 50
              Cursor = crHandPoint
              Appearance.Font.Charset = DEFAULT_CHARSET
              Appearance.Font.Color = clWhite
              Appearance.Font.Height = -13
              Appearance.Font.Name = 'Tahoma'
              Appearance.Font.Style = [fsBold]
              Status.Caption = '0'
              Status.Appearance.Fill.Color = clRed
              Status.Appearance.Fill.ColorMirror = clNone
              Status.Appearance.Fill.ColorMirrorTo = clNone
              Status.Appearance.Fill.GradientType = gtSolid
              Status.Appearance.Fill.GradientMirrorType = gtSolid
              Status.Appearance.Fill.BorderColor = clGray
              Status.Appearance.Fill.Rounding = 0
              Status.Appearance.Fill.ShadowOffset = 0
              Status.Appearance.Fill.Glow = gmNone
              Status.Appearance.Font.Charset = DEFAULT_CHARSET
              Status.Appearance.Font.Color = clWhite
              Status.Appearance.Font.Height = -11
              Status.Appearance.Font.Name = 'Tahoma'
              Status.Appearance.Font.Style = []
              BevelColor = clGray
              Caption = '>>'
              Color = clBlack
              ParentFont = False
              TabOrder = 0
              Version = '2.1.3.0'
              TMSStyle = 0
            end
            object btnRemoveTargetAir: TAdvSmoothButton
              Left = 352
              Top = 367
              Width = 120
              Height = 50
              Cursor = crHandPoint
              Appearance.Font.Charset = DEFAULT_CHARSET
              Appearance.Font.Color = clWhite
              Appearance.Font.Height = -13
              Appearance.Font.Name = 'Tahoma'
              Appearance.Font.Style = [fsBold]
              Status.Caption = '0'
              Status.Appearance.Fill.Color = clRed
              Status.Appearance.Fill.ColorMirror = clNone
              Status.Appearance.Fill.ColorMirrorTo = clNone
              Status.Appearance.Fill.GradientType = gtSolid
              Status.Appearance.Fill.GradientMirrorType = gtSolid
              Status.Appearance.Fill.BorderColor = clGray
              Status.Appearance.Fill.Rounding = 0
              Status.Appearance.Fill.ShadowOffset = 0
              Status.Appearance.Fill.Glow = gmNone
              Status.Appearance.Font.Charset = DEFAULT_CHARSET
              Status.Appearance.Font.Color = clWhite
              Status.Appearance.Font.Height = -11
              Status.Appearance.Font.Name = 'Tahoma'
              Status.Appearance.Font.Style = []
              BevelColor = clGray
              Caption = '<<'
              Color = clBlack
              ParentFont = False
              TabOrder = 1
              Version = '2.1.3.0'
              TMSStyle = 0
            end
            object AdvSmoothPanel6: TAdvSmoothPanel
              Left = 0
              Top = 1
              Width = 342
              Height = 700
              Cursor = crDefault
              Caption.HTMLFont.Charset = DEFAULT_CHARSET
              Caption.HTMLFont.Color = clWindowText
              Caption.HTMLFont.Height = -11
              Caption.HTMLFont.Name = 'Tahoma'
              Caption.HTMLFont.Style = []
              Caption.Font.Charset = DEFAULT_CHARSET
              Caption.Font.Color = clWindowText
              Caption.Font.Height = -16
              Caption.Font.Name = 'Tahoma'
              Caption.Font.Style = []
              Fill.Color = 7301478
              Fill.ColorTo = 10066329
              Fill.ColorMirror = 10066329
              Fill.ColorMirrorTo = 7301478
              Fill.GradientType = gtVertical
              Fill.GradientMirrorType = gtVertical
              Fill.BorderColor = clSilver
              Fill.BorderWidth = 5
              Fill.Rounding = 10
              Fill.ShadowColor = clNone
              Fill.ShadowOffset = 10
              Fill.Glow = gmNone
              Version = '1.6.0.1'
              TabOrder = 2
              TMSStyle = 4
              object Label3: TLabel
                Left = 17
                Top = 17
                Width = 107
                Height = 18
                Caption = 'Scenario List :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lvTargetAirAll: TListView
                Left = 17
                Top = 46
                Width = 306
                Height = 639
                Columns = <
                  item
                    Caption = 'Ship Name'
                    Width = 200
                  end>
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                GridLines = True
                MultiSelect = True
                RowSelect = True
                ParentFont = False
                SortType = stBoth
                TabOrder = 0
                ViewStyle = vsReport
              end
            end
            object AdvSmoothPanel7: TAdvSmoothPanel
              Left = 482
              Top = 1
              Width = 703
              Height = 700
              Cursor = crDefault
              Caption.HTMLFont.Charset = DEFAULT_CHARSET
              Caption.HTMLFont.Color = clWindowText
              Caption.HTMLFont.Height = -11
              Caption.HTMLFont.Name = 'Tahoma'
              Caption.HTMLFont.Style = []
              Caption.Font.Charset = DEFAULT_CHARSET
              Caption.Font.Color = clWindowText
              Caption.Font.Height = -16
              Caption.Font.Name = 'Tahoma'
              Caption.Font.Style = []
              Fill.Color = 7301478
              Fill.ColorTo = 10066329
              Fill.ColorMirror = 10066329
              Fill.ColorMirrorTo = 7301478
              Fill.GradientType = gtVertical
              Fill.GradientMirrorType = gtVertical
              Fill.BorderColor = clSilver
              Fill.BorderWidth = 5
              Fill.Rounding = 10
              Fill.ShadowColor = clNone
              Fill.ShadowOffset = 10
              Fill.Glow = gmNone
              Version = '1.6.0.1'
              TabOrder = 3
              TMSStyle = 4
              object lvTargetAirSelect: TListView
                Left = 17
                Top = 17
                Width = 669
                Height = 668
                Columns = <
                  item
                    Caption = 'Ship Name'
                    Width = 200
                  end
                  item
                    Caption = 'X Coord'
                    Width = 100
                  end
                  item
                    Caption = 'Y Coord'
                    Width = 100
                  end
                  item
                    Caption = 'Z Coord'
                    Width = 100
                  end
                  item
                    Caption = 'Heading'
                    Width = 90
                  end
                  item
                    Caption = 'Speed'
                  end>
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                GridLines = True
                MultiSelect = True
                RowSelect = True
                ParentFont = False
                SortType = stBoth
                TabOrder = 0
                ViewStyle = vsReport
              end
            end
          end
        end
        object AdvSmoothPanel3: TAdvSmoothPanel
          Left = 10
          Top = 10
          Width = 375
          Height = 899
          Cursor = crDefault
          Caption.HTMLFont.Charset = DEFAULT_CHARSET
          Caption.HTMLFont.Color = clWindowText
          Caption.HTMLFont.Height = -11
          Caption.HTMLFont.Name = 'Tahoma'
          Caption.HTMLFont.Style = []
          Caption.Font.Charset = DEFAULT_CHARSET
          Caption.Font.Color = clWindowText
          Caption.Font.Height = -16
          Caption.Font.Name = 'Tahoma'
          Caption.Font.Style = []
          Fill.Color = 7301478
          Fill.ColorTo = 10066329
          Fill.ColorMirror = 10066329
          Fill.ColorMirrorTo = 7301478
          Fill.GradientType = gtVertical
          Fill.GradientMirrorType = gtVertical
          Fill.BorderColor = clSilver
          Fill.BorderWidth = 5
          Fill.Rounding = 10
          Fill.ShadowColor = clNone
          Fill.ShadowOffset = 10
          Fill.Glow = gmNone
          Version = '1.6.0.1'
          TabOrder = 1
          TMSStyle = 4
          object AdvSmoothLabel11: TAdvSmoothLabel
            Left = 18
            Top = 20
            Width = 113
            Height = 20
            AutoSize = True
            Fill.ColorMirror = clNone
            Fill.ColorMirrorTo = clNone
            Fill.GradientType = gtVertical
            Fill.GradientMirrorType = gtSolid
            Fill.BorderColor = clNone
            Fill.Rounding = 0
            Fill.ShadowOffset = 0
            Fill.Glow = gmNone
            Caption.Text = 'Available Ship :'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -13
            Caption.Font.Name = 'Tahoma'
            Caption.Font.Style = [fsBold]
            Caption.ColorStart = clSilver
            Caption.ColorEnd = clWhite
            CaptionShadow.Text = 'Available Ship :'
            CaptionShadow.Font.Charset = DEFAULT_CHARSET
            CaptionShadow.Font.Color = clWindowText
            CaptionShadow.Font.Height = -27
            CaptionShadow.Font.Name = 'Tahoma'
            CaptionShadow.Font.Style = []
            Version = '1.6.1.0'
          end
          object lvTargetShipAll: TListView
            Left = 18
            Top = 46
            Width = 341
            Height = 834
            Columns = <
              item
                Caption = 'Ship Name'
                Width = 200
              end
              item
                Alignment = taCenter
                Caption = 'Domain'
                Width = 100
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            GridLines = True
            MultiSelect = True
            RowSelect = True
            ParentFont = False
            SortType = stBoth
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object AdvSmoothPanel4: TAdvSmoothPanel
          Left = 482
          Top = 10
          Width = 858
          Height = 899
          Cursor = crDefault
          Caption.HTMLFont.Charset = DEFAULT_CHARSET
          Caption.HTMLFont.Color = clWindowText
          Caption.HTMLFont.Height = -11
          Caption.HTMLFont.Name = 'Tahoma'
          Caption.HTMLFont.Style = []
          Caption.Font.Charset = DEFAULT_CHARSET
          Caption.Font.Color = clWindowText
          Caption.Font.Height = -16
          Caption.Font.Name = 'Tahoma'
          Caption.Font.Style = []
          Fill.Color = 7301478
          Fill.ColorTo = 10066329
          Fill.ColorMirror = 10066329
          Fill.ColorMirrorTo = 7301478
          Fill.GradientType = gtVertical
          Fill.GradientMirrorType = gtVertical
          Fill.BorderColor = clSilver
          Fill.BorderWidth = 5
          Fill.Rounding = 10
          Fill.ShadowColor = clNone
          Fill.ShadowOffset = 10
          Fill.Glow = gmNone
          Version = '1.6.0.1'
          TabOrder = 2
          TMSStyle = 4
          object AdvSmoothLabel9: TAdvSmoothLabel
            Left = 17
            Top = 20
            Width = 131
            Height = 20
            AutoSize = True
            Fill.ColorMirror = clNone
            Fill.ColorMirrorTo = clNone
            Fill.GradientType = gtVertical
            Fill.GradientMirrorType = gtSolid
            Fill.BorderColor = clNone
            Fill.Rounding = 0
            Fill.ShadowOffset = 0
            Fill.Glow = gmNone
            Caption.Text = 'Ship on Scenario :'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -13
            Caption.Font.Name = 'Tahoma'
            Caption.Font.Style = [fsBold]
            Caption.ColorStart = clSilver
            Caption.ColorEnd = clWhite
            CaptionShadow.Text = 'Ship on Scenario :'
            CaptionShadow.Font.Charset = DEFAULT_CHARSET
            CaptionShadow.Font.Color = clWindowText
            CaptionShadow.Font.Height = -27
            CaptionShadow.Font.Name = 'Tahoma'
            CaptionShadow.Font.Style = []
            Version = '1.6.1.0'
          end
          object lvTargetSurfaceSelect: TListView
            Left = 17
            Top = 46
            Width = 823
            Height = 832
            Columns = <
              item
                Caption = 'Ship Name'
                Width = 200
              end
              item
                Alignment = taCenter
                Caption = 'Domain'
                Width = 100
              end
              item
                Alignment = taCenter
                Caption = 'Longitude'
                Width = 110
              end
              item
                Alignment = taCenter
                Caption = 'Latitude'
                Width = 110
              end
              item
                Alignment = taCenter
                Caption = 'Altitude'
                Width = 90
              end
              item
                Alignment = taCenter
                Caption = 'Heading'
                Width = 90
              end
              item
                Alignment = taCenter
                Caption = 'Speed'
                Width = 90
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            GridLines = True
            MultiSelect = True
            RowSelect = True
            ParentFont = False
            SortType = stBoth
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object btnAddTargetSurface: TAdvSmoothButton
          Left = 393
          Top = 422
          Width = 81
          Height = 50
          Cursor = crHandPoint
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -13
          Appearance.Font.Name = 'Tahoma'
          Appearance.Font.Style = [fsBold]
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Tahoma'
          Status.Appearance.Font.Style = []
          BevelColor = clGray
          Caption = '>>'
          Color = clBlack
          ParentFont = False
          TabOrder = 3
          Version = '2.1.3.0'
          TMSStyle = 0
        end
        object btnRemoveTargetSurface: TAdvSmoothButton
          Left = 393
          Top = 476
          Width = 81
          Height = 50
          Cursor = crHandPoint
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -13
          Appearance.Font.Name = 'Tahoma'
          Appearance.Font.Style = [fsBold]
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Tahoma'
          Status.Appearance.Font.Style = []
          BevelColor = clGray
          Caption = '<<'
          Color = clBlack
          ParentFont = False
          TabOrder = 4
          Version = '2.1.3.0'
          TMSStyle = 0
        end
        object btnWeaponListTarget: TAdvSmoothButton
          Left = 395
          Top = 673
          Width = 81
          Height = 50
          Cursor = crHandPoint
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -13
          Appearance.Font.Name = 'Tahoma'
          Appearance.Font.Style = [fsBold]
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Tahoma'
          Status.Appearance.Font.Style = []
          BevelColor = clGray
          Caption = 'Ship Editor'
          Color = clBlack
          ParentFont = False
          TabOrder = 5
          Visible = False
          Version = '2.1.3.0'
          OnClick = btnWeaponListClick
          TMSStyle = 0
        end
      end
      object tsShipGeneral: TAdvSmoothTabPage
        Left = 1
        Top = 40
        Width = 1348
        Height = 949
        Caption = 'General'
        PageAppearance.Color = 7301478
        PageAppearance.ColorTo = clSilver
        PageAppearance.ColorMirror = clSilver
        PageAppearance.ColorMirrorTo = 7301478
        PageAppearance.GradientType = gtVertical
        PageAppearance.GradientMirrorType = gtVertical
        PageAppearance.BorderColor = clNone
        PageAppearance.Rounding = 0
        PageAppearance.ShadowColor = 3355443
        PageAppearance.ShadowOffset = 0
        PageAppearance.Glow = gmNone
        TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Appearance.Font.Color = clWhite
        TabAppearance.Appearance.Font.Height = -13
        TabAppearance.Appearance.Font.Name = 'Tahoma'
        TabAppearance.Appearance.Font.Style = [fsBold]
        TabAppearance.Status.Caption = '0'
        TabAppearance.Status.Appearance.Fill.Color = clRed
        TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
        TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
        TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
        TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
        TabAppearance.Status.Appearance.Fill.BorderColor = clGray
        TabAppearance.Status.Appearance.Fill.Rounding = 0
        TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
        TabAppearance.Status.Appearance.Fill.Glow = gmNone
        TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Status.Appearance.Font.Color = clWhite
        TabAppearance.Status.Appearance.Font.Height = -11
        TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
        TabAppearance.Status.Appearance.Font.Style = []
        TabAppearance.Bevel = False
        TabAppearance.BevelColor = clBlack
        TabAppearance.BevelColorDown = clBlack
        TabAppearance.BevelColorSelected = clBlack
        TabAppearance.BevelColorHot = clBlack
        TabAppearance.BevelColorDisabled = clBlack
        TabAppearance.ColorDown = clBlack
        TabAppearance.ColorSelected = clBlack
        TabAppearance.ColorHot = clSilver
        TabAppearance.ColorDisabled = 7301478
        TMSStyle = 0
        object btnRemoveGnrShip: TAdvSmoothButton
          Left = 393
          Top = 476
          Width = 81
          Height = 50
          Cursor = crHandPoint
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -13
          Appearance.Font.Name = 'Tahoma'
          Appearance.Font.Style = [fsBold]
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Tahoma'
          Status.Appearance.Font.Style = []
          BevelColor = clGray
          Caption = '<<'
          Color = clBlack
          ParentFont = False
          TabOrder = 0
          Version = '2.1.3.0'
          TMSStyle = 0
        end
        object btnAddGnrShip: TAdvSmoothButton
          Left = 393
          Top = 422
          Width = 81
          Height = 50
          Cursor = crHandPoint
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -13
          Appearance.Font.Name = 'Tahoma'
          Appearance.Font.Style = [fsBold]
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Tahoma'
          Status.Appearance.Font.Style = []
          BevelColor = clGray
          Caption = '>>'
          Color = clBlack
          ParentFont = False
          TabOrder = 1
          Version = '2.1.3.0'
          TMSStyle = 0
        end
        object btnWeaponListGeneral: TAdvSmoothButton
          Left = 393
          Top = 543
          Width = 81
          Height = 50
          Cursor = crHandPoint
          Appearance.Font.Charset = DEFAULT_CHARSET
          Appearance.Font.Color = clWhite
          Appearance.Font.Height = -13
          Appearance.Font.Name = 'Tahoma'
          Appearance.Font.Style = [fsBold]
          Status.Caption = '0'
          Status.Appearance.Fill.Color = clRed
          Status.Appearance.Fill.ColorMirror = clNone
          Status.Appearance.Fill.ColorMirrorTo = clNone
          Status.Appearance.Fill.GradientType = gtSolid
          Status.Appearance.Fill.GradientMirrorType = gtSolid
          Status.Appearance.Fill.BorderColor = clGray
          Status.Appearance.Fill.Rounding = 0
          Status.Appearance.Fill.ShadowOffset = 0
          Status.Appearance.Fill.Glow = gmNone
          Status.Appearance.Font.Charset = DEFAULT_CHARSET
          Status.Appearance.Font.Color = clWhite
          Status.Appearance.Font.Height = -11
          Status.Appearance.Font.Name = 'Tahoma'
          Status.Appearance.Font.Style = []
          BevelColor = clGray
          Caption = 'Ship Editor'
          Color = clBlack
          ParentFont = False
          TabOrder = 2
          Visible = False
          Version = '2.1.3.0'
          OnClick = btnWeaponListClick
          TMSStyle = 0
        end
        object AdvSmoothPanel9: TAdvSmoothPanel
          Left = 10
          Top = 10
          Width = 375
          Height = 899
          Cursor = crDefault
          Caption.HTMLFont.Charset = DEFAULT_CHARSET
          Caption.HTMLFont.Color = clWindowText
          Caption.HTMLFont.Height = -11
          Caption.HTMLFont.Name = 'Tahoma'
          Caption.HTMLFont.Style = []
          Caption.Font.Charset = DEFAULT_CHARSET
          Caption.Font.Color = clWindowText
          Caption.Font.Height = -16
          Caption.Font.Name = 'Tahoma'
          Caption.Font.Style = []
          Fill.Color = 7301478
          Fill.ColorTo = 10066329
          Fill.ColorMirror = 10066329
          Fill.ColorMirrorTo = 7301478
          Fill.GradientType = gtVertical
          Fill.GradientMirrorType = gtVertical
          Fill.BorderColor = clSilver
          Fill.BorderWidth = 5
          Fill.Rounding = 10
          Fill.ShadowColor = clNone
          Fill.ShadowOffset = 10
          Fill.Glow = gmNone
          Version = '1.6.0.1'
          TabOrder = 3
          TMSStyle = 4
          object AdvSmoothLabel7: TAdvSmoothLabel
            Left = 17
            Top = 20
            Width = 113
            Height = 20
            AutoSize = True
            Fill.ColorMirror = clNone
            Fill.ColorMirrorTo = clNone
            Fill.GradientType = gtVertical
            Fill.GradientMirrorType = gtSolid
            Fill.BorderColor = clNone
            Fill.Rounding = 0
            Fill.ShadowOffset = 0
            Fill.Glow = gmNone
            Caption.Text = 'Available Ship :'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -13
            Caption.Font.Name = 'Tahoma'
            Caption.Font.Style = [fsBold]
            Caption.Left = 20
            Caption.ColorStart = clSilver
            Caption.ColorEnd = clWhite
            CaptionShadow.Text = 'Available Ship :'
            CaptionShadow.Font.Charset = DEFAULT_CHARSET
            CaptionShadow.Font.Color = clWindowText
            CaptionShadow.Font.Height = -27
            CaptionShadow.Font.Name = 'Tahoma'
            CaptionShadow.Font.Style = []
            Version = '1.6.1.0'
          end
          object lvGeneralShipAll: TListView
            Left = 17
            Top = 46
            Width = 341
            Height = 834
            Columns = <
              item
                Caption = 'Ship Name'
                Width = 210
              end
              item
                Alignment = taCenter
                Caption = 'Domain'
                Width = 100
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            GridLines = True
            MultiSelect = True
            RowSelect = True
            ParentFont = False
            SortType = stBoth
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object AdvSmoothPanel8: TAdvSmoothPanel
          Left = 482
          Top = 10
          Width = 858
          Height = 899
          Cursor = crDefault
          Caption.HTMLFont.Charset = DEFAULT_CHARSET
          Caption.HTMLFont.Color = clWindowText
          Caption.HTMLFont.Height = -11
          Caption.HTMLFont.Name = 'Tahoma'
          Caption.HTMLFont.Style = []
          Caption.Font.Charset = DEFAULT_CHARSET
          Caption.Font.Color = clWindowText
          Caption.Font.Height = -16
          Caption.Font.Name = 'Tahoma'
          Caption.Font.Style = []
          Fill.Color = 7301478
          Fill.ColorTo = 10066329
          Fill.ColorMirror = 10066329
          Fill.ColorMirrorTo = 7301478
          Fill.GradientType = gtVertical
          Fill.GradientMirrorType = gtVertical
          Fill.BorderColor = clSilver
          Fill.BorderWidth = 5
          Fill.Rounding = 10
          Fill.ShadowColor = clNone
          Fill.ShadowOffset = 10
          Fill.Glow = gmNone
          Version = '1.6.0.1'
          TabOrder = 4
          TMSStyle = 4
          object AdvSmoothLabel8: TAdvSmoothLabel
            Left = 18
            Top = 20
            Width = 131
            Height = 20
            AutoSize = True
            Fill.ColorMirror = clNone
            Fill.ColorMirrorTo = clNone
            Fill.GradientType = gtVertical
            Fill.GradientMirrorType = gtSolid
            Fill.BorderColor = clNone
            Fill.Rounding = 0
            Fill.ShadowOffset = 0
            Fill.Glow = gmNone
            Caption.Text = 'Ship on Scenario :'
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clWindowText
            Caption.Font.Height = -13
            Caption.Font.Name = 'Tahoma'
            Caption.Font.Style = [fsBold]
            Caption.ColorStart = clSilver
            Caption.ColorEnd = clWhite
            CaptionShadow.Text = 'Ship on Scenario :'
            CaptionShadow.Font.Charset = DEFAULT_CHARSET
            CaptionShadow.Font.Color = clWindowText
            CaptionShadow.Font.Height = -27
            CaptionShadow.Font.Name = 'Tahoma'
            CaptionShadow.Font.Style = []
            Version = '1.6.1.0'
          end
          object lvGeneralShipSelect: TListView
            Left = 17
            Top = 46
            Width = 823
            Height = 832
            Columns = <
              item
                Caption = 'Ship Name'
                Width = 200
              end
              item
                Alignment = taCenter
                Caption = 'Domain'
                Width = 100
              end
              item
                Alignment = taCenter
                Caption = 'Longitude'
                Width = 110
              end
              item
                Alignment = taCenter
                Caption = 'Latitude'
                Width = 110
              end
              item
                Alignment = taCenter
                Caption = 'Altitude'
                Width = 90
              end
              item
                Alignment = taCenter
                Caption = 'Heading'
                Width = 90
              end
              item
                Alignment = taCenter
                Caption = 'Speed'
                Width = 90
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            GridLines = True
            MultiSelect = True
            RowSelect = True
            ParentFont = False
            SortType = stBoth
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
      end
      object tsMargin: TAdvSmoothTabPage
        Left = 1
        Top = 40
        Width = 1348
        Height = 949
        Caption = ''
        PageAppearance.Color = 7301478
        PageAppearance.ColorTo = clSilver
        PageAppearance.ColorMirror = clSilver
        PageAppearance.ColorMirrorTo = 7301478
        PageAppearance.GradientType = gtVertical
        PageAppearance.GradientMirrorType = gtVertical
        PageAppearance.BorderColor = clNone
        PageAppearance.Rounding = 0
        PageAppearance.ShadowColor = 3355443
        PageAppearance.ShadowOffset = 0
        PageAppearance.Glow = gmNone
        TabVisible = False
        TabEnabled = False
        TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Appearance.Font.Color = clWindowText
        TabAppearance.Appearance.Font.Height = -11
        TabAppearance.Appearance.Font.Name = 'Tahoma'
        TabAppearance.Appearance.Font.Style = []
        TabAppearance.Status.Caption = '0'
        TabAppearance.Status.Appearance.Fill.Color = clRed
        TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
        TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
        TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
        TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
        TabAppearance.Status.Appearance.Fill.BorderColor = clGray
        TabAppearance.Status.Appearance.Fill.Rounding = 8
        TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
        TabAppearance.Status.Appearance.Fill.Glow = gmNone
        TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Status.Appearance.Font.Color = clWhite
        TabAppearance.Status.Appearance.Font.Height = -11
        TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
        TabAppearance.Status.Appearance.Font.Style = []
        TabAppearance.Bevel = False
        TabAppearance.BevelColor = clBlack
        TabAppearance.BevelColorDown = clBlack
        TabAppearance.BevelColorSelected = clBlack
        TabAppearance.BevelColorHot = clBlack
        TabAppearance.BevelColorDisabled = clBlack
        TabAppearance.Color = 7301478
        TabAppearance.ColorDown = 7301478
        TabAppearance.ColorSelected = 7301478
        TabAppearance.ColorHot = 7301478
        TabAppearance.ColorDisabled = 7301478
        TMSStyle = 0
      end
      object tsConsoleRun: TAdvSmoothTabPage
        Left = 1
        Top = 40
        Width = 1348
        Height = 949
        Caption = 'Console'
        PageAppearance.Color = 7301478
        PageAppearance.ColorTo = clSilver
        PageAppearance.ColorMirror = clSilver
        PageAppearance.ColorMirrorTo = 7301478
        PageAppearance.GradientType = gtVertical
        PageAppearance.GradientMirrorType = gtVertical
        PageAppearance.BorderColor = clNone
        PageAppearance.Rounding = 0
        PageAppearance.ShadowColor = 3355443
        PageAppearance.ShadowOffset = 0
        PageAppearance.Glow = gmNone
        TabVisible = False
        TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Appearance.Font.Color = clWhite
        TabAppearance.Appearance.Font.Height = -13
        TabAppearance.Appearance.Font.Name = 'Tahoma'
        TabAppearance.Appearance.Font.Style = [fsBold]
        TabAppearance.Status.Caption = '0'
        TabAppearance.Status.Appearance.Fill.Color = clRed
        TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
        TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
        TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
        TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
        TabAppearance.Status.Appearance.Fill.BorderColor = clGray
        TabAppearance.Status.Appearance.Fill.Rounding = 0
        TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
        TabAppearance.Status.Appearance.Fill.Glow = gmNone
        TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Status.Appearance.Font.Color = clWhite
        TabAppearance.Status.Appearance.Font.Height = -11
        TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
        TabAppearance.Status.Appearance.Font.Style = []
        TabAppearance.Bevel = False
        TabAppearance.BevelColor = clBlack
        TabAppearance.BevelColorDown = clBlack
        TabAppearance.BevelColorSelected = clBlack
        TabAppearance.BevelColorHot = clBlack
        TabAppearance.BevelColorDisabled = clBlack
        TabAppearance.ColorDown = clBlack
        TabAppearance.ColorSelected = clBlack
        TabAppearance.ColorHot = clSilver
        TabAppearance.ColorDisabled = 7301478
        TMSStyle = 0
        object AdvSmoothPanel10: TAdvSmoothPanel
          Left = 2
          Top = 0
          Width = 1185
          Height = 735
          Cursor = crDefault
          Caption.HTMLFont.Charset = DEFAULT_CHARSET
          Caption.HTMLFont.Color = clWindowText
          Caption.HTMLFont.Height = -11
          Caption.HTMLFont.Name = 'Tahoma'
          Caption.HTMLFont.Style = []
          Caption.Font.Charset = DEFAULT_CHARSET
          Caption.Font.Color = clWindowText
          Caption.Font.Height = -16
          Caption.Font.Name = 'Tahoma'
          Caption.Font.Style = []
          Fill.Color = 7301478
          Fill.ColorTo = 10066329
          Fill.ColorMirror = 10066329
          Fill.ColorMirrorTo = 7301478
          Fill.GradientType = gtVertical
          Fill.GradientMirrorType = gtVertical
          Fill.BorderColor = clSilver
          Fill.BorderWidth = 5
          Fill.Rounding = 10
          Fill.ShadowColor = clNone
          Fill.ShadowOffset = 10
          Fill.Glow = gmNone
          Version = '1.6.0.1'
          TabOrder = 0
          TMSStyle = 4
          object Label5: TLabel
            Left = 17
            Top = 17
            Width = 107
            Height = 18
            Caption = 'Scenario List :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lvConsole: TListView
            Left = 17
            Top = 44
            Width = 1148
            Height = 672
            BevelKind = bkFlat
            Color = clWhite
            Columns = <
              item
                Caption = 'ID'
              end
              item
                Caption = 'CUBICLE'
                Width = 150
              end
              item
                Caption = 'CONSOLE'
                Width = 250
              end
              item
                Caption = 'TYPE'
              end
              item
                Caption = 'IP'
                Width = 300
              end
              item
                Caption = 'SHIP'
                Width = 125
              end
              item
                Caption = 'SHIPID'
                Width = 75
              end
              item
                Caption = 'LAUNCHERID'
                Width = 100
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            GridLines = True
            RowSelect = True
            ParentFont = False
            TabOrder = 0
            ViewStyle = vsReport
            OnDblClick = lvConsoleDblClick
            OnMouseDown = lvConsoleMouseDown
          end
        end
      end
    end
    object AdvSmoothPanel12: TAdvSmoothPanel
      Left = 0
      Top = 0
      Width = 1350
      Height = 55
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
      Fill.Color = 7301478
      Fill.ColorTo = 10066329
      Fill.ColorMirror = 10066329
      Fill.ColorMirrorTo = 7301478
      Fill.GradientType = gtVertical
      Fill.GradientMirrorType = gtVertical
      Fill.BorderColor = clSilver
      Fill.BorderWidth = 5
      Fill.Rounding = 10
      Fill.ShadowColor = clNone
      Fill.ShadowOffset = 10
      Fill.Glow = gmNone
      Version = '1.6.0.1'
      Align = alTop
      TabOrder = 1
      TMSStyle = 0
      object Label6: TLabel
        Left = 0
        Top = 0
        Width = 1350
        Height = 55
        Align = alClient
        Alignment = taCenter
        Caption = 'Platform'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 65
        ExplicitHeight = 18
      end
    end
  end
  object pnlMainBottom: TAdvSmoothPanel
    Left = 0
    Top = 1046
    Width = 1926
    Height = 63
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
    Fill.Color = 7301478
    Fill.ColorTo = 10066329
    Fill.ColorMirror = 10066329
    Fill.ColorMirrorTo = 7301478
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = clSilver
    Fill.BorderWidth = 5
    Fill.Rounding = 10
    Fill.ShadowColor = clNone
    Fill.ShadowOffset = 10
    Fill.Glow = gmNone
    Version = '1.6.0.1'
    Align = alBottom
    OnClick = pnlMainBottomClick
    TabOrder = 2
    TMSStyle = 0
    object btnSaveScenario: TAdvSmoothButton
      Left = 1750
      Top = 12
      Width = 150
      Height = 40
      Cursor = crHandPoint
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 0
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      BevelColor = clGray
      Caption = 'Save'
      Color = clBlack
      ParentFont = False
      TabOrder = 0
      Version = '2.1.3.0'
      OnClick = btnSaveScenarioClick
      TMSStyle = 0
    end
    object btnSetPosition: TAdvSmoothButton
      Left = 415
      Top = 8
      Width = 150
      Height = 50
      Cursor = crHandPoint
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 0
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      BevelColor = clGray
      Caption = 'Set Position'
      Color = clBlack
      ParentFont = False
      TabOrder = 1
      Visible = False
      Version = '2.1.3.0'
      OnClick = btnSetPositionClick
      TMSStyle = 0
    end
    object AdvSmoothButton1: TAdvSmoothButton
      Left = 1594
      Top = 12
      Width = 150
      Height = 40
      Cursor = crHandPoint
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 0
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      BevelColor = clGray
      Caption = 'Cancel'
      Color = clBlack
      ParentFont = False
      TabOrder = 2
      Version = '2.1.3.0'
      OnClick = AdvSmoothButton1Click
      TMSStyle = 0
    end
  end
  object pmConsole: TPopupMenu
    Left = 591
    Top = 480
  end
  object pmConsole2: TPopupMenu
    Left = 592
    Top = 528
  end
end
