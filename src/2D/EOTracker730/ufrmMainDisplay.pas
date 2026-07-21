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
  Vcl.ComCtrls, AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, VrAngularMeter,
  TFlatButtonUnit;

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
    pnlUpper: TPanel;
    pnlState: TPanel;
    pnlEOData: TPanel;
    tmrUpdateShipPos: TTimer;
    tmrUpdateForm: TTimer;
    Label6: TLabel;
    Label16: TLabel;
    pnlViewer3DTV: TPanel;
    pnlStateHeader: TPanel;
    pnlHeaderEOData: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    pnlBearElev: TPanel;
    pnlViewer3DIR: TPanel;
    Shape3: TShape;
    Shape4: TShape;
    vrAngularBearing: TVrAngularMeter;
    vrAngularElev: TVrAngularMeter;
    pnlValBearElev: TPanel;
    pnlValBearingBottom: TPanel;
    pnlValElevBottom: TPanel;
    pnlViewerTV: TPanel;
    lblValBearTop: TPanel;
    lblValElevTop: TPanel;
    lblValRangeTop: TPanel;
    lbl0: TPanel;
    lblMin30: TPanel;
    lbl90: TPanel;
    lbl60: TPanel;
    lbl30: TPanel;
    lblMin90: TPanel;
    lblMin60: TPanel;
    lineBearHor: TShape;
    lineBearVer: TShape;
    lineElevVer: TShape;
    lineElevHor: TShape;
    pnlControl: TPanel;
    pnlControlHeader: TPanel;
    pnlNavData: TPanel;
    pnlNavDataHeader: TPanel;
    pnlIndication: TPanel;
    pnlIndicationHeader: TPanel;
    pnlInformation: TPanel;
    imgListLight: TImageList;
    lblCtlMode: TLabel;
    edtCtlModeVal: TEdit;
    edtWorkModeVal: TEdit;
    lblWorkMode: TLabel;
    lblWorkState: TLabel;
    edtWorkStateVal: TEdit;
    edtTrackStateVal: TEdit;
    lblTrackState: TLabel;
    edtEOStateVal: TEdit;
    lblEOState: TLabel;
    lblCtlState: TLabel;
    edtCtlStateVal: TEdit;
    edtEODistanceVal: TEdit;
    lblEODistance: TLabel;
    edtBEDifVal: TEdit;
    lblBEDif: TLabel;
    edtELDifVal: TEdit;
    lblELDif: TLabel;
    Label11: TLabel;
    edtNavCourseVal: TEdit;
    lblNavPitch: TLabel;
    edtNavPitchVal: TEdit;
    lblNavRoll: TLabel;
    edtNavRollVal: TEdit;
    lblIndDistance: TLabel;
    edtIndDistanceVal: TEdit;
    lblIndAzimuth: TLabel;
    edtIndAzimuthVal: TEdit;
    lblIndElev: TLabel;
    edtIndElevVal: TEdit;
    lblNavState: TLabel;
    imgNavState: TImage;
    lblIndType: TLabel;
    edtIndTypeVal: TEdit;
    Image2: TImage;
    lblControlTrack: TLabel;
    edtControlTrackVal: TEdit;
    lblControlAction: TLabel;
    edtControlActionVal: TEdit;
    lblControlSensor: TLabel;
    edtControlSensorVal: TEdit;
    lblDateNow: TLabel;
    lblTimeNow: TLabel;
    lblEODistancesat: TLabel;
    lblBEDifsat: TLabel;
    lblELDifsat: TLabel;
    lblNavRollsat: TLabel;
    lblNavPitchsat: TLabel;
    lblNavCoursesat: TLabel;
    lblIndElevsat: TLabel;
    lblIndAzimuthsat: TLabel;
    lblIndDistancesat: TLabel;
    NLDJoystick1: TNLDJoystick;
    pnlDiagnosis: TPanel;
    lblTVVideo: TLabel;
    lblIRVideo: TLabel;
    lblLRPumpPower: TLabel;
    lblLRPrecombust: TLabel;
    lblDC801: TLabel;
    lblDC802: TLabel;
    pnlDiagnosisHeader: TPanel;
    edtTVVideoVal: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    lblTVTrackBoard: TLabel;
    lblIRTrackBoard: TLabel;
    Edit1: TEdit;
    Edit7: TEdit;
    lblLRDischarge: TLabel;
    lblLRCharge: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    lblTVState: TLabel;
    lblDC8010A: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    lblServoBoard: TLabel;
    lblBEDriveBoard: TLabel;
    lblELDriveBoard: TLabel;
    lblAC26V: TLabel;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    lblLRNoLight: TLabel;
    lblBEGyro: TLabel;
    lblELGyro: TLabel;
    lblDC28V13A: TLabel;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    lblIRState: TLabel;
    lblLRState: TLabel;
    lblSVState: TLabel;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    pnlSetIndication: TPanel;
    lblSetIndRange: TLabel;
    lblSetIndBE: TLabel;
    lblSetIndEL: TLabel;
    lblSetINDType: TLabel;
    lblSetIndELsat: TLabel;
    lblSetIndBEsat: TLabel;
    lblSetIndRangesat: TLabel;
    pnlSetIndicationHeader: TPanel;
    edtSetIndRangeVal: TEdit;
    edtSetIndBEVal: TEdit;
    edtSetIndELVal: TEdit;
    edtSetIndTypeVal: TEdit;
    lblTypeInd: TLabel;
    pnlRevise: TPanel;
    lblReviseBE: TLabel;
    lblReviseEL: TLabel;
    lblReviseELsat: TLabel;
    lblReviseBEsat: TLabel;
    pnlReviseHeader: TPanel;
    edtReviseBEVal: TEdit;
    dtReviseELVal: TEdit;
    TimerBeEl: TTimer;
    btnCatchEO: TFlatButton;
    btnTrackEO: TFlatButton;
    procedure FormCreate(Sender: TObject);
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
    procedure TimerBeElTimer(Sender: TObject);
    procedure btnCatchEOMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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
    BitMapLampGrey, BitMapLampGreen, BitMapLampRed  : TBitmap;

    FLyrDraw: CMapXLayer;
    FNorthAngle : Double;
    FMapCanvas     : TCanvas;
    FMapConverter : TMapXUnitConverter;
    FFlag       : Byte;
    FIndexRange : Integer;
    FCurrentRange : Double;  // meter
    FShipHeading : Integer;

    config: TSetting;
    ExecInfo, ExecPTK, ExecInfoIR: TShellExecuteInfo;

    FisKanan, FisKiri, FisAtas, FisBawah, FisZoomIn, FisZoomOut : Boolean;
    FXAxis, FYAxis, FZAxis : Boolean;
    FBEVal,FELVal, FZoomVal : Double;
    FisAutomatic, FisIRWFOV, FisSurfaceType: Boolean;

    FOperatingMode: TOperatingMode;

    FisDiagnonisOpen : Boolean;

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

    procedure InitializeForm();

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

