private _aa = allMissionObjects "rhs_stinger_aa_pod_usmc_wd";

private _aaKeep = [];

for "_i" from 1 to 3 do 
{
	_a = selectRandom _aa;
	_aaKeep pushBack _a;
	_m = createmarker [format ["asdf_%1", _i], _a];
	_m setMarkerType "hd_dot";
	_m setMarkerColor "ColorRed";
	_aa = _aa - [_a];
};

{
	_grp = createVehicleCrew _x;
	waitUntil {count units _grp > 0};
	[(leader _grp), [], []] call TOUR_fnc_skillAI;
	(leader _grp) setSkill ["courage", 1];
	(leader _grp) allowfleeing 0;
	(leader _grp) setVariable ["lambs_danger_disableAI", true];
	(format ["TOUR_mkr_AA_%1", _forEachIndex + 1]) setMarkerPos getpos _x;
}ForEach _aaKeep;

{
	deleteVehicle _X;
}forEach _aa;

/*
if (TOUR_debug) then 
{
	{
		_m = createMarker [(format ["TOUR_mkr_AA_debug_%1", _forEachIndex + 1]), getpos _x];
		_m setMarkerText (format ["AA %1", _forEachIndex + 1]);
		_m setMarkerType "MIL_DOT";
		_m setMarkerColor "COLORRED";
	}forEach _aaKeep;
};
*/

TOUR_AAGetInCount = 9;
TOUR_AAGetInSpawns = [[3565.1,3519.87,0.103556],[3524.54,3668.55,0.749075],[3567.42,3715.27,0.297117]];

while {true} do 
{
	if (TOUR_AAGetInCount > 0) then 
	{
		if (count TOUR_AAGetInSpawns > 0) then 
		{
			_newArray = [];
			{
				_position = _x;
				if ({_x distance _position < 30}count (playableUnits + switchableUnits) == 0) then 
				{
					_newArray pushBack _position;
				};
			}forEach TOUR_AAGetInSpawns;
			TOUR_AAGetInSpawns = _newArray;
		};

		if (count TOUR_AAGetInSpawns > 0) then 
		{
			{
				_aa = _x;
				if ((damage _aa < 0.7) && ({alive _x}count crew _aa == 0) && (isNil {_aa getVariable "TOUR_enRoute"})) then
				{
					_spawn = selectRandom TOUR_AAGetInSpawns;
					[_aa, _spawn] execVM "scripts\control\AAGetIn.sqf";
					_aa setVariable ["TOUR_enRoute", true];
					TOUR_AAGetInCount = TOUR_AAGetInCount - 1;
				};
			}forEach _aaKeep;
		};
	};

	if ({(damage _x < 0.7) && (alive gunner _x) }count _aaKeep == 0) then 
	{
		if ("TOUR_objAA" call BIS_fnc_TaskState != "SUCCEEDED") then 
		{
			["TOUR_objAA", "SUCCEEDED", true] call BIS_fnc_taskSetState;
		};
	}else 
	{
		if ({(damage _x < 0.7) && (alive gunner _x) }count _aaKeep > 0) then 
		{
			if ("TOUR_objAA" call BIS_fnc_TaskState == "SUCCEEDED") then 
			{
				hint "true";
				["TOUR_objAA", "ASSIGNED", true] call BIS_fnc_taskSetState;
			};
		};
	};

	if (TOUR_debug) then 
	{
		missionNameSpace setVariable ["TOUR_debug_AA", ({(damage _x < 0.7) && (alive gunner _x) }count _aaKeep)];
	};

	if ((count TOUR_AAGetInSpawns == 0) or ({damage _x < 0.7}count _aaKeep == 0) or (!isNil "TOUR_mission_ending")) exitWith {};
	sleep 2;
};

if ({canFire _x}count _aaKeep == 0) then 
{
	if ("TOUR_objAA" call BIS_fnc_TaskState != "SUCCEEDED") then 
	{
		["TOUR_objAA", "SUCCEEDED", true] call BIS_fnc_taskSetState;
	};
};