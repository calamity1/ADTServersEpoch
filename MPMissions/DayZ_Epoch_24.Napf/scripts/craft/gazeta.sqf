

private ["_map_coord","_location","_gun_list","_med_list","_ammo_list","_name_veh","_messages","_object_bot","_finish_box","_metalBarCount","_chance","_finish_veh","_finish_veh_f","_x","_Objects","_this","_invehicl","_started","_finished","_isRead","_animState"];
disableserialization;
call gear_ui_init;
_onLadder =     (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [(localize "str_player_21") , "PLAIN DOWN"]};
if !("ItemNewspaper" in magazines player) exitWith {cutText [format["Нужна газета!"], "PLAIN DOWN"]};
if(DZE_ActionInProgress) exitWith { cutText ["я занят...", "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

_invehicle = false;
closeDialog 1;


if (vehicle player != player) then {
	_invehicle = true;
};

if !(_invehicle) then {
player playActionNow "Medic";
};

//[player,SOUND,0,false,7] call dayz_zombieSpeak;
[player,10,true,(getPosATL player)] spawn player_alertZombies;

r_interrupt = false;
_animState = animationState player;
r_doLoop = true;
_started = false;
_finished = false;
 
    while {r_doLoop} do {
        _animState = animationState player;
        _isRead = ["Medic", _animState] call fnc_inString;
        if (_isRead) then {
            _started = true;
        };
        if (_started and !_isRead) then {
            r_doLoop = false;
            _finished = true;
        };
        if (r_interrupt) then {
            r_doLoop = false;
        };
		if (_invehicle) then {
		sleep 6;
		r_doLoop = false;
		_finished = true;
		};
        sleep 0.1;
    };
    r_doLoop = false;
 

if (_finished) then {

player removeMagazine "ItemNewspaper";

_location = [ 
////////////////////////////////////////////////////////////////
[5610.0908, 16298.324, 0],
[6115.2979, 16130.955, 0],
[6651.498, 17070.082, 0],
[7153.6045, 16186.747, 0],
[8207.4102, 16747.742, 0],
[8960.5703, 16862.422, 0],
[9540.1631, 15845.811, 0],
[9775.7188, 15325.107, 0],
[10820.225, 16037.977, 0],
[11451.037, 15320.598, 0],
[12272.749, 15024.35, 0],
[11567.808, 14418.878, 0],
[10250.908, 14403.741, 0],
[12460.878, 13828.545, 0],
[13180.956, 13426.338, 0],
[13557.213, 14211.289, 0],
[13494.503, 12580.842, 0],
[14636.248, 12829.517, 0],
[15646.088, 12721.398, 0],
[16348.866, 13525.812, 0],
[16865.68, 14113.982, 0],
[16050.457, 15266.541, 0],
[15358.491, 16032.029, 0],
[14154.039, 17104.578, 0],
[17328.441, 11856.444, 0],
[19162.152, 11722.375, 0],
[19376.232, 10909.314, 0],
[18308.01, 10714.698, 0],
[19951.43, 11614.256, 0],
[17892.83, 9875.6885, 0],
[18651.832, 9222.6445, 0],
[16640.803, 9538.3535, 0],
[14763.843, 8984.7813, 0],
[14141.073, 8314.4385, 0],
[18545.781, 5528.6123, 0],
[16246.659, 5099.5068, 0],
[16666.012, 5528.6123, 0],
[16900.551, 3348.5876, 0],
[15044.76, 2914.8364, 0],
[14360.957, 2838.2898, 0],
[13918.697, 3117.2534, 0],
[8779.0811, 1103.5681, 0],
[9111.9277, 3310.0366, 0],
[4042.9714, 7299.4736, 0],
[2719.7627, 8614.2588, 0],
[2633.0791, 6179.252, 0],
[3952.0581, 4314.96, 0],
[5830.7939, 11934.139, 0],
[5451.8291, 13640.398, 0],
[6154.6802, 14515.781, 0],
[6826.7451, 4628.4204, 0],
[7055.5396, 6323.8428, 0],
[4842.5459, 9834.8574, 0],
[4814.3403, 5030.7056, 0],
[5610.7563, 1669.729, 0],
[8120.2188, 4324.4492, 0],
[10474.403, 2456.1292, 0],
[10434.332, 4149.1382, 0],
[10850.07, 1649.6948, 0],
[12142.368, 6333.02, 0],
[10304.101, 7099.3838, 0],
[11105.211, 9990.9648, 0],
[12899.981, 10208.646, 0],
[14748.061, 10950.545, 0],
[13610.78, 11901.24, 0],
[11300.679, 12154.463, 0],
[8915.0566, 11217.098, 0],
[7315.7559, 13087.391, 0],
[8493.0176, 14615.61, 0],
[8799.5508, 12314.395, 0],
[8830.6475, 13891.482, 0],
[3953.457, 11134.15, 0]
////////////////////////////////////////////////////////////////
] call BIS_fnc_selectRandom;

//список тачек
_name_veh = [
"Pickup_PK_INS_DZE",
"Pickup_PK_TK_GUE_EP1_DZE",
"Lada1_TK_CIV_EP1",
"LandRover_CZ_EP1",
"UAZ_CDF",
"UAZ_RU",
"VWGolf",
"VolhaLimo_TK_CIV_EP1",
"Pickup_PK_GUE_DZE",
"HMMWV_M1035_DES_EP1",
"HMMWV_DZ",
"SUV_Green",	
"SUV_Blue",
"SUV_White",
"V3S_TK_EP1_DZE",
"UralOpen_CDF",
"Offroad_DSHKM_Gue_DZE",
"LadaLM",
"GNT_C185U",
"Tractor"
			] call BIS_fnc_selectRandom;
	
	
	//Сообщения
	_messages = [
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

"Потерялся бензовоз. Течный. На правом крыле – родинка от ДТП.",
"Утерян брифкейс с золотом, верните хотя бы золото.",
"Продам автомобиль Москвич-412 или обменяю на телефон Нокия. ",
"Продаю фирменую тележку Одуванчик, в нее помещается 50 чекушек, 2 батона или 1 Бомж. Макс скорость 5 шагов в секунду, нету багажника, не тормозят мусора)! Летняя резина и спойлер в придачу!",
"Жить становится просто, когда купил Т90!",
"Ничто так не обесценивает вашу машину, как новая машина соседа!",
"Вы молоды, здоровы, энергичны? ГИБДД г. Москвы приглашает вас получить перспективную специальность оператора машинного доения! ",
"Трактор - единственное всегда актуальное транспортное средство в России!",
"Автомобилю Газель требуется автомобиль Бычок для создания счастливого семейства. ",
"Белоснежный ЗАЗ-965 для ваших торжеств (свадьба 2-3 человека, небольшие похороны). ",
"Кто видел 27 сентября красную Тойота CLK госномер е210ре177. Нормально низкопрофильная резина смотрится? ",
"Кто нашел ключи от тёщиной машины, прошу не возвращать... ",
"Меняю ВАЗ 2109 (в угоне с марта 1996 г.) на автомобиль более позднего срока угона. ",
"Меняю задние крылья ВАЗ 2106 - на верхние АH-2.",
"Обменяю пачку листов А4 на ауди той же модели.",
"Срочно продаю БМВ. Недорого, 2010 г.в. Не битый, всё есть. Себе бы оставил… но жена сегодня на права сдала, с 7-го раза! ",
"Продается автомобиль БМВ, срочно, за 400 у.е. Цвет черный, литые диски, вроде бы кожаный салон, плохо видно, стекла сильно затемненные.",
"Продается ВАЗ-2101, цветомузыка, все навороты. Не ездит.",
"Продам автомобиль Nissan-Patrol после аварии. До аварии просьба не звонить!"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				  ] call BIS_fnc_selectRandom;

	//спавним бота
	_object_bot = createAgent ["Worker3", _location, [], 0, "NONE"];	
	
	//сообщение игроку
	_map_coord = mapGridPosition getPos _object_bot;
	titleText [_messages + "\n Запомни координату: " + _map_coord, "PLAIN DOWN", 5];
	systemChat ("Запомни координату: " + _map_coord);
	playSound "pda";
	
		if (floor(random(100)+1) <= 25) then {
		//Коробка
		_finish_box = createVehicle ["WoodCrate_DZ", _object_bot, [], 0, "NONE"];
		sleep 3;
		DZE_ActionInProgress = false;
				if (floor(random(100)+1) <= 30) then {
				//Стволы
				_gun_list = [["DMR",0.20],["SVD",0.5],["Mk_48_DZ",0.20],["FN_FAL",0.5],["M240_DZ",0.4],["M249_m145_EP1_DZE",0.5],["M4A3_CCO_EP1",0.7],["M249_EP1_DZ",0.6]];
				_metalBarCount = (count _gun_list);
				for "_i" from 0 to 10 do {
				_index = floor (random _metalBarCount);
				_chance = ((_gun_list select _index) select 1);
				if ((random 1) < _chance) then {
				_itemBar = ((_gun_list select _index) select 0);
				_finish_box addWeaponCargoGlobal [_itemBar, 1];
				};};
						} else {
						if (floor(random(100)+1) <= 50) then {
						//Медецина
						_med_list = [["ItemAntibiotic",0.8],["ItemBandage",1],["ItemBloodbag",0.8],["ItemEpinephrine",0.8],["ItemHeatPack",1],["ItemMorphine",0.8],["ItemPainkiller",1],["ItemTrashToiletpaper",0.5],["ItemTrashRazor",0.5]];
						_metalBarCount = (count _med_list);
						for "_i" from 0 to 50 do {
						_index = floor (random _metalBarCount);
						_chance = ((_med_list select _index) select 1);
						if ((random 1) < _chance) then {
						_itemBar = ((_med_list select _index) select 0);
						_finish_box addMagazineCargoGlobal [_itemBar, 1];
						};};
								} else {
								//Патроны
								_ammo_list = [["30Rnd_556x45_StanagSD",0.5],["20Rnd_762x51_DMR",0.8],["10Rnd_762x54_SVD",0.8],["30Rnd_556x45_Stanag",1],["20Rnd_762x51_FNFAL",1],["30Rnd_545x39_AK",1],["30Rnd_762x39_AK47",1],["30Rnd_762x39_SA58",1],["30Rnd_545x39_AKSD",0.30]];
								_metalBarCount = (count _ammo_list);
								for "_i" from 0 to 50 do {
								_index = floor (random _metalBarCount);
								_chance = ((_ammo_list select _index) select 1);
								if ((random 1) < _chance) then {
								_itemBar = ((_ammo_list select _index) select 0);
								_finish_box addMagazineCargoGlobal [_itemBar, 1];
								};};};
	};
	} else {	
	//Временная тачка
	_uniqueid = str(round(random 999999));
	_finish_veh = createVehicle [_name_veh, _object_bot,[], 0, "NONE"];
	_finish_veh setVariable ["ObjectID", _uniqueid, true];
	_finish_veh setVariable ["ObjectUID", _uniqueid, true];
	_finish_veh setHit ["wheel_1_1_steering",(random 0.6)];
	_finish_veh setHit ["wheel_1_2_steering",(random 0.6)];
	_finish_veh setHit ["wheel_2_1_steering",(random 0.6)];
	_finish_veh setHit ["wheel_2_2_steering",(random 0.6)];
	_finish_veh setHit ["palivo",(random 0.6)];
	_finish_veh setHit ["motor",(random 0.6)];
	_finish_veh setHit ["glass1",(random 0.6)];
	_finish_veh setHit ["glass2",(random 0.6)];
	_finish_veh setHit ["glass4",(random 0.6)];
	_finish_veh setHit ["karoserie",(random 0.6)];
	_finish_veh setFuel (random 0.3); 
	clearWeaponCargoGlobal _finish_veh;
	clearMagazineCargoGlobal _finish_veh;
	
	DZE_ActionInProgress = false;
	};
	
	sleep 1;
	deletevehicle _object_bot;
	} else {
	r_interrupt = false;
	DZE_ActionInProgress = false;
	if (vehicle player == player) then {
		[objNull, player, rSwitchMove,""] call RE;
		player playActionNow "stop";
		cutText ["Я еще не дочитал!", "PLAIN DOWN"];
	};
	};

