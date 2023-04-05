private _positions = []; 

{ 
	_pos = TOUR_tower_1 worldToModel ASLToAGL getPosASL _x; 
	_dir = getDir _x; 
	_positions pushback [_x, _pos, _dir]; 
}forEach [TOUR_switch_1, TOUR_switch_2, TOUR_switch_3]; 

_towers = [TOUR_tower_1, TOUR_tower_2, TOUR_tower_3, TOUR_tower_4];
_tower = selectRandom _towers;
_towers = _towers - [_tower];
{
	deleteVehicle _x;
}forEach _towers;

{
	if (_tower distance _x > 100) then 
	{
		deletevehicle _x;
	};
}forEach [TOUR_trg_tower_1, TOUR_trg_tower_2, TOUR_trg_tower_3, TOUR_trg_tower_4];

"TOUR_mkr_objComms" setMarkerPos getpos _tower;

{ 
	_switch = _x select 0; 
	_pos = _x select 1; 
	_dir = _x select 2; 
	
	_newPos = (_tower modelToWorldWorld _pos); 
	_switch setPosASL _newpos; 
	_switch setDir _dir; 
} forEach _positions;

TOUR_switchOffOrder = [];
private _order = [1,2,3];
private _timeOut = false;
_intTime = (ceil random 6) * 10;
private _timerDone = 30 + _intTime;

for "_i" from 1 to 3 do 
{
	_num = selectRandom _order;
	TOUR_switchOffOrder pushback _num;
	_order = _order - [_num];
};

missionNameSpace setVariable ["TOUR_switchedOff", [], true];
missionNameSpace setVariable ["TOUR_switchOffOrder", TOUR_switchOffOrder, true];
missionNamespace setVariable ["TOUR_switchTime", _timerDone, true];

while {(count (missionNameSpace getVariable "TOUR_switchedOff") < 2) && (damage _tower < 0.7)} do 
{
	_items = (missionNameSpace getVariable "TOUR_switchedOff");
	if (count _items > 0) then 
	{
		_time = _x select 0;
		if (time > _time + (missionNameSpace getVariable "TOUR_switchTime")) then 
		{
			_timeOut = true;
		};
	};
	if (_timeOut) exitWith {};
	sleep 1;
};

if ((TOUR_switchOffOrder isEqualTo (missionNameSpace getVariable "TOUR_switchedOff")) && !(_timeOut) && (damage _tower < 0.7)) then 
{
	["TOUR_objComms", "SUCCEEDED", false] call BIS_fnc_taskSetState;
}else 
{
	["TOUR_objComms", "FAILED", false] call BIS_fnc_taskSetState;
	[300] execVM "scripts\control\carrierSupport.sqf";
};

