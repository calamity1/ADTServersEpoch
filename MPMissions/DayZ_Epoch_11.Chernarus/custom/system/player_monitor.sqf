if (isServer) then {
	waitUntil{dayz_preloadFinished};
};
_id = [] execFSM "custom\system\player_monitor151.fsm";  //patched 4 RscDisplaySpawnSelecter
if (DZE_R3F_WEIGHT) then {
	_void = [] execVM "\z\addons\dayz_code\external\R3F_Realism\R3F_Realism_Init.sqf";
};