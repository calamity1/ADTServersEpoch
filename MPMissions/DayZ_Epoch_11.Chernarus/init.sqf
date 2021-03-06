/*	 
   * DayZ Epoch |v1.0.5.1| "22.10.2014"
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
spawnArea = 1500; // Default = 1500

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
/*
DZE_DeathMsgGlobal = false; //false
DZE_DeathMsgSide = false;
DZE_DeathMsgTitleText = false;
*/

DZE_DeathMsgGlobal = true; //
DZE_DeathMsgSide = true;
DZE_DeathMsgTitleText = true;


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
DZE_ForceNameTagsInTrader = true; //Отображать имена игроков в трейде
MaxMineVeins = 20; // Мини рудники на карте 
MaxAmmoBoxes = 20; //Коробки с лутом на дорогах

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
//Build Vectors
DZE_noRotate = ["VaultStorageLocked","ItemComboLock","Plastic_Pole_EP1_DZ "]; //Объекты которые запретим вращать. Пр: DZE_noRotate = ["VaultStorageLocked"]
DZE_curPitch = 45; //Starting rotation angle. Only 1, 5, 45, or 90.



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
//zombie_generate = compile preprocessFileLineNumbers "scripts\zombie_generate.sqf";
if (isServer) then {
/*
     _factions = [] execVM "\z\addons\dayz_server\ai_adt\faction\set_unit_faction.sqf";
	 _aispawn = [[5035.50,12225.0,0],600,5,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf"; 
     _aispawn = [[4989.50,12205.0,0],600,5,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
     _aispawn = [[5009.50,12173.0,0],600,5,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
     _aispawn = [[4948.50,12168.0,0],600,5,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
     _aispawn = [[4959.50,12268.0,0],600,5,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
     _aispawn = [[5026.50,12266.0,0],600,5,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf"; //40
	 
	 
	 _aispawn = [[4848.50,12251.0,0],600,7,5,1,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[5088.50,12431.0,0],600,7,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[4848.50,12251.0,0],600,7,5,1,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[5088.50,12431.0,0],600,7,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[4963.50,12781.0,0],600,7,5,1,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 
	 _aispawn = [[5338.50,12700.0,0],600,7,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[5683.50,12286.0,0],600,7,5,1,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[5564.50,11905.0,0],600,7,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf"; //56
	 
	 
	 _aispawn = [[4755.00,12550.0,0],600,7,5,1,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[5035.00,11694.0,0],600,7,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[5743.00,11774.0,0],600,7,5,1,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 
	 _aispawn = [[6022.00,12206.0,0],600,7,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[5186.00,12168.0,0],600,7,5,1,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[4993.00,12223.0,0],600,7,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf"; //42
	 
	 _aispawn = [[5055.50,12238.0,0],600,5,5,1,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[5102.50,12230.0,0],600,5,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[5046.50,12211.0,0],600,5,5,1,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[5077.50,12199.0,0],600,5,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";

	 */
	 
	 /*
	 _aispawn = [[5186.00,12168.0,0],600,5,5,1,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[4993.00,12223.0,0],600,5,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[5186.00,12168.0,0],600,5,5,1,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[4993.00,12223.0,0],600,5,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf"; //40
	 
	 _aispawn = [[5118.00,12966.0,0],600,3,5,1,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[5468.00,12700.0,0],600,3,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf"; 
	 _aispawn = [[4851.00,12426.0,0],600,3,5,1,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[5511.00,12454.0,0],600,3,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf"; //12
	 
	 _aispawn = [[4969.00,12390.0,0],600,3,5,1,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[4818.00,12222.0,0],600,3,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf"; 
	 _aispawn = [[4991.00,12181.0,0],600,3,5,1,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf";
	 _aispawn = [[5180.00,12102.0,0],600,3,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf"; 
	 _aispawn = [[5049.00,12274.0,0],600,3,5,4,1] execVM "\z\addons\dayz_server\ai_adt\faction\add_unit_server.sqf"; //15 = 197ботов
	 */
	 
};

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	//Compile vehicle configs
	
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
[] execVM "scripts\welcome_adt.sqf"; //ADT_Welcome_ by GROM "11.06.2014"
//[] execVM "scripts\kill_msg.sqf";
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
	DZE_RequireGenerator = true;
	DZE_StreetLights = false;
	DZE_HouseLights = false;
	DZE_TowerLights = false;
	DZE_LightChance = 1;
	[] execVM "lights\local_lights_init.sqf";
	
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

//[] execVM "scripts\marker_adt_sector.sqf"; //marker_adt_sector

[] execVM "scripts\rud_mar.sqf"; //rud_mar

//[] execVM "scripts\box_adt.sqf"; //box_adt

["elevator"] execVM "elevator\elevator_init.sqf";

[] spawn {

 while {1 == 1} do
 {
  _vehicle_list = player nearEntities [["LandVehicle","Air","Ship"], 5];  //m12
  {
   if (locked _x) then {
    closeDialog 0;
    //hint "by GROM"; //msg
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
 