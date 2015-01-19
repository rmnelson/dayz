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

setTerrainGrid 50;    //(Hi)12.5 or 25(Med) or 50(Low)  

MaxHeliCrashes= 2; // Default = 5
MaxVehicleLimit = 225; // Default = 50
MaxDynamicDebris = 0; // Default = 100
MaxAmmoBoxes = 5;
dayz_MapArea = 14000; // Default = 10000
dayz_maxLocalZombies = 30; // Default = 30 

dayz_spawnselection = 0;
dayz_paraSpawn = false;

dayz_minpos = -1; 
dayz_maxpos = 16000;

dayz_sellDistance_vehicle = 40;
dayz_sellDistance_boat = 40;
dayz_sellDistance_air = 50;

dayz_maxAnimals = 4; // Default: 8
dayz_tameDogs = true;
DynamicVehicleDamageLow = 0; // Default: 0
DynamicVehicleDamageHigh = 100; // Default: 100

DZE_BuildOnRoads = false; // Default: False

DZE_ConfigTrader = true;
DZE_MissionLootTable = true;
dayz_antihack = 0;
dayz_REsec = 0;

EpochEvents = [
["any","any","any","any",5,"Supplyitems"],
["any","any","any","any",10,"Construction"],
["any","any","any","any",15,"Treasure"],
["any","any","any","any",20,"Military"],
["any","any","any","any",25,"Supplyitems"],
["any","any","any","any",30,"Construction"],
["any","any","any","any",35,"Treasure"],
["any","any","any","any",40,"Military"],
["any","any","any","any",45,"Supplyitems"],
["any","any","any","any",47,"Construction"],
["any","any","any","any",55,"Military"]
];

dayz_fullMoonNights = true;

//Load in compiled functions
call compile preprocessFileLineNumbers "compiles\variables.sqf";			//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "compiles\compiles.sqf";				//Compile regular functions
call compile preprocessFileLineNumbers "logistic\init.sqf";
call compile preprocessFileLineNumbers "addons\bike\init.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";				//Compile trader configs
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	//Compile vehicle configs
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	//_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\3cities.sqf"
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\balota.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\basebor.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\basedichina.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\basenovy.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\bor.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\golden_river.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\kamenka.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\krasno.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\northeast.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\northwest.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\nwtrader.sqf";
	//_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\quarantinezone.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\staroye.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\vybor.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings\zeleno.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {    
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	_nil = [] execVM "custom\remote_messages.sqf";
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	execVM "dzgm\init.sqf";	
	execVM "events\vmexecuter.sqf";
	execVM "service_point\service_point.sqf";
	execVM "addons\playerhud\playerHud.sqf";
	
};

//Start Dynamic Weather
execVM "compiles\DynamicWeatherEffects.sqf";


#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

// Safe Zone
[] execVM "custom\safezone.sqf";

// Gold
execVM "gold\init.sqf";

// Suicide
call compile preprocessFileLineNumbers "addons\suicide\init.sqf";

// Map Marker Script
execVM "custom\MapMarkerTitling.sqf";

espawn = compile preprocessFileLineNumbers "spawn\spawn.sqf";
waitUntil {!isNil "PVDZE_plr_LoginRecord"};
if (!isDedicated && (dayzPlayerLogin2 select 2)) then {[] spawn espawn;};