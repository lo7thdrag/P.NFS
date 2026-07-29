object FrmTorpedoWP: TFrmTorpedoWP
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmTorpedoWP'
  ClientHeight = 1080
  ClientWidth = 1920
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTEP: TPanel
    Left = 0
    Top = 888
    Width = 1920
    Height = 192
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    Align = alBottom
    BevelOuter = bvLowered
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    object pnlTacticalBtn: TPanel
      Left = 3
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Caption = 'Tactical'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object pnlSubmodeTools6: TPanel
      Tag = 6
      Left = 859
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools6: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools7: TPanel
      Tag = 7
      Left = 953
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools7: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools8: TPanel
      Tag = 8
      Left = 1047
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools8: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools9: TPanel
      Tag = 9
      Left = 1141
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools9: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlTrackManagement: TPanel
      Left = 1247
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
      OnMouseDown = pnlFuncTaskRightMouseDown
      object lblTrackManagement: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Track'#13#10'Mngmnt'
        Layout = tlCenter
        OnMouseDown = pnlFuncTaskRightMouseDown
        ExplicitWidth = 47
        ExplicitHeight = 26
      end
    end
    object pnlSystem: TPanel
      Tag = 2
      Left = 1435
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 6
      OnMouseDown = pnlFuncTaskRightMouseDown
      object lblSystem: TLabel
        Tag = 2
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'System'
        Layout = tlCenter
        OnMouseDown = pnlFuncTaskRightMouseDown
        ExplicitWidth = 43
        ExplicitHeight = 13
      end
    end
    object pnlAssFunc1: TPanel
      Tag = 1
      Left = 1631
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 7
      OnMouseDown = pnlAssFuncMouseDown
      object lblAssFunc1: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'PMA'
        Layout = tlCenter
        OnMouseDown = pnlAssFuncMouseDown
        ExplicitWidth = 25
        ExplicitHeight = 13
      end
    end
    object pnlRadarFreeze: TPanel
      Tag = 1
      Left = 1341
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 8
      OnMouseDown = pnlFuncTaskRightMouseDown
      object lblRadarFreeze: TLabel
        Tag = 1
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Radar'#13#10'Freeze'
        Layout = tlCenter
        OnMouseDown = pnlFuncTaskRightMouseDown
        ExplicitWidth = 38
        ExplicitHeight = 26
      end
    end
    object pnlAssFunc2: TPanel
      Tag = 1
      Left = 1725
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 9
      OnMouseDown = pnlAssFuncMouseDown
      object lblAssFunc2: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Snapshot'
        Layout = tlCenter
        OnMouseDown = pnlAssFuncMouseDown
        ExplicitWidth = 53
        ExplicitHeight = 13
      end
    end
    object pnlAssFunc0: TPanel
      Left = 1537
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 10
      OnMouseDown = pnlAssFuncMouseDown
      object lblAssFunc0: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Tactical'#13#10'Recording'
        Layout = tlCenter
        OnMouseDown = pnlAssFuncMouseDown
        ExplicitWidth = 57
        ExplicitHeight = 26
      end
    end
    object pnlTorpedoBtn: TPanel
      Tag = 2
      Left = 97
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Caption = 'Torpedo'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 11
      OnMouseDown = pnlTacticalBtnMouseDown
    end
    object pnlIntercom: TPanel
      Left = 1825
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 12
      object lblIntercom: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Intercom'
        Layout = tlCenter
        ExplicitWidth = 53
        ExplicitHeight = 13
      end
    end
    object pnlTMABtn: TPanel
      Tag = 1
      Left = 3
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Caption = 'TMA'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 13
    end
    object pnlSubmodeTools16: TPanel
      Tag = 16
      Left = 859
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 14
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools16: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools17: TPanel
      Tag = 17
      Left = 953
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 15
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools17: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools18: TPanel
      Tag = 18
      Left = 1047
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 16
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools18: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools19: TPanel
      Tag = 19
      Left = 1141
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 17
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools19: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlRecordPMA: TPanel
      Tag = 3
      Left = 1247
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 18
      OnMouseDown = pnlFuncTaskRightMouseDown
      object lblRecordPMA: TLabel
        Tag = 3
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Record'#13#10'PMA'
        Layout = tlCenter
        OnMouseDown = pnlFuncTaskRightMouseDown
        ExplicitWidth = 40
        ExplicitHeight = 26
      end
    end
    object pnlToolkit: TPanel
      Tag = 5
      Left = 1435
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 19
      OnMouseDown = pnlFuncTaskRightMouseDown
      object lblToolkit: TLabel
        Tag = 5
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Toolkit'
        Layout = tlCenter
        OnMouseDown = pnlFuncTaskRightMouseDown
        ExplicitWidth = 39
        ExplicitHeight = 13
      end
    end
    object pnlAssFunc4: TPanel
      Tag = 4
      Left = 1631
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 20
      OnMouseDown = pnlAssFuncMouseDown
      object lblAssFunc4: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Image '#13#10'Replay'
        Layout = tlCenter
        OnMouseDown = pnlAssFuncMouseDown
        ExplicitWidth = 40
        ExplicitHeight = 26
      end
    end
    object pnlControlByNumber: TPanel
      Tag = 4
      Left = 1341
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 21
      OnMouseDown = pnlFuncTaskRightMouseDown
      object lblControlByNumber: TLabel
        Tag = 4
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Control'#13#10'By'#13#10'Number'
        Layout = tlCenter
        OnMouseDown = pnlFuncTaskRightMouseDown
        ExplicitWidth = 44
        ExplicitHeight = 39
      end
    end
    object pnlResmBtn: TPanel
      Tag = 4
      Left = 191
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Caption = 'RESM'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 22
    end
    object pnlAssFunc5: TPanel
      Tag = 5
      Left = 1725
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 23
      OnMouseDown = pnlAssFuncMouseDown
      object lblAssFunc5: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Layout = tlCenter
        OnMouseDown = pnlAssFuncMouseDown
        ExplicitWidth = 3
        ExplicitHeight = 13
      end
    end
    object pnlAssFunc3: TPanel
      Tag = 3
      Left = 1537
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 24
      OnMouseDown = pnlAssFuncMouseDown
      object lblAssFunc3: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Image'#13#10'Recording'
        Layout = tlCenter
        OnMouseDown = pnlAssFuncMouseDown
        ExplicitWidth = 57
        ExplicitHeight = 26
      end
    end
    object pnlPeriscopeBtn: TPanel
      Tag = 3
      Left = 97
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Caption = 'Periscope'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 25
    end
    object pnlAckAlert: TPanel
      Left = 1825
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 26
      object lblAckAlert: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Ack'#13#10'Alert'
        Layout = tlCenter
        ExplicitWidth = 28
        ExplicitHeight = 26
      end
    end
    object pnlLinkBtn: TPanel
      Tag = 5
      Left = 191
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Caption = 'Link'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 27
    end
    object pnlSubmodeTools10: TPanel
      Tag = 10
      Left = 299
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 28
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools10: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools11: TPanel
      Tag = 11
      Left = 393
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 29
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools11: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools12: TPanel
      Tag = 12
      Left = 487
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 30
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools12: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools13: TPanel
      Tag = 13
      Left = 581
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 31
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools13: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools14: TPanel
      Tag = 14
      Left = 675
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 32
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools14: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools0: TPanel
      Left = 299
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 33
      object lblSubmodeTools0: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 34
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools15: TPanel
      Tag = 15
      Left = 769
      Top = 100
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 34
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools15: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools1: TPanel
      Tag = 1
      Left = 393
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 35
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools1: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools2: TPanel
      Tag = 2
      Left = 487
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 36
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools2: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools3: TPanel
      Tag = 3
      Left = 581
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 37
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools3: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools4: TPanel
      Tag = 4
      Left = 675
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 38
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools4: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
    object pnlSubmodeTools5: TPanel
      Tag = 5
      Left = 769
      Top = 6
      Width = 88
      Height = 88
      BevelWidth = 2
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 39
      OnMouseDown = pnlSubmodeTools0MouseDown
      object lblSubmodeTools5: TLabel
        Left = 2
        Top = 2
        Width = 84
        Height = 84
        Align = alClient
        Alignment = taCenter
        Caption = 'Label1'
        Color = clBtnFace
        ParentColor = False
        Layout = tlCenter
        OnMouseDown = pnlSubmodeTools0MouseDown
        ExplicitWidth = 37
        ExplicitHeight = 13
      end
    end
  end
  object pnlBase: TPanel
    Left = 0
    Top = 0
    Width = 1920
    Height = 888
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    Align = alClient
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 1
    object pnlInfoAtas: TPanel
      Left = 0
      Top = 0
      Width = 1920
      Height = 337
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Align = alTop
      BevelOuter = bvNone
      Color = clBlack
      ParentBackground = False
      TabOrder = 0
      object pnlLeft: TPanel
        Left = 0
        Top = 0
        Width = 1624
        Height = 337
        Align = alLeft
        BevelOuter = bvLowered
        TabOrder = 0
        object pnlTop: TPanel
          Left = 1
          Top = 1
          Width = 1622
          Height = 238
          Align = alTop
          TabOrder = 0
          object pnlTorpedoTubes: TPanel
            Left = 1328
            Top = 1
            Width = 293
            Height = 236
            Align = alClient
            BevelOuter = bvNone
            Caption = 'TORPEDO && TUBES COMMANDS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object pnlGroupInfo: TPanel
            Left = 1
            Top = 1
            Width = 1327
            Height = 236
            Align = alLeft
            BevelOuter = bvLowered
            TabOrder = 1
            object pnlGroupInfoAtas: TPanel
              Left = 1
              Top = 1
              Width = 1325
              Height = 161
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object pnlInformationTorpedo: TPanel
                Left = 0
                Top = 0
                Width = 217
                Height = 161
                Align = alLeft
                BevelOuter = bvLowered
                Caption = 'INFORMATION TORPEDO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object pnlAlerts: TPanel
                Left = 217
                Top = 0
                Width = 321
                Height = 161
                Align = alLeft
                BevelOuter = bvLowered
                Caption = 'ALERTS && OPERATOR MESSAGES'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object pnlTargetInControl: TPanel
                Left = 538
                Top = 0
                Width = 348
                Height = 161
                Align = alLeft
                BevelOuter = bvLowered
                Caption = 'TARGET IN CONTROL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object pnlContactInCtrl: TPanel
                Left = 886
                Top = 0
                Width = 439
                Height = 161
                Align = alClient
                BevelOuter = bvLowered
                Caption = 'CONTACT IN CONTROL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
            end
            object pnlGroupInfoBawah: TPanel
              Left = 1
              Top = 162
              Width = 1325
              Height = 73
              Align = alClient
              BevelOuter = bvNone
              Caption = 'ENGAGEMENT DATA OVERVIEW'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
        end
        object pnlTorpedoGuidanceWindow: TPanel
          Left = 1104
          Top = 239
          Width = 519
          Height = 97
          Align = alRight
          TabOrder = 1
        end
      end
      object pnlTorpedoTubesStatus: TPanel
        Left = 1624
        Top = 0
        Width = 296
        Height = 337
        Align = alClient
        Caption = 'TORPEDO TUBES STATUS'
        TabOrder = 1
      end
    end
    object pnlTorpedoGeo: TPanel
      Left = 0
      Top = 239
      Width = 1105
      Height = 616
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      BevelOuter = bvLowered
      TabOrder = 1
      object imgBackgrounSituationZone: TImage
        Left = 1
        Top = 1
        Width = 1103
        Height = 614
        Align = alClient
        Visible = False
        ExplicitLeft = 686
        ExplicitTop = 5
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
      object FMap: TMap
        Left = 1
        Top = 1
        Width = 1103
        Height = 614
        ParentColor = False
        Align = alClient
        TabOrder = 0
        OnMouseUp = FMapMouseUp
        OnMouseDown = FMapMouseDown
        OnDrawUserLayer = FMapDrawUserLayer
        ExplicitLeft = -2
        ExplicitHeight = 613
        ControlData = {
          8A1A060000720000753F000001000000010000FF0D47656F44696374696F6E61
          727905456D70747900E8030000000000000000000002000E001E000000000000
          0000000000000000000000000000000000000000000600010000000000500001
          010000640000000001F4010000050000800C000000000000000000000000FFFF
          FF000100000000000000000000000000000000000000000000000352E30B918F
          CE119DE300AA004BB851010000009001B435070005417269616C000352E30B91
          8FCE119DE300AA004BB851010000009001348C030005417269616C0000000000
          00000000000000000000000000000000000000000000000000000000000000FF
          FFFF000000000000000001370000000000FFFFFF000000000000000352E30B91
          8FCE119DE300AA004BB851010000009001DC7C010005417269616C000352E30B
          918FCE119DE300AA004BB851010200009001A42C02000B4D61702053796D626F
          6C730000000000000001000100FFFFFF000200FFFFFF00000000000001000000
          01000118010000A0564B2A010000000EF6DB501C000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000002
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          8076C000000000008056C0000000000080764000000000008056400100000018
          010000A0564B2A01000000880300C01C00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000200000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000020000000000000A
          0000006D0065003CE2970000000000A4E697002F55D9DD000000000000000000
          000088B3400000000000408F400001000001}
      end
    end
    object pnlTorpedoRight: TPanel
      Left = 1105
      Top = 337
      Width = 815
      Height = 551
      Align = alRight
      TabOrder = 2
      object pnl1: TPanel
        Left = 1
        Top = 1
        Width = 224
        Height = 549
        Align = alLeft
        TabOrder = 0
        object pnlTorpedoHomingCmd: TPanel
          Left = 1
          Top = 1
          Width = 222
          Height = 144
          Align = alTop
          TabOrder = 0
        end
        object pnlDepthPlot: TPanel
          Left = 1
          Top = 145
          Width = 222
          Height = 403
          Align = alClient
          TabOrder = 1
        end
      end
      object pnl2: TPanel
        Left = 225
        Top = 1
        Width = 589
        Height = 549
        Align = alClient
        TabOrder = 1
        object pnlTorpedoHomingStatusPlot: TPanel
          Left = 1
          Top = 1
          Width = 587
          Height = 224
          Align = alTop
          TabOrder = 0
          object pnlToSo: TPanel
            Left = 10
            Top = 78
            Width = 561
            Height = 137
            BevelOuter = bvNone
            Caption = 'ToSo'
            TabOrder = 0
          end
        end
        object pnlTorpedoParamSettings: TPanel
          Left = 1
          Top = 225
          Width = 587
          Height = 323
          Align = alClient
          TabOrder = 1
        end
      end
    end
    object pnlGeo: TPanel
      Left = 0
      Top = 850
      Width = 1107
      Height = 38
      Color = clBlack
      ParentBackground = False
      TabOrder = 3
      DesignSize = (
        1107
        38)
      object ibBoxedZoom: TImageButton
        Left = 532
        Top = 10
        Width = 20
        Height = 20
        Anchors = []
        Picture.Data = {
          C6050000424DC605000000000000360400002800000014000000140000000100
          08000000000090010000120B0000120B00000001000000000000000000000D0D
          0C001A1A1A001818180017161700151516001616170017171700070707000405
          05004A4B4A00A2A1A1009E9E9F00979698009494950099989A00959595003434
          3400080808000B0B0B00494B4B00444646000506060005050500060606005A5A
          590037373600040404001D1D1D00414242003C3D3D0019191900252626002627
          2700222324002424250027272700151515004A4A4800353534004C4C4C006464
          6400030303005B5B5B009A9A9B007B7C7E007C7E7F0082838400313131008B8B
          8B002A2A2A004F4F4F0063636300010101005858580048484800010202000202
          020073737300333333008A8A8A006A6A6A00595959004A4A4A00757575008C8C
          8C002D2D2D004E4E4E00676767004B4B4B0076767600919191002C2C2C000304
          04004F504F00696969005E5E5E005252520079797900323232008D8D8D002B2C
          2B004D4D4D005F5F5F0029292A002828280022222200818181003C3C3C002424
          24003A3A3A00747474007D7D7D00808080007A7A7A007F7F7F00212121002323
          230070707000202020006C6D6C00777877001F1F1F002B2B2B00565656001212
          12001F201F0075767400C7CAC8008C8F8C004E514F0047474700444444005050
          5000262626001D1E1C0064656300CCCDCC00999B9C003A3B3D00373839007A7B
          7C00777777007E7E7D007A7A7C00C7C7C900868686003838370092939100BEBE
          BD002E2E2D003F3F3E0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000350000
          0000000000000000000000000000000024830000000000000000000000000000
          0000005980818239000000000000000000000000000000257C7D7E7F39000000
          000000000000000000000000737475767778797A407B3A5E7200000000000000
          006A6B6C6D6E4A3F6F37377071720000000000000000636465661B1B1B171718
          676869350000000000005828595A5B5C5D5C5E5F6061621F000000000000523D
          0053295424555657423547320000490000004A4B004C4D000000004E4F355051
          0000000000004344002B45000000004611394748000000000000373D353E3F00
          00000040113541420000000000003334353637353538393A3B393C2400000000
          000028292A2B2C2D2E2F2D0C301731320000000000001C1D1E1F202021222324
          2526271800000000000000131415161717181808191A1B000000000000000000
          090A0B0C0D0E0F10111200000000000000000000000102030405060708000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000}
        ExplicitTop = 11
      end
      object ibGrab: TImageButton
        Left = 501
        Top = 10
        Width = 20
        Height = 20
        Anchors = []
        OnClick = ibGrabClick
        Picture.Data = {
          C6050000424DC605000000000000360400002800000014000000140000000100
          08000000000090010000120B0000120B00000001000000000000000000000100
          0000222221006B6B69003536350011100F00575352002F2E2D004C4D4B00CDCE
          CB005B5B59002021200053504F0032302F004F4E4E00CBCACA00767575004343
          4300CECECD006061600039393900C6C7C60063646300010101007A7B78009FA0
          9D003D3D3B0047474700CDCDCD005D5D5D003B3B3B00C7CAC9006B6C6C002425
          25001F1E1F003B3D3C00CFD0CE00828180004545450060606000C8C9C9006E6F
          6E003F3F3F00909090003E3E3E001516160083838300A9A6A7007D7D7D00CFCF
          CF009C9C9C0089898900D1D1D1006D6D6D0058585800C8C8C80040403F002525
          2500908F8F005A5A5A000202020053535300D9D8D800D7D7D700D3D3D300CECE
          CE00A5A5A500A7A7A700373737003A3A3A00CCCCCC00A3A3A3004A4A4A005252
          5200D4D4D400C7C7C7007F7F7F000B0B0B000D0D0D0059595900D8D8D700B8B8
          B700A6A7A500D5D6D400D4D6D400D3D4D300D2D3D200D6D8D600D7D8D700CFCF
          CE00C7C7C6005C5C5C000303030086878500D3D4D100D7D8D500D5D6D300D2D5
          D200D3D7D400D6DAD700CCCDCB00C4C5C200696A68004D4E4D00CECFCE00D1D3
          D100D2D4D200D2D5D300D1D2CF00CCCCCB00696968000E0E0E001F2020006365
          6500D6D5D500D8D8D800D5D5D500C1C0C1004F4F4F000A0A0A006E6E6E00D2D2
          D200DADBDB00D6D7D700D1D2D200D6D6D600CCCDCC0071717200141414001717
          170064656500D7DAD900D1D4D400CCCFCF00D0D3D300CACCCC006C6D6D000C0C
          0C00262727002223230020212100242323001615150000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000898A8B
          218C8D8E00000000000000000000000081828384858687880000000000000000
          0000007778797A7B7C7D7E7F8000000000000000000070713172737340742475
          7600000000000000000067685353696A6B6A6C6D6E6F000000000000005C5D5E
          5F60616261635F6465660000000000004E4F505152535455565758595A5B0000
          0000000045464748494A3F4A40404A404B4C4D0000000000393A3B3C3D3E3F40
          31314142431C4400000000000017002D2E2F3031323334353637380000000000
          000000232425261C271428292A2B2C000000000000000218191A1B1C1D1E1F20
          002122000000000000000E0F1000111213141516001700000000000000000506
          070008090A0B0C0D000000000000000000000001010002030400000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000}
        ShadowColor = clWhite
        ExplicitTop = 11
      end
      object lblZoomScaleSat: TLabel
        Left = 795
        Top = 11
        Width = 18
        Height = 16
        Anchors = []
        Caption = 'nm'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ExplicitTop = 12
      end
      object ibZoomIn: TImageButton
        Tag = 1
        Left = 647
        Top = 10
        Width = 20
        Height = 20
        Anchors = []
        OnClick = ZoomClick
        Picture.Data = {
          C6050000424DC605000000000000360400002800000014000000140000000100
          08000000000090010000120B0000120B00000001000000000000000000000202
          020003030200080908000707070005050500050504000707080048484800A2A2
          A200A5A5A5009D9D9D009C9B9B009F9F9F0049494900606060003B3B3B003E3E
          3E003F3F3F005F5F5F004141410001010100454544005E5E5E00191919001918
          1900555454003D3E3C00040404004646460066666600151515004E4E4E004B4B
          4800020201002121200057595A00444647006161610065656500626262006160
          61006F7272005A5C5D00676767006B6B6B005F5E5E00050404006A6C6C005A5C
          5C00686A6A00616262004E4C4D009C9A9A009D9B9C00B6B4B500ADACAC009796
          9500989796003E3D3D006D6D6E005D5D5E0066676700676868001A1A1A003635
          350034333400818080007C7C7C003333330037373700181818006A696B005656
          57006668670068696900626362005F605E00706F700055555600626463006163
          620001020200656665006A6A69007774740055535400131413005F6260003C3D
          3C00313132001D1D1D0043454400292A2A00393A39008D8D8C008A8B89003232
          32003636360059595900272727000201020028282900B6B5B700CDCCCE008281
          83005E5E5D00737371006C6D6B006D6D6C006E6F6E006D6E6E005B5C5B002525
          25003C3B3C009B9A9B00D1D1D1009A9A9A00212121002B2B2B00585858005555
          5500585959005759590054565600242525003E3E3F009E9D9F00D5D5D5006363
          63002F2F30008C8C8C0022222200313131002020200000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000010000000000
          0000000000000000000000000000000085860000000000000000000000000000
          000000820B8384000000000000000000000000000000007E7F80817100000000
          0000000000000000000000157273747576771378797A7B7C7D00000000000000
          65666768696A6B6C6D6E6F3E707100000000000000005E5F6061000015151501
          626364150000000000005758591500005A5B0000015C5C5D0000150000005051
          5200000053540000000155560000150000004A4B000000004C4D000000004E4F
          0000000000003E3F004041424344454647004849000000000000323300343536
          3738393A3B003C3D0000000000002C2D00001501172E2F051500303100000000
          00002627000015002829000000002A2B0000000000001D1E1F00000020212200
          1523242500000000000001161718000015010000191A1B1C0000000000000001
          0E0F1010101011121314150000000000000000000708090A090B0C0D0E010000
          0000000000000000000203030405050506000000000000000000000000000000
          00000000000000000001}
        ExplicitTop = 11
      end
      object ibZoomOut: TImageButton
        Left = 621
        Top = 9
        Width = 20
        Height = 20
        Anchors = []
        OnClick = ZoomClick
        Picture.Data = {
          C6050000424DC605000000000000360400002800000014000000140000000100
          08000000000090010000120B0000120B0000000100000000000000000000090A
          090021212000292928002C2D2B002D2D2C002F302F002B2B2A00111111000F0F
          0F004545440099999800949594009294930091939200929393008E8F8D005050
          4F0008080800101010004A4A4A00555555000404040004040500050506000304
          0400020303003B3B3B00595959001414140001010100454545004F4F4F000707
          0700363635004141410015151500393938007475730004040300050504006263
          6100565755003D3D3C007879770063646200646463003C3D3C00727270000D0D
          0D0033343300303030002C2C2C002F2F2F002D2D2D002A2A2A000E0E0E006968
          6A00535354003839380075767400323231009B9C9A0097979700919191009393
          9300939392004343420061615F005D5D5C003737380078777A000B0B0A000B0B
          0B000B0A0B00090909000A0A0A00030303005D5E5C005F5F5D00373737007778
          77005E5E5C002D2E2D007C7C7A00090908005656540060615F00494A48005959
          57003B3B3900464645001B1C1B005B5B5A00BCBCBC00A5A5A500606060002020
          20001D1D1D001F201E0050514E00575855000C0C0B0026262600C3C3C300BEBE
          BE0064646400A6A6A600A0A0A0009F9F9F00A4A4A4009D9D9D009E9F9D005B5C
          59000E0E0D000605050047464400C4C3C100B9B9B80071717100020202000505
          05000606060020201F009C9D9B00C1C2BF0065656400131313003F4140007E7F
          7E00080908000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000012310000
          0000000000000000000000000000001680818200000000000000000000000000
          0000007B7C7D7E7F000000000000000000000000000000737475767712781616
          797A7A217A000000000000004D6768696A236B6C6D6E6F707172000000000000
          004D5D5E5F606161626262636465660000000000000031585948000000000000
          4C5A5B5C00000000000053542100000000000000005556570000000000005051
          0000000000000000000052290000000000004647002148494A4B4C4B4D004E4F
          0000000000003B3C003D3E3F40414142430044450000000000002F3000313233
          343536373800393A0000000000002B2C000000000000000000002D2E00000000
          0000252627000000000000000028292A000000000000161F2021000000000000
          1622232400000000000000131415161718191A181B1C1D1E0000000000000000
          090A0B0C0D0E0F10111200000000000000000000000102030405060708000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000}
        ExplicitTop = 10
      end
      object lblMapFilter: TLabel
        Left = 859
        Top = 11
        Width = 41
        Height = 16
        Anchors = []
        Caption = 'Filter...'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ExplicitTop = 12
      end
      object lblOwnShipCenter: TLabel
        Left = 587
        Top = 10
        Width = 28
        Height = 18
        Anchors = []
        AutoSize = False
        Caption = 'OS'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        OnClick = lblOwnShipCenterClick
        ExplicitTop = 11
      end
      object lblCursorCenter: TLabel
        Left = 565
        Top = 10
        Width = 16
        Height = 18
        Anchors = []
        AutoSize = False
        Caption = 'X'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ExplicitTop = 11
      end
      object cbbZoomScale: TAdvComboBox
        Left = 677
        Top = 8
        Width = 112
        Height = 24
        Color = clBlack
        Version = '1.9.4.0'
        Visible = True
        Anchors = []
        ButtonWidth = 17
        EmptyTextStyle = []
        DropWidth = 0
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 5
        Items.Strings = (
          '0.125'
          '0.250'
          '0.5'
          '1'
          '2'
          '4'
          '8'
          '16'
          '32'
          '64'
          '128'
          '256'
          '512'
          '1024'
          '2048')
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '4'
        OnChange = cbbZoomScaleChange
      end
      object cbbMotionMode: TAdvComboBox
        Left = 377
        Top = 8
        Width = 112
        Height = 24
        Color = clBlack
        Version = '1.9.4.0'
        Visible = True
        Anchors = []
        ButtonWidth = 17
        EmptyTextStyle = []
        DropWidth = 0
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 1
        Items.Strings = (
          'True Motion'
          'Relative Motion')
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'Relative Motion'
        OnChange = cbbMotionModeChange
      end
    end
  end
  object imgListLight: TImageList
    ColorDepth = cd32Bit
    Left = 377
    Top = 249
    Bitmap = {
      494C010107000800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF30C035FF2FAF32FF38C13DFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000004F6998FF465D95FF587099FF00000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF5B9985FF549283FF639A89FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF27BC28FF1F6F1AFF24631EFF057300FF24621EFF266A22FF39B43BFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      00003F58A2FF080E98FF000095FF000095FF000091FF0F148FFF52669BFF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF4D9D8DFF258688FF1E8589FF009875FF1E8084FF2D7B80FF60968BFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF25C7
      29FF226D1EFF0A8A00FF0C9200FF0C9200FF0C8E00FF088200FF245D1EFF39B3
      3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000003D57
      ADFF0000A0FF0000ACFF0000B4FF0000B3FF0000AEFF0000A0FF00008DFF5166
      9BFF00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF48AA
      98FF1E919BFF00B49AFF00B99CFF00B797FF00B18FFF00A482FF1E7A7DFF6096
      8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF1F8B
      23FF0CA20DFF0DA909FF0EA802FF0EA700FF0DA000FF0C9500FF088200FF276B
      1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000106
      ADFF0000B6FF0000C4FF0000CAFF0000CBFF0000C4FF0000B6FF0000A2FF0B0F
      92FF00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF1F9D
      A8FF00C3B1FF00CCB7FF00D0B5FF00CFB1FF00C7A6FF00B998FF00A685FF2880
      83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF41DD4DFF2296
      35FF0DBF20FF0FBE13FF0FBE09FF10BD02FF0FB300FF0EA200FF0C9100FF2364
      1EFF3EC742FFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000005A75C9FF0000
      B3FF0000C7FF0000D3FF0000DCFF0000E0FF0000D7FF0000C6FF0000B2FF0000
      96FF5B74A1FF000000000000000000000000FFFFFFFFFFFFFFFF60CCBCFF1EA7
      BAFF00D4C8FF00DACAFF00E0CAFF00E2C7FF00DABCFF00CAABFF00B797FF1E86
      8BFF66A292FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF39D64DFF05C0
      2EFF0DD137FF0FCD24FF0FCB13FF10CA09FF10C003FF0FAE00FF0D9900FF0478
      00FF3ABA3BFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000004D65CDFF0000
      BAFF0000CFFF0000DAFF0000E6FF0000ECFF0000E2FF0000CFFF0000BBFF0000
      9DFF4D62A3FF000000000000000000000000FFFFFFFFFFFFFFFF53CFC3FF00CA
      BFFF00DDD5FF00E2D6FF00E8D7FF00ECD5FF00E4CBFF00D4BBFF00C1A7FF00A3
      85FF5AA193FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF39E04FFF25AE
      52FF0DDB4CFF0DD83BFF0FD225FF10CE13FF10C509FF0FB703FF0DA200FF236D
      1EFF44D147FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000536ECBFF0000
      BEFF0000D1FF0000DBFF0000E4FF0000E7FF0000E0FF0000D1FF0000BEFF0000
      A1FF5F77AEFF000000000000000000000000FFFFFFFFFFFFFFFF56D0C1FF1EB5
      CDFF00E1DCFF00E5DEFF00E9DEFF00EADBFF00E4D2FF00D8C5FF00C7B3FF1E93
      9CFF68B0A0FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF22B2
      4DFF0BDC56FF0CE052FF0EDA3CFF0FD426FF10CB14FF10BF09FF0CA600FF2683
      1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000409
      C3FF0000CCFF0000D8FF0000DCFF0000DDFF0000D8FF0000CEFF0000B9FF070B
      A9FF00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF20B6
      CAFF00DFDCFF00E5E3FF00E7E2FF00E6DEFF00E1D7FF00D8CCFF00C6B5FF249A
      A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF23D9
      3FFF26B35BFF0BDE57FF0CDF4FFF0EDB3AFF0FD224FF0FBF0FFF218A1EFF53D0
      52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000003750
      C4FF0000C5FF0000CDFF0000D4FF0000D4FF0000D0FF0000C3FF0000AEFF687D
      D1FF00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF3DC6
      BCFF1EBAD4FF00E2DFFF00E4E2FF00E3DFFF00DFD9FF00D3CAFF1EA1B2FF6FCD
      C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF1FD73BFF22B74DFF28B657FF0BCE35FF28AB3BFF25A227FF41D442FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000324BC1FF060CC7FF0000C6FF0000C6FF0000C0FF070CBBFF566CCCFF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF38C3BAFF1FBCCFFF1EBDD8FF00D8D2FF1EB7CFFF23AEBFFF5DCAC1FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF23DE39FF25D437FF2EE03CFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000003D59BCFF354CBEFF4863BFFF00000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF3FC5B5FF3BC1B9FF4AC6B8FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF122CC5FF122DC8FF122DC8FF2236B3FFB9BEDFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFA8A8A8FF9D9D9DFFA7A7A7FFBFBFBFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF666F66FF676A67FF6E746FFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF48E96DFF49F571FF47EB6DFF45EB6CFF4DE972FF85E39AFFBBE9C5FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF122D
      C8FF142FC5FF122DC7FF122DC8FF122DC8FF1831C0FF5969CEFF7280CCFFE9EA
      F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF939494FF929292FF9D9D9DFF989898FF9C9C9CFF9D9D9DFFB4B4B4FFB7B7
      B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF606460FF634963FF6D4D6DFF5A5A5AFF6C4C6CFF674B67FF706E70FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF49F8
      72FF49F671FF49F772FF49F872FF49F872FF49F872FF4AF672FF5EEC81FF8DE0
      9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF122DC8FF122D
      C8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF263EC7FFA4AB
      DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9393
      93FF949494FF959595FF959595FF959595FF959595FF959595FF969696FFA0A0
      A0FFA4A4A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6166
      61FF6A4969FF666665FF6C6C6CFF6E6E6EFF6C6C6BFF646464FF694969FF706E
      70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF48F571FF49F8
      72FF49F872FF49F872FF49F872FF49F872FF49F872FF49F872FF49F872FF5EEC
      81FFBBE9C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF122BC1FF122DC6FF122D
      C8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF283F
      C5FF5F6DC5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF929292FF9595
      95FF959595FF959595FF959595FF959595FF959595FF959595FF959595FF9696
      96FFAAAAAAFFD5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6448
      64FF666666FF707070FF797979FF7C7C7CFF797979FF707070FF646464FF684C
      68FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF48EF6FFF49F8
      72FF49F872FF49F872FF49F872FF49F872FF49F872FF49F872FF49F872FF4AF6
      72FF86E39CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF122DC7FF122DC7FF122D
      C8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF132E
      C7FF4F5FC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF929292FF949494FF9595
      95FF959595FF959595FF959595FF959595FF959595FF959595FF959595FF9595
      95FF9B9B9BFFB7B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF838C83FF6C4C
      6CFF6C6C6CFF79797AFF888888FF8D8D8DFF888888FF797979FF6C6C6CFF6D4D
      6DFF757D76FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF49F872FF49F8
      72FF49F872FF49F872FF49F872FF49F872FF49F872FF49F872FF49F872FF49F8
      72FF8AEAA1FFDFEDE1FFFFFFFFFFFFFFFFFFFFFFFFFF122CC4FF122DC8FF122D
      C8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122D
      C8FF6574CEFFD3D4E2FFFFFFFFFFFFFFFFFFFFFFFFFF949494FF959595FF9595
      95FF959595FF959595FF959595FF959595FF959595FF959595FF959595FF9595
      95FF959595FFA4A4A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808680FF5A5A
      5BFF6E6E6EFF7D7D7DFF8E8E8EFF969696FF8E8E8EFF7D7D7DFF6E6E6EFF5A5A
      5AFF757575FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF49F872FF49F8
      72FF49F872FF49F872FF49F872FF49F872FF49F872FF49F872FF49F872FF49F8
      72FF7DEA98FFD0E9D5FFFFFFFFFFFFFFFFFFFFFFFFFF122DC8FF122DC8FF122D
      C8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122D
      C8FF5364CAFFB5B9D7FFFFFFFFFFFFFFFFFFFFFFFFFF949494FF959595FF9595
      95FF959595FF959595FF959595FF959595FF959595FF959595FF959595FF9595
      95FF959595FFB4B4B4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C887CFF6E4E
      6EFF6C6C6CFF7A7A7AFF898989FF8F8F8FFF898989FF7A7A7AFF6C6C6CFF6D4D
      6DFF808881FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF49F872FF49F8
      72FF49F872FF49F872FF49F872FF49F872FF49F872FF49F872FF49F872FF49F8
      72FF70E68DFFD8E9DBFFFFFFFFFFFFFFFFFFFFFFFFFF122CC4FF122DC8FF122D
      C8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122D
      C8FF6574CFFFD3D4E2FFFFFFFFFFFFFFFFFFFFFFFFFF939393FF959595FF9595
      95FF959595FF959595FF959595FF959595FF959595FF959595FF959595FF9595
      95FF959595FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF684C
      68FF676767FF717171FF7B7A7AFF808080FF7A7A7AFF717171FF656565FF6B4F
      6BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5F1E7FF6FEB8EFF49F8
      72FF49F872FF49F872FF49F872FF49F872FF49F872FF49F872FF49F872FF4BF4
      73FF8EE3A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B6CD1FF122DC7FF122D
      C8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF132E
      C7FF5060C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF949494FF949494FF9595
      95FF959595FF959595FF959595FF959595FF959595FF959595FF959595FF9595
      95FF959595FFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666A
      65FF715070FF676767FF6C6C6CFF6F6F6FFF6D6D6DFF666666FF684868FF9898
      99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF47EE6EFF48F5
      71FF49F872FF49F872FF49F872FF49F872FF49F872FF49F872FF4AF772FF71EA
      8EFFB3E5BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF142DBFFF122DC6FF122D
      C8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF2A40
      C6FF616FC4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF979797FF959595FF9595
      95FF959595FF959595FF959595FF959595FF959595FF959595FF959595FF9595
      95FF989898FFB0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF616561FF6A506AFF735373FF606060FF705070FF6B4F6AFF898A89FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF48F4
      70FF49F370FF49F671FF49F872FF49F872FF49F872FF4DF274FF78E994FFC1EA
      CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF122DC8FF122D
      C8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF122DC8FF1F37C6FFA3AB
      DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF959595FF9595
      95FF959595FF959595FF959595FF959595FF959595FF959595FF959595FF9595
      95FFA6A6A6FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF657166FF696C69FF727C73FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF46EB6DFF49F872FF49F872FF48F671FF5FE07DFFCAEAD1FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF122D
      C7FF142EC3FF132DC6FF122CC5FF122CC5FF1D35C1FF4054C6FF7381CEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFFB0B0
      B0FF969696FF959595FF959595FF959595FF959595FF959595FF959595FFB1B1
      B1FFD5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF152DBEFF112BC2FF112BC0FF2E41B7FF99A0CDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDD
      DDFF959595FFA1A1A1FF969696FF959595FF969696FF9F9F9FFFA2A2A2FFD7D7
      D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFEBEBEBFFD9D9D9FFE8E8E8FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object tmrUpdateTWP: TTimer
    Interval = 250
    OnTimer = tmrUpdateTWPTimer
    Left = 528
    Top = 368
  end
  object tmrUpdateForm: TTimer
    Enabled = False
    OnTimer = tmrUpdateFormTimer
    Left = 264
    Top = 368
  end
  object tmrUpdateTorpedoData: TTimer
    OnTimer = tmrUpdateTorpedoDataTimer
    Left = 432
    Top = 368
  end
  object TimerBlink: TTimer
    Enabled = False
    Interval = 700
    OnTimer = TimerBlinkTimer
    Left = 360
    Top = 368
  end
end
