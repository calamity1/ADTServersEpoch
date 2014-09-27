/*
ADT-TEAM.RU
by GROM : http://gromx.ru/
17.09.2014

*/
NPG_fnc_cKeyDownGenericDisplay = {
    private["_keypressed","_return"];     _keypressed = _this select 1;     _return = false;

    #define KEYSCODE_ESC_KEY    1

    // disable esc while in dialog
    switch (_keypressed) do
    {
        case KEYSCODE_ESC_KEY:
        {             _return = true;
        };
    };     _return;
};

[] spawn { waitUntil {sleep 0.01; (!(isNull (findDisplay 41144)))}; disableSerialization; _foundComboLockUI = findDisplay 41144; _foundComboLockUI displayAddEventHandler ["KeyDown","_this call NPG_fnc_cKeyDownGenericDisplay"];
};