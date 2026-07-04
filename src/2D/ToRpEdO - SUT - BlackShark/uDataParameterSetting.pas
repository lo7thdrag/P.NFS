unit uDataParameterSetting;

interface

type
  TRecParameterSettings = record
    // Depth
    Ceiling         : Integer;
    AttackDepth     : Integer;
    SearchDepth     : Integer;
    ApproachDepth   : Integer;
    Floor           : Integer;
    CeilingChecked  : Boolean;
    FloorChecked    : Boolean;

    // Approach
     EnableDistance       : Integer;
    ApproachSpeed         : Integer;
    ApproachCourse        : Integer;
    ApproachCourseChecked : Boolean;

    // SA
    SAUpdating        : Integer;
    CenterOS          : Integer;
    CenterOSChecked   : Boolean;
    SALength          : Integer;
    SAWidth           : Integer;
    CenterSSP         : Integer;
    SearchConfidence  : Integer;

    // Int Guidance
    SearchPattern : Integer;
    DPCAngle      : Integer;

    // ToSo
    ToSoMode      : Integer;
    ToSoRangePAS  : Integer;
    ToSoRangeACT  : Integer;

    // Safety
    ASH                     : Integer;
    ProtectionRadius        : Integer;
    ProtectionRadiusChecked : Boolean;

  end;

implementation

end.
