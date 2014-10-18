/*	 
   * DayZ Epoch |v1.0.5.1| "15.10.2014"
   * For ADT-TEAM SERVER DayZ 
   * Dev: GROM
   * http://adt-team.ru/
*/

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

DZE_SelfTransfuse = true; //Самозаливка крови

//start loot_fix
DefaultMagazines = ["ItemBandage","ItemPainkiller","8Rnd_9x18_Makarov","HandRoadFlare"];
DefaultWeapons = ["ItemFlashlight","EvMoney","Makarov"];
DefaultBackpack = "";  
DefaultBackpackItems = "";



//Building
DZE_BuildingLimit = 700;
DZE_PlotPole = [30,45]; //Default: [30;45]

snapTutorial = true;

DZE_DeathMsgGlobal = false;
DZE_DeathMsgSide = false;
DZE_DeathMsgTitleText = false;

DZE_vehicleAmmo = 1;
deathMessages = 1;
MaxVehicleLimit = 300; // Default = 50
MaxDynamicDebris = 200; // Default = 100 мусор на дорогах
dayz_MapArea = 14000; // Default = 10000
dayz_maxLocalZombies = 40; // Default = 30
dayz_zedsAttackVehicles = true;			// Default: true
//ADT_Team_Zombie_Attack_Veh = true; // zombie attack veh
DZE_PlayerZed =	false;	//	Если игрок умер инфицированным, - возраждать в виде зомби. По умолчанию: да.
dayz_spawnselection = 1; // DayZ Spawnselection / 1 = on spawn Spawnselection // 0 = off spawn Spawnselection
dayz_tameDogs = false; //fix "false"
DZE_ForceNameTags =	false;	//	Принудительно отображать имена игроков.
DZE_Light =	false;	//	Локальное освещение

dayz_paraSpawn = false;

dayz_minpos = -1; 
dayz_maxpos = 16000;

dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

dayz_maxAnimals = 15; // Default: 8

DynamicVehicleDamageLow		=	40; 	//	Минимальный порог возможных повреждений техники при респе(0  - возможно респ целая)
DynamicVehicleDamageHigh	=	90; 	//	Максимальный порог возможных повреждений техники при респе(100 - полностью сломанная)

DZE_BuildOnRoads = false; // Default: False
DZE_MissionLootTable = true; 
DZE_ConfigTrader = true; //bd off

/*
DZE_defaultSkin = [
	[
"Haris_Press_EP1_DZ","Rocker3_DZ","Rocker1_DZ","SurvivorWurban_DZ","SurvivorWdesert_DZ","SurvivorW3_DZ","SurvivorWpink_DZ","Haris_Press_EP1_DZ","Pilot_EP1_DZ","RU_Policeman_DZ"
	],
	[
		"Skin_SurvivorW2_DZ",
		"Skin_SurvivorW3_DZ",
		"Skin_SurvivorWcombat_DZ",
		"Skin_SurvivorWdesert_DZ",
		"Skin_SurvivorWpink_DZ",
		"Skin_SurvivorWurban_DZ"
	]
]; //ADDED*/


EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];

dayz_fullMoonNights = true;

//Load in compiled functions
//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";
call compile preprocessFileLineNumbers "custom\variables.sqf"; //Fix_ADT_Server_v1.5.0.1|	
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
[] execVM "scripts\kill_msg.sqf";
[] execVM "scripts\mining\init.sqf"; // Добыча руды ADTMod
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	
	
	//_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";
	_playerMonitor = [] execVM "custom\system\player_monitor.sqf";
	
    execVM "scripts\switch_weapon\init.sqf"; //Достать оружия из рюкзака
	
	//anti Hack
	//[] execVM "\z\addons\dayz_code\system\antihack.sqf";

	//Lights
	if (DZE_Light) then
			{[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";};
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	//[getPos player, 3000]execVM "\lightsoff.sqf"
	
	
	//System Lights by GROM 
	//execVM "scripts\light\lightsoff.sqf";
	/*
	["OFF",player,3000] execVM "scripts\light\ws_fnc_switchLights.sqf";
	["OFF",Land_A_Office01,3000] execVM "scripts\light\ws_fnc_switchLights.sqf";
	["OFF",Land_A_GeneralStore_01a,3000] execVM "scripts\light\ws_fnc_switchLights.sqf";
	["OFF",Land_Church_03,3000] execVM "scripts\light\ws_fnc_switchLights.sqf";
	["OFF",Land_Mil_ControlTower,3000] execVM "scripts\light\ws_fnc_switchLights.sqf";
	["OFF",Land_NAV_Lighthouse,3000] execVM "scripts\light\ws_fnc_switchLights.sqf";
	["OFF",Land_NAV_Lighthouse2,3000] execVM "scripts\light\ws_fnc_switchLights.sqf";
	*/
	
	[] execVM "scripts\fixes\effects_adt.sqf"; //Effects_ADT
	
	
};

//----------------------------***ADT-TEAM-Scripts***----------------------------//

//*#include "\z\addons\dayz_code\system\REsec.sqf"*//

//Start Dynamic Weather
[] execVM "scripts\fixes\DynamicWeatherEffects.sqf";

#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"
//#include "scripts\no_hack\antiBruteForce.sqf" //no hack esc button 

[] execVM "scripts\safez.sqf"; //Safe_Zone

[] execVM "scripts\loginCamera.sqf"; //loginCamera

[] execVM "service_point\service_point.sqf"; //Refuel_gold

[] execVM "scripts\monitor.sqf"; //Debag_monitor

[] execVM "scripts\weedfarm.sqf"; //hemp farms

["elevator"] execVM "elevator\elevator_init.sqf";

[] spawn {

 while {1 == 1} do
 {
  _vehicle_list = player nearEntities [["LandVehicle","Air","Ship"], 3];  //m12
  {
   if (locked _x) then {
    closeDialog 0;
    hint "by GROM"; //msg
   }
  } forEach _vehicle_list;
  uiSleep 0.1;
 };
};


//watermark_adt_team
_pic = "gui\watermark.paa";
[
'<img align=''left'' size=''1.0'' shadow=''1'' image='+(str(_pic))+' />',
safeZoneX+0.027,
safeZoneY+safeZoneH-0.1,
99999,
0,
0,
3090
] spawn bis_fnc_dynamicText;
 