//Sniper Gun Box

_box = _this select 0;
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;

// RIFLES
_box addWeaponCargoGlobal ["DMR", 2]; //DMR_DZ
_box addWeaponCargoGlobal ["M40A3", 1];
_box addWeaponCargoGlobal ["M24_des_EP1", 1];
_box addWeaponCargoGlobal ["SVD", 1];
_box addWeaponCargoGlobal ["SVD_des_EP1", 1];
_box addWeaponCargoGlobal ["Sa58V_RCO_EP1", 1];

// PISTOLS
_box addWeaponCargoGlobal ["M9SD", 2];

// AMMUNITION
_box addMagazineCargoGlobal ["15Rnd_9x19_M9SD", 5];
_box addMagazineCargoGlobal ["10Rnd_762x54_SVD", 5];
_box addMagazineCargoGlobal ["5Rnd_762x51_M24", 5];
_box addMagazineCargoGlobal ["20Rnd_762x51_DMR", 5];
_box addMagazineCargoGlobal ["10Rnd_762x54_SVD", 5];
_box addMagazineCargoGlobal ["30Rnd_762x39_SA58", 5];

//TOOLS
_box addWeaponCargoGlobal ["Binocular_Vector", 1];

// CLOTHING
_box addMagazineCargoGlobal ["Skin_Sniper1_DZ", 1];

// BACKPACKS
_box addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];