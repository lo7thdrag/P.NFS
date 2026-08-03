unit ufrmTrackingList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,

  uVehicleManager, uSimulationManager, uSimulationTrack, uSutBlacksharkManager, ufrmTorpedoParameterDepthSettings;

type
  TfrmTrackListNumber = class(TForm)
    pnlMain: TPanel;
    lblNumberofTracks: TLabel;
    lvTracklistNumber: TListView;
    lblReset: TLabel;
    lblClose: TLabel;
    lblNumber: TLabel;
    Panel1: TPanel;
    tmrTracklistNumber: TTimer;
    procedure lblCloseClick(Sender: TObject);
    procedure tmrTracklistNumberTimer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UpdateTrackListNumber;
  end;

var
  frmTrackListNumber: TfrmTrackListNumber;

implementation

{$R *.dfm}

procedure TfrmTrackListNumber.lblCloseClick(Sender: TObject);
begin
  FreeAndNil(frmTrackListNumber);
end;

procedure TfrmTrackListNumber.tmrTracklistNumberTimer(Sender: TObject);
begin
  UpdateTrackListNumber;
end;

procedure TfrmTrackListNumber.UpdateTrackListNumber;
var
  i: Integer;
  Item: TListItem;
  Track: TSimulationTrack;
begin
  lvTracklistNumber.Clear;

  if VehicleMgr.IsAnyTrackControlled then
  begin
    lblNumber.Caption    := IntToStr(VehicleMgr.TrackControlled.MSITrackNumber);
    lblNumber.Font.Color := clLime;
  end;

  if Assigned(TorpedoParam) then
  begin
    Item := lvTracklistNumber.Items.Add;
    Item.Caption := IntToStr(Item.Index + 1);
    Item.SubItems.Add(IntToStr(VehicleMgr.TrackControlled.MSITrackNumber));
    Item.SubItems.Add('No Statement');

    case VehicleMgr.TrackControlled.Domain of
      1: Item.SubItems.Add('Surface');
      3: Item.SubItems.Add('Subsurface');
    end;

    Item.SubItems.Add(IntToStr(Ord(VehicleMgr.TrackControlled.Identity)));
  end;
end;

end.
