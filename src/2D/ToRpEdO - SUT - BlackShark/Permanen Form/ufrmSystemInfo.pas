unit ufrmSystemInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,

  uVehicleManager, uSutBlacksharkManager;

type
  TfrmSystemInfo = class(TForm)
    pnlMain: TPanel;
    lvEngagementList: TListView;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UpdateEngagementList;
  end;

var
  frmSystemInfo: TfrmSystemInfo;

implementation

{$R *.dfm}

{ TfrmSystemInfo }

procedure TfrmSystemInfo.FormShow(Sender: TObject);
begin
  UpdateEngagementList;
end;

procedure TfrmSystemInfo.UpdateEngagementList;
var
  i: Integer;
  Item: TListItem;
begin
  lvEngagementList.Items.BeginUpdate;

  try
    lvEngagementList.Items.Clear;

    if not VehicleMgr.IsAnyTrackControlled then
      Exit;

    for i := 0 to 7 do
    begin
      if SutBlacksharkManager.FTorpedoArray[i].FireRelease then
      begin
        Item := lvEngagementList.Items.Add;

        Item.Caption := IntToStr(VehicleMgr.TrackControlled.MSITrackNumber);
        Item.SubItems.Add(IntToStr(TorpedoParam.SalvoNum));
        Item.SubItems.Add(IntToStr(i + 1));
        Item.SubItems.Add('MSI-01');
      end;
    end;

  finally
    lvEngagementList.Items.EndUpdate;
  end;

end;

end.
