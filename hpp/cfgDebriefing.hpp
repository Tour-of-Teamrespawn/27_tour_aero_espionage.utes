class CfgDebriefing
{
	class complete
	{
		title = "Mission Success";
		subtitle = "Plane Stolen";
		description = "You successfully stole the prototype plane.";
		pictureBackground = "img\aero_win.paa";
		picture = "";
		pictureColor[] = {};
	};
	class destroyed
	{
		title = "Mission Failure";
		subtitle = "Plane Destroyed";
		description = "The plane was destroyed.";
		pictureBackground = "img\aero_destroyed.paa";
		picture = "";
		pictureColor[] = {};
	};
	class pilotdead
	{
		title = "Mission Failure";
		subtitle = "Pilot Killed";
		description = "The pilot was killed, and so the plane could not be flown.";
		pictureBackground = "img\usflag.paa";
		picture = "img\kia.paa";
		pictureColor[] = {};
	};
	class fuel
	{
		title = "Mission Failure";
		subtitle = "Fuel Truck Destroyed";
		description = "The fuel truck was destroyed before the plane coule be fully fueled.";
		pictureBackground = "img\usflag.paa";
		picture = "";
		pictureColor[] = {};
	};
	class nofuel
	{
		title = "Mission Failure";
		subtitle = "Not Enough Fuel";
		description = "You did not fuel the plane enough for its journey.";
		pictureBackground = "img\usflag.paa";
		picture = "";
		pictureColor[] = {};
	};
	class kia
	{
		title = "Mission Failure";
		subtitle = "KIA";
		description = "All your men were killed in action.";
		pictureBackground = "img\usflag.paa";
		picture = "img\kia.paa";
		pictureColor[] = {};
	};
};