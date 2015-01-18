#include "CfgLoot.hpp"

class CfgBuildingLoot {
	class Default {
		zombieChance = 0.2;
		minRoaming = 0;
		maxRoaming = 2;
		zombieClass[] = {"zZombie_Base","z_hunter","z_teacher","z_suit1","z_suit2","z_worker1","z_worker2","z_worker3","z_villager1","z_villager2","z_villager3"};
		lootChance = 0;
		lootPos[] = {};

		lootPosSmall[] = {};
		lootPosZombie[] = {};
		
		itemType[] = {};

		itemChance[] = {};
		lootTypeSmall[] = {};
		itemChanceSmall[] = {};

		hangPos[] = {};
		vehPos[] = {};
	};
	
	class Castle: Default {
		lootChance = 0.2;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			//{"ItemMatchbox","weapon",0.01},
			{"ItemKnife","weapon",0.01},
			{"ItemMap","generic",0.01},
			{"ItemCompass","weapon",0.01},
			{"ItemFlashlight","weapon",0.01},
		//weapons
			{"WeaponHolder_ItemHatchet","object",0.01},
		//special
			{"WeaponHolder_ItemTent","object",0.01},
			//{"WeaponHolder_DomeTentStorage","object",0.01},
		//mags special
			{"PartWoodPile","magazine",0.04},
		//bags
			//{"DZ_Patrol_Pack_EP1","object",0.01},
		//Multiple spawns
			//{"","Residential",0.60},
			{"","generic",0.40}
		};
	};
	class Residential: Default {
		zombieChance = 0.3;
		maxRoaming = 2;
		zombieClass[] = {"zZombie_Base","z_hunter","z_teacher","z_villager1","z_villager2","z_villager3"};
		lootChance = 0.4;
		lootPos[] = {};
		lootType[] = {
			{"ItemWatch","generic",0.04},
			{"ItemCompass","generic",0.03},
			{"ItemMap","weapon",0.02},
			{"ItemFlashlight","generic",0.01},
			{"ItemKnife","generic",0.04},
			{"ItemMatchbox_DZE","generic",0.01},
			{"","generic",0.32},
			{"backpacks","backpacks",0.04},
			{"tents","tents",0.01},
			{"","military",0.02},
			{"","trash",0.17},
			{"Binocular","weapon",0.02},
			{"PartPlywoodPack","magazine",0.02},
			{"clothes","clothes",0.01},
			{"specialclothes","specialclothes",0.01},
			{"WeaponHolder_MeleeCrowbar","object",0.03},
			{"pistols", "cfglootweapon", 0.04 },
			{"submachinegun", "cfglootweapon", 0.02 },
			{"shotgunsingleshot", "cfglootweapon", 0.04 }
		};
		lootTypeSmall[] = {
			{ "ItemSodaMdew","magazine",0.01 },
			{ "ItemSodaRbull","magazine",0.01 },
			{ "ItemSodaOrangeSherbet","magazine",0.02 },
			{ "ItemWatch","weapon",0.05 },
			{ "ItemCompass","weapon",0.04 },
			{ "ItemMap","weapon",0.03 },
			{ "pistols","cfglootweapon",0.12 },
			{ "ItemFlashlight","weapon",0.02 },
			{ "ItemKnife","weapon",0.04 },
			{ "ItemMatchbox_DZE","weapon",0.03 },
			{ "","generic",0.38 },
			{ "","military",0.04 },
			{ "","trash",0.17 },
			{ "Binocular","weapon",0.02 },
			{ "clothes","single",0.01},
			{ "specialclothes","single",0.01 }
		};
	};
	class Office: Default {
		maxRoaming = 3;
		zombieClass[] = {"z_suit1","z_suit2"};
		zombieChance = 0.3;
		lootChance = 0.4;
		lootPos[] = {};
		lootType[] = {
			{"ItemWatch","generic",0.04},
			{"ItemCompass","generic",0.03},
			{"ItemMap","weapon",0.02},
			{"ItemFlashlight","generic",0.01},
			{"ItemKnife","generic",0.04},
			{"ItemMatchbox_DZE","generic",0.01},
			{"","generic",0.31},
			{"backpacks","backpacks",0.04},
			{"tents","tents",0.01},
			{"","military",0.02},
			{"","trash",0.21},
			{"Binocular","weapon",0.02},
			{"PartPlywoodPack","magazine",0.02},
			{"clothes","clothes",0.01},
			{"specialclothes","specialclothes",0.01},
			{"WeaponHolder_MeleeCrowbar","object",0.03},
			{ "shotgunsingleshot", "cfglootweapon", 0.05}
		};
		lootTypeSmall[] = {
			{ "ItemSodaMdew","magazine",0.01 },
			{ "ItemSodaRbull","magazine",0.01 },
			{ "ItemSodaOrangeSherbet","magazine",0.02 },
			{ "ItemWatch","weapon",0.05 },
			{ "ItemCompass","weapon",0.04 },
			{ "ItemMap","weapon",0.03 },
			{ "pistols","cfglootweapon",0.15 },
			{ "ItemFlashlight","weapon",0.02 },
			{ "ItemKnife","weapon",0.05 },
			{ "ItemMatchbox_DZE","weapon",0.03 },
			{ "","generic",0.31 },			
			{ "","military",0.04 },
			{ "","trash",0.03 },
			{ "Binocular","weapon",0.02 },
			{ "clothes","single",0.16 },
			{ "specialclothes","single",0.02 },
			{ "ItemDocument","magazine",0.01 }
		};
	};
	class Industrial: Default {
		zombieChance = 0.4;
		zombieClass[] = {"z_worker1","z_worker2","z_worker3"};
		maxRoaming = 2;
		lootChance = 0.7;
		lootPos[] = {};
		lootType[] = {
			{"ItemGenerator","magazine",0.01},
			{"ItemFuelBarrelEmpty","magazine",0.01},
			{"","generic",0.17},
			{"","trash",0.25},
			{"","military",0.04},
			{"PartGeneric","magazine",0.20},
			{"PartWheel","magazine",0.15},
			{"PartFueltank","magazine",0.13},
			{"PartEngine","magazine",0.13},
			{"PartGlass","magazine",0.15},
			{"PartVRotor","magazine",0.10},
			{"ItemJerrycan","magazine",0.15},
			{"WeaponHolder_ItemHatchet_DZE","object",0.07},
			{"ItemKnife","military",0.07},
			{"ItemToolbox","weapon",0.06},
			{"ItemWire","magazine",0.01},
			{"ItemTankTrap","magazine",0.04},
			{"ItemKeyKit","weapon",0.01},
			{"CinderBlocks","magazine",0.30},
			{"MortarBucket","magazine",0.15}
		};
		lootTypeSmall[] = {
			{ "","generic",0.5 },
			{ "","trash",0.28 },
			{ "","military",0.14 },
			{ "ItemKnife","weapon",0.07 },
			{ "ItemKeyKit","weapon",0.01 }
		};
	};
	class IndustrialFuel: Default {
		zombieChance = 0.4;
		zombieClass[] = {"z_worker1","z_worker2","z_worker3"};
		maxRoaming = 2;
		lootChance = 0.4;
		lootPos[] = {};
		lootType[] = {
			{"ItemGenerator","magazine",0.01},
			{"fuel_pump_kit","magazine",0.01},
			{"","generic",0.18},
			{"","trash",0.28},
			{"","military",0.04},
			{"PartGeneric","magazine",0.04},
			{"PartWheel","magazine",0.05},
			{"PartFueltank","magazine",0.02},
			{"PartEngine","magazine",0.02},
			{"PartGlass","magazine",0.04},
			{"PartVRotor","magazine",0.01},
			{"ItemJerrycan","magazine",0.04},
			{"WeaponHolder_ItemHatchet_DZE","object",0.07},
			{"ItemKnife","military",0.07},
			{"ItemToolbox","weapon",0.06},
			{"ItemWire","magazine",0.01},
			{"ItemTankTrap","magazine",0.04},
			{"ItemKeyKit","weapon",0.01}
		};
		lootTypeSmall[] = {
			{ "","generic",0.5 },
			{ "","trash",0.28 },
			{ "","military",0.14 },
			{ "ItemKnife","weapon",0.07 },
			{ "ItemKeyKit","weapon",0.01 }
		};
	};
	class Farm: Default {
		zombieChance = 0.3;
		maxRoaming = 3;
		zombieClass[] = {"zZombie_Base","z_hunter","z_hunter","z_hunter","z_villager1","z_villager2","z_villager3"};
		lootChance = 0.7;
		lootPos[] = {};
		lootType[] = {
			{"ItemJerrycan","magazine",0.05},
			{"","generic",0.3},
			{"","trash",0.11},
			{"PartPlankPack","magazine",0.06},
			{"WeaponHolder_ItemHatchet_DZE","object",0.05},
			{"ItemFuelBarrelEmpty","magazine",0.01},
			{"WeaponHolder_ItemMachete","object",0.03},
			{"ItemFishingPole","weapon",0.02},
			{"ItemLightBulb","magazine",0.02},
			{"ItemSledgeHandle","magazine",0.02},
			{ "farmweapons", "cfglootweapon", 0.35}
		};
		lootTypeSmall[] = {
			{ "","generic", 0.79},
			{ "","trash",0.14 },
			{ "","military",0.05},
			{ "ItemLightBulb","magazine",0.01},
			{ "ItemSledgeHead","magazine",0.01}
		};
	};
	class Supermarket: Default {
		lootChance = 0.8;
		minRoaming = 2;
		maxRoaming = 6;
		zombieChance = 0.3;
		zombieClass[] = {"zZombie_Base","zZombie_Base","z_teacher","z_suit1","z_suit2"};
		lootType[] = {
			{"ItemSodaMdew","magazine",0.01},
			{"ItemSodaRbull","magazine",0.01},
			{"ItemSodaOrangeSherbet","magazine",0.03},
			{"ItemWatch","generic",0.07},
			{"ItemCompass","generic",0.02},
			{"ItemMap","weapon",0.04},
			{"ItemFlashlight","generic",0.01},
			{"ItemKnife","generic",0.02},
			{"ItemMatchbox_DZE","generic",0.04},
			{"","generic",0.04},
			{"backpacks","backpacks",0.07},
			{"tents","tents",0.01},
			{"","food",0.3},
			{"Binocular","weapon",0.05},
			{"PartPlywoodPack","magazine",0.02},
			{ "pistols", "cfglootweapon", 0.10},
			{ "shotgunsingleshot", "cfglootweapon", 0.07}
		};
		lootTypeSmall[] = {
			{ "ItemSodaMdew","magazine",0.01 },
			{ "ItemSodaRbull","magazine",0.01 },
			{ "ItemSodaOrangeSherbet","magazine",0.03 },
			{ "ItemWatch","weapon",0.07 },
			{ "ItemCompass","weapon",0.03 },
			{ "ItemMap","weapon",0.05 },
			{ "pistols","cfglootweapon",0.08 },
			{ "ItemFlashlight","weapon",0.01 },
			{ "ItemKnife","weapon",0.02 },
			{ "ItemMatchbox_DZE","weapon",0.04 },
			{ "","generic",0.21 },
			{ "","food",0.24 },
			{ "","trash",0.16 },
			{ "Binocular","weapon",0.02 },
			{ "ItemJerryMixed","weapon",0.01 },
			{ "ItemMixOil", "magazine",0.02}
		};
	};
	class HeliCrash: Default {
		zombieChance = 0.4;
		maxRoaming = 2;
		zombieClass[] = {"z_soldier_pilot"};
		lootChance = 0.7;
		lootPos[] = {};
		lootType[] = {
			{ "assaultrifles", "cfglootweapon", 0.20 },
			{ "submachinegun", "cfglootweapon", 0.10 },
			{ "sniperrifles", "cfglootweapon", 0.17 },
			{ "machineguns", "cfglootweapon", 0.10 },
			{"","military",0.3},
			{"","medical",0.18},
			{"MedBox0","object",0.05},
			{"NVGoggles","weapon",0.01},
			{"AmmoBoxSmall_556","object",0.03},
			{"AmmoBoxSmall_762","object",0.03},
			{"militaryclothes","militaryclothes",0.05},
			{"militaryammo","militaryammo",0.06}
		};
	};
	class HeliCrash_No50s: Default {
		zombieChance = 0.4;
		maxRoaming = 2;
		zombieClass[] = {"z_soldier_pilot"};
		lootChance = 0.7;
		lootPos[] = {};
		lootType[] = {
			{ "assaultrifles", "cfglootweapon", 0.35 },
			{ "submachinegun", "cfglootweapon", 0.10 },
			{ "sniperrifles", "cfglootweapon", 0.5 },
			{ "machineguns", "cfglootweapon", 0.4 },
			{ "", "military", 0.3 },
			{ "", "medical", 0.18 },
			{ "MedBox0", "object", 0.05 },
			{ "NVGoggles", "weapon", 0.01 },
			{ "AmmoBoxSmall_556", "object", 0.03 },
			{ "AmmoBoxSmall_762", "object", 0.03 },
			{ "militaryclothes", "militaryclothes", 0.05 },
			{ "militaryammo", "militaryammo", 0.06 }
		};
	};
	class Hospital: Default {
		zombieChance = 0.5;
		minRoaming = 2;
		maxRoaming = 6;
		zombieClass[] = {"z_doctor","z_doctor","z_doctor"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"","trash",0.1},
			{"","hospital",0.7},
			{"MedBox0","object",0.4}
		};
		lootTypeSmall[] = {
			{ "","trash",0.1 },
			{ "","hospital",0.9 }
		};
	};
	class Military: Default {
		zombieChance = 0.3;
		maxRoaming = 6;
		zombieClass[] = {"z_soldier","z_soldier_heavy","z_policeman"};
		lootChance = 0.95;
		lootPos[] = {};
		lootType[] = {
			{ "pistols", "cfglootweapon", 0.24},
			{ "assaultrifles", "cfglootweapon", 0.23 },
			{ "sniperrifles", "cfglootweapon", 0.24 },
			{ "shotgunsingleshot", "cfglootweapon", 0.26 },
			{ "submachinegun", "cfglootweapon", 0.27 },
			{"Binocular","weapon",0.23},
			{"ItemGPS","weapon",0.21},
			{"militarybackpacks","militarybackpacks",0.25},			
			{"","medical",0.33},
			{"","military",0.25},
			{"ItemEtool","weapon",0.22},
			{"ItemSandbag","magazine",0.12},			
			{ "machineguns", "cfglootweapon", 0.23 }
		};
		lootTypeSmall[] = {
			{ "pistols", "cfglootweapon", 0.14 },
			{ "Binocular", "weapon", 0.05 },
			{ "ItemGPS", "weapon", 0.02 },
			{ "", "medical", 0.12 },
			{ "", "generic", 0.22 },
			{ "", "military", 0.25 },
			{ "ItemEtool", "weapon", 0.03 }
		};
	};
	class MilitaryIndustrial: Default {
		zombieChance = 0.3;
		maxRoaming = 6;
		zombieClass[] = {"z_soldier","z_soldier_heavy","z_policeman","z_soldier","z_soldier_heavy","z_policeman","z_worker1","z_worker2","z_worker3"};
		lootChance = 0.9;
		lootPos[] = {};
		lootType[] = {
			{ "pistols", "cfglootweapon", 0.12 },
			{ "assaultrifles", "cfglootweapon", 0.18 },
			{ "PartGeneric", "magazine", 0.13 },
			{ "sniperrifles", "cfglootweapon", 0.15 },
			{ "shotgunsingleshot", "cfglootweapon", 0.18 },
			{ "ItemGenerator", "magazine", 0.11 },
			{ "submachinegun", "cfglootweapon", 0.18 },
			{"PartGeneric","magazine",0.15},
			{"ItemGenerator","magazine",0.13},
			{"PartWheel","magazine",0.15},
			{"Binocular","weapon",0.13},
			{"ItemKnife","military",0.14},
			{"ItemGPS","weapon",0.13},
			{"PartVRotor","magazine",0.17},
			{"militarybackpacks","militarybackpacks",0.15},
			{"","medical",0.15},
			{"","generic",0.25},
			{"","military",0.19},
			{"ItemEtool","weapon",0.13},
			{"ItemSandbag","magazine",0.02},
			{"ItemFuelBarrelEmpty","magazine",0.03},
			{"fuel_pump_kit","magazine",0.03},
			{ "machineguns", "cfglootweapon", 0.03 }
		};
		lootTypeSmall[] = {
			{ "pistols", "cfglootweapon", 0.14 },
			{ "Binocular", "weapon", 0.05 },
			{ "ItemFlashlightRed", "weapon", 0.03 },
			{ "ItemKnife", "weapon", 0.04 },
			{ "ItemGPS", "weapon", 0.02 },
			{ "", "medical", 0.12 },
			{ "", "generic", 0.22 },
			{ "", "military", 0.35 },
			{ "ItemEtool", "weapon", 0.03 }
		};
	};
	class IndustrialMilitary: Default {
		zombieChance = 0.4;
		maxRoaming = 6;
		zombieClass[] = {"z_soldier","z_soldier_heavy","z_policeman","z_soldier","z_soldier_heavy","z_policeman","z_worker1","z_worker2","z_worker3"};
		lootChance = 0.7;
		lootPos[] = {};
		lootType[] = {
			{ "pistols", "cfglootweapon", 0.12 },
			{ "assaultrifles", "cfglootweapon", 0.15 },
			{ "PartGeneric", "magazine", 0.03 },
			{ "sniperrifles", "cfglootweapon", 0.11 },
			{ "shotgunsingleshot", "cfglootweapon", 0.15 },
			{ "ItemGenerator", "magazine", 0.11 },
			{ "submachinegun", "cfglootweapon", 0.15 },
			{"PartGeneric","magazine",0.13},
			{"ItemGenerator","magazine",0.01},
			{"PartWheel","magazine",0.12},
			{"Binocular","weapon",0.01},
			{"ItemFlashlightRed","military",0.03},
			{"ItemKnife","military",0.04},
			{"ItemGPS","weapon",0.01},
			{"PartVRotor","magazine",0.11},
			{"PartFueltank","magazine",0.13},
			{"PartEngine","magazine",0.14},
			{"PartGlass","magazine",0.15},
			{"militarybackpacks","militarybackpacks",0.13},
			{"","medical",0.15},
			{"","generic",0.25},
			{"","military",0.17},
			{"ItemEtool","weapon",0.03},
			
			{"ItemSandbag","magazine",0.02},

			{"ItemFuelBarrelEmpty","magazine",0.03},
			{"fuel_pump_kit","magazine",0.01},
			{ "machineguns", "cfglootweapon", 0.01 }
		};
		lootTypeSmall[] = {
			{ "pistols", "cfglootweapon", 0.14 },
			{ "Binocular", "weapon", 0.05 },
			{ "ItemFlashlightRed", "weapon", 0.03 },
			{ "ItemKnife", "weapon", 0.04 },
			{ "ItemGPS", "weapon", 0.02 },
			{ "", "medical", 0.12 },
			{ "", "generic", 0.22 },
			{ "", "military", 0.35 },
			{ "ItemEtool", "weapon", 0.03 }
		};
	};
	class MilitarySpecial: Default {
		zombieChance = 0.4;
		minRoaming = 2;
		maxRoaming = 6;
		zombieClass[] = {"z_soldier_heavy"};
		lootChance = 0.9;
		lootPos[] = {};
		lootType[] = {
			{ "assaultrifles", "cfglootweapon", 0.15 },
			{ "machineguns", "cfglootweapon", 0.24 },
			{ "pistols", "cfglootweapon", 0.08 },
			{ "sniperrifles", "cfglootweapon", 0.23 },
			{ "militaryshotguns", "cfglootweapon", 0.05 },
			{ "submachinegun", "cfglootweapon", 0.06 },
			{"AmmoBoxSmall_556","object",0.01},
			{"AmmoBoxSmall_762","object",0.02},
			{"Binocular","weapon",0.01},
			{"ItemGPS","weapon",0.01},
			{"Binocular_Vector","military",0.01},
			{"militarybackpacks","militarybackpacks",0.10},
			{"","medical",0.08},
			{"","generic",0.3},
			{"","military",0.01},
			{"machinegunammo","machinegunammo",0.05},
			{"militaryclothes","militaryclothes",0.05},
			{"NVGoggles","weapon",0.01}
		};
		lootTypeSmall[] = {
			{ "pistols","cfglootweapon",0.10 },
			{ "AmmoBoxSmall_556","object",0.02 },
			{ "AmmoBoxSmall_762","object",0.02 },
			{ "Binocular","weapon",0.02 },
			{ "ItemFlashlightRed","military",0.01 },
			{ "ItemKnife","military",0.02 },
			{ "ItemGPS","weapon",0.02 },
			{ "ItemMap","weapon",0.01 },
			{ "Binocular_Vector","weapon",0.03},
			{ "","medical",0.08},
			{ "","generic",0.15},
			{ "","military",0.33 },
			{ "5Rnd_86x70_L115A1","magazine",0.09},
			{ "10Rnd_127x99_m107","magazine",0.05},
			{ "machinegunammoexpl","single",0.02 },
			{ "militaryclothes","single",0.05 },
			{ "NVGoggles","weapon",0.04 }
		};
	};
	class Hunting: Default {
		zombieChance = 0.4;
		minRoaming = 1;
		maxRoaming = 3;
		zombieClass[] = {"z_hunter","z_hunter","z_hunter"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"ItemMap","weapon",0.12},
			{"ItemFlashlight","generic",0.01},
			{"ItemKnife","generic",0.01},
			{"ItemMatchbox_DZE","generic",0.03},
			{ "farmweapons", "cfglootweapon", 0.08 },
			{"","military",0.28},
			{"WeaponHolder_ItemMachete","object",0.02},
			{"","hunter",0.5}
		};
		lootTypeSmall[] =	{
			{"ItemMap","weapon",0.02},
			{"ItemFlashlight","weapon",0.02},
			{"ItemKnife","weapon",0.02},
			{"ItemMatchbox_DZE","weapon",0.04},
			{"","military",0.4},
			{"","hunter",0.5}
		};
	};
	class DynamicDebris: Default
	{
		lootChance = 0.4;
		minRoaming = 0;
		maxRoaming = 2;
		zombieChance = 0.3;
		zombieClass[] = {"zZombie_Base","zZombie_Base","z_teacher","z_suit1","z_suit2"};
		lootType[] = {
			{ "ItemWatch", "generic", 0.19 },
			{ "ItemCompass", "generic", 0.01 },
			{ "ItemMap", "weapon", 0.06 },
			{ "Makarov", "weapon", 0.02 },
			{ "Colt1911", "weapon", 0.02 },
			{ "ItemFlashlight", "generic", 0.06 },
			{ "ItemKnife", "generic", 0.06 },
			{ "ItemMatchbox_DZE", "generic", 0.06 },
			{ "ItemToolbox", "weapon", 0.02 },
			{ "", "generic", 0.17 },
			{ "", "food", 0.06 },
			{ "PartGeneric", "magazine", 0.07 },
			{ "PartWheel", "magazine", 0.06 },
			{ "PartFueltank", "magazine", 0.03 },
			{ "PartEngine", "magazine", 0.07 },
			{ "PartGlass", "magazine", 0.08 },
			{ "WeaponHolder_ItemJerrycan", "object", 0.03 }
		};
	};
	class DynamicDebrisMilitary: Default
	{
		lootChance = 0.4;
		minRoaming = 0;
		maxRoaming = 2;
		zombieChance = 0.3;
		zombieClass[] = {"z_soldier_pilot","z_soldier_heavy"};
		lootType[] = {
			{ "ItemEtool", "weapon", 0.05 },
			{ "ItemSandbag", "magazine", 0.1 },
			{ "", "military", 0.08 },
			{ "ItemWatch", "generic", 0.1 },
			{ "ItemCompass", "generic", 0.02 },
			{ "ItemMap", "weapon", 0.05 },
			{ "MakarovSD", "weapon", 0.01 },
			{ "Colt1911", "weapon", 0.02 },
			{ "ItemFlashlight", "generic", 0.01 },
			{ "ItemKnife", "generic", 0.05 },
			{ "ItemMatchbox_DZE", "generic", 0.05 },
			{ "ItemToolbox", "weapon", 0.02 },
			{ "", "generic", 0.15 },
			{ "", "food", 0.05 },
			{ "PartGeneric", "magazine", 0.06 },
			{ "PartWheel", "magazine", 0.05 },
			{ "PartFueltank", "magazine", 0.03 },
			{ "PartEngine", "magazine", 0.07 },
			{ "PartGlass", "magazine", 0.03 },
			{ "PartVRotor", "magazine", 0.05 },
			{ "WeaponHolder_ItemJerrycan", "object", 0.03 }
		};
	};
	class SupplyDrop: Default {
		zombieChance = 1;
		maxRoaming = 3;
		zombieClass[] = {"zZombie_Base","z_hunter","z_hunter","z_hunter","z_villager1","z_villager2","z_villager3","z_doctor","z_soldier_pilot","z_soldier_heavy"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{ "PartPlywoodPack", "magazine", 0.1 },
			{ "PartPlankPack", "magazine", 0.2 },
			{ "CinderBlocks", "magazine", 0.1 },
			{ "MortarBucket", "magazine", 0.1 },
			{ "bulk_PartGeneric", "magazine", 0.2 },
			{ "bulk_ItemSandbag", "magazine", 0.1 },
			{ "bulk_ItemTankTrap", "magazine", 0.1 },
			{ "ItemSledge", "weapon", 0.1 }
		};
	};
	class MassGrave: Default {
		zombieChance = 1;
		maxRoaming = 3;
		zombieClass[] = {"zZombie_Base","z_hunter","z_hunter","z_hunter","z_villager1","z_villager2","z_villager3","z_doctor","z_soldier_pilot","z_soldier_heavy"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{ "M16A2", "weapon", 0.03 },
			{ "M16A2GL", "weapon", 0.01 },
			{ "M249_EP1_DZ", "weapon", 0.01 },
			{ "M9SD", "weapon", 0.02 },
			{ "Pecheneg_DZ", "weapon", 0.02 },
			{ "PK_DZ", "weapon", 0.01 },
			{ "AK_74", "weapon", 0.02 },
			{ "M4A1_Aim", "weapon", 0.01 },
			{ "AKS_74_kobra", "weapon", 0.01 },
			{ "AKS_74_U", "weapon", 0.02 },
			{ "AK_47_M", "weapon", 0.02 },
			{ "M24", "weapon", 0.01 },
			{ "SVD_CAMO", "weapon", 0.01 },
			{ "M1014", "weapon", 0.02 },
			{ "BAF_LRR_scoped", "weapon", 0.01 },
			{ "M4SPR", "weapon", 0.01 },
			{ "M4A1", "weapon", 0.01 },
			{ "M14_EP1", "weapon", 0.02 },
			{ "UZI_EP1", "weapon", 0.03 },
			{ "Remington870_lamp", "weapon", 0.01 },
			{ "glock17_EP1", "weapon", 0.02 },
			{ "M240_DZ", "weapon", 0.02 },
			{ "M4A1_AIM_SD_camo", "weapon", 0.01 },
			{ "M16A4_ACG", "weapon", 0.01 },
			{ "M4A1_HWS_GL_camo", "weapon", 0.01 },
			{ "Mk_48_DZ", "weapon", 0.01 },
			{ "M4A3_CCO_EP1", "weapon", 0.01 },
			{ "AmmoBoxSmall_556", "object", 0.03 },
			{ "AmmoBoxSmall_762", "object", 0.03 },
			{ "Binocular", "weapon", 0.01 },
			{ "ItemFlashlightRed", "military", 0.02 },
			{ "ItemKnife", "military", 0.01 },
			{ "ItemGPS", "weapon", 0.01 },
			{ "ItemMap", "military", 0.01 },
			{ "Binocular_Vector", "military", 0.01 },
			{ "DZ_ALICE_Pack_EP1", "object", 0.03 },
			{ "DZ_TK_Assault_Pack_EP1", "object", 0.02 },
			{ "DZ_British_ACU", "object", 0.02 },
			{ "DZ_CivilBackpack_EP1", "object", 0.02 },
			{ "DZ_Backpack_EP1", "object", 0.01 },
			{ "DZ_LargeGunBag_EP1", "object", 0.01 },
			{ "", "medical", 0.05 },
			{ "", "generic", 0.05 },
			{ "", "military", 0.13 },
			{ "Sa58V_RCO_EP1", "weapon", 0.01 },
			{ "Sa58V_CCO_EP1", "weapon", 0.01 },
			{ "G36_C_SD_camo", "weapon", 0.01 },
			{ "M40A3", "weapon", 0.01 },
			{ "100Rnd_762x54_PK", "magazine", 0.01 },
			{ "", "militaryclothes", 0.05 },
			{ "WeaponHolder_ItemMachete", "object", 0.02 },
			{ "SCAR_H_LNG_Sniper_SD", "weapon", 0.01 },
			{ "2000Rnd_762x51_M134", "magazine", 0.01 },
			{ "KSVK_DZE", "weapon", 0.01 },
			{ "m240_scoped_EP1_DZE", "weapon", 0.01 },
			{ "sniperrifles", "cfglootweapon", 0.03 }
		};
	};
	#include "CfgLootPos.hpp"
};
