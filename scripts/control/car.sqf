
_start = selectRandom [1, 5, 10, 15];
_rev = selectRandom [false, true];
_current = _start;
_markerPositions = [];
TOUR_enemyCar setPosATL (getMarkerPos format ["TOUR_mkr_carPat_%1", _start]);
for "_i" from 1 to 17 do 
{
	_markerPositions pushBack (getMarkerPos format ["TOUR_mkr_carPat_%1", _current]);
	if (_rev) then 
	{
		_current = _current - 1;
	}else 
	{
		_current = _current + 1;
	};
	
	if (_current > 17) then {_current = 1};
	if (_current < 1) then {_current = 17};
};

{
	_wp = (group driver TOUR_enemyCar) addWaypoint [_x, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";

	if (TOUR_debug) then 
	{
			_m = createMarker [(format ["TOUR_mkr_car_debug_%1", _forEachIndex + 1]), _x];
			_m setMarkerText (format ["%1", _forEachIndex + 1]);
			_m setMarkerType "MIL_DOT";
			_m setMarkerColor "COLORBLACK";
	};

}forEach _markerPositions;

_wp = (group driver TOUR_enemyCar) addWaypoint [(getMarkerPos format ["TOUR_mkr_carPat_%1", _start]), 0];
_wp setWaypointType "CYCLE";
_wp setWaypointCombatMode "RED";
_wp setWaypointBehaviour "SAFE";

TOUR_enemyCar limitSpeed 30;

while {alive driver TOUR_enemyCar} do 
{
	TOUR_enemyCar setFuel 1;
	sleep 5;
};