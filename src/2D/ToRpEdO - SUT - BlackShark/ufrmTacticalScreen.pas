unit ufrmTacticalScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, uSettingFormToMonitorWith_ini, uFormUtil, ufrmSupportScreen,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.OleCtrls, MapXLib_TLB, uBaseFunction, uLibConst,
  uBaseConst, uRadarVisual, uMapXUnitConverter, uCoordConverter, System.Math, uSutBlacksharkManager, uRadarNorthIndicator,
  uVehicleManager, uScriptSutBlackshark, uSimulationManager;

type
  TFrmTacticalScreen = class(TForm)
    pnlInfoAtas: TPanel;
    pnlMap: TPanel;
    pnlTEP: TPanel;
    pnlInfoKanan: TPanel;
    pnlBaseKiri: TPanel;
    pnlTacticalBtn: TPanel;
    pnlSubmodeTools6: TPanel;
    pnlSubmodeTools7: TPanel;
    pnlSubmodeTools8: TPanel;
    pnlSubmodeTools9: TPanel;
    pnlTrackManagement: TPanel;
    pnlSystem: TPanel;
    pnlPMA: TPanel;
    pnlRadarFreeze: TPanel;
    pnlSnapshot: TPanel;
    pnlTacticalRecording: TPanel;
    pnlTorpedoBtn: TPanel;
    pnlIntercom: TPanel;
    pnlTMABtn: TPanel;
    pnlSubmodeTools16: TPanel;
    pnlSubmodeTools17: TPanel;
    pnlSubmodeTools18: TPanel;
    pnlSubmodeTools19: TPanel;
    pnlRecordPMA: TPanel;
    pnlToolkit: TPanel;
    pnlImageReplay: TPanel;
    pnlControlByNumber: TPanel;
    pnlResmBtn: TPanel;
    pnlBelumtau: TPanel;
    pnlImageRecording: TPanel;
    pnlPeriscopeBtn: TPanel;
    pnlAckAlert: TPanel;
    pnlLinkBtn: TPanel;
    pnlSubmodeTools10: TPanel;
    pnlSubmodeTools11: TPanel;
    pnlSubmodeTools12: TPanel;
    pnlSubmodeTools13: TPanel;
    pnlSubmodeTools14: TPanel;
    pnlSubmodeTools0: TPanel;
    pnlSubmodeTools15: TPanel;
    pnlSubmodeTools1: TPanel;
    pnlSubmodeTools2: TPanel;
    pnlSubmodeTools3: TPanel;
    pnlSubmodeTools4: TPanel;
    pnlSubmodeTools5: TPanel;
    lblSubmodeTools0: TLabel;
    lblSubmodeTools1: TLabel;
    lblSubmodeTools2: TLabel;
    lblSubmodeTools3: TLabel;
    lblSubmodeTools4: TLabel;
    lblSubmodeTools5: TLabel;
    lblSubmodeTools6: TLabel;
    lblSubmodeTools7: TLabel;
    lblSubmodeTools10: TLabel;
    lblSubmodeTools11: TLabel;
    lblSubmodeTools12: TLabel;
    lblSubmodeTools13: TLabel;
    lblSubmodeTools14: TLabel;
    lblSubmodeTools15: TLabel;
    lblSubmodeTools16: TLabel;
    lblSubmodeTools17: TLabel;
    lblSubmodeTools18: TLabel;
    lblSubmodeTools19: TLabel;
    lblSubmodeTools9: TLabel;
    lblSubmodeTools8: TLabel;
    lblTrackManagement: TLabel;
    lblRecordPMA: TLabel;
    lblRadarFreeze: TLabel;
    lblControlByNumber: TLabel;
    lblSystem: TLabel;
    lblToolkit: TLabel;
    lblTacticalRecording: TLabel;
    lblImageRecording: TLabel;
    lblPMA: TLabel;
    lblImageReplay: TLabel;
    lblSnapshot: TLabel;
    lblBelumtau: TLabel;
    lblIntercom: TLabel;
    lblAckAlert: TLabel;
    lblTanggaljam: TLabel;
    lblHeadingVal: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    imgMSI: TImage;
    imgNav: TImage;
    Label16: TLabel;
    imgRad: TImage;
    Label17: TLabel;
    imgResm: TImage;
    Label18: TLabel;
    imgPerisc: TImage;
    Label19: TLabel;
    Label20: TLabel;
    imgSonar: TImage;
    Label21: TLabel;
    imgMast: TImage;
    Label22: TLabel;
    imgLink: TImage;
    Label23: TLabel;
    imgWTSRC: TImage;
    Label24: TLabel;
    imgTBI: TImage;
    Label25: TLabel;
    lblTorpedoModeVal: TLabel;
    Label27: TLabel;
    lblSimulationModeVal: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    lblFireAuthVal: TLabel;
    Label32: TLabel;
    lblConsoleVal: TLabel;
    FMap: TMap;
    Panel1: TPanel;
    imgListLight: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure pnlTacticalBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlSubmodeTools0MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure FMapDrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);

  private
    { Private declarations }
    Submode : Byte;
    BitMapLampGrey, BitMapLampGreen, BitMapLampRed : TBitmap;
    FLyrDraw: CMapXLayer;
    FCurrentRange, FBearingVal, FElevVal : Double;  // meter
    FRings       : TRadarRangeRings;
    FBearing0    : TRadarBearing;
    FNorthAngle : Double;
    FMapCanvas     : TCanvas;
    FMapConverter : TMapXUnitConverter;
    FNorthInd : TRadarNorthIndicator;
    FShipHeading : Integer;

