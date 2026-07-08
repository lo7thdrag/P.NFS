unit ufrmTorpedoTubeStatusWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  uSutBlacksharkManager, uTorpedoLauncher, Vcl.ExtCtrls, Vcl.StdCtrls;

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
    lblNumberTorpedo1: TLabel;
    pnlTorpedo2: TPanel;
    shpFrameTorpedo2: TShape;
    shpTorpedo2: TShape;
    lblTorpedo2: TLabel;
    lblNumber2: TLabel;
    lblWTSRC2: TLabel;
    pbTubeSymbol2: TPaintBox;
    lblNumberTorpedo2: TLabel;
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
    lblNumberTorpedo3: TLabel;
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
    lblNumberTorpedo4: TLabel;
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
    lblNumberTorpedo5: TLabel;
    lblFuse5: TLabel;
    pnlTorpedo6: TPanel;
    shpFrameTorpedo: TShape;
    shpTorpedo6: TShape;
    lblTorpedo6: TLabel;
    lblNumber6: TLabel;
    lblWTSRC6: TLabel;
    pbTubeSymbol6: TPaintBox;
    lblNumberTorpedo6: TLabel;
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
    lblNumberTorpedo7: TLabel;
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
    lblNumberTorpedo8: TLabel;
    lblFuse8: TLabel;
    lblActiveToSo8: TLabel;
    lblValueTorpedo8: TLabel;
    tmrDrawTube: TTimer;
    procedure tmrDrawTubeTimer(Sender: TObject);
    procedure pbTubeSymbol1Paint(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DrawTube(pBox: TPaintBox; aLauncher: TTorpedoLauncher);
    procedure UpdatePanelStatus;
  end;

var
  frmTorpedoTubeStatusWindow: TfrmTorpedoTubeStatusWindow;

implementation

{$R *.dfm}

procedure TfrmTorpedoTubeStatusWindow.DrawTube(pBox: TPaintBox;aLauncher: TTorpedoLauncher);
var
  aCnv: TCanvas;
  Cx, Cy: Double;
  Points: array[0..2] of TPoint;
  i : Integer;
begin
  aCnv := pBox.Canvas;
  Cx := Round(pBox.Width / 2);
  Cy := Round(pBox.Height / 2);

  // draw outer circle Water Pressure
  if aLauncher.WaterPressure = wpDrained then aCnv.Pen.Color := clRed
  else if aLauncher.WaterPressure = wpPresNotEqualized then aCnv.Pen.Color := clYellow
  else if aLauncher.WaterPressure = wpPresEqualized then aCnv.Pen.Color := clGreen;
  aCnv.Pen.Style := psSolid;
  aCnv.Pen.Width := 1;
  aCnv.Brush.Color := clwhite;
  aCnv.Brush.Style := bsClear;
  aCnv.Ellipse(Round(Cx) - 24, Round(Cy) - 24, Round(Cx) + 24, Round(Cy) + 24);

  // draw inner circle Bow Cap
  if aLauncher.BowCap = bcClosed then aCnv.Pen.Color := clRed
  else if aLauncher.BowCap = bcOpenLeverNotSet then aCnv.Pen.Color := clYellow
  else if aLauncher.BowCap = bcOpenLeverSet then aCnv.Pen.Color := clGreen;
  aCnv.Pen.Style := psSolid;
  aCnv.Pen.Width := 1;
  aCnv.Brush.Color := clwhite;
  aCnv.Brush.Style := bsClear;
  aCnv.Ellipse(Round(Cx) - 21, Round(Cy) - 21, Round(Cx) + 21, Round(Cy) + 21);

  // red cross fire releases
  if not aLauncher.FireRelease then
  begin
    aCnv.Pen.Color := clRed;
    aCnv.Pen.Style := psSolid;
    aCnv.Pen.Width := 1;
    aCnv.MoveTo(Round(cx -19), Round(cy-5));
    aCnv.LineTo(Round(cx+19), Round(cy+5));

    aCnv.MoveTo(Round(cx -19), Round(cy+5));
    aCnv.LineTo(Round(cx+19), Round(cy-5));
  end;

  if aLauncher.Loaded then
  begin
    // draw triangle Torpedo Status
    if aLauncher.TorpedoStatus = tsOff then
    begin
      aCnv.Pen.Color   := clYellow;
      aCnv.Brush.Color := clYellow;
      aCnv.Brush.Style := bsSolid;
    end
    else if aLauncher.TorpedoStatus = tsTesting then // harus dibuat blinking
    begin
      aCnv.Pen.Color   := clYellow;
      aCnv.Brush.Color := clYellow;
      aCnv.Brush.Style := bsSolid;
    end
    else if aLauncher.TorpedoStatus = tsOnAndOk then
    begin
      aCnv.Pen.Color := clLime;
      aCnv.Brush.Color := clLime;
      aCnv.Brush.Style := bsSolid;
    end
    else if aLauncher.TorpedoStatus = tsOnWithRestrict then
    begin
      aCnv.Pen.Color := clLime;
      aCnv.Brush.Color := clLime;
      aCnv.Brush.Style := bsClear;
    end
    else if aLauncher.TorpedoStatus = tsNotOK then
    begin
      aCnv.Pen.Color := clRed;
      aCnv.Brush.Color := clRed;
      aCnv.Brush.Style := bsSolid;
    end;

    Points[0] := Point(Round(cx), Round(cy));
    Points[1] := Point(Round(cx -13), Round(cy +13));
    Points[2] := Point(Round(cx +13), Round(cx +13));
    aCnv.Polygon(Points);

    // vertical line cable status
    if aLauncher.CableStatus = csOff then
    begin
      aCnv.Pen.Color := clYellow;
    end
    else if aLauncher.CableStatus = csTesting then // harus dibuat blinking
    begin
      aCnv.Pen.Color := clYellow;
    end
    else if aLauncher.CableStatus = csTorpOnOK then
    begin
      aCnv.Pen.Color := clLime;
    end
    else if aLauncher.CableStatus = csError then
    begin
      aCnv.Pen.Color := clRed;
    end;
    aCnv.MoveTo(Round(cx), Round(cy-21));
    aCnv.LineTo(Round(cx), Round(cy));
  end;
end;

procedure TfrmTorpedoTubeStatusWindow.pbTubeSymbol1Paint(Sender: TObject);
begin
  DrawTube(TPaintBox(Sender), SutBlacksharkManager.FTorpedoArray[TPaintBox(Sender).Tag]);
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

    Shape.Repaint;
  end;

end;

end.
