unit ufrmSupportScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

const
  MAX_TARGET = 50;

type
  PRGBTripleArray = ^TRGBTripleArray;
  TRGBTripleArray = array[0..32767] of TRGBTriple;


  TSonarTarget = record
    Bearing : Double;
    Speed   : Double;
    Strength : Integer;
  end;

type
  TFrmSupportScreen = class(TForm)
    pnlBaseKiri: TPanel;
    pnlMap: TPanel;
    pnlInfoKanan: TPanel;
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    pnlInfoKiri: TPanel;
    pnlInfoAtas: TPanel;
    lblTanggaljam: TLabel;
    lblOwnshipHeadingVal: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lblOwnshipLatPosVal: TLabel;
    Label4: TLabel;
    lblOwnshipLongPosVal: TLabel;
    Label6: TLabel;
    lblOwnshipSpeedVal: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lblOwnshipDepth: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Panel1: TPanel;
    procedure PaintBox1Paint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DrawBearingGrid;
    procedure DrawGrid;
    procedure DrawBearingScale;
    procedure UpdateWaterfall;
    procedure UpdateTarget;
    procedure DrawTimeScale;
    function SignalColor(v: Integer): TRGBTriple;
    function SeaNoise: Integer;
    procedure TrackGainChange(Sender: TObject);
    procedure TrackZoomChange(Sender: TObject);
    procedure ComboSectorChange(Sender: TObject);
  private
    Waterfall : TBitmap;

    BearingCount : Integer;
    SectorWidth  : Integer;
    ZoomFactor   : Double;
    GainValue    : Integer;

    Targets : array[0..MAX_TARGET-1] of TSonarTarget;
    { Public declarations }
  end;

//  TRGB = packed record
//    B,G,R : Byte;
//  end;

var
  frmSupportScreen: TFrmSupportScreen;
  //TFrmSupportScreen

implementation

{$R *.dfm}

procedure TFrmSupportScreen.ComboSectorChange(Sender: TObject);
begin
//  SectorWidth := StrToInt(ComboSector.Text);
end;

procedure TFrmSupportScreen.DrawBearingGrid;
var
  i, step: Integer;
begin

  step := Waterfall.Width div 36;

  Waterfall.Canvas.Pen.Color := clGray;

  for i := 0 to 36 do
  begin
    Waterfall.Canvas.MoveTo(i * step,0);
    Waterfall.Canvas.LineTo(i * step,Waterfall.Height);
  end;

end;

procedure TFrmSupportScreen.DrawBearingScale;
var
  i,step,angle : Integer;
begin

  step := BearingCount div 18;

  Waterfall.Canvas.Font.Color := clWhite;

  for i := 0 to 18 do
  begin
    angle := i * 20;
    PaintBox1.Canvas.TextOut(i*step+2,2,IntToStr(angle));
  end;

end;

procedure TFrmSupportScreen.DrawGrid;
var
  i, step : Integer;
begin

  step := BearingCount div 18;

  Waterfall.Canvas.Pen.Color := RGB(60,60,60);

  for i := 0 to 18 do
  begin
    Waterfall.Canvas.MoveTo(i*step,0);
    Waterfall.Canvas.LineTo(i*step,Waterfall.Height);
  end;

end;

procedure TFrmSupportScreen.DrawTimeScale;
var
  i : Integer;
begin

  Waterfall.Canvas.Font.Color := clWhite;

  for i := 0 to 10 do
  begin
    Waterfall.Canvas.TextOut(
      2,
      i*80,
      FormatFloat('0:00',i*0.2)
    );
  end;

end;

procedure TFrmSupportScreen.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  Timer1.Interval := 30;
  Timer1.Enabled := True;
  PaintBox1.Align := alClient;

  Randomize;

  BearingCount := PaintBox1.Width;
  SectorWidth := 360;
  ZoomFactor := 1;
  GainValue := 50;

  Waterfall := TBitmap.Create;
  Waterfall.PixelFormat := pf24bit;
  Waterfall.SetSize(PaintBox1.Width, PaintBox1.Height);

  Waterfall.Canvas.Brush.Color := clBlack;
  Waterfall.Canvas.FillRect(Rect(0,0,Waterfall.Width,Waterfall.Height));

  for i := 0 to MAX_TARGET-1 do
  begin
    Targets[i].Bearing := Random(60) + Random(60)+ Random(60)+ Random(60)+ Random(60)+ Random(60);
    Targets[i].Speed := Random * 0.5 - 0.25;
    Targets[i].Strength := {180 +} Random(360);
  end;
