class TER_RscConversation {
	idd = 73001;
	movingEnable = 0;
	//onLoad = "0 = execVM ""..\..\general\conversation\onLoadRscConversation.sqf""";
	class Objects {
	};
	class controlsBackground {
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.511875 * safezoneW;
			h = 0.182 * safezoneH;
		};
	};
	class controls {
		class BTN_say: RscButtonMenu
		{
			idc = 2400;
			text = "Say"; //--- ToDo: Localize;
			x = 0.650937 * safezoneW + safezoneX;
			y = 0.668 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class BTN_next: RscButtonMenu
		{
			idc = 2402;
			text = "Next"; //--- ToDo: Localize;
			x = 0.650937 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class BTN_close: RscButtonMenuCancel
		{
			text = "Goodbye"; //--- ToDo: Localize;
			x = 0.650937 * safezoneW + safezoneX;
			y = 0.794 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class GRP_response: RscControlsGroupNoScrollbars
		{
			idc = 7001;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.668 * safezoneH + safezoneY;
			w = 0.39375 * safezoneW;
			h = 0.154 * safezoneH;
			class Controls
			{
				class STXT_response: RscStructuredText
				{
					idc = 1100;
					x = 0;
					y = 0;
					w = 0.39375 * safezoneW;
					h = 0.154 * safezoneH;
				};
			};

		};
		class LB_convOptions: RscListbox
		{
			idc = 1500;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.668 * safezoneH + safezoneY;
			w = 0.39375 * safezoneW;
			h = 0.154 * safezoneH;
		};
		class TXT_aiName: RscTitleBackground
		{
			idc = 1000;
			text = "AI Name"; //--- ToDo: Localize;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.511875 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Terra, v1.063, #Keteri)
////////////////////////////////////////////////////////



////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
