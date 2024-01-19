if (isMultiplayer) then 
{
	//mulitplayer

	//Respawn time
	TOUR_respawnTime = (paramsArray select 0);
	
	//Lives
	TOUR_respawnTickets = [(paramsArray select 1),(paramsArray select 1),(paramsArray select 1),(paramsArray select 1)];

	//Starting Position
	TOUR_Start = (paramsArray select 2); // 0=air, 1=sea, 2=land

	//Parachute Opens at 200m ATL
	TOUR_autoChute = if ((paramsArray select 3) == 0) then {false}else{true};

	// Disable / enable intro
	TOUR_introEnable = if ((paramsArray select 4) == 0) then {false}else{true};;

	//Debug
	TOUR_Debug = if ((paramsArray select 5) == 0) then {false}else{true};;

}else
{
	//Respawn time
	TOUR_respawnTime = 30;
	
	//lives
	TOUR_respawnTickets = [1,1,1,1];

	TOUR_Start = 2;

	TOUR_debug = false;

	TOUR_autoChute = false;

	TOUR_introEnable = false;
};

setViewDistance 3500;

_rc = [TOUR_respawnTickets, TOUR_respawnTime]execVM "scripts\TOUR_RC\init.sqf";
waitUntil {scriptDone _rc};