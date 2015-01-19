class spawn_dialog
{
	idd = -1;
	movingenable = true;
	enableSimulation = true;
	class Controls
	{
		class mapCherno: RscPicture
		{
			idc = 1200;
			text = "spawn\map.paa";
			x = 0.340983 * safezoneW + safezoneX;
			y = 0.23125 * safezoneH + safezoneY;
			w = 0.30876 * safezoneW;
			h = 0.531375 * safezoneH;
		};
		class btnBalo: e_RscButton
		{
			idc = 1600;
			text = "Balota";
			x = 0.42 * safezoneW + safezoneX;
			y = 0.706482 * safezoneH + safezoneY;
			w = 0.035 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "spawnSelect = 0;";
		};
		class btnBere: e_RscButton
		{
			idc = 1601;
			text = "Berezino";
			x = 0.566146 * safezoneW + safezoneX;
			y = 0.411111 * safezoneH + safezoneY;
			w = 0.048 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "spawnSelect = 1;";
		};
		class btnCher: e_RscButton
		{
			idc = 1602;
			text = "Cherno";
			x = 0.466146 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.038 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "spawnSelect = 2;";
		};
		class btnElek: e_RscButton
		{
			idc = 1603;
			text = "Elektro";
			x = 0.526041 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "spawnSelect = 3;";
		};
		class btnKame: e_RscButton
		{
			idc = 1604;
			text = "Kamenka";
			x = 0.35 * safezoneW + safezoneX;
			y = 0.706482 * safezoneH + safezoneY;
			w = 0.048 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "spawnSelect = 4;";
		};
		class btnKamy: e_RscButton
		{
			idc = 1605;
			text = "Kamyshovo";
			x = 0.557812 * safezoneW + safezoneX;
			y = 0.666667 * safezoneH + safezoneY;
			w = 0.058 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "spawnSelect = 5;";
		};
		class btnKoma: e_RscButton
		{
			idc = 1606;
			text = "Komarovo";
			x = 0.384 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.052 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "spawnSelect = 6;";
		};
		class btnKrut: e_RscButton
		{
			idc = 1607;
			text = "Krutoy";
			x = 0.583333 * safezoneW + safezoneX;
			y = 0.623149 * safezoneH + safezoneY;
			w = 0.036 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "spawnSelect = 7;";
		};
		class btnPrig: e_RscButton
		{
			idc = 1608;
			text = "Prigor";
			x = 0.48 * safezoneW + safezoneX;
			y = 0.67 * safezoneH + safezoneY;
			w = 0.036 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "spawnSelect = 8;";
		};		
		class btnSoln: e_RscButton
		{
			idc = 1609;
			text = "Solnichny";
			x = 0.580729 * safezoneW + safezoneX;
			y = 0.540741 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0161 * safezoneH;
			action = "spawnSelect = 9;";
		};
		class btnDono: e_RscButton
		{
			idc = 1624;
			text = "Base";
			x = 0.555 * safezoneW + safezoneX;
			y = 0.255 * safezoneH + safezoneY;
			w = 0.0422917 * safezoneW;
			h = 0.0188889 * safezoneH;
			action = "spawnSelect = 40;";
		};
		class btnRand: e_RscButton
		{
			idc = 1625;
			text = "Random";
			x = 0.6 * safezoneW + safezoneX;
			y = 0.230556 * safezoneH + safezoneY;
			w = 0.0422917 * safezoneW;
			h = 0.0188889 * safezoneH;
			action = "spawnSelect = 41;";
		};
		class lblMap: RscText
		{
			idc = 1000;
			text = "Select spawn point or click here to spawn randomly:";
			x = 0.350521 * safezoneW + safezoneX;
			y = 0.225001 * safezoneH + safezoneY;
			w = 0.239687 * safezoneW;
			h = 0.0290741 * safezoneH;
		};
		class lblMap2: RscText
		{
			idc = 1001;
			text = "Click here to spawn at your base:";
			x = 0.350521 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.239687 * safezoneW;
			h = 0.0290741 * safezoneH;
		};
	};
};
