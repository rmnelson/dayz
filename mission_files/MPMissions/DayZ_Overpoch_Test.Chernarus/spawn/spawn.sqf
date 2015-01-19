private ["_counter","_vipBase","_vipUID","_findSpot","_isBase","_isNear","_isPZombie","_isZero","_nearPlayers","_position","_seldLoc","_seldRandom","_waitScript"];

cutText ["","BLACK OUT",0];
removeAllWeapons player;
removeAllItems player;
removeBackpack player;
haloSelect = -1;
hidePlayers = [];
spawnSelect = -1;
statusSelect = -2;

locArray = [
	[[4388.23,2263.44,0], [5683.43,3004.63,0], [4517.41,2420.66,0], [5171.99,2070.86,0], [4253.29,2533.43,0]], //Balota
	[[11936.1,8870.28,0], [12287.3,8471.17,0], [12263.7,9160.7,0], [11702.7,9172.23,0], [12618.5,9560.67,0]], //Berezino
	[[6686.8,2290.11,0], [7235.6,2233.5,0], [6288.59,2574.14,0], [6827.66,3168.46,0], [6960.53,2550.45,0]], //Cherno	
	[[10845.3,2701.37,0], [9479.41,1960.8,0], [10497.3,2016.5,0], [10214.1,2411.58,0], [10432.7,2047.76,0]], //Elektro	
	[[1244.61,2614.59,0], [1047.04,2268.01,0], [1787.07,2441.89,0], [2030.73,2235.37,0], [1166.07,2299.62,0]], //Kamenka
	[[12070.5,3591.06,0], [11972.7,3831.11,0], [11962.1,3567.45,0], [12245.1,3529.93,0], [11929.7,3472.91,0]], //Kamyshovo
	[[3608.21,2151.49,0], [3666.51,2642.1,0], [3523.99,2415.42,0], [3468.39,2547.6,0], [3824.01,2589.4,0]], //Komarovo	
	[[13407.3,4175.05,0], [13549.1,4134.78,0], [13457.9,3969.57,0], [13270.3,3957.48,0], [13140,4152.19,0]], //Krutoy	
	[[7952.16,3204.92,0], [7699.07,3215.19,0], [7804.76,3554.8,0], [8048.21,3360.93,0], [7445.66,3325.2,0]], //Prigor	
	[[13387.5,6617.4,0], [13285,6115.62,0], [13310.1,6331.05,0], [13401.9,5995.73,0], [13513.4,6326.69,0]] //Solnichny	
]; 

_waitScript =  [] spawn {
	private ["_blocked","_bodies","_bodyCheck","_bodyPos","_vipBase","_vipUID","_hidePlayers","_i","_idc","_pos"];
	_bodyCheck = {
		if (ctrlVisible 1001) then {
			_vipUID = (getPlayerUID player);
			{if (_vipUID == _x) then {_vipBase = _forEachIndex;};} forEach vipListBase;
			locArray = locArray+[[(vipListBases select _vipBase)]];
		};
		_blocked = false;
		_bodies = [];
		{if (!isNull _x) then {if ((_x getVariable["bodyName",name _x]) == (name player)) then {_bodyPos = (getPosATL _x);_bodies set [count _bodies,_bodyPos];};};} count allDead;
		if (count _bodies != 0) then {
			{
				_bodyPos = _x;
				{
					_pos = (locArray select _forEachIndex) select 0;
					if ((_bodyPos distance _pos) <= bodyCheckDistance) then {
						_idc = (1600+_forEachIndex);
						ctrlShow [_idc,false];
						_blocked = true;
					};
				} forEach locArray;
			} count _bodies;
			if !(ctrlVisible 1624) then {ctrlShow [1001,false];};
			if (_blocked) then {systemChat format ["Note: some spawns are blocked due to a body of yours within %1m",bodyCheckDistance];};
		};
	};
	while {statusSelect < 2} do {
		dayz_temperatur = 36;
		DZE_InRadiationZone = false;
		fnc_usec_damageHandler = {};
		_hidePlayers = [-7245.377,19535.367,0] nearEntities ["CAManBase", 80];
		{if !(_x in hidePlayers) then {hidePlayers set [count hidePlayers,_x];_x hideObject true;};} count _hidePlayers;		
		uiSleep 1;
		if (!dialog) then {
			cutText ["","BLACK OUT",0];
			if (statusSelect == -2) then {_i="createDialog";createDialog "class_dialog";call classfill;};
			if (statusSelect == 0) then {disableUserInput true;disableUserInput true;disableUserInput true;_i="createDialog";createDialog "spawn_dialog";if !((getPlayerUID player) in vipListBase) then {ctrlShow [1001,false];ctrlShow [1624,false];};call _bodyCheck;uiSleep 1;disableUserInput false;disableUserInput false;disableUserInput false;};
			if (statusSelect == 1) then {_i="createDialog";createDialog "halo_dialog";};
		};
	};
};

_isPZombie = player isKindOf "PZombie_VB";
#include "class.sqf"
statusSelect = 0;
closeDialog 0;
waitUntil {spawnSelect != -1};
statusSelect = 1;
closeDialog 0;
if (!_isPZombie && (spawnSelect != 41)) then {waitUntil {haloSelect != -1};};
statusSelect = 3;
closeDialog 0;
terminate _waitScript;
{_x hideObject false;} count hidePlayers;
hidePlayers = [];
fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
cutText ["","BLACK IN"];

if (spawnSelect == 40) exitWith {
	_vipUID = (getPlayerUID player);
	{if (_vipUID == _x) then {_vipBase = _forEachIndex;};} forEach vipListBase;
	_position = vipListBases select _vipBase;
	if (haloSelect == 1) then {player setPosATL [_position select 0,_position select 1,1500];[player,1500] spawn BIS_fnc_halo;} else {player setPosATL _position;};
	[] execVM "compiles\Server_WelcomeCredits.sqf";
};
if (spawnSelect == 41) then {spawnSelect = floor (random 10)};

_seldLoc = locArray select spawnSelect;
_seldRandom = _seldLoc call BIS_fnc_selectRandom;
_findSpot = true;
_isNear = false;
_counter = 0;
while {_findSpot && _counter < 20} do {
	_position = ([_seldRandom,0,650,1,0,20,0] call BIS_fnc_findSafePos);
	_nearPlayers = (_position nearEntities ["CAManBase",100]);
	{if ((!isNull _x) && (getPlayerUID _x != "")) then {_isNear = true;};} count _nearPlayers;
	_isZero = ((_position select 0) == 0) && ((_position select 1) == 0);
	_isBase = (count(nearestObjects [_position,["Plastic_Pole_EP1_DZ"],45]) > 0);
	_counter = _counter + 1;
	if (!_isNear && !_isZero && !_isBase) then {_findSpot = false};
};
_position = [_position select 0,_position select 1,0];
if (haloSelect == 1) then {player setPosATL [_position select 0,_position select 1,1500];[player,1500] spawn BIS_fnc_halo;} else {player setPosATL _position;};
[] execVM "compiles\Server_WelcomeCredits.sqf";