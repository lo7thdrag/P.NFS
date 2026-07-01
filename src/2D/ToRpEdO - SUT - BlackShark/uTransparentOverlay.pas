unit uTransparentOverlay;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Classes, Vcl.Controls, Vcl.Graphics;

type
  TCustomPaintEvent = procedure(Sender: TObject; Canvas: TCanvas) of object;

  TTransparentOverlay = class(TCustomControl)
  private
    FOnPaint: TCustomPaintEvent;
    FOnMouseDownEvent: TMouseEvent;
    FOnMouseUpEvent: TMouseEvent;
    procedure PassMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure PassMouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure SetOnMouseDownEvent(const Value: TMouseEvent);
    procedure SetOnMouseUpEvent(const Value: TMouseEvent);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Paint; override;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;

  public
    constructor Create(AOwner: TComponent); override;
    property OnPaint: TCustomPaintEvent read FOnPaint write FOnPaint;
    property OnMouseDownEvent: TMouseEvent read FOnMouseDownEvent write FOnMouseDownEvent;
    property OnMouseUpEvent: TMouseEvent read FOnMouseUpEvent write FOnMouseUpEvent;
  end;

implementation

{ TTransparentOverlay }

constructor TTransparentOverlay.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  OnMouseDown:= PassMouseDown;
  OnMouseUp:= PassMouseUp;
end;

procedure TTransparentOverlay.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle:= Params.ExStyle or WS_EX_TRANSPARENT or WS_EX_COMPOSITED;
end;

procedure TTransparentOverlay.Paint;

begin
  inherited;
  SetBkMode(Canvas.Handle, TRANSPARENT);
  Canvas.Brush.Style := bsClear;

  if Assigned(FOnPaint) then
    FOnPaint(Self, Canvas);
end;

procedure TTransparentOverlay.PassMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FOnMouseDownEvent(Sender, Button, Shift, X, Y);
end;

procedure TTransparentOverlay.PassMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FOnMouseUpEvent(Sender, Button, Shift, X, Y);
end;

procedure TTransparentOverlay.SetOnMouseDownEvent(const Value: TMouseEvent);
begin
  FOnMouseDownEvent := Value;
end;

procedure TTransparentOverlay.SetOnMouseUpEvent(const Value: TMouseEvent);
begin
  FOnMouseUpEvent := Value;
end;

procedure TTransparentOverlay.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  Message.Result:= 1;
end;

end.
