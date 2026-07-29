object frmSystemInfo: TfrmSystemInfo
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 202
  ClientWidth = 480
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
    Width = 480
    Height = 202
    BevelOuter = bvNone
    TabOrder = 0
    object lvEngagementList: TListView
      Left = 8
      Top = 7
      Width = 457
      Height = 178
      Color = clBlack
      Columns = <
        item
          Caption = 'Target'
          Width = 113
        end
        item
          Alignment = taCenter
          Caption = 'Salvo'
          Width = 114
        end
        item
          Alignment = taCenter
          Caption = 'Torpedo'
          Width = 113
        end
        item
          Alignment = taCenter
          Caption = 'Console'
          Width = 113
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      GridLines = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = lvEngagementListClick
    end
  end
  object tmrUpdateEngagementList: TTimer
    Interval = 2000
    OnTimer = tmrUpdateEngagementListTimer
    Left = 224
    Top = 88
  end
end
