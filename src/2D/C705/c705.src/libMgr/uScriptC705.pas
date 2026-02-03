unit uScriptC705;

interface

  procedure BeginC705;
  procedure EndC705;

implementation

uses
  Windows, uC705SimManager;

/// some sub function to keep the main procedure simple;


//main procedure of c705------------------------------------------------------->>

procedure BeginC705;
begin
  { Create SimManager }
  SimManager := GameSimManager.Create;    //create platform & create thread
end;

procedure EndC705;
begin
  SimManager.Free;
end;

end.
