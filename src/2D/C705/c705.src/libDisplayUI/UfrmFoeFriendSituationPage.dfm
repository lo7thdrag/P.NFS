object frmFoeFriendSituationPage: TfrmFoeFriendSituationPage
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmFoeFriendSituationPage'
  ClientHeight = 1080
  ClientWidth = 1920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label56: TLabel
    Left = 18
    Top = 17
    Width = 107
    Height = 18
    Caption = 'DIRT ATTACK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object advpgcFunctionMenuFoe: TAdvPageControl
    Left = 0
    Top = 0
    Width = 1920
    Height = 1080
    ActivePage = advtsSituation
    ActiveFont.Charset = DEFAULT_CHARSET
    ActiveFont.Color = 10908270
    ActiveFont.Height = -13
    ActiveFont.Name = 'Tahoma'
    ActiveFont.Style = []
    Align = alClient
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    DefaultTabColor = 10790913
    ActiveColor = 12762561
    TabBackGroundColor = clBtnFace
    TabMargin.RightMargin = 0
    TabOverlap = 0
    Version = '2.0.2.0'
    PersistPagesState.Location = plRegistry
    PersistPagesState.Enabled = False
    TabOrder = 0
    OnChange = advpgcFunctionMenuFoeChange
    object advtsSituation: TAdvTabSheet
      Caption = 'Situation'
      Color = clBtnFace
      ColorTo = clNone
      TabColor = 10790913
      TabColorTo = clNone
      object pnlLeft_Situation: TPanel
        Left = 0
        Top = 0
        Width = 952
        Height = 999
        Align = alLeft
        TabOrder = 0
        object pnlMap_Situation: TPanel
          Left = 1
          Top = 1
          Width = 950
          Height = 850
          Align = alTop
          Caption = 'pnlMap_Situation'
          TabOrder = 0
        end
        object pnlArea2_Situation: TPanel
          Left = 1
          Top = 851
          Width = 950
          Height = 147
          Align = alClient
          Caption = 'pnlArea2_Situation'
          TabOrder = 1
        end
      end
      object pnlRight_Situation: TPanel
        Left = 952
        Top = 0
        Width = 960
        Height = 999
        Align = alClient
        TabOrder = 1
        object pnlArea3B_Situation: TPanel
          Left = 1
          Top = 301
          Width = 958
          Height = 300
          Align = alTop
          Caption = 'Area3B'
          TabOrder = 0
        end
        object pnlArea3A_Situation: TPanel
          Left = 1
          Top = 1
          Width = 958
          Height = 300
          Align = alTop
          Caption = 'Area3A'
          TabOrder = 1
        end
        object pnlArea4_Situation: TPanel
          Left = 1
          Top = 601
          Width = 958
          Height = 397
          Align = alClient
          Caption = 'pnlArea4_Situation'
          TabOrder = 2
        end
      end
      object pnlArea5_Situation: TPanel
        Left = 0
        Top = 999
        Width = 1912
        Height = 50
        Align = alBottom
        TabOrder = 2
      end
    end
    object advtsFireDistr: TAdvTabSheet
      Caption = 'Fire Distr.'
      Color = clBtnFace
      ColorTo = clNone
      TabColor = 10790913
      TabColorTo = clNone
      object pnlArea5_FireDist: TPanel
        Left = 0
        Top = 999
        Width = 1912
        Height = 50
        Align = alBottom
        TabOrder = 0
      end
      object pnlLeft_FireDist: TPanel
        Left = 0
        Top = 0
        Width = 956
        Height = 999
        Align = alLeft
        TabOrder = 1
        object pnlArea1_FireDist: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 850
          Align = alTop
          Caption = 'Area1'
          TabOrder = 0
        end
        object pnlArea2_FireDist: TPanel
          Left = 1
          Top = 851
          Width = 954
          Height = 147
          Align = alClient
          Caption = 'Area2'
          TabOrder = 1
        end
      end
      object pnlRight_FireDist: TPanel
        Left = 956
        Top = 0
        Width = 956
        Height = 999
        Align = alClient
        TabOrder = 2
        object pnlArea3B_FireDist: TPanel
          Left = 1
          Top = 301
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3B'
          TabOrder = 0
        end
        object pnlArea3A_FireDist: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3A'
          TabOrder = 1
        end
        object pnlArea4_FireDist: TPanel
          Left = 1
          Top = 601
          Width = 954
          Height = 397
          Align = alClient
          Caption = 'Area4 FireDist'
          TabOrder = 2
        end
      end
    end
    object advtsMInfo: TAdvTabSheet
      Caption = 'M. info.'
      Color = clBtnFace
      ColorTo = clNone
      TabColor = 10790913
      TabColorTo = clNone
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlArea5_MInfo: TPanel
        Left = 0
        Top = 999
        Width = 1912
        Height = 50
        Align = alBottom
        TabOrder = 0
      end
      object pnlLeft_MInfo: TPanel
        Left = 0
        Top = 0
        Width = 956
        Height = 999
        Align = alLeft
        TabOrder = 1
        object pnlArea1_MInfo: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 850
          Align = alTop
          Caption = 'Area1'
          TabOrder = 0
        end
        object pnlArea2_MInfo: TPanel
          Left = 1
          Top = 851
          Width = 954
          Height = 147
          Align = alClient
          Caption = 'Area2'
          TabOrder = 1
        end
      end
      object pnlRight_MInfo: TPanel
        Left = 956
        Top = 0
        Width = 956
        Height = 999
        Align = alClient
        TabOrder = 2
        object pnlArea3B_MInfo: TPanel
          Left = 1
          Top = 301
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3B'
          TabOrder = 0
        end
        object pnlArea3A_MInfo: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3A'
          TabOrder = 1
        end
        object pnlArea4_MInfo: TPanel
          Left = 1
          Top = 601
          Width = 954
          Height = 397
          Align = alClient
          Caption = 'Area4 FireDist'
          TabOrder = 2
        end
      end
    end
    object advtsParSetting: TAdvTabSheet
      Caption = 'Par. Setting'
      Color = clBtnFace
      ColorTo = clNone
      TabColor = 10790913
      TabColorTo = clNone
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlArea5_ParSetting: TPanel
        Left = 0
        Top = 999
        Width = 1912
        Height = 50
        Align = alBottom
        TabOrder = 0
      end
      object pnlLeft_ParSetting: TPanel
        Left = 0
        Top = 0
        Width = 956
        Height = 999
        Align = alLeft
        TabOrder = 1
        object pnlArea1_ParSetting: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 850
          Align = alTop
          Caption = 'Area1'
          TabOrder = 0
        end
        object pnlArea2_ParSetting: TPanel
          Left = 1
          Top = 851
          Width = 954
          Height = 147
          Align = alClient
          Caption = 'Area2'
          TabOrder = 1
        end
      end
      object pnlRight_ParSetting: TPanel
        Left = 956
        Top = 0
        Width = 956
        Height = 999
        Align = alClient
        TabOrder = 2
        object pnlArea3B_ParSetting: TPanel
          Left = 1
          Top = 301
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3B'
          TabOrder = 0
        end
        object pnlArea3A_ParSetting: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3A'
          TabOrder = 1
        end
        object pnlArea4_ParSetting: TPanel
          Left = 1
          Top = 601
          Width = 954
          Height = 397
          Align = alClient
          Caption = 'Area4 FireDist'
          TabOrder = 2
        end
      end
    end
    object advtsChSelect: TAdvTabSheet
      Caption = 'Ch. Select'
      Color = clBtnFace
      ColorTo = clNone
      TabColor = 10790913
      TabColorTo = clNone
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlArea5_ChSelect: TPanel
        Left = 0
        Top = 999
        Width = 1912
        Height = 50
        Align = alBottom
        TabOrder = 0
      end
      object pnlLeft_ChSelect: TPanel
        Left = 0
        Top = 0
        Width = 956
        Height = 999
        Align = alLeft
        TabOrder = 1
        object pnlArea1_ChSelect: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 850
          Align = alTop
          Caption = 'Area1'
          TabOrder = 0
        end
        object pnlArea2_ChSelect: TPanel
          Left = 1
          Top = 851
          Width = 954
          Height = 147
          Align = alClient
          Caption = 'Area2'
          TabOrder = 1
        end
      end
      object pnlRight_ChSelect: TPanel
        Left = 956
        Top = 0
        Width = 956
        Height = 999
        Align = alClient
        TabOrder = 2
        object pnlArea3B_ChSelect: TPanel
          Left = 1
          Top = 301
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3B'
          TabOrder = 0
        end
        object pnlArea3A_ChSelect: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3A'
          TabOrder = 1
        end
        object pnlArea4_ChSelect: TPanel
          Left = 1
          Top = 601
          Width = 954
          Height = 397
          Align = alClient
          Caption = 'Area4 FireDist'
          TabOrder = 2
        end
      end
    end
    object advtsMControl: TAdvTabSheet
      Caption = 'M. Control'
      Color = clBtnFace
      ColorTo = clNone
      TabColor = 10790913
      TabColorTo = clNone
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlArea5_MControl: TPanel
        Left = 0
        Top = 999
        Width = 1912
        Height = 50
        Align = alBottom
        TabOrder = 0
      end
      object pnlLeft_MControl: TPanel
        Left = 0
        Top = 0
        Width = 956
        Height = 999
        Align = alLeft
        TabOrder = 1
        object pnlArea1_MControl: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 850
          Align = alTop
          Caption = 'Area1'
          TabOrder = 0
        end
        object pnlArea2_MControl: TPanel
          Left = 1
          Top = 851
          Width = 954
          Height = 147
          Align = alClient
          Caption = 'Area2'
          TabOrder = 1
        end
      end
      object pnlRight_MControl: TPanel
        Left = 956
        Top = 0
        Width = 956
        Height = 999
        Align = alClient
        TabOrder = 2
        object pnlArea3B_MControl: TPanel
          Left = 1
          Top = 301
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3B'
          TabOrder = 0
        end
        object pnlArea3A_MControl: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3A'
          TabOrder = 1
        end
        object pnlArea4_MControl: TPanel
          Left = 1
          Top = 601
          Width = 954
          Height = 397
          Align = alClient
          Caption = 'Area4 FireDist'
          TabOrder = 2
        end
      end
      object pnlMissileControl: TPanel
        Tag = 5
        Left = 232
        Top = 264
        Width = 489
        Height = 322
        Color = clActiveBorder
        ParentBackground = False
        TabOrder = 3
        Visible = False
        object Bevel2: TBevel
          Left = 20
          Top = 236
          Width = 445
          Height = 9
          Shape = bsBottomLine
        end
        object Label51: TLabel
          Left = 25
          Top = 261
          Width = 257
          Height = 18
          Caption = 'For select,Press [Up] or [down]'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label53: TLabel
          Left = 25
          Top = 293
          Width = 281
          Height = 18
          Caption = '[Enter] for confirm,[Esc] for return'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object pnlMCtrlHeader: TPanel
          Tag = 60
          Left = 1
          Top = 1
          Width = 487
          Height = 41
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = 'Missile Control'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
        end
        object pnlPowerOnContentMCtrl: TPanel
          Left = 152
          Top = 68
          Width = 313
          Height = 162
          BevelOuter = bvNone
          TabOrder = 1
          object Label58: TLabel
            Left = 191
            Top = 12
            Width = 33
            Height = 18
            Caption = '1~2'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Panel19: TPanel
            Left = 10
            Top = 5
            Width = 175
            Height = 32
            Color = clBlue
            ParentBackground = False
            TabOrder = 0
          end
        end
        object pnlPowerOnMCtrl: TPanel
          Tag = 61
          Left = 20
          Top = 69
          Width = 122
          Height = 35
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = 'Power On'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11754291
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
        end
        object pnlReCheckMCtrl: TPanel
          Tag = 62
          Left = 20
          Top = 110
          Width = 122
          Height = 35
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = 'ReCheck'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object pnlINSAlignMCtrl: TPanel
          Tag = 63
          Left = 20
          Top = 152
          Width = 122
          Height = 35
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = 'INS Align.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 4
        end
        object pnlPowerOffMCtrl: TPanel
          Tag = 64
          Left = 20
          Top = 194
          Width = 122
          Height = 35
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = 'PowerOff'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 5
        end
        object pnlReCheckContentMCtrl: TPanel
          Left = 152
          Top = 68
          Width = 313
          Height = 162
          BevelOuter = bvNone
          TabOrder = 6
          object Label61: TLabel
            Left = 191
            Top = 12
            Width = 66
            Height = 18
            Caption = 'Recheck'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlINSAlignContentMCtrl: TPanel
          Left = 152
          Top = 68
          Width = 313
          Height = 162
          BevelOuter = bvNone
          TabOrder = 7
          object Label63: TLabel
            Left = 191
            Top = 12
            Width = 82
            Height = 18
            Caption = 'INS Align.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlPowerOffContentMCtrl: TPanel
          Left = 152
          Top = 68
          Width = 313
          Height = 162
          BevelOuter = bvNone
          TabOrder = 8
          object Label67: TLabel
            Left = 191
            Top = 12
            Width = 74
            Height = 18
            Caption = 'PowerOff'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
    end
    object advtsMMonitor: TAdvTabSheet
      Caption = 'M. Monitor'
      Color = clBtnFace
      ColorTo = clNone
      TabColor = 10790913
      TabColorTo = clNone
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlArea5_MMonitor: TPanel
        Left = 0
        Top = 999
        Width = 1912
        Height = 50
        Align = alBottom
        TabOrder = 0
      end
      object pnlLeft_MMonitor: TPanel
        Left = 0
        Top = 0
        Width = 956
        Height = 999
        Align = alLeft
        TabOrder = 1
        object pnlArea1_MMonitor: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 850
          Align = alTop
          Caption = 'Area1'
          TabOrder = 0
        end
        object pnlArea2_MMonitor: TPanel
          Left = 1
          Top = 851
          Width = 954
          Height = 147
          Align = alClient
          Caption = 'Area2'
          TabOrder = 1
        end
      end
      object pnlRight_MMonitor: TPanel
        Left = 956
        Top = 0
        Width = 956
        Height = 999
        Align = alClient
        TabOrder = 2
        object pnlArea3B_MMonitor: TPanel
          Left = 1
          Top = 301
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3B'
          TabOrder = 0
        end
        object pnlArea3A_MMonitor: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3A'
          TabOrder = 1
        end
        object pnlArea4_MMonitor: TPanel
          Left = 1
          Top = 601
          Width = 954
          Height = 397
          Align = alClient
          Caption = 'Area4 FireDist'
          TabOrder = 2
        end
      end
    end
    object advtsINSTest: TAdvTabSheet
      Caption = 'INS Test'
      Color = clBtnFace
      ColorTo = clNone
      TabColor = 10790913
      TabColorTo = clNone
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlArea5_InsTest: TPanel
        Left = 0
        Top = 999
        Width = 1912
        Height = 50
        Align = alBottom
        TabOrder = 0
      end
      object pnlLeft_InsTest: TPanel
        Left = 0
        Top = 0
        Width = 956
        Height = 999
        Align = alLeft
        TabOrder = 1
        object pnlArea1_InsTest: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 850
          Align = alTop
          Caption = 'Area1'
          TabOrder = 0
          object pnlInsTestTab: TPanel
            Tag = 5
            Left = 232
            Top = 279
            Width = 489
            Height = 292
            Color = clActiveBorder
            ParentBackground = False
            TabOrder = 0
            object Bevel1: TBevel
              Left = 20
              Top = 186
              Width = 445
              Height = 9
              Shape = bsBottomLine
            end
            object Label36: TLabel
              Left = 25
              Top = 211
              Width = 185
              Height = 18
              Caption = 'For cancel, Press [Esc]'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label39: TLabel
              Left = 25
              Top = 243
              Width = 210
              Height = 18
              Caption = 'For confirm, Press [Enter]'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label43: TLabel
              Left = 25
              Top = 75
              Width = 125
              Height = 18
              Caption = 'Are you sure of'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label45: TLabel
              Left = 25
              Top = 143
              Width = 297
              Height = 18
              Caption = 'Note: Booster should be safe state!'
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label47: TLabel
              Left = 25
              Top = 109
              Width = 310
              Height = 18
              Caption = 'entering into inertial navigation test?'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Panel2: TPanel
              Left = 1
              Top = 1
              Width = 487
              Height = 41
              Align = alTop
              Alignment = taLeftJustify
              BevelOuter = bvLowered
              Caption = 'INS Test'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clLime
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
            end
          end
        end
        object pnlArea2_InsTest: TPanel
          Left = 1
          Top = 851
          Width = 954
          Height = 147
          Align = alClient
          Caption = 'Area2'
          TabOrder = 1
        end
      end
      object pnlRight_InsTest: TPanel
        Left = 956
        Top = 0
        Width = 956
        Height = 999
        Align = alClient
        TabOrder = 2
        object pnlArea3B_InsTest: TPanel
          Left = 1
          Top = 301
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3B'
          TabOrder = 0
        end
        object pnlArea3A_InsTest: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3A'
          TabOrder = 1
        end
        object pnlArea4_InsTest: TPanel
          Left = 1
          Top = 601
          Width = 954
          Height = 397
          Align = alClient
          Caption = 'Area4 FireDist'
          TabOrder = 2
        end
      end
    end
    object advtsLaunchData: TAdvTabSheet
      Caption = 'Launch Data'
      Color = clBtnFace
      ColorTo = clNone
      TabColor = 10790913
      TabColorTo = clNone
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlArea5_LaunchData: TPanel
        Left = 0
        Top = 999
        Width = 1912
        Height = 50
        Align = alBottom
        TabOrder = 0
      end
      object pnlLeft_LaunhData: TPanel
        Left = 0
        Top = 0
        Width = 956
        Height = 999
        Align = alLeft
        TabOrder = 1
        object pnlArea1_LaunchData: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 850
          Align = alTop
          Caption = 'Area1'
          TabOrder = 0
        end
        object pnlArea2_LaunchData: TPanel
          Left = 1
          Top = 851
          Width = 954
          Height = 147
          Align = alClient
          Caption = 'Area2'
          TabOrder = 1
        end
      end
      object pnlRight_LaunchData: TPanel
        Left = 956
        Top = 0
        Width = 956
        Height = 999
        Align = alClient
        TabOrder = 2
        object pnlArea3B_LaunchData: TPanel
          Left = 1
          Top = 301
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3B'
          TabOrder = 0
        end
        object pnlArea3A_LaunchData: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3A'
          TabOrder = 1
        end
        object pnlArea4_LaunchData: TPanel
          Left = 1
          Top = 601
          Width = 954
          Height = 397
          Align = alClient
          Caption = 'Area4 FireDist'
          TabOrder = 2
        end
      end
    end
    object advtsExit: TAdvTabSheet
      Caption = 'Exit'
      Color = clBtnFace
      ColorTo = clNone
      TabColor = 10790913
      TabColorTo = clNone
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlArea5_Exit: TPanel
        Left = 0
        Top = 999
        Width = 1912
        Height = 50
        Align = alBottom
        TabOrder = 0
      end
      object pnlLeft_Exit: TPanel
        Left = 0
        Top = 0
        Width = 956
        Height = 999
        Align = alLeft
        TabOrder = 1
        object pnlArea1_Exit: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 850
          Align = alTop
          Caption = 'Area1'
          TabOrder = 0
        end
        object pnlArea2_Exit: TPanel
          Left = 1
          Top = 851
          Width = 954
          Height = 147
          Align = alClient
          Caption = 'Area2'
          TabOrder = 1
        end
      end
      object pnlRight_Exit: TPanel
        Left = 956
        Top = 0
        Width = 956
        Height = 999
        Align = alClient
        TabOrder = 2
        object pnlArea3B_Exit: TPanel
          Left = 1
          Top = 301
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3B'
          TabOrder = 0
        end
        object pnlArea3A_Exit: TPanel
          Left = 1
          Top = 1
          Width = 954
          Height = 300
          Align = alTop
          Caption = 'Area3A'
          TabOrder = 1
        end
        object pnlArea4_Exit: TPanel
          Left = 1
          Top = 601
          Width = 954
          Height = 397
          Align = alClient
          Caption = 'Area4 FireDist'
          TabOrder = 2
        end
      end
      object pnlExitTab: TPanel
        Tag = 5
        Left = 232
        Top = 279
        Width = 489
        Height = 292
        Color = clActiveBorder
        ParentBackground = False
        TabOrder = 3
        object Bevel3: TBevel
          Left = 20
          Top = 186
          Width = 445
          Height = 9
          Shape = bsBottomLine
        end
        object Label15: TLabel
          Left = 25
          Top = 211
          Width = 185
          Height = 18
          Caption = 'For cancel, Press [Esc]'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 25
          Top = 243
          Width = 210
          Height = 18
          Caption = 'For confirm, Press [Enter]'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 25
          Top = 75
          Width = 207
          Height = 18
          Caption = 'Return to the start page.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 25
          Top = 143
          Width = 112
          Height = 18
          Caption = 'Are you sure?'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 25
          Top = 109
          Width = 272
          Height = 18
          Caption = 'The missiles will be powered off!'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object pnlHeaderSE: TPanel
          Left = 1
          Top = 1
          Width = 487
          Height = 41
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = 'Exit'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
  object pnlArea3A: TPanel
    Left = 928
    Top = 57
    Width = 952
    Height = 300
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object vrlInitState: TVrLights
      Left = 13
      Top = 100
      Width = 25
      Height = 17
      LedState = [lsGreen]
      LedsVisible = [lsGreen]
      Transparent = True
    end
    object lblInitState3A: TLabel
      Left = 44
      Top = 100
      Width = 73
      Height = 16
      Caption = 'INIT. State'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblInsGnss3A: TLabel
      Left = 44
      Top = 122
      Width = 65
      Height = 16
      Caption = 'INS/GNSS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblMNormal3A: TLabel
      Left = 44
      Top = 144
      Width = 65
      Height = 16
      Caption = 'M. Normal'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblCalFinished3A: TLabel
      Left = 44
      Top = 166
      Width = 83
      Height = 16
      Caption = 'Cal. Finished'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblNavigate3A: TLabel
      Left = 44
      Top = 189
      Width = 58
      Height = 16
      Caption = 'Navigate'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblIgnition3A: TLabel
      Left = 44
      Top = 210
      Width = 49
      Height = 16
      Caption = 'Ignition'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblTakeOff3A: TLabel
      Left = 212
      Top = 210
      Width = 55
      Height = 16
      Caption = 'Take Off'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblParaSetting3A: TLabel
      Left = 212
      Top = 189
      Width = 82
      Height = 16
      Caption = 'Para Setting'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblInsideSector3A: TLabel
      Left = 212
      Top = 166
      Width = 88
      Height = 16
      Caption = 'Inside Sector'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblSeaTgt3A: TLabel
      Left = 212
      Top = 144
      Width = 52
      Height = 16
      Caption = 'Sea Tgt'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblEngine3A: TLabel
      Left = 212
      Top = 122
      Width = 43
      Height = 16
      Caption = 'Engine'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblPowerOn3A: TLabel
      Left = 212
      Top = 100
      Width = 63
      Height = 16
      Caption = 'Power On'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblInitChk3A: TLabel
      Left = 364
      Top = 100
      Width = 62
      Height = 16
      Caption = 'INIT. CHK'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblWarmup3A: TLabel
      Left = 364
      Top = 122
      Width = 59
      Height = 16
      Caption = 'Warm-up'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblLandTgt3A: TLabel
      Left = 364
      Top = 144
      Width = 58
      Height = 16
      Caption = 'Land Tgt'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblFullOpen3A: TLabel
      Left = 364
      Top = 166
      Width = 61
      Height = 16
      Caption = 'Full Open'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblParaLocking3A: TLabel
      Left = 364
      Top = 189
      Width = 84
      Height = 16
      Caption = 'Para. locking'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblBusSupply3A: TLabel
      Left = 524
      Top = 100
      Width = 72
      Height = 16
      Caption = 'Bus Supply'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblPlcChk3A: TLabel
      Left = 524
      Top = 122
      Width = 55
      Height = 16
      Caption = 'PLC CHK'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblInsAlign3A: TLabel
      Left = 668
      Top = 122
      Width = 59
      Height = 16
      Caption = 'INS Align'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblSeeker3A: TLabel
      Left = 668
      Top = 100
      Width = 45
      Height = 16
      Caption = 'Seeker'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblBoosterArm3A: TLabel
      Left = 524
      Top = 166
      Width = 80
      Height = 16
      Caption = 'Booster Arm'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblBatteryAct3A: TLabel
      Left = 524
      Top = 188
      Width = 77
      Height = 16
      Caption = 'Battery Act'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblLnchRdy3A: TLabel
      Left = 668
      Top = 166
      Width = 65
      Height = 16
      Caption = 'LNCH RDY'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblPwrSwitch3A: TLabel
      Left = 668
      Top = 188
      Width = 79
      Height = 16
      Caption = 'PWR Switch'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object pnl3ATop: TPanel
      Left = 1
      Top = 1
      Width = 950
      Height = 80
      Align = alTop
      TabOrder = 0
      object Image1: TImage
        Left = 1
        Top = 1
        Width = 600
        Height = 78
        Align = alLeft
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000001780000
          003F0806000000EAB7D3C6000000017352474200AECE1CE90000000467414D41
          0000B18F0BFC6105000000097048597300000EC300000EC301C76FA86400004E
          594944415478DAEDBD09AC65C7791EF8D739777BFBD2FB46F64E510B29939222
          D98A644B54120792A52856C6E365627B2447B63563C931663088E360B6004910
          200E32C0188E034F26C80C60CFC4482C04C86AD3962C25A4284A22CD555CBA9B
          DDAFFBEDEFDE77D7732AFF527F9D3AE76E6F69B29BE2ABC6EBBB9F53EB57FFFF
          FD4B99344D2DFE0195388EE1A01C94377BB1FBFCBDB9D30D382807E5361563B1
          244902F8C0006FCCC1F41E55A89FA88FF471D87B07E5CE95373BC0D33CF27539
          984F07658F85709D01FE4E57E4CD5448DBD1451702BC3E860BF26071DE99F266
          0778D5A8B92E85B976500ECA4ECB01C0EFB10C92D4F5BD411BC04179634B8A33
          DA8EE8FA51A362E0CE037C5874791ECCA583B29B42E0CE8CCC01C0BF3185BA99
          FEA2281AFA39958385BCBF42BDB86F80BFC34B62D81C3898230765A785A5779C
          2707007F9B4B919BA7A2FC3C49F7830CD9079CEBED2B36F8DB4BB95B01FE608E
          1C94DD1666130E007EF745A5F1B090644E1DDAEBF5BCB15AE91A0575DA555582
          57D0D752DC14DEAA6527E035B28F0C81BB1909F0A33EA3BBDF8DBE64C3EC3C07
          657079ABF711CD13C2A20380DF4351693C93D023047101F876BB0DA55289813C
          C10E8E10DCE935955EAFCBDFA512D1041CC0D5BFD58763BF004FD40CD9284751
          34A3BA38C2DF95EE701FA43AAF8AF5DE451FBDD5CB5BBD8F688D743A9D0380DF
          4B495302F824274DA9D44E201EC7255E8C490F2578C4F3127E46BFE992744F12
          BC91DF11D833CEF315E87F0BB76734ACBFDEE8C7D7A3ECAF013B0778DD202D84
          7048FC3BF5B5EF58ABD7D5DF66CFB39B064FADFCDDD1E2EA1319D716C07904FD
          DE5941F3B467F28DD9D11CB8DB1EB51DFBECC23B8EEF77B602CA32DC5680B7C1
          135B183B7DCACDD6156473BF72A332AE63ECC88F782104F71EC5C79ABEE7D937
          07758BB5292489F0E8DA81DD6E176AB52ABF4F3B66A53A01098A90E592807C9A
          6027C76CEC80763761B03791E5A60A278F808FD7EDE2C6502E952136E30882F1
          C385DB0F08D1908C794CC75E6B37A5D887BBADBE35E0814C86CF16E03BBB4482
          C0D7B3B2494651CC9F536B080F7BD8BC56B3E3633B5255570135AD928BF5D08D
          20B7A9CAC431B67F030C3DA3C62E199DDFFC93C85D29CA6D32D6778475BB8E75
          EF533BA45E69DA83F9994928C7621730EC3E69DD1C31D26191DE27F5E3EE3783
          3D62EC7E01C1DAEC5A619BC33A8D07E0FD58520086CDEDDBB58598719FDA68F0
          B782A129BE4D358E20BFD5EDB5A8F0F9BA017C5A04782F54595F7B630B836886
          744AEE1EC3AB6B14E083DD240DEE10FEB278A7EC79E23AA8BFC308E0E99B4CBF
          243D069766B309D3D393400BABDBED40A95C856E4A8B5078E05E8F3C670C2FD2
          9EAB578F9F24083C0954CB655E98AD7613AA950A94A134BA077622E1420A3B5F
          D1B7AF0444D388CA8DA6573231C03A80CF46506B8C3D0A097EB98793CC12D891
          FD83401D37D0EDED166C6E6D431DFFC8E641F458B7DBC3FE6DF30DE2A8040A8E
          A94D055469A3A07FB42022FA8E2C379DB3F2B9E51AD1DD7B785DFD906BCBF336
          5B9E699406DD10F1C602EEFAB2DCF4FB000ACC96E69DCDDA47D58C6C17CE9F3D
          050B333598C0095436DA3B71D66101C0A76EDCA37D5A116E07C073F74405401D
          F0FEE85AECB526BAD90D2F666C0DC6092AA33EC731B76E9E010C049AA2E615EC
          89EEEFF66800B797A251C1BC28C14300F026FBF26053D83E005EA59AE05221C0
          8725CABE92DF99CC20A92E2FD1ABE447D22151321B1B6B2CB9576B35041A6C55
          14F3EF637C8C6270D22230ADC3CB97340020E91D972ADE2FB1B2A950DF947971
          0E76A5DCC900D87020DEF062C74AF1766CDD14B1B2456ADCF427E8A27148581A
          2EE1A7117F83F6CBAD460F56D6366165650301BE25438948522A97589A128926
          E271E8A188AFD7926155BA4C36EF28CE001EF83B34715390FD3D0468FA4DFF6B
          6B9CE6E1EE4BBFB3C13C8AB1EE743DED11056829296E20D8B2083727E8C285F3
          A7E0D0DC244C5523284762BBC900DCF82E93AD30752F0DEC7D0EDD4D65BF003F
          062B469471F09A8E1462A26C135602D6038D19B006F25713801F2FECEEA4DC7E
          0EDEEDD261DDACDBBE05E0F583FE1D76275519C9D1F2820CE448933D86F280DF
          256D01E0F5CD5C5DA2A175235AE6E5975F86FFFB9FFE5358BA79136A13533037
          BF808F930C1804F8D353D34CDDACADAF336DF3918F7C041E78F09DC0B8C3FD84
          CBD2F6A0644AC1CEBDD781BDD3000F60C6DC9BFB7114F5EA8CD079C95D1FA56F
          125C403DEB7A2B12805F5D6DC32B576EC0DA460BA2F23418E7B924B78B783C74
          084B71597CE553EB256AB1890C9F9B22C9EBFC33324F6C301F5D5BF8B5711299
          5B0B729FECB57855B9803807F4D96568DBA24DA1835F6EC2A57327607EB6829A
          1E0A0628089068209494EBA7E0FE4AED64D0FEC66B71FB2FA6F0B89762212FC1
          07025B384E236A3078030837F3517D6A5808246D5040281B630BD9EBACA47D35
          90F1DDFF26FDBA48F0F9396303803762391AA23EBD9E001F562BC0F1BC41CDAD
          5D27C3076F82486F9071FC548D6E3781C71FFB067CE10B5F80E79E7F1EA5C50A
          94AB35A855ABD0ED74B1A9314C4F23C0773B2859AEC02402FF17BFF44BF0739F
          FB6F6161611AB69B1DA8D5CA22F5D194244A212AEFCB03E0CE03FCE8FBEB5C18
          FA6BA3CCBB2344ACCD0CD1569C18692848E761BE1D5F10FBB2BADA846BD79661
          AB9542A9360FC4715814D7899EA1FE2C95CABC7910D892F13BD3CC80DF8F4CC8
          91CBE71EF49D6062DCF789FAE1DA0E1A27AE7FEA387567044E8DA35F84C2D16B
          C90D53677A923E89A865BD0ECE05DCA8A009F7DF770F1C592CC14445C13FF1D4
          8F5034BA210A2D6AF82E6C8D8050B318FEF8FACD159557556ADD19EDA002CEFE
          C02D1424AC725F10407068842F3C1A330AE07766284E88FE33B4292BB067B27B
          3F95690B7793797EF7017C58EF602167EE84E000346B50D19D8D3B60448DC62B
          568399E0E27D8603BC2900BCFB7D6ABC14275298BCFFD863DF86CF7DEE73082E
          D7D8D84AD224F3BE08DE040455047B32A6D6EB75A6687EF0C31F82FFE57FFD9F
          E1A187DEC91B445C123E9F40C5103DC0D2E4700E351A33E6775A1E1BCB6C8EE5
          E0B30DD6D820270BCB3491F0EEF8AF1C1BE8E0C76B6B292CAF346073B309CD56
          025DA842124D42371137B156AB8D809ED95548758EA28CE9144AA6C45275E43C
          9B4240E0F96A059CBCC1D77BB10CE05809864D0299C5D2FD19950B4D61134E85
          C337524702F038E982ED35713EB4E08177DC03478FC63051A639D8C36FF420F6
          00E8FEFC9C555ABE3756937ABD4B661ECFEAE12C1D3BF8F5FEC12D9C66B266AD
          7FCE7266340649F649D1B345C4A4BEB55141723739ED290D5EEBDCBC4B01DE6A
          2FE6DEB4793EDE73DD197D2295D1C6EFB939437F3DC86A1DD87B9DF695190906
          017CD89C92C3E0AF7DED49F8FCE73F0F376FDE649068B55B50216369A9E2395D
          7A6CB73BB0B5B5017373B3F00B3FFFF3F0333FFB53B8700F31C8B7DADBF89B32
          542BE28D33AA07D8EB6667A37087CA181BCA8E00DE493A0EE0795E38EED9DB37
          B11BEA0D0BD76F3460E9D61A349B5D7CAF0A1D5B85CD660ACD760F7ADDAE0BF8
          48D88B862E479BA771DE2DFC7F44310C65DC94631784669CADA4080C45DB4CD8
          CF797AC7E6243A35886A801B5D8B9E27F21DA35494E3CFB192157674C239514E
          E0E1872FC23DA76B3051231B4E9737008F4D36169E9F0402AFADD26694EC0BE0
          6F87794F7A2B0D12A719B11F780A6E143F5E82DB05F0D9631EE0C769C9FB1254
          E8BFC866CC7A20C96BC9037EDE8E93CD9BBB0CE06DF02C2789DB4C224A5D83AD
          E3304380F76685025F167A3E5ADBF751F068860F5CC12E907540F822FB7D1FC0
          FBFB1A36D491044FEF3DFA875F835FFAA52FC1CACA2AFF2A49BA7C0D0279026B
          029789890928972B2865AE417D6B0BCE9D3B0BBFFAAB7F033EFDE94FB2418F24
          F8981F49A22F8F9C5CE3E99BFD781FDC8E32C68660ED80710BD860323A2B6799
          CA3878A321021943230AB29B5B5DB8B5BC05ABEBDB2CB977BA16BA1D0BF5A685
          D5CD366CA3E44E46EE5A6D827703F270622DC019C043F066DD208ABC574C92A6
          BE257E5EF8DE2D500D814FBAEF7FE3B901D0056B6DC88CC762B4B50AECEAA105
          4CAF189B804D9A08EA29BCF77DF7C3F973933051A57A7504BC8D93F8BCA7469C
          D92E8C989E339F9F9D33F1B7C76F231B6309064C03A939F21BAC075CDA906CA1
          1E6C8F8A07E2C08E1AA0C67151BFDCCB4C9A63C18B22CDADBBB79A544C8607A2
          B5159A0579065EE7850DDA2D6DC2EF440E8FBC8340163363BC0D60D43ABD4B8C
          AC36405CED12F20AA1A6958C7A11A49074D98D04058E48DCA4545A8E32EF0252
          9B8C159F71553B75F073E901C89BC03A6E94BACE58CF8DABE765EAEECBB407FD
          19F79E0627B9EB46FEFE728F585FBB3793B4E72471F90DAD7D3672B98DE90FFE
          C357E08B5FFCEBB0B1BE89604DEE7B1D896A4D64C1923F760D019E9B8A156C77
          DA70FDFA35F8F11FFFAFE16FFDAD5F83B3E7CE30A5636D1737804D98999A72D2
          AA61039A513AC12F9471839EEC7A51DFDEC7311333677C179F7301F66C734D9C
          44ABFEE8FE9A3471C80BA66D6065B50E3797D7502B6AC356BD0BDBDB6D68B57A
          28B923D02722E9F33C63CF1994E2BB3DAE61C49E4DB1AB46983602B29604734B
          EB2C92E70018EC7B295E52C2C107BE5AA16D28350EE02193E06DE03184CF4B2C
          40D4E1077EE04138750A017E82E66D1BE75517E7A8FA38C7909A183237CCC8AD
          053F83872CDA7E500BC16DDFB8E2C054D794751BA6A6E9A0B5A11B1AAF4F75AF
          0BA82F6B3330B46A83C9C8EC818FBE2D20E30E560212D52FB3DBE940BBD96480
          263B5905FF685C933411D0A54E778677AA9749036129BC7E2473956C66296A86
          842B14DF1251C47A24F7EDA45D6E43C9CD3789A171B8C8F3235C08D9DC539BD3
          ED88D4BAADB9686CEE4F76C66EBBC31D46D26CDA15DDDAC425E76F9C0D182D68
          AA0C3B1705D2521A523B2AF9996C347D1FF05B0698BA2E0036F7150D9A971A0C
          03B1BEA64E27898D0980D8B0AACE5E0FF45EEC6669E059A311A84CA59004FFE8
          57E1177FF1BF878DB50DBE2EF1AFE572EC37825EA7EB001C988FA7FADC5ABE09
          8B0B73F0855FFC79F8855FF8799C6865C69A6EA7296E7DD47F142D6B536D9AA3
          2980FB6FFC48DCC9620A8FC5EA51DF26CE771C9F274E9135D25F347E0C79B6C7
          DF255AC6B8CD953EB028B55A5381FAC6365C5F5A811594E2AFDF584189BEC1BE
          F01D94E223835A50E48CD7DC8FC08FE036EA12F5A191CDC86FA06E4EA5692004
          040822734D5EA77EE1F7238D65AF2895F2953729784478BF79375E9EB397714E
          710328570828EAF0918FBE1F8E1D9FC635846B09DA78C51EB74B24789CAB641C
          F6F732D9F547EEC47634C0ABA7C15E4BE8136DAD13EC64DD804BF1A1DE3FB29E
          DC3DF591BB26C94BE45130A75405D3E7C57BB3B6E76C13B4D3C7B2A636D7D6E0
          E6D212AFABC5C54330BFB000E55A4DBEC3D81409C0D3DA2F971D98151C421C5D
          A83ABE75EDE14D2A918045FA456572C26154E4848C54AECBDA43CCF33E71021B
          D9E1F2D71FBE7C765A941ABBAD144DAF97F2C0893C61596AA7B95B9A28C9A0F5
          209BE76A270A19859CAE1E3C16E6AFB4A0F01DE56F9C070494DC24EFE182EC76
          6547A61DBAA413882CA546ACDD6E41ABF18DC080D5E018820A92974B4F0694A3
          27710220F87CFDAB5F85CF7DEEF3B0B9B1C513244160A2C7C8692FC619D8AAE5
          0A4F898DD555989B9B41097405DEF79E87E0377EE3FF84E3C78FA2D4D9854976
          95100F0C9618150798778F0B0D1F543C0ADEAE21DD657152F6C8195ADC0074CC
          746186ED4C83EFBAEF333D1E4363AB09D75EBB0537AEAFC0AB576F40BDDEC43E
          2B897B6AA9E6D6A195F883C4BA096FFC386712BB937E492AB6020A9109C066B7
          000F2234F8A02D6B20AF6E1BAE67CE0F9EBD6EB2714D92885F974B1D78E4631F
          84E327E7F0574D7CAFC360401BA498B1A28C7E0093093014234073D48A674DDF
          2398A1D8CF350C28D5BD14BF4112C052BFF3B410A935E58862272D0FBA07CD85
          C8B82E1BA552D8DC43DF6B4759F14073705B0A9BCBCBF0EAABAFB2C47EFCD871
          3874F83062D3B4FB5192754262F3C0EE23DE20A3DFF41E5EC3B67E6E081380F7
          8CD9328EF893F2772397938A8CFE3446D651781277515822FB04F8D725D9984C
          7CBC78D71915B0F2CBD7AEC3D52B5770BE1AB6FEA7B8C3895B9A44208293E445
          2B7156F6D4F9B12A25C1802A2D4E839DDBD336A9709891539D6800C9E0196387
          A67C1C61CAEAD8DCE2221C3A7A48A460929475DDB98541966FE326172D78D62D
          1078E991403BE3F25CFDF1377FF41FFE107EE6673FCB8356C35D7B1BA570AA23
          DD9B5C25CB38C89D0E81778D27FBD6C63A546B15DEC1E392859FFBDCCFC15FFA
          4B9F64EE7E6666125AAD3AF3FB1CE14A1B10FEB6837DD64B64239AA8D6C49366
          A8F4A59CDF1B4FD1388242B8476BFAEB67C47D8C7D849D049792011437CED4B5
          8F2427556975B38ADC9827B8F02AA5324CD6A6A08D738C3C67EA8D26ACAD37D8
          D0383539235E484EE54E5D2A09EA7F35B252142ABD07058369E6076F3C8557A4
          C33C85948EDA64332CF0FCB80DDD110DF4F1AF26DBCC52FEAC84F524157F9BBD
          AD0E1D99462D3001F2F49CA855D9B6203F332E623CE3F1390AD69459BA1F5ABF
          B1AE58A9EC397B9E0B19ED2A5AA8F1634A9E4D1B1B1BD0DC6EF246DAAF49A4B2
          D94656991EAFC179E1364BE0E467BC6AE9FA0E4BCD34D7705E95704E116DBAB5
          B9891ADF0AD33633D3B3303D83FD4AB6329C8324BC91061E47592A0B03BACEAC
          50C291338E3A5A4969604A9B41D7AF4D4DC22C5EB73A3129E92470AD72A5C88B
          CB38CC81C809904E137742C5202F101BF0F6BB2D9A0C7124C08FC3FEBE9BABA6
          89EBC7B63B70FDD56BF0F5AF7C055E7AF64528E38E56A51D8C17B2DBA2388A33
          A3754AE4D1E07C953D476734DF882C125E5C6A4409783E963A5C04222D669280
          29EF48E224081AE44B972FC1877FE887205A9805A8E1F5DA780D92EEAB381895
          58F84B5E934EAA22B7B4B42393AE24BC6A8A1334A281A24584D7FEC37FFF07F0
          B9BFF679F6ADAE12C0B75BD0C3DF55506267802F5711B45B084A134CD59001ED
          D6CD1B70E4D061585DBD05172F5E805FFEE52FC2E1C38BD0666F1A5CC493159C
          80D31C282542BC505E34D1AD333C86D44D06A0D6531F77CA033AB56628C0AB00
          A463CAE3C986E82E2F44920FD8C85C72166C06F8C49DE0917A9B4CCC2A376DDE
          24155599D2A048E2A9A959D41A7BD0C531889CBB235370C493A6727D96A7239D
          3769663C8F4472A7B9C9F49B2938F4150CADA3E12D72B49303D234F2D7E0DF17
          3708A39EFD3272A54A9501BED9DC80C5433350C5F959AE1AC407C3C9EA482301
          DFC7168C6A3A6C958E40F2618E485730CA44A2C2BB15897F189533F251376F1E
          D394C782E94B1C0BF2266B34EAD0A675E4A8A48CA131CEF98284B220D6A0A862
          78E9469EEAFAB0BA2840EC66F413B2BD10ED5AC6F54FC9FEC8B3AA8C8B6C828C
          EFAC950BAD428533BF4691CB31D5933AB92EE5EC13B1D8C6783B4E1216165ADB
          DBB059AFC376A3C1824AC9D058E1FAC5B938333B0F8B8B4738F891E26364DFA4
          CDAE820223D1B2B11BABC0C6A466A0D43A3C327B02796A03A551190BF03B11F0
          D9D381F8A61E56B0D9E59D2A6DB6E0DFFDDE97E14FFEE8AB70F6C469989D9C42
          E04FB16389F3125E34E51DDEC1BB312E4D9271D279A69E33C0C7C66771D489E8
          ADD83A01388F880B9231A288F698EB12434BB3DB667AE5ECE50B70E2EC3D70E8
          D021985D580098AD3A40C1419D2C0BA810074CA31A256E91767072B4A083605D
          C709BABABACE93E7B1C79F80FFFD7FFBDBAC7295514A5FDE5C6330218067830A
          3E92D452C3454B340D0D657D6B1DA6262650F25C81F9F959F8CB3FFA69F8B1BF
          F25F41BBB585932F65FEB55216834D645D6A30B65B440E845C3C5C41FDE60DC8
          EFDC7B5C9CFB79A421E0242A716E0186B41B67E14C2D2F786F0873E0CD234612
          54249BA96100EE0AC0BB0BD01C21ED88C715A5F8B85C6301091C3D43605E7686
          75A31C70086091CDCDEBFE9CFC067CFE98605D797F891DB8D7A5CA437A23ABBE
          360A4F10A62690FB04EE84CE16D169D771ECDB4033A04C02089D37D025439D78
          CD182724119D189944D226D03D6D898DAFA3D6F5B012059ACB5EE600785B5768
          B78AC4B6C5296CBB12F3A1EEAA39ED1D3C05625CBF2850E78CAD1E77C049F621
          C0D374E90A7B828240E2809A364612F6E891C09E050B04649A2FCCE24412E8C6
          865397A40E6CA16D2C04086E256453A4AEA6780BDC34DA880BED6E87853E5A83
          8D7A03C7AFCB6355A94EA2E0568589A969387CE4042C1E3E8AAF27A08C9A6884
          02204BF7CA59931DC86D6012C7160D3D1E745C1949D1141740F16BA93374E8FB
          34314A3DAC685338B4F5ABAFC1EFFDF3DF816BAF5C85BFF09147E0E8024AA8F5
          264C5427DCEF64C213701B7551B3621403AB54087880F081266E47F546C760E0
          854F97E021A1E3139E2A04F01D448197AFBC0ADFFECE5310D7509B98998163A7
          4EC0D94B17E1ECC5F3B078E238C00C0D2A0E52C98A0044927CD2C1C1AB43B3B1
          8E80BCCAFEEE344124C9D80C7CE31BDF84BFF377FE1EDCBCB10E5D9A8CE59479
          DF122518C3EFA53D2B298471C6D570672F73504D046B6B784DEC2B727F7BE0C1
          F3F00F7FFD1FC0E9D347B11B5A0C6A64F8A1F69004911ACBD6781B297D35DCBD
          2B7291A043F9D7E0B198F1F3763C5AF2ECB0D1400DC32A270BE0362B90445E4E
          F3A07E49C45190A56CF128E9895F24380ACE01508F54E3840CD7939C782CB525
          06E52E6EE27485C8493E1AB4E42362BD6752DED0E399BF54F9F9C192D34E1656
          06AE7A9F7E5FF8EC8201D0BBFA905449EB2232245DB6B97F4A9512D359C4181A
          53CE3623D22E0DF1DAB4CBF54069213B32ABFD18CDDC6D447B9D23D6A94AE491
          963AFA53B2A88AB1317591C0BE33FC1A97471652120578993726CD34407569D5
          81F3E61447B71206D0464E20CDF61010236887010F5840600F392BEE8BEC5965
          24F91C03379632E71201CF1414D79B08A9D29624150F19A6A35CD7763B6DC688
          56B3879B1A25BBEB40B385CF110F2A139370F1D2DB503B3B067328E1D3066035
          329983F9AC6C8051BC678067CD75D4A1DB4529478C8559FE72B6023B7E9BD4F2
          325668FDEA12D8CD0E6C6F6CC1938F3F0ECF3FF51CCC4D4EC37BDEFD109C3E76
          4C9C05529900A9B35687AE92C666717EDE52ED5415E115B24009E9782B03EF7A
          3D05F1C421E990542CEAFC6AADCA2A531B25871B3797E02504F946AB09ED143B
          BD87EA62731B6A939370E1BECB70FE5D97E0D4851330B13805661A358E5E13D6
          6F5D851B4B5761637315B69B5B2C191CA3B660FD160F1D86C71F7B027EF3377E
          13EAF5364CCFCFC3ECE17937517ABC6B93F195A81A91E2499A6FF16F29C2F2E8
          91A3A8E26DC1C99387E197BFF425387BEE141BD2C0B6FD225163954995632D88
          31851259D52B772176F7A9C07B2D347AB1D471C8891B9979CF6DD96940C5B191
          5A681EF26862899469329938E4D564D578275F4409A82673842354714113E5A6
          DC65E40C8F8519CEE48D518C30D95C771C76160C15563C247D4703649A6B7BE8
          21116B27E837F3CFF55664EFE173058C70C391D611E776A982D574D23BDF8700
          ACC7DE35BC1972DB583A19394E234731F452D94B11558E01DD4A963D11E2A2C8
          4BDCBE3F53E714605C1718A7618513D2CF4F130C4506F0F97BBB6BC56E7E91BD
          851D2C6483640F2E02CEE00E99DBB4EE346E0DA5C1F594DFD37A501A6AC2BFC4
          D17FB8792805C4C09A48BDBA08EE1D0ABA43BC6C6E77E1D6CA1AFEADE265CA70
          F6EC453877F13E98471C29556A58C78ACC47DC9C9384EA10FB7326F24D1C0FF0
          238DACD649D2CA7F3120A33ABC8A955BBA7E1D36D737E1DC997BE10859A123D9
          794CA50C8FFEDE97E1B5E75E8208BFBF726B996989A358F9B7DF773F1CC79D8A
          091837C8C645DFA56CA470278067A3EC3BB31870546442B34ABBF723E7969448
          8E0F433949507522356A79F9166C6C6D31E7468341296437373661AB519714B0
          9311CC9C9E877B2F9F8323A78EA0C0D5856667036EAD5F874A2D82F9C559FC9B
          87E99929E6814905DCAEB760F5D62A0B9971C9C0D4DC0CD78DA102EBD1C6FBF6
          BAC2F3A99A2F1B6602139335E821E093B470F430EDE434A01632AF9280E6500F
          A152A93858904368AFEEEF9185B7A30D883B2B66F4676EC1D8344C28E6E65A6E
          113B555F557E031930689F389AC77A1557AF35C0F54CAC716EB19ADCFB5E5888
          0ABFCDB5A9C0370D2936E781D17FADCCC85934B4BAA726762E75C59C3C91A8F3
          5EDDD0B1B4791E5F6D5C7B1E3D5B7CA3D0C03117E0CFD578E8C62F07480178E7
          E04785BB21D537F9AF8D1800A77958AFE9FBB4AEBEEF0656DA33251ED4951F0A
          9785092A6283C7546C0E16A5F484D26620B8F7507227A1832597440465A2876E
          2C2DC395D76E400FC7F0F4B98B70F1FEB753920A983B7A1CB18428CC491E6B3D
          0A54CF36D8F55886009F29ADB2F822EBFC84C9CE85AACB4BCF7F179E78FC09B8
          F6CA35E836DB70E2C871B8E7E469B87CF1222CCCCDC3B34F3C09EB4B4BB0BEBA
          8AAA490B66676739C7F97D172EC189D3F70AF79688CB10FBA692FB5F4F5C0FD9
          B006D6A96F83479079F5A13924DCC8384305716B862DE22815B65A3C3E6BB8E9
          34EA7581360730B411B4519A6E6E3760A35B8755BB051BED3A74936D38727A11
          1E78EFDB61F6C8144CCED750B58A38D77705B582887659DC98CA11196BA64066
          00F1A57A9046384B4337B9B26B5FCFFDE9F32E4B17291FEB97829EF6E401D944
          0E7CF3406D7DB63AF77E1C05C0978E79B403706B7F003F96C20843FAD3205A30
          FC5D684CEB675DC72C70557587D56388AA12520C437FB7934D5337ADB053F39B
          AA1A9873FC87D1CF959E345E2028FE5EED5632DF0BDA9A1F83119D340E20D36E
          1F28EFEA58C9311B8CF1EE85232A382821D5A0DB9AC13FD79965067D3FD00606
          DF24715E7C810DD2473D1B4F196737CB122A3A2905AB5F617AD6220E01D13E84
          418D26E31D696475140C97D736601985E5EB2BEB9094AA70E4C40978FB43EF83
          C5A3A7708C8986ABFAC385740C385E689C1754D85C0578DE807C95455A248067
          369530B793C2D2B5D7E05B8F7F139266171A5831830DB87EE51A54A332CC4DCF
          C203EF783B9C3A7E1C9EFECE53700BA56592E0299AF51202FCC98B9764472443
          845371C4AAE1242A52BFA32152653896A32697893C70257C9F48A20AD9206260
          FDD62DD85ADFE09393D8CB22F0E02023665AC18E8716DCDCBC09F5D63A1C3E39
          0FEF7CCFFD30B5580398C0FAC51DD8EE6DB3E134712E58868EE820D58AE39329
          B998643164CDC4F1001CDC15957852B0BB1EC8E93C14946F1CA86AEC00770B19
          767D7E112779E822E7EF87273299FC6B2F7D16807FC77E34FB50CD77F87B2FE1
          F68DA571D51AC3118FDB44523F5B765F7B650EFA7E9E6D0C66D7005F781C496C
          8735F7811020632CAF85D51A76FFF1FD333E0F8BCDBD2A546A28FD36E84A437A
          1972127391C3F7F37CAF45BDB48697E19B94D44D0F71F1477104D5CD34E5A02D
          1EE4C58E434D886C942DCF6613928D0D6853405EB7C79E349216AE04DFFAD367
          E089EF3C83C07E0C8E9F390B1F7AE487219E3C8C1050EB1B2FF6108CA21D837C
          1FC06BB3D9BD8904428278AA603785AD9BCBF0F2332F40B7DE467047504495A3
          DB6843D2EE4163630B2EBEED129C397B2F3CFFCC33F0F24B2F336F3C3D310997
          51FD583C7E82F2EB6AAC7F3E4040CCD8A0BE9F43C6DD099CE37299C412914641
          4991CBD141BB27DE7715379D2DAC276915E4EF2AA9637B7C3FF65AA9C690981E
          349306B4D36D9839320DA7DF76063FC4EF94B1EE355C5C952C5F79CAEE5C315E
          ABCC8B9EFA2CE63C22091B7052B666D22653E620070D7E1223692400AFDB2A57
          BE871B538BBD7722C705B2A4E08C8B99A066838418E027A0EC2777F8A087226D
          3AE0D1C7300CFADC513303C7D63D677751186C527093C04DEE5D98224203DA98
          2646418ADE3EF385B14182AD3D766198D6C00EE889B11BDC382D6A5C0D42EAC8
          E43D580C0C7681DDD5A31D3E7E0E03C2F1DEA58D1744BE8EFC3E9A23734363EC
          C0DF67B62FEBD265D890A2D16BFAD412DA27E0EF9CB2213F965407E4E2459E3C
          ED36F4EA75148EDB4CE1501C4DB3D18289A959584769FEDB7FFA2CAC2036BDB6
          B40C1FFED8C7E1C11FF81844D569E1F7D3FC31A1830CAFC3E75200F04A184847
          A46C282831C01BFE70E5952B70EB95AB60DA29CC946ABC1B4D20B8C508568DCD
          2D387CFA244C1F3F02579E7F015E78FE79483A3D04F829B87CDF7DB0B8B828DE
          0128FD2A987BFECAE7A148254ACF98BD4D1E772D532AB9EB4A622902787A58BA
          7103566F2D33C0534A80388ABDB7057720026EABD3807A7B93017EF1C41C9C7B
          10358F9988C11D4A74CE674792F819DDDF231E4CE7B60B95920BC70EACE26C9C
          7603A4396A943FD5D020165A4C57DC02D5432FE73A063E47867B9107BFF0F57E
          169FAAA0FBFABD19BD0A5D9B065F4776AE419F012888DB112BDCC058007C3D4B
          C8F50F2B63298E68F4F777A4C18CBAFE181B02FD17B98D260C60F036A1802A1B
          BC83EFBF1395C2D92DBAF72D027711870FEACD65CCF04D2A93141C4D238648D7
          F5915F6B596781CF9FC5B6A548F271519062AF8DD883A0CEC22D0AC211B109F4
          47B11B9509D6EC6F2DAFC3D51B3739F5C65328CD4F1F39033FF6D7BE04874F9D
          1797CC5ECFA53BB1BBA2675CBDF200EF05436A10027C99F8240AD4E8A4D043C0
          7EE13F3F012B2F5D83C5C95958989C862A1912EB4D4851A25F38790CA2892A3C
          F3F4D370F5EA55067E5AF0E7CF9E83D3A74FF3AEC5EE520CA6E0BC4240DCA7D8
          E9D306C6B501F3D60A6F3BACA4A0290722B120ABDF78927270C3ADA59B9C8B82
          5C0EC9258FDCA5E89425491C44944B07EFD10153A6FC0A295333C7CF1E855EB5
          0BA569ACE724752EF9F9232497946612AA89837B52676308A4481AEDC4CAECE1
          582C359206C99424A8CA0A2894D2401C30C162CAE988C1E42A4827D66681937B
          5818C543CB77FBC86901723984063C82BABA655CA6BAC50ABD9CE64F1F0E4564
          3B9A03968C91FB07783F0D0356C527BE73519345D75395402542331DD14D63EA
          67A3FC788F708D1DFC383A170DA7DB18313C5129CE0E1E2872D60AF023378931
          1B483A5ACB899CA3C45EB709B1210AE0DA70330AC777C41C6107AC524089E6DA
          6AB492B266D90B28CD12A859E0B4239B8D4DCEDF6FE97848C4CD127EB7449437
          3EB75DCAE92F91D79B9BDBF0F2AB57A1494E2CEB1BF0DD975E86976EACC3673E
          FB4578F8831FE5004DCE321B185877C3C3F751348936C14A22A832A7C9902C6B
          DBB7D6E099C79E008B2A85E92440A6C6C972956381A86D1333D31CE4F4DC73CF
          C1AD9BB7384C9F5C93CE21C05F387F1E3AAD3627DFE21402E07CE95D000F3DED
          6287A423C40F95B607B74436007E1A1BF65AA185CE21C329707A800DECC0FA56
          DD5304C6B95DF26E9E4AA00879B16CB7B7A09D346066710ACEDF7F06372DFC6E
          952E829B1C01BC04520AED42813DFE3007DC61939E9BC4864D35E4D296309563
          9C8FB5F16DC9D26D48246E42BD1F0768E61331419FB127F79E0EFCBE25A7F1FC
          ECF8DF8FCE26E91382C651E6A216B44503D94662E09866DE0E92AA787B0BC151
          D904504301DEB2DD89945E65CEC347F1F635436313723754D73CA2127701F044
          AB8ECA4563EC709A930A5B8902C3DEEE8A1DADBDF86B9A61BF76294762B0E336
          C26135F047319A4CDB0313A491B1A3AF6D52C8D23FD81C4D66400FFE31E234E2
          822F954AA1214B78B4126E4744604C818FD81E0A73B41D8AB4EE42BBD1867A7D
          1B1AF536349A2D9C2F31DCBCB5C260FFDCD59BF0C8A7FF2AFCC54FFF184C4C4E
          7A4057F748125E07B94F0E6C4A08F00AF2C675121B1F49EAB402928DA565F8DA
          7F7C14366EAE30FF6EBAC22F597C5C985B80B9B979A84E4C311542271C9115B9
          8C15B974E122FB8E37B141745DDA9508DC7BEC1F2BCEFCD429A94B345410D8A4
          A2323302CF82FE92A462FD26FA4572D348BE180E4F46A964657515D6D7D7FD24
          106AC649F2EE20EC56BB019D649B5D248F9E5884CBEFBA00710D813D42C9BE84
          2A5609BFC54650A54BD4B025813B712407FE124EF5AC00BC9EFB09EC2225758F
          5D52AB48D3005B71ADA45CE86964BC26E243955D9307493E3E5E0154D0EA6386
          872CA57E18CB38FCBD6D1669A8BD0CBAAB06C645F97350F3003FFADEA38F6DDC
          59F4F5D06B43A6400D2B91932E07314F82B2A3016E9CF4E5E77E1087A2FEFCEC
          F11FC5A315249FE06C0FFD072228F1366B0B92AEDDC1EF8DA2C8984E1C5505C9
          1732E64BC34BA860788D54EB6D43097F50072A072F88588CE63785EB44A146E9
          364EEB269171CE1E24D492EB789C4A86DDE6760BD6D736517AAF2356D5384687
          FDE3D7D6E1CAB5EBB0BCD5853FF7977F12FECA4FFE2CE7D052C3AA5234BBA16A
          06BB493AB4E70B692C060EF4CAAB4BF06FFFD597E1E5175E44704F61AA5A835E
          ABC3AE3F34A6C70E1D83C5D93904F89B2C2993B74A05C1FC9E53A7E1C4F1E30C
          6E91A347B6B79B2C6597E20AC464E08C25404923A992545278C62E3D2E35B24D
          876F62A1F4C3BA83B18F28686A7D39262B0EC1C3483E0AFAEDDADA1ADC585AE2
          083332AA4E4E4DF24053D011E5AD29556254951AB0DD4229DF74E1F8E92370FE
          D219C03180A892426D32E67C20B58932878EF73870C2C0CCF40CB4B11F0C813B
          45151AF17C485D708A1C44221336657FF918BA6C172023748D27094D02E0DC39
          22DD158319B2E7FD32576844EA0B8AD8C5BA0AA6F0D0EBF52F265B783D6EF165
          92E120D73BE34F42EFBFF68E0D4B03EEE59EF8D7B945A90BD33DE7880CBBCBFB
          7A5E56243A6D5F14655C93078B41B6A35CFD830D7B50FB46D6278241BEF73B2D
          9A05333166C4188DD2A4ADCB23A379EE8BDD64FBDB9B0FED15FB559A9F877D86
          52C83E16A93A3FB6E14952D97DFC50014096E7458309C10B19813FA1CDD73672
          5A01A73370340D79E2C9496C925B29C5452E49EE3AEC7011B1F75C175A8D169F
          CF4C38B8B545F978125EEF4B2B2BB0BAB1C97F4B28C54FCE1F81473EFEA3F099
          9FF8698E8657895DDB4794CD4E0DADF940279B3DDA606762D5B16CE0B9279F81
          DFFA8D7F0CD7AF5C81494A968FB3610B2BD522B04635E37DEFFA3E3873EC14AC
          AFAE49CE6DFA1D36E6DE3367601E257C4ABA4547D311C8371ADB1C6C14397749
          EA1ECAA31EB910613A6843762A6998242A6A73042CE54F675747C7D5895BAD50
          213D3A8DDE0DA26663D32447AB6BD891B84BCECE4C73D59ACD6DBE1E4944141E
          DCE8A0F46EDB60CA16D5A74D548F62B870F90C1C3F7608EF859D1A2730592BF3
          A10B14A4343F332B5925F1B71D04F852B5C41B41BBDB866ED263502F95C897B5
          E24E12B26CDDAFA0C6905086481C6CCEBFE26201C8FD52CF1C9578CB1434B92B
          5BE545A482612E72720664C14F1ED47F5E2775E846D90FFFD6D90B8ADE3883A2
          E906BD96C53286832F3CA64E8B914D2D00F8340FD0EADF3D6A0F09173B0440E9
          97BAC924709D28595B32B55B168782B04BEAE55C49F8F7924342B8761B658FEC
          C698B8CC8351CE030A5C5436F1AF7A3D7FB29912FD34624E028CAC1EE0A1866F
          F93E6BD7206ECC34E6F947708FC3D355B8AA0F4D4590B80CAED9990B8171D5DB
          69CC903175006FB2F4BB9E23085FFBF912202F7F4DB50F03593E23DB17CF171A
          EBB58EC61B57D35D687166C0DC4E03293D3F8322F7926913A24B9CF048C22AE7
          0AC2B54C204F49C74848A58876DD24E8B306C5DC34DBD04281EEDA8D25E8F452
          D844817375630B36EA757EFFE43DE7E0A73FFB0BF0E18FFE791FE854F481DFB5
          178DE76882B1083B2942C9F5A5E75F82BFF9377E15BEF5AD2759526F634589F2
          A04C6AE446F98EB317E1144AF1162B3D3D3D0D3353333051ADC0E2FC2227DFA2
          0C7202F0655655682C98AEA15D90DC1A7D82210924E6868193ECFDAE1B0512BB
          751CBAC3B058D2FD6A9A50FE9C935701870A6F23A0379B2D9E3FA44134B0DE7A
          A806BDBFDD6B410F417C6D738D0FDF3873E6185CB8702FB621E200D285F92998
          45A99FA4F8884F6B8924180C17ECF4246E1AA5145AC936B47B6D8E60E583BAD9
          53A7EC0404B16B50DD2BCED3A7839323C205518E4B2E00A4AC07D6398790C8E5
          6A91F0F99E0F041B8C9682CF3BB6C641D14DC59FA413FA3B86AFFD14C91BAFF2
          0752EF9E22D13CDA020EAA06DB8C96736BDD78C965401B54BA722930F41A36F8
          F3992CDDF73350709B8393CE0CE481975349BBFB440CD0F23A75A964FDA3AC7E
          14A21D9047D603B0A4F74DD9F920FC9DD1341BDA0E6E73B671E8FDF4910CD97D
          1B8B7FDCC130A7C30FFCE096532438E8DCCB264128F98E46159AA3899B4BF9B9
          396C6E64F7314E03E9E7E9FB13C3C190D73B0BE5CF5D3308EC52A9BE48CD848F
          B48E197C130175762B77127D9AC8097629A7A676290C889E418C6B228053AA94
          B5CD2D58DFAC33A86F21F6B4F1734A9D72EAD419F8E18F7F127EE4939F86E327
          4EE50CACA4119044BF1BBBC85080D7C9AD2EB59417E32B7FFC55F89BBFF66BF0
          ED6F7F9BA59CADAD2D3873EA347CE0031F8093478FC38BDF791A6EBE720DA6AA
          9308860B2C6593F1726E7A86938C51BA00491152C24663C55162A7538E7A8900
          7CEA0D9DCE33C5F3E492938142FAA913491AE700257788030715918A14A53E6B
          9D7E46FC3A7905D09AA63405376F2DCB092A785D52A336F13DA293582622036B
          D2E684551D04F8F9F969387DE2284C4D55616E6612FFA63947C891430BBC4353
          3E145A742504E5A98949A877B601C80BB42CBEEF6C51EF49DD62973295A62E69
          32E4BD53AD94588AE7345994BD18DF27895FA5274F1F467A849F44E83A4169E0
          224DDDE9397B4A36060276E2160681B40623F69430D9930D007EF04256155D73
          0AA9AA69DDEF354791D16B85C9A88C02B81D5EA748ED34F9BCEB5E60B101B007
          4BD66B096EB187348F755A86C901551198B412695065D3F7B95537502F1EDAFC
          6B131CD862437AA9301623CDA4A36D00A3A55BC985629DF383F6CD2870EDBB3E
          08C087132B24823D3F5EB88CCFC70FCEB6A5D328A4EC9CA1C9E4DC289D36A437
          322EA7D5284D32A0CC34FB658ECA0B7CF5C3E2CFCF628AD8B24F3B79CDC881EE
          56920B12A87794B689D8AEB6B9D9809BAB2BB0858225D9D8081F1A9D0E7B0F6E
          22C03770EDDFF7F6FBE1C77FE2A7E0E31FFF0462CE8C37A8964A194D1D52353B
          29BB02F83F7CF48FE1577EE557E09B4F7C03BEFF073E001F7BE463401E32EF79
          F8613879FA14FC4F5FF812FCE63FFBBFE0D2E1D370DF7D97514AAD701A80A9DA
          8448DEE49543A9847181B6D99B86280C94E613C94713819C899A2D7A9713C7A5
          F8E4B34EADE5B3157B893B47D17F3795EC8B2A04B8867012FF588E365BDFDAE4
          E3F248AA262E8CB877CADD2E94104ADF08ECAD5E8B27285128D3935558989D61
          6F483A8CE3F0E222249D368335B56D6E761E6AD52956C5C9F592E3082AB13792
          F252E3CD2BF1694969B09ACD3AD4B01F48BB2169AF8237A820D85322B25E4F24
          7436D058256A32E2C528713304B843C156E9817E9A60D80621D293B579C0B3D0
          FF7AA81FBE3B916A58108B9E86E4E935CF833A68E074C2A292F2D8E6A6A42CD8
          71CC8FD7424671C52120057EF50A3110DCAF68681B651B50AD6B144D10869FF7
          D543382BBF1855530D35A8B1F4C3582F96117DC1BA43E46D46BB4F74E5EA6E86
          F7D748DB8AD58D2CF29498A78B758C4CE60AEBA9583FCF5C12421885EDEED0ED
          34CDCE690EEBA2B63D9BCD5B45FBC8F920D33CD6739AF9DC66D2CA5291D849D2
          A63F12E4E84CE64ED2E36CB624C913FD857B006C359A308342F0D2F232B7F52F
          7EE247E0277EF2A7E0DDEF7E08C17DA2AFBF398159E002BE6B2F9A81140DF840
          5D2821C03F8912FAE38F3DC6CFDFF7BEF7C23D67EEE19359E6E7E7B9B1BFFC8B
          FF1DFCFEEF7F998DAFDBD8807BCFDC0B6710F897976EF161B71313532EC39CE5
          DCC99C609F7236139D4292BB73570C0937753FE2F0DCD8192A939E53A3E51C4F
          7FDA934B3BAB1254CFBBDCC9EE5EDF6EC0F2EAB2047D4791E3E19B9C9F661BD5
          26DA704E9F3905EF7DEFC3F0C1EF7F3F9CC6BABFF8FC73F0FBFFF25FC0779EFA
          0E02FE241FF55521D7506E0765D1ACC0E1C34771603BB8726BD0C3BA6CE13589
          97230D667266860DCD627469731C0019616A7408016A12743845A7D5E4001F5A
          5AD56A851F492420BB40646D10A43ED8F52E7C2C4E649F675BFB615C908B8D46
          F2EF3961BF6FE14A1BF2FE7E834140EF217B4EEAD577F125CEE21940E7A193DC
          D9F36858D225E6A7E944AF406E371960EBE1CEA1249C497D6E331A0ABC832982
          E2A3B62F978DB500D0837CB0737428E4C1B178FFD11E14E90E007E9C041E7346
          CA08A2F1BBE94004EDD7E072FDEA85813E11DE71DCE1363B784C86B7C182E468
          1ADD7E393C2733AE9BC275531B78F3053109913B65480197F76347DF916042C0
          4E6BBF473135F8E156BDC97470B946F9E06798B958DFD88226053E611F5FB878
          197EF4339F814F7CE293F8FC3CDF83B093E276689855620FA99ADB636405F153
          D7B70844F9A82D04A3C98909989F9BE3F7C9B84A12315994BFFBC2F34CDB3C85
          60F84FFEF13F41605F8693274FC0CD1B4BA26AA05A42F40A49D55A61C389F885
          96215E9A820328F526386A46F31A6B36353EEBD0D52AD5E3DF408FE8B27C2DE3
          F25027B41100F8D0766A0DE584DE42A017C388C4EE9E3C751A1E4650FFFEF7FF
          19F8C0FBFE0C6E5CA76076761A6A93350E52FAC6D7FF047EEBB77E0BFEEDBFF9
          77CCDB1F3A74186AD8071182FBA54BF7C3A73EF929DCB088678BE0D5D796A081
          BB36197C2727A76071E1104C23C873124DDC7028277C4AE7B6A6123CB0B5BE0A
          CF3FFF2C3CF7D4D3B0BAB2C46E969AF150264E903986E6536247F2ABFEB42027
          A58493D61F9E30626DA6D6F850F9F0FB7A4D5DA0B92913C80874F0044BAFD02F
          45E5265EF05C25A9507797CD3B72E3EC12C305EA74AE628139804E848A7103E6
          FCDC4E38D0CD2E667E30CA6923B9451F2E8190A61905145ADF9C149AC8FA4953
          08359D41FDA7F70A4BAC5AA8D543C3B3B4CAFE308AE12B1AC681FC6860A01BC7
          EC471F1BE50883DD7087409FCBA3665D8C867F2D07FEE8D9B7998DDB489263A5
          6206CCB1A16D31792B91F5E2F7E832B02F9C0DC06BBC59CFF81422B1337E92E0
          D695B4BCCCB9B3F44E671254E864A72A94296F157E8F188BED2619583B2CCD9F
          3D771EFEEA7FF333F0D18F7E14CE9FBF000B88139AF092CF6C8DC46EA3DA9EDF
          78F69A6C2CEB495573952FCD3AC238D5C7B8905CCE874C8D24F21FA5F6B852E2
          C94DAAC9BFFEF297E1EFFFDDBF8FE0F5221C5E5CE0134E6827ABF299A291BF36
          81341924C993857CD1D35E87690AE5DCA9F41CBDC111638EE6F02A969E60E432
          D449A27C03DD546811BA171F95879B0A813B49EAB4F869873C7FFE3C3CF2B147
          E0873FFE7178F08177C1DCD414BB4F1ACE2B4E41596DA84ECDE220D6E13B4F3E
          094F3CF1047CE52B5F83C7BFF1243CFBFC0B78EF183EFAC89F875FF91FFE473E
          E46276EE10343B04CC6EA7F511AC22210AFD6499C7A7A8D9A96A193AED26FCC9
          571E857FF97BFF3FFCE953DF822A9FE4E5F2E0072BC667201C2D3A71DBB2F10A
          A90A99A2E3367D2B3918064FFE7100651C45338A83771C6C1470A8458D203C00
          5D27B51E1421F3A22C77F0F101F25DAE7B2C2722513F884743E2256813859CB8
          5201A1315B39E7D1C0A05E0D7DFDACC660A31A470A9AC75DEF4F45ED0FD9D273
          E367059C79715B116AD8A580536AA7425DC915C2DAC8159496F027638C07B7C1
          C58078CFEC8C02183A8F8A809FDB206C460386BBAA97E0B349B1537A277FA62E
          B828F90192BFBB9D02A5314A83E96756684AC8387DA18082B94363EBA8544EAD
          8573AE86B846C194D4023A6E71AB5987ADC6366BEC04F444D5907DF09DEF7A10
          FEEC877E103EF6C89F83071F7C371C5A58E4C04C1A463A6C24D6C3C8634791BB
          B9A6A04E1B4AC945DFEF6834C71DF8A15C14DD4E2F4C3761AB3171CF71ECA514
          5649B63661820E9D4540FD3FFEE13F827FF0EBBFCEFEE744851028D76A1359C7
          DB6CC11B131873AC4E56E7D5E0075D0D28456393BCA4C022A243C8B0BAB1B9C1
          1F4D2168AB8BD1C4D4241C3E7C181E78F041F8F0873EC4C6E153A74FB1D43731
          51E323F5C00D3271F0B4D948F012B0E4478BECEA956BF0F5FFFC047CF5EB8FC3
          1F3CFA55387DEF05F8D11FFB093876EC144CCECCE32294138D284AAD5CA9B16A
          C66723E23F3A489BE25B533AA5073595A45387951B57E1FFFB9DFF17FEF88FFE
          2373F3F3B394073A9123E9D8F0EC4EA8810802221D8665121C3498217B3E76D9
          EF2797B8190EECB9BA7869D97A355984EB28035DB7A18BBA1DF0AF913B4C1D41
          B2DB935C40E5720DE89423B2A91055C6C7DB3963A71EC42EAA74E21674EC4FE2
          D1F96D03BFEB28CE1BDDF2AE972EA0CE66527E085ED6B9892AC6CA14555B8380
          A649C1BBFF26CE2B2A8EE5B44F069E98A8C306AEB7086A2834CD4E4F8A43C046
          1D16E7E739882EF3D54E79BEA4A6C72759C919157AD0F7DE8B19F7E14859C3B8
          B50B431C9DB203B58BB9863CC0EB74CCCDCD8CDA1978DA963EBA4377E9BC0765
          0AE228CA840BA568AC6C04891EF8EE021FD987496943EF1FAF865BA5398D73FA
          88D9E1A34379DF298ADD082692004971368B0B0B70FC04D924EF83871EFA3E78
          D7BB1E80D367EE81438B87FAE231A4B16E3D4766603B777A5C9F551A69A7876E
          EB8553773C1535941AA27E9ACA49E9CD5757D7E0B5D7AEC1EFFEEEEFC26FFFF6
          6FC3E6E626827BCD9D681F0C4A20518DBAFF4E8A4A4CB411D11F9DFFDAD8DEE6
          D3D4676667E1539FFA147CF6B39F85CB972FB31B27D55D5520A5814A2C1D8AD4
          645304F854DCF6A27299EB4949FC4D5C85CD461B5EBE760B5EB97A0328B3C4F4
          CC02AC6FB5606EF6105EB30C9B5B9456B80A95DA94F7B7A744649532DED3D2E6
          D1848D95EBF0DDE79E827FF13BFF0F3CF7CCD330355946F068831E380CA03489
          0D36B3D112FCD0BE748FD19DCE3609F9685CA51B685E489C44156A2820F0797C
          90669B863BCD2A8AE540E9364A3B4DCAEB1195715E4D735FB7DB09537C65F24E
          220E544F820239D3378AD5AE6319E445A8A0C79233631BFE0D8D81027C91638F
          DC9904F9E8D2C0C01BC9069C85B70BE521D72871101519DEB5DDA96BA704F425
          6CB08BC91E5522575A801BD7AFC1E464850DFBE45A4C8F25BC8E3B95574CEE51
          4F02EC24A1016B96742EEB5E8B129A433F1FEB26392E5DC538237176FF4112BC
          09E8C781028DC912085250246101CD2F12B48842A1CF480B1C4475F8AC8DC540
          A990A572C2085D83809C7090F1666202C70A411DC1FBFBDEFD1E3871E2049C39
          731A1F4FF2733A039ABE479A256BA123FA2173E9DD9BB0E5B5E15C24EB981B86
          069F30943E750EFEF4197528BDA780FED24B2FC1A38F3EEA0D03C47DEFB4D221
          F7557C6F50D15C35DB4DA161C84E4075D84690A742C0FEFEF7BF9FA57AAA2BF1
          E93A096802D07BC4ADCB3DA9AD5DE1CAC17A099EA4C6B83C8900DF02284FC08B
          2F5F87D79656E0D8F1D3B0516F03258EAB4DCCA04AD6E66464867CFE29D82195
          BF2A027C8552D4B736607DE506749BEB70EBFA1556C50F2D62BD7A2D56F17593
          0A43F977C6BFDD79001F554243911CC2DC819595159E27F447471C663E43697E
          B183E10D80C2BBB7DB3DE890FB69A9860B6B06D5E009A6C6783C71CC532B5E0E
          E4124B760F325E13F013274A7F04A8E5528523A94D24871E33051251C09D78C1
          646E7BE08DB56A9403C8AF97DC46E0CEE6F4BAA5023C88E132D543C7E93B89F0
          E5927C4DA22029DC99CE596DB51AF09FBEF6C7281D6EB3D6475228C54D54D595
          16946F27804F3CEF6E19E0777FFA8F6FCB3E01DEC268801FA7E5ED04E077E2E7
          AE82A7DA63689D13085FB870011E7EF861FE9EAEB39D164D1340D7A1B9466951
          889E214C999D9DC3BF197E6D0C4AF093138C3FC568E0D0F571D47DF603F09ECA
          197A649FCDF38854D43527BC79181AACFCAF0253CBE561A78E0D2BBD93B29786
          71C0419AF2EEC8C60FFCA30E8ED97325CD599F433723AD7FCC2939852797652D
          12A14F05CA2E4E06413C2514804E1AC16BD737E0956B376003A5771BD71068E6
          A136358F756113A9BF3EA97E5D5CA804EE91EDC0FA2A82FBF6069CBFF7045CBE
          701A1667CB724831B98FBA03834330DFF9B15DA3017EBFB9CAF753D4AF97C6A1
          C25E02628B21C9EACA952BF0F2CB2FF3496015045D6B942671BCBE71291F28BE
          00DBD84209BEC759132B441E822995A18ADA122058B7BA29BBDFB2865992C3BC
          595B63DC11F73B027532D88B3A1F7BFF7B328E03A56CE680A62C291838973888
          C458AB140C7F0E42CDC48E3A242F2F1771060274721CA544333837548E55087D
          B0E5AB860DF12871761AD84FDBB08C5A9E4D51F26C6D23B0C74CDB90AFB50F4C
          33BA116A7A00002170F7BED1EF1FE0F741F301E4A93EE5EFF750F4600CC52F9A
          7304C4478E1C61895AED73B1A3CB767A1FBA9E3211D93508B0076F6C9E2E71F3
          9FD620C5FF8CED867D4AF07234E818800FA5F638A06406ED300AA09A1C87A433
          6A3C752C07F7B02F7B3CB252DAB0FD342A0446BA2F0D06EDB8BA6B6A878789F4
          4523899D2B9ED6A127C61AAD175EB79B445047109A9C998295AD045EBBB18692
          7B13B6B6BB30357714963751FDAA4EF175F8380FE20059258CA18D12192A68B0
          BDB90A5B1BCB08EA5578E7DB2EC0A57373141F056DDC146A6CA14F833E28FA72
          DCDD12FA5E0ACD177657458D8A5A5B8A55BA1182568D9E04A27CE834F6C156A3
          8D527C171F71B3DCDAE6588AF9B9C39046555859DF664F1A8ADD10D7C9301582
          F842889345ECDE77AF415201442C1167BED51A64664025B024E77BAD9F337C33
          D05B772CA41AFD9C26669D50A4E0EB246ECD282A2D262F32D4E27093999E8E51
          EB3C0653137A407922867AD786AC38AAC6454A381FA47D8CC8785BCAE8B24F80
          1F72FF5CCEA511D7EFF101D85DC69B505256E18681DFD34883F801B573EDB4AD
          FA6BF1AAA15C339C63CBE1655FD6D734DD11C6ED07E0A9F471F03B8D56CB27F3
          819C4FA68267F85E287DEE371DEDA8A2F5D20D4679AE41FEC3EA99A189F475B0
          04E01554AC07780217F2E069F7C4D58EA270D71A09BCF4EA32DC5ADD901C32A5
          6948E33904998A9CEE84EDED74BA9C27BE82DF6F35EB289DA6B0BE7C1D975F07
          EEBF7C16EE3D790866A7C5F0568B290B71E20EBDC80FF2CEFBEDEEDE00066DE2
          21E5513468422E68C6F0A6B9DDEAC0EA460336EB6D5859DB84EB4BCBD0C0F716
          168E4275EA1034BB86ED20EC3A9B86063497A0AE2752A6A66F66C32DF97DF309
          60387F92160C03B8D0A3C1D739F4E448C54B8ADB94AAAB9DFAFCAB70133115E3
          6CF75C388A1BC80988521AA07A1DD1F18F5DF8BE874EA38064E8080231FCA176
          5029893D08F2BD040A4A66DF73E0EE04F8B0A5E3AF2FD7486D76F49918D8FBB3
          A5A6BAC60BCCC4C8AB3B57439F3C2E643312C314A00628295616B5F251453781
          BDE2A57A918D34B28E1D86018BB5CBE9088CDF3989730FC1F676DE6B50A7A854
          AE9D4B2594DC8BE969556DA23FA60D34B8C3E584B62E973BA9F6D61D4C42E6AC
          265EBA83AAF2B51B5BB08C006F70C7AED3C12D30C5C9FB891620834B9B7CE27B
          1DCE5FD3A8AF8341E92CE96EC391C52978E01DE760BA2AD4011DF53755E14CDE
          12F43430806627E5EE06F8508A0AC756555752974B9C70CEF1CBBE18A1BC88FA
          EB52BEA0166C777AAC3DBD7AE53ADC5A5E63CD696AF638942A739CE02D764174
          726DD93C843E2C3970776EA14EF28E343ADE263937C3CCBBAF208985BEFB0E44
          4869A01414FC512211D2B6A7DA65E63591B8486CD63240A221890A2AE17F69B7
          8920B18DF3C7C2430F9D81A9E9980DAEF4553200B3AD49C3F9B52EBE9BD2BE6C
          98B7BBEC36C3E8EDFAFD6EF023046CD1D25DCC4C00C4211684DFDF4910515F2A
          67C8367FDEDBD3FE94BE8A49EA0832AAEC17E0A9EC08E0FBF2210F71DD092B55
          A47138DF7B106ABBDBB29B3C18C54E52C0A7A29A45E8F9A3F6023FE07EBDEAD1
          7AA9389F991287707799A795032B08E4AF5EAFC3D2AD5568B629A37D05DAB606
          AD4ECAB966A6A767A0D7E9A0BA88004F81626B4B70E3EA2B70EAC422BCEDE23D
          70DFE52340074331AB6C6501938C1A0DE1F17666C318936BFC75D4A076538649
          F2A64F65D6831704E089BB6EE306BAB9DDE533779B9D049EFFEE5578F1C5EF42
          AB8D1A596501B5AB79947EA7788325A36C0491F3847786F24EC2AF3835736233
          A0B762D48DA2BC2F7F18ECCD3D1C057EEC033862E3FC97E9DA62E4B3720E800B
          3566D73C7716301981395D74D2E16BA1A207BD761DE74D034E9C98851FFCA1FB
          61718134410BD532F58DB8EE1AC7EDFB8D4F7AC9BDBBD7A332DE1C6527401FBA
          20FAB4E28E4550966114A3303EE2BB1FC0C3FB859BB9BE173EEEE4FAFB0178EF
          E7BF1F09FE7BB284BDA15E094CD1448EE5F4C764C3568724F84D58BAB9CC6E7B
          71651AC1BFC6D23C4D20F27828236A572B6596E237D696D973E61DF75F80B75F
          3E03B353E2495132BA4C134E5EB6BF72774BF0634BD8FFCE00C9E71959C73023
          A877F1090594114D46B8F9C2776FC2779E7A166EA2143F394191C327A0B99D05
          CC552B3576876CD3493AAD8E33A4C79CD554A0525C26250B25DDB82BF72D78CB
          840B38CBB45858AC51B89833FF775023ABF7AB562048F8D0170A6C92A85B04FE
          84DC2113989D31F0918FBE0316164A2834F460A21C0B85E33B49A4C034E83A61
          DFD3EF69807F7394BB631D1E007CB1147BC3A43980173398086374D6C9CDD506
          DCB8790BEAF5067E4EA98FCB1C849372BAD01E9F2445B97B5AAD3A34B736617A
          B20C972E9E85B3F71CC5050B1C115C62AF1D97648B2DFAFB991C77C7C4DA7319
          02F069263E23A8C76C9026BB07511C64F2BC727513FED3634FC26B575750733A
          8AE0B8C0C64C72992575995C23C9A8CAF97C8C783C4426CB5ACAC7AE91CB22D9
          41E2826A0D1978727C24A57CD6F37E21638349AB236DAF9DE8F1F591C3726768
          D3E31A017CD04C2632089D487380F20F4ED422DCAC52F8F087DFC9001F396F1D
          3A333836C6F1F903281A3800F8BBA3DC1DEBF00D05F837E256FBA22042DB4EE0
          C42200AF648181AE95847F94E37975B50EDF7DF91578E5CA555859D9808DAD06
          4AEE5DA86F366063638DBD78282BE591438B70CFA913F0C10F7E004E1E3F0287
          E627A1C4F969C42D924579B2194465E783B1D7F68D9E58AFF718DC360AC819B1
          5CC0366802293EF1900CA228996FB72DD04158D51A6EA028D1BFF2EA2A3CF9C4
          D3F0F4D32F32B8CF4ECFC1C2E2614EFA46499E4A518903A5087F5982379103F8
          94337EA63816094768E7DBA21906FD99A71CE9224E8FAC55A8370D71AC11C72A
          CBC11CAAA6A78E0274402F119D6124AA18F5E54897049AF53A6E5C24C197E113
          3FF267E1D082B81927147887F5A39C4EEA2963B3AB0433607F00BF5F37C7716E
          963BB9C2B8FBDFED72E9DD42851E007CAE823012E02D837AEAB251C62C55B511
          716EDE5C87D79696607965155696D725E13F1D31D86AF2612864703D76E4309C
          39730ADE75FFFD303D55835AD985A693441669985C7A00F0B9B1500F9A24B3F3
          30384A3A5B8A4920DE9D8E06A6F410A4FC34EA1D78E1D92BF0F453CFC0D5AB57
          99FB266937614DA9C21B03193FC93F5EED317CDD2475F95F5291EC41A38883F4
          0A4A13B9F9C09112A9264273A08A635DAA9525A2D5B943D2C11FE0A266D9F3C2
          45D88A5DC5A5878EC4EF9E738AE3E7CDD6261C3E3C033FFDD39F81A30B936CD0
          252FAC89DA84F3DB1EE445C32DD9B7F47E00F0FB2F0700FF7A35E8750378CDC6
          1EB97C1F92BA96654B277C27A91C9CDDE988AC5FABC826409FB131B524BED091
          CBBF41B29E444CBA40178980794B037C31F788C04D70084644D9F648E2060E66
          225A8434A94E4FA47BEA5BB25FAE2E6FC2B3CF3C0B2FBCF812F4BA091B5C29C2
          B3891A1567EB8B25CD34E7AA01F161E6BFD479A8B83D970F3DB47AD49DF500AF
          814FEC6297A63E473F273BE3B41619074F465EDD48D8A3AC54F6E1F06C5FA0DC
          363E72D642A3D9804683007E163EF189BF0027E8C848BC0319ECCB9C68AFE081
          E1BB5C4FFBDA1F3D7000F0FB2F0700FF7A3568BF1DAB737320C03B6F0B1FBD9B
          85A7301FEBE6257D934EA98A8D8039380F99C8497DFC3B92226351B29582302E
          5A737FEDFBDE01F82CDB8806F100F8A44C2C653BEF28F765EA570A308C4A96ED
          1EE27E29EE8CA5C8F0734E4DAD7146063243A9DE3FB88DBF9D9B0F6EBFF1BF1B
          986C9336A0D43DD73DC9E6EF933A174DD0F963DD1C506C2E11E5D4E19C34B3D3
          55160E2836833626D248E83C02EFF1E5E7A9F651666ADDFB181C00FC7ECB5B12
          E0DF14A5CFC8EA26939194ADE4E74F129824870A5631195F29B78AFAE1FB0C74
          C08B924F6E8D05E85D9A707EAD82BB1EF43B2E55EDF872771877F65A3C7E8382
          62E62AC98F69006074D07A22812572729770E15DABC16E319F96C526CC44828A
          62B5A584A0ADB771E90EC3F3388ACB94BED14B5CC2A9C2E6609C2134716F98C2
          A396D218472932D1521BCA9C31937237255076C15836291CC89203F82478F37B
          1BE00FCACE4A3E9255DFE4FF53F0446330583AF8B9B7D5C2332EC7D09BA10C03
          F82C497AD047E08327D449C2BB53BA03C34B210AA422B56B10B0BAD14ABA5A39
          A8A4FFB09F42C87428B50DA8F6FEA318EF6C190EF059763F3AF484534A9314EF
          3875F670A4A6C742AB287B9E6501189C0B5F3DDC555B10CA2D33AEAAF42D6761
          F747518E82B2612361934CA2CF25F77439CC39DE820E62E714B77294259DF359
          2E558368581822C18FBAF30EC7E08E02BC113E2CE79E943517FCD8167EA3C7FB
          65EF1C1408005E96910C0CE334E9AAA90378218C411951670E12CE510507E61F
          415D73DFB265D4B4DEC9A40B04C90C3D9437F08739047FCE93427D3FBE17F6D8
          C1BD52E859E5C3466C767BBD539828D625117617758F3E974C947D51AB1494BD
          8E43215E36B84ED4FF4593FFEEC0EFBD998AD8D435AD0E68C0AE60BE9E186BF3
          CD7511CEEAE9A669DDDECA85ECF882E3398097225E7BB6204E59E117C1F81D9E
          6DF97A803AFF10DEF200BFEF3248F85170A1124A91059007F85E04F737BEF46B
          B2FAA612F3816819D86A729BEF41D95B2902BC4B8CE9A204187D62B08152E7D6
          4124878CF870893BDD8E3B5CFA009E8A9FD8DAC9458B572C3B699A7F4B78519E
          DCE6A067F75342BA994A001643A5C301DAEA01C0ECA30CDA60CD60ADC0EFB539
          1E1FBE57D5A837AEA4996049EEA6E19260813EDC0400F27D9EB1356FE9C2EEC1
          B620C1EB2E491D28A78743AE676D64410476AB8783B1FB96A6473594971BFA7D
          740FCA0E8B75BEF0CA3692CBA431102A495AD48744D8B334D8142280BBC482FF
          A62C7E0CC0017BC4424D88275AB231B0410650733006FB2A44C4F4247A198013
          FB59C7D3440E61846128489A46F049A3CDF79BF0E3CD5E3AEDD4859138804FB9
          5BC5C8134B760E28DA94A8DBBB7CB22575A404EC8B4928E18E2FC304FEAE3A32
          57F3411955A84F3B00EEE83532AFD171803DEEE1CC8552D4544A52468F2994BC
          8CA34690B7FAF4DE4F2128A75C3462AA95BE8FF01D9524C331B0949C82533C4B
          F4288D01F53F459E1E8CC15E0AE7548736F67BCBA14BEC1C074A9CA7A9C4201F
          F1A3FB813C1870DB8295B3A2252FEC5BB274D7D761EB9BDF84FA134F8412BCEC
          99EA8A4B123C1F4C10F08A2E140412231916AD1B0281221A822A0E41E500E0F7
          5C14E0D59C1463CFC60CEE8993645CDCA5931E1164AC865EB983B78D9E2C7350
          F656123E324F0ECE8E447C21774C00AFB34A11CD5537581D21E9FB0380DF6B11
          D1B1837F5D5E05D601BCE178E0987149844F93E3942935446A84615001F57B9D
          4968D20968F8B7F9B5AF41E79557A0F1CC33FCDCB65AFE3BFF058D8E28CFDB62
          0C360000000049454E44AE426082}
        Stretch = True
      end
      object pnlTrget3A: TPanel
        Left = 611
        Top = 1
        Width = 213
        Height = 78
        BevelOuter = bvNone
        TabOrder = 0
        object pnlTargetNmb3A: TPanel
          Tag = 53
          Left = 0
          Top = 50
          Width = 213
          Height = 28
          Align = alClient
          Caption = 'No. CCS CMD'
          TabOrder = 0
        end
        object pnlTargetName3A: TPanel
          Tag = 52
          Left = 0
          Top = 25
          Width = 213
          Height = 25
          Align = alTop
          Caption = 'C705'
          TabOrder = 1
        end
        object pnlTarget3A: TPanel
          Tag = 51
          Left = 0
          Top = 0
          Width = 213
          Height = 25
          Align = alTop
          Caption = 'Target'
          TabOrder = 2
        end
      end
    end
    object pnl3ABtm: TPanel
      Left = 1
      Top = 258
      Width = 950
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object pnlStatus3A: TPanel
        Left = 855
        Top = 0
        Width = 95
        Height = 41
        Align = alRight
        Caption = 'NRML'
        Color = 11754291
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel10: TPanel
        Left = 409
        Top = 0
        Width = 351
        Height = 41
        Align = alClient
        Color = 11754291
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object lblAlignmentStatus3A: TLabel
          Left = 28
          Top = 13
          Width = 117
          Height = 16
          Caption = 'Waiting Alignment'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
      end
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 409
        Height = 41
        Align = alLeft
        Color = 11754291
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        object lblWarmUpTime3A: TLabel
          Left = 20
          Top = 13
          Width = 102
          Height = 16
          Caption = 'Warm-up 00:00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
      end
      object pnlChn3A: TPanel
        Left = 760
        Top = 0
        Width = 95
        Height = 41
        Align = alRight
        Caption = 'CHN A'
        Color = 11754291
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
      end
    end
    object pnlVrlInitState3A: TPanel
      Left = 15
      Top = 103
      Width = 20
      Height = 10
      Color = clLime
      ParentBackground = False
      TabOrder = 2
    end
    object pnlVrlInsGnss3A: TPanel
      Left = 15
      Top = 125
      Width = 20
      Height = 10
      Color = clLime
      ParentBackground = False
      TabOrder = 3
    end
    object pnlVrlMNormal3A: TPanel
      Left = 15
      Top = 147
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 4
    end
    object pnlVrlCalFinished3A: TPanel
      Left = 15
      Top = 169
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 5
    end
    object pnlVrlNavigate3A: TPanel
      Left = 15
      Top = 192
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 6
    end
    object pnlVrlIgnition3A: TPanel
      Left = 15
      Top = 213
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 7
    end
    object pnlVrlSeaTgt3A: TPanel
      Left = 185
      Top = 147
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 8
    end
    object pnlVrlInsideSector3A: TPanel
      Left = 185
      Top = 169
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 9
    end
    object pnlVrlParaSetting: TPanel
      Left = 185
      Top = 192
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 10
    end
    object pnlVrlTakeOff3A: TPanel
      Left = 185
      Top = 213
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 11
    end
    object pnlVrlPowerOn3A: TPanel
      Left = 185
      Top = 103
      Width = 20
      Height = 10
      Color = clLime
      ParentBackground = False
      TabOrder = 12
    end
    object pnlVrlEngine3A: TPanel
      Left = 185
      Top = 125
      Width = 20
      Height = 10
      Color = clLime
      ParentBackground = False
      TabOrder = 13
    end
    object pnlVrlFullOpen3A: TPanel
      Left = 337
      Top = 169
      Width = 20
      Height = 10
      Color = clLime
      ParentBackground = False
      TabOrder = 14
    end
    object pnlVrlParaLocking3A: TPanel
      Left = 337
      Top = 192
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 15
    end
    object pnlVrlLandTgt3A: TPanel
      Left = 337
      Top = 147
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 16
    end
    object pnlVrlInitChk3A: TPanel
      Left = 337
      Top = 103
      Width = 20
      Height = 10
      Color = clLime
      ParentBackground = False
      TabOrder = 17
    end
    object pnlVrlWarmUp3A: TPanel
      Left = 337
      Top = 125
      Width = 20
      Height = 10
      Color = clYellow
      ParentBackground = False
      TabOrder = 18
    end
    object pnlVrlBusSupply3A: TPanel
      Left = 497
      Top = 103
      Width = 20
      Height = 10
      Color = clLime
      ParentBackground = False
      TabOrder = 19
    end
    object pnlVrlPlcChk3A: TPanel
      Left = 497
      Top = 125
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 20
    end
    object pnlVrlBoosterArm3A: TPanel
      Left = 497
      Top = 169
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 21
    end
    object pnlVrlBatteryAct3A: TPanel
      Left = 497
      Top = 192
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 22
    end
    object pnlVrlSeeker3A: TPanel
      Left = 641
      Top = 103
      Width = 20
      Height = 10
      Color = clLime
      ParentBackground = False
      TabOrder = 23
    end
    object pnlVrlInsAlign3A: TPanel
      Left = 641
      Top = 125
      Width = 20
      Height = 10
      Color = clYellow
      ParentBackground = False
      TabOrder = 24
    end
    object pnlVrlLnchRdy3A: TPanel
      Left = 641
      Top = 169
      Width = 20
      Height = 10
      Color = clLime
      ParentBackground = False
      TabOrder = 25
    end
    object pnlVrlPwrSwitch3A: TPanel
      Left = 641
      Top = 191
      Width = 20
      Height = 10
      Color = clYellow
      ParentBackground = False
      TabOrder = 26
    end
  end
  object pnlArea3B: TPanel
    Left = 1005
    Top = 424
    Width = 952
    Height = 300
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object lblInitState3B: TLabel
      Left = 44
      Top = 100
      Width = 73
      Height = 16
      Caption = 'INIT. State'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblInsGnss3B: TLabel
      Left = 44
      Top = 122
      Width = 65
      Height = 16
      Caption = 'INS/GNSS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblMNormal3B: TLabel
      Left = 44
      Top = 144
      Width = 65
      Height = 16
      Caption = 'M. Normal'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblCalFinished3B: TLabel
      Left = 44
      Top = 166
      Width = 83
      Height = 16
      Caption = 'Cal. Finished'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblNavigate3B: TLabel
      Left = 44
      Top = 189
      Width = 58
      Height = 16
      Caption = 'Navigate'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblIgnition3B: TLabel
      Left = 44
      Top = 210
      Width = 49
      Height = 16
      Caption = 'Ignition'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblTakeOff3B: TLabel
      Left = 212
      Top = 210
      Width = 55
      Height = 16
      Caption = 'Take Off'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblParaSetting3B: TLabel
      Left = 212
      Top = 189
      Width = 82
      Height = 16
      Caption = 'Para Setting'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblInsideSector3B: TLabel
      Left = 212
      Top = 166
      Width = 88
      Height = 16
      Caption = 'Inside Sector'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblSeaTgt3B: TLabel
      Left = 212
      Top = 144
      Width = 52
      Height = 16
      Caption = 'Sea Tgt'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblEngine3B: TLabel
      Left = 212
      Top = 122
      Width = 43
      Height = 16
      Caption = 'Engine'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblPowerOn3B: TLabel
      Left = 212
      Top = 100
      Width = 63
      Height = 16
      Caption = 'Power On'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblInitChk3B: TLabel
      Left = 364
      Top = 100
      Width = 62
      Height = 16
      Caption = 'INIT. CHK'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblWarmup3B: TLabel
      Left = 364
      Top = 122
      Width = 59
      Height = 16
      Caption = 'Warm-up'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblLandTgt3B: TLabel
      Left = 364
      Top = 144
      Width = 58
      Height = 16
      Caption = 'Land Tgt'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblFullOpen3B: TLabel
      Left = 364
      Top = 166
      Width = 61
      Height = 16
      Caption = 'Full Open'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblParaLocking3B: TLabel
      Left = 364
      Top = 189
      Width = 84
      Height = 16
      Caption = 'Para. locking'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblBusSupply3B: TLabel
      Left = 524
      Top = 100
      Width = 72
      Height = 16
      Caption = 'Bus Supply'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblPlcChk3B: TLabel
      Left = 524
      Top = 122
      Width = 55
      Height = 16
      Caption = 'PLC CHK'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblInsAlign3B: TLabel
      Left = 668
      Top = 122
      Width = 59
      Height = 16
      Caption = 'INS Align'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblSeeker3B: TLabel
      Left = 668
      Top = 100
      Width = 45
      Height = 16
      Caption = 'Seeker'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblBoosterArm3B: TLabel
      Left = 524
      Top = 166
      Width = 80
      Height = 16
      Caption = 'Booster Arm'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblBatteryAct3B: TLabel
      Left = 524
      Top = 188
      Width = 77
      Height = 16
      Caption = 'Battery Act'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblLnchRdy3B: TLabel
      Left = 668
      Top = 166
      Width = 65
      Height = 16
      Caption = 'LNCH RDY'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblPwrSwitch3B: TLabel
      Left = 668
      Top = 188
      Width = 79
      Height = 16
      Caption = 'PWR Switch'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 950
      Height = 80
      Align = alTop
      TabOrder = 0
      object Image2: TImage
        Left = 1
        Top = 1
        Width = 600
        Height = 78
        Align = alLeft
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D494844520000018D0000
          00430806000000603259A1000000017352474200AECE1CE90000000467414D41
          0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000058
          3C4944415478DAEDBD79B01DD9791FF69DEEBBDFB73F60B00D80016686C34D8C
          62D9B425524AC844912C4AB1459B36E9722565AA8AB628CA4E1C57A58AB6A2C4
          F9C3FAC396E528891DD39252A2162AB2954A6C272245291C9212351C723833C4
          70360033C00098C1FEF6BB75F7C9B79C73FA74DFBEDD17EF5D6040EA1DD4C5BD
          EFDE5E4E9FE5FB7DFBA734B578085A251004350050A021C4D77E93B63F12D414
          BDB42A3F48E35829557921CDFFF6D28F193C0CFE97DC8D81BAE3B6D787A1B154
          322EE69D2F692F4BE3AD479044118475DADF3588238D7B3D00150024311E129A
          E3EEFA536A30830F2AF37DF6B749AD6265EDB71937B7D7E803BEC71161047D87
          0D12DAEC497A24FF179853BDB30ADFEFA4CDF25A77E39A45D7D0B9BFEF74D8CB
          FAB79B36CB6B4E7F2DED0892CA8EABD6D963891295CD05AEB359CCF69E289C5B
          E3E6796867B8F7DCEF953DD9CBFADB2B6C69F74FE17E5510A65D735D34F3639F
          8DF775B65F9617A89E93DD3F2B12198FA7500E3AE87BEA00BDD33314CE857957
          8E2615F42B336FF78256BDD9F4EFEED352FA3F410663341A411D190E820A0F34
          FC93FCF69D43F4767D4D1E7F1AA06017D754DEB945EFBB592841C935EFA47F55
          D7CAF7CFA32C1E179B2550E6CBCCC62F20CA45EBFB4EF668D539D35C2F493C22
          EA8F9F9DF769E66606EB6F9A672E1D0B2BB759396382C8E04063C273E9AAFE4E
          DBB19253C7E899F9C1825BE19A29987BFF361AB25F94322D6F267DF976A4A528
          5DE0D6D8E9F5A0DD6E2060841E68C4B9F3F63532D94652980EA088FB1923A099
          77E59D5BF4AEE0CE889E2EB9D69DF6AFEA5AB9FED107DA8FD30AA093FAC1ECCB
          5EE602526679B7A0412DAE38EEDBA17963A1735F57ED61275DD8FD7E7FE8EAEE
          BC69EF03F341DF2E93F76DD0702887D1106A8D3AFF118D12683482BCA401199D
          7329C3A8B2FAAE6936EDAEAE554A94EF45FF92FBBC7FBB1BBFAA6B8D5D933E12
          F73D15073EA1F982C62EFB07CAD342CCA81FF764FCEED6FCDA3FBDF150DE7316
          0D9476A8A2E55C2D9FD484679DE55AD6DE6FBB1A3F98F01D3E84F038EA9ECCC5
          1DF5EF3EA70585D704C1819DED2D68B65B806490258D5A181AD0F0B8924491E0
          919006F28E941753EED5992957ECB3EFBD7F3AF3A9783CF58CB4847B6368EFF6
          B5482B5EA69CB20CBECA7C3B793C8B7EA1EBC600A02A7A6CCDBBF977E9473051
          BB3DEDB3CB1A2F5B7FBAF21AD30858D33555FACCA9A97BFCAC10ACF0A70BEE1A
          F0117AECBCD83C7564E624C04F61697FABF6DAB4FB579B7EDA73E4DACA7BD2B2
          F19BDCC359F52FEDE79D296FABDA6C68D5F4FD9B052DA5ABD4699F24118CA218
          EAB5260247534023F1740789BBE19F0C1D5532E552FF93D0AA08791E348A8ED7
          538086E571CB991FCD6C8B32EC4BFA6E09E5EE618356790CC6085B72D4BD9B75
          3BAA7746F6EC588409B8DFB43F2CDAEAAE542A89286D588308083AE529EBF829
          BC274F4AB3287CAA36CFA05882B5335C3A4A96052E18BDFD76371AEE383D8438
          1A401836813CEFC2A021A011C3C81D66BD30FEA44C84F619B4313647CF96BDBF
          5F5A95F83AF1B402DE4F653F57D95333AA932944E6A2FE15F1D4773C0455FD34
          743CDF457BFFA93A708F5027E382ACB2BD2DEA02FBC5A8985FE2B5443AEBDA3D
          E92BB9F83268782ACFD0B8FCB2FBAFCAF6D9AACF1852CD49CE03CBAAE7F222F1
          7E9B51D310453B383FCC9AE03C04ACA2CA808688FF01BFF6BCE0F77AFE2C267F
          5642C41484ECDB0A5826F5936DDF49F12328212F492C0F1404A9A4E0362D6DFC
          8267B6E2B7D2294F6D75A760BECBD8F135A949F11E45EF20E725BE5C5F30DE7A
          D26FDA88DEA9709D9D3F7E1EE35AE89FA885D8C9EFF7E3A47ACDEF9E1DE7FCCF
          EC626FE5BE54C9B5B79627F7E33F2789481989F5F0C7B1D48816E4D2496B4767
          1610814B02A1228008F8B39B0323A13803973D251807F93BEAF6DD6A659D99D5
          FD27DD63B70C1A5F2FE2F7D10865D1B02EF13D3A6309972DEDEC64159D2A3D64
          8F0391AAC8265B832A37AF9E706AF1E5268341C53D2AE7C212326F4CFCCF7BB5
          2FEFA96540434F000D2DA0816F3BDB03DCD821B45A2D8891338C63B3F1F1388A
          0D8DCC524AB27A2C271E3815970F1A3E57AF85E09719FA74A845F3E20D7C5672
          50E9BCE81C29C39F427CD589B8C4725E4800510377424D19271C9D3091238245
          B78B91D2E94431E7E53C3BCB16D07D0F2E32295AFB1355FC4CD5406941C89B03
          F3D2D632488E9A2C3604308A22664F150EF4E6E6262C2D2CE0980730E84738BE
          38DE783FD2A52738498D5A1D8F13AE4229E11CB8CFCA00874EE799D645ACF2B6
          370F12C7E6CCA8BD20B721F7D4728B0E52E04E6362543AE23A7B6AE683252093
          3401FE3415486963D3993FA71234EC9CA64C8518C2C71F79AA9664CEB01C0018
          CD73EE09BCDBD02D55996B9C125548B9CE59546993F4BFCA040DDD59CB9B9700
          AA40A654BD65895D1E6C75F6FD5E8146F92D522ECE057A66C64541AF3F84EBD7
          D7706323F717B621C2DDA9750DFB1EE2E7044103C79D093A1D1F79B317C826D7
          32602AB33F334A9FCCB814CF108ACC4848C8612350D6F2A032D7621DB952CE9B
          C67EC73CB51269BA0675265235048B7A5D41ABADA0D908F0B9E857CD2F42151A
          9390FCD32D10259658D907D88B4BF52C584CB58B759E3B7DCFF61B5F6A7171E9
          E6319579997F2C598662BF202602C1203662078D723C4A780EE8E504093C7A38
          1AF2B13542F8C4BAA6285E7B76D1302885418636E68183CF2C7C58E965EAF2B1
          DBF1B45C8FD7093332769A12334A9930CBBCE49BDFADCABF90F7B31ABF8F2F02
          CC427E1C7FC43D80C6E46606CEFFA6327828DF3355B9A92A4163CF3E09C0EFB3
          D8DA93E06F9267CCAC5B7E038DF72C29201D293921327BF5E63A9C3D770936B7
          8638354DA074334A35F15543D088192C48D560412336E726DAB0125A0CD8CA31
          E2C53D2A5D2B0416353BBB9AF5DCDABC2CDAB00A440B77ECBF98D89BCBD4512C
          6A2062842872D4F17AF3F30D585D9D478EB7C37F93879166057C023522562A75
          03906B9BDB958086AADCB233028D3DAE9F694063BAFD9BB054A6CC9E49D94801
          0D5A617114F35CD4C21AECF4FBD06C35D9823A24EF1C94E0E291D00EB6752057
          50C3B9180CFB7C9946BD2102B1011995010D331F811EE3E6FD91221597AA7ADA
          597070969BF42E35BD664681CEAD1D35E942DFC9A0C1DF7AB7AA1277B54A97DD
          AE1FCE3D6456BD91F9AE62C3690F3CEEBC3F622848EE03473BE538A9A26BF9DF
          6625C2D4D010C2ADF5119CBF781DD63706C8A537F1BB0672EE0D7CAF43AC13B6
          7388074C641C5A8D7F8ED11BD0F5EA2179608C2B9EB3DC69D938274EB72D845B
          670CAB7C2D65A58D80255A7B6DD14C189D7A1C21E152ACFE180D771028123870
          70010E1F5A81856E5D084C12B1B441D7AB110133636C81CA4A2F93A4FB40A5EA
          DEBD6808CA35A8F27C7BB9C6347246156838292FE300ECD926CCDF76BE36D6D7
          E1A5B3676179651981A3CD3AF3114AB20982078134A900A36888DF0F51C2DD81
          874E9E8023478E08A350021A4AE51642C1FAB937460C5DB8BD53812285547EF7
          C99D12BAA355E08E5179CDCDD80464AFEF5F7BD66D0268F84BDB274CB6557350
          45AAA5E909837DFCD94C6E99A9A26AC3659FF9DB1D34EC35F2BA12FF0EC69AA4
          FD7752F2D7E1FAED119CBD781336B6464870DB78DB06FE4E9E37211F57ABD721
          621798886D23A2C3564635256B26547663EFCEA8CC231A8D68E13A9D36034460
          2418FC8FB8D9388E5309037C70B16B338146530C1BFDDE2602C10096973A70EC
          E82A3C70700E9AA12582786C32E2FE8646ED25D793BE973BC94EFF6C0AA0E25A
          9366B758D2A85A298977E634A051C55C25253481B95F5A0B2801927AE9DAB51B
          F0EBBFF19BF0852F3E0EED761B1A8D060341B7D581CDCD2DD8DAD880E17080CC
          C96D04F411AC1E58868FFEC44FC0873EF84168A2B411539C89366E3B763E0C16
          C8DA7256F682CE58156C713F67D554819624CBB2790CB47DB76A6B0B1A4662A3
          DFC32254C84ED0D8CFF71034A61156AB859E3C68A8CA259CDD1669C4C8DDE50A
          EE856A28BE472AA8F2E784096279BE5F81D13D7B0652FA1CA0A4B1A9E0DC6B9B
          B0B6DE4702DA62C048E29A00031204F280613595F1CC61F5940E854025816758
          337CE72ED4000188374D0086705B2E36B78C959275A58DE153B457093F53A223
          EE5DA319B21D432703068D2682C8819539048D0E74DAA492520C72B27525204E
          32A9584DFBACE6D492EF3B858DD9DCBF525D0355FB24952EECAEB76EB23E83CC
          92268EE937BFF5027CFC133F0D4F3CF9555E030B0B0B30180CA0556F337890AD
          AADB69C3FAE63A6C22802C2DCDC3CFFCECCFC2C73FF6319654C740C348190294
          9E96C3F9E47A5D751D1B97FAF8BB12078CAA77BE9635B42B9F9665DB78105D7E
          4615AFB4C4FD256B2EC31E94A0832EFE7A662D071A32EDBA84A7F117C924F048
          70D2AC97843BD72AB2ADB8AE2D308C6F0A1E24E3C553B69EAB44E62AFBA073DB
          2B6DE5C6F83B11ED5311FE7EF2AA09C6FE76A091A8D456809CFCF5758017CEAD
          21A7B8C91E5464CF004D5C62C05E54B5464D5436041AC6984EC7B1ED38090CE7
          2FF101FE78DC69A3D42E9CDE85E94362BC9A62F1E3D7E2E5C42A0C2759F8BB5B
          9665B3DB80908DE00134EAF49C14C4B40DAD8666FBC6B123AB7060751E1A748C
          013BCA9560D36FC955FD645C7B696F3E68ECC526EFD2776859EB492CF60B6DDC
          96C91B8A228A4905D5DBD981DFFED7BF0DFFE81FFD1C6C6C6EE2D8D7A1BB30CF
          F338E88D208AC47B6A6EAE03BD5E0F767ADBB0809F7FEEE77E0EFEFA873FC291
          FC62CC5699FD6B4D08818B76871C689879F212606455D5A9C11E4CEAA042976F
          EF7D2C5D07949B61130FAC26C9FA2980A56672ABA4F241E3CDA42025A031FE48
          E3A091FB45CB6732444606D195FC67F2E3A974C0F198FC44F87EFB815163582E
          A85075A475E1F779CE61E2C34F051A0096A72C7682D1631C4B593FAD313685CF
          C9EAB359E8BC33CE3A63EF81F777E0F5D7C45B182710D6DF23CB7DF98D017CE3
          CCEB70F9F26D4846787CAD256A2A8D124694B01E3A3692860AACAC1D8A9C2514
          043F470E34643826E809C6F583EE47514D259E615B39D59410AFC40582F90672
          FB3BA9C1895BA508A5164A1B0B0B6D68B7EAF8FB10258F0416E79BB0B4D88145
          FC7E71BE0EAD9A218649CC3CA05222B190349394AC9F40653D898A56E09BBBFD
          4D0F2C53E3A947F289895D6EA7095C36A907195663520D8A6A523C07C53E41BF
          13707CF9CB7F043FFFF33F0F4F3CF1040346A3D9845EBF87925D47E80682065D
          A3D96CC0703460BB46BBD5847FF83FFCF7F0D1FFE26F18992F9E0C1AAA003464
          36D2F5003E5D4865F054224A2CC1825D79C73153931DE7C4EB0A1F5641779493
          2DECDF29AD78B381A30234F20F62F5873A0DACD12650870CA1142414CAE4245A
          26947599B888C81322A0DFF0EFC1C8706CB898E87B6D98ACC46E70A316281B14
          E24C12D25BD76AE2B6172197321C41807F936E3D8E235368662F9C602A654C02
          2A37798121BA9EEE3CB01E3B990719B7ACD8E3EF39689071DA6D7CFC4C9BDDA4
          74D0E6F1EDBE08706A6FAD6BF8CA575F810B17AEC27C670522941E462372836C
          424CC13F38EE8936EE97CA82A9ADF013CA5D95A4AFC88E476E6E7304DF4A3EF2
          1C468251599B908D1296CF2A75E92E64CE9138E1FA20F0A8D5029436347BE934
          F17DAE5B47CE96D24047B088EF478F1CC0BF9BC6BD9754639A418F41959ECD9B
          5C5FA2B486CB3249747AA6E5EEB642EEF80EBD1D0748E0E9590908082868FF81
          B13501C7B92878FEC597E067FFE1FF085FFAE2E30C0E753CB689A0311C460C18
          412D64DA92C4944DB5C61DA37D4DA3F833FFDD3F80BFF5131F0399852425A85A
          99AE0A1111E5865923CC3C80A90311B263449C183E3E083C322C8FEB3CF19C8A
          C3AA38154B99965091F19DB7761078762B89634AB451614E5219193B98A8E1AC
          5A4F681E8D19A974EB419DBDF58849615F340264133314868161EA1276054F9F
          A0E8667B5F1B544B83409FFACBEA459ADFDD8086253D0973159188A0C6538423
          3AC963256CF020C7E482691E3608E52199D82B2BE4DB4D2622A2552904BAB80F
          99B161E21030806C6F6CC0F6D636BBF02D2C2C81AA874260F6641291C860E744
          A4842BB3DCB8ACBE6C0E25B0C4DF8AAF9359666F60837BC336D82A38631C52E0
          7E669023154FAC79DE622D9CBDC205BAD353F0C4932FC1D973AFC15C67198FC1
          C584AF7AADCD6993892920EE9D8DFFEE7902737DA35E61D098ACF213C95479C0
          6109402A711260242AC921600ACE3AD1C67E216724222EF1CAB62A05622E581A
          62F5D608BF4229A349AEB76D98479068E1F25D59EAC283471F80E5E52EF34281
          F80C838DDF60E94C89DACDB9FD027806F80AE5A5B6CF35593DA533DFEBE28B4C
          FC7EBA947B8176589AAE13801CE7119672DD89D1E3CB7EA134DA110373BD4E6A
          C01A5CBF7E03FEEDFFFDEFE0177EF117E1C2AB17A0DB994329A321CE13914886
          4C1C693E903ED46A21F771140D707E22F899BFFF0FE0E37FF36322694492F292
          E367CCCBAE91A11E713F6AA61CA18B8932868F40D5F87146C388030C43FC9B00
          8A98D7C430AECC7058A6D58C818D31E14F89721E7AF9D4B21C0C0A794FC5FC60
          6A8E69B2E39F189B67C20C75C434B55193B49CC478D670FC2CC36A17B9EFAA7F
          3741C35FD73437D49742D0B0B031AE847233602EA45DE72DE9F4090F55F0480C
          2267397E3323043A91800EB96B72121AAD25CC9816429994604387F11E3B3B3B
          70F3C60D585B5B834EA7C3AE799DA5251BD6BBF791035DC1CE2BD183C646576F
          081FAD42FE39AC48066743A2EF6A333A27A61779314E990529DC1DC4892366DA
          05CC85B0B519C1935F3D032FBDF82AABA590AFC4216EE1026FC170149BE110D0
          D0CA786B69031A964960F5413CB19796083B8365BAE4CC01A4D66453A8F39C01
          95DD3CCA70918971CDE58DCC1CA4E225417C2AA94A78F51277178FD8185EAF69
          68771AD06E8570FCC1C370E2C411786075113AF32D5036808DD7DC48884B584F
          37710E348800FADF153FAB2711EDCAA66147666FA0918285F9CF111DFF7368E6
          6D52BF225627D1156B8D267F2FD23E69025AF0877FF838FCC23FFD67F09527BE
          0A1B1B5BB0888C5DBBD3E639180C8C5680B8F0D88286624A14C743E6B83FF9C9
          4FC2273EFE715177EAC85B2BC290D0316CCB22376A02AF44D66CA0C25401C5E4
          CDB84AD376881313EDAF58639ABAF2CA6359D5BAAF87D3261665A2486F5B52C0
          18F9B96DA8F42E7E8CF0D947B89EC8832C6C86521B2C1689C9790806A944E2C7
          1F4DC4861982068D09DD8B248E9AD1EA8C794F19139633F3E52EE1D692333ED0
          275C1C548358C4D1D03C24FE4EDFB1A231148E8E454DE4106A4665C13A291070
          08AD6A4B5959B1424436BFE13DFA3B3DB871F3062EC60DD68D1E3D76141A8B8B
          E61A7BAC2E53747E26282010CE189F8D162171DBAA569767B1CF9154F44103DC
          A93AE08E9A61237585670005E9D186659D2C89DE142E4D73A5E539376E6CC053
          5F3F03AF9CBF0C6400A79752C82DD69A301C44BC30C2C0CCAB8D2A776957656E
          B5534FA992BEE612827B4E14C4165344B8646BB51CA1FFAE9C719CA50BA3DE22
          55003126C49DF226A08D4931C80422E44D9550C062C411ED21529013278EE2EB
          18AC2ECDC3C262978300F9E04CE22AF09E236B3B7144B54AD4601765808905BB
          5C09D482225B7CAF3D82863BDD0388CC67EFEF497A7EBA56DD800A3FBB3049BD
          ED6DCE57341CC6F04BBFFCCBF03FFFE2FF0AEBEB9B5CA37C1EF7671BF7EA7038
          825E6FC05A08563353B47F2CAAAB8002F5E86FBCFC273FF9DFC2C73EF637A53B
          89716876DCBEAC513666E32B0261E25805849F6B38E7A17D56939B3F418E9ECD
          62E40D1182CD142F6D128FE783ABF25EF63B9D3BD097DCACE6C41FD79A619239
          83BDD08B986BB9D78173488230707C0FA28FF408B1387C48BDF762BC9A256850
          1B0E251A9F548A943EA8003452E0B0567B5BDACF629B331BF16020C71645A2CB
          3304331EF620EEEF7084A7C29BB09BCA68083B6BB7616B6B9B5302908745C0E3
          10B2FB2307F7209A513A0AD0E2BE4951A3BA405496F43312E4C31C06728DDB28
          6D9067461D117B7971096AAD666E0477D1C83D33B1DC95F7B5376481B1E14426
          D29574B424EDD49BA63C227ED708A7C9207A1741C3CEDA84D4D2F6DEC4F55A23
          2611590277ADB4897B48E0E6F55BF0E24BE7E0FAB5751C11E2BE9B383E217393
          349FCC6187B236545E05A5CDA2A7CCAAF4CA540584940131DCA01043518970ED
          6B159B773148B3C4A295B36558433898BEAB50D4962ECC844003BFAB615F8963
          AA379AA6A88C10E384A407923888E4E0499D6E03E6E6C840DE40A6306415D628
          1AB2BAD5725F612DC8C48124BE7A0ABCD89109434EE36D33BC4E020D750F41C3
          19C2F3C44D498A8F04D9F720C6F730F78EDF878D1ADB0B7AFD3EEEC31E8E6B1D
          095B039A8D165CBA74057EE57FFF347CFEF3FF1F8E7F9D8F6B77E7A1D56C43BF
          37444963C8F60C020EA205A4BEAED5C5DE49CE30E4C6FDF7FEDEDF859FFAF84F
          E13175A639BC9E63998B00AF19B00A079901532C48864654ACA136A947469A1D
          709459D7B013C3C6B535B87EFD2AF4B77B48AFB0CF35C56AABCC486AEBB29D32
          06B2D6C5C86F352FAC5AC3BEB1BA8F9849368867ED73EE33D97203B129D26756
          4D0D07D06AB7E1D8C90761F9D00150CD80995102498574CD820C4BF1A55A98EC
          9EDA6DA37E92071B01789DEDC4B1E45D2B060DBBE46C2094250446579724261C
          3FB16E4E727212C1A0B70DC97007E2DE2672FE6BB0B6B1099BDB5BC875ECC0A0
          DFE381A51B2F22A741C49524833A9713148A410BA7CE4162092F16B790730C0E
          110532BAD1020C8C4E991091FA530F42B7B9B5BFC90A2CCD658648360E6B9561
          306C3FDD7E32E7CBE20DD81BA48D4049E0115AB5545C9143EBAE1B430DE7AB8C
          DDC8A942B2B36E8985B333B1862D6230273F7A1A8B9D9D01BE9013AC757053B7
          70CA69EC43E628C94640C703C4E3A061BD579436D1FE13473D93365B7AEF4912
          60D480BE4D23B73BEC343BB75B7360C089F0029E279A1F001BEF21844A16BDE6
          48F17E7F9B3D7744B72E40451209EF01A5CCBA4F19290E64B4EA0D1304486B79
          E2DC6AE39AACE3CCB38F2DD6D2B5516DF79BAAD9F136B7D5C675D9AF0217B0A7
          989EE87E4AEBAAD7EBC3CD5BB7616D6D1DF74007560E1C845BB736E0B3BFFB39
          F8ECE73E0FB7F173A3DE02B2913768DFD79B301A442C38702249041E5249D17A
          0B02C303E05AEA2310FD577FE76FC34FFEAD9FE4EBD27192CA9DD6826813445D
          83FB9ED4519C2B4C6C5B2AF112B0D2F4E0DAE5CC9A38ADFD2BB7E1CCD3CFC273
          CF3C0B1BB7D6607E6E9EED2C5B5B5BF2CCA09C1D8CD968939E86D68FE4C10ACD
          1CCB9811E3C86952287B406041235DD37C2E986B118366681C8530910A758800
          B1B8B20C8FBEF55178D7BBBF1B564E1E154D07AE4320ED45B36ED672526E07F5
          05DE3DD21666E4114469BFB8943C65A0A1DC4803587DAEB29E0BB889A26860C2
          FC7BB0B3B501EB6B6BF8BA05BD8DEB100DD625C534736435BE69B32146315211
          9024D1B4C4D523F2E2A953E3BBC725EA14CE5F431C2012E43A1967386FCD88D3
          59D04411805857BF52BD72A026DB2B589D12828BA52EB88E33757A3F59E26409
          463C8AA0B4DD4DD5940C960B7ECA1A5DC15B78A20A706EA9D61EA445D533C205
          1DE09C91213146A068D42947539709401205E255A180397291F313F07D386D7A
          8944690035DDF36609AE3120F245449271F391895EB72A0B65248DAC4BB4BD66
          BD1618413916CF142BA1700A0B5113B094E932C10A03C55981C2C011577B75DA
          F489071A1674CB1F303152FCE4F1A8CEF934C6D2EC6279187076A001199B9235
          C24E8A5D20E62AC63D4CDA823E02073951CC7517607169199EF8E3AFC1BFF8E7
          FF12BEF1CC1968D49006343BCC64D4E91D1F7D887BA31E36389300810127A41C
          0D9D1A90EC17A445F83B9FF804FCF88FFF450690F9F979643A97A0DBEDB22413
          1A6F958452DA2010B17293545011959632198987B88677FA30DCECC16D942E2E
          9D7F15AE5C780D36D73620C4B96B2198B1E757603D9B8C17A1B1CFD2BAB55EB6
          BC9F0D9012F360E536F1FC12D090C4983A1D5733A42488C7467A221513494801
          4A55117EBFB6893494A2E193017CEFFBFE1CBCFBFDEF8170AE2BD2062DE9764B
          9C8F12F212ADF37D8A66DDDE8F18EB5930A424615827854249C32E3FCBA13BE0
          D0296888111B2773730D5EBF72192EBC7A1EAE5D7F9D91B6D369C281C5262CCE
          052C7A5B54EE74BAD09EEBB0CA4936A470E66168BD1CB4B86B5A6F1E6573AF78
          C6BA313F52CDA2245D933632796C88DA206482111AF55069FE3B3FEDF098D18B
          EA3628E7D9E00FBF10614F543586A92436B991009C4BA5F500B241446391A477
          1D344C7F33F9CA41E6559977060AFBAB756AB08E0EC03A5726AE20D70983266E
          B22ECEB91277DBD0263A106337137595380F32BB85A649C89A5149BA47309E3E
          20C915944E8DCFA96B6E3A39AE9EB9F7999FDE30094AC70E44844B35F68F448C
          9DC2E9064CD49D806A6335020184585B1DBECCBB481A7EA2C4B2D42E26CD37C4
          DEFACB2D0C65DCD9F34113AE43CA03E0DDAF21E71A5E021AB9AD91F705E20866
          720C20E333A9A648702310F9CC6FFE16FCB37FFA2978FD7A04DD1648A47DAD85
          B4BD0D9B48C07B48C89B1CAB31902CC9641C669B460D5F42F0B7B706F0B77FFA
          63F091BFF65761677B878918A90CE73B0BB0B27200969797A189928B46D0C05B
          72953961004C075170B8F6CA2578E5A597E1E2B957E1E61B3760EBE61A6B248E
          1D3A0AA74E9C8015043896164C365DAB5E74AEB9B99434567AB074419B710CEC
          3ACBED349F4F62A76132032148229BCB5A951A32D4BDE1005EB97001CEBC7006
          8EBDE504FCC73FFC7E3874EA843040E4A5DA6E9B1423A4AE622F2657BFC6DAA1
          BD2D5F2EE9DE4123069C3DB8C896320934A891DA8710B566909445245223118D
          1FEEC08D4B17E0DCF997E18D37AEE0E2E8C1EAEA12AC1E586517B97A2DC24968
          33374752038BF494EE181702838421ECA1F1AA625B4810384F12560969A91435
          4906B313A993C4A92E124320C2C0708289E5AD83E20B5803A0379DF28031B8DA
          CACE085BCEF5B9C9F1C1C47A5F789C9C4DCD3C4D3A82EC262D0F6494E38AAF2D
          125300E3163E5F2F012EF586554C82033FE0F9611B9231EEB2674AD03060A41D
          E7CD6492EF9B78F7F7EEB8C735CC5EAF0C46367A17329B859AF52977F112E69E
          8143452D1E2AE6999D76551B66C1FA58BBB91D5B3442D021AB5AB22A08BB1682
          D21821BBA68C6E66824D4352B1DBBF27D934F6D88AACA9DE65055302F74366C7
          18D7E3806D15313B53D4EA0D943806B0B9B50DFFFEDFFF3FF06FFEF5BF83B575
          8AE3180988E3BA2157DC2816906EB544DBD068341940883921FB51BFB703EBC8
          989267D1473EFC41F8E11FFA4F19B4B7D6D76140C90D470A6AAA0E8B0B2B70F4
          C8715838701800A5190845DDBD79F5369C7BFE1CBCF6C279B8FEDA1B900C2388
          108092FE08DA78CD36F6E1E8A1C370FAD4431C4068ED5289F55FF03C95D2A0DC
          D4DEA3214B136CD95AB10FA50C44663895ECD390FBA8618052C36034625B2C5D
          FBE2A54B70EEE22BB015F5E0F8230FC177FFE93FC569566A9D36748F1D4424C6
          2B0D86A236437AAABA352657513C92C46EA124EAB4FB34002FCBF32E9BF59CB2
          CF38061A246613C7441E072C6AE1248D76B6394273D4DF81B5DB5721EE6DC1C5
          F36759BA989B6FC181079651145D80168A4FB122B5550F1751026DFC9BDCEAEA
          4D515DB81AC001A9E86A46911978AEB53221AC2A20F7015D6140B66EA1390F27
          3740CAC3FCB1BA0D968DCA6FBA9C38933B7CCF6D3752854AAACFAB2CCA610853
          C6DD23E736A9F286D25CD7CD0C3A62ECC638C346150A85DECFD58F5B346CEEB7
          441885CCB12A776CBAB1D3B5903B6EA29929BF4E2634F2E90C55B9D151EB8A79
          B386685F6578A7711A935A298B01D9D9994295E6A41AE5F69D9550B98F482FC4
          CB861C0DEA2C2D90DDE1CAE52B70E9CA25943E1A6CDA230299C4E2A840AACED0
          3826B49A2DCE3D459F49873E8A25C3EDEDF59B28812470FAE47138B8BA8AF71E
          C000C164D88F6167B30F1BB7B660D4D330DF5D81F9A58348536B6C771BEE0CE1
          8D57AFC0AB2F9E875BAFE33586091C593D0447961F8036024BBB51679BD5CAE2
          229CC06B13534B2A770A164E4825CD8A95985570A1B1D031672F8BAAC456E54B
          7E1E68D8290E644D70E43CA9E36B4A024D9106D2F89D7FF555B8F4FA65D8190D
          F0596256C1D1981C3F7D1ADEFDBE1F80DAFC9C98737078FB6B6B707DFD36ECF4
          B761F5C82158397C803D0B231D317D65064B2BE7CE3CAB560C1AB1A024A78E46
          9149E303D4420D2F3FF30DF8E6D34F22428708067558595E84630F1E8266A701
          9BDB1B3C09CBAB2BD099EF0A171688444188685DC6247621165737480A899D48
          C6D5797D6CB04D5662508E40B8B4C9F9C53FB6B92A6F92BDB6BE83F3DD3D75EE
          7279637AD9A4260618CB6C336563A53C7C9C041AC64BC94859A94F7E7A89C4F4
          21B02ED563E37197D56CE61E3A33DF930EF3EC1BF22137A493C6AB08EA0AFA60
          B2A9964282AAB8924EFD112781460A16BB018DE9E2347C69AC6CCC459D66CF0D
          D36B71E607F184654F3A24B6032480AD46C71058028825733FBBAE42AF9F4E9E
          35DF8DCCE7BAB9C7060C758F897A8D3228930A385680B802BD8D116CDEDA86ED
          ED18B63707F0EAB94BECE51721A88449088BAD055845406922A5ED2028B548CA
          412E7F8E185CA4577348AB560E1F12C68CFA566F88B4C2917E369D88922EC7DA
          C7D9E2CC836E5873842248C7D2AA9368F5903D831D3B9056923DE8E5975F820B
          172FB0DD630BC191067E7965054E9F7E181E7DF431B8B9B305D736D6E0D6DA6D
          B8FEC6EB70FDF62D085A217CCFF7FE5978E79FFA2EF61A25C69D6C8C5664BAEB
          A0C1CF4D56FD68C44001147F30ECC1734F3D01CF9FF906F4366FC342A7056F7F
          DB2370F2C431F62819E2E053F53372332557C6B0DDA44C70E0387C028C5AE854
          0360544ACE8B46A5C6CB74F14CB3792771856ACABFF3E7157063FE2228EAD634
          044C85DE3179FDC2A43EE6FBA5A1F43E551C2DBF158D43995C906B89491667E7
          B50840ABD281DE519BC0212B9FE8151ABB323AF9EC26B612A49A708F69FB95B0
          E340699A900AE94F697FCD43F1B33A6AB31B51B74AD248E7ADBA5E46D9352580
          3306911E28CE829C52425641C5EC8E4D9E52A4BE12EFB53A4B18606C49E24086
          3467341037FC505CB8233DE2342F145F13C57D3C64204E6B1C67892C8EA68499
          4D18F513048F21DCB8721B5EF8C60BB0B3D663A3FB6267010EA0F4B1DC5E6295
          941E9106A5C105B8C866D2EB6D411B69D5D2A18360D2190390575D606AFF2639
          09DF4BDE695CBB0A971EB724379E7E7C0F4FB9A87F25A099D116A20182DEF9F3
          F0DAE54BEC5CD41FF4E1F0D1C370F2A1871084477019A5B60B975EC3CF11F490
          E626F50096B1EF4B0797E1A1B79C86D38F3D0A9DE539DE1E24AD391BC41ED553
          E3EB76CC7BCA7889B03E2FC1C1DE8417BEF914FCBFFFF67750AC8BE16D8F9E86
          856E131E3A7E1416E65AB0BEBEC6E2D5E2D23C4A1F1DE31AD6026875B8068309
          6D04935CCA0C982060626C113A48837520B049E7AA447BC7BB4FA0BF2AA5151E
          315499BF35E49F7E8C1B73442FAB53B6DC59B69F6544CEE790CD351380E90856
          BA2A27D2E3921EB8B1DAE3C2B1E2B9CB9964ADA3D6B6A024FB68D97B790FA751
          A768F31CE5F548C670C2B7198C1D398D0A27F79DD265B79733AA823AC7CCA56F
          56ABD86B96E864B49056B16FF74C8DEBC3B3B7227BDB906710057DF6D80D9554
          5662EFA9C96FA149C8A76D912E76B6058A9321433A29A8C9AE1130BF19720C0D
          0411830E8D2B4552431C22B999C7A96881DE4960FDCA3A5CF9D645500305DD56
          97ED1D9C5D198F1B6CF7F05DC15C779EAF4FC5B736B6D719340E1E3B2AC18984
          48041ACEC865A50D953EAB4E831026CFA8CAFC9D598CF6A798DDBBF89E5CC08C
          BC3F91D05FBC7811DEB8720506FD3E9B074E3E74020E3FF820BCFACAABF0DC0B
          2FB09C76ECA193D09AEB408440D79CEF40D8ACC3EA9103700499F8FA7C8BA783
          68F23D030DBB2014C8435DBD740E7EE7B73E0D6BB72EC3DB1E3E0E2B8B6D3879
          F410AC2C7481588498BD978C511BFBD5E876417511D951340D1A6D514DD16099
          48639032689EEC9E783A686DE647B8EA2A35442660C69F246FA13BAEB848F96C
          D35594100D5DB8A9B5B7897C2EAD9C006540C357ABA93CC9CF5DCB0F2A9A7087
          A0223163463335A955113913FDAEECD8E5B8AD698CFCB359BA76DB4EB89A8271
          80CC8C3DB5BDA634D795A050ADF699E22E77DBB30EAA25A2223564D6DD99F69A
          107A7AC58381F15E0A59EA60E9A26619C8C04C9FCE4D2112D01A02C7A8CF9247
          40A55D4DE02C2464DFE8B364276EF421C70725118246D0E1D2C3714FC3F6954D
          B8FCCCABD018D51034E6844F8D4888A8F335DBC8CC9247D780A48E5073DAF5B9
          C5793842360D5213F1C1214B3A521AC0481A767C12432BCAF0D5D931023774E3
          6B4099BD96B04D97EE432103D17088E0F00A5C7AED2204F81D95233EF5F02370
          E8D18761EDCA1B7001BF6F227DEDAE2C7340A56ED4E0DAED1BB08D6373F22D0F
          C389C74E717902F6D0AC8BAB2CB57B60D390286B8A81D0D1367CE54BBF0FBFFC
          BFFD22BCE3AD27E15D6F3B0DA3DE3A9C3E71040E2E2D2028D7A504666C83FD02
          16ED46F516444D44749C244E07109AB29B81043C0159E243FB1036DD8411D72C
          D753B5A72D7AE77CF521A3C3D6295015EF964A692693FF2A2FFD5811B46A3E6C
          D643FF6067BC370B3228B948A201AA98D62A82CF6AE42AD6B8CA4E001EA68D83
          86DB5065D8398BB5AB4A00C37534A72FD01E77CCBF56E403ABEE44F578553EEB
          3483712FEC4453805BCEB4E7BE33FB90F304F2DE6EB2770F7DCF448BE211987B
          0F8CA6C110CCD846F4991C737C81111B8A9348B3019755DAD4C8A85E0B387121
          12253C8552D8200D8928C77D0D410A902E25B0FDFA165CFCDA2B501FD6A08592
          06A710A1848421D92F12F6E41C0E46081C11C784F4870358403A76F4E483BCFF
          C826AB8CF751ACD3B81B4B742DA90C2AEC87964CF80CAC1D40D932480B6DAC87
          090F20801CF67A70F6EC59B878E12282E7101A088E0F3FFA289C7ADBDB606B73
          03AE5EBF0EEDF9397CF410D611F082561D7AE430102670FC915370F8D471045B
          136240B146A6A4C35D070D9A68B267909BDBD6D64DF83F3EFD4BF0475FFC3D38
          75FC201C3FB404471F5882D5C50E749A35589C9B83857687F770BDD680BA41F2
          1E4E5754EF4A8C8306935E446232482AE174153A3209DB0293AF4A997568A278
          ABAC8836DE814FF27C946D709AB211CE46A1E20B186E22CDDAD7297EF8EF743A
          C77CD82172D953B35243751097BFC874EE4D5773A4ACDD2BBF89D63E452F1A2E
          C51B327B448EAAE725A1DCB1CAD3D3A6693BBC3E163BF1678526E59937260856
          55A691C44AA5639737A57B15A49BDC31863E770C2647D62E9B36731AF8CE1AE3
          54D566DA75DA319D9A5244A0361235940D59F978A6FDD9CBBBAEBC9CDD143CED
          41E0DC976D7AEF2492A05F0A861D21F1ABB5DAA2CA41E247B60D9238C80B49D2
          BB680EBC0313354FE328EA27A43BF35D8EF28EFA03E49A5B4C37E8734C188234
          87838A91C624E47A4A85C0E23A72E8946EA306D1ED085E7B16B9F44100CD7A8B
          C181B2CDD4C3268C8612A0C6EA2D0213ECD3565FB2621F3E7248D61548E026E7
          D2F3924DCA79C224B9BC66E31BD0D1145E99895734C9231081997C316948AC1A
          7BAB529C9989D3B8F2DA651EB73AFE76FCE443F0D677BC03FAD8A7EBB76F43A3
          D38608F7F1B5F55BB0D1EF4177A90BCDC52E4B4B874E1C83804A1887B2AA6CDC
          DB5D070D49321BB327ECAD9BD7E097FFC5FF04AF5D78111AD0E7FA02DFFD8E47
          A15547690445A943AB2BD06557B926CC75E661797515682D6C935B5DB3ED952E
          4A69094F0A00D7000E287683E2384295436F49AEE76BADB3A641E562129C1BBB
          B7292591AB8D1948154C4E13AEC16392558650E58B4291112E235C980593682F
          A7FF1DB4BCBA619A885F06419D563C2C9CC8AA45A1FCE049F0EC345E4C802D6C
          42DBDB2F326326D02F0B1328CFAE610F49CA0DAA9660DAAA67991C47C64E9407
          89229F1F57E0A70854C08286CD9C96336B7820B2B726E8C79973B54AD71D78FD
          B1EB3449159DCEFEEE07257A6B391F71CDEE9EDE7A9C1634B4778ED2AA1484C1
          1B4F3B4F634596E81A81F4877226712827EDDFEC0290ACAD232A9DDB123512B9
          B152253FCAC94441B8CA54868C8501E3BF39EB00E51601E874BBCCE75122C346
          8BB20ED4D9C5B68F04B24185B2B4E4B7A25C668AEAD3EB26675A0E551BB66EF6
          E1E5A7CFB1AAAA814041EB917ADA42F0915CB64498233612D336DE46D0A09080
          43870EB38BAA2D091123C1D686D90CBC4CC41628B9D058412A21B6D3BAD88E9A
          3361F87B3330BFDBF4FDA1490448AA2802910B172FC2F5AB57A141B9B7F07E87
          8F1E85538F3C0CB7B7B6E0EA8D1B2858291850DF104C6BDD36F413EC6B238087
          DFFA1678E8AD8F70A65CEB78AA39479B80FC5D070D120F431473366EDF824FFF
          CABF842F7FE1B3D0ACC570EC3049195D586CD7611E07FBE0D2328A7D03986FA3
          C431B7608C4C082F94CBA75947C9A3C9919B3EE1E5C464812930C209DB4C223B
          E7566A8D362188C22B2722E874122C899BE45028C169B193155D3E7C0D29E764
          D23DB808F8FCC6320B253FE82E6585FBAF68F3CA85129F432F98044BE88A0981
          497E278394B1B2B8246A746809E76C03FF34C439EA997D4FE25465A64C949E67
          BA71FD4893F1652512EDC665325BCC429393D6F2293EC613FCD960B9F4DD5489
          53CA781F6575E3BE1B762A3819692E1002CF2921F61814C751D09C65C4E43E53
          CA736435A50554E074E32EA2C116DEB169F355BAEE24B7939AF87E67A061CFD1
          8560EC5FAB54EAB34F93E4815A505239678E985DF4478311136072DBAF998C0F
          14242CB556ECF53DC3BA9106C50C4E195E43AE7121C1F5217B59D19051FA7A2E
          ECE56844083B5B23D8D98E383B4180A071F5F57578E6A9E7211E2A96341A0838
          041A54D488A2BF39CF55246B8F0CCD74EB03C8E81E3E7218DAEDB6A9FD430907
          4D8137A59C2159325828CE3E21DEA5912B2B9C891CE747929C759656C912349E
          87712AD5116010380C0743EE2BF5EB95F3E7E13A8243BBDDE0F429F30BF3F0E8
          5B1F835BEBEB700E018568EB10EFB9B0BA8CA0D1800D04D4B05583EFFD8FBE1F
          DEF667DE09B63611DB4AB80315C90D77D10A0DE194BA1818ED7BF03BBFF5EBF0
          6F7EFB37F0C03E1C58A23C283D3872600501E42004B890BA38D88B73F3B0D099
          637D6103C5BEF6420786E4804751DF26136468526D87E6BB46A36E2AEB99B299
          26AF8F2C4125C5520C5ACB3A1B278A4929972EC44B7915DE529592CE2CE0EC39
          59E8216EC994DBC9E8AE2411AB975BBF70F3AA94839F582E529B78120D1341C3
          6CD6B1E8EA226E67E24824269752614721433532DC785AEA25D0F62F05E36A39
          65C6BBBC1E84A4BCB415D5F24199AE6660E15C802D4F1BD87A06811B14E94B6E
          73D83AE2B620932F5DF1BCC520D977ED7B327148B2129ACC1727CBB313A6C6E5
          4E0B767E4EAAC0BA6B9AF953961D9DB846FC770DD38286FFACD9A8F2FCFACBA9
          C0207F7D61CD925867AEA9BCA24C928F2E62D0204F29DAE39CD2C7ED9584350A
          0C403A2DF1C6DCBF92720A1A17D7301E486434E7E823F7DC06EF1D020CAAAF41
          EF14F0C79E5824296C0F6163A30FFD5E847FD7606D6308679E3F87E7D4A1DD68
          F33DA99A67CD481BF43EE80F98F5094D81A385F97958595E8256ABCDC0566729
          2A0D200D4C2A7D6DBCA86A4CBF42060D4AE24901795C84AE268956EB9C6D37E4
          00C694D6880D87EDC5268B74A32E859F485D4F05A1D8868CC75D7EED12DCBC79
          136A28316C6FF73858EFD4E9D370737D0D9E7BF125E82CCD2370449CDDAD472E
          CA08184BAB2BF0973EFC2178FBF77C1797A8609A5A0F0D68C0BD018D28920D41
          13F5AD6F3E0DFFEA53FF1C9EFCE32FC3A8B7CDAEB62D148D1AB8409610054F1C
          3BC60342C9BE96E617F9E1EBF8C024A948C112416B4A5448284DA9870363C760
          D0082D1AFBAA0A2AC6A2B8646C9E37F78963B9C865CA217A71681ECBECB876BF
          2E4A91CA46D68E9FA25A198E470024CD243949110FE6DCC99BD671E7853A02E9
          970F1ADAF701773AAB92B15026516069F4BB66558095167C829E26B4F37248E9
          B49FE91824C6BE3F1994AC34218E294591FC055E669E623251E932E132A2864D
          568EF05A89C5BF9655BDA5A0C6D2DF3444B91034FC4555BE1EB5A9EB404DD67C
          7E4D1751EA0A509FBA558DE7E47E8F5D49A5CF9CBAADCBDF3407A48FAF0512F8
          49EB8880228E63570215B8046C6CA41ECB7A2863AA135D1AE59E0AF15C623EC9
          66D1E9CCF3DED9DEDCE094FB641719F677D89D94C6912A466EF762B8FAC60DE8
          EDA0D43152F03482C6102FDA69B6399921DDA3819206659E0EB54803042814E0
          477FB59B4D986B77983ED1333688C9B54E39BECDC6E49852A6260BCDA9947230
          45E41C731C0AB30BC66BD44A18D61E1A434A179594A1D591713CC2BF6F5DBF09
          EB9BEBD01BF4799CA8B2A1465AFBEC73DF82679F7F0E8E9D3A094B070E70965C
          328873768D56033EFAB19F80EF7DEFF7B1DD4712191A82A182522DC46E5AA17A
          CA5FCC64D4FAF297BE00FFD7FFF93BF007BFF7391CF01ACC51C52D1CACE5C539
          388828471E542344DCB9B92E1C442984EA1084A110119A084667CE6E1B88815A
          CBC0A5924676710BF71E828BBD579E40E064FA6A3753CE419489B5C8E9E04DBE
          FD323F51C9B104465AF0BED7CAC5032B50E5D7C801CEC477ABBCE6CEA78A6DC5
          DC629A26DE27FEDAFC5D6DD3B0D7F607B28093CF71E74AA5C491F2E548BD602F
          992125F80BB4E11AE5B293D42B19D5A053E298EBEB3C31B3FDCB122A6DE63551
          A98E59F984CC2488B4590DD2736DD11E011AB7A9AAE664423230A12B89E9A907
          8A4EBD9AAA0C5349C3D72D8F83CE5D6B155853B5765C32D109D2254769F05445
          ACD6B1B78B4D8D35655C6DB9E68EA9196EB320B8BA3820C5B568CC46BD116B1A
          5696579188D7617B6B83B3DD52B031D95A297EE3D6AD5BC8890F709E156C6EEC
          407F10C3D62081A75F3CCF3535A8E402A9A8B401AA4EABC32AA06E7B4E404289
          9754B7DD85F9B939EE2319D849CAA89BF568D58ECAE4A44A57A7943FAE19ED89
          2DCDC0B61276244A38D32FAF3AFBACCAC8C9864921B0A9F11A369A0CA3B2A3FA
          15DBBD2D18E17576FA3DD8DCDA821ED2D608C7EEFADA6DB8F0FA6559CB284974
          17E7791F74E73AF0C9BFFF49F8E11FFDF3F85DD7E450F3D5EF77193452914AB3
          8E2FC4871AF4FA70F6A597E1D73FFDABF0B9DFFD5DB87DEB261C7EE0202F943E
          3E60ABDE4031AFCB40D16D35F121BA2C7AD1DF94988C6AF036D8F5364C255E25
          AA9FD045576A474444FF9C4D2352F4E0D32CF694188D736A198ED97D93E5C6B4
          4A894EE67C23A994338A3E6854A8A726A81C84BB8F252BAB235299879C8EFFCC
          44DC173F6B4AC8155897E0D4EEA08CFA284855D1DA7ACC98C4688172864EBFF6
          5E5A834FA7F50F72C43263DF703F050EB42C28240A8C94607F87F4775F0AF5F5
          F6CE326C0086839F62D893A4A1C01981B37D57AE0C6D6274DE22D16AF73BFFA6
          ED98CC5675503CF5E5FBA4CA7BCFDA9FF2D7F16D8B4D728935D9ABC1A85D12CE
          7E0B9C3B29C689A3F4E7AC90D36697ABD47392AB0253766425AA297291A58259
          44B0E3615F0ADB512D77258676AAD43944A068353BD0EB0FE1EAD55BF0C6CD75
          B874ED3667FB905A3D5DB7BFDB4D02913AD2A2167B7A724A92B006AB2BAB7060
          F520F783EC1C1463A262B15FE429863639A3B896060250B35167751A8D037D4F
          C6FB6834620F526DCACA5AC656D685A7DE53E2F4CDA5889D7947BEA7487002D0
          5BB76FC1A52B57E0F6C63AFCC88FFE18FCD85FFA7178FA9967E0D933CFC19917
          BE05D76E5C4720B9C1197AFFF13FF9C7F0A1BFFA97A1D36D73DD228E67E1ACC3
          B33582F3B314D5083775F1446F494422116EE1EC0B2FC3677FF7B3F04BFFEA53
          700B3B4CAAA6D5E565AEAFCC591DB504F0B59A0D93B5B2C12E6D34B8346134D0
          AC9A0AAD8A4A992237D6B7394D57CD3DB029C5BDC973861E800AB1CB12B9C93A
          67BB10266E164BA0607CE369A7D7B2E336B91F556DAC52DAD815B8BC0CA4312D
          E3E7EA8A3E485C922A3F4A81E300FD34D0B69684361E28FED8E5D585A50B541B
          8107D2AAF2F671FC34E72E68CEAA312C7152CAA8A7D2C0296771F1FBE1819795
          26B591721C967B296C74317E96363F20BCA83E3813124F87EDD2E33B75476254
          7B7B8D17A96E7B261A46BA2F030D4824D097EBE310F78D04B98F0478A7370017
          D447EEB8E44E6B8AA371ED12AE0A27D9AF7518310D60EE1BC505B63FE0303548
          E9100FD9C63AE86FC170D463BB288DDDE6E636ACAF533A907958587E0036F17E
          972FBF01B76FDFE68E919D81EC15D42FBA27D125A2430967F008519A3980A071
          8019DA2112EB0409BF326515FCD80C31865BD0103B0CF5DBD6EBB11E55D6CD3B
          00795EE55756340C0CFDAB87A2BE22E9C4820EAD894EA7CDB56B7ABD1DCE2F75
          1941E3F2FA35F8C98FFE24FCFCA7FE1704D4042E9CBF00679E3F035FF8F217E1
          2B5FF943AE94F8894FFC147CE8431F84A5E5052E7F4D6A2D52F51148556964EE
          783D8D4B1AF4F0437691A31B268970430199915024DADEE8C357FFF8ABF09B9F
          F90DF8BDCF7F1636110D9B8D8073C3B79B352E81493ED841127045BE5AA32E52
          87A998566763B8A8AAC4E5369D1C6DCA2306469C8B83049CE7CBA4C5EAADEBEC
          778131947BC7E6173D9483061F1318E3ABE3D20D479EF1129A66D795FF5AD60F
          E2D90834F45809D5142CCA9F838D1AE2AE5AD25D59C0818BA5B1D7D5A6C090E2
          AA68E29A286A1E957DBA3286558BCC6161DC0718EB0566636092246B4FF14183
          5AA2FC39C90DB132B52DE2D8D98BECD8B874E9F48CF5A0224D7B0543A025BDBA
          EDB775CAB095016D5D17D6DB1B69837FCF048B2A184F6B32BE36AA5AE50AAC38
          C01FA349BFD398E60B96A5B549442266D7518AC930AA910115B7C0354386DA56
          ABC3AEBA5458CDDA2A6307D8A252DCD8BA095BDBEBAC569AEB745983414E360D
          BCCFEB572E426F7B0328CBED4E6F8BF7C2FADA06DCBAB506278E3F041FF8D1BF
          003FF8433F02870E1D85AF7FED2924A65F418EFC5978F9E5B370030184632290
          EEB4BB5DBCF61CAB9748E5DCC5CF73780F9A2B2EABAA452AE552D52A30E59E95
          070E1158C956A900B4E709688DFA52A44E1B95944A73156B89414B0C8DA34A97
          249D10F8502D22FA7D75658507F7CAE5CB5CAF658932FBE2D93FF8C33F041FFF
          E99FE6A0C39DC1109FF3018890267CEB5BCFC3E58B17E1F0E107E0B1C71E85F9
          B92E030E5DA341CE0041FD5EA8A7A45C270DD64E0FC52444FCC5C51576234BC4
          3D183B35846BD7AEC137BEF1147CFA577F059E7DFA6958DBB8291C3107C7A0B4
          516B49509FE1D6B51928F268A06382C0E8FB32368DD4CB044C119FB4A7E3043F
          C91B84CD2E734139868BF339E24CD125A8068DD8FA3AABECE64EED2F65DCB579
          8E3BD2298F1F2C5E4BA60056C6FE10BBBFD3188BA2BE28984689A5756AE8B3F3
          9272FFC0056E58D9164A4A6B650B02DB1810028520DB6FA77ED1A151EDC492D7
          CC0325FBDCBE0B713AE5E9BC39D0B076AE4CDF539B98ADA267FB1E047E512419
          610A2E75B631BBFE12E9978D3761AF1865FAE69474324EA159CB4E05E5078279
          11C45929C45F47463555A93AAA6ED581FC154C8B610CCAE23424C1AD2AFC9B9F
          9B229A0723530C2D66D5C8FCE212BCE5B177C0F7FCE977C391071FE4803F0AFE
          A3DF8817255021DB13E9EF47511FD6376EC01A31A1F5261C4009A085DCF22205
          FB0D07F0A5C7FF009EF8E32FC1E6FA0D180CB639B92155027DE73BDF053FFEC1
          BF0C3FF4E77F0C0E1D3B0EDBB7D78D3652C1F51BD7E06B08205FFEA32F23907C
          1DCE9E7F05D6D6D698696DB4240D3B2552A4EB90F4A1A46C1FAB9828D82EE024
          8CB1A8883975BAE47462BA12A4F162106BAF964FCA045B69DA2A7ED94394E8A8
          8A59B549CF4D36977AABE9821D1F387880E9E0FAE606BCE7FBDF031FF9C85F83
          070E1D82EEC23C1C3F7992EBA9930437BFB080E747CC84D31DA86A2A85377451
          52B16EFEC2D88563B46BB7CD315DC5360D21000214B113A1F37EF4E46E76EEEC
          59F8E2E35F84C71FFF023CFBCD67E0EAD537782135914B20F73841661105C3D0
          3E80767951AC6646A9946038CDBB2FDA8D6D26AB3716C35BCD94768DE3C47DC7
          BA4B6D323E82CE7081F90D5DD4B241D8C5DE2C790964371E2F3E688C05FFF130
          6817499ADDC945C57A54F1ED598F5ADE8FC4A886F2EA169EB7404C84541D2D44
          4E9092BE4566C307A13836C4F190A547ABE2A44DA728DD83B6A9B00995627ED9
          75205285756C30B62D7F088A86D4A9962CB391AA05582262CF05C5623E7DCFC4
          C194C7248E99BE8F98136BF0EF4434689D0E7676B8AE036DE05E7F8737648B6A
          C1105D202F194EF7A04485A20371E9347EFFD690E9B8CE40B8D0AAE9BF3386A2
          F00AD501A255D730635E051A6360E14044B3330457D124DBA5AA23D1EB41776E
          11DEF7FE1F840F7CE02FC0C9D38FA264816342311348B087380FDBBD1E84CD06
          3428934434E4F2D1C486B4F1F7A5EE22DCBA7695A56C2AC5F00BFFE4E7E0B77F
          EBD3B0B4D08263470EC2DBDFFE18BCF7FBDE03EF7FDFFBE0AD6FFB2E085B5D26
          DEAC56AF897B2F4599932713B9EA3EF3F433F0FBBFFF07F0D9CF7E16BEF5FCB7
          3806C2AA8568784812227A364282BCD09D674D4B628212C14BBA490F2C091575
          763BBAE59A06E12AB781650F27E61AB4F4A95ED1C6D616DB7A5B48E8073B3D96
          48961168497DF79EEF7F2FFC971FFD1BF07DEFF93E989B9F778E27A4B2A36B53
          AD221A6F5BFDD46A4DB2F1477B77B4B052BF5D63A595FBEC81992A68E6454498
          5E3422A42FA463D6D7D7E1B9E79E83679FFD263CF5D4D7E0FCD9976167730B6E
          A168B8B9B9C9EE693E4746AA2BABF6884D62307B7D5BAF4155EC380EB031E0C3
          3ED2F57AE61A7EBFFD07BF93A66762A8AC4A1C3579FCA9D9F0BE698E9DF414E0
          02DA4AD4606108B67A599A36C294810D68F38530C0D730D2D0DB19B06B3670AD
          F7064B18C4BD6B531F9C03D9288A3CA10D1C88A441BF503D043532AE8CF65E72
          FF6CA0656A34CCBFDB12BAA95ACB385078F6185213B847B77F2B8976677501BB
          7B2B0608AA1C475E2FBD9D6DE850BE34D26F23774BC6D706A9983831E7487204
          29E3F3936813C4A59DF46CDD30D367A970D44874758EC86940A3627D555D83C1
          BD82B8E4D7977F4D4A9E476349866E367C874DE8F52204DE181E79CBDBE1AFFC
          95BF0E7FEE3DEF4562DE4290684380633C48A44E3627343551D154DE958CC5DB
          1BDB9CB38A2AEB1D5A5E8468B005BFFA2B9F8233CF7C15BEFB9D8FC2BBDFFD1F
          C29FFD33DF030F3D7412DA9D05595F642BC1B12715189568A0DE92619B5AABD5
          E277BAC72BAFBC025FFFFAD7F9F5CC33CFC0993367586B428673B27B0CD98E92
          8CAB8C9D979ECAD0B1C2F1862ADB9E30CDB4DF986621F81260513D8D95951578
          F42D8FC27FFD77FF1BF8CF3FF8175D4C4864EC453CDE26A0B0686EA60F4998BE
          6D6F6F33835563B7643519347CC0C81B3CE901E922D61E410F44AE62F44E1726
          9DDAB5ABAFC3A5D72EC3CB081E3451AFBFFE3ADCB87183C1858E15A920E66BD1
          CBE67F77359B49979814AB5BACD6C2A1ACD707BA167D478B808AD0D33370D244
          53AED4DE67FA7C2C7B21D6B64D0F1AC5D7ABE618CA9FC580454514B45D88457D
          104D138AF2DD6568B5E79088E2428F851813E11F50EA052591BFEC1967EC494A
          4BAD05E5CAE746729C21F019CFA220E5D2CA24B7C064068D4D724DAB56123DB1
          D4A0B75E2E627F327119B4BE42A93D3F8A62A99E1699B5AC289AB9CF223EB995
          27EC7F8F6B27345AE968245E5F8118D145F4AFB93D42EB8AD61E7D26224515D7
          22F6E3179D7891819D5901CF73AE307D07A4D1DC45C391E6571B9F2FCB7DB21B
          6CC1B5C171C3D5A021D7CC3B6C18C58BA2C0BC11E7892229A3562326A289D206
          D5FF9E83F7FEC0FBE13FF9CF3E002750DA68E0BE8CF199FBB1D818125C3FA4F2
          A1B91C0EFBD069D5D96B8A82ECC8957FEBD60DD85CBB06F39D1A9C3E71188E1F
          5D81C585B6A865386E6320740001895452C47DB3679BD16CB0FAD0A9C6430675
          4BD3AE5CB9029FF9CC67E0D77EEDD7382539ED21D258D46D36E7DCCBB6A40AE9
          A768769DECECECB0B7147D26D5D6E9D3A7E1C31FFE30FCC8073E00878E1C61E6
          DA32C3B6F1BAC59718F77506C47C478C59349F1608B0D727A446CFA96EFC0ED9
          772BDAB90B65065773D2C3C43C1CD90546C311FB1CAF19C9834541B3D1183470
          326D2230AB63B691D06687A5A21E0D9C968019859B9C160E152E79F1F917B8EA
          157118AD7607ACDD2E0CC5973AD156FF0CCED89EDF84F97A41D6C5746F6D8A45
          66C7DAFB3B35305B023B5901C6DE4293D409D691D6BAFC1895423E9682344763
          3116202A2B5245751656E0C1871E8163C71E82B9B91524C054CF3980C130662E
          93BCE9C4B86C9D2D7936852869D33FBA49103BD048BC7C55818D6B284B45A26D
          3EB0C49CEBD53137760B6B67B09C3F31137D5C2303DC9C0C169C2642E4215249
          25F1506C6FB416473B081043963A743C40492310D54282C750924D009762857C
          F15D8E27EC530BC167F5C00138F5D02978F0C471585D5A36594C75216868E3D1
          66D75D51EE290B1A93724F692F10CDFFCD079A0054E1B5DD72301E0193D45396
          CB16B3599A4E84253673DC9074F34D727A6988F34C50C7318F61737B88DFCFA1
          44B004EDF925985F390043BC469F5C6A491548004EDE4AA12419A5B21614C53D
          C0395B9E9F87367EBF76F32A1C3E300F8F3D7A0C102F4C7E62946AA291496322
          761432AC375B2D563F12DDB18C2D1F4DDE497C9FD0D1AE8D8D0D78F9E597E1DC
          B973BC46B8D42CAE97E14ECF24520DC600C3329CE55B598F65ABB04ADBC0AE6F
          7C91BB6E9F986D4A0B82CF4A0CC61C82EAF7FFC00FC0E1A34760077F630F5404
          07CB60B33351BD5EA85A9F356050A37BD2B8A486FEA05CD2C87FB69D2171854E
          2674B47A5C0B20B491C9C5B65617B16A389207255D719A4A428BFF352BA1C588
          AA13AB0EB1C66AA372285AC866E0C9E01E9A075A5B5F834B175F8337AEBEC1A9
          0C5AED36071C0E3DCE4229F0B84FDB8F12DD2D88E85ED6A69BA06AD028E4EEED
          771C64145480C6645001F7D9CF1FA40D214FDCBBA528E42B67091471F252375E
          E326EFC2DCD201E4A297A15147694337601487EC11533371383BC673C3945703
          6BF0B549F3C8D14238750F20FCF5C5DE4F7AB252DD7B2A3BF436BEC70D971D75
          9BDF89BD5F940BD9A067E9ED0CA56E75846032DC11B7700488ED2D626A6EF1E7
          4EAB86124822C6700A5CC36393444A9172C6E67A83D7BD8D0C26E2BCB0B40827
          8E3D08478F3FC876BDA4608D711F2DD3AEAB98818A7935EED0A0260F5958CA50
          D811531341C3265FCCDCDC8207ED5F2573C7321519BAC9C81B8903D14E1F39FA
          6BDBF0FC8BAFA0E4B103CB0F1C014DE34E1E6CCD3644647BC2031B14C9AC225E
          0BE4813544D0AE11614526A38F7372E2E82A3C72FA1074918C34B81F239612E9
          D1C9C64012262F3B937349BCFD5246D6D798F8CCB09D3F9E4F9334D0A56DB70B
          CCEA4CCDAB52EDC884C3E69C2A1E4F1D5BDB9B969C68381EA419A117C798748D
          8D652419C72DD0511F399F9701411F28F26AF85980075D8BFA447DB02AB2529B
          C6A4E6E7D2B1E291DFE1C0D4CEC81B5469B1599551170746F4F4931ECC1AE427
          B5F1F3A8F42CE583894DB2315A7CACBA8A23C7658441E8DD618A3297CC25971D
          3003D070D4AFE046DAA6899F95AFB50F23C579A29C9711EF11E3068BE7F5714F
          5FBFB509D7AF6FC07080E43F41AE2EA60D8B2F2204B8F945DAB092423C365789
          CE82067FE7D52DF06D149348A5D63026D9FA2EBB4E35118B0A2B6516B4F1B5A7
          4CA69A3700A7C0A0A49BB8493B9D1A6CADDF40AE73035616E760719E02C128BA
          B88E1CB0624245991024A5BF32DE7BCA49BF743F529D916AAA4D865937CE6573
          318B792DB755553B6394EDC3E9DB3012C3739DED1B6645E1A5B771AD3CF9D425
          78EE857330BF7C006AED396876E6183486E49144A9C13956036073638D19CC2E
          492DA4B2DAD98011CEC7C9630711349061694BE5F080A5D9D8A8DFAC864ED212
          D5D8109ED598584E9D185DCB39F30CCCD81D75B78DC0C13A9D50A33D41AA2B22
          D4B49EB8E6B7E9AF55B3E7D556F699AD946D6D107B6956F56AFB552A6994353F
          35B06F87B08847DC29F918EB2045BF00AC3A2271BA65DBCCB64F0D9BE4BA4B9C
          882A33851B0927894CB04CDD3316DBB8E67CAD83FB63817C3B3622FF348AAFBC
          76135E78E932CE6B079AAD65DCF04D14B35BCC35EDF434AB0D3937174B1A9139
          3B9D454E29AFA01034A64F7990B5BD64537368271DA51C9807321CCC1D72CA3A
          5E82943574B0C36A28AD0770F3DA656436349C38FE00EBCE49DA585E9843E0A8
          31A122433F9FA64D54395DC9A59248BDF902678C9FBC82B556D54CCB14B6AAD4
          063461B42A83BB94F77FB91F60997F60C26A190120F20710176D99AE8B57B6E0
          CC8B1761BB4F996CDBD05D5802C5E513A4701BED58F258A3C26EDD561B46831E
          24FD1ED451F2A5520CCB732D387E6C0E16BA3594F8861022F341F9EFEA4C1843
          F0F7368DA9754820C2699FDF1A90F381AB99624B418E492C9A9F29325124CE60
          34F918C98C2B524C64E28A284ADD6A40FC7E518BBDCCBB7A82C4E303E52C5555
          A4BEAB7380766DB24D43C6A6F8865551D422BD2699E0A9349D4460F47B49EE37
          3E1BEC5BA0A631CD65FB1A73546ACC135FE7D40562840CBD4D93B89C4A6932B2
          B256D9875D78648DDF641A23E49E6FE274D755DD1873C2D6E9E67FFEFC3578EE
          CC6BC8B12D41BDB9049B5BA422ECA2F8DA819D41C41CA3030DA7A24A2F281901
          2CA06B13A99E6E30715D0D53393EEF3D05A9841B9B9A0CCA181AC824422EBFD6
          8D97126E8A9344C236369642C8C0CA392980D35128B66F20110A62D8D9BA0D37
          6FBE0E478FACC0C30F1D4369386429637901A590865DB711473FAB40B225D834
          EFA109EAD2FE4AD65E71B0C219A99620CB7781018D8AD5B19BBA2FD9BB6425F2
          8C878EB9F660D8E73D47F5BF079161D970AC87385CF4676FA8E1FC6B1B70F695
          8BD047F1A239B7C85E5461ADC91287BD0F49B923040B2ACCD369D4103CB62019
          6EC3C1E53978F8D401585D6C2033A9F195B09468F322B346C03008D6A3D2320A
          D6506C25106AF6BB3CA0666AA18F694A0CD85418C20537CBC79C33FFDA383248
          D3ED10CD62BA646267F27DF6C7BFC855FF6E484ED696E2DCEF772369940E981B
          86297322EDB165784C4F6F99D660F08FF27B593DB8B311DA67D3AA9475D38DD4
          744F93675CDD1EC2D39F7DEE0A7CED6B2FE3D8A2985F5F84C1883823F2E2A8B3
          5193631F9409CCE4980C331FE6DE0DF606098D1E1A38AE86540BB477798318DD
          ADF4D84BC3CDB24E68D4CBB2B185B38D5D078DD38BC936109ACFA124CF348932
          25B21989563D80B5DBEB105390588BF20E6DC2D5372E20E1D3F01FBCEB31387D
          F2084B1CF5BA82762344AE562A602B29B926EBCB98FB33C1A3303E6E657352E9
          EA3AC56C55B9A6575D639A9551644F495B62E2B940E64F4B0A0D9AB958A7555E
          AFAF8FE0CCF397E0CA1BD721C2F96FB6BA1CF3A328BD1072D80D040F5687504D
          0E3C97E23392D10ED4550447A96AE8912E749B8A2544028DD0C64AD06D93D0A8
          09C7C16D12419DC4ADEF9970A93CAB34D529329236E6E73E529FE55D7C670E1A
          D2443CBB17A07137DB9F34D02895CA956CFEA79FB90C5FFBFA8BB890C8336501
          B9C8366EFE0524F81D2E8C447A6D897D25308838099DD4B5F03C74ACBA08C0C5
          E988B090AA11F8589F107B9FAD3AC2DAC96C795F30B11A92F32966B0A899BC46
          56052AEA1C2A17DA97849A544E7444D1C8D76038D884E30F3E00EFFAAEC79048
          2DB0270FE118BD8701588830951FB5038DBB3927D3B52A9BC6DDEE85259191F9
          245218A70C11A86529708008F2CAE50D78FEC5F370EDE61AB4E716E0E0A1232C
          690C1028A244B1A4C2AA69EA13AE9FA8BFC3807DE4D0221C3F328FD25FC0D261
          80A0515356ED0D205E7AAA103476359C7B69BB008DFC7CDCFD34967B78BCBB05
          1ABE987EA7FA518F3C54DEE56EB75938DCEE7D09CC426EAB1E4F973C16ACE4E6
          9DA1808D9B5FFFC64578FAE9B3C881CFE31E6DB31DA3569F434EB121AE93B5C0
          A4143169E92181B4068592DADC1ABC54DBCAD55FB6F62E170F609D57C0AA0644
          6545EEBF5C7E3650C6C8EDEB418DE303A758084DC538C99D44FE7A92E603C91A
          A9075092A02475EB6B37F0BB113C7894F2F79C84078FAD42BB1D3051A29444A6
          6C013F8B321E345A0285F6BE34F41EC8F51EAB0FA653ABF70C1A32D7362DBA1B
          2DCE9A46C0318A34AF9FED7E022F9FBB00675FBDC88178878F9DE0BA19BDC190
          8346C93E46E9D0D92D98BC1F77B659E23B7678198E1E5E807653B23EF3551D68
          18F66E56A03183563533D3A814EF178675AC6F770B345263F46E0D6BFBA0917D
          D2BB0F1AF64E99BA118E808BAAE18927CFC3934F3E0773E476DB5A848D2DAA14
          D664DD10F9C773705FA041191EDC05DD711AF31AA7E388A3C8FD167261A2D008
          12E2DDC4D1D626E58236B6276D0A6151574267F84CBDAC3458558366355518A4
          F0972411DB3F12902CCA21A7BF18B1A7CEFAFA6D24548012C66178EB63A7E0F8
          F143F86CA1804520F51B6A81052C931DC18EA7AA4A7A38CDD4CE8034EC113C66
          011AB272627325E70BCD234EF9A622F25863B354086F5CBD0DDF7CFE7978FEA5
          B37013250EAEBB41753450D268B7E6A0DBEE401BC183A2F3E75A75387860014E
          9D3C06271E3C089D3625161CB2A4C1CE066053D4EC83C6BD6A771534F6D835A8
          048DBBD1F57C2F66C2CDED1D3466610A1F1FCF71C8D6D6F556FBD5AECD33E061
          8F7FF95BF0B9CF7D11258D36CCCFAFC260848BBBD68066A3C9E7F6863D1933F6
          22B21E76CAC4BBA4C64A524170905D24C19FB6BE0401492D90541F1264886091
          A0F4420181097E4F80A0432140E4F89048843F289B0013D8D0CD353328C09413
          4E6A061A966EE85E145344C66FEC11A5923E75EA4138F5D07138787011BAF375
          943242F194D2314784DB6CBECA44B98371F9D533214AB3524FEDA1077B5EE3DA
          FB9416BF4A7F51A620137B2A407F18C32B172FC1935F7B0A9EFDE673B0B1B90D
          F5761B541842BB83A0D1EA3270AC2EAFC0A1D555387AE4009C3C7E105616BA38
          AF64DB1A99449236925DD461F71368548ED89EBCE6DEDCB60F1A55BDF88E028D
          B1A78332792FEB31439B5DC3E35FFC3A7CFEF71FE7BC539DEE22127E4931CDB5
          DFEB446AC9D53131F97B4C39DD8436B7495CA884D327951219BC29AEC6C6D610
          71E6E4828D46FAD84AAE914A1E788C6A1AEFA984E33EB43631385472934404FE
          6D28093375CC2A338AD921D51465472569E6810307E1F8B163F0C8A3A751BA58
          8185F9A63398D7A8A0503C60A9C826C294E037130467B2D3CE46D2FD4E000D6A
          BE7BBB1EFBCC1E6C148C8BCC05171A1A45707B6D835F941982920C52A4389552
          20E68046990ABACDB55BD06A52B5D03A075A52647E1024903AF207A0ADB4B10F
          1AF7A4DD5DD0D88B25686646C2BDB6BDE799B97F41638A3BEB54D2A0EA6B972E
          5F87D72E5D63D7482AB0A56A924E234610099BD6F6C0DEF7AE64938B91C07FD1
          509B003C65FCE9E334532C49115C6B3928E8830532055283D97E2F0A91C00011
          BBDC1A40A11A057448AD2E066FBAA7E4EDA13AD15D585D5980A5950E024A76AC
          294D37A9B4B82FA63C291324232D3937D9FB6179CE6696614FEB4BA70AAE22CF
          2ACB8070EC0C453327A2AAE20485E6A821A4F903E845F204CDB254B793F89720
          8858D2903201D46C4EB3C018DF554653773F13DE6FE73601346641A0D2988BDD
          59C2F74123DBE209DFE71D21F32157F963EFACA5EE8A014B179A83D9C4484E36
          8EBA080F2C5FD4C0B732DC3F3358D86C003C80CBF727B9B9624EA54DAEBEA12B
          396C8CADB668924B2F310B69FA7E687B058D204DE1E22F43F7889689143522E5
          A692424DA64C01502C0702492041BD34E211977B55FC62F31AD53FA118194EAB
          2F2B4C19D6C482864AEBFB663CEEEEACDD2F7372FFB68272AF250B688CB0FB62
          A8DFBCFADE7B028DFBA1DD0F2A88C450B6F128D3C44B019231686A0FB4B90B46
          F7BBEBAE884461D54B74798AF8758C380764A6B7B4A19C965604B9580A5B2DB7
          68AA5D255D6F4DF8B3A0269CE71FE7D30B77199DBD861DA6F45ABAE0A5B22FED
          51C5B13951EEB3CF6AA4E0990F7EB100743FACF5BDAC73950389824BDAD4307E
          4E27483DF668586313A3C0DFC792B93854FED8C5C621C2B3B399D14DC3FC6C40
          6976E427D799297A9EFBC9D9FECD6F234A46AA32B6BDBD8046923B0F20F532CE
          86F6EFB73D34ED45567B044ABE4D27443CE28D5ED7FACC6A39567C53EF7E3DEA
          EF8C9697DC00C6914D9BD4FD89479B02E7A3EF83864FDA5209DC7315DD57A3DC
          412B93A0634813DED86699D7601F34EEB00909D12805260C1AD4C2A27A1AA9B3
          ECB4972D1EDEAAA241FBED0E9A310827DEBCF8FC96DFAC2F89B2A061BF752A95
          37FB61BE835AE281000B216A0C306C4B6515BB678C53A58F4FFB6D8F2D19DB13
          9E597CCA6BA8FB5BAD7A0F1BCB6D9C763F70C1B1ECA290078DF16C41C5BA6935
          E173D977FB6D772D2FFF15459BFAE3CD0E88798151151CB8DFF6D6723A2856B1
          4056B1959F8220F7F73E819A6DD3257FE77FF39558BEC26B5FCE9066250D762D
          4F2498924B7E174B1A0567E75A50268CECEF84993637272563AE721A1555842A
          FBC2DFEC9A559FFB5FA99CEA5C57C4EEA9FDAD32F3E6CD495E88D32AB785D4F8
          81FBBC55B659DA4359166A944D414D4A8D3E8D33859EF04ECD9A34F6DBEC5A7E
          4E26F920509B24FAED53A8D9B502D070DFE7DB244AB43F1FB36D622B1FB757DC
          0912ECCF49A6259066E0E50A905A178186CEB1B545EE9B2A4BB42C3BE5CB78FB
          A031DBA6731F6CEC42929B1BE75A04C52E46FB1B6276CD9F13BB67989DF5DDB4
          004CB1EFAC9755C1C7FDB6C7E68386DB033AB71F26A17A81FD6FBFC99052EA9F
          3891DA25812AF29EB21AF32C2BEB1BC7532377E081860512B5AF0A99714B9D13
          B4E7566BD8DC2427823897466B76B551CCFB1B61F6CD940CF6F78A2B5F9B1AC8
          534294CE89F573DB9F95193667FCF38122C9797A261E3C148920FB1CAFDFFCAA
          8754E9528F4B1A36315E9AD8DCFAEC24606B1CD824612978D8F40A2971DAF7D4
          996513474261A124CADA46C4DA80BF341ED74B1568829EE45749E4B18FE4B36A
          FE9C487DBEC4C141EA6B9277435792C00FC08046C07523F6B7C98C9A1790C363
          AF6C2245991F003B2B16EC2D2DF3013CDCF79FF25ABEE608A5FCF9FF016FF384
          1EAC44DCF10000000049454E44AE426082}
        Stretch = True
      end
      object Panel6: TPanel
        Left = 611
        Top = 1
        Width = 213
        Height = 78
        BevelOuter = bvNone
        TabOrder = 0
        object Panel7: TPanel
          Tag = 56
          Left = 0
          Top = 50
          Width = 213
          Height = 28
          Align = alClient
          Caption = 'No. CCS CMD'
          TabOrder = 0
        end
        object Panel8: TPanel
          Tag = 55
          Left = 0
          Top = 25
          Width = 213
          Height = 25
          Align = alTop
          Caption = 'Simulater'
          TabOrder = 1
        end
        object Panel9: TPanel
          Tag = 54
          Left = 0
          Top = 0
          Width = 213
          Height = 25
          Align = alTop
          Caption = 'Target'
          TabOrder = 2
        end
      end
    end
    object pnl3BBtm: TPanel
      Left = 1
      Top = 258
      Width = 950
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object pnlStatus3B: TPanel
        Left = 855
        Top = 0
        Width = 95
        Height = 41
        Align = alRight
        Caption = 'NRML'
        Color = 11754291
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel13: TPanel
        Left = 409
        Top = 0
        Width = 351
        Height = 41
        Align = alClient
        Color = 11754291
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object lblAligmentStatus3B: TLabel
          Left = 28
          Top = 13
          Width = 117
          Height = 16
          Caption = 'Waiting Alignment'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
      end
      object Panel14: TPanel
        Left = 0
        Top = 0
        Width = 409
        Height = 41
        Align = alLeft
        Color = 11754291
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        object lblWarmupTime3B: TLabel
          Left = 20
          Top = 13
          Width = 102
          Height = 16
          Caption = 'Warm-up 00:00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
      end
      object pnlChn3B: TPanel
        Left = 760
        Top = 0
        Width = 95
        Height = 41
        Align = alRight
        Caption = 'CHN A'
        Color = 11754291
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
      end
    end
    object pnlVrlInitState3B: TPanel
      Left = 15
      Top = 103
      Width = 20
      Height = 10
      Color = clLime
      ParentBackground = False
      TabOrder = 2
    end
    object pnlVrlInsGnss3B: TPanel
      Left = 15
      Top = 125
      Width = 20
      Height = 10
      Color = clLime
      ParentBackground = False
      TabOrder = 3
    end
    object pnlVrlMNormal3B: TPanel
      Left = 15
      Top = 147
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 4
    end
    object pnlVrlCalFinished3B: TPanel
      Left = 15
      Top = 169
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 5
    end
    object pnlVrlNavigate3B: TPanel
      Left = 15
      Top = 192
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 6
    end
    object pnlVrlIgnition3B: TPanel
      Left = 15
      Top = 213
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 7
    end
    object pnlVrlTakeOff3B: TPanel
      Left = 185
      Top = 213
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 8
    end
    object pnlVrlParaSetting3B: TPanel
      Left = 185
      Top = 192
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 9
    end
    object pnlVrlInsideSector3B: TPanel
      Left = 185
      Top = 169
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 10
    end
    object pnlVrlSeaTgt3B: TPanel
      Left = 185
      Top = 147
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 11
    end
    object pnlVrlEngine3B: TPanel
      Left = 185
      Top = 125
      Width = 20
      Height = 10
      Color = clLime
      ParentBackground = False
      TabOrder = 12
    end
    object pnlVrlPowerOn3B: TPanel
      Left = 185
      Top = 103
      Width = 20
      Height = 10
      Color = clLime
      ParentBackground = False
      TabOrder = 13
    end
    object pnlVrlInitChk3B: TPanel
      Left = 337
      Top = 103
      Width = 20
      Height = 10
      Color = clLime
      ParentBackground = False
      TabOrder = 14
    end
    object pnlVrlWarmUp3B: TPanel
      Left = 337
      Top = 125
      Width = 20
      Height = 10
      Color = clYellow
      ParentBackground = False
      TabOrder = 15
    end
    object pnlVrlLandTgt3B: TPanel
      Left = 337
      Top = 147
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 16
    end
    object pnlVrlFullOpen3B: TPanel
      Left = 337
      Top = 169
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 17
    end
    object pnlVrlParaLocking3B: TPanel
      Left = 337
      Top = 192
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 18
    end
    object pnlVrlBusSupply3B: TPanel
      Left = 497
      Top = 103
      Width = 20
      Height = 10
      Color = clLime
      ParentBackground = False
      TabOrder = 19
    end
    object pnlVrlPlcChk3B: TPanel
      Left = 497
      Top = 125
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 20
    end
    object pnlVrlBoosterArm3B: TPanel
      Left = 497
      Top = 169
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 21
    end
    object pnlVrlBatteryAct3B: TPanel
      Left = 497
      Top = 192
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 22
    end
    object pnlVrlSeeker3B: TPanel
      Left = 641
      Top = 103
      Width = 20
      Height = 10
      Color = clLime
      ParentBackground = False
      TabOrder = 23
    end
    object pnlVrlInsAlign3B: TPanel
      Left = 641
      Top = 125
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 24
    end
    object pnlVrlLnchRdy3B: TPanel
      Left = 641
      Top = 169
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 25
    end
    object pnlVrlPwrSwitch3B: TPanel
      Left = 641
      Top = 192
      Width = 20
      Height = 10
      Color = clGray
      ParentBackground = False
      TabOrder = 26
    end
  end
  object pnlArea2: TPanel
    Left = 13
    Top = 844
    Width = 954
    Height = 147
    TabOrder = 3
    object pnlArea2Btm: TPanel
      Left = 1
      Top = 76
      Width = 952
      Height = 70
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object pnlParam2Top: TPanel
        Left = 0
        Top = 0
        Width = 952
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object pnlLongParamHeader: TPanel
          Tag = 15
          Left = 0
          Top = 0
          Width = 130
          Height = 35
          Align = alLeft
          Caption = 'LONG (deg)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object pnlLongParam: TPanel
          Left = 130
          Top = 0
          Width = 188
          Height = 35
          Align = alLeft
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          object lblLongParam: TLabel
            Left = 65
            Top = 8
            Width = 86
            Height = 18
            Alignment = taRightJustify
            Caption = '000.00000'
            Color = clLime
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
        end
        object pnlESpdParamHeader: TPanel
          Tag = 17
          Left = 318
          Top = 0
          Width = 130
          Height = 35
          Align = alLeft
          Caption = 'E.Spd(m/s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pnlESpdParam: TPanel
          Left = 448
          Top = 0
          Width = 188
          Height = 35
          Align = alLeft
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
          object lblESpdParam: TLabel
            Left = 99
            Top = 9
            Width = 36
            Height = 18
            Alignment = taRightJustify
            Caption = '0.00'
            Color = clLime
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
        end
        object pnlSeaStateParamHeader: TPanel
          Tag = 19
          Left = 636
          Top = 0
          Width = 130
          Height = 35
          Align = alLeft
          Caption = 'Sea State'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object pnlSeaStateParam: TPanel
          Left = 766
          Top = 0
          Width = 188
          Height = 35
          Align = alLeft
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 5
          object lblSeaStateParam: TLabel
            Left = 22
            Top = 9
            Width = 32
            Height = 18
            Caption = 'Low'
            Color = clLime
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
        end
      end
      object pnlParam2Btm: TPanel
        Left = 0
        Top = 35
        Width = 952
        Height = 35
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object pnlLatParamHeader: TPanel
          Tag = 16
          Left = 0
          Top = 0
          Width = 130
          Height = 35
          Align = alLeft
          Caption = 'LAT (deg)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object pnlLatParam: TPanel
          Left = 130
          Top = 0
          Width = 188
          Height = 35
          Align = alLeft
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          object lblLatParam: TLabel
            Left = 65
            Top = 8
            Width = 86
            Height = 18
            Alignment = taRightJustify
            Caption = '000.00000'
            Color = clLime
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
        end
        object pnlNSpdParamHeader: TPanel
          Tag = 18
          Left = 318
          Top = 0
          Width = 130
          Height = 35
          Align = alLeft
          Caption = 'N.Spd(m/s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pnlNSpdParam: TPanel
          Left = 448
          Top = 0
          Width = 188
          Height = 35
          Align = alLeft
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
          object lblNSpdParam: TLabel
            Left = 99
            Top = 9
            Width = 36
            Height = 18
            Alignment = taRightJustify
            Caption = '0.00'
            Color = clLime
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
        end
        object pnlPDOMParamHeader: TPanel
          Tag = 20
          Left = 636
          Top = 0
          Width = 130
          Height = 35
          Align = alLeft
          Caption = 'PDOP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object pnlPDOPParam: TPanel
          Left = 766
          Top = 0
          Width = 188
          Height = 35
          Align = alLeft
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 5
          object lblPDOPParam: TLabel
            Left = 99
            Top = 6
            Width = 36
            Height = 18
            Caption = '0.00'
            Color = clLime
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
        end
      end
    end
    object pnlArea2Top: TPanel
      Left = 1
      Top = 1
      Width = 952
      Height = 75
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 188
        Height = 75
        Align = alLeft
        Caption = 'placement'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel12: TPanel
        Left = 188
        Top = 0
        Width = 130
        Height = 75
        Align = alLeft
        TabOrder = 1
        object Label7: TLabel
          Left = 41
          Top = 11
          Width = 41
          Height = 16
          Caption = 'S. Roll'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object edtSRoll: TEdit
          Left = 17
          Top = 33
          Width = 97
          Height = 27
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '0.00'
        end
      end
      object Panel15: TPanel
        Left = 318
        Top = 0
        Width = 188
        Height = 75
        Align = alLeft
        Caption = 'placement'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object Panel16: TPanel
        Left = 506
        Top = 0
        Width = 130
        Height = 75
        Align = alLeft
        TabOrder = 3
        object Label33: TLabel
          Left = 41
          Top = 11
          Width = 52
          Height = 16
          Caption = 'S. Pitch'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object edtSPitch: TEdit
          Left = 17
          Top = 33
          Width = 97
          Height = 27
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '0.00'
        end
      end
      object Panel17: TPanel
        Left = 636
        Top = 0
        Width = 188
        Height = 75
        Align = alLeft
        Caption = 'placement'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
      end
      object Panel18: TPanel
        Left = 824
        Top = 0
        Width = 130
        Height = 75
        Align = alLeft
        TabOrder = 5
        object Label34: TLabel
          Left = 6
          Top = 11
          Width = 44
          Height = 16
          Caption = 'S. Spd'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label35: TLabel
          Left = 6
          Top = 41
          Width = 44
          Height = 16
          Caption = 'S. Hdg'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object edtSSpd: TEdit
          Left = 58
          Top = 7
          Width = 58
          Height = 24
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '0.00'
        end
        object edtSHdg: TEdit
          Left = 58
          Top = 37
          Width = 58
          Height = 24
          Alignment = taCenter
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '0.00'
        end
      end
    end
  end
  object pnlArea4: TPanel
    Left = 0
    Top = 450
    Width = 954
    Height = 372
    TabOrder = 4
    object pnlLeft_Area4: TPanel
      Left = 1
      Top = 1
      Width = 477
      Height = 370
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 0
      object pnlArea4_Row10_L: TPanel
        Left = 0
        Top = 315
        Width = 477
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Panel57: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label54: TLabel
            Left = 10
            Top = 9
            Width = 76
            Height = 18
            Caption = 'Hdg(deg)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlHdgVal2_L: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          object lblHdgVal2_L: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlHdgVal1_L: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblHdgVal1_L: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row8_L: TPanel
        Left = 0
        Top = 245
        Width = 477
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Panel51: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label50: TLabel
            Left = 10
            Top = 9
            Width = 71
            Height = 18
            Caption = 'Brg(deg)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlBrgVal2_L: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
        object pnlBrgVal1_L: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblBrgVal_L: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row6_L: TPanel
        Left = 0
        Top = 175
        Width = 477
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Panel45: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label46: TLabel
            Left = 10
            Top = 9
            Width = 65
            Height = 18
            Caption = 'A1(deg)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlA1Val2: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
        object pnlA1Val1: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblA1Val: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row4_L: TPanel
        Left = 0
        Top = 105
        Width = 477
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object Panel39: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label42: TLabel
            Left = 10
            Top = 9
            Width = 81
            Height = 18
            Caption = 'Rmin(Km)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlRMinVal2_L: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
        object pnlRMinVal1_L: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblRMinVal_L: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row2_L: TPanel
        Left = 0
        Top = 35
        Width = 477
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object Panel33: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label38: TLabel
            Left = 10
            Top = 9
            Width = 81
            Height = 18
            Caption = 'Ron1(Km)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlRon2Val_L: TPanel
          Left = 387
          Top = 0
          Width = 90
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          object lblRon2Val_L: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlRon1Val_L: TPanel
          Left = 159
          Top = 0
          Width = 90
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblRon1Val_L: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object Panel60: TPanel
          Left = 249
          Top = 0
          Width = 138
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object Label59: TLabel
            Left = 10
            Top = 9
            Width = 81
            Height = 18
            Caption = 'Ron2(Km)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row9_L: TPanel
        Left = 0
        Top = 280
        Width = 477
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object Panel54: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label52: TLabel
            Left = 10
            Top = 9
            Width = 71
            Height = 18
            Caption = 'Pth(deg)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlPthVal2_L: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          object lblPthVal2_L: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlPthVal1_L: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblPthVal1_L: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row7_L: TPanel
        Left = 0
        Top = 210
        Width = 477
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object Panel48: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label48: TLabel
            Left = 10
            Top = 9
            Width = 65
            Height = 18
            Caption = 'A2(deg)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlA2Val2_L: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
        object pnlA2Val1_L: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblA2Val_L: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row5_L: TPanel
        Left = 0
        Top = 140
        Width = 477
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object Panel42: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label44: TLabel
            Left = 10
            Top = 9
            Width = 55
            Height = 18
            Caption = 'B(deg)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlBVal2_L: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
        object pnlBVal1_L: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblBVal_L: TLabel
            Left = 6
            Top = 11
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row3_L: TPanel
        Left = 0
        Top = 70
        Width = 477
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object Panel36: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label40: TLabel
            Left = 10
            Top = 9
            Width = 85
            Height = 18
            Caption = 'Rmax(Km)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlRMaxVal2_L: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
        object pnlRMaxVal1_L: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblRMaxVal_L: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row1_L: TPanel
        Left = 0
        Top = 0
        Width = 477
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        object pnlTgtNbHeader_L: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lblTgtNbHeader_L: TLabel
            Left = 10
            Top = 9
            Width = 78
            Height = 18
            Caption = 'Tgt: 0001'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlDirtAttackHeader_L: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Label37: TLabel
            Left = 10
            Top = 9
            Width = 107
            Height = 18
            Caption = 'DIRT ATTACK'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlHeader_L: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object pnlRight_Area4: TPanel
      Left = 478
      Top = 1
      Width = 475
      Height = 370
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 1
      object pnlArea4_Row1_R: TPanel
        Left = 0
        Top = 0
        Width = 475
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object pnlTgtNbHeader_R: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lblTgtNbHeader_R: TLabel
            Left = 10
            Top = 9
            Width = 78
            Height = 18
            Caption = 'Tgt: 0001'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlDirtAttackHeader_R: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Label41: TLabel
            Left = 10
            Top = 9
            Width = 107
            Height = 18
            Caption = 'DIRT ATTACK'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlHeader_R: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object pnlArea4_Row10_R: TPanel
        Left = 0
        Top = 315
        Width = 475
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Panel23: TPanel
          Left = 0
          Top = 0
          Width = 193
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object lblCCSVal: TLabel
            Left = 10
            Top = 9
            Width = 111
            Height = 18
            Caption = 'CCS:unknown'
            Font.Charset = ANSI_CHARSET
            Font.Color = clYellow
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlHdgVal2_R: TPanel
          Left = 340
          Top = 0
          Width = 147
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          object lblRPSVal: TLabel
            Left = 10
            Top = 9
            Width = 94
            Height = 18
            Caption = 'RPS:normal'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlHdgVal1_R: TPanel
          Left = 193
          Top = 0
          Width = 147
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblIpdVal: TLabel
            Left = 10
            Top = 9
            Width = 92
            Height = 18
            Caption = 'IPD:normal'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row2_R: TPanel
        Left = 0
        Top = 35
        Width = 475
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Panel27: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label49: TLabel
            Left = 10
            Top = 9
            Width = 81
            Height = 18
            Caption = 'Ron1(Km)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlRon2Val_R: TPanel
          Left = 387
          Top = 0
          Width = 90
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          object lblRon2Val_R: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object Panel29: TPanel
          Left = 159
          Top = 0
          Width = 90
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblRon1Val_R: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object Panel30: TPanel
          Left = 249
          Top = 0
          Width = 138
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object Label55: TLabel
            Left = 10
            Top = 9
            Width = 81
            Height = 18
            Caption = 'Ron2(Km)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row3_R: TPanel
        Left = 0
        Top = 70
        Width = 475
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object Panel32: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label57: TLabel
            Left = 10
            Top = 9
            Width = 85
            Height = 18
            Caption = 'Rmax(Km)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlRMaxVal2_R: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
        object pnlRMaxVal1_R: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblRMaxVal_R: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row4_R: TPanel
        Left = 0
        Top = 105
        Width = 475
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object Panel38: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label60: TLabel
            Left = 10
            Top = 9
            Width = 81
            Height = 18
            Caption = 'Rmin(Km)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlRMinVal2_R: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
        object pnlRMinVal1_R: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblRMinVal_R: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row5_R: TPanel
        Left = 0
        Top = 140
        Width = 475
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object Panel44: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label62: TLabel
            Left = 10
            Top = 9
            Width = 55
            Height = 18
            Caption = 'B(deg)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlBVal2_R: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
        object pnlBVal1_R: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblBVal_R: TLabel
            Left = 6
            Top = 11
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row6_R: TPanel
        Left = 0
        Top = 175
        Width = 475
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object Panel50: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label64: TLabel
            Left = 10
            Top = 9
            Width = 65
            Height = 18
            Caption = 'A1(deg)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object Panel52: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
        object Panel53: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object Label65: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row7_R: TPanel
        Left = 0
        Top = 210
        Width = 475
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object Panel56: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label66: TLabel
            Left = 10
            Top = 9
            Width = 65
            Height = 18
            Caption = 'A2(deg)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlA2Val2_R: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
        object pnlA2Val1_R: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblA2Val_R: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row8_R: TPanel
        Left = 0
        Top = 245
        Width = 475
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object Panel62: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label68: TLabel
            Left = 10
            Top = 9
            Width = 71
            Height = 18
            Caption = 'Brg(deg)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlBrgVal2_R: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
        object pnlBrgVal1_R: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblBrgVal_R: TLabel
            Left = 10
            Top = 9
            Width = 46
            Height = 18
            Caption = '00.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlArea4_Row9_R: TPanel
        Left = 0
        Top = 280
        Width = 475
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        object Panel66: TPanel
          Left = 0
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label70: TLabel
            Left = 10
            Top = 9
            Width = 69
            Height = 18
            Caption = 'RII(deg)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlPthVal2_R: TPanel
          Left = 318
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          object lblPthVal2_R: TLabel
            Left = 6
            Top = 11
            Width = 36
            Height = 18
            Caption = '0.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
        object pnlPthVal1_R: TPanel
          Left = 159
          Top = 0
          Width = 159
          Height = 35
          Align = alLeft
          Alignment = taLeftJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object lblPthVal1_R: TLabel
            Left = 10
            Top = 9
            Width = 36
            Height = 18
            Caption = '0.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
    end
  end
  object pnlArea5: TPanel
    Left = 61
    Top = 1022
    Width = 869
    Height = 50
    BevelOuter = bvNone
    Color = 11754291
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
    object pnlTimeClock: TPanel
      Tag = 14
      Left = 769
      Top = 0
      Width = 100
      Height = 50
      Align = alRight
      Caption = '00:00:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pnlFCSTrng: TPanel
      Tag = 13
      Left = 669
      Top = 0
      Width = 100
      Height = 50
      Align = alRight
      Caption = 'FCS TRNG'
      TabOrder = 1
    end
    object pnlIPDNav: TPanel
      Tag = 12
      Left = 569
      Top = 0
      Width = 100
      Height = 50
      Align = alRight
      Caption = 'IPD NAV.'
      TabOrder = 2
    end
    object pnlRPSPlan: TPanel
      Tag = 11
      Left = 469
      Top = 0
      Width = 100
      Height = 50
      Align = alRight
      Caption = 'RPS Plan'
      TabOrder = 3
    end
  end
  object tmrClock: TTimer
    Enabled = False
    OnTimer = tmrClockTimer
    Left = 4
    Top = 371
  end
end
