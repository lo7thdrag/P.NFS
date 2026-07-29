unit ufrmTorpedoTubeStatusWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Math,

  uSutBlacksharkManager, uTorpedoLauncher, Vcl.ExtCtrls, Vcl.StdCtrls, uVehicleManager, ufrmTorpedoTestResultWindow;

type
  TfrmTorpedoTubeStatusWindow = class(TForm)
    pnlMain: TPanel;
    pnlTorpedo1: TPanel;
    shpFrameTorpedo1: TShape;
    shpTorpedo1: TShape;
    lblTorpedo1: TLabel;
    lblNumber1: TLabel;
    lblWTSRC1: TLabel;
    pbTubeSymbol1: TPaintBox;
    lblActiveToSo1: TLabel;
    lblValueTorpedo1: TLabel;
    lblFuse1: TLabel;
    lblSalvoNumber1: TLabel;
    pnlTorpedo2: TPanel;
    shpFrameTorpedo2: TShape;
    shpTorpedo2: TShape;
    lblTorpedo2: TLabel;
    lblNumber2: TLabel;
    lblWTSRC2: TLabel;
    pbTubeSymbol2: TPaintBox;
    lblSalvoNumber2: TLabel;
    lblFuse2: TLabel;
    lblActiveToSo2: TLabel;
    lblValueTorpedo2: TLabel;
    pnlTorpedo3: TPanel;
    shpFrameTorpedo3: TShape;
    shpTorpedo3: TShape;
    lblTorpedo3: TLabel;
    lblNumber3: TLabel;
    lblWTSRC3: TLabel;
    pbTubeSymbol3: TPaintBox;
    lblSalvoNumber3: TLabel;
    lblFuse3: TLabel;
    lblActiveToSo3: TLabel;
    lblValueTorpedo3: TLabel;
    pnlTorpedo4: TPanel;
    shpFrameTorpedo4: TShape;
    shpTorpedo4: TShape;
    lblTorpedo4: TLabel;
    lblNumber4: TLabel;
    lblWTSRC4: TLabel;
    pbTubeSymbol4: TPaintBox;
    lblSalvoNumber4: TLabel;
    lblFuse4: TLabel;
    lblActiveToSo4: TLabel;
    lblValueTorpedo4: TLabel;
    pnlTorpedo5: TPanel;
    shpFrameTorpedo5: TShape;
    shpTorpedo5: TShape;
    lblTorpedo5: TLabel;
    lblNumber5: TLabel;
    lblWTSRC5: TLabel;
    pbTubeSymbol5: TPaintBox;
    lblActiveToSo5: TLabel;
    lblValueTorpedo5: TLabel;
    lblSalvoNumber5: TLabel;
    lblFuse5: TLabel;
    pnlTorpedo6: TPanel;
    shpFrameTorpedo6: TShape;
    shpTorpedo6: TShape;
    lblTorpedo6: TLabel;
    lblNumber6: TLabel;
    lblWTSRC6: TLabel;
    pbTubeSymbol6: TPaintBox;
    lblSalvoNumber6: TLabel;
    lblFuse6: TLabel;
    lblActiveToSo6: TLabel;
    lblValueTorpedo6: TLabel;
    pnlTorpedo7: TPanel;
    shpFrameTorpedo7: TShape;
    shpTorpedo7: TShape;
    lblTorpedo7: TLabel;
    lblNumber7: TLabel;
    lblWTSRC7: TLabel;
    pbTubeSymbol7: TPaintBox;
    lblSalvoNumber7: TLabel;
    lblFuse7: TLabel;
    lblActiveToSo7: TLabel;
    lblValueTorpedo7: TLabel;
    pnlTorpedo8: TPanel;
    shpFrameTorpedo8: TShape;
    shpTorpedo8: TShape;
    lblTorpedo8: TLabel;
    lblNumber8: TLabel;
    lblWTSRC8: TLabel;
    pbTubeSymbol8: TPaintBox;
    lblSalvoNumber8: TLabel;
    lblFuse8: TLabel;
    lblActiveToSo8: TLabel;
    lblValueTorpedo8: TLabel;
    tmrDrawTube: TTimer;
    pnlNumTorpedo1: TPanel;
    pnlNumTorpedo2: TPanel;
    pnlNumTorpedo3: TPanel;
    pnlNumTorpedo4: TPanel;
    pnlNumTorpedo5: TPanel;
    pnlNumTorpedo6: TPanel;
    pnlNumTorpedo7: TPanel;
    pnlNumTorpedo8: TPanel;
    procedure tmrDrawTubeTimer(Sender: TObject);
    procedure pbTubeSymbol1Paint(Sender: TObject);
    procedure pnlTorpedoClick(Sender: TObject);
  private
    const StatusTextMsg: array[0..24] of string = ('', 'TESTING', 'TORP READY', 'FIRED', 'MISFIRED', 'INITIAL RUN',
    'MSI-APPR-LOS', 'MSI-APPR-CC', 'MSI-APPR-SA', 'TORP-APPR', 'MSI-SRC-LOS', 'MSI-SRC-CC', 'MSI-SRC-SA',
    'TORP-SRC', 'TORP-SRC-AUTO', 'TORP-SRC-SA', 'TORP-SRC-CSP', 'WAKE SELF GUID', 'MAN-HORIZ', 'LONG RANGE ATT',
    'CLOSE-IN ATT', 'TGT LOST', 'COMM BREAK', 'TERMINATED', 'IMMED FIRE');
  public
    FFrmTorpedoTestWindow : TfrmTorpedoStatusResultsWindow;
    
    procedure DrawTube(pBox: TPaintBox; aLauncher: TTorpedoLauncher);
    procedure UpdatePanelStatus;
    procedure UpdateFrameStatus;
    procedure UpdateTextStatus;
  end;