procedure TfrmMainFCC.btnCatchEOMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  RecSendFccSet: TrecData_MeriamFCC;
begin
//  FCCManager.TrackMode := TTrackMode(TFlatbutton(sender).Tag);
  // tombol reset perlu diubah warna dan down = false saat sender 1/2
  if TFlatbutton(sender).Tag = 1 then
  begin
    if TFlatbutton(sender).Down = true then
    begin // masuk ke mode search
//      btnCatchEO.Down := False;
//      btnTrackEO.Down := False;
      FCCManager.TrackMode := TMSearch;
      edtWorkStateVal.Text := 'Wait';
      edtTrackStateVal.Text := 'Search';
      btnCatchEO.ColorFocused := btnCatchEO.Color;
//      btnTrackEO.ColorHighLight := btnTrackEO.Color;
    end
    else
    begin
      FCCManager.TrackMode := TMCatch;
      edtWorkStateVal.Text := 'Catch';
      edtTrackStateVal.Text := 'Tracking';
//      btnCatchEO.ColorHighLight := btnCatchEO.ColorDown;
      btnCatchEO.ColorFocused := btnCatchEO.ColorDown;
    end;
  end
  else if TFlatbutton(sender).Tag = 2 then
  begin
    if TFlatbutton(sender).Down = true then
    begin
//      btnCatchEO.Down := False;
//      btnTrackEO.Down := False;
      FCCManager.TrackMode := TMSearch;
      edtWorkStateVal.Text := 'Wait';
      edtTrackStateVal.Text := 'Search';
      btnTrackEO.ColorFocused := btnTrackEO.Color;
    end
    else
    begin
      FCCManager.TrackMode := TMTrack;
      edtWorkStateVal.Text := 'Track';
      edtTrackStateVal.Text := 'Tracking';
      btnTrackEO.ColorFocused := btnTrackEO.ColorDown;
    end;
  end;
  // send ke 3d untuk ganti trackmode
  RecSendFccSet.ShipID := FCCManager.ShipID;
  RecSendFccSet.Range := 0;
  RecSendFccSet.Bearing := 0;
  RecSendFccSet.Elevation := 0;
  RecSendFccSet.EOBearing := 0;
  RecSendFccSet.EOElevation := 0;
  RecSendFccSet.IDTarget3D := 0;
  RecSendFccSet.IDTarget2D := 0;
  RecSendFccSet.EnableValue := false;

  RecSendFccSet.OrderID := CORD_ID_TrackerMode;
  RecSendFccSet.TargetType := Ord(FCCManager.TrackMode);

  FCCManager.NetSendTo3D_FCCSet(RecSendFccSet);

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

end;

procedure TfrmMainFCC.DrawAll(aCnv: TCanvas; aCvt: TCoordConverter;
  aFlag: Byte);
var
  pnt: Winapi.Windows.TPoint;
var
  z: double;
  i: Integer;
