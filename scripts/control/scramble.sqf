waitUntil {sleep 1;("TOUR_objRadar" call BIS_fnc_taskState != "SUCCEEDED") && ((getposATL TOUR_plane select 2) > 5)};

for "_i" from 1 to 2 do 
{
	_veh = createvehicle ["rhsusf_f22", [0, 0, 700], [], 0, "FLY"];
	_veh setposASL [1000, 1000, 700];
	_grp = createVehicleCrew _veh;
	_veh setDir 35;
	_veh flyInHeight 200;
	_wp = _grp addWaypoint [getMarkerPos "TOUR_mkr_base", 0];
	_wp setWaypointType "GUARD";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointBehaviour "COMBAT";
	sleep 5;
};