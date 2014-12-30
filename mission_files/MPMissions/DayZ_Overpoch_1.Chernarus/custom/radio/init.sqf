waitUntil {uiSleep 0.25;(!isNil "PVDZE_plr_LoginRecord")};
if (count units group player > 1) then {[player] join grpNull;};

acceptGroupInvite = compile preprocessFileLineNumbers "custom\radioacceptGroupInvite.sqf";
declineGroupInvite = compile preprocessFileLineNumbers "custom\radiodeclineGroupInvite.sqf";
disbandGroup = compile preprocessFileLineNumbers "custom\radiodisbandGroup.sqf";
inviteToGroup = compile preprocessFileLineNumbers "custom\radioinviteToGroup.sqf";
kickFromGroup = compile preprocessFileLineNumbers "custom\radiokickFromGroup.sqf";
leaveGroup = compile preprocessFileLineNumbers "custom\radioleaveGroup.sqf";
mapLoop = compile preprocessFileLineNumbers "custom\radiomapLoop.sqf";
playerSelectChange = compile preprocessFileLineNumbers "custom\radioplayerSelectChange.sqf";
updatePlayerList = compile preprocessFileLineNumbers "custom\radioupdatePlayerList.sqf";
tagName = true;
	
if (isNil "dzgmInit") then {call compile preprocessFileLineNumbers "custom\radioicons.sqf";};
uiSleep 1;
[] spawn dzgmInit;
[] spawn mapLoop;
systemChat "Right click on radio to open group management";