object frmTorpedoGuidanceWindow: TfrmTorpedoGuidanceWindow
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 97
  ClientWidth = 519
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
    Width = 5179
    Height = 97
    BevelEdges = []
    BevelOuter = bvNone
    TabOrder = 0
    object lbl1: TLabel
      Left = 54
      Top = 2
      Width = 90
      Height = 14
      Caption = 'Torpedo Control'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 199
      Top = 2
      Width = 28
      Height = 14
      Caption = 'Salvo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object rbTorpedo: TRadioButton
      Left = 28
      Top = 3
      Width = 17
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object rbSalvo: TRadioButton
      Left = 173
      Top = 3
      Width = 17
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object AdvTorpedoGuidance: TAdvPageControl
      Left = 16
      Top = 24
      Width = 489
      Height = 73
      ActivePage = AdvTabTorpedoControl
      ActiveFont.Charset = DEFAULT_CHARSET
      ActiveFont.Color = clWhite
      ActiveFont.Height = -12
      ActiveFont.Name = 'Tahoma'
      ActiveFont.Style = []
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      DefaultTabColor = clBlack
      ActiveColor = clBlack
      ActiveColorTo = clBlack
      TabBackGroundColor = clBlack
      TabMargin.RightMargin = 0
      TabOverlap = 0
      Version = '2.0.2.0'
      PersistPagesState.Location = plRegistry
      PersistPagesState.Enabled = False
      TabOrder = 2
      object AdvTabTorpedoControl: TAdvTabSheet
        Caption = 'Torpedo Control'
        Color = clBlack
        ColorTo = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabColor = clBlack
        TabColorTo = clNone
        TextColor = clWhite
        ExplicitLeft = 24
        ExplicitTop = 0
        ExplicitWidth = 100
        ExplicitHeight = 100
        object lblHoming: TLabel
          Left = 171
          Top = 0
          Width = 57
          Height = 14
          Caption = 'Homing ...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblMainGuidance: TLabel
          Left = 6
          Top = 28
          Width = 92
          Height = 14
          Caption = 'Man Guidance ...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblMSIGuidance: TLabel
          Left = 7
          Top = -2
          Width = 74
          Height = 14
          Caption = 'MSI Guidance'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTorpIntGuidance: TLabel
          Left = 6
          Top = 13
          Width = 100
          Height = 14
          Caption = 'Torp Int Guidance'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
      object AdvTabSpecialSettings: TAdvTabSheet
        Caption = 'Special Settings'
        Color = clBlack
        ColorTo = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabColor = clBlack
        TabColorTo = clNone
        TextColor = clWhite
        ExplicitLeft = 24
        ExplicitTop = 0
        ExplicitWidth = 100
        ExplicitHeight = 100
        object lblFuseOff: TLabel
          Left = 172
          Top = 21
          Width = 46
          Height = 14
          Caption = 'Fuse Off'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblFuseOn: TLabel
          Left = 172
          Top = 4
          Width = 45
          Height = 14
          Caption = 'Fuse On'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblSurftoSubmode: TLabel
          Left = 9
          Top = 3
          Width = 98
          Height = 14
          Caption = 'Surf. to Submode'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTosoActImmed: TLabel
          Left = 8
          Top = 18
          Width = 94
          Height = 13
          Caption = 'ToSo Act Immed'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblToSoActOff: TLabel
          Left = 9
          Top = 32
          Width = 73
          Height = 14
          Caption = 'ToSo Act Off'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
end
