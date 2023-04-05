params ["_defector", "_player"];

private _distance = 30;

if (alive _player) then 
{
		if (TOUR_redWoldTalkOrder select 1) then 
		{
			_player setRandomLip true; 
			_player say3D ["TOUR_redwolf", _distance];
			sleep 2;
		};
		sleep 0.5;
		_player setRandomLip false; 
};

if (alive _player) then 
{
		_player setRandomLip true; 
		_player say3D [format ["TOUR_redwolf_info_%1", TOUR_redWoldTalkOrder select 0], _distance];
		sleep 2.5;
		_player setRandomLip false; 
		sleep 0.5;
};

if (alive _player) then 
{
		if !(TOUR_redWoldTalkOrder select 1) then 
		{
			_player setRandomLip true; 
			_player say3D ["TOUR_redwolf", _distance];
			sleep 2;
		};
		sleep 0.5;
		_player setRandomLip false; 
};

sleep 1;

if (alive _defector) then 
{
		_defector setRandomLip true; 
		_defector say3D ["TOUR_defector_hello", _distance];
		sleep 7;
		_defector setRandomLip false; 
		sleep 0.5;
};

if (alive _defector) then 
{
		_defector setRandomLip true; 
		_defector say3D ["TOUR_defector_intel", _distance];
		sleep 6;
		_defector setRandomLip false; 
		sleep 0.5;
};

if (alive _defector) then 
{
		_defector setRandomLip true; 
		_defector say3D ["TOUR_defector_powerdown", _distance];
		sleep 4.5;
		_defector setRandomLip false; 
		sleep 0.5;
};

if (alive _defector) then 
{
		_defector setRandomLip true; 
		_defector say3D ["TOUR_defector_heartbeat", _distance];
		sleep 5;
		_defector setRandomLip false; 
		sleep 0.5;
};

if (alive _defector) then 
{
		_defector setRandomLip true; 
		_defector say3D ["TOUR_defector_reinf", _distance];
		sleep 7;
		_defector setRandomLip false; 
		sleep 0.5;
};

if (alive _defector) then 
{
		_defector setRandomLip true; 
		_defector say3D ["TOUR_defector_order", _distance];
		sleep 3.5;
		_defector setRandomLip false; 
		sleep 0.5;
};

private _order = missionNameSpace getVariable "TOUR_switchOffOrder";

if (alive _defector) then 
{
	_defector setRandomLip true; 
	_defector say3D [format ["TOUR_defector_order_%1", (_order select 0)], _distance];
	sleep 1;
};

if (alive _defector) then 
{
	_defector say3D [format ["TOUR_defector_order_%1", (_order select 1)], _distance];
	sleep 1;
};

if (alive _defector) then 
{
	_defector say3D [format ["TOUR_defector_order_%1", (_order select 2)], _distance];
	sleep 1;
};

_defector setRandomLip false; 
sleep 1;

if (alive _defector) then 
{
		_defector setRandomLip true; 
		_defector say3D ["TOUR_defector_quickly", _distance];
		sleep 6;
		_defector setRandomLip false; 
		sleep 0.5;
};

if (alive _defector) then 
{
		_defector setRandomLip true; 
		if (((getpos TOUR_plane) select 1) > 3550) then 
		{
			_defector say3D ["TOUR_defector_northern", _distance];
		}else 
		{
			_defector say3D ["TOUR_defector_southern", _distance];
		};
		sleep 4;
		_defector setRandomLip false; 
		sleep 0.5;
};

private _code = missionNameSpace getVariable "TOUR_accessCode";

if (alive _defector) then 
{
	_defector setRandomLip true; 
	_defector say3D ["TOUR_defector_access", _distance];
	sleep 3.5;
	_defector setRandomLip false; 
	sleep 1;
};

if (alive _defector) then 
{
	_defector setRandomLip true; 
	_defector say3D [format ["TOUR_defector_%1", (_code select 0)], _distance];
	sleep 1.2;
};

if (alive _defector) then 
{
	_defector setRandomLip true; 
	_defector say3D [format ["TOUR_defector_%1", (_code select 1)], _distance];
	sleep 1.2;
};

if (alive _defector) then 
{
	_defector setRandomLip true; 
	_defector say3D [format ["TOUR_defector_%1", (_code select 2)], _distance];
	sleep 1.2;
};

if (alive _defector) then 
{
	_defector setRandomLip true; 
	_defector say3D [format ["TOUR_defector_%1", (_code select 3)], _distance];
	sleep 1.2;
};

_defector setRandomLip false; 
sleep 2;

if (alive _defector) then 
{
		_defector setRandomLip true; 
		_defector say3D ["TOUR_defector_goodbye", _distance];
		sleep 3;
		_defector setRandomLip false; 
		sleep 0.5;
};

if (isServer) then 
{
	if (alive _defector) then 
	{
		if (("TOUR_objMeet" call BIS_fnc_taskState) != "FAILED") then 
		{
			["TOUR_objMeet", "SUCCEEDED", true] call BIS_fnc_tasksetState;
		};
	};
};