begin
  i := FindClosestZoomIndex(z);
  z := ZoomIndexToScale(i);

    // RANGE RINGS
    FRings.CircleRect    := FCircleRect;
    FRings.CurrentRange_m := FCurrentRange;
    FRings.ConvertCoord(aCvt);
    FRings.Draw(aCnv);

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
  baseAngle := round(CBaseAngle);
  AngleOffset := round(CBaseAngle);
  labelsfont := TFont.Create();
  labelsfont.Color := clYellow;
  labelsfont.Size := 10;
  StartAngle := BaseAngle + Angle;


  top := 50;
  left := diffBeetwinWH + top;
  with aCnv do
  begin
		Pen.Color := CForegroundColor;

    Brush.Style := bsClear;
//    R := Rect(0,0, Map.Width, Map.Height);
    R := Rect(left,top, right, bottom);
    AngleRadius := (R.right - R.left) div 2;
//    AngleRadius := 280;
    ticksmax := 16;
    ticks := round(24);
    ticksEnlarge := 5;
    ticksMin := 8;
    ticksColor := clGreen;
    labels := 24;
    decimals := 0;
    labelsoffset := 30;

    {jarum derajat}

    if Ticks >= 1 then
    begin
      Enlarge := TicksEnlarge;
      Degrees := StartAngle;
      Increment := AngleOffset/Ticks;
      aCnv.Pen.Color := clRed;
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
//  aCnv.Brush.Style := bsClear;
  aCnv.Pen.Color := clYellow;
  acnv.Brush.Color := clBlack;

  //draw lingkaran luar
  aCnv.Ellipse(r.Left, r.Top, r.Right, r.Bottom);

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

procedure TfrmMainFCC.FMapDrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull,
  RectInvalid: IDispatch);
begin
  FMapCanvas.Handle := hOutputDC;
  DrawAll(FMapCanvas, FMapConverter, FFlag);
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
//  if Button <> mbLeft then Exit;
//
////  Sel := TargetMgr.SelectAt(X, Y);
//
//  v := VehicleMgr.SelectAt(X, Y);
//
//  if Assigned(v) then
//  begin
//    // misalnya tampilkan info target
//    // ShowMessage('Target terpilih: ' + Sel.TrackLabel);
//
//    FCCManager.SelectedVehicleID := v;
//    rangeX := CalcRange(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, v.PosX, v.PosY) * C_NauticalMile_To_Metre;   // 3 km
//    dH     := v.PosZ;    // target 20 m lebih rendah
//    v0     := 1035;    // m/s
//
//    if Assigned(FCCManager) then
//    begin
//      // 1) Tanpa environment (vakum)
//      ok := FCCManager.ComputeGunElevationVacuum(rangeX, dH, v0, aLow, aHigh);
////      edtLowPR.Text := FormatFloat('0.00', aLow);
////      edtHighPR.Text := FormatFloat('0.00', aHigh);
//    end;
//
//    FSelectedVehicleState := true;
//  end
//  else
//  begin
//    FSelectedVehicleState := false;
//  end;
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
  RecSend : TRec3DSetWCC;

  CorrectBearing,
  CorrectElev : Double;
  aLow, aHigh: Double;
  range,rangem, bearing : Double;
  V : TVehicle;
begin
  if fccmanager.SelectedVehicleID <> 0 then
  begin
    v := VehicleMgr.FindObjectByUid(dbID_to_UniqueID(FCCManager.SelectedVehicleID));
    range := CalcRange(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, v.PosX, v.PosY);
    rangem := range * C_NauticalMile_To_Metre;
    bearing := CalcBearing(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, v.PosX, v.PosY);
    // range = 3000 m, target lebih rendah 25 m
    ComputeBallisticAngleVacuum(rangem, v.PosZ, 800, aLow, aHigh);

//    edtRDRangeVal.Text := format('%.2f', [rangem]);
//    edtRadarGate.Text := format('%.2f', [rangem]);
//    edtRAzimuthVal.Text := format('%.2f', [bearing]);
//    edtElevationVal.Text := format('%.2f', [CalcElevation(rangem, 15, fccmanager.SelectedVehicle.PosZ)]);

//    edtIDTargetVal.Text := UniqueID_To_dbID(FCCManager.SelectedVehicle.UniqueID).ToString();
//    edtSpeedINDVal.Text := (FCCManager.SelectedVehicle.Speed_mps * 1.944).ToString;
//    edtHeadingINDVal.Text := FCCManager.SelectedVehicle.HeadingDeg.ToString;



//    lblTgtNo.Caption := FCCManager.SelectedVehicle.ShipID.ToString();
//    lblLatTgt.Caption := format('%.4f', [FCCManager.SelectedVehicle.Posy]);
//    lblLonTgt.Caption := format('%.4f', [FCCManager.SelectedVehicle.Posx]);
//
//    lblTgtSpd.Caption := format('%.2f', [FCCManager.SelectedVehicle.Speed_mps * 1.943844]);
//    lblTgtCourse.Caption := format('%.2f', [FCCManager.SelectedVehicle.HeadingDeg]);

