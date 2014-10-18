titleText ["Донатор 3lvl'а.: Очистка лута...", "PLAIN", 3];
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
if (!("ItemMap" in weapons player)) 			then { player addWeapon 'ItemMap'; };
if (!("ItemCompass" in weapons player)) 		then { player addWeapon 'ItemCompass'; };
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
player addMagazine 'Skin_TK_Commander_EP1_DZ';
player addMagazine 'Skin_Graves_Light_DZ';
player addMagazine 'ItemSilverBar10oz';

player addBackpack "DZ_GunBag_EP1";
clearMagazineCargo (unitBackpack player);
(unitBackpack player) addMagazineCargo ["ItemPainkiller",1];
(unitBackpack player) addMagazineCargo ["ItemMorphine",1];
(unitBackpack player) addMagazineCargo ["ItemAntibiotic",1];
(unitBackpack player) addMagazineCargo ["FoodbaconCooked",1];
(unitBackpack player) addMagazineCargo ["ItemSodaRabbit",3];
(unitBackpack player) addMagazineCargo ["ItemTroutCooked",2];
(unitBackpack player) addWeaponCargo   ["Winchester1866",1];
(unitBackpack player) addMagazineCargo ["15Rnd_W1866_Slug",3];
(unitBackpack player) addWeaponCargo   ["M9SD",1];
(unitBackpack player) addMagazineCargo ["15Rnd_9x19_M9SD",2];

titleText ["Донатор 3lvl'а.: Не забудь проверить лут, в том числе рюкзак...", "PLAIN", 3];
titleFadeOut 3;