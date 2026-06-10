unit ufrmHomingStatusPlot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvSmoothTabPager,
  Vcl.ExtCtrls;

type
  TfrmHomingStatusPlot = class(TForm)
    pnlMain: TPanel;
    TabHomingStatusPlot: TAdvSmoothTabPager;
    TabHomingStatus: TAdvSmoothTabPage;
    TabToSoCoverage: TAdvSmoothTabPage;
    Label1: TLabel;
    lblValTorpedo: TLabel;
    Label2: TLabel;
    lblValContact: TLabel;
    lblToSoHomingPN3D: TLabel;
    lblTgtLostSub: TLabel;
    lblLongRangeAttack: TLabel;
    lblToSotargetacquiredclose: TLabel;
    lblCloseInSub: TLabel;
    pbToSoCoveragePlot: TPaintBox;
    pbHomingStatusPlot: TPaintBox;
    pbWakeLost: TPaintBox;
    Label3: TLabel;
    pbWakeAttack: TPaintBox;
    lblWakeAttaack: TLabel;
    pbLongRange: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure pbToSoCoveragePlotPaint(Sender: TObject);
    procedure pbHomingStatusPlotPaint(Sender: TObject);
    procedure pbWakeAttackPaint(Sender: TObject);
  private
    function WorldToScreenX(X: Double): Integer;
    function WorldToScreenY(Y: Double): Integer;

    procedure DrawGrid(C: TCanvas);
    procedure DrawAxis(C: TCanvas);
    procedure DrawTarget(C: TCanvas; X, Y: Double);
    procedure DrawTorpedo(C: TCanvas; X, Y: Double);
  public
    { Public declarations }
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

procedure TfrmHomingStatusPlot.DrawAxis(C: TCanvas);
var
  CX,CY : Integer;
  I : Integer;
  X,Y : Integer;
begin
  CX := WorldToScreenX(0);
  CY := WorldToScreenY(0);

  C.Pen.Color := clWhite;
  C.Pen.Width := 1;

  C.MoveTo(0,CY);
  C.LineTo(pbToSoCoveragePlot.Width,CY);

  C.MoveTo(CX,0);
  C.LineTo(CX,pbToSoCoveragePlot.Height);

  C.Font.Color := clWhite;

  for I := -45 to 45 do
  begin
    if (I <> 0) and (I mod 15 = 0) then
    begin
      X := WorldToScreenX(I);

      C.MoveTo(X,CY);
      C.LineTo(X,CY+5);

      C.TextOut(X-10,CY+8,IntToStr(I));
    end;
  end;

  for I := -30 to 30 do
  begin
    if (I <> 0) and (I mod 15 = 0) then
    begin
      Y := WorldToScreenY(I);

      C.MoveTo(CX-5,Y);
      C.LineTo(CX,Y);

      C.TextOut(5,Y-8,IntToStr(I));
    end;
  end;

end;

procedure TfrmHomingStatusPlot.DrawGrid(C: TCanvas);
var
  I : Integer;
  X : Integer;
  Y : Integer;
begin
  C.Pen.Color := $202020;

  for I := -45 to 45 do
  begin
    if I mod 15 = 0 then
    begin
      X := WorldToScreenX(I);

      C.MoveTo(X,0);
      C.LineTo(X,pbToSoCoveragePlot.Height);
    end;
  end;
end;

procedure TfrmHomingStatusPlot.DrawTarget(C: TCanvas; X, Y: Double);
var
  SX,SY : Integer;
begin
  SX := WorldToScreenX(X);
  SY := WorldToScreenY(Y);

  C.Pen.Color := clYellow;
  C.Pen.Width := 3;

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
  C.Pen.Width := 3;

  C.MoveTo(SX,SY-15);
  C.LineTo(SX,SY+15);
end;

procedure TfrmHomingStatusPlot.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
end;

procedure TfrmHomingStatusPlot.pbHomingStatusPlotPaint(Sender: TObject);
begin
  with pbHomingStatusPlot.Canvas do
  begin
    Brush.Color := clBlack;
    FillRect(pbHomingStatusPlot.ClientRect);

    // Tgt Lost Sub
    Font.Color := clYellow;
    Font.Size := 10;
    TextOut(150,20,'Tgt Lost Sub');

    Pen.Color := clYellow;
    Pen.Width := 2;
    Brush.Style := bsClear;
    Ellipse(420,50,470,100);

    // Long Range Attack
    Font.Color := clLime;
    TextOut(20,130,'Long Range Attack');

    Pen.Color := clLime;
    Ellipse(80,180,130,230);

    // Garis
    MoveTo(130,205);
    LineTo(260,250);

    // Close-In Sub
    Brush.Style := bsSolid;
    Brush.Color := clLime;
    Ellipse(260,220,320,280);

    Brush.Style := bsClear;
    TextOut(330,240,'Close-In Sub');
  end;
end;

procedure TfrmHomingStatusPlot.pbToSoCoveragePlotPaint(Sender: TObject);
begin
  pbToSoCoveragePlot.Canvas.Brush.Color := clBlack;
  pbToSoCoveragePlot.Canvas.FillRect(pbToSoCoveragePlot.ClientRect);

  DrawGrid(pbToSoCoveragePlot.Canvas);
  DrawAxis(pbToSoCoveragePlot.Canvas);

  { Target }
  DrawTarget(pbToSoCoveragePlot.Canvas,-7,0);

  { Torpedo }
  DrawTorpedo(pbToSoCoveragePlot.Canvas,-5,0);
end;

procedure TfrmHomingStatusPlot.pbWakeAttackPaint(Sender: TObject);
var
  cx, cy, r : Integer;
begin
  pbWakeAttack.Canvas.Brush.Color := clBlack;
  pbWakeAttack.Canvas.FillRect(pbWakeAttack.ClientRect);

  cx := pbWakeAttack.Width div 2;
  cy := pbWakeAttack.Height div 2;
  r  := 80;

  pbWakeAttack.Canvas.Brush.Color := clLime;
  pbWakeAttack.Canvas.pen.Color   := clWhite;
  pbWakeAttack.Canvas.Pen.Width   := 3;

  pbWakeAttack.Canvas.Ellipse(cx - r, cy - r, cx + r, cy + r);
end;

function TfrmHomingStatusPlot.WorldToScreenX(X: Double): Integer;
begin
  Result := Round((X - XMin) / (XMax - XMin) * pbToSoCoveragePlot.Width);
end;

function TfrmHomingStatusPlot.WorldToScreenY(Y: Double): Integer;
begin
  Result := Round(pbToSoCoveragePlot.Height - ((Y - YMin) / (YMax - YMin) * pbToSoCoveragePlot.Height));
end;

end.
