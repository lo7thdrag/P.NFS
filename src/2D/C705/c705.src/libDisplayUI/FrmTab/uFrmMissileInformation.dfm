object frmMissileInformation: TfrmMissileInformation
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmMissileInformation'
  ClientHeight = 850
  ClientWidth = 954
  Color = clMedGray
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 954
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblTgtNbHeader_L: TLabel
      Left = 474
      Top = 10
      Width = 100
      Height = 18
      Caption = 'Missile No.2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 738
      Top = 10
      Width = 100
      Height = 18
      Caption = 'Missile No.1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlMissileInformationTbl: TPanel
    Left = 0
    Top = 41
    Width = 954
    Height = 809
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object strgMissileInfo: TAdvStringGrid
      Left = 0
      Top = 0
      Width = 920
      Height = 809
      Cursor = crDefault
      Align = alLeft
      Color = clGray
      ColCount = 3
      DrawingStyle = gdsClassic
      FixedColor = clMedGray
      RowCount = 23
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
      ScrollBars = ssBoth
      TabOrder = 0
      ActiveRowColor = clBlack
      HoverRowCells = [hcNormal, hcSelected]
      OnGetCellColor = strgMissileInfoGetCellColor
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
      FixedColWidth = 423
      FixedRowHeight = 22
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWhite
      FixedFont.Height = -11
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
        'Altimeter(m)'
        'Magnetron current(V)'
        'Target Type'
        'Target LONG(deg)'
        'Target LAT(deg)'
        'Target Height(m)'
        'Attack.A.(deg)'
        'Route P1 LONG(deg)'
        'Route P1 LAT(deg)'
        'Route P2 LONG(deg)'
        'Route P2 LAT(deg)'
        'Route P3 LONG(deg)'
        'Route P3 LAT(deg)'
        'Range On 1(km)/Height F.1(m)'
        'Range On 2(km)/Height F.2(m)'
        'Search Range/Range Up 2(km)'
        'Capture Mode'
        'Sea State'
        'Fly Range(km)'
        'M. Heading(deg)'
        'M.Pitch(deg)'
        'M. Roll(deg)'
        'Navigate Mode')
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
        423
        207
        286)
      RowHeights = (
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22)
    end
  end
end
