_setup = selectRandom [[[3430.78,3695.28,0.5], 154],[[3751.7,3508,0.5], 49]];
TOUR_plane setDir (_setup select 1);
TOUR_plane setPosATL (_setup select 0);

TOUR_pilotDied = false;

[EAST, "TOUR_objPlane", ["Steal the plane located somewhere in the <marker name=""TOUR_mkr_base"">US Airbase</marker>, and fly it to <marker name=""TOUR_mkr_safe"">friendly airspace</marker>.", "Steal Plane", "Steal Plane"],  objNull, "ASSIGNED", -1, false, "takeoff"] call BIS_fnc_taskCreate;
[EAST, "TOUR_objMeet", ["Meet with the defector and obtain the access codes for the hangers and other intel. The defector is located somewhere in <marker name=""TOUR_mkr_Meet"">this town</marker>.", "Meet Defector", "TOUR_mkr_meet"],  objNull, "CREATED", -1, false, "meet"] call BIS_fnc_taskCreate;
[EAST, "TOUR_objComms", ["Disable the <marker name=""TOUR_mkr_objComms"">communications array</marker> to prevent distress calls.", "Disrupt Communications", "TOUR_mkr_objComms"],  objNull, "CREATED", -1, false, "upload"] call BIS_fnc_taskCreate;
[EAST, "TOUR_objRadar", ["Disable the <marker name=""TOUR_mkr_Radar"">radar</marker> to ensure the plane cannot be tracked.", "Disable Radar", "TOUR_mkr_Radar"],  objNull, "CREATED", -1, false, "destroy"] call BIS_fnc_taskCreate;
[EAST, "TOUR_objAA", ["Destroy 3 AA sites located across Utes.<br /><br /><marker name=""TOUR_mkr_AA_1"">Site 1</marker><br /><marker name=""TOUR_mkr_AA_2"">Site 2</marker><br /><marker name=""TOUR_mkr_AA_3"">Site 3</marker>", "Destroy AA", "TOUR_mkr_base"],  objNull, "CREATED", -1, false, "destroy"] call BIS_fnc_taskCreate;
[EAST, "TOUR_objrefuel", ["Refuel the plane by stealing a fuel truck from <marker name=""TOUR_mkr_fuel"">the supply depot</marker>.", "Refuel", "Refuel"],  objNull, "CREATED", -1, false, "refuel"] call BIS_fnc_taskCreate;

_a = execVM "scripts\control\setupAA.sqf";

_b = execVM "scripts\control\setupTower.sqf";

waitUntil {count (playableUnits + switchableUnits) > 0};
sleep 1;

private _fuel = false;

while {!TOUR_RC_EAST_DEAD && !TOUR_pilotDied} do
{

	if (({(alive _x) && ((vehicle _x) distance (getPosASL TOUR_fishing) > 100)} count (playableUnits + switchableUnits)) == 0) exitWith {};

	If (fuel TOUR_plane >= 0.99) then
	{
		["TOUR_objRefuel", "SUCCEEDED", true] call BIS_fnc_taskSetState;
	};	

	If (TOUR_plane inArea "TOUR_mkr_safe") exitWith 
	{
		
	};

	If (!(canMove TOUR_fuel) && ("TOUR_objrefuel" call BIS_fnc_taskState != "SUCCEEDED")) exitWith 
	{
		["TOUR_objRefuel", "FAILED", true] call BIS_fnc_taskSetState;
	};

	if (!alive TOUR_Scientist) then 
	{
		if (("TOUR_objMeet" call BIS_fnc_taskState) != "SUCCEEDED") then 
		{
			["TOUR_objMeet", "FAILED", true] call BIS_fnc_tasksetState;
		};
	};

	if ((damage TOUR_radar > 0.4) or (damage TOUR_radarGenerator > 0.5)or ({!isNil {_x getVariable "TOUR_cut"}}count TOUR_cables > 0)) then 
	{
		if (("TOUR_objRadar" call BIS_fnc_taskState) != "SUCCEEDED") then 
		{
			["TOUR_objRadar", "SUCCEEDED", true] call BIS_fnc_tasksetState;
			[{TOUR_radar animateSource ["Radar_Rotation",1, true];}]remoteExecCall ["spawn", 0, true];
		};
	};

	If ((damage TOUR_plane > 0.7)or(fuel TOUR_plane > 0 && !(canMove TOUR_plane))) exitWith 
	{

	};

	if (!isNil "TOUR_pilot") then 
	{
		if (!isNull TOUR_pilot) then 
		{
			if !(alive TOUR_pilot) then 
			{
				if (("TOUR_objplane" call BIS_fnc_taskState) != "FAILED") then 
				{
					["TOUR_objplane", "FAILED", true] call BIS_fnc_tasksetState;
					TOUR_pilotDied = true;
				};
			}else 
			{
				TOUR_pilotDied = false;
			};
		}else
		{
			[(["warning", "You require a pilot to complete this mission!"]call TOUR_fnc_hint)]remoteExecCall ["hint", 0, false];
			sleep 2;
		};
	}else 
	{
		[(["warning", "You require a pilot to complete this mission!"]call TOUR_fnc_hint)]remoteExecCall ["hint", 0, false];
		sleep 2;
	};
	sleep 0.5;
};