//    TargetMgr : TRadarTargetManager;

    FCircleRect  : TRect;
    FCircleCX    : Integer;
    FCircleCY    : Integer;
    FCircleR     : Integer; // radius pixel lingkaran peta

    FFlag       : Byte;
    FBitmapBackground : TBitmap;


    procedure SubmodeSelect(Sender: Tobject);
    procedure SetLayoutForm;
    procedure ResetSubmodeTools;
    procedure LoadGeoset(const aGst: string); virtual;
    procedure setRegionCircle;
    procedure DrawAll(aCnv: TCanvas; aCvt: TCoordConverter; aFlag: Byte);


  public
    { Public declarations }
    rCX, rCY: integer;
  end;

var
  frmTacticalScreen: TFrmTacticalScreen;
  //TFrmTacticalScreen

implementation

{$R *.dfm}

const
  CMin_Z = 0;
  CMax_Z = 64;

{ TFrmTacticalScreen }
procedure EnableComposited(WinControl:TWinControl);
var
  i:Integer;
  NewExStyle:DWORD;
begin
  NewExStyle := GetWindowLong(WinControl.Handle, GWL_EXSTYLE) or WS_EX_COMPOSITED;
  SetWindowLong(WinControl.Handle, GWL_EXSTYLE, NewExStyle);

  for I := 0 to WinControl.ControlCount - 1 do
    if WinControl.Controls[i] is TWinControl then
      EnableComposited(TWinControl(WinControl.Controls[i]));
end;
function ZoomIndexToScale(const i: Integer): double;
begin
  if i < -3 then
    result := 0.125
  else if i > 14 then
    result := 2500.0
  else
    result := Power(2.0, (i - 3));
end;

function FindClosestZoomIndex(const z: double): Integer;
var
  i: Integer;
begin
  if z >= 2500 then
    result := CMax_Z
  else if z <= 0.125 then
    result := CMin_Z
  else
  begin
    i := Round(Log2(z));
    result := i + 3;
  end;
end;
function FixMapZoom(z: double): double;
begin
  if z >= 1.0 then
    result := Round(z)
  else
    result := 0.001 * Round(z * 1000);
end;

procedure TFrmTacticalScreen.DrawAll(aCnv: TCanvas; aCvt: TCoordConverter;
  aFlag: Byte);
var
  pnt: Winapi.Windows.TPoint;
  z: double;
  i: Integer;
begin
  aCvt.ConvertToScreen(FMap.CenterX, FMap.CenterY, pnt.X, pnt.Y);

  z := FixMapZoom(FMap.Zoom);
  i := FindClosestZoomIndex(z);
  z := ZoomIndexToScale(i);

    // --- North Indicator ---
    FNorthInd.CenterX       := FCircleCX;
    FNorthInd.CenterY       := FCircleCY;
    FNorthInd.RadiusPx      := FCircleR;
    if Assigned(SutBlacksharkManager) then
    begin
      if Assigned(SutBlacksharkManager.xShip) then
      begin
        FNorthInd.HeadingDeg    := SutBlacksharkManager.xShip.Heading;
        FNorthInd.UseTrueMotion := SutBlacksharkManager.IsTrueMotion; // TRUE or FALSE
      end;
    end;
    FNorthInd.Draw(aCnv);



    // RANGE RINGS
    FRings.CircleRect    := FCircleRect;
    FRings.CurrentRange_m := FCurrentRange;
    FRings.ConvertCoord(aCvt);
    FRings.Draw(aCnv);

    // BEARING 0°
