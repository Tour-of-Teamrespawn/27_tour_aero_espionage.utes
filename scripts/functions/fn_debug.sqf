[[player], 
{

_player = _this select 0;
_textToHint = parseText format
["
	<t size='1.25' font='puristaMedium' color='#0080ff' align='center' valign='top'>MISSION DEBUG:</t>
	<br/>
	<br/>
	Tower Order = %1
	<br/>
	<br/>
	AA Remaining = %2
	<br/>
	<br/>
	Access Code = %3
	<br/>
	<br/>
", str (missionNameSpace getVariable "TOUR_switchOffOrder"), (missionNameSpace getVariable "TOUR_debug_AA"), str (missionNameSpace getVariable "TOUR_accessCode")];

[_textToHint]remoteExeccall["hint", _player, false];

}]remoteExecCall["spawn", 2, false];