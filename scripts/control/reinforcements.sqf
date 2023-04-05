TOUR_reinforcementCounts = 5;
TOUR_reinforcementSpawns = [];
{
	TOUR_reinforcementSpawns pushback (nearestbuilding _x);
}forEach [[3855.67,3342.31,0],[3580.85,3718.44,0],[3239.81,4028.43,0],[2960.84,4527.94,0]]; //cars

TOUR_fnc_reinforcementPositions = 
{
	private _buildingPositionNumbers = switch (toLower typeof _this) do 
	{
		case "land_mil_barracks": {[0,1,2,3,4,5,6,7,8,9,10,11,12]};
		case "land_mil_barracks_i": {[1,1,2,2,3,6,7,8]};
		case "land_mil_house": {[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]};
		default {[0,1,2,3,4]};
	};

	_buildingPositionNumbers
};

private _vehicle = objnull;

while {TOUR_reinforcementCounts > 0} do 
{
	if (TOUR_reinforcementCounts > 0) then 
	{
		if (count TOUR_reinforcementSpawns > 0) then 
		{
			_newArray = [];
			{
				_position = _x;
				if ({_x distance _position < 50}count (playableUnits + switchableUnits) == 0) then 
				{
					_newArray pushBack _position;
				}else
				{
					if (random 10 < 5 && !(_position in TOUR_airbaseSpawns)) then 
					{
						_spawns = _position call TOUR_fnc_reinforcementPositions;
						_grp = createGroup WEST;
						{
							_spawn = _position buildingPos _x;
							_unit = _grp createUnit [(TOUR_EnemyInfMen select (random ceil (count TOUR_enemyInfMen))), _spawn, [], 0, "NONE"];
							_unit setPosATL _spawn;
							[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
							_unit setSkill ["courage", 1];
							if (_forEachIndex >= 4) exitWith {};
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
			}forEach TOUR_reinforcementSpawns;
			TOUR_reinforcementSpawns = _newArray;
		};

		if (count TOUR_reinforcementSpawns > 0) then 
		{
			if (count TOUR_reinforcementRequest != 0) then 
			{
				TOUR_reinforcementCounts = TOUR_reinforcementCounts - 1;
				_pos = TOUR_reinforcementRequest select 0;
				TOUR_reinforcementRequest = TOUR_reinforcementRequest - [_pos];
				_building = selectRandom TOUR_reinforcementSpawns;
				_spawns = _building call TOUR_fnc_reinforcementPositions;
				_cars = ["rhsusf_m1232_mc_m2_usmc_wd","rhsusf_m1025_ws_m2","uk3cb_b_lav25_us_wdl"];
				_vehicles = (nearestObjects [getpos _building,_cars,100]);
				_seats = 0;
				if (count _vehicles > 0) then 
				{
					_vehicle = selectRandom _vehicles;
					_seats = _vehicle emptyPositions "";
				};
				_grp = createGroup WEST;
				if (_seats > 0) then 
				{
					for "_i" from 1 to _seats do 
					{
						_spawn = _building buildingPos (_spawns select (_i - 1));
						_unit = _grp createUnit [(TOUR_EnemyInfMen select (_i -1)), _spawn, [], 0, "NONE"];
						_unit setPosATL _spawn;
						[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
						_unit setSkill ["courage", 1];
					};
					_wp = _grp addWaypoint [getpos _vehicle, 0];
					_wp waypointAttachVehicle _vehicle;
					_wp setWaypointType "GETIN";
					_wp setWaypointCombatMode "RED";
					_wp setWaypointBehaviour "AWARE";
				}else 
				{
					{
						_spawn = _building buildingPos _x;
						_unit = _grp createUnit [(TOUR_EnemyInfMen select (random ceil (count TOUR_enemyInfMen))), _spawn, [], 0, "NONE"];
						_unit setPosATL _spawn;
						[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
						_unit setSkill ["courage", 1];
					}forEach _spawns;
				};
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