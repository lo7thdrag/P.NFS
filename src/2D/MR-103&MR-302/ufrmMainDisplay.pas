unit ufrmMainDisplay;

interface

//uses Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Controls, Vcl.StdCtrls,
//  AdvOfficeButtons, Vcl.OleCtrls, MapXLib_TLB, System.Classes;

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList,Vcl.OleCtrls, MapXLib_TLB, uBaseFunctionFCC, uObjectVisual,
  uCoordConverter, uMapXUnitConverter, system.math, TFlatCheckBoxUnit, uFccManager, uBridgeSet,
  uSimulationManager, uRadarVisual, uRadarDynamicSector, uRadarNorthIndicator,
  uRadarTargets, VrControls, VrDesign, AdvOfficeButtons, SHDocVw, NLDJoystick, System.IOUtils,
  Grijjy.Bson.Serialization, ShellAPI, DateUtils, AdvTrackBar, AdvPageControl,
  Vcl.ComCtrls, AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, TFlatButtonUnit;

type
    TSetting = record
  public
    [BsonElement('Host')]
    Host: string;
    [BsonElement('Port')]
    Port: string;
    [BsonElement('Video')]
    Video: string;
    [BsonElement('PosX')]
    PosX: Integer;
    [BsonElement('PosY')]
    PosY: Integer;
    [BsonElement('Width')]
    Width: Integer;
    [BsonElement('Height')]
    Height: Integer;
  end;

  TfrmMainFCC = class(TForm)
    pnlSituationZone: TPanel;
    pnlUpper: TPanel;
    imgBackgrounSituationZone: TImage;
    FMap: TMap;
    btnMapIncrement: TButton;
    btnMapDecrement: TButton;
    pnlMap48km: TPanel;
    pnlMap24km: TPanel;
    pnlMap12km: TPanel;
    pnlMap6km: TPanel;
    pnlMap3km: TPanel;
    pnlMap1point5km: TPanel;
    lblMap48Km: TLabel;
    lblMap24Km: TLabel;
    lblMap12Km: TLabel;
    lblMap6Km: TLabel;
    lblMap3Km: TLabel;
    lblMap1point5Km: TLabel;
    imgCompas: TImage;
    imgFcc1Image: TImage;
    acbxDisRing: TAdvOfficeCheckBox;
    acbxShootArea: TAdvOfficeCheckBox;
    acbxTrackerArea: TAdvOfficeCheckBox;
    acbxTargetPara: TAdvOfficeCheckBox;
    lblMapLat: TLabel;
    lblMapLon: TLabel;
    pnlExteriorData: TPanel;
    pnlBite: TPanel;
    tmrUpdateShipPos: TTimer;
    tmrUpdateForm: TTimer;
    Label6: TLabel;
    Label16: TLabel;
    pnlViewer3D: TPanel;
    pnlPosture: TPanel;
    pnlHeaderExteriorData: TPanel;
    advRulerBottomRight: TAdvRangeSlider;
    advSliderBottomLeft: TAdvRangeSlider;
    lblRulerBottomLeft10: TLabel;
    lblRulerBottomLeft20: TLabel;
    lblRulerBottomLeft30: TLabel;
    lblRulerBottomLeft40: TLabel;
    AdvRangeSlider1: TAdvRangeSlider;
    lblRulerRight0: TLabel;
    lblRulerRightTop10: TLabel;
    lblRulerRightTop20: TLabel;
    lblRulerRightBtm10: TLabel;
    lblRulerRightBtm20: TLabel;
    lblRulerRightBtm30: TLabel;
    lblRulerRightTop30: TLabel;
    pnlHaeaderBite: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    pnlLaser: TPanel;
    pnlRadar: TPanel;
    pnlTargetLocation: TPanel;
    pnlInformation: TPanel;
    pnlTargetLocationHeader: TPanel;
    pnlExteriorDataLeft: TPanel;
    pnlExteriorDataRight: TPanel;
    advControlPageExtDat: TAdvPageControl;
    advTabNAVI: TAdvTabSheet;
    AdvTabIND: TAdvTabSheet;
    AdvTabDEVI: TAdvTabSheet;
    lblHeadingNAVI: TLabel;
    EdtHeadingNAVIVal: TEdit;
    lblHeadingNAVIsat: TLabel;
    EdtSpeedNAVIVal: TEdit;
    lblSpeedNAVI: TLabel;
    lblSpeedNAVIsat: TLabel;
    EdtRollNAVIVal: TEdit;
    lblRollNAVI: TLabel;
    lblRollNAVIsat: TLabel;
    EdtPitchNAVIVal: TEdit;
    lblPitchNAVI: TLabel;
    lblPitchNAVIsat: TLabel;
    edtIDTargetVal: TEdit;
    edtHeadingINDVal: TEdit;
    edtSpeedINDVal: TEdit;
    lblIDTargetIND: TLabel;
    lblHeadingIND: TLabel;
    lblHeadingINDsat: TLabel;
    lblSpeedIND: TLabel;
    lblSpeedINDsat: TLabel;
    AdvPageControl1: TAdvPageControl;
    AdvTabMR35: TAdvTabSheet;
    AdvTabTrans: TAdvTabSheet;
    AdvTabRev: TAdvTabSheet;
    AdvTabServo: TAdvTabSheet;
    AdvTabCon: TAdvTabSheet;
    AdvTabTVLS: TAdvTabSheet;
    advRulerLaser: TAdvRangeSlider;
    pnlLaserGraph: TPanel;
    lblKmLaser: TLabel;
    pnl4X: TPanel;
    pnl2X: TPanel;
    pnl1X: TPanel;
    panel12X: TPanel;
    rulerRadarBottom: TAdvRangeSlider;
    pnlRadarGraph: TPanel;
    lblKmRadar: TLabel;
    lblRadarFC: TLabel;
    lblRadarAGC: TLabel;
    lblRadarGate: TLabel;
    lblRadarGATEsat: TLabel;
    edtRadarFC: TEdit;
    edtRadarAGC: TEdit;
    edtRadarGate: TEdit;
    edtRAzimuthVal: TEdit;
    lblRAzimuth: TLabel;
    lblRAzimuthsat: TLabel;
    edtElevationVal: TEdit;
    lblElevation: TLabel;
    lblElevationsat: TLabel;
    edtRDRangeVal: TEdit;
    lblRDRange: TLabel;
    edtLSRangeVal: TEdit;
    lblLSRange: TLabel;
    lblSystemTime: TLabel;
    lblRunTime: TLabel;
    lblRunTimeVal: TLabel;
    lblSystemTimeVal: TLabel;
    lblMR35FCC2: TLabel;
    lblMR35FCC2Val: TLabel;
    lblMR35Time: TLabel;
    lblMR35TimeVal: TLabel;
    lblMR35MR35: TLabel;
    lblMR35MR35Val: TLabel;
    tableReceiveBITE: TAdvStringGrid;
    pnlReceiveBiteHeader: TPanel;
    NLDJoystick: TNLDJoystick;
    fbRangeMeter: TFlatButton;
    fbRangeNM: TFlatButton;
    fbLaserRangeM: TFlatButton;
    fbLaserRangeNM: TFlatButton;
    lblBatchNoDesig: TLabel;
    edtBatchNoDesig: TEdit;
    lblHeadingDesig: TLabel;
    edtHeadingDesig: TEdit;
    lblSpeedDesig: TLabel;
    edtSpeedDesig: TEdit;
    fbDesigTarget: TFlatButton;
    fbBreakTarget: TFlatButton;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure tmrUpdateFormTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FMapDrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
    procedure btnMapIncrementClick(Sender: TObject);
    procedure btnMapDecrementClick(Sender: TObject);
    procedure pnlMapRangeClick(Sender: TObject);
    procedure imgCompasClick(Sender: TObject);
    procedure tmrUpdateHeadingTimer(Sender: TObject);
    procedure FMapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure acbxTargetParaClick(Sender: TObject);
    procedure FMapMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FMapMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlFireFcc2Click(Sender: TObject);

    procedure UpdatePosition(Sender: TObject);
    procedure NLDJoystick1Move(Sender: TNLDJoystick; const JoyPos: TJoyRelPos;
      const Buttons: TJoyButtons);
    procedure NLDJoystick1ButtonDown(Sender: TNLDJoystick;
      const Buttons: TJoyButtons);
    procedure NLDJoystick1ButtonUp(Sender: TNLDJoystick;
      const Buttons: TJoyButtons);
    procedure fbBreakTargetClick(Sender: TObject);
  protected
    procedure DrawAngle(aCnv: TCanvas);
    procedure DrawCompas(aCnv: TCanvas);

    function MeterWidth: Integer;
    function MeterHeight: Integer;
    function Rotate(Width, Height, Radius: Integer; Degrees: Double): Winapi.Windows.TPoint;
    procedure DrawLine(Canvas: TCanvas; X1, Y1, X2, Y2: Integer;Color: TColor; Width: Integer);
  private
    { Private declarations }
    FBitmapBackground : TBitmap;
    FLyrDraw: CMapXLayer;
    FNorthAngle : Double;
    FMapCanvas     : TCanvas;
    FMapConverter : TMapXUnitConverter;
    FFlag       : Byte;
    FIndexRange : Integer;
    FCurrentRange : Double;  // meter
    FShipHeading : Integer;

    config: TSetting;
    ExecInfo: TShellExecuteInfo;

    FisKanan, FisKiri, FisAtas, FisBawah, FisZoomIn, FisZoomOut : Boolean;
    FXAxis, FYAxis, FZAxis, FisBiteOpen : Boolean;
    FRDRangeSat, FLSRangeSat : Boolean; // false = m, true = Nm

    { Property On TDA }
    FRings       : TRadarRangeRings;
    AreaBlindZone   : TRadarDynamicSector;
    AreaBlindZone1   : TRadarDynamicSector;
    AreaGunPoint   : TRadarDynamicSector;
    AreaPenembakan  : TRadarDynamicSector;
    AreaTracker  : TRadarDynamicSector;
    FBearing0    : TRadarBearing;

    FNorthInd : TRadarNorthIndicator;

