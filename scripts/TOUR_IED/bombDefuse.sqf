_ied = (nearestobjects [vehicle player, ["IEDLandBig_F","IEDLandSmall_F","IEDUrbanBig_F","IEDUrbanSmall_F"], 10]) select 0; //,"Land_GarbageHeap_03_F","Land_GarbageHeap_04_F"," Land_GarbagePallet_F","Land_GarbageWashingMachine_F","Land_GarbageBags_F"
_guy = _this select 1;
_id = _this select 2;

_randomIEDs = ["Land_GarbageHeap_03_F"];

_sequence = (_ied getVariable "TOUR_IED_bombSequence") select 0;
_timeLimit = (_ied getVariable "TOUR_IED_bombSequence") select 1;
_ok = true;
if (isNil {_guy getVariable "TOUR_IED_Expert"}) then
{
	_timeLimit = _timeLimit / 2;
	_ok = false;
	if (createDialog "TOUR_IED_bombDefuseQ") then
	{
		waitUntil {isNull (findDisplay 314158)};
		if (TOUR_IED_defuseAgree) then
		{
			_ok = true;
		};
	};
};
if (!("ACE_DefusalKit" in items _guy)) then
{
	_timeLimit = _timeLimit / 2;
	_ok = false;
	if (createDialog "TOUR_IED_bombDefuseQ") then
	{
		((findDisplay 314158) displayCtrl 999) ctrlSetStructuredText parsetext format ["You do not have a defusal kit on you. Defusing the IED is probably a bad idea... Do you want to try anyway?"];
		waitUntil {isNull (findDisplay 314158)};
		if (TOUR_IED_defuseAgree) then
		{
			_ok = true;
		};
	};
};
TOUR_IED_bombDefuseCurrent = _ied;
TOUR_IED_defuseStart = false;

if (_ok) then
{
	if (!createDialog "TOUR_IED_bombDefuse") then
	{
		hint "ERROR!\nCould not create TOUR_IED_bombDefuse dialog";
	}
	else
	{
		for "_i" from (count (toArray _sequence) + 1) to 8 do
		{
			ctrlShow [10 + _i, false];
			ctrlShow [20 + _i, false];
		};
		if (isNil {_guy getVariable "TOUR_IED_Expert"}) then {
			((findDisplay 314159) displayCtrl 1025) ctrlSetStructuredText parsetext format ["You cannot comprehend <br/>the technicals"];
			((findDisplay 314159) displayCtrl 1026) ctrlSetStructuredText parsetext format [""];
			((findDisplay 314159) displayCtrl 1027) ctrlSetStructuredText parsetext format [""];
		} else {
			((findDisplay 314159) displayCtrl 1025) ctrlSetStructuredText parsetext format ["<t font='PuristaBold'>Activation Type:</t> <br/>%1", (_ied getVariable "TOUR_IED_info") select 2];
			((findDisplay 314159) displayCtrl 1026) ctrlSetStructuredText parsetext format ["<t font='PuristaBold'>IED Size:</t> <br/>%1", (_ied getVariable "TOUR_IED_info") select 0];
			((findDisplay 314159) displayCtrl 1027) ctrlSetStructuredText parsetext format ["<t font='PuristaBold'>Explosive Mass:</t> <br/>%1", (_ied getVariable "TOUR_IED_info") select 1];
		};

		waitUntil {isNull (findDisplay 314159)};

		if (TOUR_IED_defuseStart) then
		{
			if (!createDialog "TOUR_IED_bombDefuse") then
			{
				hint "ERROR!\nCould not create TOUR_IED_bombDefuse dialog";
			}
			else
			{
				TOUR_IED_bombDefuseCurrent setVariable ["TOUR_IED_bombDefusedOk", false];
				waituntil {!isnil {TOUR_IED_bombDefuseCurrent getVariable "TOUR_IED_bombDefusedOk"}};
				TOUR_IED_bombDefuseCurrent setVariable ["TOUR_IED_bomb_bombstive", false, true];

				for "_i" from (count (toArray _sequence) + 1) to 8 do
				{
					ctrlShow [10 + _i, false];
					ctrlShow [20 + _i, false];
				};
 

				if (isNil {_guy getVariable "TOUR_IED_Expert"}) then {
					((findDisplay 314159) displayCtrl 1025) ctrlSetStructuredText parsetext format ["You cannot comprehend <br/>the technicals"];
					((findDisplay 314159) displayCtrl 1026) ctrlSetStructuredText parsetext format [""];
					((findDisplay 314159) displayCtrl 1027) ctrlSetStructuredText parsetext format [""];
				} else {
					((findDisplay 314159) displayCtrl 1025) ctrlSetStructuredText parsetext format ["<t font='PuristaBold'>Activation Type:</t> <br/>%1", (_ied getVariable "TOUR_IED_info") select 2];
					((findDisplay 314159) displayCtrl 1026) ctrlSetStructuredText parsetext format ["<t font='PuristaBold'>IED Size:</t> <br/>%1", (_ied getVariable "TOUR_IED_info") select 0];
					((findDisplay 314159) displayCtrl 1027) ctrlSetStructuredText parsetext format ["<t font='PuristaBold'>Explosive Mass:</t> <br/>%1", (_ied getVariable "TOUR_IED_info") select 1];
				};
				ctrlEnable [1, false];
				ctrlEnable [2, false];
				_dmg = damage player;
				_pos = ctrlPosition ((findDisplay 314159) displayCtrl 5);
				((findDisplay 314159) displayCtrl 5) ctrlSetPosition [_pos select 0, _pos select 1, 0, _pos select 3];
				((findDisplay 314159) displayCtrl 5) ctrlCommit _timeLimit;
				
				waitUntil {isNull _ied || isNull (findDisplay 314159) || _dmg > damage player || (ctrlPosition ((findDisplay 314159) displayCtrl 5)) select 2 == 0};				
				
				if (isNull _ied) then
				{
					closeDialog 314159;
				};
				
				if !(_ied getVariable "TOUR_IED_bombDefusedOk") then
				{ //Failed to defuse

					if (!isNull (findDisplay 314159)) then
					{
						closeDialog 314159;
					};
			
					if (random 1 >= 0.75) then
					{ //Luck of the Irish
						TOUR_IED_bombDefuseCurrent setVariable ["TOUR_IED_bombActive", true, true];
					}
					else
					{ //Bye bye
						_ied execVM "scripts\TOUR_IED\bombDetonate.sqf";
					};
				}
				else
				{ //Defused

					if (_ied in _randomIEDs) then {
						_ied setVariable ["TOUR_IED_bombActive", false, true];
					} else {
						deletevehicle _ied;	
					};

				};
			};
		};
	};
};


