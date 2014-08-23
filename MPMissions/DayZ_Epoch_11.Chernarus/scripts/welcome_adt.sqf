//ADT-TEAM http://adt-team.ru/
 
// ========== SCRIPT CONFIG ============
_onScreenTime = 6; //how long one role should stay on screen. Use value from 0 to 10 where 0 is almost instant transition to next role

 
 
// SCRIPT START
 
waitUntil {!isNil "dayz_animalCheck"};
sleep 10; //Wait in seconds before the credits start after player IS ingame
 
_role1 = "Добро пожаловать на сервер";
_role1names = ["ADT-TEAM Epoch Chernarus 1.0.5.1/12555 NOCD"];
_role2 = "Администраторы";
_role2names = ["GROM", "Valerjanich"];
_role3 = "Версия";
_role3names = ["DayZ Epoch Chernarus"];
_role4 = "Группа ВКонтакте";
_role4names = ["VK.COM/ADT_68"];
_role5 = "Наш сайт";
_role5names = ["ADT-TEAM.RU"];
_role6 = "Основные нововведения";
_role6names = ["Переделанные трейд зоны", "Сейфзоны 300 м"];
_role7 = "Основные нововведения";
_role7names = ["Автопочинка техники на заправках за золото"];
_role8 = "Основные нововведения";
_role8names = ["Перезарядка вооружения техники на заправках за золото"];
_role9 = "Основные нововведения";
_role9names = ["Переведены торговцы", "Добавлены новые товары"];
 
{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.40' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names],
[_role7, _role7names],
[_role8, _role8names],
[_role9, _role9names] //make SURE the last one here does NOT have a , at the end
];