//    TargetMgr : TRadarTargetManager;

    FCircleRect  : TRect;
    FCircleCX    : Integer;
    FCircleCY    : Integer;
    FCircleR     : Integer; // radius pixel lingkaran peta

    //setting parameter
    pCurrentScenID  : integer;
    pServer_Ip,
    pServer_Port,               //TriD_IP, TriD_Port,
    pDBServer,
    pDBProto,
    pDBName,
    pDBUser,
    pDBPass,
    pShipName,
    pClassName      : string;
    pShipID,
    pClassID        : Integer;
    FSelectedVehicleState : Boolean;

    FStartTime: TDateTime;

    FOwnShipHeading : Double;

    FBearing, FElevation, FRange : Double;

    procedure LoadGeoset(const aGst: string); virtual;
    procedure InitializeForm();
    procedure setRegionCircle;
    procedure setReceiveBITETable;
    procedure Enable3DHole;
    procedure Disable3DHole;

    procedure ResetColorRange();

    procedure DrawAll(aCnv: TCanvas; aCvt: TCoordConverter; aFlag: Byte);

     procedure ShowInfoCursor(const x, y: integer);

     procedure ptkCommand(const str : string);
     procedure HandleKeyByBtnName(const BtnName: string);
  public
    { Public declarations }
    rCX, rCY: integer;

  end;

var
  frmMainFCC: TfrmMainFCC;

implementation

{$R *.dfm}

uses uLibConst, uBaseConst, uScriptFcc, uDataModule, ulibSettings, uVehicleManager, uVehicle, uBaseFunction, uTCPDatatype;
const
  CMin_Z = 0;
  CMax_Z = 14;

function RunAppInPanel(Panel: TWinControl; const Exe, Params: string): HWND;
var
  SI: STARTUPINFO;
  PI: PROCESS_INFORMATION;
begin
  ZeroMemory(@SI, SizeOf(SI));
  ZeroMemory(@PI, SizeOf(PI));
  SI.cb := SizeOf(SI);
  SI.dwFlags := STARTF_USESHOWWINDOW;
  SI.wShowWindow := SW_SHOW;

  if CreateProcess(nil, PChar(Exe + ' ' + Params), nil, nil, False,
                   CREATE_NEW_CONSOLE, nil, nil, SI, PI) then
  begin
    Result := PI.hProcess;
  end
  else
    Result := 0;
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

procedure TfrmMainFCC.acbxTargetParaClick(Sender: TObject);
begin
  case TAdvOfficeCheckBox(Sender).Tag of
    0: //target para
    begin

    end;
    1: // dis range
    begin
      FRings.Visible := TAdvOfficeCheckBox(Sender).Checked;
    end;
    2: // shot area
    begin
      AreaPenembakan.Visible := TAdvOfficeCheckBox(Sender).Checked;
    end;
    3: // tracker area
    begin
      AreaTracker.Visible := TAdvOfficeCheckBox(Sender).Checked;
    end;
  end;
end;

procedure TfrmMainFCC.btnMapDecrementClick(Sender: TObject);
begin
  if self.FIndexRange > 0 then
  begin
    dec(self.FIndexRange);
    self.FCurrentRange := CRangeOperation[self.FIndexRange];
  end
  else
    self.FCurrentRange := CRangeOperation[0];

  ResetColorRange;

  case FIndexRange of
    0 :
    begin
      pnlMap1point5km.Color := clYellow;
//      lblRange.Caption := Format('%2.2f', [FCurrentRange * C_Meter_To_NauticalMile]);
    end;
    1 :
    begin
      pnlMap3km.Color := clYellow;
//      lblRange.Caption := Format('%2.2f', [FCurrentRange * C_Meter_To_NauticalMile]);
    end;
    2 :
    begin
      pnlMap6km.Color := clYellow;
//      lblRange.Caption := Format('%2.2f', [FCurrentRange * C_Meter_To_NauticalMile]);
    end;
    3 :
    begin
      pnlMap12km.Color := clYellow;
//      lblRange.Caption := Format('%2.2f', [FCurrentRange * C_Meter_To_NauticalMile]);
    end;
    4 :
    begin
      pnlMap24km.Color := clYellow;
//      lblRange.Caption := Format('%2.2f', [FCurrentRange * C_Meter_To_NauticalMile]);
    end;
    5 :
    begin
      pnlMap48km.Color := clYellow;
//      lblRange.Caption := Format('%2.2f', [FCurrentRange * C_Meter_To_NauticalMile]);
    end;
  end;

//  fmap.Zoom := self.FCurrentRange;
  FMap.ZoomTo((Self.FCurrentRange  * 0.00092) * 2, FMap.CenterX, FMap.CenterY);
end;

procedure TfrmMainFCC.btnMapIncrementClick(Sender: TObject);
begin
  if self.FIndexRange < CCountRange - 1 then
  begin
    inc(self.FIndexRange);
    self.FCurrentRange := CRangeOperation[self.FIndexRange];
  end
  else
    self.FCurrentRange := CRangeOperation[CCountRange -1];

  ResetColorRange;

  case FIndexRange of
    0 :
    begin
      pnlMap1point5km.Color := clYellow;
//      lblRange.Caption := Format('%2.2f', [FCurrentRange * C_Meter_To_NauticalMile]);
    end;
    1 :
    begin
      pnlMap3km.Color := clYellow;
//      lblRange.Caption := Format('%2.2f', [FCurrentRange * C_Meter_To_NauticalMile]);
    end;
    2 :
    begin
      pnlMap6km.Color := clYellow;
//      lblRange.Caption := Format('%2.2f', [FCurrentRange * C_Meter_To_NauticalMile]);
    end;
    3 :
    begin
      pnlMap12km.Color := clYellow;
//      lblRange.Caption := Format('%2.2f', [FCurrentRange * C_Meter_To_NauticalMile]);
    end;
    4 :
    begin
      pnlMap24km.Color := clYellow;
//      lblRange.Caption := Format('%2.2f', [FCurrentRange * C_Meter_To_NauticalMile]);
    end;
    5 :
    begin
      pnlMap48km.Color := clYellow;
//      lblRange.Caption := Format('%2.2f', [FCurrentRange * C_Meter_To_NauticalMile]);
    end;
  end;


//  fmap.Zoom := self.FCurrentRange;
  FMap.ZoomTo((Self.FCurrentRange  * 0.00092) * 2, FMap.CenterX, FMap.CenterY);
end;

procedure TfrmMainFCC.Disable3DHole;
begin
  SetWindowRgn(Handle, 0, True);
end;

procedure TfrmMainFCC.DrawAll(aCnv: TCanvas; aCvt: TCoordConverter;
  aFlag: Byte);
var
  pnt: Winapi.Windows.TPoint;
var
  z: double;
  i: Integer;
begin
  aCvt.ConvertToScreen(FMap.CenterX, FMap.CenterY, pnt.X, pnt.Y);

  z := FixMapZoom(FMap.Zoom);
  i := FindClosestZoomIndex(z);
  z := ZoomIndexToScale(i);

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

