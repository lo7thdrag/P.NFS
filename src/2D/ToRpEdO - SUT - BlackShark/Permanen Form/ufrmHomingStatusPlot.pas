unit ufrmHomingStatusPlot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvSmoothTabPager, uSutBlacksharkManager, uVehicleManager, uTorpedoTrack,
  Vcl.ExtCtrls, AdvPageControl, Vcl.ComCtrls, uTorpedoLauncher, uSimulationTrack, uBaseFunction, uBaseConst;

type
  TfrmHomingStatusPlot = class(TForm)
    pnlMain: TPanel;
    AdvPageHominStatusPlot: TAdvPageControl;
    AdvTabHomingStatus: TAdvTabSheet;
    AdvTabHomingPlot: TAdvTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblCloseInSub: TLabel;
    lblLongRangeAttack: TLabel;
    lblTgtLostSub: TLabel;
    lblStatusHoming: TLabel;
    lblToSoTargetAcq: TLabel;
    lblValContact: TLabel;
    lblValTorpedo: TLabel;
    lblWakeAttaack: TLabel;
    pbLongRange: TPaintBox;
    pbTgtLostSub: TPaintBox;
    pbWakeAttack: TPaintBox;
    pbWakeLost: TPaintBox;
    pbToSoCoveragePlot: TPaintBox;
    pnlToSo: TPanel;
    tmrUpdateTorpedoHoming: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure pbToSoCoveragePlotPaint(Sender: TObject);
    procedure pbTgtLostSubPaint(Sender: TObject);
    procedure pbWakeAttackPaint(Sender: TObject);
    procedure pbWakeLostPaint(Sender: TObject);
    procedure pbLongRangePaint(Sender: TObject);
    procedure tmrUpdateTorpedoHomingTimer(Sender: TObject);
  private

  public
    function WorldToScreenX(X: Double): Integer;
    function WorldToScreenY(Y: Double): Integer;

    procedure DrawTarget(C: TCanvas; X, Y: Double);
    procedure DrawTorpedo(C: TCanvas; X, Y: Double);
    procedure DrawGraphHoming;
  end;

var
  frmHomingStatusPlot: TfrmHomingStatusPlot;

implementation

{$R *.dfm}

const
  XMin = -50;
  XMax =  50;

  YMin = -35;
  YMax =  35;

function TfrmHomingStatusPlot.WorldToScreenX(X: Double): Integer;
const
  GraphLeft   = 30;
  RightMargin = 50;

var
  GraphWidth : Integer;
begin
  GraphWidth := pbToSoCoveragePlot.ClientWidth - GraphLeft - RightMargin;
  Result     := GraphLeft + Round((X - XMin) / (XMax - XMin) * GraphWidth);
end;

function TfrmHomingStatusPlot.WorldToScreenY(Y: Double): Integer;
const
  GraphTop     = 5;
  BottomMargin = 25;
var
  GraphHeight : Integer;
begin
  GraphHeight := pbToSoCoveragePlot.ClientHeight - GraphTop - BottomMargin;
  Result      := GraphTop + GraphHeight - Round((Y - YMin) / (YMax - YMin) * GraphHeight);
end;

procedure TfrmHomingStatusPlot.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  if SutBlacksharkManager.TorpedoTubeAllocNum <> 0 then
  begin
    lblValTorpedo.Caption := IntToStr(SutBlacksharkManager.TorpedoTubeAllocNum);
  end;
end;

procedure TfrmHomingStatusPlot.DrawTarget(C: TCanvas; X, Y: Double);
var
  SX,SY : Integer;
begin
  SX := WorldToScreenX(X);
  SY := WorldToScreenY(Y);

  C.Pen.Color := clYellow;
  C.Pen.Width := 2;

  C.MoveTo(SX-10,SY);
  C.LineTo(SX+10,SY);

  C.MoveTo(SX,SY-10);
  C.LineTo(SX,SY+10);
end;

procedure TfrmHomingStatusPlot.DrawTorpedo(C: TCanvas; X, Y: Double);
var
  SX,SY : Integer;
begin
  SX := WorldToScreenX(X);
  SY := WorldToScreenY(Y);

  C.Pen.Color := clLime;
  C.Pen.Width := 2;

  C.MoveTo(SX,SY-15);
  C.LineTo(SX,SY+15);
end;

procedure TfrmHomingStatusPlot.pbLongRangePaint(Sender: TObject);
var
  Torp: TTorpedoTrack;
