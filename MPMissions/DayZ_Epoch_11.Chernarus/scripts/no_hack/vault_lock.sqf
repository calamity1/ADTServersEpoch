/*
ADT-Team.ru
code: by GROM

*/

private ["_obj"];
 
disableuserinput true;disableuserinput true;disableuserinput true;
systemchat "<ADT-Team>: Вы не должны двигаться,когда закрываете сейф!";
titleText ["<ADT-Team>: Вы не должны двигаться,когда закрываете сейф!", "PLAIN DOWN", 2];
sleep 0.1;
_obj = _this select 3;
_obj spawn player_lockVault;
 
sleep 6.5;
disableuserinput false;disableuserinput false;disableuserinput false;
systemchat "<ADT-Team>: Вы сдвинулись с места!";
titleText ["<ADT-Team>: Вы сдвинулись с места!", "PLAIN DOWN", 2];
//_escMenu closedisplay 0;