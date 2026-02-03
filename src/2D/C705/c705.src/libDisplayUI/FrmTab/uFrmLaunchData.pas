unit uFrmLaunchData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmLaunchData = class(TForm)
  {$REGION 'Components'}
    pnlLaunchDataHeader: TPanel;
    Label1: TLabel;
    edtInputMissileNumLD: TEdit;
    Panel1: TPanel;
    pnlLeft1: TPanel;
    pnlMid1: TPanel;
    pnl_Row1_L1: TPanel;
    Panel2: TPanel;
    Label40: TLabel;
    pnlMissileNum: TPanel;
    lblMissileNumVal: TLabel;
    pnl_Row2_L1: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    pnlLockTime: TPanel;
    lblLockTime: TLabel;
    pnl_Row3_L1: TPanel;
    Panel6: TPanel;
    Label3: TLabel;
    pnlTType: TPanel;
    lblTTypeVal: TLabel;
    pnl_Row4_L1: TPanel;
    Panel7: TPanel;
    Label4: TLabel;
    pnlTNumber: TPanel;
    lblTNumberVal: TLabel;
    pnl_Row5_L1: TPanel;
    Panel8: TPanel;
    Label5: TLabel;
    pnlTLong1: TPanel;
    lblTLongVal1: TLabel;
    pnl_Row1_M1: TPanel;
    Panel4: TPanel;
    Label6: TLabel;
    pnlTLat: TPanel;
    pnl_Row2_M1: TPanel;
    Panel11: TPanel;
    Label8: TLabel;
    pnlTRng: TPanel;
    pnl_Row3_M1: TPanel;
    Panel14: TPanel;
    Label10: TLabel;
    pnlTAzmVal: TPanel;
    pnl_Row4_M1: TPanel;
    Panel17: TPanel;
    Label12: TLabel;
    pnlTHgtVal: TPanel;
    lblTHgtVal: TLabel;
    pnl_Row5_M1: TPanel;
    Panel20: TPanel;
    Label14: TLabel;
    pnlAttackA: TPanel;
    lblTLatVal: TLabel;
    lblTRngVal: TLabel;
    lblTAzmVal: TLabel;
    lblAttackAVal: TLabel;
    pnlRight1: TPanel;
    pnl_Row1_R1: TPanel;
    Panel10: TPanel;
    Label7: TLabel;
    pnlSLong: TPanel;
    lblSLongVal: TLabel;
    pnl_Row2_R1: TPanel;
    Panel15: TPanel;
    Label11: TLabel;
    pnlSLat: TPanel;
    lblSLatVal: TLabel;
    pnl_Row3_R1: TPanel;
    Panel19: TPanel;
    Label15: TLabel;
    pnlSPitch: TPanel;
    lblSPitchVal: TLabel;
    pnl_Row4_R1: TPanel;
    Panel23: TPanel;
    Label17: TLabel;
    pnlSRoll: TPanel;
    lblSRollVal: TLabel;
    pnl_Row5_R1: TPanel;
    Panel22: TPanel;
    Label19: TLabel;
    pnlSHdg: TPanel;
    lblSHdgVal: TLabel;
    Panel3: TPanel;
    pnlLeft2: TPanel;
    pnl_Row1_L2: TPanel;
    Panel13: TPanel;
    Label9: TLabel;
    pnlTLong2: TPanel;
    pnl_Row2_L2: TPanel;
    Panel21: TPanel;
    Label16: TLabel;
    pnlTLat2: TPanel;
    pnl_Row3_L2: TPanel;
    Panel26: TPanel;
    Label20: TLabel;
    pnlRange1: TPanel;
    pnl_Row4_L2: TPanel;
    Panel29: TPanel;
    Label22: TLabel;
    pnlRange2: TPanel;
    pnl_Row5_L2: TPanel;
    Panel32: TPanel;
    Label24: TLabel;
    pnlPointNumber: TPanel;
    pnlMid2: TPanel;
    Panel35: TPanel;
    pnl_Row1_M2: TPanel;
    Label26: TLabel;
    pnlP1Long: TPanel;
    lblP1LongVal: TLabel;
    pnl_Row2_M2: TPanel;
    Panel39: TPanel;
    Label28: TLabel;
    pnlP1Lat: TPanel;
    lblP1LatVal: TLabel;
    pnl_Row3_M2: TPanel;
    Panel42: TPanel;
    Label30: TLabel;
    pnlP2Long: TPanel;
    lblP2LongVal: TLabel;
    pnl_Row4_M2: TPanel;
    Panel45: TPanel;
    Label32: TLabel;
    pnlP2Lat: TPanel;
    pnl_Row5_M2: TPanel;
    Panel48: TPanel;
    Label34: TLabel;
    pnlP3Long: TPanel;
    lblP3LongVal: TLabel;
    pnlRight2: TPanel;
    pnl_Row1_R2: TPanel;
    Panel52: TPanel;
    Label36: TLabel;
    pnlP3Lat: TPanel;
    lblP3LatVal: TLabel;
    pnl_Row2_R2: TPanel;
    Panel55: TPanel;
    Label38: TLabel;
    pnlSearchState: TPanel;
    lblSearchStateVal: TLabel;
    pnl_Row3_R2: TPanel;
    Panel58: TPanel;
    Label41: TLabel;
    pnllCaptureMode: TPanel;
    pnl_Row4_R2: TPanel;
    Panel61: TPanel;
    Label43: TLabel;
    pnlSearchRng: TPanel;
    lblTLongVal2: TLabel;
    lblTLatVal2: TLabel;
    lblRange1Val: TLabel;
    lblRange2Val: TLabel;
    lblPointNumberVal: TLabel;
    lblP2LatVal: TLabel;
    lblCaptureModeVal: TLabel;
    lblSearchRngVal: TLabel;
    Panel9: TPanel;
    Panel12: TPanel;
    Panel16: TPanel;
  {$ENDREGION}
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLaunchData: TfrmLaunchData;

implementation

{$R *.dfm}

procedure TfrmLaunchData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmLaunchData.FormCreate(Sender: TObject);
begin
  Align := alClient;
end;

procedure TfrmLaunchData.FormShow(Sender: TObject);
begin
//
end;

end.
