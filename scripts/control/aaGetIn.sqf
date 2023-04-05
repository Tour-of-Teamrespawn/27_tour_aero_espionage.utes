private _aa = _this select 0;
private _spawn = _this select 1;

_grp = createGroup WEST;
_unit = _grp createUnit ["rhsusf_usmc_marpat_wd_rifleman_m4", _spawn, [], 0, "NONE"];
_unit setPosATL _spawn;
_unit call Tour_fnc_garbageEH;
[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
_unit setSkill ["courage", 1];
_unit allowfleeing 0;
_unit setVariable ["lambs_danger_disableAI", true];

while {alive _unit && (vehicle _unit != _aa)} do 
{
	_unit assignAsGunner _aa;
	[_unit] allowGetin true;
	[_unit] orderGetIn true;
	[_unit] allowGetin true;
	sleep 10;
};

_aa setVariable ["TOUR_enRoute", nil];