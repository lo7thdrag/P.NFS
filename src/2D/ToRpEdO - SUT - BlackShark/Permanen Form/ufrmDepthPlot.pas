unit ufrmDepthPlot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uSutBlacksharkManager, uVehicleManager, uSimulationTrack,
  uTorpedoTrack;

type
  TfrmDepthPlot = class(TForm)
    pnlMain: TPanel;
    lbl1: TLabel;
    edtMin: TEdit;
    Label1: TLabel;
    edtMax: TEdit;
    lblSet: TLabel;
    Label3: TLabel;
    lblSpeedScaleFactor: TLabel;
    pbDepthPlot: TPaintBox;
    tmrUpdateDepthPlot: TTimer;
    procedure pbDepthPlotPaint(Sender: TObject);
    procedure tmrUpdateDepthPlotTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblSetClick(Sender: TObject);
  private
    { Private declarations }
    MinDepth, MaxDepth : double;
  public
    procedure DrawGraphPlot;
    procedure DrawArrow(X, Y, ArrowLength: Integer);
  end;

var
  frmDepthPlot: TfrmDepthPlot;

implementation

{$R *.dfm}

procedure TfrmDepthPlot.DrawArrow(X, Y, ArrowLength: Integer);
const
  HeadWidth  = 6;
  HeadHeight = 3;
begin
  with pbDepthPlot.Canvas do
  begin
    Pen.Color := clGreen;
    Pen.Width := 1;
    Pen.Style := psSolid;

    // Line Main
    MoveTo(X, Y);
    LineTo(X + ArrowLength, Y);

    // Top Arrow
    MoveTo(X + ArrowLength - HeadWidth, Y - HeadHeight);
    LineTo(X + ArrowLength, Y);

    // Bottom Arrow
    MoveTo(X + ArrowLength - HeadWidth, Y + HeadHeight);
    LineTo(X + ArrowLength, Y);
  end;
end;

procedure TfrmDepthPlot.DrawGraphPlot;
const
  GraphLeft    = 28;
  GraphTop     = 5;
  RightMargin  = 31;
  BottomMargin = 24;

  ArrowLength = 6;
  ArrowWidth = 3;

  YPos    : array[0..4] of Integer = (0,75,150,225,300);

var
  i : Integer;

  GraphWidth  : Integer;
  GraphHeight : Integer;
  ShipY : Double;
  YLabels : array[0..4] of string;
  TempShip: TSimulationTrack;
  Rect: array[0..3] of TPoint;
  Torp : TTorpedoTrack;