//    FBearing0.CircleRect := FCircleRect;
//    FBearing0.ConvertCoord(aCvt);
//    FBearing0.Draw(aCnv);

//    TargetMgr.Draw(aCnv);

    VehicleMgr.DrawAll(aCnv);
end;



procedure TFrmTacticalScreen.FMapDrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull,
  RectInvalid: IDispatch);
begin
  FMapCanvas.Handle := hOutputDC;
  DrawAll(FMapCanvas, FMapConverter, FFlag);
end;

procedure TFrmTacticalScreen.FormCreate(Sender: TObject);
begin
  SetLayoutForm;
  ResetSubmodeTools;
  Submode := 7;

  BeginGame_SutBlackshark;
  SutBlacksharkManager := TSutBlacksharkManager.Create;
  SimCenter := SutBlacksharkManager;
  SimCenter.FMap := FMap;
//  SutBlacksharkManager.OnPtkCommand := ptkCommand; // petek
//  SutBlacksharkManager.initEvent;


  FNorthAngle := 0;
  FMapCanvas         := TCanvas.Create;
  FMapConverter := TMapXUnitConverter.Create;
  FMapConverter.FMap := FMap;
  FCurrentRange := CRangeOperationBS[3]; // default di 8 nm

  VehicleMgr := TVehicleManager.Create;
  VehicleMgr.CoordConverter := FMapConverter;

//  EnableComposited(pnlMap);
//  FBitmapBackground := TBitmap.Create;
//  FBitmapBackground.Height := imgBackgrounSituationZone.Height;
//  FBitmapBackground.Width := imgBackgrounSituationZone.Width;
//  FBitmapBackground.Canvas.Brush.Color := clBlack; // new color
//  FBitmapBackground.Canvas.FillRect(
//   Rect(
//     0,
//     0,
//     FBitmapBackground.Width,
//     FBitmapBackground.Height
//    )
//  );
//
//  imgBackgrounSituationZone.Picture.Assign(FBitmapBackground);

  LoadGeoset('..\data\maps\IndonesiaBlackShark.gst');

  setRegionCircle;

  FRings := TRadarRangeRings.Create;
  FRings.Visible := True;

  FNorthInd := TRadarNorthIndicator.Create;

  FShipHeading := 0; // awal

//  FBearing0 := TRadarBearing.Create(0, clWhite, 'MR35');

  FMap.ZoomTo((Self.FCurrentRange) * 2, FMap.CenterX, FMap.CenterY);

  BitMapLampGrey := TBitmap.Create;
  BitMapLampGreen := TBitmap.Create;
  BitMapLampRed := TBitmap.Create;
  imgListLight.GetBitmap(0, BitMapLampGrey);
  imgListLight.GetBitmap(4, BitMapLampGreen);
  imgListLight.GetBitmap(5, BitMapLampRed);

  imgMSI.Picture.Bitmap := BitMapLampRed;
  imgNav.Picture.Bitmap := BitMapLampRed;
  imgRad.Picture.Bitmap := BitMapLampRed;
  imgResm.Picture.Bitmap := BitMapLampRed;
  imgPerisc.Picture.Bitmap := BitMapLampRed;
  imgSonar.Picture.Bitmap := BitMapLampRed;
  imgMast.Picture.Bitmap := BitMapLampRed;
  imgLink.Picture.Bitmap := BitMapLampRed;
  imgWTSRC.Picture.Bitmap := BitMapLampRed;
  imgTBI.Picture.Bitmap := BitMapLampRed;



end;

procedure TFrmTacticalScreen.FormDestroy(Sender: TObject);
begin
  BitMapLampGrey.Free;
  BitMapLampGreen.Free;
  BitMapLampRed.Free;
end;

procedure TFrmTacticalScreen.LoadGeoset(const aGst: string);
var i: integer;
  z: OleVariant;
  mInfo : CMapXLayerInfo;
begin

  InitOleVariant(z);
  FMap.Layers.RemoveAll;

  if (aGst <> '') and  FileExists(aGst) then begin
    FMap.Geoset := aGst;
    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw ;
    mInfo.AddParameter('Name', 'Animation');
    FLyrDraw := FMap.Layers.Add(mInfo, 1);
    FMap.Layers.AnimationLayer := FLyrDraw;
    FMap.BackColor := CBackgroundMapColor;
    FMap.MapUnit := miUnitNauticalMile;
    FMap.CenterX := 112.75;
    fmap.CenterY := -7.2;
    FMap.ZoomTo(Self.FCurrentRange * 2, FMap.CenterX, FMap.CenterY);
  end
