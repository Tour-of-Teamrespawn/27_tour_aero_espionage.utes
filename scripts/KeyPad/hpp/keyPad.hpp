#include "common.hpp"

class TOUR_KP_dlg
{
	idd = 181600;
	movingEnable = 1;
	onLoad = "_this call TOUR_KP_fn_onLoad";
	onUnload = "_this call TOUR_KP_fn_onUnload";
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by Mr.Ben, v1.063, #Jovipa)
	////////////////////////////////////////////////////////
	class controlsBackground
	{
		class TOUR_KP_BG: TOUR_KP_RscBackground
		{
			idc = 1714;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.253 * safezoneH;
			colorBackground[] = {0.2,0.2,0.2,1};
		};
	};
	class controls 
	{
		class TOUR_KP_NUM_1: TOUR_KP_RscText
		{
			idc = 1710;
			text = "0"; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			sizeEx = 1.25 * GUI_GRID_H;
		};
		class TOUR_KP_NUM_2: TOUR_KP_RscText
		{
			idc = 1711;
			text = "0"; //--- ToDo: Localize;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			sizeEx = 1.25 * GUI_GRID_H;
		};
		class TOUR_KP_NUM_3: TOUR_KP_RscText
		{
			idc = 1712;
			text = "0"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			sizeEx = 1.25 * GUI_GRID_H;
		};
		class TOUR_KP_NUM_4: TOUR_KP_RscText
		{
			idc = 1713;
			text = "0"; //--- ToDo: Localize;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			sizeEx = 1.25 * GUI_GRID_H;
		};
		class TOUR_KP_BTN_0: TOUR_KP_RscButton
		{
			idc = 1700;
			text = " 0"; //--- ToDo: Localize;
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.4,0.4,0.4,1};
		};
		class TOUR_KP_BTN_1: TOUR_KP_RscButton
		{
			idc = 1701;
			text = " 1"; //--- ToDo: Localize;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class TOUR_KP_BTN_2: TOUR_KP_RscButton
		{
			idc = 1702;
			text = " 2"; //--- ToDo: Localize;
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class TOUR_KP_BTN_3: TOUR_KP_RscButton
		{
			idc = 1703;
			text = " 3"; //--- ToDo: Localize;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class TOUR_KP_BTN_4: TOUR_KP_RscButton
		{
			idc = 1704;
			text = " 4"; //--- ToDo: Localize;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class TOUR_KP_BTN_5: TOUR_KP_RscButton
		{
			idc = 1705;
			text = " 5"; //--- ToDo: Localize;
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class TOUR_KP_BTN_6: TOUR_KP_RscButton
		{
			idc = 1706;
			text = " 6"; //--- ToDo: Localize;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class TOUR_KP_BTN_7: TOUR_KP_RscButton
		{
			idc = 1707;
			text = " 7"; //--- ToDo: Localize;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class TOUR_KP_BTN_8: TOUR_KP_RscButton
		{
			idc = 1708;
			text = " 8"; //--- ToDo: Localize;
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class TOUR_KP_BTN_9: TOUR_KP_RscButton
		{
			idc = 1709;
			text = " 9"; //--- ToDo: Localize;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		
		class TOUR_KP_BTN_ESC: TOUR_KP_RscButton
		{
			idc = 1715;
			text = "X"; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.011 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
			class attributes 
			{
				size = 0.75;
			};
		};
		
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT END
	////////////////////////////////////////////////////////
};