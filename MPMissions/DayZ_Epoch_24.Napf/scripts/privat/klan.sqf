if ((getPlayerUID player) in ["15231945","15458761","3431497","11983945","1799172","10975748","11728644","10977348","14023881","9072900","156868","1658052"])
	then 
	{
        titleText ["Welcome!!!", "PLAIN DOWN", 3]; titleFadeOut 4;
    }   
	else 
	{
waitUntil {!isNull player};
playSound "alarm1";
sleep 1;

nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
nonapsi_ef ppEffectAdjust [2, 30, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
nonapsi_ef ppEffectCommit 0;
nonapsi_ef ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
nonapsi_ef ppEffectCommit 3;
nonapsi_ef ppEffectEnable true;
nonapsi_ef2 = ppEffectCreate ["filmGrain", 1555]; 
nonapsi_ef2 ppEffectEnable true;
nonapsi_ef2 ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
nonapsi_ef2 ppEffectCommit 5;
sleep 1;

titleText ["Run Nigga! RUN RUN RUN!", "PLAIN DOWN", 3]; titleFadeOut 4;
sleep 4;
playSound "alarm1";
titleText ["You have 40 seconds!", "PLAIN DOWN", 3]; titleFadeOut 4;
sleep 4;
playSound "alarm1";
sleep 4;
r_player_inpain = true;
sleep 3;
playSound "alarm1";
sleep 4;
r_player_cardiac = true;
sleep 3;
playSound "alarm1";
sleep 4;
r_player_injured = true;
sleep 3;
playSound "alarm1";
sleep 3;
r_player_blood = 1000;
sleep 3;
playSound "alarm1";
sleep 2;
r_player_dead = true;

};