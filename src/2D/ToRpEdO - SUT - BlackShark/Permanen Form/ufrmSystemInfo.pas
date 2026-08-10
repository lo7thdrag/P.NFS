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
    tmrUpdateEngagementList: TTimer;
    procedure tmrUpdateEngagementListTimer(Sender: TObject);
    procedure lvEngagementListClick(Sender: TObject);

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

procedure TfrmSystemInfo.lvEngagementListClick(Sender: TObject);
begin
  UpdateEngagementList;
end;

procedure TfrmSystemInfo.tmrUpdateEngagementListTimer(Sender: TObject);
begin
  UpdateEngagementList;
end;

procedure TfrmSystemInfo.UpdateEngagementList;
var
  Item: TListItem;
begin
  lvEngagementList.Clear;

  if Assigned(TorpedoParam) then
  begin
    Item := lvEngagementList.Items.Add;
    Item.Caption := IntToStr(TorpedoParam.TargetTrackNumber);
    Item.SubItems.Add(IntToStr(TorpedoParam.SalvoNum));
    Item.SubItems.Add(IntToStr(TorpedoParam.TorpedoIdx));
    Item.SubItems.Add('MSI-01');
  end;
end;

end.
