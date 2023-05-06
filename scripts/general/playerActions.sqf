TOUR_playerActions = 
{

	_actionswitch1 = 	["Switch Off","Switch Off","",
					{
						TOUR_switch_1 setVariable ["TOUR_switchedOff", true, true];
						_order = (missionNameSpace getVariable "TOUR_switchedOff") select 0;
						_order pushback 1;
						missionNameSpace setVariable ["TOUR_switchedOff", [_order, time], true];
						[[],{
						TOUR_switch_1 say3d ["TOUR_clunk", 25];
						}] remoteExecCall ["BIS_fnc_spawn", 0, false];
					},
					{
						isNil {(TOUR_switch_1 getVariable "TOUR_switchedOff")}
					}
				] call ace_interact_menu_fnc_createAction;
				
	[TOUR_switch_1, 0, ["ACE_MainActions"], _actionswitch1 ]spawn ace_interact_menu_fnc_addActionToObject;

	_actionswitch2 = 	["Switch Off","Switch Off","",
					{
						TOUR_switch_2 setVariable ["TOUR_switchedOff", true, true];
						_order = (missionNameSpace getVariable "TOUR_switchedOff") select 0;
						_order pushback 2;
						missionNameSpace setVariable ["TOUR_switchedOff", [_order, time], true];
						[[],{
						TOUR_switch_2 say3d ["TOUR_clunk", 25];
						}] remoteExecCall ["BIS_fnc_spawn", 0, false];
					},
					{
						isNil {(TOUR_switch_2 getVariable "TOUR_switchedOff")}
					}
				] call ace_interact_menu_fnc_createAction;
				
	[TOUR_switch_2, 0, ["ACE_MainActions"], _actionswitch2 ]spawn ace_interact_menu_fnc_addActionToObject;

	_actionswitch3 = 	["Switch Off","Switch Off","",
					{
						TOUR_switch_3 setVariable ["TOUR_switchedOff", true, true];
						_order = (missionNameSpace getVariable "TOUR_switchedOff") select 0;
						_order pushback 3;
						missionNameSpace setVariable ["TOUR_switchedOff", [_order, time], true];
						[[],{
						TOUR_switch_3 say3d ["TOUR_clunk", 25];
						}] remoteExecCall ["BIS_fnc_spawn", 0, false];
					},
					{
						isNil {(TOUR_switch_3 getVariable "TOUR_switchedOff")}
					}
				] call ace_interact_menu_fnc_createAction;
				
	[TOUR_switch_3, 0, ["ACE_MainActions"], _actionswitch3 ]spawn ace_interact_menu_fnc_addActionToObject;

	{
		_actionCut = 	["Cut Cable","Cut Cable","",
						{
							_target setVariable ["TOUR_cut", true, true];
							[[_target], {_this select 0 setPosATL [0,0,0];}]remoteExecCall ["spawn", 2, false];
						},
						{
							({!isNil {_x getVariable "TOUR_cut"}}count TOUR_cables == 0)
						}
					] call ace_interact_menu_fnc_createAction;
					
		[_x, 0, ["ACE_MainActions"], _actionCut ]spawn ace_interact_menu_fnc_addActionToObject;
	}forEach TOUR_cables;

	[
		player,
		"Speak",
		"\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa",
		"\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa",
		"(cursorTarget isKindof ""man"") && (side cursorTarget == CIVILIAN) && (alive cursorTarget) && (isNil {cursorTarget getVariable ""TOUR_personSpoke""}) && !(isPlayer cursorTarget) && (player distance cursorTarget < 2)",
		"(cursorTarget isKindof ""man"") && (side cursorTarget == CIVILIAN) && (alive cursorTarget) && (isNil {cursorTarget getVariable ""TOUR_personSpoke""}) && !(isPlayer cursorTarget) && (player distance cursorTarget < 2)",
		{},
		{},
		{
			_redTalk = selectRandom [1, 2, 3];
			_order = selectRandom [true, false];
			_civTalk = selectRandom [1, 2, 3, 4, 5, 6, 7];
			TOUR_redWoldTalkOrder = [_redTalk, _order];
			TOUR_civilianTalk = _civTalk;
			publicVariable "TOUR_redWoldTalkOrder";
			publicVariable "TOUR_civilianTalk";			
			cursorTarget setVariable ["TOUR_personSpoke", true, true];
			if (cursorTarget == TOUR_scientist) then 
			{
				[[TOUR_scientist, player],"scripts\control\defectorSpeak.sqf"]remoteExecCall["execVM", 0, false];
			}else 
			{
				[[cursorTarget, player],"scripts\control\civSpeak.sqf"]remoteExecCall["execVM", 0, false];
			};
		},
		{},
		[],
		1,
		1,
		false,
		false
	] call BIS_fnc_holdActionAdd;

	_actionKEYPAD = 	["Use Keypad","Use Keypad","",
					{
						if (missionNameSpace getVariable "TOUR_KP_inuse" > 0) then
						{
							hint (["info", "Keypad In Use"] call TOUR_fnc_hint);
						}else 
						{
							createDialog "TOUR_KP_dlg";
						};
					},
					{
						((nearestObject [getpos TOUR_keypad_1, "Land_Ss_hangar"]) getVariable "bis_disabled_Door_7") == 1
					}
				] call ace_interact_menu_fnc_createAction;
				
	[TOUR_keypad_1, 0, ["ACE_MainActions"], _actionKEYPAD ]spawn ace_interact_menu_fnc_addActionToObject;

	_actionKEYPAD = 	["Use Keypad","Use Keypad","",
					{
						if (missionNameSpace getVariable "TOUR_KP_inuse" > 0) then
						{
							hint (["info", "Keypad In Use"] call TOUR_fnc_hint);
						}else 
						{
							createDialog "TOUR_KP_dlg";
						};
					},
					{
						((nearestObject [getpos TOUR_keypad_2, "Land_Ss_hangar"]) getVariable "bis_disabled_Door_7") == 1
					}
				] call ace_interact_menu_fnc_createAction;
				
	[TOUR_keypad_2, 0, ["ACE_MainActions"], _actionKEYPAD ]spawn ace_interact_menu_fnc_addActionToObject;

	_actionGear = 	["Change Loadout","Change Loadout","",
					{
						_target execVM "scripts\general\changeGear.sqf";
					},
					{
						!isNil {_target getVariable "TOUR_storedGear"};
					}
				] call ace_interact_menu_fnc_createAction;
	{			
		[_x, 0, ["ACE_MainActions"], _actionGear ]spawn ace_interact_menu_fnc_addActionToObject;
	}forEach [TOUR_sub_1, TOUR_sub_2, TOUR_sub_3, TOUR_sub_4, TOUR_sub_5, TOUR_sub_6, TOUR_sub_7, TOUR_sub_8, TOUR_sub_9];

};

[]call TOUR_playerActions;

player addEventHandler ["Respawn" ,
{
	[]call TOUR_playerActions;
}];