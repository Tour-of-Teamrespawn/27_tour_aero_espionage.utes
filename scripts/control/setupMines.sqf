_fields = [];
_keepers = [];
for "_i" from 1 to 19 do 
{
	if ((str (getMarkerPos (format ["TOUR_mkr_mine_%1", _i]))) != "[0,0,0]") then 
	{
		_fields pushBack (format ["TOUR_mkr_mine_%1", _i]);
	};
};

_airbaseFields = [];
for "_i" from 20 to 29 do 
{
	if ((str (getMarkerPos (format ["TOUR_mkr_mine_%1", _i]))) != "[0,0,0]") then 
	{
		_airbaseFields pushBack (format ["TOUR_mkr_mine_%1", _i]);
	};
};

for "_i" from 1 to 6 do 
{
	_field = selectRandom _fields;
	_keepers pushBack _field;
	_fields = _fields - [_field];
};

for "_i" from 1 to 2 do 
{
	_field = selectRandom _airbaseFields;
	_keepers pushBack _field;
	_airbaseFields = _airbaseFields - [_field];
};

{
	_marker = _x;
	{
		if (_x inArea _marker) then 
		{
			deleteVehicle _x;
		};
	}forEach (nearestObjects [(getMarkerPos _marker), ["Land_Sign_MinesTall_English_F"], 200]) + allmines;
	deleteMarker _marker;
}forEach (_fields + _airbaseFields);

{
	_marker = _x;
	{
		if (_x inArea _marker) then 
		{
			_x setPos [getpos _x select 0, getpos _x select 1, 0];
		};
	}forEach nearestObjects [(getMarkerPos _marker), ["Land_Sign_MinesTall_English_F"], 200];

	if !(TOUR_debug) then 
	{	
		deleteMarker _marker;
	};
}forEach _keepers;

{
	WEST revealMine _x;
}forEach allmines;