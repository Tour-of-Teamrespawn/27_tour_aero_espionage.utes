waitUntil {!isNil "TOUR_init_complete"};

tour_garbagearray = [];
tour_mission_units = [];
execVM "scripts\control\garbageLoop.sqf";

if (TOUR_start == 0) then 
{
	"TOUR_mkr_start" setMarkerPos getpos TOUR_c130;
};
if (TOUR_start == 1) then 
{
	"TOUR_mkr_start" setMarkerPos getpos TOUR_sub_4;
};

TOUR_lamp_1 setposASL (TOUR_C130 modelToWorld [-0.0205078,-6.7,-1.1]); TOUR_lamp_1 setVectorUp  [0,0,-1];
TOUR_lamp_2 setposASL (TOUR_C130 modelToWorld [-0.00585938,2.38184,-1.1]); TOUR_lamp_2 setVectorUp  [0,0,-1.1];

createCenter WEST; WEST setFriend [EAST, 0]; WEST setFriend [RESISTANCE, 1]; WEST setFriend [CIVILIAN, 1];
createCenter EAST; EAST setFriend [WEST, 0]; EAST setFriend [RESISTANCE, 1]; EAST setFriend [CIVILIAN, 1];
createCenter RESISTANCE; RESISTANCE setFriend [WEST, 1]; RESISTANCE setFriend [EAST, 1]; RESISTANCE setFriend [CIVILIAN, 1];
createCenter CIVILIAN; CIVILIAN setFriend [WEST, 1]; CIVILIAN setFriend [EAST, 1]; CIVILIAN setFriend [RESISTANCE, 1];
SIDELOGIC setFriend [WEST, 1]; SIDELOGIC setFriend [EAST, 1]; SIDELOGIC setFriend [RESISTANCE, 1];

TOUR_EnemyInfMen = 
[
	"rhsusf_usmc_marpat_wd_teamleader",
	"rhsusf_usmc_marpat_wd_rifleman",
	"rhsusf_usmc_marpat_wd_autorifleman_m249",
	"rhsusf_usmc_marpat_wd_grenadier",
	"rhsusf_usmc_marpat_wd_machinegunner",
	"rhsusf_usmc_marpat_wd_riflemanat",
	"rhsusf_usmc_marpat_wd_rifleman",
	"rhsusf_usmc_marpat_wd_rifleman",
	"rhsusf_usmc_marpat_wd_autorifleman_m249",
	"rhsusf_usmc_marpat_wd_grenadier",
	"rhsusf_usmc_marpat_wd_machinegunner",
	"rhsusf_usmc_marpat_wd_riflemanat",
	"rhsusf_usmc_marpat_wd_rifleman"
];

TOUR_EnemySFs = 
[
	"rhsusf_usmc_recon_marpat_wd_machinegunner_m249_fast",
	"rhsusf_usmc_recon_marpat_wd_machinegunner_m249",
	"rhsusf_usmc_recon_marpat_wd_officer",
	"rhsusf_usmc_recon_marpat_wd_autorifleman",
	"rhsusf_usmc_recon_marpat_wd_machinegunner_m249_lite",
	"rhsusf_usmc_recon_marpat_wd_autorifleman_fast",
	"rhsusf_usmc_recon_marpat_wd_teamleader_lite",
	"rhsusf_usmc_recon_marpat_wd_teamleader",
	"rhsusf_usmc_recon_marpat_wd_rifleman_at",
	"rhsusf_usmc_recon_marpat_wd_rifleman_fast",
	"rhsusf_usmc_recon_marpat_wd_marksman_lite",
	"rhsusf_usmc_recon_marpat_wd_marksman",
	"rhsusf_usmc_recon_marpat_wd_grenadier_m32",
	"rhsusf_usmc_recon_marpat_wd_autorifleman_lite",
	"rhsusf_usmc_recon_marpat_wd_machinegunner",
	"rhsusf_usmc_recon_marpat_wd_marksman_fast",
	"rhsusf_usmc_recon_marpat_wd_rifleman",
	"rhsusf_usmc_recon_marpat_wd_rifleman_lite",
	"rhsusf_usmc_recon_marpat_wd_rifleman_at_fast",
	"rhsusf_usmc_recon_marpat_wd_sniper_m107",
	"rhsusf_usmc_recon_marpat_wd_teamleader_fast"
];

