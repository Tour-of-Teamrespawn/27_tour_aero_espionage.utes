params ["_civ", "_player"];

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

sleep 0.5;

if (alive _civ) then 
{
		_civ setRandomLip true; 
		_civ say3D [format ["TOUR_civ_getaway_%1", TOUR_civilianTalk], _distance];
		sleep 2;
		_civ setRandomLip false; 
};