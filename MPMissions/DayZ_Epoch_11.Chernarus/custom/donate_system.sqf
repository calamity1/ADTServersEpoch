// ---------------------------------------Donate 1lvl START------------------------------------
if((getPlayerUID player) in ["0","0","0","0","0"]) then {
    s_player_donator1lvl = -1;
	sleep 5;
    systemChat ("<ADT-TEAM>: Донат меню #1 Будет загружено через 30 секунд.");
    sleep 30;
    if (s_player_donator1lvl < 0) then {
        s_player_donator1lvl = player addaction [("<t color=""#0074E8"">" + ("Донат меню #1") +"</t>"),"custom\Donate_System\1lvl_sp.sqf","",0,false,true,"",""];
		systemChat ("<ADT-TEAM>: ДонатМеню #1: Доступ разрешён...у вас есть 3 минуты до закрытия донат меню");
		sleep 180;
        player removeAction s_player_donator1lvl;
		s_player_donator1lvl = 1;
        systemChat ("<ADT-TEAM>: Донат меню закрыто!");
    }; 
	} else {
		systemChat ("<ADT-TEAM>: Вам не доступно меню #1 (Магазин сервера: 300р.)");
	};	
// ---------------------------------------Donate 1lvl END------------------------------------
// ---------------------------------------Donate 2lvl START------------------------------------
if((getPlayerUID player) in ["0","0","0"]) then {
    s_player_donator2lvl = -1;
	sleep 5;
    systemChat ("<ADT-TEAM>: Донат меню #2 Будет загружено через 30 секунд.");
    sleep 30;	
    if (s_player_donator2lvl < 0) then {
        s_player_donator2lvl = player addaction [("<t color=""#0074E8"">" + ("Донат меню #2") +"</t>"),"custom\Donate_System\2lvl_sp.sqf","",0,false,true,"",""];
		systemChat ("<ADT-TEAM>: ДонатМеню #2: Доступ разрешён...у вас есть 3 минуты до закрытия донат меню");
		sleep 180;
        player removeAction s_player_donator2lvl;
		s_player_donator2lvl = 1;
        systemChat ("<ADT-TEAM>: Донат меню закрыто!");
	}; 
	} else {
		systemChat ("<ADT-TEAM>: Вам не доступно меню #2 (Магазин сервера: 250р.)");
	};	
// ---------------------------------------Donate 2lvl END------------------------------------
// ---------------------------------------Donate 3lvl START------------------------------------
if((getPlayerUID player) in ["0","0","0"]) then {
    s_player_donator3lvl = -1;
	sleep 5;
    systemChat ("<ADT-TEAM>: Донат меню #3 Будет загружено через 30 секунд.");
    sleep 30;
    if (s_player_donator3lvl < 0) then {
        s_player_donator3lvl = player addaction [("<t color=""#0074E8"">" + ("Донат меню #3") +"</t>"),"custom\Donate_System\3lvl_sp.sqf","",0,false,true,"",""];
		systemChat ("<ADT-TEAM>: ДонатМеню #3: Доступ разрешён...у вас есть 3 минуты до закрытия донат меню");
		sleep 180;
        player removeAction s_player_donator3lvl;
		s_player_donator3lvl = 1;
        systemChat ("<ADT-TEAM>: Донат меню закрыто!");
    }; 
	} else {
		systemChat ("<ADT-TEAM>: Вам не доступно меню #3 (Магазин сервера: 100р.)");
	};	
// ---------------------------------------Donate 3lvl END------------------------------------