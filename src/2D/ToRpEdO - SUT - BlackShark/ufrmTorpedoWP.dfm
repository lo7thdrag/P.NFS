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
              object pnlOwnshipData: TPanel
                Left = 0
                Top = 0
                Width = 217
                Height = 161
                Align = alLeft
                BevelOuter = bvLowered
                Caption = 'OWNSHIP DATA'
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
          Caption = 'TORPEDO GUIDANCE WINDOW'
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
      Height = 615
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
        Height = 613
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
        Height = 613
        ParentColor = False
        Align = alClient
        TabOrder = 0
        OnMouseUp = FMapMouseUp
        OnMouseDown = FMapMouseDown
        OnDrawUserLayer = FMapDrawUserLayer
        ExplicitLeft = -2
        ControlData = {
          8A1A0600007200005B3F000001000000010000FF0D47656F44696374696F6E61
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
          010001180100004805F82A010000000EF6DB501C000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000002
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          8076C000000000008056C0000000000080764000000000008056400100000018
          0100004805F82A01000000880300C01C00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000200000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000020000000000000A
          0000006D0065003CE2970000000000A4E6970010506F1F000000000000000000
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
          Caption = 'TORPEDO HOMING COMMANDS'
          TabOrder = 0
        end
        object pnlDepthPlot: TPanel
          Left = 1
          Top = 145
          Width = 222
          Height = 403
          Align = alClient
          Caption = 'DEPTH PLOT'
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
          Caption = 'TORPEDO HOMING STATUS PLOT && ToSo COVERAGE'
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
          Caption = 'TORPEDO PARAMETERS SETTING'
          TabOrder = 1
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 848
      Width = 1105
      Height = 40
      TabOrder = 3
      object ImageButton1: TImageButton
        Left = 549
        Top = 11
        Width = 20
        Height = 20
        Picture.Data = {
          82060000424D8206000000000000420000002800000014000000140000000100
          20000300000040060000130B0000130B000000000000000000000000FF0000FF
          0000FF0000000B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B
          0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B
          0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF020202FF0202
          02FF020202FF020202FF020202FF020202FF020202FF020202FF020202FF0202
          02FF020202FF020202FF020202FF020202FF020202FF020202FF020202FF0202
          02FF0B0B0BFF0B0B0BFF020202FF020202FF020202FF020202FF020202FF0202
          02FF020202FF020202FF020202FF020202FF020202FF020202FF020202FF0202
          02FF020202FF313131FFD0D0D0FF020202FF0B0B0BFF0B0B0BFF020202FF0202
          02FF020202FF020202FF020202FF020202FF222222FF414141FF616161FF3131
          31FF020202FF020202FF020202FF020202FF313131FFDFDFDFFF313131FF0202
          02FF0B0B0BFF0B0B0BFF020202FF020202FF020202FF020202FF616161FFCFCF
          CFFFDFDFDFFFC0C0C0FFA0A0A0FFD0D0D0FFEFEFEFFF808080FF121212FF3131
          31FFDFDFDFFF313131FF020202FF020202FF0B0B0BFF0B0B0BFF020202FF0202
          02FF020202FF909090FFDFDFDFFF414141FF020202FF020202FF020202FF0202
          02FF222222FFA0A0A0FFDFDFDFFFDFDFDFFF313131FF020202FF020202FF0202
          02FF0B0B0BFF0B0B0BFF020202FF020202FF808080FFD0D0D0FF121212FF0202
          02FF020202FF020202FF020202FF020202FF020202FF020202FF818181FFDFDF
          DFFF020202FF020202FF020202FF020202FF0B0B0BFF0B0B0BFF020202FF4141
          41FFEFEFEFFF121212FF020202FF020202FF020202FF020202FF121212FF0202
          02FF020202FF020202FF020202FFA0A0A0FF808080FF020202FF020202FF0202
          02FF0B0B0BFF0B0B0BFF020202FF909090FF808080FF020202FF020202FF0202
          02FF020202FF616161FF9F9F9FFF020202FF020202FF020202FF020202FF2222
          22FFDFDFDFFF020202FF020202FF020202FF0B0B0BFF0B0B0BFF020202FFE0E0
          E0FF212121FF020202FF020202FF020202FF020202FF616161FF9F9F9FFF0202
          02FF020202FF020202FF020202FF020202FFD0D0D0FF414141FF020202FF0202
          02FF0B0B0BFF0B0B0BFF020202FFFFFFFFFF020202FF020202FF020202FF8080
          80FF9F9F9FFFBFBFBFFFDFDFDFFF9F9F9FFF9F9F9FFF121212FF020202FF0202
          02FFB0B0B0FF515151FF020202FF020202FF0B0B0BFF0B0B0BFF020202FFFFFF
          FFFF020202FF020202FF020202FF414141FF616161FFA0A0A0FFC0C0C0FF6161
          61FF515151FF020202FF020202FF020202FFB0B0B0FF515151FF020202FF0202
          02FF0B0B0BFF0B0B0BFF020202FFD0D0D0FF414141FF020202FF020202FF0202
          02FF020202FF616161FF9F9F9FFF020202FF020202FF020202FF020202FF0202
          02FFEFEFEFFF212121FF020202FF020202FF0B0B0BFF0B0B0BFF020202FF6161
          61FFA0A0A0FF020202FF020202FF020202FF020202FF414141FF717171FF0202
          02FF020202FF020202FF020202FF414141FFC0C0C0FF020202FF020202FF0202
          02FF0B0B0BFF0B0B0BFF020202FF222222FFE0E0E0FF313131FF020202FF0202
          02FF020202FF020202FF020202FF020202FF020202FF020202FF121212FFE0E0
          E0FF414141FF020202FF020202FF020202FF0B0B0BFF0B0B0BFF020202FF0202
          02FF515151FFDFDFDFFF414141FF020202FF020202FF020202FF020202FF0202
          02FF020202FF222222FFD0D0D0FF909090FF020202FF020202FF020202FF0202
          02FF0B0B0BFF0B0B0BFF020202FF020202FF020202FF414141FFEFEFEFFFA0A0
          A0FF414141FF121212FF020202FF313131FF616161FFE0E0E0FF818181FF0202
          02FF020202FF020202FF020202FF020202FF0B0B0BFF0B0B0BFF020202FF0202
          02FF020202FF020202FF121212FF818181FFC0C0C0FFEFEFEFFFFFFFFFFFD0D0
          D0FFA0A0A0FF212121FF020202FF020202FF020202FF020202FF020202FF0202
          02FF0B0B0BFF0B0B0BFF020202FF020202FF020202FF020202FF020202FF0202
          02FF020202FF020202FF020202FF020202FF020202FF020202FF020202FF0202
          02FF020202FF020202FF020202FF020202FF0B0B0BFF0B0B0BFF0B0B0BFF0B0B
          0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B
          0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B
          0BFF0B0B0BFF}
      end
      object ImageButton2: TImageButton
        Left = 522
        Top = 11
        Width = 20
        Height = 20
        Picture.Data = {
          82060000424D8206000000000000420000002800000014000000140000000100
          20000300000040060000130B0000130B000000000000000000000000FF0000FF
          0000FF0000000B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B
          0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B
          0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF0B0B0BFF0B0B0BFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF303030FFCFCFCFFF000000FF0B0B0BFF0B0B0BFF000000FF0000
          00FF000000FF000000FF000000FF000000FF202020FF3F3F3FFF5F5F5FFF3030
          30FF000000FF000000FF000000FF000000FF303030FFDFDFDFFF303030FF0000
          00FF0B0B0BFF0B0B0BFF000000FF000000FF000000FF000000FF606060FFCFCF
          CFFFDFDFDFFFBFBFBFFF9F9F9FFFCFCFCFFFEFEFEFFF7F7F7FFF101010FF3030
          30FFDFDFDFFF303030FF000000FF000000FF0B0B0BFF0B0B0BFF000000FF0000
          00FF000000FF8F8F8FFFDFDFDFFF404040FF000000FF000000FF000000FF0000
          00FF202020FF9F9F9FFFDFDFDFFFDFDFDFFF303030FF000000FF000000FF0000
          00FF0B0B0BFF0B0B0BFF000000FF000000FF7F7F7FFFCFCFCFFF101010FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF808080FFDFDF
          DFFF000000FF000000FF000000FF000000FF0B0B0BFF0B0B0BFF000000FF4040
          40FFEFEFEFFF101010FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF9F9F9FFF7F7F7FFF000000FF000000FF0000
          00FF0B0B0BFF0B0B0BFF000000FF8F8F8FFF7F7F7FFF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF2020
          20FFDFDFDFFF000000FF000000FF000000FF0B0B0BFF0B0B0BFF000000FFDFDF
          DFFF1F1F1FFF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FFCFCFCFFF3F3F3FFF000000FF0000
          00FF0B0B0BFF0B0B0BFF000000FFFFFFFFFF000000FF000000FF000000FF7F7F
          7FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF101010FF000000FF0000
          00FFAFAFAFFF4F4F4FFF000000FF000000FF0B0B0BFF0B0B0BFF000000FFFFFF
          FFFF000000FF000000FF000000FF404040FF606060FF606060FF606060FF6060
          60FF505050FF000000FF000000FF000000FFAFAFAFFF4F4F4FFF000000FF0000
          00FF0B0B0BFF0B0B0BFF000000FFCFCFCFFF3F3F3FFF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FFEFEFEFFF1F1F1FFF000000FF000000FF0B0B0BFF0B0B0BFF000000FF6060
          60FF9F9F9FFF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF404040FFBFBFBFFF000000FF000000FF0000
          00FF0B0B0BFF0B0B0BFF000000FF202020FFDFDFDFFF303030FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF101010FFDFDF
          DFFF404040FF000000FF000000FF000000FF0B0B0BFF0B0B0BFF000000FF0000
          00FF505050FFDFDFDFFF3F3F3FFF000000FF000000FF000000FF000000FF0000
          00FF000000FF202020FFCFCFCFFF8F8F8FFF000000FF000000FF000000FF0000
          00FF0B0B0BFF0B0B0BFF000000FF000000FF000000FF404040FFEFEFEFFF9F9F
          9FFF3F3F3FFF101010FF000000FF303030FF606060FFDFDFDFFF808080FF0000
          00FF000000FF000000FF000000FF000000FF0B0B0BFF0B0B0BFF000000FF0000
          00FF000000FF000000FF101010FF808080FFBFBFBFFFEFEFEFFFFFFFFFFFCFCF
          CFFF9F9F9FFF202020FF000000FF000000FF000000FF000000FF000000FF0000
          00FF0B0B0BFF0B0B0BFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF0B0B0BFF0B0B0BFF0B0B0BFF0B0B
          0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B
          0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B
          0BFF0B0B0BFF}
      end
      object Label3: TLabel
        Left = 704
        Top = 14
        Width = 14
        Height = 13
        Caption = 'nm'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object AdvComboBox1: TAdvComboBox
        Left = 586
        Top = 10
        Width = 112
        Height = 21
        Color = clBlack
        Version = '1.9.4.0'
        Visible = True
        ButtonWidth = 17
        EmptyTextStyle = []
        DropWidth = 0
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = -1
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '16'
      end
      object cbbMotionMode: TAdvComboBox
        Left = 388
        Top = 10
        Width = 112
        Height = 21
        Color = clBlack
        Version = '1.9.4.0'
        Visible = True
        ButtonWidth = 17
        EmptyTextStyle = []
        DropWidth = 0
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = -1
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'Relative Motion'
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
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 296
    Top = 848
  end
  object tmrUpdateForm: TTimer
    OnTimer = tmrUpdateFormTimer
    Left = 64
    Top = 848
  end
  object tmrUpdateDataPos: TTimer
    Interval = 100
    OnTimer = tmrUpdateDataPosTimer
    Left = 216
    Top = 848
  end
  object TimerBlink: TTimer
    Enabled = False
    Interval = 700
    OnTimer = TimerBlinkTimer
    Left = 152
    Top = 848
  end
end
