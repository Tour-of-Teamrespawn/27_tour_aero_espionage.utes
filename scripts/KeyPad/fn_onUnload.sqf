closeDialog 0;

if (missionNameSpace getVariable "TOUR_KP_inuse" > 1) then
{
	hint (["info", "Shutter Unlocked"] call TOUR_fnc_hint);
	[[(nearestObject [getpos player, "helihempty"])], 
	{
		sleep 1.5;
		if (!isDedicated) then 
		{
			(_this select 0) say3D ["TOUR_unlock", 40];
			(nearestObject [getpos (_this select 0), "Land_Ss_hangar"]) setVariable ["bis_disabled_Door_7",0,true];
			sleep 1;
			[(_this select 0),7,1] call BIS_fnc_Door;
		};
	}]remoteExecCall["spawn", 0, true];
}else 
{
	[[(nearestObject [getpos player, "helihempty"])], 
	{
		if (!isDedicated) then 
		{
			sleep 1.5;
			(_this select 0) say3D ["TOUR_error", 10];
		};
		if (isServer) then 
		{
			sleep 4;	
			missionNameSpace setVariable ["TOUR_KP_inuse", 0, true];
		}
	}]remoteExecCall["spawn", 0, true];
};