procedure TfrmMainFCC.DrawAngle(aCnv: TCanvas);
var
  I,Size,Enlarge,StartAngle,AngleRadius: Integer;
  ticksMax,ticks,ticksEnlarge,ticksMin :integer;
  labels,decimals,labelsoffset: integer;
  Angle,AngleOffset,BaseAngle : integer;
  Increment,Degrees,CurValue,IncValue: Double;
  R: TRect;
  P1, P2: Winapi.Windows.TPoint;
  Mask,StrValue: string;
  ticksColor : TColor;
  labelsfont : TFont;

  left,top,right,bottom : Integer;
  diffBeetwinWH : Integer;  //differnt beetwin width and height width - height, kemudian dibagi dua sebagai batas left dan right,supaya lingkarannya tetap center.
begin
  Angle := 0;
  with aCnv do
  begin
    Brush.Style := bsSolid;
    Brush.Color := clBlack; // or clBlack, clWhite, etc.
    FillRect(ClipRect); // clears the drawing area
  end;
  if Assigned(FCCManager) then
  begin
    if Assigned(FCCManager.xShip) then
      Angle    := Round(FCCManager.xShip.Heading); // rojek add buat mutar angle sesuai arah kapal
  end;
  baseAngle := round(CBaseAngle);
  AngleOffset := round(CBaseAngle);
  labelsfont := TFont.Create();
  labelsfont.Color := clYellow;
  labelsfont.Size := 10;
  StartAngle := BaseAngle + Angle;
//  lblStartAngle.Caption := startangle.ToString;

  diffBeetwinWH := (pnlSituationZone.Width - pnlSituationZone.Height) div 2;

  top := 50;
  bottom := pnlSituationZone.Height - top;
  left := diffBeetwinWH + top;
  right := pnlSituationZone.Width - left;
  with aCnv do
  begin
		Pen.Color := CForegroundColor;

    Brush.Style := bsClear;
//    R := Rect(0,0, Map.Width, Map.Height);
    R := Rect(left,top, right, bottom);
    AngleRadius := (R.right - R.left) div 2;
//    AngleRadius := 280;
    ticksmax := 8;
    ticks := round(36);
    ticksEnlarge := 5;
    ticksMin := 8;
    ticksColor := clWhite;
    labels := 24;
    decimals := 0;
    labelsoffset := 30;

    {jarum derajat}

    if Ticks >= 1 then
    begin
      Enlarge := TicksEnlarge;
      Degrees := StartAngle;
      Increment := AngleOffset/Ticks;
      aCnv.Pen.Color := clWhite;
      aCnv.Pen.Width := 3;
      aCnv.Ellipse(R.Left, R.Top, R.Right, R.Bottom);
      for I := 1 to Ticks + 1 do
      begin
//        if (Enlarge mod TicksEnlarge = 0) then
//          Size := TicksMax else Size := TicksMin;
        Size := TicksMax;
        Inc(Enlarge);
        P1 := Rotate(MeterWidth, MeterHeight, AngleRadius, Degrees);
        P2 := Rotate(MeterWidth, MeterHeight, AngleRadius + Size, Degrees);
        DrawLine(aCnv, P1.X, P1.Y, P2.X, P2.Y, TicksColor, 2);
        Degrees := Degrees + Increment;
      end;
    end;


    {angka}

    if Labels >= 1 then
    begin
      Font := LabelsFont;
      CurValue := 0;
      IncValue := (360 - 0)/labels;
      Degrees := StartAngle;
      Increment := AngleOffset/labels;
      Mask := '%.' + IntToStr(Decimals) + 'f';
      for I := 1 to Labels  do
      begin
//        P1 := Rotate(MeterWidth, MeterHeight, AngleRadius + LabelsOffset, Degrees);
        P1 := Rotate(MeterWidth, MeterHeight, AngleRadius + LabelsOffset, Degrees);

//        if strlen(pchar(floattostr(CurValue))) <= 2 then
//          begin
//          if curValue = 0 then
//             StrValue := '00'+Format(Mask, [CurValue])
//          else
//             StrValue := '0'+Format(Mask, [CurValue]);
//          end
//        else
        if round(CurValue) mod 30 = 0 then
        begin
          if CurValue > 180 then
             StrValue := Format(Mask, [CurValue - 360]) + '°'
          else
            StrValue := Format(Mask, [CurValue]) + '°';

          P1.X := P1.X - TextWidth(StrValue) div 2;
          P1.Y := P1.Y - TextHeight(StrValue) div 2;
          TextOut(P1.X, P1.Y, StrValue);
          Degrees := Degrees + Increment;
          CurValue := 0 + (IncValue*I);
        end
        else
        begin
          Degrees := Degrees + Increment;
          CurValue := 0 + (IncValue*I);
        end;
      end;
    end;
  end;

end;

procedure TfrmMainFCC.DrawCompas(aCnv: TCanvas);
var
  R: TRect;
  CenterComp: Winapi.Windows.TPoint;
  Points, Points2: array of Winapi.Windows.TPoint;
begin
  SetLength(Points, 3);
  SetLength(Points2, 3);
  CenterComp.X := imgCompas.Height div 2;
  CenterComp.Y := imgCompas.Width div 2;
  R := Rect(0,0, imgCompas.Height, imgCompas.Width);
//  aCnv.Brush.Style := bsClear;
  aCnv.Pen.Color := clYellow;
  acnv.Brush.Color := clBlack;

  //draw lingkaran luar
  aCnv.Ellipse(r.Left, r.Top, r.Right, r.Bottom);

  //draw segitiga north
  Points[0] := Rotate(imgCompas.Width, imgCompas.Height, (imgCompas.Height div 2) - 46, FNorthAngle + 270);
  Points[1] := Rotate(imgCompas.Width, imgCompas.Height, (imgCompas.Height div 2 - 15), FNorthAngle);
  Points[2] := Rotate(imgCompas.Width, imgCompas.Height, (imgCompas.Height div 2) - 46, FNorthAngle + 90);

  //draw segitiga south
  Points2[0] := Rotate(imgCompas.Width, imgCompas.Height, (imgCompas.Height div 2) - 46, FNorthAngle + 270);
  Points2[1] := Rotate(imgCompas.Width, imgCompas.Height, (imgCompas.Height div 2) - 15, FNorthAngle + 180);
  Points2[2] := Rotate(imgCompas.Width, imgCompas.Height, (imgCompas.Height div 2) - 46, FNorthAngle + 90);

//  aCnv.Brush.Style := bsSolid;
  acnv.Pen.Width := 2;
  acnv.Pen.Color := clRed;
  acnv.Brush.Color := clRed;
  acnv.Polygon(Points);

  acnv.Pen.Color := clWhite;
  acnv.Brush.Color := clWhite;
  acnv.Polygon(Points2);
end;

procedure TfrmMainFCC.DrawLine(Canvas: TCanvas; X1, Y1, X2, Y2: Integer;
  Color: TColor; Width: Integer);
begin
  Canvas.Pen.Color := Color;
  Canvas.Pen.Width := Width;
  Canvas.MoveTo(X1, Y1);
  Canvas.LineTo(X2, Y2);
end;

procedure TfrmMainFCC.Enable3DHole;
var
  rgnOuter, rgnInner: HRGN;
begin
  rgnOuter := CreateRectRgn(0, 0, Width, Height);
  rgnInner := CreateRectRgn(8, 0, 657, 501);
  CombineRgn(rgnOuter, rgnOuter, rgnInner, RGN_DIFF);
  SetWindowRgn(Handle, rgnOuter, True);
  DeleteObject(rgnInner); // clean up
end;

procedure TfrmMainFCC.fbBreakTargetClick(Sender: TObject);
var
RecSend: TrecData_MeriamFCC;
begin
//  fbDesigTarget.AllowAllUp := False;
//  fbBreakTarget.AllowAllUp := False;

  if (Sender as TFlatButton) = fbDesigTarget then
  begin
    if FCCManager.SelectedVehicle <> nil then
    begin
      RecSend.ShipID := FCCManager.ShipID; // harus dipindah di desig dan break
