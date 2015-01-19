_obj = _this select 0;

if (!isServer) exitWith {diag_log "Server_DeleteObjInsafezone.sqf - ERROR: NOT SERVER?"};

_delVeh = ["Air","Landvehicle"];
_Action = 1;
_safespot = [];
_radius = 25;
_dam = 1;
_delbikmot = true;
_defdelar = ["Bicycle","Motorcycle","CSJ_GyroC","CSJ_GyroCover","CSJ_GyroP"];
_unlock = true;
_txt = "[VEHICLE CLEANUP ZONE]";
_updateHIVE = true;


if(isNil "HALV_VEHICLE_CLEANUPZONES")then{
	diag_log format["%1: selecting world to cleanup ...",_txt];
	_WorldName = toLower format ["%1", worldName];
	switch (_WorldName)do {
	//NAPF
		case "napf":{
			HALV_VEHICLE_CLEANUPZONES = [			
			[[8246.3184,15485.867,0],	125,	"Trader City Lenzburg"],
			[[15506.952,13229.368,0],	125,	"Trader city Emmen"],
			[[12399.751,5074.5273,0],	125,	"Trader City Schratten"],
			[[10398.626,8279.4619,0],	75,		"Bandit Vendor"],
			[[5149.9814,4864.1191,0],	75,		"Hero Vendor"],
			[[15128.379,16421.879,0],	100,	"AWOLs Airfield"]
			];
		};
	//chernarus
		case "chernarus":{
			HALV_VEHICLE_CLEANUPZONES = [
			[[6325.6772,7807.7412,0],	125,		"Trader City Stary"],
			[[4063.4226,11664.19,0],	125,		"Trader City Bash"],
			[[11447.472,11364.504,0],	125,		"Trader City Klen"],
			[[1606.6443,7803.5156,0],	75,		"Bandit Camp"],
			[[12944.227,12766.889,0],	75,		"Hero Camp"],
			[[3445.0112,3804.1453,0],	90,		"Bor Camp"],
			[[10704.113,5362.7793,0],	90,		"Staroye Camp"],
			[[12060.471,12638.533,0],	50,		"NE Dealer"],
			[[4962.320,9731.850,0],	50,		"NW Dealer"]
			];
		};
		default{
			diag_log format["%2: Cleanup zones for %1 not availible ...",_WorldName,_txt];
			HALV_VEHICLE_CLEANUPZONES = [
			[[0,0,0],	1,			"DEBUG"]
			];
		};
	};
};

_possiblematch = false;
{if(_obj isKindOf _x)then{_possiblematch=true;};}forEach _delVeh;
if(_possiblematch)then{
	{
	_Spos = _x select 0;
	_Rad = _x select 1;
	_name = _x select 2;
	_radats = _Rad+50;
	_radx4 = _Rad+_Rad+_Rad+_Rad;
		if(_obj distance _Spos < _Rad)then{
			_defdel		= false;
			_typeOf		= typeOf _obj;
			_pos		= getpos _obj;
			_mags		= getmagazinecargo _obj;
			_weaps		= getweaponcargo _obj;
			_packs		= getbackpackcargo _obj;
			_objID		= _obj getVariable["ObjectID","0"];
			_objUID		= _obj getVariable["ObjectUID","0"];
			_objname	= (gettext (configFile >> 'CfgVehicles' >> _typeOf >> 'displayName'));
			diag_log format["%1: %2 (%3) by %4 @%5 %6 [ID:%7,UID:%8] Cargo: [%9,%10,%11]",_txt,_typeOf,_objname,_name,mapgridposition _pos,_pos,_objID,_objUID,_weaps,_mags,_packs];
			if(_delbikmot)then{{if(_obj isKindOf _x)then{_defdel = true};}forEach _defdelar;};
			if(_defdel)then{_Action=3;diag_log format["%2: %1 is Model to delete by default!",_typeOf,_txt];};
			if(getDammage _obj > _dam)then{_Action=3;diag_log format["%2: %1 too damaged",_typeOf,_txt];};
			if(_unlock and !_defdel and (locked _obj))then{_obj setVehicleLock "UNLOCKED";_obj setVariable ["R3F_LOG_disabled",false,true];diag_log format["%2: %1 Un-Locked",_typeOf,_txt];};
			switch(_Action)do{
				case 0:{deleteVehicle _obj;diag_log format["%2: %1 Deleted, but remains in DB (Dont forget to clean this up)",_typeOf,_txt];};
				case 1:{
					_newPos = [_Spos, _radats, _radx4, 10, 0, 2000, 0] call BIS_fnc_findSafePos;
					_obj setpos _newPos;

					if(_updateHIVE)then{
					private["_position","_worldspace","_fuel","_key"];
						_position = getPosATL _obj;
						_worldspace = [
							round(direction _obj),
							_position
						]; 
						_fuel = fuel _obj;
						_key = format["CHILD:305:%1:%2:%3:",_objID,_worldspace,_fuel];
						diag_log ("HIVE: WRITE: "+ str(_key));
						_key call server_hiveWrite;
					};
					diag_log format["%6: %5 TP from %1 %2 to %3 %4",_pos,mapgridposition _pos,_newPos,mapgridposition _newPos,_typeOf,_txt];
				};
				case 2:{
					_newPos = [_safespot, 0, _radius, 10, 0, 2000, 0] call BIS_fnc_findSafePos;
					_obj setpos _newPos;

					if(_updateHIVE)then{
					private["_position","_worldspace","_fuel","_key"];
						_position = getPosATL _obj;
						_worldspace = [
							round(direction _obj),
							_position
						];
						_fuel = fuel _obj;
						_key = format["CHILD:305:%1:%2:%3:",_objID,_worldspace,_fuel];
						diag_log ("HIVE: WRITE: "+ str(_key));
						_key call server_hiveWrite;
					};
					diag_log format["%6: %5 TP from %1 %2 to %3 %4",_pos,mapgridposition _pos,_newPos,mapgridposition _newPos,_typeOf,_txt];
				};
				default{_msg = format["%2: %1",_typeOf,_txt];deleteVehicle _obj;[_objID,_objUID,_msg] call server_deleteObj;};
			};
		};
	}forEach HALV_VEHICLE_CLEANUPZONES;
};