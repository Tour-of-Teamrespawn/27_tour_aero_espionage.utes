/* 
###MISSION_VERSION 0.1
*/

_d = execVM "scripts\general\debugRPT.sqf";
waitUntil {scriptDone _d};

_p = execVM "params.sqf";
waitUntil {scriptDone _p};

setViewDistance 2500;

enableRadio false;
{
	_x setVariable ["BIS_noCoreConversations",true];
} forEach allUnits;

TOUR_HQ = [EAST, "HQ"];

_f = execVM "scripts\functions\fn_init.sqf";
waitUntil {scriptDone _f};

TOUR_cables = [TOUR_powerCable_1, TOUR_powerCable_2, TOUR_powerCable_3, TOUR_powerCable_4, TOUR_powerCable_5];

execVM "scripts\general\intro.sqf";

_siAction = if (true) then
{
	" 
	((toLower (backpack player)) in	[""B_RadioBag_01_eaf_F""])
	"
}else
{
	"(alive player) && (""ItemRadio"" in (assignedItems player))"
};

si = 
[
	TOUR_core,
	EAST,
	_siAction,
	"false",
	false,
	[
		[
			"artillery",
			"Drakon",
			[
				["6rnd_155mm_mo_smoke", 100],
				["2rnd_155mm_mo_lg",3]
			]
		]
	]
] execVM "scripts\TOUR_SI\TOUR_SI_init.sqf";

TOUR_init_complete = true;