//      RecSend.Range := 0;
      RecSend.Range := FRange;
      RecSend.Bearing := FBearing;
      RecSend.Elevation := FElevation;
      RecSend.EOBearing := 0;
      RecSend.EOElevation := 0;
      RecSend.TargetType := 0;
      RecSend.EnableValue := false;

      RecSend.OrderID := CORD_ID_2D_Desig;
      RecSend.IDTarget3D := 0;
      RecSend.IDTarget2D := UniqueID_To_dbID(FCCManager.SelectedVehicle.UniqueID);

      FCCManager.NetSendTo3D_FCCSet(RecSend); // send target ke EO dan ke 3D

      fbDesigTarget.Down := True;
      fbDesigTarget.ColorFocused := clLime;
      fbBreakTarget.ColorFocused := clGreen;
    end
    else
    begin
      fbDesigTarget.Down := False;
      fbDesigTarget.ColorFocused := clGreen;
    end;

  end
  else if (Sender as TFlatButton) = fbBreakTarget then
  begin
    RecSend.ShipID := FCCManager.ShipID; // harus dipindah di desig dan break
    RecSend.Range := 0;
    RecSend.Bearing := 0;
    RecSend.Elevation := 0;
    RecSend.EOBearing := 0;
    RecSend.EOElevation := 0;
    RecSend.TargetType := 0;
    RecSend.EnableValue := false;

    RecSend.OrderID := CORD_ID_2D_Break;
    RecSend.IDTarget3D := 0;
    RecSend.IDTarget2D := 0;

    FCCManager.NetSendTo3D_FCCSet(RecSend); // send target ke EO dan ke 3D
    fbBreakTarget.Down := True;
    fbDesigTarget.ColorFocused := clGreen;
    fbBreakTarget.ColorFocused := clLime;
  end;

end;

procedure TfrmMainFCC.FMapDrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull,
  RectInvalid: IDispatch);
begin
  FMapCanvas.Handle := hOutputDC;
//  DrawAll(FMapCanvas, FMapConverter, FFlag);

  try
    DrawAll(FMapCanvas, FMapConverter, FFlag);
  finally
    FMapCanvas.Handle := 0;
  end;
end;

procedure TfrmMainFCC.FMapMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
//  Sel: TRadarTargetSymbol;
  v : TVehicle;
  rangeX, dH, v0: Double;
  aLow, aHigh, aEnv: Double;
  ok: Boolean;
begin
  if Button <> mbLeft then Exit;

//  Sel := TargetMgr.SelectAt(X, Y);

  v := VehicleMgr.SelectAt(X, Y);


  FMap.Refresh; // langsung repaint untuk tunjukkan kotak putih

  if Assigned(v) then
  begin
    // misalnya tampilkan info target
    // ShowMessage('Target terpilih: ' + Sel.TrackLabel);

    FCCManager.SelectedVehicle := v;
    rangeX := CalcRange(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, v.PosX, v.PosY) * C_NauticalMile_To_Metre;   // 3 km
    dH     := v.PosZ;    // target 20 m lebih rendah
    v0     := 1035;    // m/s

    if Assigned(FCCManager) then
    begin
      // 1) Tanpa environment (vakum)
      ok := FCCManager.ComputeGunElevationVacuum(rangeX, dH, v0, aLow, aHigh);
//      edtLowPR.Text := FormatFloat('0.00', aLow);
//      edtHighPR.Text := FormatFloat('0.00', aHigh);
    end;

    FSelectedVehicleState := true;
  end
  else
  begin
    FCCManager.SelectedVehicle := nil;
    FSelectedVehicleState := false;
  end;
end;

procedure TfrmMainFCC.FMapMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ShowInfoCursor(X,y);
end;

procedure TfrmMainFCC.FMapMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  isValid : Boolean;
//  RecSend : TRec3DSetWCC;

  CorrectBearing,
  CorrectElev : Double;
  aLow, aHigh: Double;
  range,rangem, bearing, azimuth, elevation, deltaZ : Double;
begin
  if Assigned(fccmanager.SelectedVehicle) then
  begin
    range := CalcRange(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, FCCManager.SelectedVehicle.PosX, FCCManager.SelectedVehicle.PosY);
    rangem := range * C_NauticalMile_To_Metre;
    FRange := range;

    azimuth := CalcBearing(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, FCCManager.SelectedVehicle.PosX, FCCManager.SelectedVehicle.PosY);
    bearing := azimuth - FCCManager.xShip.Heading;
    if bearing < 0 then
    bearing := bearing + 360;
    // range = 3000 m, target lebih rendah 25 m
    case vFccSetting.FccMode of
      2 : //MR 103
      begin
        elevation := CalcTurretElevation(rangem, 12900);
      end;
      3 : //MR 302
      begin
//        deltaZ := Abs(FCCManager.SelectedVehicle.PosZ - FCCManager.xShip.PositionZ);
//        rangem := Sqrt(Power(rangem) * Power(deltaZ)); // masukan rumus c2 = a2 + b2 karena target AIR  gajadi dipake
        elevation := CalcElevation(rangem, 6, fccmanager.SelectedVehicle.PosZ);
      end;
    end;

    if fbRangeMeter.Down then edtRDRangeVal.Text := format('%.2f', [rangem])
    else  edtRDRangeVal.Text := format('%.2f', [rangem * c_meter_to_nauticalMile]);
    edtRadarGate.Text := format('%.2f', [rangem]);
    edtRAzimuthVal.Text := format('%.2f', [bearing]);
    edtElevationVal.Text := format('%.2f', [elevation]);

    FBearing := bearing;
    FElevation := elevation;

    edtIDTargetVal.Text := UniqueID_To_dbID(FCCManager.SelectedVehicle.UniqueID).ToString();
    edtSpeedINDVal.Text := (FCCManager.SelectedVehicle.Speed_mps * 1.944).ToString;
    edtHeadingINDVal.Text := FCCManager.SelectedVehicle.HeadingDeg.ToString;

    if not FSelectedVehicleState then
    begin
      begin
      edtRAzimuthVal.Text := '-';
  //    lblTgtDistance.Caption := rangem.ToString();
      edtElevationVal.Text := '-';
      edtRDRangeVal.Text := '-';
      edtLSRangeVal.Text := '-';
  //    lblTgtCourse.Caption := '...';
      end;
    end;

  end;
end;

procedure TfrmMainFCC.FormCreate(Sender: TObject);
var
  n : Integer;
//  T: TRadarTargetSymbol;
  ShipClassName,
  ShipCallSign: string;
  rgnOuter, rgnInner: HRGN;
  V: TVehicle;
  setting : string;
  StartupInfo: TStartupInfo;
begin
  BeginGame_FCC;
  FCCManager := TFCCManager.Create;
  SimCenter := FCCManager;
  SimCenter.FMap := FMap;
  FCCManager.OnPtkCommand := ptkCommand;
  FCCManager.initEvent;

  FNorthAngle := 0;
  FMapCanvas := TCanvas.Create;
  FMapConverter := TMapXUnitConverter.Create;
  FMapConverter.FMap := FMap;
  FIndexRange := 3;
  FCurrentRange := CRangeOperation[3];
  pnlMap12km.Color := clYellow;

  VehicleMgr := TVehicleManager.Create;
  VehicleMgr.CoordConverter := FMapConverter; // converter MapX kamu

  FBitmapBackground := TBitmap.Create;
  FBitmapBackground.Height := imgBackgrounSituationZone.Height;
  FBitmapBackground.Width := imgBackgrounSituationZone.Width;
  FBitmapBackground.Canvas.Brush.Color := clBlack; // new color
  FBitmapBackground.Canvas.FillRect(
   Rect(
     0,
     0,
     FBitmapBackground.Width,
     FBitmapBackground.Height
    )
  );

  imgBackgrounSituationZone.Picture.Assign(FBitmapBackground);
  imgCompas.Picture.Assign(FBitmapBackground);
  InitializeForm;
  LoadGeoset('..\data\maps\IndonesiaNoGrid.gst');
  setRegionCircle;

  FRings := TRadarRangeRings.Create;
  acbxDisRing.Checked := FRings.Visible;

  FShipHeading := 0; // awal

  setReceiveBITETable;

  n := ParamCount ;
  if n < max_param then
  begin
    FCCManager.IsStandAlone := true ;
  end;

  if not FCCManager.IsStandAlone then
  begin
      InitDefault_AllConfigFromInstruktur(pServer_Ip,pServer_Port,
    pDBServer, pDBProto, pDBName, pDBUser,
    pDBPass, pShipID, pCurrentScenID);

    FCCManager.CurrentScenID := pCurrentScenID;
    FCCManager.Server_Ip := pServer_Ip;
    FCCManager.Server_Port := pServer_Port;               //TriD_IP, TriD_Port,
    FCCManager.DBServer := vDbServer.mDBServer;
    FCCManager.DBProto := vDbServer.mDBProto;
    FCCManager.DBName := vDbServer.mDBName;
    FCCManager.DBUser := vDbServer.mDBUser;
    FCCManager.DBPass := vDbServer.mDBPass;
    FCCManager.ShipID := pShipID;
    FCCManager.ClassID := pClassID;

    FCCManager.ServerIp := vBridgeServer.m2D_IP;
    FCCManager.ServerPort := vBridgeServer.m2D_Port;

    FCCManager.InitializeSimulation;

    if DataModule1.InitZDB(vDbServer.mDBServer, vDbServer.mDBProto, vDbServer.mDBName, vDbServer.mDBUser, vDbServer.mDBPass, vDbServer.mDBPort) then
    begin
      FCCManager.ShipClassID  := DataModule1.GetShipType(FCCManager.ShipID, ShipClassName);
      FCCManager.ShipName     := DataModule1.GetShipName(FCCManager.ShipID);
      FCCManager.ShipNumber := DataModule1.GetShipNoById(FCCManager.ShipID);
      FCCManager.ShipCallSign := DataModule1.GetShipCallsignByID(FCCManager.ShipID);

      FCCManager.xShip.UniqueID := dbID_to_UniqueID(FCCManager.ShipID);

