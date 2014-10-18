class CfgNonAIVehicles {
	
	class StreetLamp {
		animated = false;
		brightness = 0;
		colorambient[] = {0, 0, 0};
		colordiffuse[] = {0, 0, 0};
		destrtype = "DestructTree";
		model = "";
		simulation = "StreetLamp";
		
		class HitPoints {
			class HitBulb {
				armor = 1;
				material = 60;
				name = "lampa";
				passThrough = true;
			};
		};
		
		class Reflectors {
			class LampLight {
				color[] = {0, 0, 0, 0};
				ambient[] = {0, 0, 0, 0};
				position = "Light";
				direction = "";
				hitpoint = "lampa";
				selection = "";
				size = 0;
				brightness = 0;
			};
		};
		armorLights = 0;
	};
	
	class StreetLamp_BaseWeakYellow : StreetLamp {
		brightness = 0;
		scope = public;
	};
	
	class StreetLamp_BaseMediumOrange : StreetLamp {
		brightness = 0;
		scope = public;
	};
	
	class StreetLamp_BaseMediumPale : StreetLamp {
		brightness = 0;
		scope = public;
	};
	
	class StreetLamp_BaseStrongPale : StreetLamp {
		brightness = 0;
		scope = public;
	};
	
	class Land_Lamp_Small_EP1 : StreetLamp {
		brightness = 0;
		scope = public;
		
		class HitPoints {
			class HitBulb {
				armor = 1;
				material = 60;
				name = "lampa";
				passthrough = true;
			};
		};
		
		class Reflectors {
			class LampLight {
				ambient[] = {0, 0, 0, 0};
				brightness = 0;
				color[] = {0, 0, 0, 0};
				direction = "";
				hitpoint = "lampa";
				position = "Light";
				selection = "";
				size = 0;
			};
		};
	};
	
	class Land_Lamp_Street1_EP1 : StreetLamp {
		brightness = 0;
		scope = public;
		
		class HitPoints {
			class HitBulb {
				armor = 1;
				material = 60;
				name = "lampa";
				passthrough = true;
			};
		};
		
		class Reflectors {
			class LampLight {
				ambient[] = {0, 0, 0, 0};
				brightness = 0;
				color[] = {0, 0, 0, 0};
				direction = "";
				hitpoint = "lampa";
				position = "Light";
				selection = "";
				size = 0;
			};
		};
	};
	
	class Land_Lamp_Street2_EP1 : StreetLamp {
		brightness = 0;
		scope = public;
		
		class HitPoints {
			class HitBulb {
				armor = 1;
				material = 60;
				name = "lampa";
				passthrough = true;
			};
		};
		
		class Reflectors {
			class LampLight {
				ambient[] = {0, 0, 0, 0};
				brightness = 0;
				color[] = {0, 0, 0, 0};
				direction = "";
				hitpoint = "lampa";
				position = "Light";
				selection = "";
				size = 0;
			};
		};
	};
	
	class Land_Lampa_Ind_EP1 : StreetLamp {
		brightness = 0;
		scope = public;
		
		class HitPoints {
			class HitBulb {
				armor = 1;
				material = 60;
				name = "lampa";
				passthrough = true;
			};
		};
		
		class Reflectors {
			class LampLight {
				ambient[] = {0, 0, 0, 0};
				brightness = 0;
				color[] = {0, 0, 0, 0};
				direction = "";
				hitpoint = "lampa";
				position = "Light";
				selection = "";
				size = 0;
			};
		};
	};
	
	class Land_PowLines_Conc2L_EP1 : StreetLamp {
		brightness = 0;
		scope = public;
		
		class HitPoints {
			class HitBulb {
				armor = 1;
				material = 60;
				name = "lampa";
				passthrough = true;
			};
		};
		
		class Reflectors {
			class LampLight {
				ambient[] = {0, 0, 0, 0};
				brightness = 0;
				color[] = {0, 0, 0, 0};
				direction = "";
				hitpoint = "lampa";
				position = "Light";
				selection = "";
				size = 0;
			};
		};
	};
	
	class Land_lampa_sidl : StreetLamp {
		scope = public;
		model = "\ca\buildings\Misc\lampa_sidl";
		
		class HitPoints {
			class HitBulb {
				armor = 1;
				material = 60;
				name = "lampa";
				passthrough = true;
			};
		};
		
		class Reflectors {
			class LampLight {
				ambient[] = {0, 0, 0, 0};
				brightness = 0;
				color[] = {0, 0, 0, 0};
				direction = "";
				hitpoint = "lampa";
				position = "Light";
				selection = "";
				size = 0;
			};
		};
	};
	
	class Land_lampa_sidl_2 : StreetLamp {
		scope = public;
		model = "\ca\buildings\Misc\lampa_sidl_2";
		
		class HitPoints {
			class HitBulb {
				armor = 1;
				material = 60;
				name = "lampa";
				passthrough = true;
			};
		};
		
		class Reflectors {
			class LampLight {
				ambient[] = {0, 0, 0, 0};
				brightness = 0;
				color[] = {0, 0, 0, 0};
				direction = "";
				hitpoint = "lampa";
				position = "Light";
				selection = "";
				size = 0;
			};
		};
	};
	
	class Land_lampa_sidl_3 : StreetLamp {
		scope = public;
		model = "\ca\buildings\Misc\lampa_sidl_3";
		
		class HitPoints {
			class HitBulb {
				armor = 1;
				material = 60;
				name = "lampa";
				passthrough = true;
			};
		};
		
		class Reflectors {
			class LampLight {
				ambient[] = {0, 0, 0, 0};
				brightness = 0;
				color[] = {0, 0, 0, 0};
				direction = "";
				hitpoint = "lampa";
				position = "Light";
				selection = "";
				size = 0;
			};
		};
	};
	
	class Land_lampa_ind : StreetLamp {
		scope = public;
		model = "\ca\buildings\Misc\lampa_ind";
		
		class HitPoints {
			class HitBulb {
				armor = 1;
				material = 60;
				name = "lampa";
				passthrough = true;
			};
		};
		
		class Reflectors {
			class LampLight {
				ambient[] = {0, 0, 0, 0};
				brightness = 0;
				color[] = {0, 0, 0, 0};
				direction = "";
				hitpoint = "lampa";
				position = "Light";
				selection = "";
				size = 0;
			};
		};
	};
	
	class Land_lampa_ind_zebr : StreetLamp {
		scope = public;
		model = "\ca\buildings\Misc\lampa_ind_zebr";
		
		class HitPoints {
			class HitBulb {
				armor = 1;
				material = 60;
				name = "lampa";
				passthrough = true;
			};
		};
		
		class Reflectors {
			class LampLight {
				ambient[] = {0, 0, 0, 0};
				brightness = 0;
				color[] = {0, 0, 0, 0};
				direction = "";
				hitpoint = "lampa";
				position = "Light";
				selection = "";
				size = 0;
			};
		};
	};
	class Land_rusway_edgelight : StreetLamp {
		scope = public;
		model = "\ca\buildings\Misc\runway_edgelight";
		
		class HitPoints {
			class HitBulb {
				armor = 1;
				material = 60;
				name = "lampa";
				passthrough = true;
			};
		};
		
		class Reflectors {
			class LampLight {
				ambient[] = {0, 0, 0, 0};
				brightness = 0;
				color[] = {0, 0, 0, 0};
				direction = "";
				hitpoint = "lampa";
				position = "Light";
				selection = "";
				size = 0;
			};
		};
	};
};