object frmTorpedoParameterDepthSettings: TfrmTorpedoParameterDepthSettings
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 323
  ClientWidth = 587
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 587
    Height = 323
    BevelOuter = bvNone
    Caption = 's'
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 7
      Width = 37
      Height = 14
      Caption = 'Target'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNumberTarget: TLabel
      Left = 71
      Top = 7
      Width = 42
      Height = 14
      Caption = '110002'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 239
      Top = 7
      Width = 28
      Height = 14
      Caption = 'Salvo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNumberSalvo: TLabel
      Left = 295
      Top = 7
      Width = 14
      Height = 14
      Caption = '01'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 391
      Top = 7
      Width = 93
      Height = 14
      Caption = 'No of Torpedoes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNoTorpedoes: TLabel
      Left = 497
      Top = 7
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
    object Label4: TLabel
      Left = 335
      Top = 33
      Width = 35
      Height = 14
      Caption = 'Official'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 439
      Top = 33
      Width = 22
      Height = 14
      Caption = 'Trial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 15
      Top = 58
      Width = 50
      Height = 14
      Caption = 'Guidance'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 15
      Top = 85
      Width = 76
      Height = 14
      Caption = 'LOS Deviation'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 15
      Top = 110
      Width = 76
      Height = 14
      Caption = 'Search Speed'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblOfficialGuidance: TLabel
      Left = 335
      Top = 58
      Width = 22
      Height = 14
      Caption = 'LOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblOfficialSearchSpeed: TLabel
      Left = 335
      Top = 110
      Width = 25
      Height = 14
      Caption = 'S 18'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 271
      Top = 85
      Width = 20
      Height = 14
      Caption = '(m)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblApply: TLabel
      Left = 29
      Top = 304
      Width = 30
      Height = 14
      Caption = 'Apply'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = lblApplyClick
    end
    object lblApplySetOfficial: TLabel
      Left = 230
      Top = 303
      Width = 116
      Height = 14
      Caption = 'Apply and Set Official'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = lblApplySetOfficialClick
    end
    object lblReset: TLabel
      Left = 510
      Top = 303
      Width = 31
      Height = 14
      Caption = 'Reset'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = lblResetClick
    end
    object cbTrialGuidance: TComboBox
      Left = 440
      Top = 55
      Width = 57
      Height = 22
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'LOS'
      Items.Strings = (
        'CC'
        'LOS')
    end
    object edtOfficialLOSDeviation: TEdit
      Left = 336
      Top = 82
      Width = 49
      Height = 21
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '0'
    end
    object edtTrialLOSDeviation: TEdit
      Left = 440
      Top = 82
      Width = 57
      Height = 21
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '0'
    end
    object cbTrialSearchSpeed: TComboBox
      Left = 440
      Top = 104
      Width = 57
      Height = 22
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = 'S 18'
      Items.Strings = (
        'S 9'
        'S 10'
        'S 11'
        'S 12'
        'S 13'
        'S 14'
        'S 15'
        'S 16'
        'S 17'
        'S 18'
        'S 19'
        'S 20'
        'S 21'
        'S 22'
        'S 23'
        'S 24'
        'S 25'
        'S 26'
        'S 27')
    end
    object AdvPageTorpedoParameterDepth: TAdvPageControl
      Left = 8
      Top = 128
      Width = 569
      Height = 173
      ActivePage = AdvApproach
      ActiveFont.Charset = DEFAULT_CHARSET
      ActiveFont.Color = clLime
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
      DefaultTabColorTo = clBlack
      ActiveColor = clBlack
      TabBackGroundColor = clBlack
      TabMargin.RightMargin = 0
      TabOverlap = 0
      Version = '2.0.2.0'
      PersistPagesState.Location = plRegistry
      PersistPagesState.Enabled = False
      TabOrder = 4
      object AdvDepth: TAdvTabSheet
        Caption = '       Depth  '
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        object Label9: TLabel
          Left = 7
          Top = 6
          Width = 83
          Height = 14
          Caption = 'Depth Settings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 7
          Top = 30
          Width = 34
          Height = 14
          Caption = 'Ceiling'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 7
          Top = 52
          Width = 74
          Height = 14
          Caption = 'Attack Depth'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 7
          Top = 74
          Width = 75
          Height = 14
          Caption = 'Search Depth'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 7
          Top = 96
          Width = 90
          Height = 14
          Caption = 'Appoarch Depth'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 8
          Top = 118
          Width = 26
          Height = 14
          Caption = 'Floor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 183
          Top = 30
          Width = 20
          Height = 14
          Caption = '(m)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 183
          Top = 52
          Width = 20
          Height = 14
          Caption = '(m)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 183
          Top = 74
          Width = 20
          Height = 14
          Caption = '(m)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 183
          Top = 96
          Width = 20
          Height = 14
          Caption = '(m)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 184
          Top = 118
          Width = 20
          Height = 14
          Caption = '(m)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 303
          Top = 9
          Width = 35
          Height = 14
          Caption = 'Official'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 407
          Top = 9
          Width = 22
          Height = 14
          Caption = 'Trial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficalCeiling: TLabel
          Left = 316
          Top = 30
          Width = 7
          Height = 14
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialAttackDepth: TLabel
          Left = 316
          Top = 52
          Width = 7
          Height = 14
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialSearchDepth: TLabel
          Left = 316
          Top = 74
          Width = 7
          Height = 14
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialAppoarchDepth: TLabel
          Left = 316
          Top = 96
          Width = 7
          Height = 14
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialFloor: TLabel
          Left = 316
          Top = 118
          Width = 7
          Height = 14
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtTrialCeiling: TEdit
          Left = 408
          Top = 26
          Width = 49
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 0
          Text = '0'
        end
        object edtTrialAttackDepth: TEdit
          Left = 408
          Top = 48
          Width = 49
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 1
          Text = '0'
        end
        object edtTrialSearchDepth: TEdit
          Left = 408
          Top = 70
          Width = 49
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 2
          Text = '0'
        end
        object edtTrialAppoarchDepth: TEdit
          Left = 408
          Top = 92
          Width = 49
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 3
          Text = '0'
        end
        object edtTrialFloor: TEdit
          Left = 408
          Top = 114
          Width = 49
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 4
          Text = '0'
        end
        object chkTrialCeiling: TCheckBox
          Left = 474
          Top = 25
          Width = 17
          Height = 20
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object chkTrialFloor: TCheckBox
          Left = 474
          Top = 114
          Width = 17
          Height = 20
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
      end
      object AdvApproach: TAdvTabSheet
        Caption = '      Apprch  '
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        object Label23: TLabel
          Left = 7
          Top = 50
          Width = 60
          Height = 14
          Caption = 'Enable Dist'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 7
          Top = 74
          Width = 91
          Height = 14
          Caption = 'Approach Speed'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 7
          Top = 100
          Width = 97
          Height = 14
          Caption = 'Approach Course '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 207
          Top = 50
          Width = 26
          Height = 14
          Caption = '(km)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 311
          Top = 17
          Width = 35
          Height = 14
          Caption = 'Official'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialEnableDis: TLabel
          Left = 319
          Top = 50
          Width = 18
          Height = 14
          Caption = '0.0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialApproachSpeed: TLabel
          Left = 319
          Top = 74
          Width = 25
          Height = 14
          Caption = 'S 13'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 415
          Top = 17
          Width = 22
          Height = 14
          Caption = 'Trial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 7
          Top = 2
          Width = 52
          Height = 14
          Caption = 'Approach'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 207
          Top = 100
          Width = 26
          Height = 14
          Caption = '(km)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialApproachCourse: TLabel
          Left = 319
          Top = 100
          Width = 21
          Height = 14
          Caption = '000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtTrialEnablingDist: TEdit
          Left = 416
          Top = 50
          Width = 57
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '0.0'
        end
        object cbTrialApproachSpeed: TComboBox
          Left = 415
          Top = 72
          Width = 57
          Height = 22
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = 'S 18'
          Items.Strings = (
            'S 9'
            'S 10'
            'S 11'
            'S 12'
            'S 13'
            'S 14'
            'S 15'
            'S 16'
            'S 17'
            'S 18'
            'S 19'
            'S 20'
            'S 21'
            'S 22'
            'S 23'
            'S 24'
            'S 25'
            'S 26'
            'S 27')
        end
        object chkTrialApproachCourse: TCheckBox
          Left = 490
          Top = 97
          Width = 17
          Height = 20
          TabOrder = 2
        end
        object edtTrialApproachCourse: TEdit
          Left = 415
          Top = 98
          Width = 57
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = '0.0'
        end
      end
      object AdvSA: TAdvTabSheet
        Caption = '        SA   '
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        object Label28: TLabel
          Left = 7
          Top = -2
          Width = 66
          Height = 14
          Caption = 'Search Area'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 8
          Top = 33
          Width = 68
          Height = 14
          Caption = 'SA Updating'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 7
          Top = 53
          Width = 69
          Height = 14
          Caption = 'Center  - OS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 8
          Top = 71
          Width = 58
          Height = 14
          Caption = 'SA Length'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label35: TLabel
          Left = 8
          Top = 90
          Width = 52
          Height = 14
          Caption = 'SA Width'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 9
          Top = 109
          Width = 70
          Height = 14
          Caption = 'Center - SSP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label37: TLabel
          Left = 190
          Top = 53
          Width = 26
          Height = 14
          Caption = '(km)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 191
          Top = 71
          Width = 26
          Height = 14
          Caption = '(km)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label39: TLabel
          Left = 191
          Top = 90
          Width = 26
          Height = 14
          Caption = '(km)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 192
          Top = 128
          Width = 22
          Height = 14
          Caption = '(%)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label42: TLabel
          Left = 311
          Top = 12
          Width = 35
          Height = 14
          Caption = 'Official'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialCenterOS: TLabel
          Left = 320
          Top = 53
          Width = 18
          Height = 14
          Caption = '0.0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialSALength: TLabel
          Left = 320
          Top = 71
          Width = 18
          Height = 14
          Caption = '0.0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblSAWidth: TLabel
          Left = 320
          Top = 90
          Width = 18
          Height = 14
          Caption = '0.0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialCenterSSP: TLabel
          Left = 320
          Top = 111
          Width = 18
          Height = 14
          Caption = '0.0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialSearchConfidence: TLabel
          Left = 324
          Top = 130
          Width = 7
          Height = 14
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label48: TLabel
          Left = 415
          Top = 12
          Width = 22
          Height = 14
          Caption = 'Trial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label49: TLabel
          Left = 9
          Top = 128
          Width = 102
          Height = 14
          Caption = 'Search Confidence'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialSAUpdating: TLabel
          Left = 318
          Top = 32
          Width = 19
          Height = 14
          Caption = 'Circ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTrialSearchConfidence: TLabel
          Left = 451
          Top = 131
          Width = 7
          Height = 14
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object chkTrialCenterOS: TCheckBox
          Left = 482
          Top = 51
          Width = 17
          Height = 20
          TabOrder = 0
        end
        object edtTrialCenterSSP: TEdit
          Left = 420
          Top = 108
          Width = 49
          Height = 21
          Alignment = taRightJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '0.0'
        end
        object cbTrialSAUpdating: TComboBox
          Left = 416
          Top = 29
          Width = 57
          Height = 22
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = 'Circ'
          Items.Strings = (
            'Circ'
            'Vect')
        end
        object edtTrialSAWidth: TEdit
          Left = 420
          Top = 89
          Width = 49
          Height = 21
          Alignment = taRightJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = '0.0'
        end
        object edtTrialCenterOS: TEdit
          Left = 420
          Top = 51
          Width = 49
          Height = 21
          Alignment = taRightJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Text = '0.0'
        end
        object edtTrialSALength: TEdit
          Left = 420
          Top = 71
          Width = 49
          Height = 21
          Alignment = taRightJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Text = '0.0'
        end
      end
      object AdvIntGuidance: TAdvTabSheet
        Caption = '       Int Guid '
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        object Label40: TLabel
          Left = 7
          Top = 4
          Width = 147
          Height = 14
          Caption = 'Torpedo Internal Guidance'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 319
          Top = 20
          Width = 35
          Height = 14
          Caption = 'Official'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label44: TLabel
          Left = 423
          Top = 20
          Width = 22
          Height = 14
          Caption = 'Trial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label45: TLabel
          Left = 5
          Top = 37
          Width = 82
          Height = 14
          Caption = 'Search Pattern'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 5
          Top = 63
          Width = 57
          Height = 14
          Caption = 'DPC Angle'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 198
          Top = 63
          Width = 31
          Height = 14
          Caption = '(deg)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialSearchPattern: TLabel
          Left = 323
          Top = 40
          Width = 27
          Height = 14
          Caption = 'Auto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialDPCAngle: TLabel
          Left = 338
          Top = 63
          Width = 7
          Height = 14
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object cbTrialSearchPattern: TComboBox
          Left = 424
          Top = 37
          Width = 57
          Height = 22
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'Right'
            'Left'
            'Center'
            'Extl'
            'Hxsn'
            'Oct'
            'Tri'
            'Trsn')
        end
        object edtTrialDPCAngle: TEdit
          Left = 424
          Top = 60
          Width = 57
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 1
          Text = '0'
        end
      end
      object AdvToSo: TAdvTabSheet
        Caption = '       ToSo  '
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        object Label50: TLabel
          Left = 7
          Top = 4
          Width = 82
          Height = 14
          Caption = 'Torpedo Sonar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label51: TLabel
          Left = 10
          Top = 45
          Width = 63
          Height = 14
          Caption = 'ToSo Mode'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label52: TLabel
          Left = 10
          Top = 71
          Width = 93
          Height = 14
          Caption = 'ToSo Range PAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label53: TLabel
          Left = 206
          Top = 71
          Width = 20
          Height = 14
          Caption = '(m)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label54: TLabel
          Left = 327
          Top = 28
          Width = 35
          Height = 14
          Caption = 'Official'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialToSoMode: TLabel
          Left = 331
          Top = 48
          Width = 29
          Height = 14
          Caption = 'PASS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialToSoRangePAS: TLabel
          Left = 346
          Top = 71
          Width = 7
          Height = 14
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label57: TLabel
          Left = 431
          Top = 28
          Width = 22
          Height = 14
          Caption = 'Trial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label58: TLabel
          Left = 10
          Top = 92
          Width = 94
          Height = 14
          Caption = 'ToSo Range ACT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label59: TLabel
          Left = 206
          Top = 92
          Width = 20
          Height = 14
          Caption = '(m)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialToSoRangeACT: TLabel
          Left = 346
          Top = 92
          Width = 7
          Height = 14
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object cbTrialToSoMOde: TComboBox
          Left = 432
          Top = 45
          Width = 57
          Height = 22
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'Pass'
          Items.Strings = (
            'Off'
            'Pass'
            'Mix'
            'Act')
        end
        object edtTrialToSoRangePAS: TEdit
          Left = 432
          Top = 68
          Width = 57
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 1
          Text = '0'
        end
        object edtTrialToSoRangeACT: TEdit
          Left = 432
          Top = 89
          Width = 57
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 2
          Text = '0'
        end
      end
      object AdvSafety: TAdvTabSheet
        Caption = '       Safety '
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        object Label55: TLabel
          Left = 14
          Top = 2
          Width = 100
          Height = 14
          Caption = 'Safety Parameters'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label56: TLabel
          Left = 335
          Top = 36
          Width = 35
          Height = 14
          Caption = 'Official'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label61: TLabel
          Left = 439
          Top = 36
          Width = 22
          Height = 14
          Caption = 'Trial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label62: TLabel
          Left = 9
          Top = 52
          Width = 95
          Height = 14
          Caption = 'Protection Radius'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label63: TLabel
          Left = 9
          Top = 78
          Width = 23
          Height = 14
          Caption = 'ASH'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label64: TLabel
          Left = 214
          Top = 52
          Width = 20
          Height = 14
          Caption = '(m)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialASH: TLabel
          Left = 343
          Top = 79
          Width = 16
          Height = 14
          Caption = 'On'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOfficialProtectionRadius: TLabel
          Left = 346
          Top = 56
          Width = 7
          Height = 14
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object cbTrialASH: TComboBox
          Left = 441
          Top = 77
          Width = 57
          Height = 22
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'On'
          Items.Strings = (
            'Off'
            'On')
        end
        object edtTrialProtectionRadius: TEdit
          Left = 441
          Top = 56
          Width = 57
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 1
          Text = '0'
        end
        object chkProtectionRadius: TCheckBox
          Left = 512
          Top = 56
          Width = 17
          Height = 17
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
    end
  end
end
