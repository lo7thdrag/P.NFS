unit uLibConst;

interface

const
  // WHOLE COLOR ===============================================================
	// Default Theme [ Disabled]
  CForegroundColor = $00FFC68C;//RGB(140,198,255);

  CBlueColor = $00B35B33;//rgb(51, 91, 179);

  CBackgroundButton = $00C0C0C0; //clSilver; //rgb(192, 192, 192);
  CFontButton = $005E2121;
  CGrayBackground = $00F0F0F0;

  CBlueFontTEdit = $00ff5255;

	// FCC MAP COLOR ===========================================================
	CBackgroundMapColor = $000000000;

  // Misc ======================================================================
	CBaseAngle = 360.0;


  //Status Range
  CRangeOperation : array[0..5] of double = (1500,3000,6000,12000,24000,48000);
	CCountRange = 6;
type
  TStatusRings          = (srgRingsOff,srgRingsOn);
implementation

end.
