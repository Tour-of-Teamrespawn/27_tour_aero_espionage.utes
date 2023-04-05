if (isDedicated) exitWith {};

waitUntil { ([] call acre_api_fnc_isinitialized) };
sleep 1;
private ["_channel"];
_channel = switch (toLower (groupID (group player))) do 
{
	case "red wolf actual": {5};
	case "red wolf one": {1};
	case "red wolf two": {2};
	case "red wolf three": {3};
	case "red wolf four": {4};
	default {5};
};
waitUntil {[player, "ACRE_PRC343"] call acre_api_fnc_hasKindOfRadio};
sleep 1;
[(["ACRE_PRC343"] call acre_api_fnc_getRadioByType), _channel] call acre_api_fnc_setRadioChannel;