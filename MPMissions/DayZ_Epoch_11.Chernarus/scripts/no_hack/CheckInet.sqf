/*** ADT-Team CheckInet user ***/
 
private ["_escMenu","_lastTimesScanned","_currTimesScanned"];
 
disableSerialization;
sleep 1;
call dayz_forcesave;
_escMenu = findDisplay 49;
_lastTimesScanned = player getVariable ["ClearToLeave",0];
 
AD_AntiDupePlayer = player;
publicVariable "AD_AntiDupePlayer";
 
sleep 5;
 
_currTimesScanned = player getVariable ["ClearToLeave",0];

 
if (_currTimesScanned - _lastTimesScanned < 1) then
{
   titleText ["<ADT-Team>: Соединение с сервером не обнаружено!", "PLAIN DOWN", 3];
   systemchat "<ADT-Team>: Соединение с сервером не обнаружено!";
   _escMenu closedisplay 0;
};
 