end;

procedure TFrmTacticalScreen.pnlSubmodeTools0MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//   TPanel(TLabel(Sender).Parent).Color := clLime;
end;

procedure TFrmTacticalScreen.pnlTacticalBtnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  if TPanel(Sender).Color = clLime then
//    TPanel(Sender).Color := clBlack
//  else if TPanel(Sender).Color = clBlack then
//    TPanel(Sender).Color := clLime;
    SubmodeSelect(Sender);
//  (Sender as TPanel).Color := clLime;
end;

procedure TFrmTacticalScreen.ResetSubmodeTools;
begin
  pnlSubmodeTools0.Color := clBlack;
  pnlSubmodeTools1.Color := clBlack;
  pnlSubmodeTools2.Color := clBlack;
  pnlSubmodeTools3.Color := clBlack;
  pnlSubmodeTools4.Color := clBlack;
  pnlSubmodeTools5.Color := clBlack;
  pnlSubmodeTools6.Color := clBlack;
  pnlSubmodeTools7.Color := clBlack;
  pnlSubmodeTools8.Color := clBlack;
  pnlSubmodeTools9.Color := clBlack;
  pnlSubmodeTools10.Color := clBlack;
  pnlSubmodeTools11.Color := clBlack;
  pnlSubmodeTools12.Color := clBlack;
  pnlSubmodeTools13.Color := clBlack;
  pnlSubmodeTools14.Color := clBlack;
  pnlSubmodeTools15.Color := clBlack;
  pnlSubmodeTools16.Color := clBlack;
  pnlSubmodeTools17.Color := clBlack;
  pnlSubmodeTools18.Color := clBlack;
  pnlSubmodeTools19.Color := clBlack;

  pnlSubmodeTools0.Enabled := False;
  pnlSubmodeTools1.Enabled := False;
  pnlSubmodeTools2.Enabled := False;
  pnlSubmodeTools3.Enabled := False;
  pnlSubmodeTools4.Enabled := False;
  pnlSubmodeTools5.Enabled := False;
  pnlSubmodeTools6.Enabled := False;
  pnlSubmodeTools7.Enabled := False;
  pnlSubmodeTools8.Enabled := False;
  pnlSubmodeTools9.Enabled := False;
  pnlSubmodeTools10.Enabled := False;
  pnlSubmodeTools11.Enabled := False;
  pnlSubmodeTools12.Enabled := False;
  pnlSubmodeTools13.Enabled := False;
  pnlSubmodeTools14.Enabled := False;
  pnlSubmodeTools15.Enabled := False;
  pnlSubmodeTools16.Enabled := False;
  pnlSubmodeTools17.Enabled := False;
  pnlSubmodeTools18.Enabled := False;
  pnlSubmodeTools19.Enabled := False;

  lblSubmodeTools0.Caption := '';
  lblSubmodeTools1.Caption := '';
  lblSubmodeTools2.Caption := '';
  lblSubmodeTools3.Caption := '';
  lblSubmodeTools4.Caption := '';
  lblSubmodeTools5.Caption := '';
  lblSubmodeTools6.Caption := '';
  lblSubmodeTools7.Caption := '';
  lblSubmodeTools8.Caption := '';
  lblSubmodeTools9.Caption := '';
  lblSubmodeTools10.Caption := '';
  lblSubmodeTools11.Caption := '';
  lblSubmodeTools12.Caption := '';
  lblSubmodeTools13.Caption := '';
  lblSubmodeTools14.Caption := '';
  lblSubmodeTools15.Caption := '';
  lblSubmodeTools16.Caption := '';
  lblSubmodeTools17.Caption := '';
  lblSubmodeTools18.Caption := '';
  lblSubmodeTools19.Caption := '';
end;

procedure TFrmTacticalScreen.SetLayoutForm;
var
  path : string;
  idxPanelAtas, alPanelAtas, xPanelAtas, yPanelAtas,
  idxPanelBawah, alPanelBawah, xPanelBawah, yPanelBawah,
  bdrPanelAtas,  bdrPanelBawah,  bdrTemp: Integer;
begin
   path := ExtractFilePath(Application.ExeName) + 'SetFormBlackSharkToMonitor.ini';

   Getsettingform(path, 'PANELATAS',  idxPanelAtas,  alPanelAtas,    xPanelAtas,   yPanelAtas);
   Getsettingform(path, 'PANELBAWAH', idxPanelBawah, alPanelBawah,   xPanelBawah,  yPanelBawah);
