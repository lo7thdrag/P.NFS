unit uKeyboardManager;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms;

type
  {$REGION 'Keterangan Keyboard Context'}
    {Keyboard Context
    ----------------

    Menunjukkan keyboard virtual sedang digunakan
    oleh bagian mana dari aplikasi.

    kcMainMenu -> frmWCC

    kcFoeFriendMenu -> frmFoeFriendSituationPage

    kcAreaForm -> Form yang di-embed
         (ChSelect, Parameter Setting, Missile Control, INS Test, dll)

    kcPopup
      -> Popup yang sedang aktif
    }
  {$ENDREGION}

  TKeyboardContext =
  (
    kbNone,
    kbWCCMenu,
    kbFFSMenu,
    kbAreaFormFFS,
    kbPopup
  );

  TKeyboardManager = class
  private

    { Context keyboard saat ini }
    FKbContext : TKeyboardContext;

    {
      Pointer ke Area Form yang sedang aktif.

      Contoh :

      FFormChSelect
      FFormParSetting
      FFormMissileControl

      Yang aktif cukup disimpan di sini.
    }
    FActiveAreaForm : TForm;

  public

    constructor Create;

    { Mengubah Context keyboard }
    procedure SetContext(aContext : TKeyboardContext);

    { Menentukan Area Form yang sedang aktif. }
    procedure SetActiveAreaForm(aForm : TForm);

    {
      Mengirim tombol keyboard virtual.

      Contoh :

      VK_UP
      VK_DOWN
      VK_RETURN
      VK_ESCAPE
    }
    procedure SendKey(AKey : Word);

    property KbContext : TKeyboardContext read FKbContext;
    property ActiveAreaForm : TForm read FActiveAreaForm;

  end;

var
  KeyboardMgr : TKeyboardManager;

implementation

uses
  uFrmWCC, uFrmFoeFriendSituationPage,
    uFrmChannelSelect, uFrmParamSetting;

{ TKeyboardManager }

constructor TKeyboardManager.Create;
begin
  inherited;

  FKbContext := kbNone;
  FActiveAreaForm := nil;
end;

procedure TKeyboardManager.SetActiveAreaForm(AForm: TForm);
begin
  FActiveAreaForm := aForm;
end;

procedure TKeyboardManager.SetContext(aContext: TKeyboardContext);
begin
  FKbContext := aContext;
end;

procedure TKeyboardManager.SendKey(aKey: Word);
var
  Shift: TShiftState;
begin
  Shift:= [];

  case FKbContext of
    kbNone: begin
      {}
    end;

    //------------------------------------------------------
    // Keyboard dipakai oleh frmWCC
    //------------------------------------------------------
    kbWCCMenu: begin
      if Assigned(frmWCC) then
        frmWCC.HandleKeyboardDown(aKey);
    end;

    //------------------------------------------------------
    // Keyboard dipakai oleh frmFoeFriendSituationPage
    //------------------------------------------------------
    kbFFSMenu: begin
      if Assigned(frmFoeFriendSituationPage) then
        frmFoeFriendSituationPage.HandleKeyboardDown(aKey, shift);
    end;

    //------------------------------------------------------
    // Keyboard dipakai Area Form frmFoeFriendSituationPage
    //------------------------------------------------------
    kbAreaFormFFS: begin
      if not Assigned(FActiveAreaForm) then
        Exit;

      if Assigned(FActiveAreaForm) then
      begin

        if FActiveAreaForm is TfrmChannelSelect then
          TfrmChannelSelect(FActiveAreaForm).HandleKeyDown(aKey, shift)

        else if FActiveAreaForm is TfrmParamSetting then
          TfrmParamSetting(FActiveAreaForm).HandleKeyDownParSetting(aKey, [])

//        else if FActiveAreaForm is TfrmMissileControl then
//          TfrmMissileControl(FActiveAreaForm).HandleVirtualKey(aKey)

//        else if FActiveAreaForm is TfrmINSTest then
//          TfrmINSTest(FActiveAreaForm).HandleVirtualKey(aKey);

      end;
    end;

    kbPopup: begin
      {
        nanti jika ada popup
      }
    end;
  end;
end;

end.
