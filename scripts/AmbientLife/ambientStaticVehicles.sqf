private ["_vehicles", "_array", "_car", "_info"];
_vehicles = _this;
_array = [];

{
		_array pushBack [getPos _x, getDir _x];
		deleteVehicle _x;
}forEach allmissionObjects "rhs_ural_civ_01";
sleep 1;

for "_i" from 1 to ceil ((count _array) / 1.4) do 
{
	_info =  selectRandom _array;
	_array = _array - [_info];
	_car = createVehicle [selectRandom _vehicles, [10, 10, 0], [], 0, "NONE"];
	_car setDir (_info select 1);
	_car setPos (_info select 0);
	_car lock true;
};