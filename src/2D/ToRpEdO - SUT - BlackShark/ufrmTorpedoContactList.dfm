object frmTorpedoContactList: TfrmTorpedoContactList
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 260
  ClientWidth = 396
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
    Width = 441
    Height = 385
    BevelEdges = []
    BevelOuter = bvNone
    TabOrder = 0
    object lblReset: TLabel
      Left = 228
      Top = 235
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
      Left = 356
      Top = 235
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
    object lvTorpedoContactList: TListView
      Left = 8
      Top = 8
      Width = 377
      Height = 185
      Color = clBlack
      Columns = <
        item
          Caption = 'Trp/Cnt'
        end
        item
          Alignment = taCenter
          Caption = 'Bearing (deg)'
        end
        item
          Alignment = taCenter
          Caption = 'Range (m)'
        end>
      GridLines = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
end
