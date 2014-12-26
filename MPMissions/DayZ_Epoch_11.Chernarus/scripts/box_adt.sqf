_vehicle_915 = objNull;
if (true) then
{
  _this = createVehicle ["RUVehicleBox", [5125.32,12214.70,0], [], 0, "CAN_COLLIDE"];
  _vehicle_915 = _this;
  //Clear Cargo	
  clearweaponcargoGlobal _this;
  clearmagazinecargoGlobal _this;
  //Add Cargo
  _this addWeaponCargoGlobal ["DMR",2];
  _this addWeaponCargoGlobal ["VSS_vintorez",2];
  _this addWeaponCargoGlobal ["m107",1];
  _this addWeaponCargoGlobal ["M110_NVG_EP1",1];
  _this addWeaponCargoGlobal ["KSVK_DZE",1];
  _this addWeaponCargoGlobal ["BAF_LRR_scoped",1];
  _this addWeaponCargoGlobal ["M4A1_AIM_SD_camo",1];
  _this addWeaponCargoGlobal ["AK_107_GL_kobra",1];
  _this addWeaponCargoGlobal ["Mk_48_DZ",1];
  _this addWeaponCargoGlobal ["AKS_74_UN_kobra",1];
  _this addWeaponCargoGlobal ["MAAWS",1];
  _this addWeaponCargoGlobal ["ItemSledge",1];
  _this addWeaponCargoGlobal ["ChainSaw",1];

  
  _this addmagazineCargoGlobal ["30Rnd_556x45_Stanag",20];
  _this addmagazineCargoGlobal ["20Rnd_762x51_DMR",10];
  _this addmagazineCargoGlobal ["10Rnd_762x54_SVD",10];
  _this addmagazineCargoGlobal ["20Rnd_9x39_SP5_VSS",10];
  _this addmagazineCargoGlobal ["20Rnd_762x51_B_SCAR",10];
  _this addmagazineCargoGlobal ["5Rnd_127x108_KSVK",10];
  _this addmagazineCargoGlobal ["10Rnd_127x99_m107",10];
  _this addmagazineCargoGlobal ["5Rnd_86x70_L115A1",10];
  _this addmagazineCargoGlobal ["30Rnd_556x45_StanagSD",10];
  _this addmagazineCargoGlobal ["30Rnd_545x39_AKSD",10];
  _this addmagazineCargoGlobal ["100Rnd_762x54_PK",10];
  _this addmagazineCargoGlobal ["100Rnd_556x45_M249",10];
  _this addmagazineCargoGlobal ["100Rnd_762x51_M240",10]; 
  _this addmagazineCargoGlobal ["15Rnd_9x19_M9SD",10];
  _this addmagazineCargoGlobal ["1Rnd_HE_M203",5];
  _this addmagazineCargoGlobal ["1Rnd_HE_GP25",5];
  _this addmagazineCargoGlobal ["MAAWS_HEAT",5];
  _this addmagazineCargoGlobal ["2000Rnd_762x51_M134",1];
  _this addmagazineCargoGlobal ["100Rnd_127x99_M2",1];
  _this addmagazineCargoGlobal ["PipeBomb",1];
  //_this addmagazineCargoGlobal ["m240_nest_kit",1];
  
  _this addmagazineCargoGlobal ["ItemPainkiller",10];
  _this addmagazineCargoGlobal ["ItemMorphine",10];
  _this addmagazineCargoGlobal ["ItemBloodBag",5];
  _this addmagazineCargoGlobal ["ItemHeatPack",5];
  _this addmagazineCargoGlobal ["Skin_Rocket_DZ",5]; 
  _this addmagazineCargoGlobal ["Skin_Sniper1_DZ",5];
  _this addmagazineCargoGlobal ["Skin_Pilot_EP1_DZ",5];
  _this addmagazineCargoGlobal ["ItemBriefcase100oz",2];
  _this addmagazineCargoGlobal ["ItemHotwireKit",1];
  
  _this addbackpackCargoGlobal ["DZ_LargeGunBag_EP1",2];
  _this setPos [5125.32,12214.70,0];
};