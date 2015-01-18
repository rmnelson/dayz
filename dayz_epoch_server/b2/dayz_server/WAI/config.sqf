if(isServer) then {

	/* GENERAL CONFIG */
	
		debug_mode				= false;		// enable debug
		use_blacklist				= true;			// use blacklist
		blacklist					= [
		[[5533.00,8445.00],[6911.00,7063.00]],	// Stary
		[[0,16000,0],[1000,-0,0]],				// Left
		[[0,16000,0],[16000.0,14580.3,0]],		// Top
		[[11719.8,13019.3,0],[13096.1,12382.2,0]],		// Hero and NE
		[[11304.3,11523.1,0],[11668.5,11125.3,0]],		// Klen
		[[1466.41,7964.88,0],[1877.25,7592.93,0]],		// Bandit
		[[3285.3,3917.57,0],[3563.22,3690.54,0]],		// Bor
		[[10603.3,5444.44,0],[10813.5,5276.27,0]],		// Staroye
		[[4764.36,9874.58,0],[5267.88,9566.19,0]]		// NW Dealer
		];

	/* END GENERAL CONFIG */

	/* AI CONFIG */

		ai_clear_body 				= false;		// instantly clear bodies
		ai_clean_dead 				= true;			// clear bodies after certain amount of time
		ai_cleanup_time 			= 1200;			// time to clear bodies in seconds
		ai_clean_roadkill			= true; 		// clean bodies that are roadkills
		ai_roadkill_damageweapon	= 0;			// percentage of chance a roadkill will destroy weapon AI is carrying

		ai_bandit_combatmode		= "YELLOW";		// combatmode of bandit AI
		ai_bandit_behaviour			= "COMBAT";		// behaviour of bandit AI

		ai_hero_combatmode			= "YELLOW";		// combatmode of hero AI
		ai_hero_behaviour			= "COMBAT";		// behaviour of hero AI

		ai_share_info				= true;			// AI share info on player position
		ai_share_distance			= 300;			// Distance from killed AI for AI to share your rough position

		ai_kills_gain				= true;			// add kill to bandit/human kill score
		ai_humanity_gain			= true;			// gain humanity for killing AI
		ai_add_humanity				= 50;			// amount of humanity gained for killing a bandit AI
		ai_remove_humanity			= 50;			// amount of humanity lost for killing a hero AI
		ai_special_humanity			= 150;			// amount of humanity gain or loss for killing a special AI dependant on player alignment
		
		ai_skill_extreme			= [["aimingAccuracy",1.00],["aimingShake",1.00],["aimingSpeed",1.00],["endurance",1.00],["spotDistance",1.00],["spotTime",1.00],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]]; 	// Extreme
		ai_skill_hard				= [["aimingAccuracy",0.80],["aimingShake",0.80],["aimingSpeed",0.80],["endurance",1.00],["spotDistance",0.80],["spotTime",0.80],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]]; 	// Hard
		ai_skill_medium				= [["aimingAccuracy",0.60],["aimingShake",0.60],["aimingSpeed",0.60],["endurance",1.00],["spotDistance",0.60],["spotTime",0.60],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];	// Medium
		ai_skill_easy				= [["aimingAccuracy",0.40],["aimingShake",0.50],["aimingSpeed",0.50],["endurance",1.00],["spotDistance",0.50],["spotTime",0.50],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];	// Easy
		ai_skill_random				= [ai_skill_extreme,ai_skill_hard,ai_skill_hard,ai_skill_hard,ai_skill_hard,ai_skill_medium,ai_skill_medium,ai_skill_medium,ai_skill_medium,ai_skill_easy];

		ai_static_useweapon			= true;	// Allows AI on static guns to have a loadout 	
		ai_static_weapons			= ["KORD_high_TK_EP1","DSHKM_Ins","M2StaticMG"];	// static guns

		ai_static_skills			= false;	// Allows you to set custom array for AI on static weapons. (true: On false: Off) 
		ai_static_array				= [["aimingAccuracy",0.20],["aimingShake",0.70],["aimingSpeed",0.75],["endurance",1.00],["spotDistance",0.70],["spotTime",0.50],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];

		ai_gear0					= [["ItemBandage","ItemBloodbag","ItemPainkiller","ItemSodaOrangeSherbet"],["ItemCompass","ItemGPS"]];
		ai_gear1					= [["ItemBandage","ItemMorphine","FoodMRE"],["ItemKnife","ItemMatchbox_DZE"]];
		ai_gear_random				= [ai_gear0,ai_gear1];	// Allows the possibility of random gear

		ai_wep_assault				= [["FN_FAL","20Rnd_762x51_FNFAL"],["FHQ_ACR_BLK_HAMR_SD_F","FHQ_rem_30Rnd_680x43_ACR_SD"],["SCAR_H_STD_EGLM_Spect","20Rnd_762x51_B_SCAR"],["M8_sharpshooter","30Rnd_556x45_Stanag"],["RH_hk417acog","RH_20Rnd_762x51_hk417"],["RH_sc2aim","20Rnd_762x51_DMR"],["RH_m14aim","20Rnd_762x51_DMR"],["M4A3_CCO_EP1","30Rnd_556x45_Stanag"],["M4A1_AIM_SD_camo","30Rnd_556x45_StanagSD"],["Vil_AK_107_c","30Rnd_545x39_AK"],["VSS_vintorez","10Rnd_9x39_SP5_VSS"],["BAF_L85A2_RIS_Holo","30Rnd_556x45_Stanag"],["SCAR_H_LNG_Sniper_SD","20rnd_762x51_SB_SCAR"]];	// Assault
		ai_wep_machine				= [["MK_48_DZ","100Rnd_762x51_M240"],["M60A4_EP1_DZE","100Rnd_762x51_M240"],["Pecheneg_DZ","100Rnd_762x54_PK"],["M240_DZ","100Rnd_762x51_M240"]];	// Light machine guns
		ai_wep_sniper				= [["KSVK_DZE","5Rnd_127x108_KSVK"],["FHQ_XM2010_NV_SD_DESERT","FHQ_rem_5Rnd_300Win_XM2010_NT_SD"],["M110_NVG_EP1","20rnd_762x51_B_SCAR"],["FHQ_RSASS_SD_TAN","FHQ_rem_20Rnd_762x51_PMAG_NT_SD"],["vil_SV_98_SD","vil_10Rnd_762x54_SV"],["RH_hk417sdsp","RH_20Rnd_762x51_SD_hk417"],["vil_M110sd","20Rnd_762x51_DMR"]];	// Sniper rifles
		ai_wep_random				= [ai_wep_assault,ai_wep_assault,ai_wep_assault,ai_wep_sniper,ai_wep_machine];	// random weapon 60% chance assault rifle,20% light machine gun,20% sniper rifle
		ai_wep_launchers_AT			= ["RPG18"];
		ai_wep_launchers_AA			= ["Strela"];
		
		ai_packs					= ["DZ_Czech_Vest_Puch","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_British_ACU","DZ_GunBag_EP1","DZ_CivilBackpack_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1"];
		ai_hero_skin				= ["FR_AC","FR_AR","FR_Corpsman","FR_GL","FR_Marksman","FR_R","FR_Sapper","FR_TL"];
		ai_bandit_skin				= ["Ins_Soldier_GL_DZ","TK_INS_Soldier_EP1_DZ","TK_INS_Warlord_EP1_DZ","GUE_Commander_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_2_DZ","GUE_Soldier_CO_DZ","BanditW1_DZ","BanditW2_DZ","Bandit1_DZ","Bandit2_DZ"];
		ai_special_skin				= ["Functionary1_EP1_DZ"];
		ai_all_skin					= [ai_hero_skin,ai_bandit_skin,ai_special_skin];

		ai_add_skin					= false;			// adds unit skin to inventory on death
		
	/* END AI CONFIG */

	/* WAI MISSIONS CONFIG */
		wai_mission_system			= true;	// use built in mission system

		wai_mission_markers			= ["DZMSMajMarker","DZMSMinMarker","DZMSBMajMarker","DZMSBMinMarker"];

		wai_avoid_missions			= true;								// avoid spawning near other missions, these are defined in wai_mission_markers
		wai_avoid_traders			= true;								// avoid spawning missions near traders
		wai_mission_spread			= 750;								// make missions spawn this far apart from one another and other markers
		wai_near_town				= 0;								// make missions check for towns around this radius
		wai_near_road				= 0;								// make missions check for roads around this radius
		wai_near_water				= 50;								// nearest water allowed near missions
		
		wai_mission_timer			= [300,600];						// time between missions 5-15 minutes
		wai_mission_timeout			= [900,1200]; 						// time each missions takes to despawn if inactive 15-30 minutes
		wai_timeout_distance		= 600;								// if a player is this close to a mission then it won't time-out
		
		wai_clean_mission			= true;								// clean all mission buildings after a certain period
		wai_clean_mission_time		= 600;								// time after a mission is complete to clean mission buildings

		wai_mission_fuel			= [25,50];							// fuel inside mission spawned vehicles [min%,max%]
		wai_vehicle_damage			= [25,75];							// damages to spawn vehicles with [min%,max%]
		wai_keep_vehicles			= false;								// save vehicles to database and keep them after restart

		wai_crates_smoke			= true;								// pop smoke on crate when mission is finished during daytime
		wai_crates_flares			= true;								// pop flare on crate when mission is finished during nighttime
		
		wai_players_online			= 1; 								// number of players online before mission starts
		wai_server_fps				= 2; 								// missions only starts if server FPS is over wai_server_fps
		
		wai_kill_percent			= 30;								// percentage of AI players that must be killed at "crate" missions to be able to trigger completion

		wai_high_value				= true;								// enable the possibility of finding a high value item (defined below crate_items_high_value) inside a crate
		wai_high_value_chance		= 5;								// chance in percent you find above mentioned item

		wai_enable_minefield		= true;								// enable minefields to better defend missions
		wai_use_launchers			= true;							// add a rocket launcher to each spawned AI group
		wai_remove_launcher			= true;							// remove rocket launcher from AI on death

		// Missions
		wai_hero_missions			= [ 								// ["mission filename",% chance of picking this mission],Make sure the chances add up to 100,or it will not be accurate percentages
										["black_hawk_crash",11],
										["armed_vehicle",13],
										["bandit_base",8],
										["captured_mv22",8],
										["ikea_convoy",10],
										["destroyed_ural",14],
										["disabled_milchopper",10],
										["mayors_mansion",10],
										["weapon_cache",13]
									];
		wai_bandit_missions			= [
										["armed_vehicle",12],
										["black_hawk_crash",11],
										["captured_mv22",6],
										["broken_down_ural",14],
										["hero_base",6],
										["ikea_convoy",10],
										["medi_camp",16],
										["presidents_mansion",6],
										["sniper_extraction",8],
										["weapon_cache",10]
									];
		/*
		wai_special_missions		= [
										["bunny_ranch",100]
									];
		*/
		
		// Vehicle arrays
		armed_vehicle 				= ["ArmoredSUV_PMC_DZE","GAZ_Vodnik_DZE","HMMWV_M1151_M2_CZ_DES_EP1_DZE","HMMWV_M998A2_SOV_DES_EP1_DZE","LandRover_MG_TK_EP1_DZE","LandRover_Special_CZ_EP1_DZE","Offroad_DSHKM_Gue_DZE","Pickup_PK_GUE_DZE","Pickup_PK_INS_DZE","Pickup_PK_TK_GUE_EP1_DZE","UAZ_MG_TK_EP1_DZE"];
		armed_chopper 				= ["CH_47F_EP1_DZE","UH1H_DZE","Mi17_DZE","UH60M_EP1_DZE","UH1Y_DZE","MH60S_DZE"];
		civil_chopper 				= ["AH6X_DZ","BAF_Merlin_DZE","MH6J_DZ","Mi17_Civilian_DZ"];
		military_unarmed 			= ["GAZ_Vodnik_MedEvac","HMMWV_Ambulance","HMMWV_Ambulance_CZ_DES_EP1","HMMWV_DES_EP1","HMMWV_DZ","HMMWV_M1035_DES_EP1","LandRover_CZ_EP1","LandRover_TK_CIV_EP1","UAZ_CDF","UAZ_INS","UAZ_RU","UAZ_Unarmed_TK_CIV_EP1","UAZ_Unarmed_TK_EP1","UAZ_Unarmed_UN_EP1"];
		cargo_trucks 				= ["Kamaz","MTVR_DES_EP1","Ural_CDF","Ural_TK_CIV_EP1","Ural_UN_EP1","V3S_Open_TK_CIV_EP1","V3S_Open_TK_EP1"];
		refuel_trucks				= ["KamazRefuel_DZ","MtvrRefuel_DES_EP1_DZ","UralRefuel_TK_EP1_DZ","V3S_Refuel_TK_GUE_EP1_DZ"];
		civil_vehicles 				= ["hilux1_civil_1_open","hilux1_civil_2_covered","hilux1_civil_3_open_EP1","SUV_Blue","SUV_Camo","SUV_Charcoal","SUV_Green","SUV_Orange","SUV_Pink","SUV_Red","SUV_Silver","SUV_TK_CIV_EP1","SUV_White","SUV_Yellow"];

		// Dynamic box array
		crates_large				= ["USVehicleBox","RUVehicleBox","TKVehicleBox_EP1"];
		crates_medium				= ["USBasicWeaponsBox","RUBasicWeaponsBox","USSpecialWeaponsBox","USSpecialWeapons_EP1","RUSpecialWeaponsBox","SpecialWeaponsBox","TKSpecialWeapons_EP1","CZBasicWeapons_EP1","UNBasicWeapons_EP1"];
		crates_small				= ["GuerillaCacheBox","RULaunchersBox","RUBasicAmmunitionBox","RUOrdnanceBox","USBasicAmmunitionBox","USLaunchersBox","USOrdnanceBox","USOrdnanceBox_EP1","USLaunchers_EP1","USBasicWeapons_EP1","USBasicAmmunitionBox_EP1","UNBasicAmmunitionBox_EP1","TKOrdnanceBox_EP1","TKLaunchers_EP1","TKBasicAmmunitionBox_EP1","GuerillaCacheBox_EP1","GERBasicWeapons_EP1"];

		crate_weapons_buildables	= [["ChainSaw","ItemJerryMixed"],["ChainSawB","ItemJerryMixed"],["ChainSawG","ItemJerryMixed"],["ChainSawP","ItemJerryMixed"],["ChainSawR","ItemJerryMixed"]];
		
		crate_tools					= ["ItemKeyKit","Binocular","Binocular_Vector","ItemCompass","ItemCrowbar","ItemEtool","ItemFishingPole","ItemFlashlightRed","ItemGPS","ItemHatchet_DZE","ItemKnife","ItemMachete","ItemMatchbox_DZE","ItemWatch","NVGoggles"];
		crate_tools_buildable		= ["ItemKeyKit","ItemEtool","ItemCrowbar","ItemKnife"];
		crate_tools_sniper			= ["ItemCompass","Binocular","Binocular_Vector","NVGoggles","ItemGPS"];

		crate_items					= ["FoodNutmix","FoodPistachio","FoodMRE","ItemSodaOrangeSherbet","ItemSodaRbull","ItemSodaR4z0r","ItemSodaMdew","ItemSodaPepsi","ItemBandage","ItemSodaCoke","FoodbaconCooked","FoodCanBakedBeans","FoodCanFrankBeans","FoodCanPasta","deer_stand_kit","FoodchickenCooked","FoodmuttonCooked","FoodrabbitCooked","ItemTroutCooked","ItemTunaCooked","ItemSeaBassCooked","ItemAntibiotic","ItemBloodbag","ItemEpinephrine","ItemFuelBarrelEmpty","ItemMorphine","ItemGoldBar","ItemGoldBar10oz","CinderBlocks","ItemTentDomed2","ItemComboLock","ItemTentDomed","ItemLockbox","bulk_ItemSandbag","bulk_ItemTankTrap","bulk_ItemWire","MortarBucket","PartEngine","PartFueltank","bulk_PartGeneric","PartGlass","PartPlankPack","PartVRotor","PartWheel","ItemTent"];
		crate_items_high_value		= ["ItemBriefcase100oz","ItemVault","30m_plot_kit","ItemHotwireKit"];
		crate_items_food			= ["ItemWaterbottle","FoodNutmix","FoodPistachio","FoodMRE","ItemSodaOrangeSherbet","ItemSodaRbull","ItemSodaR4z0r","ItemSodaMdew","ItemSodaPepsi","ItemSodaCoke","FoodbaconCooked","FoodCanBakedBeans","FoodCanFrankBeans","FoodCanPasta","FoodCanSardines","FoodchickenCooked","FoodmuttonCooked","FoodrabbitCooked","ItemTroutCooked","ItemTunaCooked","ItemSeaBassCooked"];
		crate_items_buildables		= ["forest_large_net_kit","cinder_garage_kit","desert_large_net_kit","ItemSandbagExLarge5X","metal_floor_kit","ItemComboLock",["CinderBlocks",20],"wood_shack_kit","ItemComboLock","sandbag_nest_kit","ItemLockbox","bulk_ItemSandbag","bulk_ItemTankTrap","bulk_ItemWire",["MortarBucket",10],"cinder_wall_kit","cinder_wall_kit"];
		crate_items_vehicle_repair	= ["PartEngine","PartFueltank","bulk_PartGeneric","PartGlass","PartVRotor","PartWheel"];
		crate_items_medical			= ["ItemWaterbottle","ItemAntibiotic","ItemBloodbag","ItemEpinephrine","ItemTentDomed2","ItemMorphine","ItemBandage","FoodMRE","FoodNutmix"];
		crate_items_chainbullets	= ["2000Rnd_762x51_M134","200Rnd_762x51_M240","100Rnd_127x99_M2","150Rnd_127x107_DSHKM"];
		crate_items_sniper			= [["ItemPainkiller",5],"Skin_Sniper1_DZ","Skin_CZ_Soldier_Sniper_EP1_DZ","Skin_GUE_Soldier_Sniper_DZ"];
		crate_items_president		= ["ItemDocument",["ItemBriefcase10oz",5]];

		crate_backpacks_all			= ["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Czech_Vest_Puch","DZ_TerminalPack_EP1","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_CompactPack_EP1","DZ_British_ACU","DZ_GunBag_EP1","DZ_CivilBackpack_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1"];
		crate_backpacks_large		= ["DZ_GunBag_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1","DZ_CivilBackpack_EP1"];

		crate_random				= [crate_items,crate_items_food,crate_items_buildables,crate_items_vehicle_repair,crate_items_medical,crate_items_chainbullets];

	/* END WAI MISSIONS CONFIG */

	/* STATIC MISSIONS CONFIG */

		static_missions				= false;		// use static mission file
		custom_per_world			= false;		// use a custom mission file per world

	/* END STATIC MISSIONS CONFIG */

	configloaded = true;

};
