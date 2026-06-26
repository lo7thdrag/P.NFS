object frmWakeList: TfrmWakeList
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 251
  ClientWidth = 455
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
    Width = 457
    Height = 457
    BevelEdges = []
    BevelOuter = bvNone
    TabOrder = 0
    object lblReset: TLabel
      Left = 194
      Top = 228
      Width = 32
      Height = 16
      Caption = 'Reset'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblClose: TLabel
      Left = 409
      Top = 228
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
      OnClick = lblCloseClick
    end
    object lvWakeList: TListView
      Left = 8
      Top = 8
      Width = 441
      Height = 207
      Color = clBlack
      Columns = <
        item
          Caption = 'Wake'
          Width = 65
        end
        item
          Alignment = taCenter
          Caption = 'Lat'
          Width = 115
        end
        item
          Alignment = taCenter
          Caption = 'Long'
          Width = 115
        end
        item
          Alignment = taCenter
          Caption = 'Rep. Time'
          Width = 142
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GridLines = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
end
