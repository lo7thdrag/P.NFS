object frmTrackListNumber: TfrmTrackListNumber
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 496
  ClientWidth = 371
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
    Left = 0
    Top = 0
    Width = 371
    Height = 496
    Align = alClient
    Caption = '-0'
    Color = -1
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = -1
    ExplicitWidth = 372
    ExplicitHeight = 674
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
      Top = 465
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
      Top = 465
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
    object lblNumber: TLabel
      Left = 310
      Top = 10
      Width = 7
      Height = 16
      Caption = '0'
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
      Width = 353
      Height = 401
      Color = -1
      Columns = <
        item
          Caption = 'No'
          Width = 40
        end
        item
          Alignment = taCenter
          Caption = 'TNo'
          Width = 60
        end
        item
          Alignment = taCenter
          Caption = 'Type'
        end
        item
          Alignment = taCenter
          Caption = 'Cat'
          Width = 60
        end
        item
          Alignment = taCenter
          Caption = 'Identity'
          Width = 65
        end
        item
          Alignment = taCenter
          Caption = 'Source'
          Width = 73
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
      Top = 455
      Width = 365
      Height = 1
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
    end
  end
end
