waitUntil {!isNil "TOUR_init_complete"};
waitUntil {player == player};
player setUnitFreefallHeight 5000;
waitUntil {!isNil {missionNameSpace getVariable "TOUR_meetLocation"}};

#include "hpp\briefing.hpp"

execVM "scripts\keyPad\fn_init.sqf";
execVM "scripts\general\playerActions.sqf";

player addMagazine "acex_intelitems_notepad";
if (TOUR_start == 0) then 
{
	[player] call zade_boc_fnc_actionOnChest;
	player addBackpack "B_Parachute";
};

if (TOUR_start == 1) then 
{
	execVM "scripts\general\changeGear.sqf";
};

execVM "scripts\general\radioChannelSetup.sqf";

waitUntil {!isNil "TOUR_introComplete"};


