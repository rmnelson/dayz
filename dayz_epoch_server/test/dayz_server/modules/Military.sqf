private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint"];
 
_spawnChance =  0.35; // Percentage chance of event happening
_markerRadius = 350; // Radius the loot can spawn and used for the marker
_debug = false; // Puts a marker exactly were the loot spawns
 
_loot_box = "RUVehicleBox";
_loot_lists = [
[
["FN_FAL"],
["20Rnd_762x51_FNFAL","20Rnd_762x51_FNFAL"]
],
[
["AKS_GOLD"],
["vil_30Rnd_762x39_AKSD","vil_30Rnd_762x39_AKSD","vil_30Rnd_762x39_AKSD"]
],
[
["M4A1_AIM_SD_camo"],
["30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD"]
],
[
["SCAR_H_LNG_Sniper_SD"],
["20rnd_762x51_SB_SCAR","20rnd_762x51_SB_SCAR"]
],
[
["FHQ_ACR_BLK_CCO_GL_SD_F"],
["FHQ_rem_30Rnd_680x43_ACR_SD","FHQ_rem_30Rnd_680x43_ACR_SD","FHQ_rem_30Rnd_680x43_ACR_SD"]
],
[
["AA12_PMC"],
["20Rnd_B_AA12_PELLETS","20Rnd_B_AA12_PELLETS"]
],
[
["RH_m9sd"],
["HandGrenade_West","SmokeShell","SmokeShellGreen","SmokeShellRed","SmokeShellYellow","SmokeShellOrange","SmokeShellPurple","SmokeShellBlue","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD"]
],
[
["RH_hk416"],
["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"]
],
[
["SCAR_L_STD_EGLM_RCO"],
["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"]
],
[
["RH_ctar21mgl"],
["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"]
],
[
["MP5SD"],
["30Rnd_9x19_MP5SD","30Rnd_9x19_MP5SD","30Rnd_9x19_MP5SD"]
],
[
["m8_holo_sd "],
["30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD"]
],
[
["LeeEnfield"],
["10x_303","10x_303"]
]
];
_loot = _loot_lists call BIS_fnc_selectRandom;
 
_loot_amount = 75;
_wait_time = 600; 
 
// Dont mess with theses unless u know what yours doing
_start_time = time;
_spawnRadius = 5000;
_spawnMarker = 'center';
 
if (isNil "EPOCH_EVENT_RUNNING") then {
EPOCH_EVENT_RUNNING = false;
};
 
// Check for another event running
if (EPOCH_EVENT_RUNNING) exitWith {
diag_log("Event already running");
};
 
// Random chance of event happening
_spawnRoll = random 1;
if (_spawnRoll > _spawnChance and !_debug) exitWith {};
 
// Random location
_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;
 
diag_log(format["Spawning loot event at %1", _position]);
 
_event_marker = createMarker [ format ["loot_event_marker_%1", _start_time], _position];
_event_marker setMarkerShape "ELLIPSE";
_event_marker setMarkerColor "ColorRed";
_event_marker setMarkerAlpha 0.5;
_event_marker setMarkerSize [(_markerRadius + 50), (_markerRadius + 50)];
 
_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;
 
if (_debug) then {
_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
_debug_marker setMarkerShape "ICON";
_debug_marker setMarkerType "mil_dot";
_debug_marker setMarkerColor "ColorRed";
_debug_marker setMarkerAlpha 1;
};
 
diag_log(format["Creating ammo box at %1", _loot_pos]);
 
// Create ammo box
_loot_box = createVehicle [_loot_box,_loot_pos,[], 0, "NONE"];
clearMagazineCargoGlobal _loot_box;
clearWeaponCargoGlobal _loot_box;
 
// Cut the grass around the loot position
_clutter = createVehicle ["ClutterCutter_small_2_EP1", _loot_pos, [], 0, "CAN_COLLIDE"];
_clutter setPos _loot_pos;
// cut the grass    end
 
// Add loot
{
_loot_box addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_loot_box addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);
 
// Send Top Right message to users , requires Remote message script
_hint = parseText format["<t align='center' color='#FF0000' shadow='2' size='1.75'>Military Crate</t><br/><t align='center' color='#ffffff'>A special forces unit lost a precious cargo, Check your Map for the Location!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

// Send center message to users 
//[nil,nil,rTitleText,"A special forces unit lost a precious cargo, Check your Map for the Location!", "PLAIN",10] call RE;

diag_log(format["Loot event setup, waiting for %1 seconds", _wait_time]);

// Wait
sleep _wait_time;
 
// Clean up
EPOCH_EVENT_RUNNING = false;
deleteVehicle _loot_box;
deleteMarker _event_marker;
if (_debug) then {
deleteMarker _debug_marker;
};