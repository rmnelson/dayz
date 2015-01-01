_crate = "USVehicleBox" createVehicle (position player);
_crate setVariable ["Mission",1,true];

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

// add weapons
_crate addWeaponCargoGlobal ["ItemCrowbar", 2];
_crate addWeaponCargoGlobal ["ItemEtool", 2];
_crate addWeaponCargoGlobal ["ItemSledge", 2];
// add items
_crate addMagazineCargoGlobal ["30m_plot_kit", 2];
_crate addMagazineCargoGlobal ["cinder_garage_kit", 2];
_crate addMagazineCargoGlobal ["MortarBucket", 10];
_crate addMagazineCargoGlobal ["cinder_wall_kit", 15];
_crate addMagazineCargoGlobal ["CinderBlocks", 30];
_crate addMagazineCargoGlobal ["ItemComboLock", 2];
_crate addMagazineCargoGlobal ["metal_floor_kit", 15];
_crate addMagazineCargoGlobal ["ItemPole", 12];
_crate addMagazineCargoGlobal ["ItemVault", 1];
_crate addMagazineCargoGlobal ["wooden_shed_kit", 2];
_crate addMagazineCargoGlobal ["ItemTankTrap", 6];
_crate addMagazineCargoGlobal ["ItemWoodLadder", 2];
_crate addMagazineCargoGlobal ["ItemWoodStairs", 4];
_crate addMagazineCargoGlobal ["workbench_kit", 2];

_crate attachto [player, [0,3,1.9]];
sleep 5;
detach _crate;
player reveal _crate;