//   Getsettingform(path, 'BORDER',     bdrPanelAtas,  bdrPanelBawah,  bdrKeyboard,  bdrTemp);

    case Screen.MonitorCount of
      1 :
        begin
          AlignFormToMonitor(0, apLeftTop, 0, 0, TForm(frmTacticalScreen));
          AlignFormToMonitor(0, apLeftTop, 0, 0, TForm(frmSupportScreen));

        end;
      2,3 :
        begin
          AlignFormToMonitor(idxPanelAtas, apLeftTop, 0, 0, TForm(frmTacticalScreen));
          AlignFormToMonitor(idxPanelBawah, apLeftTop, 0, 0, TForm(frmSupportScreen));

        end;
    end;
end;

procedure TFrmTacticalScreen.setRegionCircle;
const brd = 30;
var eRgn: HRGN;
    r : TRect;
    rcxMap, rcyMap: integer;
    left,top,right,bottom : Integer;
    diffBeetwinWH : Integer;  //differnt beetwin width and height width - height, kemudian dibagi dua sebagai batas left dan right,supaya lingkarannya tetap center.
begin
  rCXMap := FMap.Width  shr 1;
  rCYMap := FMap.Height shr 1;

//  r := Rect(222,50, FMap.Height + 110, FMap.Height - 50);
  diffBeetwinWH := (pnlMap.Width - pnlMap.Height) div 2;

  top := 50;
  bottom := pnlMap.Height - top;
  left := diffBeetwinWH + top;
  right := pnlMap.Width - left;

  FCircleRect  := Rect(left,top, right, bottom);

  eRgn := CreateEllipticRgn(FCircleRect.Left, FCircleRect.Top, FCircleRect.Right, FCircleRect.Bottom);
  SetWindowRgn(FMap.Handle, eRgn, true);

  // center & radius dalam koordinat FMap (DC yang dipakai DrawUserLayer)
  FCircleCX := (FCircleRect.Left + FCircleRect.Right) div 2;
  FCircleCY := (FCircleRect.Top  + FCircleRect.Bottom) div 2;
  FCircleR  := (FCircleRect.Right - FCircleRect.Left) div 2;

  //global Form Koord
  rCx := rcxMap - FMap.Left;
  rCy := rCYMap + FMap.Top;
end;

procedure TFrmTacticalScreen.SubmodeSelect(Sender: Tobject);
begin
  if TPanel(Sender).Tag = submode then Exit;

  ResetSubmodeTools;

  pnlTacticalBtn.Color := clBlack;
  pnlTorpedoBtn.Color := clBlack;
  pnlTMABtn.Color := clBlack;
  pnlLinkBtn.Color := clBlack;
  pnlResmBtn.Color := clBlack;
  pnlPeriscopeBtn.Color := clBlack;

  TPanel(Sender).Color := clLime;
  Submode := TPanel(Sender).Tag;




  case Submode of
    0:
    begin
      lblSubmodeTools0.Caption := 'Drop' + #13#10 + 'Sonar' + #13#10 + 'Track';
      pnlSubmodeTools0.Enabled := True;

      lblSubmodeTools2.Caption := 'RESM' + #13#10 + 'Data' + #13#10 + 'Control';
      pnlSubmodeTools2.Enabled := True;

      lblSubmodeTools5.Caption := 'Classi-' + #13#10 + 'fication';
      pnlSubmodeTools5.Enabled := True;

      lblSubmodeTools6.Caption := 'CEP';
      pnlSubmodeTools6.Enabled := True;

      lblSubmodeTools7.Caption := 'Threat' + #13#10 + 'Eval';
      pnlSubmodeTools7.Enabled := True;

      lblSubmodeTools9.Caption := 'SPA';
      pnlSubmodeTools9.Enabled := True;

      lblSubmodeTools11.Caption := 'Imme-' + #13#10 + 'diate' + #13#10 + 'Firing';
      pnlSubmodeTools11.Enabled := True;

      lblSubmodeTools12.Caption := 'Torp' + #13#10 + 'Alloc';
      pnlSubmodeTools12.Enabled := True;

      lblSubmodeTools17.Caption := 'Sim';
      pnlSubmodeTools17.Enabled := True;

      lblSubmodeTools18.Caption := 'Data' + #13#10 + 'Export' + #13#10 + 'Setup';
      pnlSubmodeTools18.Enabled := True;

      lblSubmodeTools19.Caption := 'Cove-' + #13#10 + 'rage';
      pnlSubmodeTools19.Enabled := True;
    end;
  end;
end;

end.
