unit uBaseFunction;

interface
uses
    Classes, Windows, Math, Graphics, System.SysUtils;

  procedure InitOleVariant(var TheVar:OleVariant);

  function ConvCartesian_To_Compass(const degree: double): double ;
  function ValidateDegree(const aDegree: double): double;
  function ConvCompass_To_Cartesian(const degree: double): double;

implementation

function ConvCartesian_To_Compass(const degree: double): double ;
begin
  // input : derajat (0..360) dari sumbu X, CCW, cartesian
  // output: derajat (0..360) dari utara,   CW, kompas

   result := 90.0 - degree;
   if result < 0.0 then result := result + 360.0;
end;

procedure InitOleVariant(var TheVar:OleVariant);
begin
  TVarData(TheVar).vType:=varError;
  TVarData(TheVar).vError:=  DISP_E_PARAMNOTFOUND;
end;

function ValidateDegree(const aDegree: double): double;
begin
  result := aDegree - (Floor(aDegree / 360.0) * 360.0);
end;

function ConvCompass_To_Cartesian(const degree: double): double;
begin
  result := ValidateDegree(90.0 - degree);
end;

end.