begin
  Torp := VehicleMgr.FindTorpedoByLauncherID(SutBlacksharkManager.TorpedoTubeAllocNum);
  if Torp <> nil then
  begin
    with pbLongRange.Canvas do
    begin
      Brush.Color := clBlack;
      FillRect(pbLongRange.ClientRect);

      if SutBlacksharkManager.FTorpedoArray[SutBlacksharkManager.TorpedoTubeAllocNum -1].TextStatus = stLongRangeAtt then
      begin
        // Left circle
        Pen.Color := clGreen;
        Pen.Width := 2;
        Brush.Color := clLime;
        Brush.Style := bsSolid;
        Ellipse(4, 4, 35, 35);

        //Right Circle
        Pen.Color   := clGreen;
        Brush.Color := clBlack;

        Ellipse(90, 4, 120, 35);
        lblToSoTargetAcq.Caption := 'ToSo target acquired far';
      end
      else
      begin
        // Left circle
        Pen.Color := clGreen;
        Pen.Width := 2;
        Brush.Color := clBlack;
        Brush.Style := bsSolid;
        Ellipse(4, 4, 35, 35);

        // Lines hanya saat sudah jadi Close-in attack
        MoveTo(35, 18);
        LineTo(100, 25);

        //Right Circle
        Pen.Color   := clGreen;
        Brush.Color := clLime;

        Ellipse(90, 4, 120, 35);
        lblToSoTargetAcq.Caption := 'ToSo target acquired close';
      end;

    end;
  end;
end;

procedure TfrmHomingStatusPlot.pbTgtLostSubPaint(Sender: TObject);
var
  Diameter : Integer;
  X, Y     : Integer;
  Torp: TTorpedoTrack;
begin
  Torp := VehicleMgr.FindTorpedoByLauncherID(SutBlacksharkManager.TorpedoTubeAllocNum);
  if Torp <> nil then
  begin
    Diameter := 31;

    X := (pbTgtLostSub.Width - Diameter) div 2;
    Y := (pbTgtLostSub.Height - Diameter) div 2;

    with pbTgtLostSub.Canvas do
    begin
      Pen.Width := 2;
      Brush.Style := bsClear;

      Ellipse(X, Y, X + Diameter, Y + Diameter);
      pbTgtLostSub.Canvas.Pen.Color := clLime;
      pbTgtLostSub.Canvas.Ellipse(13, 1, 44, 32);
    end;
  end;

end;

procedure TfrmHomingStatusPlot.DrawGraphHoming;
const
  GraphLeft    = 30;
  GraphTop     = 5;
  RightMargin  = 50;
  BottomMargin = 25;

  XLabels : array[0..6] of string   = ('-45','-30','-15','0','15','30','45');
  XPos    : array[0..6] of Integer  = (50,100,150,200,250,300,350);

  YLabels : array[0..4] of string  = ('30','15','0','-15','');
  YPos    : array[0..4] of Integer  = (10,35,55,75,95);

var
  i : Integer;

  GraphWidth  : Integer;
  GraphHeight : Integer;
begin
  GraphWidth  := pbToSoCoveragePlot.ClientWidth  - GraphLeft - RightMargin;
  GraphHeight := pbToSoCoveragePlot.ClientHeight - GraphTop  - BottomMargin;

  with pbToSoCoveragePlot.Canvas do
  begin
    Brush.Color := clBlack;
    FillRect(pbToSoCoveragePlot.ClientRect);

    Font.Color := clSilver;
    Font.Size  := 7;

    Pen.Color := clSilver;
    Pen.Width := 1;

    MoveTo(GraphLeft, GraphTop);
    LineTo(GraphLeft, GraphTop + GraphHeight);

    MoveTo(GraphLeft, GraphTop + GraphHeight);
    LineTo(GraphLeft + GraphWidth, GraphTop + GraphHeight);

    for I := Low(XLabels) to High(XLabels) do
    begin
      MoveTo(GraphLeft + XPos[I], GraphTop + GraphHeight - 3);
      LineTo(GraphLeft + XPos[I], GraphTop + GraphHeight + 3);
      TextOut(GraphLeft + XPos[I] - 5, GraphTop + GraphHeight + 8, XLabels[I]);
    end;

    for I := Low(YLabels) to High(YLabels) do
    begin
      MoveTo(GraphLeft - 5, GraphTop + YPos[I]);
      LineTo(GraphLeft + 2, GraphTop + YPos[I]);
      TextOut(2, GraphTop + YPos[I] - 6, YLabels[I]);
    end;

    {Lines}
    Pen.Color := clGray;
    Pen.Width := 1;

    { Vertical Line}
    MoveTo(WorldToScreenX(0), GraphTop);
    LineTo(WorldToScreenX(0), GraphTop + GraphHeight);

    { Horizontal Line}
    MoveTo(GraphLeft, WorldToScreenY(0));
    LineTo(GraphLeft + GraphWidth, WorldToScreenY(0));

    { Target }
    DrawTarget(pbToSoCoveragePlot.Canvas,-7,0);

    { Torpedo }
    DrawTorpedo(pbToSoCoveragePlot.Canvas,-5,0);
  end;