if ("TOUR_objRadar" call BIS_fnc_taskState != "SUCCEEDED") then
{
	["TOUR_objRadar", "FAILED", false] call BIS_fnc_taskSetState;
};
if ("TOUR_objAA" call BIS_fnc_taskState != "SUCCEEDED") then
{
	["TOUR_objAA", "FAILED", false] call BIS_fnc_taskSetState;
};
if ("TOUR_objrefuel" call BIS_fnc_taskState != "SUCCEEDED") then
{
	["TOUR_objrefuel", "FAILED", false] call BIS_fnc_taskSetState;
};
if ("TOUR_objComms" call BIS_fnc_taskState != "SUCCEEDED") then
{
	["TOUR_objComms", "FAILED", false] call BIS_fnc_taskSetState;
};
if ("TOUR_objMeet" call BIS_fnc_taskState != "SUCCEEDED") then
{
	["TOUR_objMeet", "FAILED", false] call BIS_fnc_taskSetState;
};
sleep 5;

if (TOUR_RC_EAST_DEAD) then 
{
	["kia", false, true, false] remoteExecCall ["BIS_fnc_endMission"];
}else 
{
	if (({alive _x && (vehicle _x distance (getPosASL TOUR_fishing) > 100)} count playableUnits + switchableUnits) == 0) then 
	{
		["abort", false, true, false] remoteExecCall ["BIS_fnc_endMission"];
	}else 
	{
		if (
				("TOUR_objrefuel" call BIS_fnc_taskState == "SUCCEEDED")
				&&
				(TOUR_plane inArea "TOUR_mkr_safe")
			) exitWith 
		{
			["TOUR_objPlane", "SUCCEEDED", true] call BIS_fnc_taskSetState;
			TOUR_plane allowDamage false;
			sleep 5;
			["complete", true, true, false] remoteExecCall ["BIS_fnc_endMission"];
		};
		if (
				("TOUR_objrefuel" call BIS_fnc_taskState != "SUCCEEDED")
				&&
				(TOUR_plane inArea "TOUR_mkr_safe")
			) exitWith 
		{
			["TOUR_objPlane", "SUCCEEDED", true] call BIS_fnc_taskSetState;
			TOUR_plane allowDamage false;
			sleep 5;
			["nofuel", false, true, false] remoteExecCall ["BIS_fnc_endMission"];
		};
		if (TOUR_pilotDied) exitWith
		{
			["pilotdead", false, true, false] remoteExecCall ["BIS_fnc_endMission"];
		};
		if ("TOUR_objrefuel" call BIS_fnc_taskState != "SUCCEEDED") exitWith
		{
			["TOUR_objPlane", "FAILED", true] call BIS_fnc_taskSetState;
			sleep 5;
			["fuel", false, true, false] remoteExecCall ["BIS_fnc_endMission"];
		};
		if !(canMove TOUR_plane) exitWith
		{
			["TOUR_objPlane", "FAILED", true] call BIS_fnc_taskSetState;
			sleep 5;
			["destroyed", false, true, false] remoteExecCall ["BIS_fnc_endMission"];
		};
	};
};
