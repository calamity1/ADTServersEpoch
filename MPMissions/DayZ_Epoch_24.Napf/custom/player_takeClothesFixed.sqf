// By Zabn 2013 @ BalotaBuddies.net
private["_itemNew","_onLadder","_skin","_body","_okSkin","_clothesTaken","_itemNewName","_result"];
_body = _this select 3;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText ["Вы не можете исполнить это действие на лестнице!" , "PLAIN DOWN"]};

if (vehicle player != player) exitWith {cutText ["Вы не можете исполнить это действие находясь в технике!", "PLAIN DOWN"]};

player removeAction s_player_clothes;
s_player_clothes = -1;

_skin = (typeOf _body);

_itemNew = _skin;

switch (_itemNew) do {
	case "Survivor3_DZ": {
		_itemNew = "Survivor2_DZ";
	};
	case "Bandit1_DZ": {
		_itemNew = "Survivor2_DZ";
	};
};

_itemNew = "Skin_" + _itemNew;
_okSkin = isClass (configFile >> "CfgMagazines" >> _itemNew);

if(_okSkin) then {
	player playActionNow "Medic";
	sleep 3;
	_clothesTaken = _body getVariable["clothesTaken",false];
	if(!_clothesTaken) then {
		_itemNewName = getText (configFile >> "CfgMagazines" >> _itemNew >> "displayName");
		_result = [player,_itemNew] call BIS_fnc_invAdd;
        	if (_result) then {
			_body setVariable["clothesTaken",true,true];
			//Gloff's FIX 
			[time, _body] spawn { 
			private ["_timer", "_body"]; 
			_timer = _this select 0;
			_bodyskn = _this select 1;
			_pos = getPosATL _bodyskn;
			}; 

			hideBody _bodyskn;
		
			_inRange = _pos nearEntities ["CAManBase",100];
			{
				if(isPlayer _x && _x != player) then {
				PVDZE_send = [_x,"HideBody",[_body]];
				publicVariableServer "PVDZE_send";
			};
				} count _inRange;

				sleep 5;
				deleteVehicle _bodyskn;
				true;
			};
			//Gloff's fix end
			cutText [format["%1 Был добавлен. Надеюсь налезет!",_itemNewName], "PLAIN DOWN"];
		} else {
			cutText [format["Некуда положить %1",_itemNewName], "PLAIN DOWN"];
        	};
	} else {
		cutText ["Этого уже кто-то раздел!", "PLAIN DOWN"];
	};
} else {
	cutText [format["%1 не могу снять(((",_skin], "PLAIN DOWN"];
};