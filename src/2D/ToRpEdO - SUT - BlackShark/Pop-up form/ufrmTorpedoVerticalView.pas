unit ufrmTorpedoVerticalView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.OleServer, MapXLib_TLB;

type
  TfrmTorpedoVerticalView = class(TForm)
    pnlMain: TPanel;
    edtMaxDepth: TEdit;
    edtMinDepth: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    edtStopDistance: TEdit;
    edtStartDistance: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    RadioGroup2: TRadioGroup;
    Label5: TLabel;
    lblRuntime: TLabel;
    Label7: TLabel;
    lblRunLength: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    lblApproachTime: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    lblApproachLength: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    lbl1: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    lblSearchLength: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    lblOwnShipwireLeft: TLabel;
    Label19: TLabel;
    lblBatteryCapacity: TLabel;
    lblBatteryCapacity1: TLabel;
    Label21: TLabel;
    lbl2: TLabel;
    lblToSoRange: TLabel;
    Label22: TLabel;
    lblClose: TLabel;
    Panel3: TPanel;
    pbHorizontalView: TPaintBox;
    pbVerticalView: TPaintBox;
    procedure pbHorizontalViewPaint(Sender: TObject);
    procedure pbVerticalViewPaint(Sender: TObject);
    procedure lblCloseClick(Sender: TObject);
  private

  public
    procedure DrawGraphVertical;
    procedure DrawGraphHorizontal;
  end;

var
  frmTorpedoVerticalView: TfrmTorpedoVerticalView;

implementation

{$R *.dfm}

procedure TfrmTorpedoVerticalView.DrawGraphHorizontal;
const
  GraphLeft    = 30;
  GraphTop     = 5;
  RightMargin  = 50;
  BottomMargin = 25;

  XLabels : array[0..14] of string  = ('1','2','3','4','5','6','7','8','9','10','11','12','13','14','km');
  XPos    : array[0..14] of Integer = (27,54,81,108,135,162,189,216,243,270,297,324,348,375,402);

  YLabels : array[0..9] of string  = ('60','120','100','240','200','360','420','480','540','m');
  YPos    : array[0..9] of Integer = (35,65,95,125,155,185,215,245,275,298);

var
  i : Integer;
  OriginX : Integer;
  OriginY : Integer;

  GraphWidth  : Integer;
  GraphHeight : Integer;
begin
  GraphWidth  := pbHorizontalView.ClientWidth  - GraphLeft - RightMargin;
  GraphHeight := pbHorizontalView.ClientHeight - GraphTop  - BottomMargin;

  with pbHorizontalView.Canvas do
  begin
    Brush.Color := clBlack;
    FillRect(pbHorizontalView.ClientRect);

    Font.Color := clSilver;
    Font.Size  := 7;

    Pen.Color := clSilver;
    Pen.Width := 1;

    MoveTo(GraphLeft, GraphTop);
    LineTo(GraphLeft, GraphTop + GraphHeight);

    MoveTo(GraphLeft + GraphWidth, GraphTop);
    LineTo(GraphLeft + GraphWidth, GraphTop + GraphHeight);

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

    for I := Low(YLabels) to High(YLabels) do
    begin
      MoveTo(GraphLeft + GraphWidth - 2, GraphTop + YPos[I]);
      LineTo(GraphLeft + GraphWidth + 5, GraphTop + YPos[I]);
      TextOut(GraphLeft + GraphWidth + 10, GraphTop + YPos[I] - 6, YLabels[I]);
    end;

    Pen.Color := RGB(50,80,50);

    MoveTo(GraphLeft, 5);
    LineTo(GraphLeft + GraphWidth, 5);

    MoveTo(GraphLeft, 405);
    LineTo(GraphLeft + GraphWidth, 405);

    OriginX := 65;
    OriginY := 260;

    Brush.Color := clLime;
    Pen.Color   := clLime;

    Ellipse(OriginX - 3, OriginY - 3, OriginX + 3, OriginY + 3);
    Pen.Color := RGB(170,150,120);

    MoveTo(OriginX, OriginY);
    LineTo(145, 210);

    MoveTo(OriginX, OriginY);
    LineTo(145, 310);

    Font.Color := RGB(170,150,120);
    TextOut(120, 215, '22.5°');

    Pen.Color := clLime;

    MoveTo(OriginX, OriginY);
    LineTo(210, 250);
    Brush.Color := clLime;

    Ellipse(207,247,213,253);
    Pen.Color := clRed;

    MoveTo(180, 105);
    LineTo(432, 105);

    Pen.Color := RGB(0,120,0);

    MoveTo(210,250);
    LineTo(300,240);
    Pen.Color := RGB(180,180,120);
    Pen.Style := psDot;

    MoveTo(OriginX, OriginY);
    LineTo(180,330);

    MoveTo(OriginX, OriginY);
    LineTo(220,370);

    MoveTo(OriginX, OriginY);
    LineTo(260,430);

    Pen.Style := psSolid;
  end;