//      lblKriName.Caption := 'KRI ' + Meriam57Manager.ShipCallSign + '-' + IntToStr(Meriam57Manager.ShipNumber);
    end;
    FCCManager.Env_Map := DataModule1.GetMapById(FCCManager.CurrentScenID);

    case vFccSetting.FccMode of
    1 : //MR 35
    begin
      FCCManager.Get57WeaponAssigned;
      AdvTabMR35.Caption := 'MR35';
      lblMR35MR35.Caption := 'MR35';
    end;
    2 : //MR 103
    begin
      FCCManager.Get57WeaponAssigned;
      AdvTabMR35.Caption := 'MR103';
      lblMR35MR35.Caption := 'MR103';
    end;
    3 : //MR 302
    begin
      FCCManager.Get57WeaponAssigned;
      AdvTabMR35.Caption := 'MR302';
      lblMR35MR35.Caption := 'MR302';
    end;
  end;
    FCCManager.Running := True;

    FMap.ZoomTo((Self.FCurrentRange  * 0.00092) * 2, FMap.CenterX, FMap.CenterY);
  end;

  NLDJoystick.Active := True;

  FCCManager.Running := True;


  DoubleBuffered := False;
  EnableComposited(pnlSituationZone);
end;

procedure TfrmMainFCC.FormDestroy(Sender: TObject);
var
  i : Integer;
begin
  if vFccSetting.FccMode <> 4 then
  begin
    TerminateProcess(ExecInfo.hProcess, 0);
    CloseHandle(ExecInfo.hProcess);
    ExecInfo.hProcess := 0;
  end;

//  FRangeRing.Free;
  VehicleMgr.Free;
  FCCManager.FinalizeSimulation;

  FNorthInd.Free;
  FBearing0.Free;

  AreaGunPoint.Free;
  AreaBlindZone1.Free;
  AreaTracker.Free;
  AreaBlindZone.Free;
  AreaPenembakan.Free;

  FRings.Free;

  FMapCanvas.Free;

  FCCManager.Free;
end;

procedure TfrmMainFCC.FormPaint(Sender: TObject);
begin
  DrawAngle(imgBackgrounSituationZone.Canvas);
  DrawCompas(imgCompas.Canvas);
end;

procedure TfrmMainFCC.FormShow(Sender: TObject);
var
  ChromeHandle: HWND;
  WindowHandle: HWND;
begin
  UpdatePosition(Self);

  FStartTime := Now;
//  // jalankan chrome
//  RunAppInPanel(pnlBaseVideoZone, 'C:\Program Files\Google\Chrome\Application\chrome.exe',
//    '--app="https://google.com"');
//
//  // tunggu window chrome muncul
//  Sleep(500);
//
//  // temukan window chrome
//  WindowHandle := FindWindow('Chrome_WidgetWin_1', nil);
//
//  if WindowHandle <> 0 then
//  begin
//    // set parent ke panel
//    Winapi.Windows.SetParent(WindowHandle, pnlBaseVideoZone.Handle);
//
//    // sesuaikan posisi
//    SetWindowLong(WindowHandle, GWL_STYLE, WS_VISIBLE);
//    SetWindowPos(WindowHandle, 0, 0, 0, pnlBaseVideoZone.Width, pnlBaseVideoZone.Height,
//                 SWP_NOZORDER or SWP_SHOWWINDOW);
//  end;
end;

procedure TfrmMainFCC.HandleKeyByBtnName(const BtnName: string);
var
  Token: string;
  C: Char;
begin
  Token := ExtractToken(BtnName);

  if Token = '' then Exit;

  if Token = 'CalSetting' then
//    pnlCalSetting.BringToFront
  else if Token = 'Cancel' then
//    pnlIndWth.BringToFront;
//  else if Token = 'Surface' then
//  begin
//    edtStatusType.Text := 'Surface'
//  end
//
//  else if Token = 'AIR' then
//  begin
//    edtStatusType.Text := 'Air'
//  end
//
//  else if Token = 'Shore' then
//  begin
//    edtStatusType.Text := 'Shore'
//  end
//
//  else if Token = 'AutoSearch' then
//  begin
//    edtStatusControl.Text := 'A_Search'
//  end
//
//  else if Token = 'ManualSearch' then
//  begin
//    edtStatusControl.Text := 'M_Search'
//  end
//
//  else if Token = 'MovingTarget' then
//  begin
//    edtStatusDetect.Text := 'Moving'
//  end
//
//  else if Token = 'StaticTarget' then
//  begin
//    edtStatusDetect.Text := 'Static'
//  end
//
//  else if (Token = 'Bite') and (vFccSetting.FccMode = 1) then
//  begin
//    FisBiteOpen := not FisBiteOpen;
//    if FisBiteOpen then Disable3DHole
//    else Enable3DHole;
//  end;

  if not (ActiveControl is TEdit) then Exit;

  // ---------------- LETTERS ----------------
  if (Length(Token) = 1) and (Token[1] in ['A'..'Z']) then
  begin
    PostMessage(ActiveControl.Handle, WM_CHAR, Ord(Token[1]), 0);
    Exit;
  end;

  // ---------------- NUMBERS ----------------
  if (Length(Token) = 1) and (Token[1] in ['0'..'9']) then
  begin
    PostMessage(ActiveControl.Handle, WM_CHAR, Ord(Token[1]), 0);
    Exit;
  end;

  // ---------------- SPECIAL TOKENS ----------------
  if Token = 'Dot' then
    PostMessage(ActiveControl.Handle, WM_CHAR, Ord('.'), 0)

  else if Token = 'Minus' then
    PostMessage(ActiveControl.Handle, WM_CHAR, Ord('-'), 0)

  else if Token = 'Plus' then
    PostMessage(ActiveControl.Handle, WM_CHAR, Ord('+'), 0)

  else if Token = 'Backspace' then
    PostMessage(ActiveControl.Handle, WM_CHAR, VK_BACK, 0)

  else if Token = 'Del' then
  begin
      PostMessage(ActiveControl.Handle, WM_KEYDOWN, VK_DELETE, 0);
      PostMessage(ActiveControl.Handle, WM_KEYUP, VK_DELETE, 0);
  end

  else if Token = 'Enter' then
    PostMessage(ActiveControl.Handle, WM_KEYDOWN, VK_RETURN, 0)

  else if Token = 'Cancel' then
    PostMessage(ActiveControl.Handle, WM_KEYDOWN, VK_ESCAPE, 0)

  else if Token = 'Confirm' then
    PostMessage(ActiveControl.Handle, WM_KEYDOWN, VK_RETURN, 0)

  // ---------------- ARROWS ----------------
  else if Token = 'Up' then
    PostMessage(ActiveControl.Handle, WM_KEYDOWN, VK_UP, 0)

  else if Token = 'Down' then
    PostMessage(ActiveControl.Handle, WM_KEYDOWN, VK_DOWN, 0)

  else if Token = 'Left' then
    PostMessage(ActiveControl.Handle, WM_KEYDOWN, VK_LEFT, 0)

  else if Token = 'Right' then
    PostMessage(ActiveControl.Handle, WM_KEYDOWN, VK_RIGHT, 0)



end;


procedure TfrmMainFCC.imgCompasClick(Sender: TObject);
begin
  if Assigned(FCCManager) then
  begin
    FCCManager.IsTrueMotion := not FCCManager.IsTrueMotion;
  end;
end;

procedure TfrmMainFCC.InitializeForm;
begin
  // light from image list
  //  0 grey
  //  1 green
  //  2 red
  //  3 grey
  //  4 green
  //  5 red
  //  6 yellow

  case vFccSetting.FccMode of
    1: //FCC1
    begin
      //  initialize panel indikator control state
//      imgListLight.GetBitmap(1, imgCtrlStateFCC.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgCtrlStateTracked.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgCtrlStateDataReady.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgCtrlStateAimed.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgCtrlStateLimitZone.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgCtrlStateFireAllow.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgCtrlStateFiring.Picture.Bitmap);

      //  initialize panel indikator Gun state
