unit ufrmTrackingList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,

  uVehicleManager, uSimulationManager, uSimulationTrack;

type
  TfrmTrackListNumber = class(TForm)
    pnlMain: TPanel;
    lblNumberofTracks: TLabel;
    lvTracklistNumber: TListView;
    lblReset: TLabel;
    lblClose: TLabel;
    lblNumber: TLabel;
    Panel1: TPanel;
    procedure lblCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UpdateTrackListNumber;
  end;

var
  frmTrackListNumber: TfrmTrackListNumber;

implementation

{$R *.dfm}

procedure TfrmTrackListNumber.FormShow(Sender: TObject);
begin
  UpdateTrackListNumber;
end;

procedure TfrmTrackListNumber.lblCloseClick(Sender: TObject);
begin
  FreeAndNil(frmTrackListNumber);
end;

procedure TfrmTrackListNumber.UpdateTrackListNumber;
var
  i: Integer;
  Item: TListItem;
  Track: TSimulationTrack;
begin
  lvTracklistNumber.Clear;
  for i := 0 to VehicleMgr.Count - 1 do
  begin
    Track := VehicleMgr.Items()[i];

    Item := lvTracklistNumber.Items.Add;
    Item.Caption := IntToStr(Item.Index + 1);
    Item.SubItems.Add(IntToStr(Track.MSITrackNumber));
    Item.SubItems.Add('No Statement');

    case Track.Domain of
      1: Item.SubItems.Add('Surface');
      2: Item.SubItems.Add('Air');
      3: Item.SubItems.Add('Subsurface');
    end;

    Item.SubItems.Add(IntToStr(Ord(Track.Identity)));
  end;
end;

end.
