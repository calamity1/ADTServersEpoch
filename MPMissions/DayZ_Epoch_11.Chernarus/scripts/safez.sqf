/*
   *by GROM : https://vk.com/adt_68 || http://gromx.ru/ || http://adt-team.ru/
   *updated on 04.07.2014
   *Developer: GROM
*/
USE_CANBUILD = true;            // if you don't want to define your own positions
USE_TraderCity = true;  //      if you don't want to define your own positions (Epoch 1.0.5.1)
USE_POSITIONS = true;  // to use own positions and radius Default: "false" 
USE_AI_REMOVER = false; // Удалить всех AI ботов в радиусе 100м "Стандартно" - "false"
USE_AntiSteal = true;   // Блокируем открытие рюкзака если другой игрок в радиусе 3м
USE_SIGNS = false;              // use this to build signs around the SafeZone
LOG_EnterLeave = true;  // Пишем logs в RPT вход и выход игрока из safez, работает только с "AH" InfiStar by GROM 
/* Используем "USE_CANBUILD" or/and (works together) the custom positions below (USE_POSITIONS) [кординаты zone,radius] */
_infiSZ =
[
        [[6325.6772,7807.7412],300,true], //StarySobor_safez
        [[4080.0535,11671.371],200,true],  //Bash_safez_fix_
		[[11472.873,11343.632],200,true], //Klen_
		[[1621.2588,7797.7075],100,true], //Bandit_safez
		[[12060.781,12641.241],150,true], //Air_Krasnostav_safez//fix_
		[[12914.686,12748.712],100,true]  //Hero_safez//fix_
];
if (isServer) exitWith
{
        if (USE_SIGNS) then
        {
                {
                        _center = _x select 0;
                        _radius = _x select 1;
                        _lSign = _x select 2;
                        if (_lSign) then
                        {
                                for '_i' from 0 to 360 step (270 / _radius)*2 do
                                {
                                        _location = [(_center select 0) + ((cos _i) * _radius), (_center select 1) + ((sin _i) * _radius),0];
                                        _dir = ((_center select 0) - (_location select 0)) atan2 ((_center select 1) - (_location select 1));
                                        _object = createVehicle ['SignM_FARP_Winchester_EP1', _location, [], 0, 'CAN_COLLIDE'];
                                        _object setDir _dir;
                                        //      _object setVehicleInit 'this setObjectTexture [0, ''Addons\SafeZones\sign.paa''];';
                                };
                        };
                } forEach _infiSZ;
        };
};
waitUntil { !isNil 'dayz_animalCheck' };
if (isNil 'inSafezone') then {inSafezone = false;};
[_infiSZ] spawn {
        _infiSZ = _this select 0;
        _startSafeZone =
        {
                if (isNil 'outNow') then
                {
                        _msg = '[ADT-TEAM] Вы в безопасной зоне - GodMod включен!'; //fix
                        hint _msg;
                        taskHint [_msg, [0,1,0,1], 'taskDone'];
                        inNow = nil;
                        outNow = true;
                       
                        if (LOG_EnterLeave) then
                        {
                                _obj = vehicle player;
                                _pos = getPosATL _obj;
                                PVDZE_send = [player,'SafeZoneState',[1]];
                                publicVariableServer 'PVDZE_send';
                        };
                };
                player_fired2 = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_fired.sqf';
                player_fired = {_this call player_fired2;deleteVehicle (nearestObject [_this select 0,_this select 4]);};
                player_zombieCheck = {};
                fnc_usec_damageHandler = {};
                fnc_usec_unconscious = {};
                object_monitorGear = {};
                player removeAllEventHandlers 'handleDamage';
                player addEventHandler ['handleDamage', {false}];
                player allowDamage false;
                _x = vehicle player;
                if ((_x isKindOf 'LandVehicle') || (_x isKindOf 'Air') || (_x isKindOf 'Ship')) then
                {
                        _szs = _x getVariable ['inSafeZone',0];
                        if (_szs == 0) then
                        {
                                _x removeAllEventHandlers 'Fired';
                                _x addEventHandler ['Fired', {_this call player_fired;}];
                                _x setVariable ['inSafeZone', 1, true];
                                _x removeAllEventHandlers 'HandleDamage';
                                _x addEventHandler ['HandleDamage', {false}];
                                _x allowDamage false;
                        };
                };
               
                _cwep = currentWeapon player;
                if (_cwep in ['MAAWS']) then
                {
                        _swep = '';
                        {
                                if ((getNumber (configFile >> 'CfgWeapons' >> _x >> 'Type')) == 2) exitWith
                                {
                                        _swep = _x;
                                };
                        } forEach (weapons player);
                        if (_swep == '') then
                        {
                                player playActionNow 'PutDown';
                                _iPos = getPosATL player;
                                _radius = 1;
                                _removed = ([player,_cwep,1] call BIS_fnc_invRemove);
                                if (_removed == 1) then
                                {
                                        _item = createVehicle ['WeaponHolder', _iPos, [], _radius, 'CAN_COLLIDE'];
                                        _item addWeaponCargoGlobal [_cwep,1];
                                };
                        }
                        else
                        {
                                player selectweapon _swep;
                        };
                };
        };
        _endSafeZone =
        {
                if (isNil 'inNow') then
                {
                        if (str fnc_usec_damageHandler == '{}') then
                        {
                                _msg = '[ADT-TEAM] Вы покинули безопасную зону - GodMod выключен!'; //off_safez
                                hint _msg;
                                taskHint [_msg, [1,0,0.1,1], 'taskFailed'];
                        };
                        inNow = true;
                        outNow = nil;
                       
                        if (LOG_EnterLeave) then
                        {
                                _obj = vehicle player;
                                _pos = getPosATL _obj;
                                PVDZE_send = [player,'SafeZoneState',[0]];
                                publicVariableServer 'PVDZE_send';
                        };
                };
                player_fired = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_fired.sqf';
                player_zombieCheck = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieCheck.sqf';
                fnc_usec_unconscious = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_unconscious.sqf';
                object_monitorGear = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\object_monitorGear.sqf';
               
                _x = vehicle player;
                if ((_x isKindOf 'LandVehicle') || (_x isKindOf 'Air') || (_x isKindOf 'Ship')) then
                {
                        _szs = _x getVariable ['inSafeZone',0];
                        if (_szs == 1) then
                        {
                                _x setVariable ['inSafeZone', 0, true];
                                _x removeAllEventHandlers 'HandleDamage';
                                _x addeventhandler ['HandleDamage',{ _this call vehicle_handleDamage } ];
                                _x allowDamage true;
                        };
                };
               
                if (gmdadmin == 1) exitWith {};
                player allowDamage true;
                fnc_usec_damageHandler = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
                player removeAllEventHandlers 'HandleDamage';
                player addeventhandler ['HandleDamage',{_this call fnc_usec_damageHandler;} ];
        };
        while {1 == 1} do
        {
                _state = false;
                _obj = vehicle player;
               
                if (isNil 'inSafeZone') then { inSafeZone = false; } else { if (typename inSafeZone != 'BOOL') then { inSafeZone = false; }; };
                if (isNil 'canbuild') then { canbuild = true; } else { if (typename canbuild != 'BOOL') then { canbuild = true; }; };
                if (isNil 'USE_POSITIONS') then { USE_POSITIONS = false; } else { if (typename USE_POSITIONS != 'BOOL') then { USE_POSITIONS = false; }; };
                if (isNil 'USE_CANBUILD') then { USE_CANBUILD = true; } else { if (typename USE_CANBUILD != 'BOOL') then { USE_CANBUILD = true; }; };
                if (isNil 'USE_TraderCity') then { USE_TraderCity = true; } else { if (typename USE_TraderCity != 'BOOL') then { USE_TraderCity = true; }; };
                if (USE_POSITIONS) then
                {
                        {
                                _z = _x select 0;
                                _r = _x select 1;
                                if (_obj distance _z < _r) exitWith {_state = true;};
                        } forEach _infiSZ;
                };
                if (USE_CANBUILD) then
                {
                        if (!canbuild) then {_state = true;};
                };
                if (USE_TraderCity) then
                {
                        if (isInTraderCity) then {_state = true;};
                };
                if (_state) then
                {
                        inSafeZone = true;
                        call _startSafeZone;
                        {
                                if (!isNull _x) then
                                {
                                        if !(isPlayer _x) then
                                        {
                                                deletevehicle _x;
                                        };
                                };
                        } forEach (_obj nearEntities ['zZombie_Base',15]);
                       
                        if (isNil 'USE_AI_REMOVER') then { USE_AI_REMOVER = false; } else { if (typename USE_AI_REMOVER != 'BOOL') then { USE_AI_REMOVER = false; }; };
                        if (USE_AI_REMOVER) then
                        {
                                {
                                        if ((!isNull group _x) && (getPlayerUID _x == '')) then
                                        {
                                                deleteVehicle _x;
                                        };
                                } forEach (player nearEntities ['Man',100]);
                        };
                }
                else
                {
                        inSafeZone = false;
                };
                uiSleep 2;
                if (!inSafeZone) then
                {
                        call _endSafeZone;
                };
        };
};
if (USE_AntiSteal) then
{
        [] spawn {
                while {1 == 1} do
                {
                        if (inSafezone) then
                        {
                                _cnt = {isPlayer _x && _x != player} count (player nearEntities [['CAManBase'], 3]);
                                if ((_cnt > 0) && (!isNull (findDisplay 106))) then
                                {
                                        (findDisplay 106) closedisplay 0;
                                        closeDialog 0;
                                        _log = format['%1 [ADT-TEAM] Вы не можете лутать рюкзак выжившего в этой зоне!',name player]; //no_open_gear
                                        cutText [_log,'PLAIN'];
                                        hint _log;
                                };
                        }
                        else
                        {
                                uiSleep 2;
                        };
                        uiSleep 0.1;
                };
        };
};
//SafeZ by GROM 05.07.2014