//      imgListLight.GetBitmap(1, imgGunStateCtrlBy.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgGunStateServo.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgGunStateFC.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgGunStateReturnZero.Picture.Bitmap);

      //  initialize panel indikator Bite Device state
//      imgListLight.GetBitmap(1, imgBiteDvcStateFCC.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgBiteDvcState730B.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgBiteDvcStateEO.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgBiteDvcStateTR.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgBiteDvcStateTCC.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgBiteDvcStateSIE.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgBiteDvcStateSR.Picture.Bitmap);
    end;
    2: //FCC2
    begin
      //  initialize panel indikator control state
//      imgListLight.GetBitmap(1, imgCtrlStateFCC2.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgCtrlStateTrackedFCC2.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgCtrlStateDataReadyFCC2.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgCtrlStateAimedFCC2.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgCtrlStateLimitZoneFCC2.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgCtrlStateFireAllowFCC2.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgCtrlStateFiringFCC2.Picture.Bitmap);

      //  initialize panel indikator Gun state
//      imgListLight.GetBitmap(1, imgGunStateCtrlByFCC2.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgGunStateServoFCC2.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgGunStateFCFCC2.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgGunStateReturnZeroFCC2.Picture.Bitmap);

      //  initialize panel indikator Bite Device state
//      imgListLight.GetBitmap(1, imgBiteDvcStateFCC2.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgBiteDvcState57.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgBiteDvcStateEOFcc2.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgBiteDvcStateTRFcc2.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgBiteDvcStateTCCFcc2.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgBiteDvcStateSIEFcc2.Picture.Bitmap);
//      imgListLight.GetBitmap(1, imgBiteDvcStateSRFcc2.Picture.Bitmap);
    end;
  end;

end;

procedure TfrmMainFCC.LoadGeoset(const aGst: string);
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
    FMap.ZoomTo((Self.FCurrentRange  * 0.00092) * 2, FMap.CenterX, FMap.CenterY);
  end
end;

function TfrmMainFCC.MeterHeight: Integer;
begin
  Result := FMap.Height;
//  Result := (FMap.Height div 2);
end;

function TfrmMainFCC.MeterWidth: Integer;
begin
  Result := FMap.width;
//  Result := (FMap.width div 2);
end;

procedure TfrmMainFCC.NLDJoystick1ButtonDown(Sender: TNLDJoystick;
  const Buttons: TJoyButtons);
begin
    // Check Buttons (e.g., button 1)
  if JoyBtn1 in Buttons then
//    Shape1.Brush.Color := clRed
end;

procedure TfrmMainFCC.NLDJoystick1ButtonUp(Sender: TNLDJoystick;
  const Buttons: TJoyButtons);
begin
  if not (JoyBtn1 in Buttons) then
//    Shape1.Brush.Color := clWhite
end;

procedure TfrmMainFCC.NLDJoystick1Move(Sender: TNLDJoystick;
  const JoyPos: TJoyRelPos; const Buttons: TJoyButtons);
var
RecSend : TRec_CameraController;
begin

  if vFccSetting.FccMode = 4 then
  Exit;


  if JoyPos.X > 0.35 then
  begin
    FisKanan := True;
  end
  else if JoyPos.X < -0.35 then
  begin
    FisKiri := True;
  end
  else if (JoyPos.X < 0.35) and (JoyPos.x > 0) and FisKanan then
  begin
    FXAxis := False;
    FisKanan := False;
    RecSend.cmd := __ORD_ID_CAMCON_Joystick_Right;
    RecSend.valueInt := 0;
    RecSend.valueStr := IntToStr(FCCManager.ShipID) + '_' + IntToStr(FCCManager.AssignedWeapon.IDWeapon);

    FCCManager.NetSendTo3D_OrderCameraControl(RecSend);
  end
  else if (JoyPos.X < 0) and (JoyPos.x > -0.35) and FisKiri then
  begin
    FXAxis := False;
    FisKiri := False;
    RecSend.cmd := __ORD_ID_CAMCON_Joystick_Left;
    RecSend.valueInt := 0;
    RecSend.valueStr := IntToStr(FCCManager.ShipID) + '_' + IntToStr(FCCManager.AssignedWeapon.IDWeapon);

    FCCManager.NetSendTo3D_OrderCameraControl(RecSend);
  end;

  if FisKanan and not FXAxis then
  begin
    FXAxis := true;
    RecSend.cmd := __ORD_ID_CAMCON_Joystick_Right;
    RecSend.valueInt := 1;
    RecSend.valueStr := IntToStr(FCCManager.ShipID) + '_' + IntToStr(FCCManager.AssignedWeapon.IDWeapon);

    FCCManager.NetSendTo3D_OrderCameraControl(RecSend);
  end
  else if FisKiri and not FXAxis then
  begin
    FXAxis := true;
    RecSend.cmd := __ORD_ID_CAMCON_Joystick_Left;
    RecSend.valueInt := 1;
    RecSend.valueStr := IntToStr(FCCManager.ShipID) + '_' + IntToStr(FCCManager.AssignedWeapon.IDWeapon);

    FCCManager.NetSendTo3D_OrderCameraControl(RecSend);
  end;



  if JoyPos.Y > 0.35 then
  begin
    FisBawah := True;
  end
  else if JoyPos.Y < -0.35 then
  begin
    FisAtas := True;
  end
  else if (JoyPos.Y < 0.35) and (JoyPos.Y > 0) and FisBawah then
  begin
    FYAxis := False;
    FisBawah := False;
    RecSend.cmd := __ORD_ID_CAMCON_Joystick_Down;
    RecSend.valueInt := 0;
    RecSend.valueStr := IntToStr(FCCManager.ShipID) + '_' + IntToStr(FCCManager.AssignedWeapon.IDWeapon);

    FCCManager.NetSendTo3D_OrderCameraControl(RecSend);
  end
  else if (JoyPos.Y < 0) and (JoyPos.Y > -0.35) and FisAtas then
  begin
    FYAxis := False;
    FisAtas := False;
    RecSend.cmd := __ORD_ID_CAMCON_Joystick_Up;
    RecSend.valueInt := 0;
    RecSend.valueStr := IntToStr(FCCManager.ShipID) + '_' + IntToStr(FCCManager.AssignedWeapon.IDWeapon);

    FCCManager.NetSendTo3D_OrderCameraControl(RecSend);
  end;

  if FisBawah and not FYAxis then
  begin
    FYAxis := true;
    RecSend.cmd := __ORD_ID_CAMCON_Joystick_Down;
    RecSend.valueInt := 1;
    RecSend.valueStr := IntToStr(FCCManager.ShipID) + '_' + IntToStr(FCCManager.AssignedWeapon.IDWeapon);

    FCCManager.NetSendTo3D_OrderCameraControl(RecSend);
  end
  else if FisAtas and not FYAxis then
  begin
    FYAxis := true;
    RecSend.cmd := __ORD_ID_CAMCON_Joystick_Up;
    RecSend.valueInt := 1;
    RecSend.valueStr := IntToStr(FCCManager.ShipID) + '_' + IntToStr(FCCManager.AssignedWeapon.IDWeapon);

    FCCManager.NetSendTo3D_OrderCameraControl(RecSend);
  end;



  if JoyPos.Z > 0.35 then
  begin
    FisZoomIn := True;
  end
  else if JoyPos.Z < -0.35 then
  begin
    FisZoomOut := True;
  end
  else if (JoyPos.Z < 0.35) and (JoyPos.Z > 0) and FisZoomIn then
  begin
    FZAxis := False;
    FisZoomIn := False;
    RecSend.cmd := __ORD_ID_CAMCON_Joystick_ZoomIn;
    RecSend.valueInt := 0;
    RecSend.valueStr := IntToStr(FCCManager.ShipID) + '_' + IntToStr(FCCManager.AssignedWeapon.IDWeapon);

    FCCManager.NetSendTo3D_OrderCameraControl(RecSend);
  end
  else if (JoyPos.Z < 0) and (JoyPos.Z > -0.35) and FisZoomOut then
  begin
    FZAxis := False;
    FisZoomOut := False;
    RecSend.cmd := __ORD_ID_CAMCON_Joystick_ZoomOut;
    RecSend.valueInt := 0;
    RecSend.valueStr := IntToStr(FCCManager.ShipID) + '_' + IntToStr(FCCManager.AssignedWeapon.IDWeapon);

    FCCManager.NetSendTo3D_OrderCameraControl(RecSend);
  end;

  if FisZoomIn and not FZAxis then
  begin
    FZAxis := true;
    RecSend.cmd := __ORD_ID_CAMCON_Joystick_ZoomIn;
    RecSend.valueInt := 1;
    RecSend.valueStr := IntToStr(FCCManager.ShipID) + '_' + IntToStr(FCCManager.AssignedWeapon.IDWeapon);

    FCCManager.NetSendTo3D_OrderCameraControl(RecSend);
  end
  else if FisZoomOut and not FZAxis then
  begin
    FZAxis := true;
    RecSend.cmd := __ORD_ID_CAMCON_Joystick_ZoomOut;
    RecSend.valueInt := 1;
    RecSend.valueStr := IntToStr(FCCManager.ShipID) + '_' + IntToStr(FCCManager.AssignedWeapon.IDWeapon);

    FCCManager.NetSendTo3D_OrderCameraControl(RecSend)
  end;

