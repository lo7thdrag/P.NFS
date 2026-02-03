object frmFireDistribution: TfrmFireDistribution
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 850
  ClientWidth = 954
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 240
    Top = 720
    Width = 193
    Height = 18
    Caption = 'Tgt1(0001) : In the sea'
    Font.Charset = ANSI_CHARSET
    Font.Color = 6168865
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 520
    Top = 720
    Width = 193
    Height = 18
    Caption = 'Tgt2(0000) : In the sea'
    Font.Charset = ANSI_CHARSET
    Font.Color = 6168865
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object pnlTblFireDistribution: TPanel
    Left = 0
    Top = 0
    Width = 954
    Height = 553
    Align = alTop
    Caption = 'stringgrid'
    Color = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object strgFireDistribution: TAdvStringGrid
      Left = 1
      Top = 1
      Width = 920
      Height = 551
      Cursor = crDefault
      Align = alLeft
      Color = clGray
      ColCount = 3
      DrawingStyle = gdsClassic
      FixedColor = clMedGray
      RowCount = 14
      FixedRows = 0
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      ActiveRowColor = clBlack
      HoverRowCells = [hcNormal, hcSelected]
      OnGetCellColor = strgFireDistributionGetCellColor
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnHeaders.Strings = (
        'Creation'
        'TN'
        'Type'
        'Rep IU'
        'Result')
      ColumnSize.Stretch = True
      ControlLook.FixedGradientHoverFrom = clGray
      ControlLook.FixedGradientHoverTo = clWhite
      ControlLook.FixedGradientDownFrom = clGray
      ControlLook.FixedGradientDownTo = clSilver
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'Tahoma'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'Tahoma'
      FilterDropDown.Font.Style = []
      FilterDropDown.TextChecked = 'Checked'
      FilterDropDown.TextUnChecked = 'Unchecked'
      FilterDropDownClear = '(All)'
      FilterEdit.TypeNames.Strings = (
        'Starts with'
        'Ends with'
        'Contains'
        'Not contains'
        'Equal'
        'Not equal'
        'Larger than'
        'Smaller than'
        'Clear')
      FixedColWidth = 298
      FixedRowHeight = 22
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWhite
      FixedFont.Height = -16
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      HoverButtons.Buttons = <>
      HoverButtons.Position = hbLeftFromColumnLeft
      HTMLSettings.ImageFolder = 'images'
      HTMLSettings.ImageBaseName = 'img'
      Look = glStandard
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'Tahoma'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'Tahoma'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'Tahoma'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'Tahoma'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      RowHeaders.Strings = (
        'Route No.'
        'Port/Stbd.'
        'Attack.A.(deg)'
        'P1 LONG.(deg)'
        'P1 LAT.(deg)'
        'P2 LONG.(deg)'
        'P2 LAT.(deg)'
        'P3 LONG.(deg)'
        'P3 LAT.(deg)'
        'Fly Range(km)'
        'Launch Int.(s)'
        'Route Status'
        'M.Distributed'
        'M.Distribution')
      SearchFooter.Color = clBtnFace
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'Tahoma'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurrence'
      SearchFooter.HintFindPrev = 'Find previous occurrence'
      SearchFooter.HintHighlight = 'Highlight occurrences'
      SearchFooter.MatchCaseCaption = 'Match case'
      SearchFooter.ResultFormat = '(%d of %d)'
      SelectionColor = 9460480
      SelectionTextColor = clHighlightText
      SortSettings.DefaultFormat = ssAutomatic
      Version = '8.4.7.0'
      ColWidths = (
        298
        296
        322)
      RowHeights = (
        28
        27
        26
        25
        27
        28
        26
        29
        30
        31
        33
        33
        30
        32)
    end
  end
  object btnTarget1: TVrDemoButton
    Left = 269
    Top = 654
    Width = 130
    Height = 35
    FontEnter.Charset = DEFAULT_CHARSET
    FontEnter.Color = 6168865
    FontEnter.Height = -11
    FontEnter.Name = 'Verdana'
    FontEnter.Style = [fsBold]
    FontLeave.Charset = DEFAULT_CHARSET
    FontLeave.Color = 6168865
    FontLeave.Height = -11
    FontLeave.Name = 'Verdana'
    FontLeave.Style = [fsBold]
    Caption = 'Target 1'
    Color = clSilver
    TabOrder = 1
  end
  object btnTarget2: TVrDemoButton
    Left = 554
    Top = 654
    Width = 130
    Height = 35
    FontEnter.Charset = DEFAULT_CHARSET
    FontEnter.Color = clBlack
    FontEnter.Height = -11
    FontEnter.Name = 'Verdana'
    FontEnter.Style = [fsBold]
    FontLeave.Charset = DEFAULT_CHARSET
    FontLeave.Color = clBlack
    FontLeave.Height = -11
    FontLeave.Name = 'Verdana'
    FontLeave.Style = [fsBold]
    Caption = 'Target 2'
    Color = clSilver
    TabOrder = 2
  end
end