begin
//  YLabels := ('','',
  YLabels[0] := '';
  YLabels[1] := '';
  YLabels[2] := IntToStr(Round(MaxDepth/2));
  YLabels[3] := '';
  YLabels[4] := IntToStr(Round(MaxDepth));
  GraphWidth  := pbDepthPlot.ClientWidth  - GraphLeft - RightMargin;
  GraphHeight := pbDepthPlot.ClientHeight - GraphTop  - BottomMargin;

  with pbDepthPlot.Canvas do
  begin
    Brush.Color := clBlack;
    FillRect(pbDepthPlot.ClientRect);

    Font.Color := clWhite;
    Font.Size  := 7;

    Pen.Color := clWhite;
    Pen.Style := psSolid;
    Pen.Width := 1;

    // Line Right
    MoveTo(GraphLeft + GraphWidth, GraphTop);
    LineTo(GraphLeft + GraphWidth, GraphTop + GraphHeight);

    // Line  Left
    MoveTo(GraphLeft, GraphTop);
    LineTo(GraphLeft, GraphTop + GraphHeight);

    for I := Low(YLabels) to High(YLabels) do
    begin
      MoveTo(GraphLeft - 5, GraphTop + YPos[I]);
      LineTo(GraphLeft + 2, GraphTop + YPos[I]);
      TextOut(2, GraphTop + YPos[I] - 6, YLabels[I]);
    end;

    for I := Low(YLabels) to High(YLabels) do
    begin
      MoveTo(GraphLeft + GraphWidth - 2, GraphTop + YPos[I]);
      LineTo(GraphLeft + GraphWidth + 5, GraphTop + YPos[I]);
    end;

    // Line Yellow
    Pen.Color := clYellow;
    Pen.Style := psSolid;
    MoveTo(GraphLeft, 5);
    LineTo(GraphLeft + GraphWidth, 5);

    // Line White
    Pen.Color := clWhite;
    Pen.Style := psSolid;
    MoveTo(GraphLeft - 30, 308);
    LineTo(GraphLeft + GraphWidth + 30, 308);

    // OwnShip
    Pen.Color := RGB(173, 235, 236);
    Pen.Style := psSolid;
    Pen.Width := 2;
    Brush.Style := bsClear;
    ShipY := (Abs(SutBlacksharkManager.xShip.PositionZ) / MaxDepth * GraphHeight);
    Ellipse(GraphLeft - 9, Round(ShipY + graphtop) - 9, GraphLeft + 9, Round(ShipY + graphtop) + 9);

    MoveTo(GraphLeft - 6, Round(ShipY + graphtop) - 6);
    LineTo(GraphLeft + 6, Round(ShipY + graphtop) + 6);

    MoveTo(GraphLeft + 6, Round(ShipY + graphtop) - 6);
    LineTo(GraphLeft - 6, Round(ShipY + graphtop) + 6);

    // target ship
    for i := 0 to VehicleMgr.ObjectList.Count - 1 do
    begin
      TempShip := TSimulationTrack(VehicleMgr.ObjectList[i]);
      if TempShip.Controlled_Track then
      begin
        Pen.Color := clRed;
        Pen.Style := psSolid;
        Pen.Width := 1;
        Brush.Style := bsClear;

        ShipY := (Abs(TempShip.PosZ) / MaxDepth * GraphHeight);
        Rect[0] := Point(Round(GraphWidth + graphleft -8) , Round(ShipY + graphtop -8));
        Rect[1] := Point(Round(GraphWidth + graphleft -8) , Round(ShipY + graphtop +8));
        Rect[2] := Point(Round(GraphWidth + graphleft +8) , Round(ShipY + graphtop +8));
        Rect[3] := Point(Round(GraphWidth + graphleft +8) , Round(ShipY + graphtop -8));
        Polygon(Rect);

        Rect[0] := Point(Round(GraphWidth + graphleft) , Round(ShipY + graphtop -8));
        Rect[1] := Point(Round(GraphWidth + graphleft -8) , Round(ShipY + graphtop));
        Rect[2] := Point(Round(GraphWidth + graphleft) , Round(ShipY + graphtop +8));
        Rect[3] := Point(Round(GraphWidth + graphleft +8) , Round(ShipY + graphtop));
        Polygon(Rect);
      end;
    end;



    if Assigned(TorpedoParam) then
    begin
      // Line Green Floor
      Pen.Color := clGreen;
      MoveTo(GraphLeft, Round(TorpedoParam.Floor / maxdepth * GraphHeight));
      LineTo(GraphLeft + GraphWidth, Round(TorpedoParam.Floor / maxdepth * GraphHeight));

      // Line Green Ceiling
      Pen.Color := clGreen;
      MoveTo(GraphLeft, Round(TorpedoParam.Ceiling / maxdepth * GraphHeight));
      LineTo(GraphLeft + GraphWidth, Round(TorpedoParam.ceiling / maxdepth * GraphHeight));

      // Line Red (Protection Area)
      Pen.Color := clRed;
      Pen.Width := 1;
      Pen.Style := psDot;
      MoveTo(GraphLeft + 28, GraphTop);
      LineTo(GraphLeft + 28, GraphTop + GraphHeight);



      // Line Green Vertical
      Pen.Color := clGreen;
      Pen.Style := psSolid;
      MoveTo(GraphLeft + Round(GraphWidth/2), GraphTop);
      LineTo(GraphLeft + Round(GraphWidth/2), GraphTop + GraphHeight);

      // Arrow Approach Depth
      Pen.Color := clGreen;
      Pen.Style := psSolid;
      MoveTo(GraphLeft, Round(TorpedoParam.ApproachDepth / maxdepth * GraphHeight));
      LineTo(GraphLeft + 50, Round(TorpedoParam.ApproachDepth / maxdepth * GraphHeight));

      MoveTo(GraphLeft + 50, Round(TorpedoParam.ApproachDepth / maxdepth * GraphHeight));
      LineTo(GraphLeft + 50 - ArrowLength, Round(TorpedoParam.ApproachDepth / maxdepth * GraphHeight) - ArrowWidth);

      MoveTo(GraphLeft + 50, Round(TorpedoParam.ApproachDepth / maxdepth * GraphHeight));
      LineTo(GraphLeft + 50 - ArrowLength, Round(TorpedoParam.ApproachDepth / maxdepth * GraphHeight) + ArrowWidth);

      // Line-Dotted Approach Depth to Search Depth
      Pen.Color := clGreen;
      Pen.Style := psDot;
      MoveTo(GraphLeft + 50, Round(TorpedoParam.ApproachDepth / maxdepth * GraphHeight));
      LineTo(GraphLeft + 50, Round(TorpedoParam.SearchDepth / maxdepth * GraphHeight));

      // Arrow Search Depth
      Pen.Color := clGreen;
      Pen.Style := psSolid;
      MoveTo(GraphLeft + 50, Round(TorpedoParam.SearchDepth / maxdepth * GraphHeight));
      LineTo(GraphLeft + 100, Round(TorpedoParam.SearchDepth / maxdepth * GraphHeight));

      MoveTo(GraphLeft + 100, Round(TorpedoParam.SearchDepth / maxdepth * GraphHeight));
      LineTo(GraphLeft + 100 - ArrowLength, Round(TorpedoParam.SearchDepth / maxdepth * GraphHeight) - ArrowWidth);

      MoveTo(GraphLeft + 100, Round(TorpedoParam.SearchDepth / maxdepth * GraphHeight));
      LineTo(GraphLeft + 100 - ArrowLength, Round(TorpedoParam.SearchDepth / maxdepth * GraphHeight) + ArrowWidth);

      // Line-Dotted Search Depth to Attack Depth
      Pen.Color := clGreen;
      Pen.Style := psDot;
      MoveTo(GraphLeft + 100, Round(TorpedoParam.SearchDepth / maxdepth * GraphHeight));
      LineTo(GraphLeft + 100, Round(TorpedoParam.AttackDepth / maxdepth * GraphHeight));

      // Arrow Attack Depth
      Pen.Color := clGreen;
      Pen.Style := psSolid;
      MoveTo(GraphLeft + 100, Round(TorpedoParam.AttackDepth / maxdepth * GraphHeight));
      LineTo(GraphLeft + 150, Round(TorpedoParam.AttackDepth / maxdepth * GraphHeight));

      MoveTo(GraphLeft + 150, Round(TorpedoParam.AttackDepth / maxdepth * GraphHeight));
      LineTo(GraphLeft + 150 - ArrowLength, Round(TorpedoParam.AttackDepth / maxdepth * GraphHeight) - ArrowWidth);

      MoveTo(GraphLeft + 150, Round(TorpedoParam.AttackDepth / maxdepth * GraphHeight));
      LineTo(GraphLeft + 150 - ArrowLength, Round(TorpedoParam.AttackDepth / maxdepth * GraphHeight) + ArrowWidth);
    end;

    // arrow torpedo
    Torp := nil;
    for i := 0 to VehicleMgr.ObjectList.Count - 1 do
    begin
      if VehicleMgr.ObjectList[i] is TTorpedoTrack then
      begin
        if TTorpedoTrack(VehicleMgr.ObjectList[i]).LauncherID = TorpedoParam.TorpedoIdx then
        begin
          Torp := TTorpedoTrack(VehicleMgr.ObjectList[i]);
          Break;
        end;
      end;
    end;
    if Torp <> nil then
    begin
      Pen.Color := clGreen;
      Pen.Style := psSolid;
      MoveTo(GraphLeft, Round(TorpedoParam.SearchDepth / maxdepth * GraphHeight));
      LineTo(GraphLeft + Round(GraphWidth/2), Round(TorpedoParam.SearchDepth / maxdepth * GraphHeight));

      MoveTo(GraphLeft + Round(GraphWidth/2), Round(TorpedoParam.SearchDepth / maxdepth * GraphHeight));
      LineTo(GraphLeft + Round(GraphWidth/2) - ArrowLength, Round(TorpedoParam.SearchDepth / maxdepth * GraphHeight) - ArrowWidth);

      MoveTo(GraphLeft + Round(GraphWidth/2), Round(TorpedoParam.SearchDepth / maxdepth * GraphHeight));
      LineTo(GraphLeft + Round(GraphWidth/2) - ArrowLength, Round(TorpedoParam.SearchDepth / maxdepth * GraphHeight) + ArrowWidth);
    end;
  end;
end;

procedure TfrmDepthPlot.FormCreate(Sender: TObject);
begin
  MinDepth := 0;
  MaxDepth := 100;
end;

procedure TfrmDepthPlot.lblSetClick(Sender: TObject);
begin
  if (edtMax.Text = '0') and (edtMin.Text = '0') then
  begin
    MinDepth := 0;
    MaxDepth := 100;
  end
  else
  begin
    MinDepth := StrToInt(edtMin.Text);
    MaxDepth := StrToInt(edtMax.Text);
  end;

end;

procedure TfrmDepthPlot.pbDepthPlotPaint(Sender: TObject);
begin
  DrawGraphPlot;
end;

procedure TfrmDepthPlot.tmrUpdateDepthPlotTimer(Sender: TObject);
begin
  //
  pbDepthPlot.Invalidate;
end;

end.
