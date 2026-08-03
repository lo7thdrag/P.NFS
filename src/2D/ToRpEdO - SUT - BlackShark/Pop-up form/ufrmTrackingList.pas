unit ufrmTrackingList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,

  uVehicleManager, uSimulationManager, uSimulationTrack, uSutBlacksharkManager, uBaseFunction;

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
    procedure lvTracklistNumberSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
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

procedure TfrmTrackListNumber.lvTracklistNumberSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  TrackNum : Integer;
begin
  if not Selected then
     Exit;

  lblNumber.Caption    := Item.Caption;
  lblNumber.Font.Color := clLime;

  TrackNum := StrToIntDef(Item.SubItems[0], -1);

  if TrackNum <> -1 then
    VehicleMgr.ControlTrackByTrackNumber(TrackNum)
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

  for i := 0 to VehicleMgr.ObjectList.Count -1 do
  begin
    if VehicleMgr.ObjectList[i] is TSimulationTrack then
    begin
      Track := TSimulationTrack(VehicleMgr.ObjectList[i]);

      Item := lvTracklistNumber.Items.Add;
      Item.Caption := IntToStr(Item.Index + 1);
      Item.SubItems.Add(IntToStr(Track.MSITrackNumber));
      Item.SubItems.Add('No Statement');

      case Track.Domain of
        1: Item.SubItems.Add('Surface');
        3: Item.SubItems.Add('Subsurface');
      end;

      Item.SubItems.Add(IntToStr(Ord(Track.Identity)));
    end;



  end;
end;

end.
