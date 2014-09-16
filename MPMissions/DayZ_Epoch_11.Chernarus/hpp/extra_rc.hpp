class ExtraRc {	
    class ItemBloodbag {
        class Use {
            text = "Применить";
            script = "execVM 'scripts\medical\player_selfbloodbag.sqf';";
        };
    }; 
	
	class Binocular {
		class Dis0 {
            text = "Видимость. 500m";
            script = "setViewDistance 500;";
        };
        class Dis1 {
            text = "Видимость. 1000m";
            script = "setViewDistance 1000;";
        };      
		class Dis2 {
            text = "Видимость. 2000m";
            script = "setViewDistance 2000;";
        };
		class Dis3 {
            text = "Видимость. 2500m";
            script = "setViewDistance 2500;";
        };
		class Dis4 {
            text = "Видимость. 3000m";
            script = "setViewDistance 3000;";
        };
		class Dis5 {
            text = "Видимость. 5000m";
            script = "setViewDistance 5000;";
        };
    };	
	class Binocular_Vector {
		class Dis0 {
            text = "Видимость. 500m";
            script = "setViewDistance 500;";
        };
        class Dis1 {
            text = "Видимость. 1000m";
            script = "setViewDistance 1000;";
        };      
		class Dis2 {
            text = "Видимость. 2000m";
            script = "setViewDistance 2000;";
        };
		class Dis3 {
            text = "Видимость. 2500m";
            script = "setViewDistance 2500;";
        };
		class Dis4 {
            text = "Видимость. 3000m";
            script = "setViewDistance 3000;";
        };
		class Dis5 {
            text = "Видимость. 5000m";
            script = "setViewDistance 5000;";
        };
    };
	class Colt1911 {
		class suicide {
			text = "Самоубийство";
			script = "execVM 'custom\player_suicide.sqf';";
		};
	};
	class glock17_EP1 {
		class suicide {
			text = "Самоубийство";
			script = "execVM 'custom\player_suicide.sqf';";
		};
	};	
	class M9 {
		class suicide {
			text = "Самоубийство";
			script = "execVM 'custom\player_suicide.sqf';";
		};
	};	
	class M9SD {
		class suicide {
			text = "Самоубийство";
			script = "execVM 'custom\player_suicide.sqf';";
		};
	};	
	class Makarov {
		class suicide {
			text = "Самоубийство";
			script = "execVM 'custom\player_suicide.sqf';";
		};
	};	
	class MakarovSD {
		class suicide {
			text = "Самоубийство";
			script = "execVM 'custom\player_suicide.sqf';";
		};
	};	
	class revolver_EP1 {
		class suicide {
			text = "Самоубийство";
			script = "execVM 'custom\player_suicide.sqf';";
		};
	};	
	
	class ItemZombieParts {
		class cover {
			text = "Обмазаться";
			script = "execVM 'custom\player_zombieCover.sqf';";
		};
	};
	
	class ItemKnife {
        class farmhemp {
            text = "Harvest the weed";
            script = "execVM 'scripts\adt\hemp.sqf'";
        };
    };
	
	class ItemKiloHemp {
        class smokeweed {
            text = "Укуриться";
            script = "execVM 'scripts\adt\smokeshit.sqf'";
        };
    };
	
	class EvMoney {
		class cover {
			text = "Платное меню";
			script = "execVM 'custom\donate_system.sqf';";
		};
	};
	
	class ItemNewspaper {
		class ItemNewspaper {
			text = "Читать газету";					
			script = "execVM 'scripts\craft\gazeta.sqf'";
		};
	};
	
	class PartOreGold {
		class PartOreGold {
			text = "Переплавить";
            script = "execVM 'scripts\craft\oregold.sqf'";
        };
	};		

    class PartOreSilver {
		class PartOreSilver {
			text = "Переплавить";					
			script = "execVM 'scripts\craft\oresilver.sqf'";
		};
	};	

    class PartOre {
		class PartOre {
			text = "Переплавить";					
			script = "execVM 'scripts\craft\oreiron.sqf'";
		};
	};
    
	class AKS_GOLD {
		class AKS_GOLD {
			text = "Переплавить в золото";					
			script = "execVM 'scripts\craft\akm_gold.sqf'";
		};
	};
	
	class revolver_gold_EP1 {
		class revolver_gold_EP1 {
			text = "Переплавить в золото";					
			script = "execVM 'scripts\craft\rev_gold.sqf'";
    	};
	};
	
	class ItemSandbag {
		class sement {
            text = "Создать: CinderBlocks";
            script = "execVM 'scripts\craft\CinderBlocks.sqf'";
        };
	};
	
    class MortarBucket {
		class pesok {
			text = "Создать: CinderBlocks";
            script = "execVM 'scripts\craft\CinderBlocks.sqf'";
        };
	};
	
    class Skin_Survivor2_DZ {
		class craft_canv {
			text = "Создать: Canvas";
            script = "execVM 'scripts\craft\Canvas.sqf'";
        };
	};
	/*
	class pravila {
		text = "Правила сервера";
		script = "execVM 'scripts\rules_adt.sqf'";
		};
	};*/
	
	class ItemEpinephrine{
		class ItemEpinephrine {
			text = "Принять";					
			script = "execVM 'scripts\medical\color_epi_use.sqf'";
		};
    };
};