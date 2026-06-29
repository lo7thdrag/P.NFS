object frmSystemInfo: TfrmSystemInfo
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 236
  ClientWidth = 293
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
    Width = 293
    Height = 236
    BevelOuter = bvNone
    TabOrder = 0
    object lvEngagementList: TListView
      Left = 8
      Top = 7
      Width = 275
      Height = 150
      Color = clBlack
      Columns = <
        item
          Caption = 'Target'
        end
        item
          Caption = 'Salvo'
        end
        item
          Caption = 'Torpedo'
        end
        item
          Caption = 'Console'
        end>
      GridLines = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
end
