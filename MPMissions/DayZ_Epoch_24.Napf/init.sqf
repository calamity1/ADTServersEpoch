/*
DayZ Server Napf "ADT-68"
ADT-TEAM: http://adt-team.ru/
WebSite ADT-68: http://dayz-adt.ru/
ADT-68 VK: https://vk.com/adt_68
by GROM: http://gromx.ru/
*/

//BTC           = true;

startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	24;				//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

//Start Loot
DefaultMagazines = ["ItemBandage","ItemBandage","ItemPainkiller","HandRoadFlare"];
DefaultWeapons = ["ItemFlashlight"];
DefaultBackpack = "DZ_Patrol_Pack_EP1";  
DefaultBackpackItems = "";

// DayZ ADT_Napf Config
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500
// 
MaxVehicleLimit = 200; // Default = 50
MaxDynamicDebris = 500; // Default = 100
dayz_MapArea = 18000; // Default = 10000

dayz_minpos = -1000; 
dayz_maxpos = 26000;

dayz_paraSpawn = true;

DZE_PlotPole = [45,60]; //Default: [30;45]
DZE_BuildingLimit = 4000;

DZE_DeathMsgGlobal = false;
DZE_DeathMsgSide = false;
DZE_DeathMsgTitleText = false;
dayZ_serverName = "ADT-68"; //ADT-68 

deathMessages=1; //fix*&

dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

dayz_maxAnimals = 15; // Default: 8
dayz_tameDogs = true;
DynamicVehicleDamageLow = 0; // Default: 0
DynamicVehicleDamageHigh = 100; // Default: 100

DZE_BuildOnRoads = false; // Default: False

EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];
dayz_fullMoonNights = false; //true

//Load in compiled functions
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "custom\compiles.sqf";				//Compile regular functions
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";				//Compile trader configs
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	//Compile vehicle configs
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\dynamic_vehicle.sqf";				
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\mission.sqf";

	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
[] execVM "scripts\welcome_napf_adt.sqf";
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	
	//Custom Loadouts
	//[] ExecVM "scripts\vip_loot_napf.sqf"; //donators_napf_&*
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	
	
	//anti Hack_fix_AH
	//[] execVM "\z\addons\dayz_code\system\antihack.sqf";

	//Lights
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
};
//#include "\z\addons\dayz_code\system\REsec.sqf"
//----------------------------------ADT-TEAM-Scripts-Napf----------------------------------//
//Start Dynamic Weather
execVM "scripts\DynamicWeatherEffects.sqf";

#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

/*if (BTC) then {
_logistic = execVM "=BTC=_Logistic\=BTC=_Logistic_Init.sqf";
};*/

[] execVM "service_point\service_point.sqf";

//[] execVM "scripts\daln.sqf";
//[] execVM "scripts\napf_len.sqf";

[] execVM "scripts\szone.sqf"; //safezone_adt
