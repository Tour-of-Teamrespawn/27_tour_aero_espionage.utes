TOUR_airbaseCounts = 3;

TOUR_airbaseSpawns = [];
{
	TOUR_airbaseSpawns pushBack (nearestbuilding _x);
}forEach [[3554.46,3723.42,0],[3566.68,3720.85,0],[3531.43,3670.15,0],[3687.87,3514.34,0],[3842.94,3310.36,0],[3856.39,3306.26,0],[3865.47,3303.44,0]]; //airbase

private _vehicle = objnull;
private _pos = getMarkerPos "TOUR_mkr_base";

while {TOUR_airbaseCounts > 0} do 
{
	if (TOUR_airbaseCounts > 0) then 
	{
		if (count TOUR_airbaseSpawns > 0) then 
		{
			_newArray = [];
			{
				_position = _x;
				if ({_x distance _position < 50}count (playableUnits + switchableUnits) == 0) then 
				{
					_newArray pushBack _position;
				}else
				{
					if (random 10 < 2.5) then 
					{
						_spawns = _position call TOUR_fnc_reinforcementPositions;
						_grp = createGroup WEST;
						{
							_spawn = _position buildingPos _x;
							_unit = _grp createUnit [(TOUR_EnemyInfMen select (floor (random (count TOUR_enemyInfMen)))), _spawn, [], 0, "NONE"];
							_unit setPosATL _spawn;
							[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
							_unit setSkill ["courage", 1];
							if (_forEachIndex >= 9) exitWith {};
						}forEach _spawns;

						_pos = getpos _position;
						{
							if (_x in (playableUnits + switchableUnits)) exitWith 
							{
								_pos = getPos _x;
							};
						}forEach nearestObjects [getpos _position, [], 75];

						_wp1 = _grp addWaypoint [_pos, 0];
						_wp1 setWaypointType "MOVE";
						_wp1 setWaypointCombatMode "RED";
						_wp1 setWaypointBehaviour "AWARE";
						_wp1 setWaypointCompletionRadius 50;

						_wp2 = _grp addWaypoint [_pos, 0];
						_wp2 setWaypointType "GUARD";
						_wp2 setWaypointCombatMode "RED";
						_wp2 setWaypointBehaviour "AWARE";
						_wp2 setWaypointCompletionRadius 20;
					};
				};
			}forEach TOUR_airbaseSpawns;
			TOUR_airbaseSpawns = _newArray;
		};
		
		if (count TOUR_airbaseSpawns > 0) then 
		{
			if (count TOUR_AirbaseRequest > 0) then 
			{
				if (isNil "TOUR_airbaseAlert") then 
				{
					[[],{
						TOUR_siren_1 say3d ["TOUR_airraid", 1500];
						TOUR_siren_2 say3d ["TOUR_airraid", 500];
						TOUR_siren_3 say3d ["TOUR_airraid", 500];
						}] remoteExecCall ["BIS_fnc_spawn", 0, false];
					TOUR_airbaseAlert = true;
					sleep 5;
					[] spawn {{[[_x], {(_this select 0) switchLight "ON"}]remoteExecCall ["SPAWN", 0, false]; sleep (0.25 + random 0.5);}forEach nearestObjects [getMarkerPos "TOUR_mkr_base", ["UK3CB_b_searchlight_NATO_P"], 2000];};
				};
				TOUR_airbaseCounts = TOUR_airbaseCounts - 1;
				_pos = TOUR_AirbaseRequest select 0;
				_building = selectRandom TOUR_airbaseSpawns;
				_spawns = _building call TOUR_fnc_reinforcementPositions;
				_grp = createGroup WEST;

				{
					_spawn = _building buildingPos _x;
					_unit = _grp createUnit [(TOUR_EnemyInfMen select (floor (random (count TOUR_enemyInfMen)))), _spawn, [], 0, "NONE"];
					_unit setPosATL _spawn;
					[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
					_unit setSkill ["courage", 1];
				}forEach _spawns;

				_wp1 = _grp addWaypoint [_pos, 0];
				_wp1 setWaypointType "MOVE";
				_wp1 setWaypointCombatMode "RED";
				_wp1 setWaypointBehaviour "AWARE";
				_wp1 setWaypointCompletionRadius 50;

				_wp2 = _grp addWaypoint [_pos, 0];
				_wp2 setWaypointType "GUARD";
				_wp2 setWaypointCombatMode "RED";
				_wp2 setWaypointBehaviour "AWARE";
				_wp2 setWaypointCompletionRadius 20;
			};
		};
	};
	sleep 1;
};