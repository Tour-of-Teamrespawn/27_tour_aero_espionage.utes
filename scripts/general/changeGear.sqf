if (isNil "TOUR_gearChangeInit") then 
{

	TOUR_Gear_1 = getUnitLoadout player;
	TOUR_Gear_2 = if ("ACRE_PRC148" in items player) then 
	{
		[["arifle_SDAR_F","","","",["20Rnd_556x45_UW_mag",20],[],""],[],[],["U_B_Wetsuit",[["ACRE_PRC148",1],["ACRE_PRC343",1],["ACE_fieldDressing",5],["ACE_quikclot",5],["ACE_bloodIV_500",1],["ACE_EarPlugs",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_morphine",1],["ACE_tourniquet",2],["20Rnd_556x45_UW_mag",5,20]]],["V_RebreatherB",[]],["B_Carryall_blk",[]],"","G_B_Diving",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ACE_Altimeter","O_NVGoggles_grn_F"]]
	}else 
	{
		[["arifle_SDAR_F","","","",["20Rnd_556x45_UW_mag",20],[],""],[],[],["U_B_Wetsuit",[["ACRE_PRC343",1],["ACE_fieldDressing",5],["ACE_quikclot",5],["ACE_bloodIV_500",1],["ACE_EarPlugs",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_morphine",1],["ACE_tourniquet",2],["20Rnd_556x45_UW_mag",5,20]]],["V_RebreatherB",[]],["B_Carryall_blk",[]],"","G_B_Diving",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ACE_Altimeter","O_NVGoggles_grn_F"]]
	};

	if (TOUR_Start == 1) then 
	{
		player setUnitLoadout TOUR_Gear_2;
		TOUR_StoredGear = TOUR_gear_1;
	};

	TOUR_gearChangeInit = true;	

	_startVehicle = switch (toLower str player) do 
	{
		case "tour_player_2": {[TOUR_sub_1, "driver"]};
		case "tour_player_1": {[TOUR_sub_1, "front"]};
		case "tour_pilot": {[TOUR_sub_1, "rear left"]};

		case "tour_player_4": {[TOUR_sub_2, "driver"]};
		case "tour_player_3": {[TOUR_sub_2, "front"]};
		case "tour_player_5": {[TOUR_sub_2, "rear left"]};

		case "tour_player_6": {[TOUR_sub_3, "driver"]};
		case "tour_player_7": {[TOUR_sub_3, "front"]};
		case "tour_player_8": {[TOUR_sub_3, "rear left"]};

		case "tour_player_10": {[TOUR_sub_4, "driver"]};
		case "tour_player_9": {[TOUR_sub_4, "front"]};
		case "tour_player_11": {[TOUR_sub_4, "rear left"]};

		case "tour_player_12": {[TOUR_sub_5, "driver"]};
		case "tour_player_13": {[TOUR_sub_5, "front"]};
		case "tour_player_14": {[TOUR_sub_5, "rear left"]};

		case "tour_player_16": {[TOUR_sub_6, "driver"]};
		case "tour_player_15": {[TOUR_sub_6, "front"]};
		case "tour_player_17": {[TOUR_sub_6, "rear left"]};

		case "tour_player_18": {[TOUR_sub_7, "driver"]};
		case "tour_player_19": {[TOUR_sub_7, "front"]};
		case "tour_player_20": {[TOUR_sub_7, "rear left"]};

		case "tour_player_22": {[TOUR_sub_8, "driver"]};
		case "tour_player_21": {[TOUR_sub_8, "front"]};
		case "tour_player_23": {[TOUR_sub_8, "rear left"]};

		case "tour_player_24": {[TOUR_sub_9, "driver"]};
		case "tour_player_25": {[TOUR_sub_9, "front"]};
		case "tour_player_26": {[TOUR_sub_9, "rear left"]};
	};

	if ((_startVehicle select 1) == "driver") then 
	{
		player moveInDriver (_startVehicle select 0);
	};
	if ((_startVehicle select 1) == "front") then 
	{	
		player moveInGunner (_startVehicle select 0);
	};
	if ((_startVehicle select 1) == "rear left") then 
	{	
		player moveInCargo (_startVehicle select 0);
	};
	_goggles = goggles player;
	removegoggles player;
	waitUntil {!isNil "TOUR_introDone"};
	waitUntil {TOUR_introDone};
	player addgoggles _goggles;
	player assignItem _goggles;

	(_startVehicle select 0) setVariable ["TOUR_storedGear", TOUR_storedGear, false];
}else 
{
	_oldGear = getUnitLoadout player;
	_vehicle = _this;

	player setUnitLoadout TOUR_storedGear;
	TOUR_StoredGear = _oldGear;

	_vehicle setVariable ["TOUR_storedGear", TOUR_storedGear, false];
};