//    if (aLow <= 80 ) and (aLow >= 0 )then
//    begin
////      FTargetAngleElevasi:= StrToFloatDef(edtElevasi.Text, 0);
//      aLow := FMod(aLow, 360);
//      if aLow < 0 then
//        aLow := aLow + 360;
//
//      RecSend.ShipID          := FCCManager.ShipID;
//      RecSend.mWeaponID       := FCCManager.AssignedWeapon.IDWeapon;
//      RecSend.mLauncherID     := 0;
//      RecSend.mMissileID      := 0;
//      RecSend.mMissileNumber  := 0;
//      RecSend.mOrderID        := 0;
//
//      RecSend.mUpDown             := 0;
//      RecSend.mTargetID           := FCCManager.SelectedVehicle.ShipID;
//      RecSend.mModeID             := 0;
//      RecSend.mAutoCorrectElev    := aLow;
//      RecSend.mAutoCorrectBearing := bearing;
//
//      RecSend.mBalistikID         := 0;
//      RecSend.mSalvoRate          := 30;
//
//
//      RecSend.mOrderID := __ORD_CANNON_ASSIGNED;
//      FCCManager.NetSendTo3D_OrderCannon(RecSend);
//    end
//    else if (aLow >= 350 )then
//    begin
//      alow := FMod(alow, 360);
//      if alow < 0 then
//        alow := alow + 360;
//
//      RecSend.ShipID          := FCCManager.ShipID;
//      RecSend.mWeaponID       := FCCManager.AssignedWeapon.IDWeapon;
//      RecSend.mLauncherID     := 0;
//      RecSend.mMissileID      := 0;
//      RecSend.mMissileNumber  := 0;
//      RecSend.mOrderID        := 0;
//
//      RecSend.mUpDown             := 0;
//      RecSend.mTargetID           := FCCManager.SelectedVehicle.ShipID;
//      RecSend.mModeID             := 0;
//      RecSend.mAutoCorrectElev    := alow;
//      RecSend.mAutoCorrectBearing := bearing;
//
//      RecSend.mBalistikID         := 0;
//      RecSend.mSalvoRate          := 30;
//
//
//      RecSend.mOrderID := __ORD_CANNON_ASSIGNED;
//      FCCManager.NetSendTo3D_OrderCannon(RecSend);
//    end;

  if not FSelectedVehicleState then
  begin
    begin
//    edtRAzimuthVal.Text := '-';
////    lblTgtDistance.Caption := rangem.ToString();
//    edtElevationVal.Text := '-';
//    edtRDRangeVal.Text := '-';
//    edtLSRangeVal.Text := '-';
////    lblTgtCourse.Caption := '...';
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
  RecSend: TrecData_MeriamFCC;
begin
  BeginGame_FCC;
  FCCManager := TFCCManager.Create;
  SimCenter := FCCManager;
  FCCManager.OnPtkCommand := ptkCommand;
  FCCManager.initEvent;

  FNorthAngle := 0;
  FMapCanvas := TCanvas.Create;
  FMapConverter := TMapXUnitConverter.Create;
  FIndexRange := 3;
  FCurrentRange := CRangeOperation[3];

  VehicleMgr := TVehicleManager.Create;
  VehicleMgr.CoordConverter := FMapConverter; // converter MapX kamu

  InitializeForm;

  FShipHeading := 0; // awal
  FisAutomatic := False;
  FisIRWFOV := True;
  FisSurfaceType := True;

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

    end;
    FCCManager.Env_Map := DataModule1.GetMapById(FCCManager.CurrentScenID);

  end;

  FCCManager.Get730WeaponAssigned;

  FCCManager.Running := True;

  rgnOuter := CreateRectRgn(0,0,Width,Height);
  rgnInner := CreateRectRgn(0, 0, 1280, 450);

  CombineRgn(rgnOuter, rgnOuter, rgnInner, RGN_DIFF);
  SetWindowRgn(Handle, rgnOuter, True);

//  rgnOuter := CreateRectRgn(0,0,Width,Height);
//  rgnInner := CreateRectRgn(640, 0, 1280, 480);
//
//  CombineRgn(rgnOuter, rgnOuter, rgnInner, RGN_DIFF);
//  SetWindowRgn(Handle, rgnOuter, True);

  NLDJoystick1.Active := True;



//  ZeroMemory(@ExecInfo, SizeOf(ExecInfo));
//  ExecInfo.cbSize := SizeOf(ExecInfo);
//  ExecInfo.fMask := SEE_MASK_NOCLOSEPROCESS; // <-- penting!
//  ExecInfo.Wnd := Handle;
//  ExecInfo.lpVerb := 'open';
//  ExecInfo.lpFile := PChar('Viewer.exe');
//  ExecInfo.nShow := SW_SHOW;
//
//  if not ShellExecuteEx(@ExecInfo) then
//    RaiseLastOSError;

  ZeroMemory(@ExecPTK, SizeOf(ExecPTK));
  ExecPTK.cbSize := SizeOf(ExecInfo);
  ExecPTK.fMask := SEE_MASK_NOCLOSEPROCESS; // <-- penting!
  ExecPTK.Wnd := Handle;
  ExecPTK.lpVerb := 'open';
  ExecPTK.lpFile := PChar('PTK_EOTracker730.exe');
  ExecPTK.nShow := SW_SHOW;

  ShellExecuteEx(@ExecPTK);
