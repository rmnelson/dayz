if(isServer) then {

	private 		["_complete","_vehicle","_rndnum","_crate_type","_crate","_mission","_tanktraps","_mines","_playerPresent","_cleanmission","_currenttime","_starttime","_missiontimeout","_vehname","_veh","_position","_vehclass","_vehdir","_objPosition"];

	//Military Chopper
	_vehclass 		= armed_chopper call BIS_fnc_selectRandom;
	_vehname 		= getText (configFile >> "CfgVehicles" >> _vehclass >> "displayName");

	_position		= [30] call find_position;
	_mission		= [_position,"Hard",format["Sniper Extraction %1", _vehname],"MainBandit",true] call mission_init;	
	
	diag_log 		format["WAI: [Mission:[Bandit] Sniper Extraction]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1) + 5,0], [], 0, "CAN_COLLIDE"];
	
	//Troops
	_rndnum = 2 + round (random 4);
	[[_position select 0,_position select 1,0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Extreme","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;

	//Static Guns
	[[
		[(_position select 0) + 30, (_position select 1) - 30, 0],
		[(_position select 0) + 30, (_position select 1) + 30, 0],
		[(_position select 0) - 30, (_position select 1) - 30, 0],
		[(_position select 0) - 30, (_position select 1) + 30, 0]
	],"M2StaticMG","medium","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	
	//Spawn vehicle
	_vehicle		= [_vehclass,_position] call custom_publish;
	
	if(debug_mode) then {
		diag_log format["WAI: [Bandit] sniper_extraction spawned a %1",_vehname];
	};
	
	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill",wai_kill_percent], or ["assassinate", _unitGroup],
		[_vehicle], 		// cleanup objects
		"Sampson and his sniper buddies are about to escape with a pile of weapons from NWAF!",		// mission announcement
		"Pwned!  Sampson's weapons have been captures by bandits!",		// mission success
		"Sampson and his sniper rifles have escaped!"				// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,[10,ai_wep_sniper],[4,crate_tools_sniper],[4,crate_items_sniper],2] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Bandit] Sniper Extraction]: Ended at %1",_position];
	
	b_missionrunning = false;
};