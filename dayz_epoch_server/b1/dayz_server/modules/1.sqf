_crate = "USVehicleBox" createVehicle (position player);
_crate setVariable ["Mission",1,true];

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

// add weapons
_crate addWeaponCargoGlobal ["ItemCrowbar", 1];
_crate addWeaponCargoGlobal ["ItemEtool", 1];
_crate addWeaponCargoGlobal ["ItemSledge", 1];
// add items
_crate addMagazineCargoGlobal ["30m_plot_kit", 1];
_crate addMagazineCargoGlobal ["cinder_garage_kit", 1];
_crate addMagazineCargoGlobal ["MortarBucket", 5];
_crate addMagazineCargoGlobal ["cinder_wall_kit", 7];
_crate addMagazineCargoGlobal ["CinderBlocks", 15];
_crate addMagazineCargoGlobal ["ItemComboLock", 2];
_crate addMagazineCargoGlobal ["metal_floor_kit", 4];
_crate addMagazineCargoGlobal ["ItemPole", 3];
_crate addMagazineCargoGlobal ["ItemLockbox", 2];
_crate addMagazineCargoGlobal ["wooden_shed_kit", 1];
_crate addMagazineCargoGlobal ["ItemTankTrap", 3];
_crate addMagazineCargoGlobal ["ItemWoodLadder", 1];
_crate addMagazineCargoGlobal ["ItemWoodStairs", 2];
_crate addMagazineCargoGlobal ["workbench_kit", 1];

_crate attachto [player, [0,3,1.9]];
sleep 5;
detach _crate;
player reveal _crate;