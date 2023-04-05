_pos1 = [[4319.02,3183.77,0.299204],[4290.27,3179.76,0.733534],[4399.29,3171.81,0.235235],[4371.94,3264.24,0.0397224],[4371.69,3263.97,0.0349388],[4311.5,3238.83,0.453392],[4311.5,3238.82,0.453392],[4365.94,3189.67,0.00143814]];

_pos2 = [[4404.42,3576.53,0.0839977],[4381.97,3558.33,0.166666],[4406.15,3530.95,0.00128174]];

_pos3 = [[3458.69,4427.12,0.748663],[3434.73,4428.3,0.112089],[3300.42,4428.56,0.00153351],[3292.6,4434.28,0.493845],[3279.15,4335.66,0.984369],[3336.06,4371.8,0.00162125],[3356.45,4391.31,0.0944691],[3280.38,4402.49,1.98032]];

_chosenPos = selectRandom (_pos1 + _pos2 + _pos3);

_otherLocations = (_pos1 + _pos2 + _pos3) - [_chosenPos];

{
	if (_chosenPos distance (getMarkerPos _x) < 200) then 
	{	
		TOUR_meetLocation = getMarkerPos _x;
		"TOUR_mkr_meet" setMarkerPos TOUR_meetLocation;
		missionNameSpace setVariable ["TOUR_meetLocation", TOUR_meetLocation, true];
	};
}forEach ["TOUR_mkr_meet_1", "TOUR_mkr_meet_2", "TOUR_mkr_meet_3"];

TOUR_scientist setPosATL _chosenPos;

if (TOUR_debug) then 
{
	_m = createMarker ["TOUR_mkr_sci_debug", _chosenPos];
	_m setMarkerText "scientist";
	_m setMarkerType "MIL_DOT";
	_m setMarkerColor "COLORGREEN";
};

private ["_unit"];

for "_i" from 1 to (ceil ((count _otherLocations) * 0.7)) do 
{
	_pos = selectRandom _otherLocations;
	_otherLocations = _otherLocations - [_Pos];

	if (random 1 > 0.3) then 
	{
		_grp = createGroup CIVILIAN;
		_unit = _grp createUnit ["UK3CB_CHC_C_CIV", _pos, [], 0, "NONE"];
		_unit setPosATL _pos;
		_unit call Tour_fnc_garbageEH;
		[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
		_unit setSkill ["courage", 1];
		_unit allowfleeing 0;
		_unit setVariable ["lambs_danger_disableAI", true];
	}else 
	{
		_grp = createGroup WEST;
		_unit = _grp createUnit ["rhsusf_usmc_marpat_wd_driver", _pos, [], 0, "NONE"];
		_unit setPosATL _pos;
		_unit call Tour_fnc_garbageEH;
		[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
		_unit setSkill ["courage", 1];
		_unit allowfleeing 0;
		_unit setVariable ["lambs_danger_disableAI", true];	
	};

	if (TOUR_debug) then 
	{
		_m = createMarker [format ["TOUR_mkr_house_debug_%1", _i], _pos];
		_m setMarkerType "MIL_DOT";
		if (side _unit == WEST) then 
		{
			_m setMarkerColor "COLORRED";
		}else 
		{
			_m setMarkerColor "COLORYELLOW";
		};
	};
};

_numbers = ["0","1","2","3","4","5","6","7","8","9"];
_code = [];

for "_i" from 1 to 4 do 
{
	_number = selectRandom _numbers;
	_code pushBack (selectRandom _numbers);
};

missionNameSpace setVariable ["TOUR_accessCode", _code, true];