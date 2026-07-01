unit ufrmTorpedoTubeStatusWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

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
    imgStatusTorpedo2: TImage;
    lblNumber2: TLabel;
    imgStatusTorpedo1: TImage;
    lblNumber1: TLabel;
    imgStatusTorpedo4: TImage;
    imgStatusTorpedo3: TImage;
    imgStatusTorpedo6: TImage;
    imgStatusTorpedo5: TImage;
    imgStatusTorpedo8: TImage;
    imgStatusTorpedo7: TImage;
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
    pnlStatusTorpedo2: TPanel;
    imgTorpedo2: TImage;
    lblActiveToSo2: TLabel;
    lblFuse2: TLabel;
    lblNumberTorpedo2: TLabel;
    lblValueTorpedo2: TLabel;
    pnlNumber2: TPanel;
    pnlStatusTorpedo1: TPanel;
    lblActiveToSo1: TLabel;
    lblValueTorpedo1: TLabel;
    lblNumberTorpedo1: TLabel;
    lblFuse1: TLabel;
    imgTorpedo1: TImage;
    pnlNumber1: TPanel;
    pnlStatusTorpedo3: TPanel;
    imgTorpedo3: TImage;
    lblActiveToSo3: TLabel;
    lblFuse3: TLabel;
    lblNumberTorpedo3: TLabel;
    lblValueTorpedo3: TLabel;
    pnlNumber3: TPanel;
    pnlStatusTorpedo4: TPanel;
    imgTorpedo4: TImage;
    lblActiveToSo4: TLabel;
    lblFuse4: TLabel;
    lblNumberTorpedo4: TLabel;
    lblValueTorpedo4: TLabel;
    pnlNumber4: TPanel;
    pnlStatusTorpedo5: TPanel;
    imgTorpedo5: TImage;
    lblActiveToSo5: TLabel;
    lblFuse5: TLabel;
    lblNumberTorpedo5: TLabel;
    lblValueTorpedo5: TLabel;
    pnlNumber5: TPanel;
    pnlStatusTorpedo6: TPanel;
    imgTorpedo6: TImage;
    lblActiveToSo6: TLabel;
    lblFuse6: TLabel;
    lblNumberTorpedo6: TLabel;
    lblValueTorpedo6: TLabel;
    pnlNumber6: TPanel;
    pnlStatusTorpedo7: TPanel;
    imgTorpedo7: TImage;
    lblActiveToSo7: TLabel;
    lblFuse7: TLabel;
    lblNumberTorpedo7: TLabel;
    lblValueTorpedo7: TLabel;
    pnlNumber7: TPanel;
    pnlStatusTorpedo8: TPanel;
    imgTorpedo8: TImage;
    lblActiveToSo8: TLabel;
    lblFuse8: TLabel;
    lblNumberTorpedo8: TLabel;
    lblValueTorpedo8: TLabel;
    pnlNumber8: TPanel;
    procedure lblTorpedo1Click(Sender: TObject);
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

procedure TfrmTorpedoTubeStatusWindow.lblTorpedo1Click(Sender: TObject);
begin
  lblTorpedo1.Caption := 'MSI-SRC-SA';
  UpdateImage;
end;

procedure TfrmTorpedoTubeStatusWindow.UpdateImage;
var
  Basepath, Filename : string;
begin
  Basepath := 'D:\NFS\P.NFS\bin\2D\data\images\blackshark\';

  if lblTorpedo1.Caption = 'TORP READY' then
     Filename := Basepath + 'Status1.bmp'
  else if lblTorpedo1.Caption = 'MSI-SRC-SA' then
     Filename := Basepath + 'Status2.bmp'
  else if lblTorpedo1.Caption = 'MAN-HORIZ' then
     Filename := Basepath + 'Status3.bmp';

  if FileExists(Filename) then
  begin
     imgTorpedo1.Picture.LoadFromFile(Filename);
     imgTorpedo1.Refresh;
  end
  else
    ShowMessage('File not found : ' + Filename);
end;

end.
