private [ "_camera", "_camDistance" ];
titleText [format ["Добро пожаловать, %1", name player], "PLAIN DOWN"];
_camDistance = 70;
waitUntil {!isNil ("PVDZE_plr_LoginRecord")};
showCinemaBorder true;
camUseNVG false;
_camera = "camera" camCreate [(position player select 0)-2, position player select 1,(position player select 2)+_camDistance];
_camera cameraEffect ["internal","back"];
_camera camSetFOV 2.000;
_camera camCommit 0;
waitUntil {camCommitted _camera};
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,2];
_camera camCommit 8;
sleep 0.1;
hint "DayZVTX";
waitUntil {camCommitted _camera};
_camera cameraEffect ["terminate","back"];
camDestroy _camera;

waituntil {!isnull (finddisplay 46)}; // Makes the script start when player is ingame
 
sleep 1; // wait 15 before the welcome message starts (in seconds)
 
//_role1 = "Сервер";
//_role1names = ["EPOCH SKOTCH", "1.0.5.1"];
//_role2 = "";
//_role2names = ["ADT-TEAM.RU"];
 
{
  sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.70' color='#FF8501' align='left'>%1<br /></t><t size='0.1'><br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.50' color='#ffffff' align='left'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime = 1 + (((count _memberNames) - 1) * 0.5);
	[
		_finalText,
		[safezoneX + safezoneW - 0.5,0.35],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach [
	[_role1, _role1names],
	[_role2, _role2names]
];
