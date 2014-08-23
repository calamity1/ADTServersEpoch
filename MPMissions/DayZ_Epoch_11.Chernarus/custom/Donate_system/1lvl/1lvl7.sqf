titleText ["Донатор 1lvl'а.: Очистка лута...", "PLAIN", 3];
titleFadeOut 3;
sleep 2;
// remove current donator loot
removeBackpack player;
_pmagz = currentWeapon player;
player removeMagazines _pmagz;
player removeMagazines "M9SD";
removeAllWeapons player;
removeAllItems player;

if (!("ItemFlashlightRed" in weapons player))  	then { player addWeapon 'ItemFlashlightRed'; };
if (!("Binocular_Vector" in weapons player))	then { player addWeapon 'Binocular_Vector';};
if (!("NVGoggles" in weapons player)) 			then { player addWeapon 'NVGoggles'; };
if (!("ItemMap" in weapons player)) 			then { player addWeapon 'ItemMap'; };
if (!("ItemCompass" in weapons player)) 		then { player addWeapon 'ItemCompass'; };
if (!("ItemWatch" in weapons player)) 			then { player addWeapon 'ItemWatch'; };
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
player addMagazine 'ItemBloodbag';
player addMagazine 'Skin_CZ_Special_Forces_GL_DES_EP1_DZ';
player addMagazine 'Skin_Sniper1_DZ';
player addMagazine 'ItemGoldBar10oz';
player addMagazine 'ItemSilverBar10oz';

player addBackpack "dz_largegunbag_ep1";
clearMagazineCargo (unitBackpack player);
(unitBackpack player) addMagazineCargo ["ItemPainkiller",1];
(unitBackpack player) addMagazineCargo ["ItemMorphine",1];
(unitBackpack player) addMagazineCargo ["ItemAntibiotic",1];
(unitBackpack player) addMagazineCargo ["FoodbaconCooked",1];
(unitBackpack player) addMagazineCargo ["ItemSodaRbull",3];
(unitBackpack player) addMagazineCargo ["ItemTunaCooked",2];
(unitBackpack player) addWeaponCargo   ["G36A_camo",1];
(unitBackpack player) addMagazineCargo ["30Rnd_556x45_G36",3];
(unitBackpack player) addWeaponCargo   ["M9SD",1];
(unitBackpack player) addMagazineCargo ["15Rnd_9x19_M9SD",2];

titleText ["Донатор 1lvl'а.: Не забудь проверить лут, в том числе рюкзак...", "PLAIN", 3];
titleFadeOut 3;