end;

procedure TfrmMainFCC.pnlFireFcc2Click(Sender: TObject);
var
  RecSend : TRec3DSetWCC;
  aLow, aHigh: Double;
  range,rangem, bearing : Double;
begin
  if Assigned(FCCManager.SelectedVehicle) then
  begin
    range := CalcRange(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, FCCManager.SelectedVehicle.PosX, FCCManager.SelectedVehicle.PosY);
    rangem := range * C_NauticalMile_To_Metre;
    bearing := CalcBearing(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, FCCManager.SelectedVehicle.PosX, FCCManager.SelectedVehicle.PosY);
    // range = 3000 m, target lebih rendah 25 m
    ComputeBallisticAngleVacuum(rangem, FCCManager.SelectedVehicle.PosZ, 800, aLow, aHigh);

    RecSend.ShipID          := FCCManager.ShipID;
    RecSend.mWeaponID       := FCCManager.AssignedWeapon.IDWeapon;
    RecSend.mLauncherID     := 0;
    RecSend.mMissileID      := 0;
    RecSend.mMissileNumber  := 0;
    RecSend.mOrderID        := 0;

    RecSend.mUpDown             := 0;
    RecSend.mTargetID           := FCCManager.SelectedVehicle.ShipID;;
    RecSend.mModeID             := 0;
    RecSend.mAutoCorrectElev    := aLow;
    RecSend.mAutoCorrectBearing := bearing;

    RecSend.mBalistikID         := 0;
    RecSend.mSalvoRate          := 30;

//    FCCManager.SelectedVehicle.


    RecSend.mOrderID := __ORD_CANNON_START_F;
    FCCManager.NetSendTo3D_OrderCannon(RecSend);

    Sleep(1000);

    RecSend.ShipID          := FCCManager.ShipID;
    RecSend.mWeaponID       := FCCManager.AssignedWeapon.IDWeapon;
    RecSend.mLauncherID     := 0;
    RecSend.mMissileID      := 0;
    RecSend.mMissileNumber  := 0;
    RecSend.mOrderID        := 0;

    RecSend.mUpDown             := 0;
    RecSend.mTargetID           := FCCManager.SelectedVehicle.ShipID;;
    RecSend.mModeID             := 0;
    RecSend.mAutoCorrectElev    := aLow;
    RecSend.mAutoCorrectBearing := bearing;

    RecSend.mBalistikID         := 0;
    RecSend.mSalvoRate          := 30;


    RecSend.mOrderID := __ORD_CANNON_STOP_F;
    FCCManager.NetSendTo3D_OrderCannon(RecSend);
  end;
end;

procedure TfrmMainFCC.pnlMapRangeClick(Sender: TObject);
begin
  ResetColorRange;
  TPanel(Sender).Color := clYellow;

  Self.FIndexRange := TPanel(Sender).Tag;
  self.FCurrentRange := CRangeOperation[TPanel(Sender).Tag];
  FMap.ZoomTo((Self.FCurrentRange  * 0.00092) * 2, FMap.CenterX, FMap.CenterY);
//  lblRange.Caption := Format('%2.2f', [FCurrentRange * C_Meter_To_NauticalMile]);
end;

procedure TfrmMainFCC.ptkCommand(const str: string);
begin
  HandleKeyByBtnName(str);
end;

procedure TfrmMainFCC.ResetColorRange;
begin
  pnlMap1point5km.Color := clAqua;
  pnlMap3km.Color := clAqua;
  pnlMap6km.Color := clAqua;
  pnlMap12km.Color := clAqua;
  pnlMap24km.Color := clAqua;
  pnlMap48km.Color := clAqua;
end;

function TfrmMainFCC.Rotate(Width, Height, Radius: Integer;
  Degrees: Double): Winapi.Windows.TPoint;
var
  Angle: Double;
  W, H: Integer;
//  HeadingView : THeadingRadarView;
begin
//  if Assigned(NavSimCenter.NAV_Radar.HeadingView) then
//  begin
//   HeadingView := uRadarNavManager.NavSimCenter.NAV_Radar.getHeadingLine;
//   if HeadingView.HeadingMode = sbmCourseUp then
//   begin
//       Angle := HeadingView.Heading;
//       if Angle < 0 then Angle := CBaseAngle - Angle;
//       Angle := CBaseAngle - Angle;
//       Angle := ConvCompass_To_Cartesian(Angle);
//       Angle := ConvCustomAngleStart(degrees,Angle);
//       Angle := Angle*C_DegToRad;
//   end
//   else
//   //if HeadingView.HeadingMode = sbmCourseUp then
//      Angle  := ConvCartesian_To_Compass(Degrees)*C_DegToRad;
//  end
//  else
     Angle := ConvCartesian_To_Compass(Degrees)*C_DegToRad;

  W := Width div 2;
  H := Height div 2;
  Result.X := W + Round(Cos(Angle) * Radius);
  Result.Y := H + Round(Sin(Angle) * Radius);
  Result.Y := (H * 2) - Result.Y;
end;

procedure TfrmMainFCC.setReceiveBITETable;
begin
  tableReceiveBITE.Cells[0,0] := '1';
  tableReceiveBITE.Cells[1,0] := 'DC Power + 5V2A,-6V2A';
  tableReceiveBITE.Cells[2,0] := 'Normal';

  tableReceiveBITE.Cells[0,1] := '2';
  tableReceiveBITE.Cells[1,1] := 'DC Power + 15V3A';
  tableReceiveBITE.Cells[2,1] := 'Normal';

  tableReceiveBITE.Cells[0,2] := '3';
  tableReceiveBITE.Cells[1,2] := 'DC Power + 3.3V30A + 5V5A';
  tableReceiveBITE.Cells[2,2] := 'Normal';

  tableReceiveBITE.Cells[0,3] := '4';
  tableReceiveBITE.Cells[1,3] := 'Timer Board';
  tableReceiveBITE.Cells[2,3] := 'Normal';

  tableReceiveBITE.Cells[0,4] := '5';
  tableReceiveBITE.Cells[1,4] := 'Range Interface Board';
  tableReceiveBITE.Cells[2,4] := 'Normal';

  tableReceiveBITE.Cells[0,5] := '6';
  tableReceiveBITE.Cells[1,5] := 'Fire Calibration Channel A/D';
  tableReceiveBITE.Cells[2,5] := 'Normal';

  tableReceiveBITE.Cells[0,6] := '7';
  tableReceiveBITE.Cells[1,6] := 'Difference Channel A/D';
  tableReceiveBITE.Cells[2,6] := 'Normal';

  tableReceiveBITE.Cells[0,7] := '8';
  tableReceiveBITE.Cells[1,7] := 'Sum Channel A/D';
  tableReceiveBITE.Cells[2,7] := 'Normal';

  tableReceiveBITE.Cells[0,8] := '9';
  tableReceiveBITE.Cells[1,8] := 'Fire Calibration Azimuth Main IF Amplifier';
  tableReceiveBITE.Cells[2,8] := 'Normal';

  tableReceiveBITE.Cells[0,9] := '10';
  tableReceiveBITE.Cells[1,9] := 'Fire Calibration Main IF Amplifier';
  tableReceiveBITE.Cells[2,9] := 'Normal';

  tableReceiveBITE.Cells[0,10] := '11';
  tableReceiveBITE.Cells[1,10] := 'Elevation Main IF Amplifier';
  tableReceiveBITE.Cells[2,10] := 'Normal';

  tableReceiveBITE.Cells[0,11] := '12';
  tableReceiveBITE.Cells[1,11] := 'Azimuth Main IF Amplifier';
  tableReceiveBITE.Cells[2,11] := 'Normal';

  tableReceiveBITE.Cells[0,12] := '13';
  tableReceiveBITE.Cells[1,12] := 'Sum Channel Main IF Amplifier';
  tableReceiveBITE.Cells[2,12] := 'Normal';

  tableReceiveBITE.Cells[0,13] := '14';
  tableReceiveBITE.Cells[1,13] := 'Sum Channel Processing Board';
  tableReceiveBITE.Cells[2,13] := 'Normal';

  tableReceiveBITE.Cells[0,14] := '15';
  tableReceiveBITE.Cells[1,14] := 'Difference Channel Processing Board';
  tableReceiveBITE.Cells[2,14] := 'Normal';

  tableReceiveBITE.Cells[0,15] := '16';
  tableReceiveBITE.Cells[1,15] := 'Fire Calibration Channel Processing Board';
  tableReceiveBITE.Cells[2,15] := 'Normal';

  tableReceiveBITE.Cells[0,16] := '17';
  tableReceiveBITE.Cells[1,16] := 'Sum Channel RF';
  tableReceiveBITE.Cells[2,16] := 'Normal';

  tableReceiveBITE.Cells[0,17] := '18';
  tableReceiveBITE.Cells[1,17] := 'Azimuth RF';
  tableReceiveBITE.Cells[2,17] := 'Normal';

  tableReceiveBITE.Cells[0,18] := '19';
  tableReceiveBITE.Cells[1,18] := 'Elevation RF';
  tableReceiveBITE.Cells[2,18] := 'Normal';

  tableReceiveBITE.Cells[0,19] := '20';
  tableReceiveBITE.Cells[1,19] := 'AGC';
  tableReceiveBITE.Cells[2,19] := 'Normal';