//  if not ShellExecuteEx(@ExecPTK) then
//    RaiseLastOSError;

  setting:= TFile.ReadAllText('settings.json', TEncoding.UTF8); // load json
  TgoBsonSerializer.Deserialize(setting, config);
  config.Video := FCCManager.ShipID.ToString() + '_' + FCCManager.AssignedWeapon.IDWeapon.ToString() + '_1';
  // tambahkan kodingan untuk mengganti config.Host, config.Video, config.PosX, config.PosY, config.Width, config.Height
  // untuk testing awal tidak perlu diubah dulu
  TgoBsonSerializer.Serialize(config, setting);
  tfile.WriteAllText('settings.json', setting, TEncoding.UTF8); // save json before launch

  setting:= TFile.ReadAllText('settingsIR.json', TEncoding.UTF8); // load json
  TgoBsonSerializer.Deserialize(setting, config);
  config.Video := FCCManager.ShipID.ToString() + '_' + FCCManager.AssignedWeapon.IDWeapon.ToString() + '_IR_1';
  // tambahkan kodingan untuk mengganti config.Host, config.Video, config.PosX, config.PosY, config.Width, config.Height
  // untuk testing awal tidak perlu diubah dulu
  TgoBsonSerializer.Serialize(config, setting);
  tfile.WriteAllText('settingsIR.json', setting, TEncoding.UTF8); // save json before launch

  ZeroMemory(@ExecInfoIR, SizeOf(ExecInfoIR));
  ExecInfoIR.cbSize := SizeOf(ExecInfo);
  ExecInfoIR.fMask := SEE_MASK_NOCLOSEPROCESS; // <-- penting!
  ExecInfoIR.Wnd := Handle;
  ExecInfoIR.lpVerb := 'open';
  ExecInfoIR.lpFile := PChar('Viewer.exe');
  ExecInfoIR.nShow := SW_SHOW;

  ShellExecuteEx(@ExecInfoIR);
//  if not ShellExecuteEx(@ExecInfoIR) then
//    RaiseLastOSError;

  // init ke 3D bahwa EO sudah menyala
  RecSend.ShipID := FCCManager.ShipID;
  RecSend.Range := 0;
  RecSend.Bearing := 0;
  RecSend.Elevation := 0;
  RecSend.EOBearing := 0;
  RecSend.EOElevation := 0;
  RecSend.IDTarget3D := 0;
  RecSend.IDTarget2D := 0;
  RecSend.EnableValue := false;

  RecSend.OrderID := CORD_ID_InitFCC;
  FCCManager.NetSendTo3D_FCCSet(RecSend);
end;

procedure TfrmMainFCC.FormDestroy(Sender: TObject);
var
  i : Integer;
begin
  if vFccSetting.FccMode <> 4 then
  begin
//    TerminateProcess(ExecInfo.hProcess, 0);
//    CloseHandle(ExecInfo.hProcess);
//    ExecInfo.hProcess := 0;

    TerminateProcess(ExecPTK.hProcess, 0);
    CloseHandle(ExecPTK.hProcess);
    ExecPTK.hProcess := 0;

    TerminateProcess(ExecInfoIR.hProcess, 0);
    CloseHandle(ExecInfoIR.hProcess);
    ExecInfoIR.hProcess := 0;
  end;

//  FRangeRing.Free;
  VehicleMgr.Free;
  FCCManager.FinalizeSimulation;

  BitMapLampGrey.Free;
  BitMapLampGreen.Free;
  BitMapLampRed.Free;

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
  RecSend: TrecData_MeriamFCC;
  RecSendCam: TRec_CameraController;
