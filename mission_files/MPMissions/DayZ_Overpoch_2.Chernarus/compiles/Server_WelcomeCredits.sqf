// FILENAME: server_WelcomeCredits.sqf
// =====
// SCRIPT NAME: Server Intro Credits Script by IT07
// SCRIPT VERSION: v1.3.7 BETA
// Credits for original script: Bohemia Interactive http://bistudio.com
 
// ========== SCRIPT CONFIG ============
_onScreenTime = 5; //how long one role should stay on screen. Use value from 0 to 10 where 0 is almost instant transition to next role
//NOTE: Above value is not in seconds. It is percentage. Default: 6
 
// ==== CUSTOMIZING THE CREDITS ===
// If you want more or less credits on the screen, you have to add/remove roles.
// Watch out though, you need to make sure BOTH role lists match eachother in terms of amount.
// Just take a good look at the _role1 and the rest and you will see what I mean.
 
// == CUSTOMIZING TEXT COLOR ==
// Find line 49 and look for: color='#f2cb0b'
// #f2cb0b is the HTML color code for the text. As well as #FFFFFF in the row below it.
// Find the color code you want here: http://html-color-codes.info
// =====
 
// ==== SCRIPT START ====
waitUntil {!isNil "dayz_animalCheck"}; //remove this line completely to make it work in ArmA 3. Yes you read that correctly.
sleep 10; //Wait in seconds before the credits start after player IS ingame
 
_role1 = "Welcome to";
_role1names = ["RNelNet Gaming"];
_role2 = "Admins";
_role2names = ["DaMic"];
_role3 = "Server mod";
_role3names = ["DayZ Overpoch"];
_role4 = "Server antihack<br />by"; //The "by" in this row will be shown one row below "Server antihack". Can be applied to any role
_role4names = ["infiSTAR.de"];
_role5 = "Server Mods";
_role5names = [
"Logistics Towing and Lifting",
"Single Currency and Banking",
"Enhanced Spawn Selection",
"Advanced Trading Menu",
"Dayz Group Manager",
"Vehicle Deployment",
"Snap Building Pro",
"Service Stations",
"Door Management"
"Plot For Life",
"Epoch Events",
"Base Jumping",
"Wicked AI"
];
_role6 = "Server Features";
_role6names = [
"Custom/Upgraded Vehicles",
"Remote Unlock and Start",
"Increased Loot Rate",
"Fast Craft & Build",
"Overwatch Traders",
"Map Additions",
"Mounted Guns",
"Anti Duping",
"Safe-zones",
"Self BB"
];
_role7 = "Team Speak 3";
_role7names = ["ts.rnelnet.com"];
_role8 = "Website";
_role8names = ["rnelnet.com/dayz"];
_role9 = "Special Thanks";
_role9names = ["infiSTAR.de","ArmAholic.com", "OpendayZ.net", "Epochmod.com", "IDC/DOC Clan"];
 
{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.40' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names],
[_role7, _role7names],
[_role8, _role8names],
[_role9, _role9names] //make SURE the last one here does NOT have a , at the end
];