end;

procedure TfrmTorpedoVerticalView.DrawGraphVertical;
const
  GraphLeft    = 28;
  GraphTop     = 20;
  RightMargin  = 50;
  BottomMargin = 25;

  XLabels : array[0..4] of string  = ('1700', '1400', '1500', '1000', 'm/s');
  XPos    : array[0..4] of Integer =  (5, 30, 55, 80, 125);

  YLabels : array[0..9] of string  = ('50', '120', '100', '240', '300', '360', '420', '400', '540', 'm');
  YPos    : array[0..9] of Integer = (40, 75, 110, 145, 180, 215, 250, 285, 320, 345);

var
  I      : Integer;
  X1, Y1 : Integer;

  GraphWidth  : Integer;
  GraphHeight : Integer;
begin
  GraphWidth  := pbVerticalView.ClientWidth  - GraphLeft - RightMargin;
  GraphHeight := pbVerticalView.ClientHeight - GraphTop  - BottomMargin;

  with pbVerticalView.Canvas do
  begin
    Brush.Color := clBlack;
    FillRect(pbVerticalView.ClientRect);

    Font.Color := clSilver;
    Font.Size  := 7;

    Pen.Color := clSilver;
    Pen.Width := 1;

    { Sumbu Y Lines Marker }
    MoveTo(GraphLeft, GraphTop);
    LineTo(GraphLeft, GraphTop + GraphHeight + 15);

    { Sumbu X Lines Marker}
    MoveTo(GraphLeft, GraphTop);
    LineTo(GraphLeft + GraphWidth + 60, GraphTop);

    { Label X + Tick X }
    for I := Low(XLabels) to High(XLabels) do
    begin
      TextOut(GraphLeft + XPos[I], 2, XLabels[I]);

      MoveTo(GraphLeft + XPos[I] + 10, GraphTop - 4);
      LineTo(GraphLeft + XPos[I] + 10, GraphTop + 4);
    end;

    TextOut(GraphLeft + 125, 2, 'm/s');

    { Label Y + Tick Y }
    for I := Low(YLabels) to High(YLabels) do
    begin
      TextOut(2, YPos[I], YLabels[I]);

      MoveTo(GraphLeft - 6, YPos[I] + 5);
      LineTo(GraphLeft + 2, YPos[I] + 5);
    end;

    { ===== Line 1 ===== }
    Pen.Color := clOlive;

    MoveTo(GraphLeft,      170);
    LineTo(GraphLeft + 20, 200);
    LineTo(GraphLeft + 40, 235);
    LineTo(GraphLeft + 55, 270);
    LineTo(GraphLeft + 70, 320);

    { ===== Line 2 ===== }
    Pen.Color := clGreen;

    MoveTo(GraphLeft,      140);
    LineTo(GraphLeft + 90, 110);

    { ===== Line 3 ===== }
    Pen.Color := clLime;

    MoveTo(GraphLeft,      165);
    LineTo(GraphLeft + 90, 125);

    { Marker }
    X1 := GraphLeft + 90;
    Y1 := 125;

    Brush.Color := clLime;
    Pen.Color := clLime;

    Ellipse(X1 - 3, Y1 - 3, X1 + 3, Y1 + 3);
  end;
end;

procedure TfrmTorpedoVerticalView.lblCloseClick(Sender: TObject);
begin
  FreeAndNil(frmTorpedoVerticalView);
end;

procedure TfrmTorpedoVerticalView.pbHorizontalViewPaint(Sender: TObject);
begin
  DrawGraphHorizontal;
end;

procedure TfrmTorpedoVerticalView.pbVerticalViewPaint(Sender: TObject);
begin
  DrawGraphVertical;
end;

end.
