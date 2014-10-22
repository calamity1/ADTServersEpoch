/*	
	DayZ Epoch 1.0.5.1
	Configured by Joze
	VK: vk.com/dayz_tlg
	Website: adt-team.ru
	Map: Napf
*/
private["_hasKnife","_qty","_item","_text","_string","_type","_loop","_meat","_timer"];
_item = _this select 3;
_hasKnife =    "ItemKnife" in items player;
_type = typeOf _item;
_hasHarvested = _item getVariable["meatHarvested",false];

player removeAction s_player_butcher;
s_player_butcher = -1;

if (_hasKnife and !_hasHarvested) then {

    _loop = true;
    _rnd = random(100);

    player playActionNow "Medic";
    [player,"gut",0,false] call dayz_zombieSpeak;
    _item setVariable["meatHarvested",true,true];

    if (_rnd > 90) then {
        r_player_inpain = true;
        player setVariable["USEC_inPain",true,true];
        r_player_blood = r_player_blood - 1000;
        cutText ["Вы чувствуете лезвие ножа...", "PLAIN DOWN"];
    };

    _qty = (random 3);

    _id = [player,50,true,(getPosATL player)] spawn player_alertZombies;

    dayzHumanity = [player,-500];
    _id = dayzHumanity spawn player_humanityChange;

    _array = [_item,_qty];
    _meat = "FoodSteakRaw";

        for "_x" from 1 to _qty do {
                _item addMagazine "FoodSteakRaw";
                _result = [player,_meat] call BIS_fnc_invAdd;
                if (_result) then {

                } else {
                    cutText ["У вас недостаточно места для хранение человеческого мяса", "PLAIN DOWN"];
                    _x = _qty;
                }

        };

    sleep 8;
    cutText ["Вы распотрошили человека,ваши руки по локоть в крови, ваше хуманити убавилось.", "PLAIN DOWN"];
};