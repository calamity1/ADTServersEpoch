if (player != leader group player) exitWith {systemChat format ["You are not the leader and can't invite people."];};

#define groupManagementDialog 55510
#define groupManagementPlayerList 55511

disableSerialization;

private ["_center","_dialog","_playerListBox","_plist","_target","_index","_playerData","_check","_hasInvite"];

_dialog = findDisplay groupManagementDialog;
_playerListBox = _dialog displayCtrl groupManagementPlayerList;

_index = lbCurSel _playerListBox;
_playerData = _playerListBox lbData _index;
_hasInvite = false;
_check = 0;

_center = getMarkerPos "center";
_plist = (_center nearEntities [["AllVehicles"], 14000]);
{if (str(_x) == _playerData) then {_target = _x;_check = 1;};} forEach _plist;

if (_check == 0) exitWith {systemChat "Вы должны выбрать кого-то для начала.";};
if (_target == player) exitWith {systemChat "Вы не можете пригласить себя.";};
if ((count units group _target) > 1) exitWith {systemChat "Этот игрок уже в группе.";};

{if (_x select 1 == getPlayerUID _target) then {_hasInvite = true;};} forEach currentInvites;
if (_hasInvite) exitWith {systemChat "Предложение о вступлении в группу уже отправлено.";};

currentInvites set [count currentInvites,[getPlayerUID player,getPlayerUID _target]];
publicVariable "currentInvites"; 

[nil,_target,"loc", rTITLETEXT, format["\n\n Вы получили предложение вступить в группу. Нажмите K, чтобы посмотреть."], "PLAIN", 0] call RE;

systemChat format["Вы пригласили %1 присоединиться к группе",name _target];