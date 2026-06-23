unit ufrmTorpedoParameterSetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmTorpedoParameterSetting = class(TForm)
    pnlMain: TPanel;
    pbTorpedoParameter: TPaintBox;
    procedure pbTorpedoParameterPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTorpedoParameterSetting: TfrmTorpedoParameterSetting;

implementation

{$R *.dfm}

procedure TfrmTorpedoParameterSetting.pbTorpedoParameterPaint(Sender: TObject);
const
  GraphLeft    = 28;
  GraphTop     = 20;
  RightMargin  = 50;
  BottomMargin = 25;
var
  GraphWidth  : Integer;
  GraphHeight : Integer;
begin
  GraphWidth  := pbTorpedoParameter.ClientWidth  - GraphLeft - RightMargin;
  GraphHeight := pbTorpedoParameter.ClientHeight - GraphTop  - BottomMargin;

  with pbTorpedoParameter.Canvas do
  begin
    Brush.Color := clBlack;
    FillRect(pbTorpedoParameter.ClientRect);

    Font.Color := clSilver;
    Font.Size  := 7;

    Pen.Color  := clGreen;
    Pen.Width  := 1;

    MoveTo(GraphLeft, 150);
    LineTo(GraphLeft + 180, 80);
    LineTo(GraphLeft + 500, 95);

    MoveTo(GraphLeft, 150);
    LineTo(GraphLeft + 500, 95);
  end;
end;

end.
