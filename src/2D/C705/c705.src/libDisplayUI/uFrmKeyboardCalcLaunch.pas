unit uFrmKeyboardCalcLaunch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, uTCPDatatype, uLibSettings, uC705SimManager;

type
  TfrmKeyboardCalcLaunch = class(TForm)
    {$REGION 'Components'}
    imgMissCont: TImage;
    imgExit: TImage;
    imgParSetting: TImage;
    imgLaunchDat: TImage;
    imgMissInfo: TImage;
    imgInsTest: TImage;
    imgFireDist: TImage;
    imgMissMon: TImage;
    imgChanSelect: TImage;
    imgSituation: TImage;
    imgSpare: TImage;
    Image12: TImage;
    imgMinus: TImage;
    img0: TImage;
    imgPlus: TImage;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    img6: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    img7: TImage;
    img8: TImage;
    img9: TImage;
    imgTab: TImage;
    imgBackSp: TImage;
    imgEsc: TImage;
    imgEnter: TImage;
    imgArrowUp: TImage;
    imgArrowDown: TImage;
    imgArrowLeft: TImage;
    imgArrowRight: TImage;
    Panel1: TPanel;
    imgLaunch2: TImage;
    imgLaunch1: TImage;
    imgCancel2: TImage;
    imgCancel1: TImage;
    Image40: TImage;
    Image41: TImage;
    Image42: TImage;
    Image43: TImage;
    Image44: TImage;
    Image45: TImage;
    lblCancelLaunch: TLabel;
    lblLaunch: TLabel;
    Panel2: TPanel;
    imgBtnComp: TImage;
    Label3: TLabel;
    imgBtnFan: TImage;
    Label4: TLabel;
    imgBtnVolt: TImage;
    Label5: TLabel;
    imgBtnReset: TImage;
    Label6: TLabel;
    {$ENDREGION}
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgLaunchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetMonitor(aMonitorIdx, aLeft, aTop: Integer);
  end;

var
  frmKeyboardCalcLaunch: TfrmKeyboardCalcLaunch;


implementation

uses
  UfrmRoutePlan;

{$R *.dfm}

procedure TfrmKeyboardCalcLaunch.FormCreate(Sender: TObject);
begin
  //
end;

procedure TfrmKeyboardCalcLaunch.FormShow(Sender: TObject);
begin
  //
end;

procedure TfrmKeyboardCalcLaunch.imgLaunchClick(Sender: TObject);
var
recDataC705 : TRec_Data_C705;
begin
  //
//  frmRoutePlan.FSelectedBearing
  recDataC705.ShipID := VOwnShip.ShipID;
  recDataC705.mWeaponID := VOwnShip.WeaponId;
  recDataC705.mLauncherID := (Sender as TImage).Tag;
  recDataC705.mMissileID := 1;
  recDataC705.mMissileNumber := 0;
  recDataC705.OrderID := 0; // harusnya diganti per command, misal fire, atau yang lain
  recDataC705.mTargetBearing := frmRoutePlan.FSelectedBearing;
  recDataC705.mTargetRange := frmRoutePlan.FSelectedRange;
  recDataC705.mTargetId := 0;

  SimManager.netNFS_OnSendDataC705(recDataC705);

end;

procedure TfrmKeyboardCalcLaunch.SetMonitor(aMonitorIdx, aLeft, aTop: Integer);
begin
  Left := Screen.Monitors[aMonitorIdx].WorkareaRect.Left + aLeft;
  Top := Screen.Monitors[aMonitorIdx].WorkareaRect.Top + aTop + 1100;
end;

end.
