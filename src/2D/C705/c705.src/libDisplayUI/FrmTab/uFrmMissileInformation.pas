unit uFrmMissileInformation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid;

type
  TfrmMissileInformation = class(TForm)
    {$REGION 'Components'}
    strgMissileInfo: TAdvStringGrid;
    Panel1: TPanel;
    pnlMissileInformationTbl: TPanel;
    lblTgtNbHeader_L: TLabel;
    Label1: TLabel;
    {$ENDREGION}
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure strgMissileInfoGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure InitTblMissileInfo;
  public
    { Public declarations }
  end;

var
  frmMissileInformation: TfrmMissileInformation;

implementation

{$R *.dfm}

procedure TfrmMissileInformation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmMissileInformation.FormCreate(Sender: TObject);
begin
  Align := alClient;
end;

procedure TfrmMissileInformation.FormShow(Sender: TObject);
begin
  InitTblMissileInfo;
end;

procedure TfrmMissileInformation.InitTblMissileInfo;
begin
  strgMissileInfo.Cells[1,0] := 'Track     0.0';
end;

procedure TfrmMissileInformation.strgMissileInfoGetCellColor(Sender: TObject;
  ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  if ACol = 0 then
    Exit;

  // Set warna cell dan font untuk column ke 2 & 3
  if (True) or (ACol = 2) then
  begin
    ABrush.Color := clBlack;
    AFont.Color := clLime;
  end;
end;

end.