var
  frmTorpedoTubeStatusWindow: TfrmTorpedoTubeStatusWindow;

implementation

uses
  ufrmTorpedoWP, ufrmTorpedoTubeCommands;
{$R *.dfm}

procedure TfrmTorpedoTubeStatusWindow.DrawTube(pBox: TPaintBox;aLauncher: TTorpedoLauncher);
var
  aCnv: TCanvas;
  Cx, Cy: Double;
  Points: array[0..2] of TPoint;
  i : Integer;
begin
  aCnv := pBox.Canvas;
  Cx   := Round(pBox.Width / 2);
  Cy   := Round(pBox.Height / 2);

  {$REGION 'Draw Outer Circle Water Pressure'}
  if aLauncher.TextStatus = stTorpReady then
    aCnv.Pen.Color := clGreen
  else if aLauncher.TextStatus = stFired then
    aCnv.Pen.Color := clGreen
  else
  begin
    case aLauncher.WaterPressure of
      wpDrained          : aCnv.Pen.Color := clRed; 
      wpPresNotEqualized : aCnv.Pen.Color := clYellow;    
      wpPresEqualized    : aCnv.Pen.Color := clGreen;       
    end;
  end;

  aCnv.Pen.Style := psSolid;
  aCnv.Pen.Width := 1;
  aCnv.Brush.Style := bsClear;
  aCnv.Ellipse(Round(Cx)-24, Round(Cy)-24, Round(Cx)+24, Round(Cy)+24);
  {$ENDREGION}

  {$REGION 'Draw Inner Circle Bow Cap'}
  if aLauncher.TextStatus = stTorpReady then
    aCnv.Pen.Color := clGreen
  else if aLauncher.TextStatus = stFired then
    aCnv.Pen.Color := clGreen
  else
  begin
    case aLauncher.BowCap of
      bcClosed          : aCnv.Pen.Color := clRed;
      bcOpenLeverNotSet : aCnv.Pen.Color := clYellow;
      bcOpenLeverSet    : aCnv.Pen.Color := clGreen;
    end;
  end;

  aCnv.Pen.Style   := psSolid;
  aCnv.Pen.Width   := 1;
  aCnv.Brush.Style := bsClear;
  aCnv.Ellipse(Round(Cx)-21, Round(Cy)-21, Round(Cx)+21, Round(Cy)+21);
  {$ENDREGION}

  {$REGION 'Red Cross Fire Releases'}
  if not aLauncher.FireRelease then
  begin
    aCnv.Pen.Color := clRed;
    aCnv.Pen.Style := psSolid;
    aCnv.Pen.Width := 1;
    aCnv.MoveTo(Round(cx -19), Round(cy-5));
    aCnv.LineTo(Round(cx+19), Round(cy+5));

    aCnv.MoveTo(Round(cx -19), Round(cy+5));
    aCnv.LineTo(Round(cx+19), Round(cy-5));
  end
  else if aLauncher.FireRelease then
  begin
    aCnv.Brush.Style := bsClear;
  end;
  {$ENDREGION}

  {$REGION 'Draw Triangle Torpedo Status'}
  if aLauncher.Loaded then
  begin
    if aLauncher.TextStatus = stTorpReady then
    begin
      aCnv.Pen.Color   := clLime;
      aCnv.Brush.Color := clLime;
      aCnv.Brush.Style := bsSolid;
    end
