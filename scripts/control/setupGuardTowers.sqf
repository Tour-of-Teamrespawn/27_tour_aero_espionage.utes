_types = 
[
	"rhsusf_usmc_marpat_wd_rifleman_m4",
	"rhsusf_usmc_marpat_wd_riflemanat",
	"rhsusf_usmc_marpat_wd_autorifleman_m249",
	"rhsusf_usmc_marpat_wd_machinegunner"
];

_towers = [];
_fortifications = allmissionobjects "Land_GuardTower_01_F";
for "_i" from 1 to (ceil (count _fortifications) / 1.5) do 
{
	_tower = (selectRandom _fortifications);
	_towers pushback _tower;
	_fortifications = _fortifications - [_tower];
};
{ 
	_pos = (_x buildingPos (ceil random 5));
	_grp = createGroup WEST;
	_unit = _grp createUnit ["rhsusf_usmc_marpat_wd_sniper_m110", _pos, [], 0, "NONE"]; 
	_unit setVariable ["lambs_danger_disableAI", true];
	_unit setPos _pos;
	_unit setDir (_x getRelDir _unit);
	_unit setUnitPos "UP";
	[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
}forEach _towers;

_towers = [];
_fortifications = allmissionobjects "land_guardtower_02_f";
for "_i" from 1 to (ceil (count _fortifications) / 1.5) do 
{
	_tower = (selectRandom _fortifications);
	_towers pushback _tower;
	_fortifications = _fortifications - [_tower];
};
{
	_pos = (_x buildingPos 0);
	_grp = createGroup WEST;
	_unit = _grp createUnit [(_types call BIS_fnc_selectRandom), _pos, [], 0, "NONE"]; 
	_unit setVariable ["lambs_danger_disableAI", true];
	_unit setPos _pos;
	_unit setDir (_x getRelDir _unit);
	_unit setUnitPos "UP";
	[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
}forEach _towers;

_towers = [];
_fortifications = allmissionobjects "land_vez";
for "_i" from 1 to (ceil (count _fortifications) / 1.5) do 
{
	_tower = (selectRandom _fortifications);
	_towers pushback _tower;
	_fortifications = _fortifications - [_tower];
};
{
	_pos = (_x buildingPos 1);
	_grp = createGroup WEST;
	_unit = _grp createUnit [(_types call BIS_fnc_selectRandom), _pos, [], 0, "NONE"]; 
	_unit setVariable ["lambs_danger_disableAI", true];
	_unit setPos _pos;
	_unit setDir (_x getRelDir _unit);
	_unit setUnitPos "UP";
	[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
}forEach _towers;

_towers = [];
_fortifications = allmissionobjects "land_ind_illuminanttower";
for "_i" from 1 to (ceil (count _fortifications) / 2) do 
{
	_tower = (selectRandom _fortifications);
	_towers pushback _tower;
	_fortifications = _fortifications - [_tower];
};
{
	_pos = (_x buildingPos 0);
	_grp = createGroup WEST;
	_unit = _grp createUnit ["rhsusf_usmc_marpat_wd_sniper_m110", _pos, [], 0, "NONE"]; 
	_unit setVariable ["lambs_danger_disableAI", true];
	_unit setPos _pos;
	_unit setDir (random 360);
	_unit setUnitPos "UP";
	[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
}forEach _towers;

_towers = [];
_fortifications = allmissionobjects "uk3cb_nest_jun";
for "_i" from 1 to (ceil (count _fortifications) / 2) do 
{
	_tower = (selectRandom _fortifications);
	_towers pushback _tower;
	_fortifications = _fortifications - [_tower];
};
{
	deleteVehicle _x;
}forEach _fortifications;
{
	_pos = _x modelToWorld [-0.114258,-0.428223,-0.78421];
	_grp = createGroup WEST;
	_unit = _grp createUnit ["rhsusf_usmc_marpat_wd_machinegunner", _pos, [], 0, "NONE"]; 
	_unit setVariable ["lambs_danger_disableAI", true];
	_unit setDir ((getDir _x) + 180);
	_unit setUnitPos "middle";
	_unit setPos _pos;
	[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
	_unit setSkill ["courage", 1];
	_unit allowFleeing 0;
}forEach _towers;

{
	if (ceil random 2 > 1) then 
	{
		_pos = _x modelToWorld [-0.101074,-1.96484,0.49498];
		_gun = "UK3CB_B_Static_M240_Elcan_High_USMC_W" createVehicle _pos;
		_gun setpos _pos;
		_gun setDir ((getDir _x) + 270);
		_grp = createGroup WEST;
		_unit = _grp createUnit [(_types call BIS_fnc_selectRandom), _pos, [], 0, "NONE"]; 
		[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
		_unit assignAsGunner _gun;
		_unit moveInGunner _gun;
	}else 
	{
		_pos = _x modelToWorld [0.126465,0.588867,-2.20859];
		_grp = createGroup WEST;
		_unit = _grp createUnit [(_types call BIS_fnc_selectRandom), _pos, [], 0, "NONE"]; 
		_unit setVariable ["lambs_danger_disableAI", true];
		_unit setPos _pos;
		_unit setDir (random 360);
		_unit setUnitPos "UP";
		[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
	};
	if (ceil random 2 > 1) then 
	{
		_pos = _x modelToWorld [-0.483398,-1.21484,-2.20859];
		_grp = createGroup WEST;
		_unit = _grp createUnit [(_types call BIS_fnc_selectRandom), _pos, [], 0, "NONE"];
		_unit setVariable ["lambs_danger_disableAI", true];
		_unit setPos _pos;
		_unit setDir (random 360);
		[_unit, TOUR_EnemySFs, TOUR_EnemySnipers] call TOUR_fnc_skillAI;
	};	
}forEach allmissionObjects "land_bagBunker_tower_f";