begin
  Token := ExtractToken(BtnName);

  if Token = '' then Exit;

  if Token = 'CalSetting' then
  //    pnlCalSetting.BringToFront
  else if Token = 'Cancel' then
  //    pnlIndWth.BringToFront;
  else if Token = 'Diagnosis' then
  begin
    FisDiagnonisOpen := not FisDiagnonisOpen;
    if FisDiagnonisOpen then pnlDiagnosis.BringToFront

    else  pnlDiagnosis.SendToBack

  end

  else if Token = 'Automatic' then
  begin
    // kirim automatic disini ke 3D
    FisAutomatic := not FisAutomatic;

    RecSend.ShipID := FCCManager.ShipID;
    RecSend.Range := 0;
    RecSend.Bearing := 0;
    RecSend.Elevation := 0;
    RecSend.EOBearing := 0;
    RecSend.EOElevation := 0;
    RecSend.IDTarget3D := 0;
    RecSend.IDTarget2D := 0;
    RecSend.TargetType := 0;

    RecSend.OrderID := CORD_ID_AutoSearch;
    RecSend.EnableValue := FisAutomatic;

    FCCManager.NetSendTo3D_FCCSet(RecSend);

    if FisAutomatic then edtControlTrackVal.Text := 'Automatic'
    else edtControlTrackVal.Text := 'Manual';

  end

  else if Token = 'Air' then
  begin
    FisSurfaceType := not FisSurfaceType;

    RecSend.ShipID := FCCManager.ShipID;
    RecSend.Range := 0;
    RecSend.Bearing := 0;
    RecSend.Elevation := 0;
    RecSend.EOBearing := 0;
    RecSend.EOElevation := 0;
    RecSend.IDTarget3D := 0;
    RecSend.IDTarget2D := 0;
    RecSend.EnableValue := false;

    RecSend.OrderID := CORD_ID_TargetType;

    if FisSurfaceType then RecSend.TargetType := 0
    else RecSend.TargetType := 1;

    FCCManager.NetSendTo3D_FCCSet(RecSend);
  end

  else if Token = 'TVFOVPlus' then
  begin
    RecSendCam.cmd := __ORD_ID_CAMCON_FOV_Plus;
    RecSendCam.valueInt := 0;
    RecSendCam.valueStr := IntToStr(FCCManager.ShipID) + '_' + IntToStr(FCCManager.AssignedWeapon.IDWeapon);

    FCCManager.NetSendTo3D_OrderCameraControl(RecSendCam);
  end

  else if Token = 'TVFOVMinus' then
  begin
    RecSendCam.cmd := __ORD_ID_CAMCON_FOV_Minus;
    RecSendCam.valueInt := 0;
    RecSendCam.valueStr := IntToStr(FCCManager.ShipID) + '_' + IntToStr(FCCManager.AssignedWeapon.IDWeapon);

    FCCManager.NetSendTo3D_OrderCameraControl(RecSendCam);
  end

  else if Token = 'TVNFOV' then
  begin
    RecSendCam.cmd := __ORD_ID_CAMCON_TV_NFOV;
    RecSendCam.valueInt := 0;
    RecSendCam.valueStr := IntToStr(FCCManager.ShipID) + '_' + IntToStr(FCCManager.AssignedWeapon.IDWeapon);

    FCCManager.NetSendTo3D_OrderCameraControl(RecSendCam);
  end

  else if Token = 'IRWFOV' then
  begin
    FisIRWFOV := not FisIRWFOV;

    if FisIRWFOV then RecSendCam.cmd := __ORD_ID_CAMCON_IR_WFOV
    else RecSendCam.cmd := __ORD_ID_CAMCON_IR_NFOV;

    RecSendCam.valueInt := 0;
    RecSendCam.valueStr := IntToStr(FCCManager.ShipID) + '_' + IntToStr(FCCManager.AssignedWeapon.IDWeapon) + '_IR';

    FCCManager.NetSendTo3D_OrderCameraControl(RecSendCam);
  end


  else if Token = 'IndSetting' then
  begin
    pnlSetIndication.SendToBack;
    if edtSetIndTypeVal.Text = '0' then
      edtIndTypeVal.Text := 'None'
    else if edtSetIndTypeVal.Text = '1' then
      edtIndTypeVal.Text := 'Indication A'
    else if edtSetIndTypeVal.Text = '2' then
      edtIndTypeVal.Text := 'Indication B';

    edtIndDistanceVal.Text := edtSetIndRangeVal.Text;
    edtIndAzimuthVal.Text := edtSetIndBEVal.Text;
    edtIndElevVal.Text := edtSetIndELVal.Text;
  end

  else if Token = 'IndOK' then
  begin
    pnlSetIndication.BringToFront;
  end

  else if Token = 'AngleCorrection' then
  begin
    pnlRevise.SendToBack;
  end

  else if Token = 'Correct' then
  begin
    pnlRevise.BringToFront;
  end;

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
  BitMapLampGrey := TBitmap.Create;
  BitMapLampGreen := TBitmap.Create;
  BitMapLampRed := TBitmap.Create;
  imgListLight.GetBitmap(0, BitMapLampGrey);
  imgListLight.GetBitmap(1, BitMapLampGreen);
  imgListLight.GetBitmap(2, BitMapLampRed);

  imgNavState.Picture.Bitmap := BitMapLampGreen;

end;


function TfrmMainFCC.MeterHeight: Integer;
begin
//  Result := (FMap.Height div 2);
end;