TOUR_EnemySnipers = 
[
	"rhsusf_usmc_marpat_wd_sniper_m110"
];

TOUR_EnemyInfGrp = 
[
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_squad"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_squad"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_squad"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_squad"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_squad"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_squad"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_squad"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_weaponsquad"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_weaponsquad"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_weaponsquad"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_weaponsquad"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_team"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_team"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_team_AA"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_team_heavy_AT"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_team_heavy_AT"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_team_MG"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_team_MG"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_team_support"],
	["rhs_group_nato_usmc_wd_infantry", "rhs_group_nato_usmc_wd_infantry_squad_sniper"],
	["rhs_group_nato_usmc_recon_wd_infantry", "rhs_group_nato_usmc_recon_wd_infantry_team"],
	["rhs_group_nato_usmc_recon_wd_infantry", "rhs_group_nato_usmc_recon_wd_infantry_team"],
	["rhs_group_nato_usmc_recon_wd_infantry", "rhs_group_nato_usmc_recon_wd_infantry_team"]
];

{
	if (side _x == WEST) then 
	{
		[_x, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
	};
}ForEach allUnits;

execVM "scripts\control\setupScientist.sqf";
waitUntil {!isNil {missionNameSpace getVariable "TOUR_meetLocation"}};
execVM "scripts\control\setupObjectives.sqf";

execVM "scripts\control\setupGuardTowers.sqf";
execVM "scripts\control\setupMines.sqf";

TOUR_reinforcementRequest = [];
execVM "scripts\control\reinforcements.sqf";

TOUR_airbaseRequest = [];
execVM "scripts\control\airbaseAlert.sqf";

TOUR_heliRequest = [];
execVM "scripts\control\heliAlert.sqf";

execVM "scripts\control\boat.sqf";

execVM "scripts\control\car.sqf";

execVM "scripts\control\scramble.sqf";

TOUR_redWoldTalkOrder = [1, false];
TOUR_civilianTalk = 1;

publicVariable "TOUR_redWoldTalkOrder";
publicVariable "TOUR_civilianTalk";

missionNameSpace setVariable ["TOUR_KP_inuse", 0, true];
(nearestObject [getpos TOUR_keypad_1, "Land_Ss_hangar"]) setVariable ["bis_disabled_Door_7",1,true];
(nearestObject [getpos TOUR_keypad_2, "Land_Ss_hangar"]) setVariable ["bis_disabled_Door_7",1,true];

 [ 
	"UK3CB_CHC_C_Gaz24", 
	"UK3CB_CHC_C_Hatchback", 
	"UK3CB_CHC_C_S1203", 
	"UK3CB_CHC_C_Hilux_Civ_Open", 
	"UK3CB_CHC_C_Hilux_Civ_closed", 
	"UK3CB_CHC_C_Kamaz_Open", 
	"UK3CB_CHC_C_golf", 
	"UK3CB_CHC_C_Lada", 
	"UK3CB_CHC_C_Sedan", 
	"UK3CB_CHC_C_V3S_Closed", 
	"UK3CB_CHC_C_Ural_Recovery", 
	"UK3CB_CHC_C_Skoda", 
	"UK3CB_CHC_C_pickup", 
	"UK3CB_CHC_C_landcruiser", 
	"UK3CB_CHC_C_Datsun_Civ_Closed", 
	"UK3CB_CHC_C_Datsun_Civ_open", 
	"UK3CB_CHC_C_yava" 
 ]execVM "scripts\ambientlife\ambientStaticVehicles.sqf";

TOUR_initServer_complete = true;