//    else if aLauncher.FireRelease = True then
//    begin
//      aCnv.Pen.Color   := clLime;
//      aCnv.Brush.Color := clLime;
//      aCnv.Brush.Style := bsClear;
//    end
    else
    begin
      case aLauncher.TorpedoStatus of
        tsOff:
        begin
          aCnv.Pen.Color   := clYellow;
          aCnv.Brush.Color := clYellow;
          aCnv.Brush.Style := bsSolid;
        end;
        tsTesting:
        begin
          aCnv.Pen.Color   := clYellow;
          aCnv.Brush.Color := clYellow;
          aCnv.Brush.Style := bsSolid;
        end;
        tsOnAndOk:
        begin
          aCnv.Pen.Color   := clLime;
          aCnv.Brush.Color := clLime;
          aCnv.Brush.Style := bsSolid;
        end;
        tsOnWithRestrict:
        begin
          aCnv.Pen.Color   := clLime;
          aCnv.Brush.Color := clLime;
          aCnv.Brush.Style := bsClear;
        end;
       tsNotOK:
        begin
          aCnv.Pen.Color   := clRed;
          aCnv.Brush.Color := clRed;
          aCnv.Brush.Style := bsSolid;
        end;
      end;
    end;

    Points[0] := Point(Round(Cx), Round(Cy));
    Points[1] := Point(Round(Cx - 13), Round(Cy + 13));
    Points[2] := Point(Round(Cx + 13), Round(Cy + 13));

    aCnv.Polygon(Points);

    {$REGION 'Vertical Line Cable Status'}
    if aLauncher.TextStatus = stTorpReady then
      aCnv.Pen.Color := clLime
//    else if aLauncher.FireRelease = True then
//      aCnv.Pen.Color := clLime
    else
    begin
      case aLauncher.CableStatus of
        csOff      : aCnv.Pen.Color := clYellow;
        csTesting  : aCnv.Pen.Color := clYellow;
        csTorpOnOK : aCnv.Pen.Color := clLime;
        csError    : aCnv.Pen.Color := clRed;
      end;
    end;

    aCnv.MoveTo(Round(Cx), Round(Cy - 21));
    aCnv.LineTo(Round(Cx), Round(Cy));
    {$ENDREGION}
  end;
  {$ENDREGION}
end;

procedure TfrmTorpedoTubeStatusWindow.pbTubeSymbol1Paint(Sender: TObject);
begin
  DrawTube(TPaintBox(Sender), SutBlacksharkManager.FTorpedoArray[TPaintBox(Sender).Tag]);
end;

