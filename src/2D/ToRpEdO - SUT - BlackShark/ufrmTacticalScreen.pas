unit ufrmTacticalScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  RzButton, RzRadChk, uSutBlacksharkManager,
  UfrmRadar, uVehicleManager;

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

    Exit;
  end;
end;

end.
