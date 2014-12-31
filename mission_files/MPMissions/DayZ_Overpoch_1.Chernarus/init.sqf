/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	11;					//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

// DayZ Epoch config
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500
setTerrainGrid 50; //(Hi)12.5 or 25(Med) or 50(Low)

MaxHeliCrashes = 2; // Default = 5
MaxVehicleLimit = 300; // Default = 50
MaxDynamicDebris = 0; // Default = 100
MaxAmmoBoxes = 0;
dayz_MapArea = 14000; // Default = 10000
dayz_maxLocalZombies = 30; // Default = 30 

dayz_paraSpawn = false;

dayz_minpos = -1; 
dayz_maxpos = 16000;

dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

dayz_maxAnimals = 5; // Default: 8
dayz_tameDogs = true;
DynamicVehicleDamageLow = 0; // Default: 0
DynamicVehicleDamageHigh = 100; // Default: 100

DZE_BuildOnRoads = false; // Default: False

//Disable weight system
DZE_R3F_WEIGHT = false;

//Edit for custom loot
DZE_MissionLootTable = true;
//Bloodbag option?
DZE_SelfTransfuse = true;

//currency 3.0
DZE_ConfigTrader = true;

//Default Loadout
DefaultMagazines = ["RH_12Rnd_45cal_usp","RH_12Rnd_45cal_usp","ItemBandage","ItemBandage","ItemPainkiller","ItemMorphine","PartGeneric"];
DefaultWeapons = ["ItemFlashlight","ItemMap","ItemToolbox","RH_uspm"];
DefaultBackpack = "DZ_Patrol_Pack_EP1";
DefaultBackpackWeapon = "";
DefaultBackpackMagazines = [];

EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];
dayz_fullMoonNights = true;

//Load in compiled functions
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";				//Compile regular functions
call compile preprocessFileLineNumbers "custom\ZSC\gold\ZSCinit.sqf";				//currency gold 3.0
progressLoadingScreen 0.5;
//call compile preprocessFileLineNumbers "server_traders.sqf";				//modified for currency gold 3.0 //Compile trader configs
call compile preprocessFileLineNumbers "server_traders_cherno_11.sqf";   //modified for currency gold 3.0
call compile preprocessFileLineNumbers "custom\admintools\AdminList.sqf"; // Epoch admin Tools variables/UIDs
call compile preprocessFileLineNumbers "custom\compiles.sqf"; //Compile custom compiles
call compile preprocessFileLineNumbers "custom\bike\init.sqf";
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	//Compile vehicle configs
	
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\balota.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\basebor.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\basedichina.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\basenovy.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\northeast.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\northwest.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\bor.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\staroye.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\nwtrader.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\golden_river.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\quarantinezone.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";
	execVM "custom\ZSC\compiles\playerHud.sqf";	//currency gold 3.0

    // Epoch Admin Tools
	if ( !((getPlayerUID player) in AdminList) && !((getPlayerUID player) in ModList)) then 
	{
		[] execVM "custom\admintools\antihack\antihack.sqf"; // Epoch Antihack with bypass
	};	
	
	//anti Hack - replaced with above for admin tools 
	//[] execVM "\z\addons\dayz_code\system\antihack.sqf";

	//Lights
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	
	//Refuel & Repair
	[] execVM "custom\refuel\repairactions.sqf";
};

#include "\z\addons\dayz_code\system\REsec.sqf"

//Start Dynamic Weather
execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";

#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

//Admintools
[] execVM "custom\admintools\Activate.sqf"; // Epoch admin tools

//Suicide
call compile preprocessFileLineNumbers "custom\suicide\init.sqf";

//Safezones
[] execVM "custom\safezones\dami_SZ.sqf";
