//Mining Start by GROM
private ["_Mining_Counter","_rand","_randGem","_hasSledge","_hasToolbox","_inventory","_currentWeapon","_mining_message","_has_free_space","_cursorTarget"];

isMining = true;
_has_free_space = true;
_cursorTarget = cursorTarget;
_mining_message = "";
systemChat("Добыча руды начата");

player removeAction s_player_mine;
s_player_mining = -1;

//checks player's current weapon and exist with message if they do not have a sledge equipped			//
//adds eventhandler so that if the player looks away from the rock they break out of the mining action	//
_currentWeapon = primaryWeapon player;																	//	hogscraper
																										//
if (_currentWeapon == "MeleeSledge") then {																//
	r_interrupt=false;																					//
	
	while {isMining} do {
		_inventory = magazines player;
		_Mining_Counter=10;
		systemChat(_mining_message);
		[10,10] call dayz_HungerThirst;
		
		//set up quick loop that swings the sledge and if player moves it breaks out of the mining action 					//
		while {_Mining_Counter > 0} do {																					//
			_cursorTarget = cursorTarget;
			if((r_interrupt)) exitWith { isMining=false };
			if ((currentWeapon player)!="MeleeSledge") exitWith {
				isMining = false;
				systemChat("Кувалда должна быть в руках!");
			};
			player playActionNow "GestureSwing";																			//	hogscraper
			sleep 1;																										//
			_Mining_Counter = _Mining_Counter - 1;																			//
			closeDialog 0;																									//
		};																													//

		if (isMining) then {
			private ["_rand"];
			_rand = floor(random 100);
			
			if (_rand <= 60) then {
				_has_free_space=[player,"PartOreSilver",false] call BIS_fnc_invAdd;
				_mining_message="Добыто немного камней";
			};
			if (_rand <= 100 && _rand > 98) then {
				_has_free_space=[player,"CinderBlocks",false] call BIS_fnc_invAdd;
				_mining_message="Добыто немного серебрянной руды";
			};
			if (_rand <= 100 && _rand > 90) then {
					_has_free_space=[player,"PartOre",false] call BIS_fnc_invAdd;
				_mining_message="Добыто немного железной руды";
			};
			if (_rand <= 100 && _rand > 98) then { //85
				_has_free_space=[player,"PartOreGold",false] call BIS_fnc_invAdd;
				_mining_message="Добыто немного золотой руды";
			};
		} else {
			systemChat("Добыча руда прекращена");
			player removeAction s_player_mining;
			s_player_mine = -1;		
		};
		
		if (!_has_free_space) exitWith {
			isMining = false;
			player removeAction s_player_mining;
			s_player_mine = -1;
			systemChat ("Ваш инвентарь полный!");
		}; 
	};
} else {
	systemChat("Ты должен иметь кувалду в руках!");
	isMining = false;
	player removeAction s_player_mining;
	s_player_mine = -1;		
};