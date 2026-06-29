unit ufrmTacticalScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  RzButton, RzRadChk, uSutBlacksharkManager,
  UfrmRadar, uVehicleManager,

  ufrmTorpedoAllocation, ufrmSystemStatus, ufrmSystemInfo;

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
    BearingCount          : Integer;
    FFrmRadar             : TFrmRadar;
    FFrmSystemStatus      : TfrmSystemStatus;
    FFrmTorpedoAllocation : TfrmTorpedoAllocation;
    FFrmSystemInfo        : TfrmSystemInfo;

    procedure UpdateRadarDisplay;
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

end;

procedure TFrmTacticalScreen.tmrUpdateTPTimer(Sender: TObject);
begin
  UpdateRadarDisplay;
end;

procedure TFrmTacticalScreen.UpdateRadarDisplay;
begin
  if VehicleMgr.ObjectList <> nil then
  begin
    if not Assigned(FFrmRadar) then begin
      EnableComposited(pnlTacticalPicture);

      FFrmRadar := TfrmRadar.Create(Self);
      FFrmRadar.Parent := pnlTacticalPicture;
      FFrmRadar.Align := alClient;
      FFrmRadar.Show;
    end;


    {$REGION 'Torpedo Allocation'}
    if not Assigned(FFrmTorpedoAllocation) then
    begin
      pnlToolArea.Caption := '';

      FFrmTorpedoAllocation        := TfrmTorpedoAllocation.Create(Self);
      FFrmTorpedoAllocation.Parent := pnlToolArea;
      FFrmTorpedoAllocation.Align  := alClient;
      FFrmTorpedoAllocation.Show;
    end;
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

    {$REGION 'System Status'}
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
