waituntil {!(IsNull (findDisplay 46))};
disableSerialization;

if (missionNameSpace getVariable "TOUR_KP_inuse" > 0) exitWith
{
	hint (["info", "Keypad In Use"] call TOUR_fnc_hint);
	closeDialog 0;
};

private _display = _this select 0;
private _ctrl_btn_Exit = _display displayCtrl 1715;
private _ctrl_btn_0 = _display displayCtrl 1700;
private _ctrl_btn_1 = _display displayCtrl 1701;
private _ctrl_btn_2 = _display displayCtrl 1702;
private _ctrl_btn_3 = _display displayCtrl 1703;
private _ctrl_btn_4 = _display displayCtrl 1704;
private _ctrl_btn_5 = _display displayCtrl 1705;
private _ctrl_btn_6 = _display displayCtrl 1706;
private _ctrl_btn_7 = _display displayCtrl 1707;
private _ctrl_btn_8 = _display displayCtrl 1708;
private _ctrl_btn_9 = _display displayCtrl 1709;
private _ctrl_number_1 = _display displayCtrl 1710;
private _ctrl_number_2 = _display displayCtrl 1711;
private _ctrl_number_3 = _display displayCtrl 1712;
private _ctrl_number_4 = _display displayCtrl 1713;

_ctrl_btn_Exit ctrlSetEventHandler ["ButtonDown", "[_this, true, true] call TOUR_KP_fn_onUnload"];
_ctrl_btn_0 ctrlSetEventHandler ["ButtonDown", "[_this, 0] call TOUR_KP_fn_onButtonPress"];
_ctrl_btn_1 ctrlSetEventHandler ["ButtonDown", "[_this, 1] call TOUR_KP_fn_onButtonPress"];
_ctrl_btn_2 ctrlSetEventHandler ["ButtonDown", "[_this, 2] call TOUR_KP_fn_onButtonPress"];
_ctrl_btn_3 ctrlSetEventHandler ["ButtonDown", "[_this, 3] call TOUR_KP_fn_onButtonPress"];
_ctrl_btn_4 ctrlSetEventHandler ["ButtonDown", "[_this, 4] call TOUR_KP_fn_onButtonPress"];
_ctrl_btn_5 ctrlSetEventHandler ["ButtonDown", "[_this, 5] call TOUR_KP_fn_onButtonPress"];
_ctrl_btn_6 ctrlSetEventHandler ["ButtonDown", "[_this, 6] call TOUR_KP_fn_onButtonPress"];
_ctrl_btn_7 ctrlSetEventHandler ["ButtonDown", "[_this, 7] call TOUR_KP_fn_onButtonPress"];
_ctrl_btn_8 ctrlSetEventHandler ["ButtonDown", "[_this, 8] call TOUR_KP_fn_onButtonPress"];
_ctrl_btn_9 ctrlSetEventHandler ["ButtonDown", "[_this, 9] call TOUR_KP_fn_onButtonPress"];

missionNameSpace setVariable ["TOUR_KP_inuse", 1, true];
TOUR_KP_numbers = ["X", "X", "X", "X"];

{
	_x ctrlSetStructuredText parsetext "<t size='1.25' font='TahomaB' color='#D0D0D0' align='center' valign='center'>X</t>";
}forEach [_ctrl_number_1, _ctrl_number_2, _ctrl_number_3, _ctrl_number_4];