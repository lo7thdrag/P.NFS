object frmTrackListNumber: TfrmTrackListNumber
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 389
  ClientWidth = 324
  Color = -1
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = -1
    Top = 0
    Width = 657
    Height = 674
    Color = -1
    ParentBackground = False
    TabOrder = 0
    object lblNumberofTracks: TLabel
      Left = 16
      Top = 10
      Width = 102
      Height = 16
      Caption = 'Number of Tracks'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblReset: TLabel
      Left = 157
      Top = 366
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
      Left = 285
      Top = 366
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
    object Label1: TLabel
      Left = 310
      Top = 10
      Width = 7
      Height = 16
      Caption = '2'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lvTracklistNumber: TListView
      Left = 10
      Top = 40
      Width = 305
      Height = 281
      Color = -1
      Columns = <
        item
          Caption = 'No'
        end
        item
          Caption = 'TNo'
        end
        item
          Caption = 'Type'
        end
        item
          Caption = 'Cat'
        end
        item
          Caption = 'Identity'
        end
        item
          Caption = 'Source'
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
    object Panel1: TPanel
      Left = 4
      Top = 353
      Width = 321
      Height = 7
      BevelInner = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsSingle
      Caption = 'Panel1'
      TabOrder = 1
    end
  end
end
