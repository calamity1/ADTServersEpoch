/*	 
    DayZ Epoch |v1.0.5.1| "30.06.2014"
	For ADT-68 SERVER DayZ 
	Addons Credits: GROM, Valerjanich
*/

//BTC           = true;
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	11;					//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

// DayZ Epoch config
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500

//start loot_fix
DefaultMagazines = ["ItemBandage","ItemBandage","ItemPainkiller","HandRoadFlare"];
DefaultWeapons = ["ItemFlashlight"];
DefaultBackpack = "DZ_Patrol_Pack_EP1";  
DefaultBackpackItems = "";

//Building
DZE_BuildingLimit = 3000;
DZE_PlotPole = [45,60]; //Default: [30;45]
//
DZE_DeathMsgGlobal = false;
DZE_DeathMsgSide = false;
DZE_DeathMsgTitleText = false;

//DZE_MissionLootTable = true; //custom loot by valerjanich 21.04.2014

DZE_vehicleAmmo = 1;
deathMessages = 1;

MaxVehicleLimit = 100; // Default = 50
MaxDynamicDebris = 500; // Default = 100
dayz_MapArea = 14000; // Default = 10000
dayz_maxLocalZombies = 40; // Default = 30 

dayz_paraSpawn = false;

dayz_minpos = -1; 
dayz_maxpos = 16000;

dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

dayz_maxAnimals = 15; // Default: 8
dayz_tameDogs = true; //fix
DynamicVehicleDamageLow = 0; // Default: 0
DynamicVehicleDamageHigh = 100; // Default: 100

DZE_BuildOnRoads = false; // Default: False

EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];
dayz_fullMoonNights = true;

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
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	//Compile vehicle configs
	
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
[] execVM "scripts\welcome_adt.sqf"; //ADT_Welcome_ by GROM "11.06.2014"
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	
	//anti Hack
	//[] execVM "\z\addons\dayz_code\system\antihack.sqf";

	//Lights
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	
};

//----------------------------***ADT-TEAM-Scripts***----------------------------//

//*#include "\z\addons\dayz_code\system\REsec.sqf"*//

//Start Dynamic Weather
[] execVM "scripts\DynamicWeatherEffects.sqf";

//AI_sector ADT-68 by GROM 13.06.2014
if (isServer) then {

   _nil = [] execVM "\z\addons\dayz_server\WAI\AI_ADT\Init_AI_ADT.sqf"; //fix AI_ADT by "GROM"

};

#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

[] execVM "scripts\szone.sqf"; //Safe_Zone

[] execVM "service_point\service_point.sqf"; //Refuel_gold

/*
if (BTC) then {
_logistic = execVM "=BTC=_Logistic\=BTC=_Logistic_Init.sqf"; //gui_fix
};*/