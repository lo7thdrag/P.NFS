unit ufrmSystemStatus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,

  uSutBlacksharkManager, uTorpedoLauncher;

type
  TfrmSystemStatus = class(TForm)
    pnlMain: TPanel;
    Label1: TLabel;
    imgMSI: TImage;
    Label2: TLabel;
    imgNAV: TImage;
    Label3: TLabel;
    Label4: TLabel;
    imgRad: TImage;
    imgRESM: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    imgPerisc: TImage;
    imgSonar: TImage;
    imgMast: TImage;
    imgLink: TImage;
    Label9: TLabel;
    imgWTSRC: TImage;
    Label10: TLabel;
    imgTBI: TImage;
    pnlStatus: TPanel;
    lblSystemMode: TLabel;
    Label11: TLabel;
    lblTorpedoMode: TLabel;
    Label13: TLabel;
    lblSimulationMode: TLabel;
    Label15: TLabel;
    lblFireAuthorization: TLabel;
    Label17: TLabel;
    lblConsole: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UpdateFireAuthorization;
  end;

var
  frmSystemStatus: TfrmSystemStatus;

implementation

{$R *.dfm}

procedure TfrmSystemStatus.FormCreate(Sender: TObject);
begin
  SutBlacksharkManager.InitializeSimulation;

  UpdateFireAuthorization;
end;

procedure TfrmSystemStatus.UpdateFireAuthorization;
begin
  if SutBlacksharkManager.FTBIFireAuth then
  begin
    lblFireAuthorization.Caption    :=  'ON';
    lblFireAuthorization.Font.Color := clLime;
  end
  else
  begin
    lblFireAuthorization.Caption    := 'OFF';
    lblFireAuthorization.Font.Color := clRed;
  end;

end;

end.
