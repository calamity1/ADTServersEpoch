titleText ["Донатор 1lvl'а.: Очистка лута...", "PLAIN", 3];
titleFadeOut 3;
sleep 2;
// remove current donator loot
removeBackpack player;
_pmagz = currentWeapon player;
player removeMagazines _pmagz;
player removeMagazines "UZI_sd_ep1";
removeAllWeapons player;
removeAllItems player;

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
if (!("Itemcrowbar" in weapons player)) 		then { player addWeapon 'Itemcrowbar'; };
if (!("ItemHatchet" in weapons player)) 	    then { player addWeapon 'ItemHatchet'; };
if (!("itemradio" in weapons player)) 			then { player addWeapon 'itemradio'; };

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
player addMagazine 'ItemGoldBar10oz';

player addBackpack "dz_largegunbag_ep1";
clearMagazineCargo (unitBackpack player);
(unitBackpack player) addMagazineCargo ["ItemBandage",4];
(unitBackpack player) addMagazineCargo ["ItemPainkiller",4];
(unitBackpack player) addMagazineCargo ["ItemMorphine",2];
(unitBackpack player) addMagazineCargo ["ItemAntibiotic",2];
(unitBackpack player) addMagazineCargo ["FoodSteakCooked",4];
(unitBackpack player) addMagazineCargo ["ItemWaterbottle",4];
(unitBackpack player) addMagazineCargo ["ItemTunaCooked",1];
(unitBackpack player) addWeaponCargo   ["m107_DZ",1];
(unitBackpack player) addMagazineCargo ["10Rnd_127x99_m107",8];
(unitBackpack player) addWeaponCargo   ["UZI_sd_ep1",1];
(unitBackpack player) addMagazineCargo ["30rnd_9x19_uzi_sd",4];

titleText ["Донатор 1lvl'а.: Не забудь проверить лут, в том числе рюкзак...", "PLAIN", 3];
titleFadeOut 3;