function TfrmMainFCC.MeterWidth: Integer;
begin
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

  if FCCManager.Operating_Mode = omWait then Exit;

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
//  if Assigned(FCCManager.SelectedVehicleID) then
//  begin
//    range := CalcRange(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, FCCManager.SelectedVehicleID.PosX, FCCManager.SelectedVehicleID.PosY);
//    rangem := range * C_NauticalMile_To_Metre;
//    bearing := CalcBearing(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, FCCManager.SelectedVehicleID.PosX, FCCManager.SelectedVehicleID.PosY);
//    // range = 3000 m, target lebih rendah 25 m
//    ComputeBallisticAngleVacuum(rangem, FCCManager.SelectedVehicleID.PosZ, 800, aLow, aHigh);
//
//    RecSend.ShipID          := FCCManager.ShipID;
//    RecSend.mWeaponID       := FCCManager.AssignedWeapon.IDWeapon;
//    RecSend.mLauncherID     := 0;
//    RecSend.mMissileID      := 0;
//    RecSend.mMissileNumber  := 0;
//    RecSend.mOrderID        := 0;
//
//    RecSend.mUpDown             := 0;
//    RecSend.mTargetID           := FCCManager.SelectedVehicleID.ShipID;;
//    RecSend.mModeID             := 0;
//    RecSend.mAutoCorrectElev    := aLow;
//    RecSend.mAutoCorrectBearing := bearing;
//
//    RecSend.mBalistikID         := 0;
//    RecSend.mSalvoRate          := 30;
//
////    FCCManager.SelectedVehicle.
//
//
//    RecSend.mOrderID := __ORD_CANNON_START_F;
//    FCCManager.NetSendTo3D_OrderCannon(RecSend);
//
//    Sleep(1000);
//
//    RecSend.ShipID          := FCCManager.ShipID;
//    RecSend.mWeaponID       := FCCManager.AssignedWeapon.IDWeapon;
//    RecSend.mLauncherID     := 0;
//    RecSend.mMissileID      := 0;
//    RecSend.mMissileNumber  := 0;
//    RecSend.mOrderID        := 0;
//
//    RecSend.mUpDown             := 0;
//    RecSend.mTargetID           := FCCManager.SelectedVehicleID.ShipID;;
//    RecSend.mModeID             := 0;
//    RecSend.mAutoCorrectElev    := aLow;
//    RecSend.mAutoCorrectBearing := bearing;
//
//    RecSend.mBalistikID         := 0;
//    RecSend.mSalvoRate          := 30;
//
//
//    RecSend.mOrderID := __ORD_CANNON_STOP_F;
//    FCCManager.NetSendTo3D_OrderCannon(RecSend);
//  end;
end;

procedure TfrmMainFCC.pnlMapRangeClick(Sender: TObject);
begin
  ResetColorRange;
  TPanel(Sender).Color := clYellow;

  Self.FIndexRange := TPanel(Sender).Tag;
  self.FCurrentRange := CRangeOperation[TPanel(Sender).Tag];
//  lblRange.Caption := Format('%2.2f', [FCurrentRange * C_Meter_To_NauticalMile]);
end;

procedure TfrmMainFCC.ptkCommand(const str: string);
begin
  HandleKeyByBtnName(str);
end;

procedure TfrmMainFCC.ResetColorRange;
begin
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

procedure TfrmMainFCC.ShowInfoCursor(const x, y: integer);
var
  mx, my: double;
  sx, sy: single;
  z: double;
  s: string;
begin
  sx := x;
  sy := y;

//  lblLongtitude.Caption := FormatFloat('0.000', mx);
//  lblLatitude.Caption := FormatFloat('0.000', my);
end;

procedure TfrmMainFCC.TimerBeElTimer(Sender: TObject);
begin
  FBEVal := FCCManager.EOBearing;
  if FBEVal > 180 then FBEVal := FBEVal - 360;

  vrAngularBearing.Position := FBEVal;
  lblValBearTop.Caption := 'BE ' + FormatFloat('0.00', FBEVal);
  pnlValBearingBottom.Caption := 'BE:     ' + FormatFloat('0.00', FBEVal) + ' deg';

  FELVal := FCCManager.EOElevation;
  vrAngularElev.Position := -FELVal;
  lblValElevTop.Caption := 'EL ' + FormatFloat('0.00', FELVal);
  pnlValElevBottom.Caption := 'EL:     ' + FormatFloat('0.00', FELVal) + ' deg';

//  if FisKanan then
//  begin
//    FBEVal := FBEVal + 0.1;
//    if FBEVal > 180 then FBEVal := FBEVal - 360;
//
//    vrAngularBearing.Position := FBEVal;
//    lblValBearTop.Caption := 'BE ' + FormatFloat('0.00', FBEVal);
//    pnlValBearingBottom.Caption := 'BE:     ' + FormatFloat('0.00', FBEVal) + ' deg';
//  end
//  else if FisKiri then
//  begin
//    FBEVal := FBEVal - 0.1;
//    if FBEVal < -180 then FBEVal := FBEVal + 360;
//    vrAngularBearing.Position := FBEVal;
//    lblValBearTop.Caption := 'BE ' + FormatFloat('0.00', FBEVal);
//    pnlValBearingBottom.Caption := 'BE:     ' + FormatFloat('0.00', FBEVal) + ' deg';
//  end;
//
//  if FisAtas then
//  begin
//    FELVal := FELVal + 0.1;
//    vrAngularElev.Position := -FELVal;
//    lblValElevTop.Caption := 'EL ' + FormatFloat('0.00', FELVal);
//    pnlValElevBottom.Caption := 'EL:     ' + FormatFloat('0.00', FELVal) + ' deg';
//  end
//  else if FisBawah then
//  begin
//    FELVal := FELVal - 0.1;
//    vrAngularElev.Position := -FELVal;
//    lblValElevTop.Caption := 'EL ' + FormatFloat('0.00', FELVal);
//    pnlValElevBottom.Caption := 'EL:     ' + FormatFloat('0.00', FELVal) + ' deg';
//  end;
end;

