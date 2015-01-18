private ["_hasBomb","_count","_boom"];
closeDialog 0;
if (DZE_ActionInProgress) exitWith {};
_hasBomb = "OG7" in magazines player;
_count = 20;

if (_hasBomb) then {
	player removeMagazine "OG7";
	titleText ["Suicide bomb activated! Countdown started!","PLAIN DOWN"];
	uiSleep 4;
	while {(_count > 0)} do {
		titleText [format["72 virgins are yours in... %1",_count],"PLAIN DOWN"];
		_count = _count -1;
		uiSleep 1;
	};
	titleText ["","PLAIN DOWN"];
	[nil, player, rSAY, "jihad", 250] call RE;
	titleText ["ALLAHU AKBAR MOTHERFUCKERS!!!!","PLAIN DOWN"];
	uiSleep 2;
	[nil, player, rSAY,["z_scream_3", 250]] call RE;
	_pos = getPos (vehicle player);
	_boom = "Sh_120_HE" createVehicle [(_pos select 0),(_pos select 1)+1,1];
	uiSleep 3;
	titleText ["","PLAIN DOWN"];
} else {
	titleText ["You need a Suicide Bomb (OG7) for this!","PLAIN DOWN"];
};
