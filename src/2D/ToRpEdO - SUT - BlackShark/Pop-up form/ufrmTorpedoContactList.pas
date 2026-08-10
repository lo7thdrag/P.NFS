unit ufrmTorpedoContactList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,

  uSutBlacksharkManager, uVehicleManager, uBaseFunction;

type
  TfrmTorpedoContactList = class(TForm)
    pnlMain: TPanel;
    lvTorpedoContactList: TListView;
    lblReset: TLabel;
    lblClose: TLabel;
    tmrTorpedoContactList: TTimer;
    procedure lblCloseClick(Sender: TObject);
    procedure tmrTorpedoContactListTimer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UpdateTorpedoContactList;
  end;

var
  frmTorpedoContactList: TfrmTorpedoContactList;

implementation

{$R *.dfm}

procedure TfrmTorpedoContactList.lblCloseClick(Sender: TObject);
begin
  FreeAndNil(frmTorpedoContactList);
end;

procedure TfrmTorpedoContactList.tmrTorpedoContactListTimer(Sender: TObject);
begin
  UpdateTorpedoContactList;
end;

procedure TfrmTorpedoContactList.UpdateTorpedoContactList;
var
  Item : TListItem;
  range : Double;
begin
  lvTorpedoContactList.Clear;

  if Assigned(TorpedoParam) then
  begin
    Item := lvTorpedoContactList.Items.Add;
    Item.Caption := (IntToStr(TorpedoParam.TorpedoIdx));
    Item.SubItems.Add(FormatFloat('0.00', VehicleMgr.TrackControlled.Bearing));
    Item.SubItems.Add(FormatFloat('0.00', VehicleMgr.TrackControlled.Range));
  end;
end;

end.
