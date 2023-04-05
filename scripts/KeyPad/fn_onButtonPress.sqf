private _display = (_this select 0) select 0;
private _number = _this select 1;
private _ctrl_number_1 = displayCtrl 1710;
private _ctrl_number_2 = displayCtrl 1711;
private _ctrl_number_3 = displayCtrl 1712;
private _ctrl_number_4 = displayCtrl 1713;

private _index = 0;
private ["_text"];

[[(nearestObject [getpos player, "helihempty"])], 
{
	if (!isDedicated) then 
	{
		(_this select 0) say3D ["TOUR_beep", 10];
	};
}]remoteExecCall["spawn", 0, true];

{
	_text = ctrlText _x;
	_index = _forEachIndex + 1;
	if (_text == "X") exitWith {TOUR_KP_numbers set [_forEachIndex, str _number];};
}forEach [_ctrl_number_1, _ctrl_number_2, _ctrl_number_3, _ctrl_number_4];

call compile format ["_ctrl_number_%1 ctrlSetText str _number", _index];

if ({_x == "X"}count TOUR_KP_numbers < 1) then 
{
	if (TOUR_KP_numbers isEqualTo (missionNameSpace getVariable "TOUR_accessCode")) then 
	{	
		(nearestObject [getpos player, "Land_Ss_hangar"]) setVariable ["bis_disabled_Door_7",0,true];
		missionNameSpace setVariable ["TOUR_KP_inuse", 2, true];
		closeDialog 0;
	}else 
	{
		closeDialog 0;
	};
};
