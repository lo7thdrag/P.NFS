object frmHomingStatusPlot: TfrmHomingStatusPlot
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 224
  ClientWidth = 587
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
    Width = 649
    Height = 377
    BevelEdges = []
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    object AdvPageHominStatusPlot: TAdvPageControl
      Left = 8
      Top = 8
      Width = 569
      Height = 209
      ActivePage = AdvTabHomingStatus
      ActiveFont.Charset = DEFAULT_CHARSET
      ActiveFont.Color = clLime
      ActiveFont.Height = -13
      ActiveFont.Name = 'Tahoma'
      ActiveFont.Style = []
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -13
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
      TabOrder = 0
      object AdvTabHomingStatus: TAdvTabSheet
        Caption = '    Homing Status   '
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        object Label1: TLabel
          Left = 208
          Top = 6
          Width = 48
          Height = 16
          Caption = 'Torpedo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 336
          Top = 6
          Width = 43
          Height = 16
          Caption = 'Contact'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblToSoHomingPN3D: TLabel
          Left = 2
          Top = 20
          Width = 114
          Height = 16
          Caption = 'ToSo homing PN 3D'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValContact: TLabel
          Left = 416
          Top = 6
          Width = 21
          Height = 16
          Caption = '101'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValTorpedo: TLabel
          Left = 288
          Top = 6
          Width = 7
          Height = 16
          Caption = '1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object pnlToSo: TPanel
          Left = 0
          Top = 40
          Width = 561
          Height = 137
          BevelOuter = bvNone
          TabOrder = 0
          object pbWakeLost: TPaintBox
            Left = 371
            Top = 64
            Width = 57
            Height = 33
            OnPaint = pbWakeLostPaint
          end
          object pbWakeAttack: TPaintBox
            Left = 147
            Top = 22
            Width = 57
            Height = 33
            OnPaint = pbWakeAttackPaint
          end
          object pbTgtLostSub: TPaintBox
            Left = 454
            Top = 1
            Width = 57
            Height = 33
            OnPaint = pbTgtLostSubPaint
          end
          object pbLongRange: TPaintBox
            Left = 8
            Top = 80
            Width = 137
            Height = 39
            OnPaint = pbLongRangePaint
          end
          object lblWakeAttaack: TLabel
            Left = 56
            Top = 5
            Width = 71
            Height = 16
            Caption = 'Wake Attack'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblToSotargetacquiredclose: TLabel
            Left = 2
            Top = 121
            Width = 154
            Height = 16
            Caption = 'ToSo target acquired close'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblTgtLostSub: TLabel
            Left = 368
            Top = 5
            Width = 72
            Height = 16
            Caption = 'Tgt Lost Sub'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblLongRangeAttack: TLabel
            Left = 2
            Top = 58
            Width = 106
            Height = 16
            Caption = 'Long Range Attack'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblCloseInSub: TLabel
            Left = 150
            Top = 102
            Width = 73
            Height = 16
            Caption = 'Close-In Sub'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 438
            Top = 89
            Width = 104
            Height = 16
            Caption = 'Wake Lost/Search'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object AdvTabHomingPlot: TAdvTabSheet
        Caption = '    Horizontal/Vertical ToSo Coverage  '
        Color = clBlack
        ColorTo = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        object pbToSoCoveragePlot: TPaintBox
          Left = 16
          Top = 16
          Width = 521
          Height = 137
          OnPaint = pbToSoCoveragePlotPaint
        end
      end
    end
  end
end
