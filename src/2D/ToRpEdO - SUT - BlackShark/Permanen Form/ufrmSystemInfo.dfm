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
  OnShow = FormShow
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
          Width = 100
        end
        item
          Alignment = taCenter
          Caption = 'Salvo'
          Width = 100
        end
        item
          Alignment = taCenter
          Caption = 'Torpedo'
          Width = 150
        end
        item
          Alignment = taCenter
          Caption = 'Console'
          Width = 100
        end>
      GridLines = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
end
