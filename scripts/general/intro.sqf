
if (isServer) then 
{
	if (TOUR_start == 0) then 
	{
		[] spawn 
		{
			sleep 1;
			[[], {{_x allowDamage false;}forEach (playableUnits + switchableUnits);}] remoteExec ["BIS_fnc_Spawn", 0, false];
			sleep 2;
			{
				if (side _x == EAST) then 
				{
					_position = _x call TOUR_fnc_startPos;
					_x setposASL (TOUR_C130 modeltoworld _position);
					[[_x], {sleep 0.5; (_this select 0) switchMove "stand"; sleep 0.5; doStop (_this select 0);(_this select 0) setDir (getDir TOUR_C130);}] remoteExec ["BIS_fnc_Spawn", 0, false];
					sleep 1.1;
					[[], {{_x allowDamage true;}forEach (playableUnits + switchableUnits);}] remoteExec ["BIS_fnc_Spawn", 0, false];
				};
			}forEach (playableUnits + switchableUnits);
		};
	};
};


if (!isDedicated) then 
{
	if (side player != EAST) exitWith {};

	if (TOUR_Start == 0 && time > 1) then 
	{	
		if (TOUR_start == 0) then 
		{
			_position = player call TOUR_fnc_startPos;
			player setposASL (TOUR_C130 modeltoworld _position);
			player setDir (getDir TOUR_C130);
			[[player], { (_this select 0) allowDamage false; sleep 1; (_this select 0) switchMove "stand"; sleep 1; doStop (_this select 0); (_this select 0) allowDamage true;}] remoteExec ["BIS_fnc_Spawn", 0, false];
		};
	};

	if (TOUR_start == 1) then 
	{
		execVM "scripts\general\changeGear.sqf";
	};

	private ["_cam1"];
	if (TOUR_introEnable) then 
	{
		0 fadeSound 0;
		sleep 0.1;
		cutText ["Loading Intro","BLACK FADED", 0];
		_cam1 = "camera" camCreate [2163,3310,355];
		_cam1 camSetTarget [3102,3744,31];
		_cam1 camCommit 0;
		_cam1 cameraEffect ["internal", "back"];
		sleep 5;
		_cam1 camSetTarget [3102,3744,31];
		_cam1 camCommit 0;
		
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [5];
		"dynamicBlur" ppEffectCommit 0;
		sleep 3;
		cutText [" ","BLACK IN", 5];
		"dynamicBlur" ppEffectAdjust [0];
		"dynamicBlur" ppEffectCommit 8;
		5 fadeSound 1;
		[]spawn 
		{
			sleep 9;
			_text = ["U","S"," ","A","i","r","b","a","s","e","\n","U","t","e","s"];
			_display = "";
			_pointer = 0;
			_sleepTime = 0.1;

			while {_pointer < count _text} do
			{
				_display = _display + (_text select _pointer);
				titleText [_display,"PLAIN down",_sleepTime];
				_pointer = _pointer + 1;
				if (_pointer == count _text) then
				{
					cutText [_display,"PLAIN down",1];
				}
				else
				{
					playSound "TOUR_key_noise";
				};
				sleep _sleepTime;
			};
		};
		
		sleep 17;

		"dynamicBlur" ppEffectAdjust [5];
		"dynamicBlur" ppEffectCommit 2.5;
		cutText ["","BLACK OUT", 2];	

		sleep 2.5;
	};

	if (TOUR_Start == 0) then 
	{
		[TOUR_C130] spawn TOUR_fnc_noiseC130;
		if (TOUR_introEnable) then 
		{
			_newPos = TOUR_C130 modelToWorld [0,20,-6];
			_cam1 camSetPos _newPos;
			_cam1 camCommit 0;
			sleep 4;
			//face rear of plane
			_newPos = TOUR_C130 modelToWorld [0,0,-3];
			_cam1 camSetPos _newPos;
			_cam1 camCommit 15;
			_cam1 camprepareTarget _newPos;
			_cam1 camCommitprepared 0;

			"dynamicBlur" ppEffectAdjust [0];
			"dynamicBlur" ppEffectCommit 2.5;
			cutText ["","BLACK IN", 2];

			sleep 5.5;

		};

		TOUR_C130 animate ["ramp_bottom",1];
		TOUR_C130 animate ["ramp_top",1];

		execVM "scripts\general\lighting.sqf";

		if (TOUR_introEnable) then 
		{
			sleep 5.5;
			"dynamicBlur" ppEffectAdjust [5];
			"dynamicBlur" ppEffectCommit 2.5;
			cutText ["","BLACK OUT", 2];
			
			sleep 2;
			_cam1 cameraEffect ["TERMINATE", "back"];
			sleep 1;
			cutText ["","BLACK IN", 2];
			"dynamicBlur" ppEffectAdjust [0];
			"dynamicBlur" ppEffectCommit 2.5;
		};

		TOUR_initroDone = true;
		sleep 5;
		waitUntil {!isNil "TOUR_initroDone"};
		hint str ((player worldtomodel getposASL TOUR_c130) select 2);
		waitUntil {(((player worldtomodel getposASL TOUR_c130) select 2) < 0)};
		waitUntil {(((player worldtomodel getposASL TOUR_c130) select 2) > 0.3)};
		player setDir 180;
		sleep 0.2;
		player setvelocity [0,270*1.0,0]; // was 270*0.8 

		waitUntil {((getPosATL player) select 2) < 1000 && ((getPosATL player) select 1) > 2700};

		private _text = "<t font='PuristaBold' size='1.6'>[Tour] Aero Espionage</t><br />by Mr.Ben";
		[parseText _text, true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;

		waitUntil {((getPosASL player) select 2) < 500 or (vehicle player != player)};
		if (TOUR_autoChute) then 
		{
			waitUntil {((getposATL player) select 2) < 150};
			if (((getposATL player) select 2) > 10) then 
			{
				player action ["OpenParachute", player];
			};
		};	
	};

	if (TOUR_Start == 1) then 
	{
		if (TOUR_introEnable) then 
		{
			_newPos = (vehicle player) modelToWorld [-15,-25,5];
			_cam1 camSetPos _newPos;
			_cam1 camCommit 0;
			sleep 3;
			//face rear of sub
			_newPos = (vehicle player) modelToWorld [0,0,0];
			_cam1 camprepareTarget _newPos;
			_cam1 camCommitprepared 0;

			"dynamicBlur" ppEffectAdjust [0];
			"dynamicBlur" ppEffectCommit 2.5;
			cutText ["","BLACK IN", 2];
			sleep 4;
			_cam1 camSetPos _newPos;
			_cam1 camCommit 10;
			sleep 5;
			"dynamicBlur" ppEffectAdjust [5];
			"dynamicBlur" ppEffectCommit 2.5;
			cutText ["","BLACK OUT", 2];
			sleep 2.5;

			_cam1 cameraEffect ["TERMINATE", "back"];	
			sleep 0.5;
			"dynamicBlur" ppEffectAdjust [0];
			"dynamicBlur" ppEffectCommit 2.5;
			cutText ["","BLACK IN", 2.5];	
			TOUR_initroDone = true;
			sleep 1;
		};

		waitUntil {((getPosATL player) select 2) > 1};
		private _text = "<t font='PuristaBold' size='1.6'>[Tour] Aero Espionage</t><br />by Mr.Ben";	

	};

	if (TOUR_Start == 2) then 
	{
		if (TOUR_introEnable) then 
		{
			sleep 2;
			_cam1 cameraEffect ["TERMINATE", "back"];	
			sleep 0.5;
			"dynamicBlur" ppEffectAdjust [0];
			"dynamicBlur" ppEffectCommit 2.5;
			cutText ["","BLACK IN", 2.5];	
			TOUR_initroDone = true;
			sleep 1;
		};
		_startPos = getPosATL player;
		waitUntil {(getPosATL player) distance _startPos > 150};
		private _text = "<t font='PuristaBold' size='1.6'>[Tour] Aero Espionage</t><br />by Mr.Ben";	
	};	
	
};