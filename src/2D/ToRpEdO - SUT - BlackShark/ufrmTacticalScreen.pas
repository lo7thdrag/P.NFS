unit ufrmTacticalScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  RzButton, RzRadChk, uSutBlacksharkManager, uVehicleManager,uSettingFormToMonitorWith_ini, uFormUtil,
  UfrmRadar,ufrmOwnShip, ufrmAlertandOpearatorMassage,ufmTargetInControl,

  ufrmTorpedoAllocation, ufrmSystemStatus, ufrmSystemInfo, ufrmCursor;

//const
//  MAX_TARGET = 50;

type

  TSonarTarget = record
    Bearing : Double;
    Speed   : Double;
    Strength : Integer;
  end;

  TFrmTacticalScreen = class(TForm)

    pnlBase: TPanel;
    pnlUpperInfo: TPanel;
    pnlOwnShip: TPanel;
    pnlAlert: TPanel;
    pnlSystemStatus: TPanel;
    pnlOperatorMessages: TPanel;
    pnlRight: TPanel;
    pnlSystemInfo: TPanel;
    pnlObjectInControl: TPanel;
    pnlToolArea: TPanel;
    pnlCursor: TPanel;
    pnlTPGroup: TPanel;
    pnlTacticalPicture: TPanel;
    tmrUpdateTP: TTimer;    procedure FormCreate(Sender: TObject);
    procedure tmrUpdateTPTimer(Sender: TObject);
  private
    BearingCount : Integer;
    FFrmRadar : TFrmRadar;

    FFrmOwnShipTS                  : TfrmOwnShip;
    FFrmAlertandOpearatorMassageTS : TfrmAlertsandOpearatorMassage;
    FFrmTargetInControlTS          : TfrmTargetInControl;
    FFrmSystemStatus      : TfrmSystemStatus;

    FFrmTorpedoAllocation : TfrmTorpedoAllocation;
    FFrmSystemInfo        : TfrmSystemInfo;
    FFrmCursor            : TfrmCursor;

    procedure UpdateRadarDisplay;
    procedure SetLayoutForm;
    procedure UpdateAttachFormDisplay;
    { Public declarations }
  end;

var
  frmTacticalScreen: TFrmTacticalScreen;

implementation

uses
  ufrmTorpedoWP;

{$R *.dfm}

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

procedure TFrmTacticalScreen.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  SetLayoutForm;
  UpdateAttachFormDisplay;
  frmTacticalScreen.DoubleBuffered := true;
//  pnlBase.DoubleBuffered := False;
//  pnlTPGroup.DoubleBuffered := False;
//  pnlTacticalPicture.DoubleBuffered := False;
end;

procedure TFrmTacticalScreen.SetLayoutForm;
var
  path : string;
  idxTactScreen, alTactScreen, xTactScreen, yTactScreen,
  idxTorpedoWP, alTorpedoWP, xTorpedoWP, yTorpedoWP,
  bdrPanelAtas,  bdrPanelBawah,  bdrTemp: Integer;
begin
   path := ExtractFilePath(Application.ExeName) + 'SetFormBlackSharkToMonitor.ini';

   Getsettingform(path, 'TACTICAL_SCREEN',  idxTactScreen,  alTactScreen,    xTactScreen,   yTactScreen);
   Getsettingform(path, 'TORPEDO_WP', idxTorpedoWP, alTorpedoWP,   xTorpedoWP,  yTorpedoWP);

// rojek
   AlignFormToMonitor(idxTactScreen, apLeftTop, xTactScreen, yTactScreen, TForm(frmTacticalScreen));
   AlignFormToMonitor(idxTorpedoWP, apLeftTop, xTorpedoWP, yTorpedoWP, TForm(frmTorpedoWP));
end;

procedure TFrmTacticalScreen.tmrUpdateTPTimer(Sender: TObject);
begin
  UpdateRadarDisplay;

  // get variable pada blackshark manager disini

end;

