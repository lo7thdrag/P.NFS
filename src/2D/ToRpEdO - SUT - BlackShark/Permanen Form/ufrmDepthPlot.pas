unit ufrmDepthPlot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmDepthPlot = class(TForm)
    pnlMain: TPanel;
    lbl1: TLabel;
    edtMin: TEdit;
    Label1: TLabel;
    edtMax: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    lblSpeedScaleFactor: TLabel;
    pbDepthPlot: TPaintBox;
    procedure pbDepthPlotPaint(Sender: TObject);
  private
    { Private declarations }
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
  GraphLeft    = 30;
  GraphTop     = 5;
  RightMargin  = 50;
  BottomMargin = 25;

  YLabels : array[0..4] of string  = ('','','130','','260');
  YPos    : array[0..4] of Integer = (0,80,160,240,300);

var
  i : Integer;

  GraphWidth  : Integer;
  GraphHeight : Integer;
begin
  GraphWidth  := pbDepthPlot.ClientWidth  - GraphLeft - RightMargin;
  GraphHeight := pbDepthPlot.ClientHeight - GraphTop  - BottomMargin;

  with pbDepthPlot.Canvas do
  begin
    Brush.Color := clBlack;
    FillRect(pbDepthPlot.ClientRect);

    Font.Color := clSilver;
    Font.Size  := 7;

    Pen.Color := clSilver;
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
    MoveTo(GraphLeft, 5);
    LineTo(GraphLeft + GraphWidth, 5);

    // Line White
    Pen.Color := clWhite;
    MoveTo(GraphLeft - 30, 308);
    LineTo(GraphLeft + GraphWidth + 30, 308);

    // Line Green Horizontal
    Pen.Color := clGreen;
    MoveTo(GraphLeft, 200);
    LineTo(GraphLeft + GraphWidth, 200);

    // Line Red
    Pen.Color := clRed;
    Pen.Style := psDot;
    MoveTo(GraphLeft + 20, GraphTop);
    LineTo(GraphLeft + 20, GraphTop + GraphHeight);

    // Line Green Vertical
    Pen.Color := clGreen;
    Pen.Style := psSolid;
    MoveTo(GraphLeft + 60, GraphTop);
    LineTo(GraphLeft + 60, GraphTop + GraphHeight - 165);

    // Arrow
    DrawArrow(GraphLeft + 90, GraphTop + 10, 40);
    DrawArrow(GraphLeft, GraphTop + 20, 60);
    DrawArrow(GraphLeft + 45, GraphTop + 30, 45);
    DrawArrow(GraphLeft, GraphTop + 50, 45);

    // Line Green Dots Vertical
    Pen.Color := clGreen;
    Pen.Style := psDot;
    MoveTo(GraphLeft + 45, GraphTop);
    LineTo(GraphLeft + 45, GraphTop + GraphHeight - 230);

    // Line Green Dots Vertical
    Pen.Color := clGreen;
    Pen.Style := psDot;
    MoveTo(GraphLeft + 90, GraphTop);
    LineTo(GraphLeft + 90, GraphTop + GraphHeight - 230);
  end;
end;

procedure TfrmDepthPlot.pbDepthPlotPaint(Sender: TObject);
begin
  DrawGraphPlot;
end;

end.
