unit uFrmFireDistribution;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrButtons, Vcl.ExtCtrls,
  Vcl.StdCtrls, AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid;

type
  TfrmFireDistribution = class(TForm)
    pnlTblFireDistribution: TPanel;
    btnTarget1: TVrDemoButton;
    btnTarget2: TVrDemoButton;
    Label1: TLabel;
    Label2: TLabel;
    strgFireDistribution: TAdvStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure strgFireDistributionGetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
  private
    { Private declarations }
    procedure InitTblFireDistribution;
  public
    { Public declarations }
  end;

var
  frmFireDistribution: TfrmFireDistribution;

implementation

{$R *.dfm}

procedure TfrmFireDistribution.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmFireDistribution.FormCreate(Sender: TObject);
begin
  Align := alClient;
end;

procedure TfrmFireDistribution.FormShow(Sender: TObject);
begin
  InitTblFireDistribution;
end;

procedure TfrmFireDistribution.InitTblFireDistribution;
begin
  strgFireDistribution.Cells[1,0] := 'Left: 1';
end;

procedure TfrmFireDistribution.strgFireDistributionGetCellColor(Sender: TObject;
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