end;

procedure TfrmHomingStatusPlot.pbToSoCoveragePlotPaint(Sender: TObject);
begin
  DrawGraphHoming;
end;

procedure TfrmHomingStatusPlot.pbWakeAttackPaint(Sender: TObject);
var
  Diameter : Integer;
  X, Y     : Integer;
  Torp: TTorpedoTrack;
begin
  Torp := VehicleMgr.FindTorpedoByLauncherID(SutBlacksharkManager.TorpedoTubeAllocNum);
  if Torp <> nil then
  begin
    Diameter := 31;

    X := (pbWakeAttack.Width - Diameter) div 2;
    Y := (pbWakeAttack.Height - Diameter) div 2;

    with pbWakeAttack.Canvas do
    begin
      Pen.Width := 2;
      Brush.Style := bsClear;

      Ellipse(X, Y, X + Diameter, Y + Diameter);
      pbWakeAttack.Canvas.Pen.Color := clLime;
      pbWakeAttack.Canvas.Ellipse(13, 1, 44, 32);
    end;
  end;
end;

procedure TfrmHomingStatusPlot.pbWakeLostPaint(Sender: TObject);
var
  Diameter : Integer;
  X, Y     : Integer;
  Torp: TTorpedoTrack;
begin
  Torp := VehicleMgr.FindTorpedoByLauncherID(SutBlacksharkManager.TorpedoTubeAllocNum);
  if Torp <> nil then
  begin
    Diameter := 31;

    X := (pbWakeLost.Width - Diameter) div 2;
    Y := (pbWakeLost.Height - Diameter) div 2;

    with pbWakeLost.Canvas do
    begin
      Pen.Width := 2;
      Brush.Style := bsClear;

      Ellipse(X, Y, X + Diameter, Y + Diameter);
      pbWakeLost.Canvas.Pen.Color := clLime;
      pbWakeLost.Canvas.Ellipse(13, 1, 44, 32);
    end;
  end;
end;

procedure TfrmHomingStatusPlot.tmrUpdateTorpedoHomingTimer(Sender: TObject);
var
  Torp: TTorpedoTrack;
  TgtTrack: TSimulationTrack;
  range, rangem: Double;
begin
  Torp := VehicleMgr.FindTorpedoByLauncherID(SutBlacksharkManager.TorpedoTubeAllocNum);
  TgtTrack := VehicleMgr.FindTrackByTrackNumber(TorpedoParam.TargetTrackNumber);
  if Torp <> nil then
  begin
    if Torp.TorpGuidanceMode = gmHoming then
    begin
      lblStatusHoming.Caption := 'ToSo homing PN 2D';
      pnlToSo.Visible := true;
      range := CalcRange(Torp.PosX, Torp.PosY, TgtTrack.PosX, TgtTrack.PosY);
      rangem := range * C_NauticalMile_To_Metre;
      if range > 350 then
        SutBlacksharkManager.FTorpedoArray[SutBlacksharkManager.TorpedoTubeAllocNum -1].TextStatus := stLongRangeAtt
      else
        SutBlacksharkManager.FTorpedoArray[SutBlacksharkManager.TorpedoTubeAllocNum -1].TextStatus := stCloseInAtt;
      pbLongRange.Repaint;
      pbTgtLostSub.Repaint;
      pbWakeLost.Repaint;
      pbWakeAttack.Repaint;
    end
    else
    begin
      lblStatusHoming.Caption := 'No Homing status Received';
      pnlToSo.Visible := false;
    end;
  end
  else
  begin
    pnlToSo.Visible := False;
  end;
end;

end.
