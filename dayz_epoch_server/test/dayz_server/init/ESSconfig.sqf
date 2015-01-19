bodyCheckDistance = 2500; //-1 to disable

vipClassLvl1 = [];
vipClassLvl2 = [];
vipClassLvl3 = ["76561198012599430","76561197968136059","76561197979388850","76561197982582741","76561198061741823","76561198121589409","76561197982112207","76561198032284532","76561198072699028","76561197978218473","76561198150767909","76561198143014062","76561198136977270","76561198129206248","76561198055539580","76561198004033434"]; 
//				   YuriLowell,				 Tekz, 			INS, 				Xianith,		   WingsOfFury, 		Nathan, 			Ekarus, 			Snake Eyes, 		 Taylor, 			 Graff, 			Myles   		  Eric Walker 		     Merlin 			Peachy 			    Blewray             Tibbs_Mclaire
vipListBase = [];

vipListBases = [];

vipListClass = ["76561198012599430","76561197968136059","76561197979388850","76561197982582741"];

vipListClasses = [
	["Yuri's Loadout","INS_Lopotev_DZ",["5Rnd_127x108_KSVK","30Rnd_9x19_UZI_SD","ItemMorphine","ItemBandage"],["KSVK_DZE","UZI_SD_EP1","Binocular_Vector","NVGoggles","ItemCompass","ItemHatchet_DZE","ItemKnife","Itemetool","ItemSledge","ItemGPS","ItemCrowbar"],"DZ_LargeGunBag_EP1",["5Rnd_86x70_L115A1","5Rnd_86x70_L115A1"],["BAF_LRR_scoped_W"],0,0],
	["Tekz's Loadout","RU_Policeman_DZ",["5Rnd_127x108_KSVK","30Rnd_9x19_UZI_SD","ItemMorphine","ItemBandage"],["KSVK_DZE","UZI_SD_EP1","Binocular_Vector","NVGoggles","ItemCompass","ItemHatchet_DZE","ItemKnife","Itemetool","ItemSledge","ItemGPS","ItemCrowbar"],"DZ_LargeGunBag_EP1",["5Rnd_86x70_L115A1","5Rnd_86x70_L115A1"],["BAF_LRR_scoped_W"],0,0],
	["INS's Loadout","TK_Commander_EP1_DZ",["20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","30Rnd_9x19_UZI_SD","30Rnd_9x19_UZI_SD","30Rnd_9x19_UZI_SD","ItemMorphine","ItemBandage"],["vil_SR25SD","UZI_SD_EP1","Binocular_Vector","NVGoggles","ItemCompass","ItemHatchet_DZE","ItemKnife","Itemetool","ItemSledge","ItemGPS","ItemCrowbar"],"DZ_LargeGunBag_EP1",["5Rnd_86x70_L115A1","5Rnd_86x70_L115A1"],["BAF_LRR_scoped_W"],0,0],
	["Xianith's Loadout","GUE_Soldier_Sniper_DZ",["5Rnd_127x108_KSVK","30Rnd_9x19_UZI_SD","ItemMorphine","ItemBandage"],["KSVK_DZE","UZI_SD_EP1","Binocular_Vector","NVGoggles","ItemCompass","ItemHatchet_DZE","ItemKnife","Itemetool","ItemSledge","ItemGPS","ItemCrowbar"],"DZ_LargeGunBag_EP1",["5Rnd_86x70_L115A1","5Rnd_86x70_L115A1"],["BAF_LRR_scoped_W"],0,0]
];

DefaultMagazines = ["17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17","ItemBandage","ItemBandage","ItemBandage","ItemPainkiller","ItemMorphine","ItemWaterbottleBoiled","FoodSteakCooked","PartGeneric"]; 
DefaultWeapons = ["glock17_EP1","ItemMap","ItemToolbox","ItemCompass","ItemRadio"]; 
DefaultBackpack = "DZ_Assault_Pack_EP1";

presetClasses = [
	["Bandit","Bandit2_DZ",["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD"],["M9SD"],"",[],[],0,-5000],	
	["Paulo","INS_Lopotev_DZ",["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD"],["M9SD"],"",[],[],0,-7000],
	["Boss","INS_Bardak_DZ",["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD"],["M9SD"],"",[],[],0,-10000],
	["Hero","Soldier_Sniper_PMC_DZ",["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD"],["M9SD"],"",[],[],0,5000],
	["Crewman","RU_Soldier_Crew_DZ",["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD"],["M9SD"],"",[],[],0,7000],
	["General","TK_Commander_EP1_DZ",["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD"],["M9SD"],"",[],[],0,10000],	
	["British Soldier","Soldier1_DZ",[],[],"",[],[],0,0],
	["Business Person","Functionary1_EP1_DZ",[],[],"",[],[],0,0],	
	["Czech Soldier","CZ_Special_Forces_GL_DES_EP1_DZ",[],[],"",[],[],0,0],
	["Police Officer","RU_Policeman_DZ",[],[],"",[],[],0,0],	
	["Terrorist","TK_INS_Soldier_EP1_DZ",[],[],"",[],[],0,0],
	["US Soldier","Graves_Light_DZ",[],[],"",[],[],0,0],
	["Recon*","GUE_Commander_DZ",["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD"],["M9SD"],"DZ_ALICE_Pack_EP1",[],[],1,0],
	["Scout**","GUE_Soldier_Crew_DZ",["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD"],["M9SD","Binocular","ItemHatchet_DZE"],"DZ_British_ACU",[],[],2,0],
	["Specialist***","TK_Special_Forces_MG_EP1_DZ",["30Rnd_545x39_AKSD","30Rnd_545x39_AKSD","30Rnd_545x39_AKSD","30Rnd_9x19_UZI_SD","30Rnd_9x19_UZI_SD"],["AKS_74_UN_Kobra","UZI_SD_EP1","Binocular_Vector","ItemHatchet_DZE","ItemKnife","ItemGPS"],"DZ_GunBag_EP1",[],[],3,0],
	["Sniper***","GUE_Soldier_Sniper_DZ",["30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_9x19_UZI_SD","30Rnd_9x19_UZI_SD"],["M4A1_AIM_SD_camo","UZI_SD_EP1","Binocular_Vector","ItemHatchet_DZE","ItemKnife","ItemGPS"],"DZ_GunBag_EP1",[],[],3,0]
];

publicVariable "bodyCheckDistance";
publicVariable "vipClassLvl1";
publicVariable "vipClassLvl2";
publicVariable "vipClassLvl3";
publicVariable "vipListBase";
publicVariable "vipListBases";
publicVariable "vipListClass";
publicVariable "vipListClasses";
publicVariable "DefaultMagazines";
publicVariable "DefaultWeapons";
publicVariable "DefaultBackpack";
publicVariable "presetClasses";