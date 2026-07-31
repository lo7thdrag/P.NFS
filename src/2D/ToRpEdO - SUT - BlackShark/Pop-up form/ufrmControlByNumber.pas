unit ufrmControlByNumber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, RzPanel,
  RzRadGrp, uSutBlacksharkManager, uVehicleManager;

type
  TfrmControlByNumber = class(TForm)
    pnlMain: TPanel;
    lblApply: TLabel;
    lblClose: TLabel;
    btnMSITNo: TRadioButton;
    btnLinkY: TRadioButton;
    edtTrackNo: TEdit;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    pnlMSITNo: TPanel;
    pnlLinkYTNo: TPanel;
    pnlTrackNo: TPanel;
    procedure lblCloseClick(Sender: TObject);
    procedure edtTrackNoChange(Sender: TObject);
    procedure lblApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtTrackNoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FApplyBtnEnable : Boolean;
  public
    { Public declarations }
  end;

var
  frmControlByNumber: TfrmControlByNumber;

implementation

{$R *.dfm}

procedure TfrmControlByNumber.edtTrackNoChange(Sender: TObject);
begin
  if edtTrackNo.Text = '' then
  begin
    lblApply.Font.Color := clGray;
    FApplyBtnEnable := false;
  end
  else
  begin
    lblApply.Font.Color := clWhite;
    FApplyBtnEnable := true;
  end;
end;

procedure TfrmControlByNumber.edtTrackNoKeyPress(Sender: TObject;
  var Key: Char);
  var
  Applied : Boolean;
begin
//  if Key = #13 then
//  begin
//    Key := #0;
//    lblApplyClick(nil);
//    if FApplyBtnEnable then
//    begin
//      Applied := VehicleMgr.ControlTrackByTrackNumber(StrToInt(edtTrackNo.Text));
//      if not Applied then
//      begin
//        // call di blackshark manager untuk spawn operator messages
//        SutBlacksharkManager.OperatorMessages := 'Invalid Track Number';
//
//        FreeAndNil(frmControlByNumber);
//      end
//      else
//      begin
//  //      TorpedoParam.
//        FreeAndNil(frmControlByNumber);
//      end;
//    end;
//  end;
end;

procedure TfrmControlByNumber.FormCreate(Sender: TObject);
begin
  FApplyBtnEnable := False;
end;

procedure TfrmControlByNumber.FormShow(Sender: TObject);
begin
  edtTrackNo.SetFocus;
end;

procedure TfrmControlByNumber.lblApplyClick(Sender: TObject);
var
  Applied : Boolean;
begin
  if FApplyBtnEnable then
  begin
    Applied := VehicleMgr.ControlTrackByTrackNumber(StrToInt(edtTrackNo.Text));
    if not Applied then
    begin
      // call di blackshark manager untuk spawn operator messages
      SutBlacksharkManager.OperatorMessages := 'Invalid Track Number';
//      frmControlByNumber.Close;
      FreeAndNil(frmControlByNumber);
    end
    else
    begin
//      TorpedoParam.
//      frmControlByNumber.Close;
      FreeAndNil(frmControlByNumber);
    end;
  end;
end;

procedure TfrmControlByNumber.lblCloseClick(Sender: TObject);
begin
  FreeAndNil(frmControlByNumber);
end;

end.
