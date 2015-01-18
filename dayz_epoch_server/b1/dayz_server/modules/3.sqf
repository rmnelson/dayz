_crate = "USVehicleBox" createVehicle (position player);
_crate setVariable ["Mission",1,true];

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

// add weapons
_crate addWeaponCargoGlobal ["ItemCrowbar", 4];
_crate addWeaponCargoGlobal ["ItemEtool", 4];
_crate addWeaponCargoGlobal ["ItemSledge", 4];
// add items
_crate addMagazineCargoGlobal ["30m_plot_kit", 4];
_crate addMagazineCargoGlobal ["cinder_garage_kit", 4];
_crate addMagazineCargoGlobal ["MortarBucket", 20];
_crate addMagazineCargoGlobal ["cinder_wall_kit", 30];
_crate addMagazineCargoGlobal ["CinderBlocks", 60];
_crate addMagazineCargoGlobal ["ItemComboLock", 4];
_crate addMagazineCargoGlobal ["metal_floor_kit", 30];
_crate addMagazineCargoGlobal ["ItemPole", 24];
_crate addMagazineCargoGlobal ["ItemVault", 2];
_crate addMagazineCargoGlobal ["wooden_shed_kit", 4];
_crate addMagazineCargoGlobal ["ItemTankTrap", 12];
_crate addMagazineCargoGlobal ["ItemWoodLadder", 4];
_crate addMagazineCargoGlobal ["ItemWoodStairs", 8];
_crate addMagazineCargoGlobal ["workbench_kit", 4];

_crate attachto [player, [0,3,1.9]];
sleep 5;
detach _crate;
player reveal _crate;