procedure TFrmTacticalScreen.UpdateAttachFormDisplay;
begin
  {$REGION 'Ownship Data'}
  if not Assigned(FFrmOwnShipTS) then
  begin
    FFrmOwnShipTS        := TfrmOwnShip.Create(Self);
    FFrmOwnShipTS.Parent := pnlOwnShip;
    FFrmOwnShipTS.Align  := alClient;
    FFrmOwnShipTS.Show;
  end;
  {$ENDREGION}

  {$REGION 'Alert and Operator Messages'}
  if not Assigned(FFrmAlertandOpearatorMassageTS) then
  begin
    FFrmAlertandOpearatorMassageTS        := TfrmAlertsandOpearatorMassage.Create(Self);
    FFrmAlertandOpearatorMassageTS.Parent := pnlAlert;
    FFrmAlertandOpearatorMassageTS.Align  := alClient;
    FFrmAlertandOpearatorMassageTS.Show;
  end;
  {$ENDREGION}

  {$REGION 'Target In Control'}
  if not Assigned(FFrmTargetInControltS) then
  begin
    FFrmTargetInControltS.Caption := '';

    FFrmTargetInControltS        := TfrmTargetInControl.Create(Self);
    FFrmTargetInControltS.Parent := pnlObjectInControl;
    FFrmTargetInControltS.Align  := alClient;
    FFrmTargetInControltS.Show;
  end;
  {$ENDREGION}

  {$REGION 'Cursor Position'}
  if not Assigned(FFrmCursor) then
  begin
    pnlCursor.Caption := '';

    FFrmCursor        := TfrmCursor.Create(Self);
    FFrmCursor.Parent := pnlCursor;
    FFrmCursor.Align  := alClient;
    FFrmCursor.Show;
  end;
  {$ENDREGION}
end;

procedure TFrmTacticalScreen.UpdateRadarDisplay;
begin
  if VehicleMgr.ObjectList <> nil then
  begin
    if not Assigned(FFrmRadar) then begin
      FFrmRadar := TfrmRadar.Create(Self);
      FFrmRadar.Parent := pnlTacticalPicture;
      FFrmRadar.Align := alClient;
      FFrmRadar.Show;
//      EnableComposited(pnlTacticalPicture);
    end;

    if SutBlacksharkManager.isTorpedoAllocShow then
    begin
      {$REGION 'Torpedo Allocation'}
      if not Assigned(FFrmTorpedoAllocation) then      // di create saat tombol TEP torp alloc
      begin
        FFrmTorpedoAllocation        := TfrmTorpedoAllocation.Create(Self);
        FFrmTorpedoAllocation.Parent := pnlToolArea;
        FFrmTorpedoAllocation.Align  := alClient;
        FFrmTorpedoAllocation.Show;
      end;
      {$ENDREGION}
    end
    else
    begin
      if Assigned(FFrmTorpedoAllocation) then
        FreeAndNil(FFrmTorpedoAllocation);
    end;

    {$REGION 'Torpedo Allocation'}
//    if not Assigned(FFrmTorpedoAllocation) then      // di create saat tombol TEP torp alloc
//    begin
//      FFrmTorpedoAllocation        := TfrmTorpedoAllocation.Create(Self);
//      FFrmTorpedoAllocation.Parent := pnlToolArea;
//      FFrmTorpedoAllocation.Align  := alClient;
//      FFrmTorpedoAllocation.Show;
//    end;
    {$ENDREGION}

    {$REGION 'System Status'}
    if not Assigned(FFrmSystemStatus) then
    begin
      pnlSystemStatus.Caption := '';

      FFrmSystemStatus        := TfrmSystemStatus.Create(Self);
      FFrmSystemStatus.Parent := pnlSystemStatus;
      FFrmSystemStatus.Align  := alClient;
      FFrmSystemStatus.Show;
    end;
    {$ENDREGION}

    {$REGION 'System Info'}
    if not Assigned(FFrmSystemInfo) then
    begin
      pnlSystemInfo.Caption := '';

      FFrmSystemInfo        := TfrmSystemInfo.Create(Self);
      FFrmSystemInfo.Parent := pnlSystemInfo;
      FFrmSystemInfo.Align  := alClient;
      FFrmSystemInfo.Show;
    end;
    {$ENDREGION}



    Exit;
  end;

end;

end.
