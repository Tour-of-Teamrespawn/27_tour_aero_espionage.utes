if !(isNil "TOUR_supportCalled") exitWith
{

};

TOUR_supportCalled = true;
sleep (_this select 0);
TOUR_SF_GO = true;
execVM "scripts\control\specialForces.sqf";
if (random 5 < 4) then {execVM "scripts\control\specialForces2.sqf";};