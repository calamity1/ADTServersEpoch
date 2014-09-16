//by GROM

private["_ent","_started","_myArray","_myDance","_animState","_started","_finished","_isDancing"];
_ent = _this select 3;
player removeAction s_player_dance;
s_player_dance = -1;

_myArray = ["ActsPercMstpSnonWnonDnon_DancingDuoIvan","ActsPercMstpSnonWnonDnon_DancingStefan","ActsPercMstpSnonWnonDnon_DancingDuoStefan"];
_myDance = _myArray call BIS_fnc_selectRandom;
 
player playMove _myDance;
 
cutText ["Отжигаем!!!","PLAIN DOWN"];
 
r_interrupt = false;
_animState = animationState player;
r_doLoop = true;
_started = false;
_finished = false;
 
    while {r_doLoop} do {
        _animState = animationState player;
        _isDancing = [_myDance,_animState] call fnc_inString;
        if (_isDancing) then {
            _started = true;
        };
        if (_started and !_isDancing) then {
            r_doLoop = false;
            _finished = true;
        };
        if (r_interrupt) then {
            r_doLoop = false;
        };
        sleep 0.1;
    };
    r_doLoop = false;
 
if (_finished) then {
 
cutText ["Отлично зажёг, чувак!!!!","PLAIN DOWN"];
 
} else {
r_interrupt = false;
[objNull, player, rSwitchMove,""] call RE;
player playActionNow "stop";
cutText ["я стесняюсь... ;)","PLAIN DOWN"];
};