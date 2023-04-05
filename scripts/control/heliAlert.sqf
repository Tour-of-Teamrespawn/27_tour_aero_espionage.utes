TOUR_heliCounts = 1;
TOUR_heliSpawns = [];
TOUR_circles = 0;
{
	TOUR_heliSpawns pushBack (nearestbuilding _x);
}forEach [[3564.98,3520.17,0]]; //heli

private _vehicle = objnull;
private _grp = grpNull;

while {true} do 
{

	if (TOUR_heliCounts > 0) then 
	{

		if (count TOUR_heliSpawns > 0) then 
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
							if (_forEachIndex >= 3) exitWith {};
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
						_wp1 setWaypointBehaviour "SAFE";
						_wp1 setWaypointCompletionRadius 50;

						_wp2 = _grp addWaypoint [_pos, 0];
						_wp2 setWaypointType "GUARD";
						_wp2 setWaypointCombatMode "RED";
						_wp2 setWaypointBehaviour "SAFE";
						_wp2 setWaypointCompletionRadius 20;
					};
				};
			}forEach TOUR_heliSpawns;
			TOUR_heliSpawns = _newArray;
		};
		
		if (count TOUR_heliSpawns > 0) then 
		{

			if (count TOUR_heliRequest > 0) then 
			{

				TOUR_heliCounts = TOUR_heliCounts - 1;
				_pos = TOUR_heliRequest select 0;
				TOUR_heliRequest = [];
				_building = selectRandom TOUR_heliSpawns;
				_spawns = _building call TOUR_fnc_reinforcementPositions;

				_helicopters = ["rhs_uh1y"];
				_vehicles = [];
				{
					if ((canMove _x) && ((getposATL _x) select 2) < 5) then 
					{
						_vehicles pushBack _x;
					}
				}forEach (nearestObjects [getpos _building,_helicopters,300]);
				_seats = 0;
				if (count _vehicles > 0) then 
				{
					_vehicle = selectRandom _vehicles;
					_seats = _vehicle emptyPositions "";
				};

				if (_seats >= 3) then 
				{
					_grp = createGroup WEST;
					_pilots = 2;
					_crew = ["rhsusf_usmc_marpat_wd_helipilot", "rhsusf_usmc_marpat_wd_helicrew"];
					{
						_spawn = _building buildingPos _x;
						_type = if (_pilots > 0) then {_crew select 0}else{_crew select 1};
						_unit = _grp createUnit [_type, _spawn, [], 0, "NONE"];
						_unit setPosATL _spawn;
						[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
						_unit setSkill ["courage", 1];
						if (_forEachIndex >= 3) exitWith {};
					_pilots = _pilots - 1;
					}forEach _spawns;
					TOUR_circles = 0;

					_wp = _grp addWaypoint [getpos _vehicle, 0];
					_wp waypointAttachVehicle _vehicle;
					_wp setWaypointType "GETIN";
					_wp setWaypointCombatMode "RED";
					_wp setWaypointBehaviour "AWARE";

					_wp2 = _grp addWaypoint [_pos getpos [150, 0], 0];
					_wp2 setWaypointType "MOVE";
					_wp2 setWaypointCombatMode "RED";
					_wp2 setWaypointBehaviour "SAFE";
					_wp2 setwaypointSpeed "LIMITED";

					_wp2 = _grp addWaypoint [_pos getpos [150, 90], 0];
					_wp2 setWaypointType "MOVE";
					_wp2 setWaypointCombatMode "RED";
					_wp2 setWaypointBehaviour "SAFE";

					_wp2 = _grp addWaypoint [_pos getpos [150, 180], 0];
					_wp2 setWaypointType "MOVE";
					_wp2 setWaypointCombatMode "RED";
					_wp2 setWaypointBehaviour "SAFE";

					_wp2 = _grp addWaypoint [_pos getpos [150, 270], 0];
					_wp2 setWaypointType "MOVE";
					_wp2 setWaypointCombatMode "RED";
					_wp2 setWaypointBehaviour "SAFE";

					_wp2 = _grp addWaypoint [_pos getpos [150, 0], 0];
					_wp2 setWaypointType "CYCLE";
					_wp2 setWaypointCombatMode "RED";
					_wp2 setWaypointBehaviour "SAFE";
					_wp2 setWaypointStatements ["true", "TOUR_circles = TOUR_circles + 1"];
					_vehicle flyInHeight 50;

				};
			};
		};
	};

	if (canMove _vehicle) then 
	{
		if (count TOUR_heliRequest > 0) then 
		{
			_pos = TOUR_heliRequest select 0;
			TOUR_heliRequest = [];
			TOUR_circles = 0;

			for "_i" from 0 to (count waypoints _grp - 1) do
			{
				deleteWaypoint [_grp, 0];
			};

			_wp2 = _grp addWaypoint [_pos getpos [150, 0], 0];
			_wp2 setWaypointType "MOVE";
			_wp2 setWaypointCombatMode "RED";
			_wp2 setWaypointBehaviour "SAFE";
			_wp2 setwaypointSpeed "LIMITED";

			_wp2 = _grp addWaypoint [_pos getpos [150, 90], 0];
			_wp2 setWaypointType "MOVE";
			_wp2 setWaypointCombatMode "RED";
			_wp2 setWaypointBehaviour "SAFE";

			_wp2 = _grp addWaypoint [_pos getpos [150, 180], 0];
			_wp2 setWaypointType "MOVE";
			_wp2 setWaypointCombatMode "RED";
			_wp2 setWaypointBehaviour "SAFE";

			_wp2 = _grp addWaypoint [_pos getpos [150, 270], 0];
			_wp2 setWaypointType "MOVE";
			_wp2 setWaypointCombatMode "RED";
			_wp2 setWaypointBehaviour "SAFE";

			_wp2 = _grp addWaypoint [_pos getpos [150, 0], 0];
			_wp2 setWaypointType "CYCLE";
			_wp2 setWaypointCombatMode "RED";
			_wp2 setWaypointBehaviour "SAFE";
			_wp2 setWaypointStatements ["true", "TOUR_circles = TOUR_circles + 1"];
			_vehicle flyInHeight 50;		
		};

		if (TOUR_circles > 3) then 
		{
			for "_i" from 0 to (count waypoints _grp - 1) do
			{
				deleteWaypoint [_grp, 0];
			};

			TOUR_circles = 0;

			_wp2 = _grp addWaypoint [(getMarkerPos "TOUR_mkr_base") getpos [500, 0], 0];
			_wp2 setWaypointType "MOVE";
			_wp2 setWaypointCombatMode "RED";
			_wp2 setWaypointBehaviour "SAFE";
			_wp2 setwaypointSpeed "LIMITED";

			_wp2 = _grp addWaypoint [(getMarkerPos "TOUR_mkr_base") getpos [500, 90], 0];
			_wp2 setWaypointType "MOVE";
			_wp2 setWaypointCombatMode "RED";
			_wp2 setWaypointBehaviour "SAFE";

			_wp2 = _grp addWaypoint [(getMarkerPos "TOUR_mkr_base") getpos [500, 180], 0];
			_wp2 setWaypointType "MOVE";
			_wp2 setWaypointCombatMode "RED";
			_wp2 setWaypointBehaviour "SAFE";

			_wp2 = _grp addWaypoint [(getMarkerPos "TOUR_mkr_base") getpos [500, 270], 0];
			_wp2 setWaypointType "MOVE";
			_wp2 setWaypointCombatMode "RED";
			_wp2 setWaypointBehaviour "SAFE";

			_wp2 = _grp addWaypoint [(getMarkerPos "TOUR_mkr_base") getpos [500, 0], 0];
			_wp2 setWaypointType "CYCLE";
			_wp2 setWaypointCombatMode "RED";
			_wp2 setWaypointBehaviour "SAFE";
		};
		_vehicle setFuel 1;
	};
	sleep 1;
};