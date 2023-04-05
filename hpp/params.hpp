class Params
{
	class TOUR_param_Respawn
	{
		//paramsArray[0]
		title = "Respawn Time (s):";
		values[] = {0, 30, 60, 300, 600, 900};
		default = 30;
		texts[] = {"None", "30 Seconds", "1 Minute", "5 Minutes", "10 Minutes", "15 Minutes"};
	};
	
	class TOUR_param_tickets
	{
		//paramsArray[1]
		title = "Lives:";
		values[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 30, 40, 50, 100};
		default = 1;
		texts[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "20", "30", "40", "50", "100"};
	};	

	class TOUR_param_start
	{
		//paramsArray[2]
		title = "Start Position:";
		values[] = {0, 1, 2};
		default = 0;
		texts[] = {"AIR", "SEA", "LAND"};
	};	

	class TOUR_param_autochute
	{
		//paramsArray[3]
		title = "Enable Autochute:";
		values[] = {false, true};
		default = false;
		texts[] = {"OFF", "ON"};
	};	

	class TOUR_param_intro
	{
		//paramsArray[4]
		title = "Enable Intro:";
		values[] = {true, false};
		default = true;
		texts[] = {"ON", "OFF"};
	};	

	class TOUR_param_debug
	{
		//paramsArray[5]
		title = "Debug Info:";
		values[] = {false, true};
		default = false;
		texts[] = {"OFF", "ON"};
	};	
};