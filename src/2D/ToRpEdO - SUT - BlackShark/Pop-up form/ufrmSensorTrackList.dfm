object frmSensorTrackList: TfrmSensorTrackList
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 370
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = -21
    Top = -1
    Width = 326
    Height = 490
    Color = -1
    ParentBackground = False
    TabOrder = 0
    object lblNumberofTracks: TLabel
      Left = 28
      Top = 32
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
    object lblNumber: TLabel
      Left = 288
      Top = 32
      Width = 7
      Height = 16
      Caption = '3'
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
      Left = 264
      Top = 346
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
    object lblSensor: TLabel
      Left = 28
      Top = 10
      Width = 40
      Height = 16
      Caption = 'Sensor'
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
      Left = 32
      Top = 64
      Width = 265
      Height = 97
      BevelInner = bvNone
      BevelOuter = bvNone
      BiDiMode = bdRightToLeft
      Color = -1
      Columns = <
        item
          Caption = 'Sensor TNo'
        end
        item
          Alignment = taCenter
          Caption = 'TNo'
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GridLines = True
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
    end
    object cbSensor: TComboBox
      Left = 152
      Top = 8
      Width = 145
      Height = 21
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'CAS'
      Items.Strings = (
        'CAS'
        'FAS'
        'Intercept'
        'Radar'
        'RESM'
        'Periscope-AP'
        'Periscope-OM'
        'Link')
    end
  end
end
