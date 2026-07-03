unit ufrmTorpedoTubeStatusWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, uSutBlacksharkManager, uTorpedoLauncher;

type
  TfrmTorpedoTubeStatusWindow = class(TForm)
    pnlMain: TPanel;
    pnlTorpedo2: TPanel;
    pnlTorpedo4: TPanel;
    pnlTorpedo6: TPanel;
    pnlTorpedo8: TPanel;
    pnlTorpedo1: TPanel;
    pnlTorpedo3: TPanel;
    pnlTorpedo5: TPanel;
    pnlTorpedo7: TPanel;
    lblTorpedo1: TLabel;
    lblTorpedo2: TLabel;
    lblTorpedo3: TLabel;
    lblTorpedo4: TLabel;
    lblTorpedo6: TLabel;
    lblTorpedo5: TLabel;
    lblTorpedo8: TLabel;
    lblTorpedo7: TLabel;
    lblNumber2: TLabel;
    lblNumber1: TLabel;
    lblNumber3: TLabel;
    lblNumber4: TLabel;
    lblNumber5: TLabel;
    lblNumber6: TLabel;
    lblNumber7: TLabel;
    lblNumber8: TLabel;
    lblWTSRC1: TLabel;
    lblWTSRC2: TLabel;
    lblWTSRC3: TLabel;
    lblWTSRC4: TLabel;
    lblWTSRC5: TLabel;
    lblWTSRC6: TLabel;
    lblWTSRC7: TLabel;
    lblWTSRC8: TLabel;
    tmrDrawTube: TTimer;
    pbTubeSymbol1: TPaintBox;
    pbTubeSymbol2: TPaintBox;
    pbTubeSymbol3: TPaintBox;
    pbTubeSymbol4: TPaintBox;
    pbTubeSymbol5: TPaintBox;
    pbTubeSymbol6: TPaintBox;
    pbTubeSymbol7: TPaintBox;
    pbTubeSymbol8: TPaintBox;
    procedure lblTorpedo1Click(Sender: TObject);
    procedure tmrDrawTubeTimer(Sender: TObject);
    procedure DrawTube(pBox: TPaintBox; aLauncher: TTorpedoLauncher);
    procedure pbTubeSymbol1Paint(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UpdateImage;
  end;

var
  frmTorpedoTubeStatusWindow: TfrmTorpedoTubeStatusWindow;

implementation

{$R *.dfm}

{ TfrmTorpedoTubeStatusWindow }

procedure TfrmTorpedoTubeStatusWindow.DrawTube(pBox: TPaintBox; aLauncher: TTorpedoLauncher);
var
  aCnv: TCanvas;
  Cx, Cy: Double;
  Points: array[0..2] of TPoint;
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
      aCnv.Pen.Color := clYellow;
      aCnv.Brush.Color := clYellow;
      aCnv.Brush.Style := bsSolid;
    end
    else if aLauncher.TorpedoStatus = tsTesting then // harus dibuat blinking
    begin
      aCnv.Pen.Color := clYellow;
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

procedure TfrmTorpedoTubeStatusWindow.lblTorpedo1Click(Sender: TObject);
begin
//  lblTorpedo1.Caption := 'MSI-SRC-SA';
//  UpdateImage;
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
end;

procedure TfrmTorpedoTubeStatusWindow.UpdateImage;
var
  Basepath, Filename: string;
begin
//  Basepath := 'D:\NFS\P.NFS\bin\2D\data\images\blackshark\';
//
//  if lblTorpedo1.Caption = 'TORP READY' then
//     Filename := Basepath + 'Status1.bmp'
//  else if lblTorpedo1.Caption = 'MSI-SRC-SA' then
//     Filename := Basepath + 'Status2.bmp'
//  else if lblTorpedo1.Caption = 'MAN-HORIZ' then
//     Filename := Basepath + 'Status3.bmp';
//
//  if FileExists(Filename) then
//  begin
//     imgTorpedo1.Picture.LoadFromFile(Filename);
//     imgTorpedo1.Refresh;
//  end
//  else
//    ShowMessage('File not found : ' + Filename);
end;

end.