procedure TfrmTorpedoTubeStatusWindow.pnlTorpedoClick(Sender: TObject);
begin
  frmTorpedoStatusResultsWindow.AdvPageTorpedoCheck.ActivePageIndex := (Sender as TPanel).tag;
  frmTorpedoTubeCommands := TfrmTorpedoTubeCommands.Create(Self);

  if not frmTorpedoStatusResultsWindow.Visible then
  begin
   frmTorpedoStatusResultsWindow.Left    := Self.Left + 1335;
   frmTorpedoStatusResultsWindow.Top     := Self.Top + 350;
   frmTorpedoStatusResultsWindow.Width   := Max(frmTorpedoWP.pnlTorpedoHomingStatusPlot.Width, frmTorpedoWP.pnlTorpedoParamSettings.Width);
   frmTorpedoStatusResultsWindow.Height  := frmTorpedoWP.pnlTorpedoHomingStatusPlot.Height + frmTorpedoWP.pnlTorpedoParamSettings.Height + 25;
   frmTorpedoStatusResultsWindow.Show;
  end
  else
    frmTorpedoStatusResultsWindow.BringToFront;

  if frmTorpedoStatusResultsWindow.Visible then
      frmTorpedoTubeCommands.tmrStatusTextTorpedo.Enabled := True;
end;

procedure TfrmTorpedoTubeStatusWindow.tmrDrawTubeTimer(Sender: TObject);
var
  i: Integer;
begin
  pbTubeSymbol1.Invalidate;
  pbTubeSymbol2.Invalidate;
  pbTubeSymbol3.Invalidate;
  pbTubeSymbol4.Invalidate;
  pbTubeSymbol5.Invalidate;
  pbTubeSymbol6.Invalidate;
  pbTubeSymbol7.Invalidate;
  pbTubeSymbol8.Invalidate;

  UpdatePanelStatus;
  UpdateFrameStatus;
  UpdateTextStatus;
end;

procedure TfrmTorpedoTubeStatusWindow.UpdateFrameStatus;
var
  i     : Integer;
  shape : TShape;
begin
  for i := 0 to 7 do
  begin
    case i of
      0: Shape := shpFrameTorpedo1;
      1: Shape := shpFrameTorpedo2;
      2: Shape := shpFrameTorpedo3;
      3: Shape := shpFrameTorpedo4;
      4: Shape := shpFrameTorpedo5;
      5: Shape := shpFrameTorpedo6;
      6: Shape := shpFrameTorpedo7;
      7: Shape := shpFrameTorpedo8;
    end;

    if SutBlacksharkManager.FTorpedoArray[i].Allocated then
    begin
      Shape.Visible   := True;
      Shape.Pen.Color := clGreen;
      shape.Pen.Width := 2;
    end
    else
    begin
      Shape.Visible   := False;
    end;

    Shape.Repaint;
  end;
end;


procedure TfrmTorpedoTubeStatusWindow.UpdatePanelStatus;
var
  i     : Integer;
  shape : TShape;
begin
  for i := 0 to 7 do
  begin
    case i of
      0: Shape := shpTorpedo1;
      1: Shape := shpTorpedo2;
      2: Shape := shpTorpedo3;
      3: Shape := shpTorpedo4;
      4: Shape := shpTorpedo5;
      5: Shape := shpTorpedo6;
      6: Shape := shpTorpedo7;
      7: Shape := shpTorpedo8;
    end;

    if SutBlacksharkManager.FTorpedoArray[i].Loaded then
      Shape.Pen.Color := clYellow
    else 
      Shape.Pen.Color := clWhite;

    if SutBlacksharkManager.FTorpedoArray[i].TextStatus = stTorpReady then
       shape.Pen.Color := clLime;

    Shape.Repaint;
  end;
end;

procedure TfrmTorpedoTubeStatusWindow.UpdateTextStatus;
var
  i,j   : Integer;
  aText : TTorpedoLauncher;
  Text1, Text2, Text3, Text4, Text5: TLabel;
  PanelNumber : TPanel;
