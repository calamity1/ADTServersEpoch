[] spawn {

 while {1 == 1} do
 {
  _vehicle_list = player nearEntities [["LandVehicle","Air","Ship"], 3];  //m12
  {
   if (locked _x) then {
    closeDialog 0;
    hint "DupingFIX"; //msg
   }
  } forEach _vehicle_list;
  uiSleep 0.1;
 };
};