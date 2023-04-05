
_start = selectRandom [1, 7, 15, 19];
_rev = selectRandom [false, true];
_current = _start;
_markerPositions = [];
TOUR_enemyBoat setPosASL (getMarkerPos format ["TOUR_mkr_boat_%1", _start]);
for "_i" from 1 to 24 do 
{
	_markerPositions pushBack (getMarkerPos format ["TOUR_mkr_boat_%1", _current]);
	if (_rev) then 
	{
		_current = _current - 1;
	}else 
	{
		_current = _current + 1;
	};
	
	if (_current > 24) then {_current = 1};
	if (_current < 1) then {_current = 24};
};

{
	_wp = (group driver TOUR_enemyBoat) addWaypoint [_x, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";

	if (TOUR_debug) then 
	{
			_m = createMarker [(format ["TOUR_mkr_boat_debug_%1", _forEachIndex + 1]), _x];
			_m setMarkerText (format ["%1", _forEachIndex + 1]);
			_m setMarkerType "MIL_DOT";
			_m setMarkerColor "COLORRED";
	};

}forEach _markerPositions;

_wp = (group driver TOUR_enemyBoat) addWaypoint [(getMarkerPos format ["TOUR_mkr_boat_%1", _start]), 0];
_wp setWaypointType "CYCLE";
_wp setWaypointCombatMode "RED";
_wp setWaypointBehaviour "SAFE";

while {alive driver TOUR_enemyBoat} do 
{
	TOUR_enemyBoat setFuel 1;
	sleep 5;
};