procedure TfrmMainFCC.tmrUpdateFormTimer(Sender: TObject);
var
duration : TDateTime;
azimuth, range, rangem: Double;
v : TVehicle;
begin
//  if FNorthAngle < 360 then
//    Inc(FNorthAngle)
//  else
//    FNorthAngle := 0;



  duration := Now - FStartTime;
//  lblRunTimeVal.Caption := FormatDateTime('hh:nn:ss', duration);
//
//  lblSystemTimeVal.Caption := FormatDateTime('hh:nn:ss',now);

  lblTimeNow.Caption := FormatDateTime('hh:nn:ss',now);
  lblDateNow.Caption := FormatDateTime('yyyy/mm/dd',now);

//  lblBiteTimeSystemValue.Caption := FormatDateTime('hh:nn:ss',now);

  if Assigned(FCCManager) then
  begin
    FOperatingMode := FCCManager.Operating_Mode;
    case FOperatingMode of
      omWait :
      begin
        edtCtlModeVal.Text := 'Local';
        edtWorkStateVal.Text := 'Wait';
      end;
      omInd :
      begin
        edtCtlModeVal.Text := 'Remote';
//        edtWorkStateVal.Text := 'Ind';
      end;
      omAutonomous :
      begin
        edtCtlModeVal.Text := 'Local';
//        edtWorkStateVal.Text := 'Track';
      end;
      omDAttack :
      begin
        edtCtlModeVal.Text := 'Local';
      end;
      omVFire :
      begin
        edtCtlModeVal.Text := 'Local';
      end;
    end;

    if (FOperatingMode = omInd) or (FOperatingMode = omAutonomous) then
    begin
      if FCCManager.target2d <> 0  then
      begin
//        edtTrackStateVal.Text := 'Tracking';
        if FCCManager.SelectedVehicleID <> 0 then
        begin
          v := VehicleMgr.FindObjectByUid(dbID_to_UniqueID(FCCManager.SelectedVehicleID));
          range := CalcRange(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, v.PosX, v.PosY);
          rangem := range * C_NauticalMile_To_Metre;

          edtIndDistanceVal.Text := FormatFloat('0.00', rangem);
          edtEODistanceVal.Text := FormatFloat('0.00', rangem);

          if FCCManager.TargetType = ttSurface then edtIndTypeVal.Text := 'Surface'
          else if FCCManager.TargetType = ttAir then edtIndTypeVal.Text := 'Air'
          else edtIndTypeVal.Text := 'None';
        end;

      end
      else
      begin
        edtIndDistanceVal.Text := '0.00';
        edtEODistanceVal.Text := '0.00';
//        edtTrackStateVal.Text := 'Lost';
      end;
    end;


    if Assigned(FCCManager.xShip) then
    begin
      edtNavCourseVal.Text := FormatFloat('0.00', FCCManager.xShip.Heading);
      
      azimuth := FCCManager.xShip.Heading + FCCManager.EOBearing;
      if azimuth >= 360 then azimuth := azimuth - 360;

      edtIndAzimuthVal.Text := FormatFloat('0.00', azimuth);
      edtIndElevVal.Text := FormatFloat('0.00', FCCManager.EOElevation);
      
//      edtNavDataLAT.Text := FormatFloat('0.000000', FCCManager.xShip.PositionY);
//      edtNavDataLON.Text := FormatFloat('0.000000', FCCManager.xShip.PositionX);

      if not FCCManager.IsTrueMotion then begin
      //    FMap.Rotation := 0;
        FNorthAngle := 0;
      end
      else
      begin
        FNorthAngle := -FCCManager.xShip.Heading;;
      //    FMap.Rotation := -FCCManager.xShip.Heading;
      end;
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
  range,rangem, bearing : Double;
  v : tvehicle;
begin
  if FCCManager.SelectedVehicleID <> 0 then
  begin
    v := VehicleMgr.FindObjectByUid(dbID_to_UniqueID(FCCManager.SelectedVehicleID));
    range := CalcRange(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, v.PosX, v.PosY);
    rangem := range * C_NauticalMile_To_Metre;
    bearing := CalcBearing(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, v.PosX, v.PosY);
    // range = 3000 m, target lebih rendah 25 m
    ComputeBallisticAngleVacuum(rangem, v.PosZ, 800, aLow, aHigh);

//    edtRDRangeVal.Text := format('%.2f', [rangem]);
//    edtRadarGate.Text := format('%.2f', [rangem]);
//    edtRAzimuthVal.Text := format('%.2f', [bearing]);
//    edtElevationVal.Text := format('%.2f', [CalcElevation(rangem, 15, fccmanager.SelectedVehicle.PosZ)]);

//    edtIDTargetVal.Text := UniqueID_To_dbID(FCCManager.SelectedVehicle.UniqueID).ToString();
//    edtSpeedINDVal.Text := (FCCManager.SelectedVehicle.Speed_mps * 1.944).ToString;
//    edtHeadingINDVal.Text := FCCManager.SelectedVehicle.HeadingDeg.ToString;
  end;
end;

end.
