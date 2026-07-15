object frmTorpedoStatusResultsWindow: TfrmTorpedoStatusResultsWindow
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 538
  ClientWidth = 586
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
    Width = 585
    Height = 545
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 116
      Height = 16
      Caption = 'Torpedo Test Result'
      Color = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblClose: TLabel
      Left = 549
      Top = 518
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
    object AdvPageTorpedoCheck: TAdvPageControl
      Left = 0
      Top = 34
      Width = 585
      Height = 479
      ActivePage = advTorp1
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
      TabOrder = 0
      object advTorp1: TAdvTabSheet
        Caption = ' Torp 1'
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        ExplicitWidth = 561
        ExplicitHeight = 144
      end
      object AdvTorp2: TAdvTabSheet
        Caption = '  Torp 2'
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object AdvTorp3: TAdvTabSheet
        Caption = '  Torp 3'
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object AdvTorp4: TAdvTabSheet
        Caption = '  Torp 4'
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object AdvTorp5: TAdvTabSheet
        Caption = '  Torp 5'
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object AdvTorp6: TAdvTabSheet
        Caption = '  Torp 6'
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object AdvTorp7: TAdvTabSheet
        Caption = '  Torp 7'
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        ExplicitLeft = 24
        ExplicitTop = 0
        ExplicitWidth = 100
        ExplicitHeight = 100
      end
      object advTorp8: TAdvTabSheet
        Caption = ' Torp 8'
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        ExplicitLeft = 24
        ExplicitTop = 0
        ExplicitWidth = 100
        ExplicitHeight = 100
      end
      object AdvTBI: TAdvTabSheet
        Caption = ' TBI'
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        ExplicitLeft = 24
        ExplicitTop = 0
        ExplicitWidth = 100
        ExplicitHeight = 100
        object AdvTorpedoCheckTBI: TAdvPageControl
          Left = -1
          Top = 2
          Width = 584
          Height = 450
          ActivePage = AdvPort
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
          TabOrder = 0
          object AdvPort: TAdvTabSheet
            Caption = '   Port'
            Color = clBlack
            ColorTo = clNone
            TabColor = clBlack
            TabColorTo = clBlack
            TextColor = clLime
            ExplicitHeight = 397
            object lblCPUPS: TLabel
              Left = 284
              Top = 27
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblInternalPS: TLabel
              Left = 284
              Top = 45
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblFP1PS: TLabel
              Left = 284
              Top = 63
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblFP2PS: TLabel
              Left = 284
              Top = 81
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblInternalEthernetlPS: TLabel
              Left = 284
              Top = 99
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblCMCRaconPS: TLabel
              Left = 284
              Top = 135
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblCMCPortPS: TLabel
              Left = 284
              Top = 153
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label10: TLabel
              Left = 12
              Top = 27
              Width = 45
              Height = 14
              Caption = 'CPUCMC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label11: TLabel
              Left = 12
              Top = 45
              Width = 85
              Height = 14
              Caption = 'Internal RACON'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label13: TLabel
              Left = 12
              Top = 63
              Width = 59
              Height = 14
              Caption = 'Fan Pack 1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label14: TLabel
              Left = 12
              Top = 81
              Width = 59
              Height = 14
              Caption = 'Fan Pack 2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label15: TLabel
              Left = 13
              Top = 99
              Width = 175
              Height = 14
              Caption = 'Internal Ethernet INterface Link'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label2: TLabel
              Left = 12
              Top = 117
              Width = 153
              Height = 14
              Caption = 'Internal Serial Interface Link'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label24: TLabel
              Left = 12
              Top = 153
              Width = 147
              Height = 14
              Caption = 'CMC Port - CMC Startboard'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label4: TLabel
              Left = 12
              Top = 135
              Width = 66
              Height = 14
              Caption = 'CMC RACON'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label5: TLabel
              Left = 7
              Top = 5
              Width = 85
              Height = 14
              Caption = 'TBI Test Result'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 12
              Top = 171
              Width = 141
              Height = 14
              Caption = 'TBI Internal Temperature'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label9: TLabel
              Left = 12
              Top = 189
              Width = 48
              Height = 14
              Caption = 'Sensor 1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 11
              Top = 207
              Width = 48
              Height = 14
              Caption = 'Sensor 2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblSensor1PS: TLabel
              Left = 284
              Top = 183
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblSensor2PS: TLabel
              Left = 284
              Top = 203
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label22: TLabel
              Left = 11
              Top = 225
              Width = 48
              Height = 14
              Caption = 'Sensor 3'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblSensor3PS: TLabel
              Left = 284
              Top = 223
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label27: TLabel
              Left = 12
              Top = 243
              Width = 105
              Height = 14
              Caption = 'TBI PS 115V 60 Hz'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label30: TLabel
              Left = 11
              Top = 261
              Width = 130
              Height = 14
              Caption = 'TBI TRL PS 115V 60 Hz'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label31: TLabel
              Left = 11
              Top = 279
              Width = 163
              Height = 14
              Caption = 'External Torp PS 115V 400Hz'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTBI115PS: TLabel
              Left = 284
              Top = 243
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTBITRLPS: TLabel
              Left = 284
              Top = 263
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblExternalTorpPS: TLabel
              Left = 284
              Top = 283
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label35: TLabel
              Left = 11
              Top = 297
              Width = 118
              Height = 14
              Caption = 'Power Supply Module'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label36: TLabel
              Left = 12
              Top = 315
              Width = 35
              Height = 14
              Caption = 'AC/DC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblACPS: TLabel
              Left = 284
              Top = 315
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label38: TLabel
              Left = 11
              Top = 333
              Width = 22
              Height = 14
              Caption = '24V'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl24VPS: TLabel
              Left = 285
              Top = 333
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label40: TLabel
              Left = 11
              Top = 351
              Width = 22
              Height = 14
              Caption = '28V'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl28VPS: TLabel
              Left = 285
              Top = 351
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label42: TLabel
              Left = 11
              Top = 369
              Width = 22
              Height = 14
              Caption = '48V'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl48VPS: TLabel
              Left = 285
              Top = 369
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label44: TLabel
              Left = 11
              Top = 398
              Width = 112
              Height = 14
              Caption = '220 VDC Heating PS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl220VDCPS: TLabel
              Left = 285
              Top = 398
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
          end
          object AdvStartboard: TAdvTabSheet
            Caption = '    Startboard'
            Color = clBlack
            ColorTo = clNone
            TabColor = clBlack
            TabColorTo = clBlack
            TextColor = clLime
            object Label3: TLabel
              Left = 15
              Top = 13
              Width = 85
              Height = 14
              Caption = 'TBI Test Result'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label6: TLabel
              Left = 20
              Top = 35
              Width = 45
              Height = 14
              Caption = 'CPUCMC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblCPUSB: TLabel
              Left = 292
              Top = 35
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 20
              Top = 53
              Width = 85
              Height = 14
              Caption = 'Internal RACON'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label17: TLabel
              Left = 20
              Top = 71
              Width = 59
              Height = 14
              Caption = 'Fan Pack 1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label18: TLabel
              Left = 20
              Top = 89
              Width = 59
              Height = 14
              Caption = 'Fan Pack 2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label19: TLabel
              Left = 21
              Top = 107
              Width = 175
              Height = 14
              Caption = 'Internal Ethernet INterface Link'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label20: TLabel
              Left = 20
              Top = 125
              Width = 153
              Height = 14
              Caption = 'Internal Serial Interface Link'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label21: TLabel
              Left = 20
              Top = 143
              Width = 66
              Height = 14
              Caption = 'CMC RACON'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label23: TLabel
              Left = 20
              Top = 161
              Width = 147
              Height = 14
              Caption = 'CMC Port - CMC Startboard'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label25: TLabel
              Left = 20
              Top = 179
              Width = 141
              Height = 14
              Caption = 'TBI Internal Temperature'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label26: TLabel
              Left = 20
              Top = 197
              Width = 48
              Height = 14
              Caption = 'Sensor 1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label28: TLabel
              Left = 19
              Top = 215
              Width = 48
              Height = 14
              Caption = 'Sensor 2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label29: TLabel
              Left = 19
              Top = 233
              Width = 48
              Height = 14
              Caption = 'Sensor 3'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label32: TLabel
              Left = 20
              Top = 251
              Width = 105
              Height = 14
              Caption = 'TBI PS 115V 60 Hz'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label33: TLabel
              Left = 19
              Top = 269
              Width = 130
              Height = 14
              Caption = 'TBI TRL PS 115V 60 Hz'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label34: TLabel
              Left = 19
              Top = 287
              Width = 163
              Height = 14
              Caption = 'External Torp PS 115V 400Hz'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label37: TLabel
              Left = 19
              Top = 305
              Width = 118
              Height = 14
              Caption = 'Power Supply Module'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label39: TLabel
              Left = 20
              Top = 323
              Width = 35
              Height = 14
              Caption = 'AC/DC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label41: TLabel
              Left = 19
              Top = 341
              Width = 22
              Height = 14
              Caption = '24V'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label43: TLabel
              Left = 19
              Top = 359
              Width = 22
              Height = 14
              Caption = '28V'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label45: TLabel
              Left = 18
              Top = 377
              Width = 22
              Height = 14
              Caption = '48V'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label46: TLabel
              Left = 19
              Top = 406
              Width = 112
              Height = 14
              Caption = '220 VDC Heating PS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblInternalSB: TLabel
              Left = 292
              Top = 53
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblFP1SB: TLabel
              Left = 292
              Top = 71
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblFP2SB: TLabel
              Left = 292
              Top = 89
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblInternalEthernetlSB: TLabel
              Left = 292
              Top = 107
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblCMCRaconSB: TLabel
              Left = 292
              Top = 143
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblCMCPortSB: TLabel
              Left = 292
              Top = 161
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label53: TLabel
              Left = 292
              Top = 191
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblSensor2SB: TLabel
              Left = 292
              Top = 211
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblSensor3SB: TLabel
              Left = 292
              Top = 231
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTBI115SB: TLabel
              Left = 292
              Top = 251
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblTBITRLSB: TLabel
              Left = 292
              Top = 271
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblExternalTorpSB: TLabel
              Left = 292
              Top = 291
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblACSB: TLabel
              Left = 292
              Top = 323
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl24VSB: TLabel
              Left = 293
              Top = 341
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl28VSB: TLabel
              Left = 293
              Top = 359
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl48VSB: TLabel
              Left = 293
              Top = 377
              Width = 16
              Height = 14
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl220VDCSB: TLabel
              Left = 293
              Top = 406
              Width = 16
              Height = 14
              Caption = 'OK'
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
    object AdvTorpedoCheckStatus: TAdvPageControl
      Left = 0
      Top = 61
      Width = 585
      Height = 452
      ActivePage = AdvWCMOnlineStatus
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
      TabOrder = 1
      object AdvTorpedoStatus: TAdvTabSheet
        Caption = '   Torpedo Status'
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
      end
      object AdvWCMOnlineStatus: TAdvTabSheet
        Caption = '   WCM Online Status'
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        object Label8: TLabel
          Left = 6
          Top = 11
          Width = 54
          Height = 14
          Caption = 'CPU WCM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCPUWCM: TLabel
          Left = 182
          Top = 11
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 6
          Top = 33
          Width = 64
          Height = 14
          Caption = 'I/O Board 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblInputOtputBoard1: TLabel
          Left = 182
          Top = 33
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label48: TLabel
          Left = 6
          Top = 55
          Width = 64
          Height = 14
          Caption = 'I/O Board 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblInputOutputBoard2: TLabel
          Left = 182
          Top = 55
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label49: TLabel
          Left = 6
          Top = 77
          Width = 118
          Height = 14
          Caption = 'Communication Board'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCommunicationBoard: TLabel
          Left = 182
          Top = 77
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label50: TLabel
          Left = 6
          Top = 99
          Width = 138
          Height = 14
          Caption = 'Battery Monitoring Circuit'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblBatteryMonitor: TLabel
          Left = 182
          Top = 99
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label51: TLabel
          Left = 6
          Top = 121
          Width = 108
          Height = 14
          Caption = 'Torpedo VDC Input'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTorpedoVDC: TLabel
          Left = 182
          Top = 121
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label52: TLabel
          Left = 6
          Top = 143
          Width = 108
          Height = 14
          Caption = 'Torpedo VAC Input'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTorpedoVAC: TLabel
          Left = 182
          Top = 143
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label54: TLabel
          Left = 6
          Top = 165
          Width = 68
          Height = 14
          Caption = '48V Nominal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl48V: TLabel
          Left = 182
          Top = 165
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label55: TLabel
          Left = 6
          Top = 187
          Width = 51
          Height = 14
          Caption = '24 V Aux'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl24V: TLabel
          Left = 182
          Top = 187
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
      object AdvWCMOfflineStatus: TAdvTabSheet
        Caption = '  WCM Offline Status'
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        object Label56: TLabel
          Left = 6
          Top = 29
          Width = 54
          Height = 14
          Caption = 'CPU WCM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCPUWCMOffline: TLabel
          Left = 265
          Top = 29
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label57: TLabel
          Left = 6
          Top = 51
          Width = 64
          Height = 14
          Caption = 'I/O Board 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblInputOutputBoard1Offline: TLabel
          Left = 265
          Top = 51
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label58: TLabel
          Left = 6
          Top = 73
          Width = 64
          Height = 14
          Caption = 'I/O Board 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblInputOutputBoard2Offline: TLabel
          Left = 265
          Top = 73
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label59: TLabel
          Left = 6
          Top = 95
          Width = 140
          Height = 14
          Caption = 'Internal Power Supply 5V'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblPowerSupply5V: TLabel
          Left = 265
          Top = 95
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label60: TLabel
          Left = 6
          Top = 205
          Width = 138
          Height = 14
          Caption = 'Battery Monitoring Circuit'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblBatteryWCMOffline: TLabel
          Left = 265
          Top = 205
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label61: TLabel
          Left = 6
          Top = 227
          Width = 108
          Height = 14
          Caption = 'Torpedo VDC Input'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblVDCOffline: TLabel
          Left = 265
          Top = 227
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label62: TLabel
          Left = 6
          Top = 249
          Width = 108
          Height = 14
          Caption = 'Torpedo VAC Input'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblVACOffline: TLabel
          Left = 265
          Top = 249
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label63: TLabel
          Left = 6
          Top = 271
          Width = 68
          Height = 14
          Caption = '48V Nominal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl48VOffline: TLabel
          Left = 265
          Top = 271
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label64: TLabel
          Left = 6
          Top = 293
          Width = 51
          Height = 14
          Caption = '24 V Aux'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl24VOffline: TLabel
          Left = 265
          Top = 293
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label65: TLabel
          Left = 6
          Top = 7
          Width = 27
          Height = 14
          Caption = 'Time'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTimeWCMOffline: TLabel
          Left = 265
          Top = 7
          Width = 135
          Height = 14
          Caption = '15/July/26    00:00:00 Z'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label66: TLabel
          Left = 6
          Top = 117
          Width = 168
          Height = 14
          Caption = 'Internal Power Supply +/- 12V'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblPowerSupply12V: TLabel
          Left = 265
          Top = 117
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label67: TLabel
          Left = 6
          Top = 139
          Width = 131
          Height = 14
          Caption = 'WatchDog Comm Board'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblWatchDog: TLabel
          Left = 265
          Top = 139
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl1: TLabel
          Left = 6
          Top = 161
          Width = 132
          Height = 14
          Caption = 'Serial Lines Comm Board'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblSerialLines: TLabel
          Left = 265
          Top = 161
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label68: TLabel
          Left = 6
          Top = 183
          Width = 95
          Height = 14
          Caption = '24V Comm Board'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl24VCommBoard: TLabel
          Left = 265
          Top = 183
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object AdvTorpedoCheckReport: TAdvPageControl
      Left = 1
      Top = 89
      Width = 584
      Height = 426
      ActivePage = AdvBISTReport
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
      TabOrder = 2
      object AdvBISTReport: TAdvTabSheet
        Caption = '       BIST Report'
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        object lblAfterBody: TLabel
          Left = 183
          Top = 22
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblMotorSection: TLabel
          Left = 183
          Top = 44
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblGuidance: TLabel
          Left = 183
          Top = 66
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblBattery: TLabel
          Left = 183
          Top = 88
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblAFI: TLabel
          Left = 184
          Top = 110
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblFuse: TLabel
          Left = 183
          Top = 130
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblAcousticHead: TLabel
          Left = 183
          Top = 152
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTorpedoRunning: TLabel
          Left = 184
          Top = 174
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label69: TLabel
          Left = 7
          Top = 22
          Width = 59
          Height = 14
          Caption = 'After Body'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label70: TLabel
          Left = 7
          Top = 44
          Width = 77
          Height = 14
          Caption = 'Motor Section'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label71: TLabel
          Left = 7
          Top = 66
          Width = 94
          Height = 14
          Caption = 'Guidance/Control'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label72: TLabel
          Left = 7
          Top = 88
          Width = 40
          Height = 14
          Caption = 'Battery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label73: TLabel
          Left = 8
          Top = 110
          Width = 18
          Height = 14
          Caption = 'AFI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label74: TLabel
          Left = 7
          Top = 132
          Width = 25
          Height = 14
          Caption = 'Fuse'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label75: TLabel
          Left = 6
          Top = 176
          Width = 95
          Height = 14
          Caption = 'Torpedo Running'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label76: TLabel
          Left = 7
          Top = 154
          Width = 78
          Height = 14
          Caption = 'Acoustic Head'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
      object AdvSynthesisReport: TAdvTabSheet
        Caption = '    Synthesis  Report'
        Color = clBlack
        ColorTo = clNone
        TabColor = clBlack
        TabColorTo = clBlack
        TextColor = clLime
        object Label77: TLabel
          Left = 6
          Top = 67
          Width = 59
          Height = 14
          Caption = 'After Body'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblABSynthesis: TLabel
          Left = 182
          Top = 67
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label78: TLabel
          Left = 6
          Top = 89
          Width = 77
          Height = 14
          Caption = 'Motor Section'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblMSSynthesis: TLabel
          Left = 182
          Top = 89
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label79: TLabel
          Left = 6
          Top = 111
          Width = 94
          Height = 14
          Caption = 'Guidance/Control'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblGuidanceSynthesis: TLabel
          Left = 182
          Top = 111
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label80: TLabel
          Left = 7
          Top = 133
          Width = 18
          Height = 14
          Caption = 'AFI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblAFISynthesis: TLabel
          Left = 183
          Top = 133
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label81: TLabel
          Left = 6
          Top = 155
          Width = 25
          Height = 14
          Caption = 'Fuse'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblFuseSynthesis: TLabel
          Left = 182
          Top = 153
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label82: TLabel
          Left = 6
          Top = 177
          Width = 78
          Height = 14
          Caption = 'Acoustic Head'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblAHSynthesis: TLabel
          Left = 182
          Top = 175
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label83: TLabel
          Left = 5
          Top = 199
          Width = 95
          Height = 14
          Caption = 'Torpedo Running'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTRSynthesis: TLabel
          Left = 183
          Top = 197
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label84: TLabel
          Left = 6
          Top = 28
          Width = 40
          Height = 14
          Caption = 'Battery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblBatterySynthesis: TLabel
          Left = 182
          Top = 28
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label85: TLabel
          Left = 6
          Top = 7
          Width = 27
          Height = 14
          Caption = 'Time'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTimeSynthesis: TLabel
          Left = 182
          Top = 7
          Width = 135
          Height = 14
          Caption = '15/July/26    00:00:00 Z'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label86: TLabel
          Left = 257
          Top = 28
          Width = 79
          Height = 14
          Caption = 'Torpedo Head'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTorpedoHead: TLabel
          Left = 351
          Top = 28
          Width = 44
          Height = 14
          Caption = 'Exercise'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label87: TLabel
          Left = 5
          Top = 220
          Width = 76
          Height = 14
          Caption = 'Exercise Head'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblExerciseHead: TLabel
          Left = 183
          Top = 218
          Width = 16
          Height = 14
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
end