begin
  {$REGION 'Status Text Torpedo'}
  for i := 0 to 7 do
  begin
    case i of
      0:
      begin
        Text1 := lblTorpedo1;
        Text2 := lblValueTorpedo1;
        Text3 := lblWTSRC1;
        Text4 := lblSalvoNumber1;
        Text5 := lblFuse1;

        PanelNumber := pnlNumTorpedo1;
      end;
      1:
      begin
        Text1 := lblTorpedo2;
        Text2 := lblValueTorpedo2;
        Text3 := lblWTSRC2;
        Text4 := lblSalvoNumber2;
        Text5 := lblFuse2;

        PanelNumber := pnlNumTorpedo2;
      end;
      2:
      begin
        Text1 := lblTorpedo3;
        Text2 := lblValueTorpedo3;
        Text3 := lblWTSRC3;
        Text4 := lblSalvoNumber3;
        Text5 := lblFuse3;

        PanelNumber := pnlNumTorpedo3;
      end;
      3:
      begin
        Text1 := lblTorpedo4;
        Text2 := lblValueTorpedo4;
        Text3 := lblWTSRC4;
        Text4 := lblSalvoNumber4;
        Text5 := lblFuse4;

        PanelNumber := pnlNumTorpedo4;
      end;
      4:
      begin
        Text1 := lblTorpedo5;
        Text2 := lblValueTorpedo5;
        Text3 := lblWTSRC5;
        Text4 := lblSalvoNumber5;
        Text5 := lblFuse5;

        PanelNumber := pnlNumTorpedo5;
      end;
      5:
      begin
        Text1 := lblTorpedo6;
        Text2 := lblValueTorpedo6;
        Text3 := lblWTSRC6;
        Text4 := lblSalvoNumber6;
        Text5 := lblFuse6;

        PanelNumber := pnlNumTorpedo6;
      end;
      6:
      begin
        Text1 := lblTorpedo7;
        Text2 := lblValueTorpedo7;
        Text3 := lblWTSRC7;
        Text4 := lblSalvoNumber7;
        Text5 := lblFuse7;

        PanelNumber := pnlNumTorpedo7;
      end;
      7:
      begin
        Text1 := lblTorpedo8;
        Text2 := lblValueTorpedo8;
        Text3 := lblWTSRC8;
        Text4 := lblSalvoNumber8;
        Text5 := lblFuse8;

        PanelNumber := pnlNumTorpedo8;
      end;
    end;

    aText  := SutBlacksharkManager.FTorpedoArray[i];

    Text1.Caption := '';
    Text1.Visible := False;

    Text2.Caption := '';
    Text2.Visible := False;

    Text3.Color := clWhite;

    Text4.Caption    := '';
    Text5.Caption    := '';

    PanelNumber.Visible := False;

    if SutBlacksharkManager.FTorpedoArray[i].SalvoNumber <> 0 then
    begin
      Text4.Caption    := IntToStr(SutBlacksharkManager.FTorpedoArray[i].SalvoNumber);
      Text4.Font.Color := clLime;
    end;

    if aText.FuseStatus then
    begin
      Text5.Caption    := 'F';
      Text5.Font.Color := clLime;
    end
    else
    begin
      Text5.Caption    := '';
      Text5.Font.Color := clWhite;
    end;

    if aText.Allocated then
    begin
      Text1.Caption    := StatusTextMsg[Integer(aText.TextStatus)];
      Text1.Font.Color := clLime;
      Text1.Visible    := True;

      Text3.Font.Color := clLime;

      PanelNumber.Visible := True;

      if VehicleMgr.IsAnyTrackControlled then
      begin
        Text2.Caption    := IntToStr(VehicleMgr.TrackControlled.MSITrackNumber);
        Text2.Font.Color := clLime;
        Text2.Visible    := True;
      end;

    end
    else
    begin
      Text1.Caption := '';
      Text2.Caption := '';
    end;
    {$ENDREGION}
  end;
end;

end.
