titleText ["Донатор 2lvl'а.: Очистка лута...", "PLAIN", 3];
titleFadeOut 3;
sleep 2;
// remove current donator loot
removeBackpack player;
_pmagz = currentWeapon player;
player removeMagazines _pmagz;
player removeMagazines "M9SD";
removeAllWeapons player;
removeAllItems player;

if (!("ItemFlashlight" in weapons player)) 		then { player addWeapon 'ItemFlashlight'; };
if (!("Binocular" in weapons player))	        then { player addWeapon 'Binocular';};
if (!("NVGoggles" in weapons player)) 			then { player addWeapon 'NVGoggles'; };
if (!("ItemMap" in weapons player)) 			then { player addWeapon 'ItemMap'; };
if (!("ItemCompass" in weapons player)) 		then { player addWeapon 'ItemCompass'; };
if (!("ItemGPS" in weapons player)) 			then { player addWeapon 'ItemGPS'; };
if (!("ItemHatchet" in weapons player)) 		then { player addWeapon 'ItemHatchet'; };
if (!("ItemKnife" in weapons player)) 			then { player addWeapon 'ItemKnife'; };
if (!("ItemToolbox" in weapons player)) 		then { player addWeapon 'ItemToolbox'; };
if (!("ItemMatchbox" in weapons player)) 		then { player addWeapon 'ItemMatchbox'; };
if (!("ItemEtool" in weapons player)) 			then { player addWeapon 'ItemEtool'; };

while {"ItemBandage" in magazines player} do {
	player removeMagazines 'ItemBandage';
};

if ("MakarovSD" in weapons player) then {
	player removeWeapon 'MakarovSD';
};
while {"8Rnd_9x18_MakarovSD" in magazines player} do {
	player removeMagazines '8Rnd_9x18_MakarovSD';
};

player addMagazine 'ItemBloodbag';
player addMagazine 'ItemBloodbag';
player addMagazine 'Skin_Soldier_Sniper_PMC_DZ';
player addMagazine 'Skin_TK_Soldier_Sniper_EP1_DZ';
player addMagazine 'ItemGoldBar10oz';

player addBackpack "DZ_CivilBackpack_EP1";
clearMagazineCargo (unitBackpack player);
(unitBackpack player) addMagazineCargo ["ItemPainkiller",1];
(unitBackpack player) addMagazineCargo ["ItemMorphine",1];
(unitBackpack player) addMagazineCargo ["ItemAntibiotic",1];
(unitBackpack player) addMagazineCargo ["FoodbaconCooked",1];
(unitBackpack player) addMagazineCargo ["ItemSodaLvg",3];
(unitBackpack player) addMagazineCargo ["ItemSeaBassCooked",2];
(unitBackpack player) addWeaponCargo   ["AK_74_GL",1];
(unitBackpack player) addMagazineCargo ["30Rnd_545x39_AK",3];
(unitBackpack player) addMagazineCargo ["1Rnd_HE_GP25",2];
(unitBackpack player) addWeaponCargo   ["M9SD",1];
(unitBackpack player) addMagazineCargo ["15Rnd_9x19_M9SD",2];

titleText ["Донатор 2lvl'а.: Не забудь проверить лут, в том числе рюкзак...", "PLAIN", 3];
titleFadeOut 3;