end;

procedure TFrmSupportScreen.PaintBox1Paint(Sender: TObject);
var
  i,step : Integer;
begin
  PaintBox1.Canvas.Draw(0,0,Waterfall);

  step := Waterfall.Width div 18;

  PaintBox1.Canvas.Pen.Color := RGB(60,60,60);

  for i := 0 to 18 do
  begin
    PaintBox1.Canvas.MoveTo(i*step,0);
    PaintBox1.Canvas.LineTo(i*step,PaintBox1.Height);
  end;


//  PaintBox1.Canvas.Draw(0,0,Waterfall);

end;

function TFrmSupportScreen.SeaNoise: Integer;
begin
  Result := Random(10) + Random(10) + Random(10);
end;

function TFrmSupportScreen.SignalColor(v: Integer): TRGBTriple;
begin

  if v < 30 then
  begin
    Result.rgbtRed := 0;
    Result.rgbtGreen := 0;
    Result.rgbtBlue := 0;
  end
  else
  if v < 90 then
  begin
    Result.rgbtRed := 0;
    Result.rgbtGreen := v;
    Result.rgbtBlue := 0;
  end
  else
  if v < 160 then
  begin
    Result.rgbtRed := v;
    Result.rgbtGreen := v div 2;
    Result.rgbtBlue := 0;
  end
  else
  begin
    Result.rgbtRed := 255;
    Result.rgbtGreen := 0;
    Result.rgbtBlue := 0;
  end;

end;

procedure TFrmSupportScreen.Timer1Timer(Sender: TObject);
begin
    UpdateTarget;

  UpdateWaterfall;

  PaintBox1.Invalidate;

//  UpdateTarget;
//
//  UpdateWaterfall;
//
  DrawBearingScale;
//
  DrawTimeScale;
//
//  PaintBox1.Invalidate;

end;

procedure TFrmSupportScreen.TrackGainChange(Sender: TObject);
begin
//  GainValue := TrackGain.Position;
end;

procedure TFrmSupportScreen.TrackZoomChange(Sender: TObject);
begin
//  ZoomFactor := TrackZoom.Position / 10;
end;

procedure TFrmSupportScreen.UpdateTarget;
var
  i : Integer;
begin

  for i := 0 to MAX_TARGET-1 do
  begin

    Targets[i].Bearing :=
      Targets[i].Bearing + Targets[i].Speed;

    if Targets[i].Bearing < 0 then
      Targets[i].Bearing := Targets[i].Bearing + 360;

    if Targets[i].Bearing > 360 then
      Targets[i].Bearing := Targets[i].Bearing - 360;

  end;

end;

procedure TFrmSupportScreen.UpdateWaterfall;
var
  Row : PRGBTripleArray;
  x,i,pos : Integer;
  intensity : Integer;
  col : TRGBTriple;
begin

  BitBlt(
    Waterfall.Canvas.Handle,
    0,1,
    Waterfall.Width,
    Waterfall.Height-1,
    Waterfall.Canvas.Handle,
    0,0,
    SRCCOPY
  );

  Row := Waterfall.ScanLine[0];

  for x := 0 to BearingCount-1 do
  begin

    intensity := SeaNoise;

//    for i := 0 to MAX_TARGET-1 do
//    begin
//
//      pos := Round(
//        Targets[i].Bearing / SectorWidth * BearingCount
//      );
//
//      if Abs(x-pos) <= 0.5 then
//        intensity := Targets[i].Strength;
//
//    end;

    intensity := intensity +10;

    col := SignalColor(intensity);

    Row[x].rgbtRed := col.rgbtRed;
    Row[x].rgbtGreen := col.rgbtGreen;
    Row[x].rgbtBlue := col.rgbtBlue;

  end;

end;

end.
