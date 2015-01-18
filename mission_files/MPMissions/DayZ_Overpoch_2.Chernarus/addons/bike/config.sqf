//  parameter    | description                                                         |  type  | example
// --------------|---------------------------------------------------------------------|--------|--------
// _clickItem    | class name of the item to click on                                  | string | "ItemToolbox"
// _deployOffset | [_side,_front,_up] array to offset the deployable when buiding      | array  | [0,2,1]
// _packDistance | how close does the packer need to be to pack the object?            | number | 5
// _damageLimit  | item can't be repacked if damage is > this. (-1 = no re-packing)    | number | 0.1
// _packAny      | can anyone repack the deployable?                                   | bool   | false
// _cargo        | clear the cargo of the deployable?                                  | bool   | false
// _ammo         | should vehicle ammo be cleared? (does not persist through restart)  | bool   | true
// _hive         | write deployable to database?                                       | bool   | false
// _plot         | require a plot from the owner to build the deployable?              | bool   | false
// _simulation   | enable simulation (movement/damage) for the object? (true for cars) | bool   | true
// _road         | enable road building for this object?                               | bool   | true
// _deployables  | array of class names that can be deployed with this method          | array  | ["MMT_Civ"]
// _near         | array of items required nearby to build (workshop/fire/fueltank)    | array  | []
// _parts        | array of parts required to build (will be taken from player)        | array  | ["ItemToolbox"]
// _condition    | string of code to evaluate to determine whether action is shown     | string | "!(isNull player) && {(getPlayerUID player) in DZE_DEPLOYABLE_ADMINS}" 

    //["ItemRuby",[0,5,2],7,0.1,true,true,true,true,false,true,true,["AH6X_DZ","UH1Y_DZ"],[],["ItemRuby"],"true"],
    //["ItemEmerald",[0,8,0],10,-1,false,false,false,true,true,false,false,["Barrack2","Land_fortified_nest_small_EP1"],[],["ItemEmerald"],"!(isNull player) && {(getPlayerUID player) in DZE_DEPLOYABLE_ADMINS}"],
    //["ItemCitrine",[0,1,1],5,1,false,true,false,true,true,false,false,["Baseball","Loudspeaker","MetalBucket","Misc_Videoprojektor","Misc_Videoprojektor_platno","Misc_Wall_lamp","Notebook","SatPhone","Radio","SmallTV","Suitcase"],[],["ItemCitrine"],"true"],
    //["PartWoodPile",[0,2,0],5,1,true,true,false,true,true,false,false,["Land_Rack_EP1","Land_Table_EP1","Land_Shelf_EP1","WoodChair","Park_bench2","Park_bench1"],[],["PartWoodPile"],"true"],
    //["CinderBlocks",[0,2,0],5,1,false,true,false,false,false,true,true,["Hhedgehog_concrete","Land_CncBlock","Land_CncBlock_Stripes"],[],["CinderBlocks"],"true"],
    //["ItemToolbox",[0,10,0],5,-1,false,true,false,true,true,false,false,["Land_Mil_Guardhouse"],[],["cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_door_kit"],"false"],
    //["ItemCrowbar",[0,6,0],5,-1,false,true,false,true,true,false,false,["Land_Misc_Cargo1Ao","Land_Misc_Cargo1Bo"],[],["metal_panel_kit","metal_panel_kit","metal_panel_kit","metal_panel_kit"],"true"]    
    //["ItemEtool",[0,8,0],5,-1,false,true,true,true,false,false,["Land_fortified_nest_big"],[],["ItemSandbagExLarge5x","ItemSandbagExLarge5x","ItemSandbagExLarge5x"],"true"],
    //["PartWoodPile",[0,2,0],5,1,true,true,true,true,false,false,["Pile_of_wood"],[],["PartWoodPile","PartWoodPile","PartWoodPile","PartWoodPile","PartWoodPile"],"true"],

DZE_DEPLOYABLES_CONFIG = [    
    ["ItemToolbox",[0,5,1],5,1,false,false,false,false,false,true,true,["MMT_Civ"],[],["PartGeneric"],"true"],
	["ItemToolbox",[0,5,1],5,1,false,false,false,false,false,true,true,["TT650_Civ"],[],["PartGeneric","PartEngine"],"true"],
	["ItemToolbox",[0,5,2],5,0.9,false,true,false,false,false,true,true,["CSJ_GyroC"],[],["PartVRotor","PartGeneric"],"true"],
	["ItemEtool",[0,3,1],5,1,false,true,false,true,true,false,false,["Land_pumpa"],[],["ItemWaterbottle","ItemFuelBarrel"],"true"],
	["ItemPole",[0,2,10],5,1,false,true,false,true,true,false,false,["Land_Ind_IlluminantTower"],[],["metal_floor_kit","metal_floor_kit","metal_floor_kit","metal_floor_kit"],"true"],
	["ItemEtool",[0,8,2],5,1,false,true,false,true,true,false,false,["Land_Fort_Watchtower"],[],["forest_large_net_kit","ItemSandbagExLarge5x","ItemSandbagExLarge5x","ItemSandbagExLarge5x"],"true"],
	["ItemRuby",[0,2,1],5,1,true,true,true,true,true,true,false,["DSHkM_Gue","DSHkM_Mini_TriPod","MK19_TriPod","M2StaticMG","M2HD_mini_TriPod","AGS_RU"],[],["ItemRuby"],"true"]  
];

DZE_DEPLOYABLE_NAME_MAP = [    
	["Land_pumpa","Water Well"],
	["Land_Ind_IlluminantTower","Watch Tower"]	
];

DZE_DEPLOYABLE_ADMINS = [];
