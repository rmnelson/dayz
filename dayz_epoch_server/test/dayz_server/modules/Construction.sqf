private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint"];
 
_spawnChance =  0.55; // Percentage chance of event happening
_markerRadius = 350; // Radius the loot can spawn and used for the marker
_debug = false; // Puts a marker exactly were the loot spawns
 
_loot_box = "USVehicleBox";
_loot_lists = [
[
["ItemHatchet_DZE"],
["ItemWoodStairs","ItemWoodLadder","ItemWoodWallGarageDoorLocked","ItemWoodWallWithDoorLgLocked","ItemWoodWallLg","ItemWoodWallLg","ItemWoodWallLg","ItemWoodWallLg","ItemWoodFloor","ItemWoodFloor"]
],
[
["ChainSaw"],
["workbench_kit","outhouse_kit"]
],
[
["ItemEtool"],
["30m_plot_kit","ItemLockbox"]
],
[
["ItemKnife"],
["ItemComboLock","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PlartPlankPack","PlartPlankPack","PlartPlankPack","PlartPlankPack","PlartPlankPack","PlartPlankPack","PlartPlankPack","PlartPlankPack","PlartPlankPack","PlartPlankPack"]
],
[
["ItemKeyKit"],
["ItemTinBar","ItemJerrycan","PartEngine","PartEngine","PartVRotor","PartVRotor","PartWheel","PartWheel","PartWheel","PartWheel","PartGlass","PartGlass","PartGlass","PartGlass","bulk_PartGeneric","PartFueltank","ItemFuelBarrel"]
],
[
["ItemCrowbar"],
["bulk_itemSandbag","ItemSandbagLarge","ItemSandbagLarge","ItemSandbagLarge","ItemSandbagLarge","sandbag_nest_kit","sun_shade_kit","desert_large_net_kit","desert_large_net_kit","forest_large_net_kit","forest_large_net_kit","ItemSandbagExLarge5X","ItemSandbagExLarge5X","ItemSandbagExLarge5X","ItemSandbagExLarge5X","bulk_ItemWire","bulk_ItemTankTrap"]
],
[
["ItemEtool"],
["cinder_garage_kit","bulk_ItemTankTrap","cinder_door_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","metal_floor_kit","metal_floor_kit","ItemPole","ItemPole","ItemPole","ItemPole"]
],
[
["M9SD"],
["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","ItemComboLock","ItemComboLock","Itemvault"]
],
[
["ItemCrowbar"],
["cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","MortarBucket","MortarBucket","MortarBucket","MortarBucket","MortarBucket","MortarBucket"]
],
[
["ItemToolbox"],
["metal_floor_kit","metal_floor_kit","metal_floor_kit","metal_floor_kit","metal_floor_kit","metal_floor_kit"]
],
[
["ItemEtool"],
["30m_plot_kit","wooden_shed_kit"]
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
_event_marker setMarkerColor "ColorGreen";
_event_marker setMarkerAlpha 0.5;
_event_marker setMarkerSize [(_markerRadius + 50), (_markerRadius + 50)];
 
_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;
 
if (_debug) then {
_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
_debug_marker setMarkerShape "ICON";
_debug_marker setMarkerType "mil_dot";
_debug_marker setMarkerColor "ColorGreen";
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
_hint = parseText format["<t align='center' color='#00FF11' shadow='2' size='1.75'>Construction Crate</t><br/><t align='center' color='#ffffff'>Ikea Truck lost its Cargo, Check your Map for the Location!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

// Send center message to users 
//[nil,nil,rTitleText,"Ikea Truck lost its Cargo, Check your Map for the Location!", "PLAIN",10] call RE;

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