waitUntil {alive player};

while {true} do
{
	_kills = 		player getVariable["zombieKills",0];
	_killsH = 		player getVariable["humanKills",0];
	_killsB = 		player getVariable["banditKills",0];
	_humanity =		player getVariable["humanity",0];
	
	hintSilent parseText format ["
	<t size='1.25' font='Bitstream'align='center' color='#D60000'>ADT-TEAM</t><br/>
	<t size='1.15' font='Bitstream'align='center' color='#D60000'>dayz-adt.ru</t><br/>
	<t size='1.15' font='Bitstream'align='center' color='#5882FA'>Прожил %2 дней</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Человечность: </t><t size='0.95' font='Bitstream' align='right'>%7</t><br/>
    <t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Здоровье: </t><t size='0.95' font='Bitstream' align='right'>%8</t><br/>",
   
	dayz_playerName,(dayz_Survived),(count playableUnits),_killsH,_killsB,_kills,round _humanity,r_player_blood,(round diag_fps),(round(240-(serverTime) / 60))
	];
sleep 1;
};