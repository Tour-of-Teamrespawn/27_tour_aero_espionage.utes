TOUR_SF_Heli_1 doMove getPos TOUR_SF_land_1;

_types = 
[
	"rhsusf_usmc_recon_marpat_wd_teamleader_lite",
	"rhsusf_usmc_recon_marpat_wd_machinegunner_m249_lite",
	"rhsusf_usmc_recon_marpat_wd_rifleman_at_fast",
	"rhsusf_usmc_recon_marpat_wd_rifleman_at_fast",
	"rhsusf_usmc_recon_marpat_wd_marksman_lite",
	"rhsusf_usmc_recon_marpat_wd_marksman_lite",
	"rhsusf_usmc_recon_marpat_wd_autorifleman_lite",
	"rhsusf_usmc_recon_marpat_wd_rifleman_lite",
	"rhsusf_usmc_recon_marpat_wd_rifleman_lite"
];

_grp = createGroup WEST;
{
	_unit = _grp createUnit [_x, [0,0,100], [], 0, "NONE"];
	[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
	_unit setSkill ["courage", 1];
	_unit assignAsCargo TOUR_SF_heli_1;
	_unit moveInCargo TOUR_SF_heli_1;
}forEach _types;

waitUntil {sleep 5; TOUR_SF_Heli_1 doMove getPos TOUR_SF_land_1; (( moveToCompleted TOUR_SF_heli_1) or ((TOUR_SF_heli_1 distance TOUR_SF_land_1) < 150))};
TOUR_SF_heli_1 land "GET OUT"; 
waitUntil {sleep 5; TOUR_SF_heli_1 land "GET OUT"; (((getPosATL TOUR_SF_heli_1) select 2) < 5)};

{
	unassignVehicle _x;
}forEach units _grp;

waitUntil {sleep 1; {vehicle _x != _x && alive _x}count units _grp == 0};

TOUR_SF_Heli_1 doMove getPos TOUR_SF_helipad_11;

_wp1 = _grp addWaypoint [getMarkerPos "TOUR_mkr_SF_1", 0];
_wp1 setWaypointType "GUARD";
_wp1 setWaypointCombatMode "RED";
_wp1 setWaypointBehaviour "AWARE";