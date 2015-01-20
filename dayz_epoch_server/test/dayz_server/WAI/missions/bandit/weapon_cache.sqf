if(isServer) then {

	private 		["_complete","_crate_type","_mission","_position","_crate","_playerPresent","_rndnum","_rndgro","_num_guns","_num_tools","_num_items"];

	_position		= [30] call find_position;
	_mission		= [_position,"Medium","Weapon Cache","MainBandit",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Bandit] MasterChief's Weapons Cache]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
	
	//Troops
	_rndnum 	= (1 + round(random 7));
	_rndgro 	= (1 + round(random 3));

	for "_i" from 0 to _rndgro do {
		[[_position select 0,_position select 1,0],_rndnum,"Easy","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_group;
	};

	//Static Guns
	[[
		[(_position select 0) + 10, (_position select 1) + 10, 0],
		[(_position select 0) + 10, (_position select 1) - 10, 0]
	],"M2StaticMG","Easy","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;

	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill",wai_kill_percent], or ["assassinate", _unitGroup],
		[], 				// cleanup objects
		"MasterChief is transporting his weapons, go make them yours.",	// mission announcement
		"Halo sucks! The weapons are mine!",									// mission success
		"MasterChief's ping was too high, the mission is ended."							// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,10,4,0,2] call dynamic_crate;
	};

	diag_log format["WAI: [Bandit] weapon_cache ended at %1",_position];
	
	b_missionrunning = false;
};