end;

procedure TfrmMainFCC.setRegionCircle;
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
  diffBeetwinWH := (pnlSituationZone.Width - pnlSituationZone.Height) div 2;

  top := 50;
  bottom := pnlSituationZone.Height - top;
  left := diffBeetwinWH + top;
  right := pnlSituationZone.Width - left;

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

procedure TfrmMainFCC.ShowInfoCursor(const x, y: integer);
var
  mx, my: double;
  sx, sy: single;
  z: double;
  s: string;
begin
  sx := x;
  sy := y;

  FMap.ConvertCoord(sx, sy, mx, my, miScreenToMap);

  lblMapLon.Caption := 'LON ' + FormatFloat('0.000', mx);
  lblMapLat.Caption := 'LAT ' + FormatFloat('0.000', my);
//  lblLongtitude.Caption := FormatFloat('0.000', mx);
//  lblLatitude.Caption := FormatFloat('0.000', my);
end;

procedure TfrmMainFCC.tmrUpdateFormTimer(Sender: TObject);
var
duration : TDateTime;
begin
//  if FNorthAngle < 360 then
//    Inc(FNorthAngle)
//  else
//    FNorthAngle := 0;

  duration := Now - FStartTime;
  lblRunTimeVal.Caption := FormatDateTime('hh:nn:ss', duration);

  lblSystemTimeVal.Caption := FormatDateTime('hh:nn:ss',now);

  imgCompas.Repaint;
  frmMainFCC.Invalidate;

//  lblBiteTimeSystemValue.Caption := FormatDateTime('hh:nn:ss',now);

  if Assigned(FCCManager) then
  begin
    if Assigned(FCCManager.xShip) then
    begin
//      edtNavDataLAT.Text := FormatFloat('0.000000', FCCManager.xShip.PositionY);
//      edtNavDataLON.Text := FormatFloat('0.000000', FCCManager.xShip.PositionX);
      Fmap.CenterX := FCCManager.xShip.PositionX;
      Fmap.CenterY := FCCManager.xShip.PositionY;

//      if not FCCManager.IsTrueMotion then begin
//        Fmap.CenterX := FCCManager.xShip.PositionX;
//        Fmap.CenterY := FCCManager.xShip.PositionY;
//      //    FMap.Rotation := 0;
//        FNorthAngle := 0;
//      end
//      else
//      begin
//        FNorthAngle := -FCCManager.xShip.Heading;;
//      //    FMap.Rotation := -FCCManager.xShip.Heading;
//      end;
    end;
  end;
end;

procedure TfrmMainFCC.tmrUpdateHeadingTimer(Sender: TObject);
var
  i : Integer;
  RandomDeltaX,RandomDeltaY : Double;
begin
//  for i := 0 to TargetMgr.Count - 1 do
//  begin
//    RandomDeltaX := RandomRange(0, 1 + 1) * 0.01;
//    RandomDeltaY := RandomRange(0, 1 + 1) * 0.01;
//
//    TargetMgr.Items(i).MapX := TargetMgr.Items(i).MapX + RandomDeltaX;
//    TargetMgr.Items(i).MapY := TargetMgr.Items(i).MapY + RandomDeltaY;
//  end;
//  FMap.Refresh;
//
//  if Assigned(FCCManager) then
//  begin
//    if Assigned(FCCManager.xShip) then
//    begin
//      FCCManager.xShip.Heading := FCCManager.xShip.Heading + 1;
//    end;
//  end;
end;


procedure TfrmMainFCC.UpdatePosition(Sender: TObject);
var
  CorrectBearing,
  CorrectElev : Double;
  aLow, aHigh: Double;
  range,rangem, bearing, azimuth, elevation : Double;
begin
//  lblBearing.Caption := Format('0',[FBearing0.BearingDeg]);
//  lblRange.Caption := Format('0.00', [FCurrentRange * C_Meter_To_NauticalMile]);
//  lblLongtitude.Caption := FormatFloat('0.0000', FCCManager.xShip.PositionX);
//  lblLatitude.Caption := FormatFloat('0.0000', FCCManager.xShip.PositionY);
  EdtSpeedNAVIVal.Text := FormatFloat('00.0', FCCManager.xShip.Speed);
//  edtSpeedINDVal.Text := FormatFloat('00.0', FCCManager.xShip.Speed);
  EdtHeadingNAVIVal.Text := FormatFloat('0', FCCManager.xShip.Heading);
  FOwnShipHeading := FCCManager.xShip.Heading;
//  edtHeadingINDVal.Text := FormatFloat('0', FCCManager.xShip.Heading);
//  lblEta.Caption := FormatDateTime('hh:nn:ss',now);
//  lblUTCTime.Caption := FormatDateTime('hh:nn:ss',TTimeZone.Local.ToUniversalTime(Now));
//  lblTtg.Caption := FormatDateTime('hh:nn',now);
  if Assigned(fccmanager.SelectedVehicle) and (FSelectedVehicleState = True) then
  begin
    range := CalcRange(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, FCCManager.SelectedVehicle.PosX, FCCManager.SelectedVehicle.PosY);
    rangem := range * C_NauticalMile_To_Metre;
    FRange := range;
    azimuth := CalcBearing(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, FCCManager.SelectedVehicle.PosX, FCCManager.SelectedVehicle.PosY);
    // range = 3000 m, target lebih rendah 25 m
    bearing := azimuth - FCCManager.xShip.Heading;
    if bearing < 0 then
    bearing := bearing + 360;
    ComputeBallisticAngleVacuum(rangem, FCCManager.SelectedVehicle.PosZ, 800, aLow, aHigh);
    case vFccSetting.FccMode of
      2 : //MR 103
      begin
        elevation := CalcTurretElevation(rangem, 12900);
      end;
      3 : //MR 302
      begin
        elevation := CalcElevation(rangem, 6, fccmanager.SelectedVehicle.PosZ);
      end;
    end;

    if fbRangeMeter.Down then edtRDRangeVal.Text := format('%.2f', [rangem])
    else  edtRDRangeVal.Text := format('%.2f', [rangem * c_meter_to_nauticalMile]);
    edtRadarGate.Text := format('%.2f', [rangem]);
    edtRAzimuthVal.Text := format('%.2f', [bearing]);
    edtElevationVal.Text := format('%.2f', [elevation]);

    edtIDTargetVal.Text := UniqueID_To_dbID(FCCManager.SelectedVehicle.UniqueID).ToString();
    edtSpeedINDVal.Text := format('%.2f', [FCCManager.SelectedVehicle.Speed_mps * 1.944]);
    edtHeadingINDVal.Text := format('%.2f', [FCCManager.SelectedVehicle.HeadingDeg]);

    edtBatchNoDesig.Text := UniqueID_To_dbID(FCCManager.SelectedVehicle.UniqueID).ToString();
    edtSpeedDesig.Text := format('%.2f', [FCCManager.SelectedVehicle.Speed_mps * 1.944]);
    edtHeadingDesig.Text := format('%.2f', [FCCManager.SelectedVehicle.HeadingDeg]);
  end

  else
  begin
    edtRDRangeVal.Text := '0.00';
    edtRadarGate.Text := '0.00';

    edtIDTargetVal.Text := '0';
    edtSpeedINDVal.Text := '0.00';
    edtHeadingINDVal.Text := '0.00';

    edtBatchNoDesig.Text := '0';
    edtSpeedDesig.Text := '0.00';
    edtHeadingDesig.Text := '0.00';
  end

end;

end.
