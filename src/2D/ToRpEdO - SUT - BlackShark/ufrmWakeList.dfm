object frmWakeList: TfrmWakeList
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 292
  ClientWidth = 458
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
      Left = 286
      Top = 256
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
      Left = 414
      Top = 256
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
    object lvWakeList: TListView
      Left = 8
      Top = 8
      Width = 441
      Height = 193
      Color = clBlack
      Columns = <
        item
          Caption = 'Wake'
        end
        item
          Alignment = taCenter
          Caption = 'Lat'
        end
        item
          Alignment = taCenter
          Caption = 'Long'
        end
        item
          Alignment = taCenter
          Caption = 'Rep. time'
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
