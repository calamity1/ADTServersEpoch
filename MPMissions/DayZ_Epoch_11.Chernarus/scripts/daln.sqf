setviewdistance 3000;
bis_fog = 0;
 
setviewdistance 3000;
0 setovercast 0;
0 setrain 1;
//0 setfog 0;
0 setfog bis_fog;
 
[] spawn {
    _delay = 3;
    sleep 0.01;
    while {true} do {
        _delay  setovercast 0;
        _delay  setrain 1;
        _delay  setfog bis_fog;
        sleep _delay ;
    };
};