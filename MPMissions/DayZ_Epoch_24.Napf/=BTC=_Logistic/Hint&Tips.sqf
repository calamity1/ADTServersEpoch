/*
Hint & Tips

obj setvariable ["BTC_Cannot_Lift",1,true]; // Make an object un-liftable
obj setVariable ["BTC_Cannot_Drag",1,true]; // Make an object un-draggable
BTC_Draggable        = [""]; // Objects draggable
BTC_Load_In_Vehicles = ["Tank","Wheeled_APC","Truck","Car","Helicopter","C130J","C130J_US_EP1"]; // Vehicles that u can load an object in
BTC_lift_min_h   = 7;  // Min height required to lift an object
BTC_lift_max_h   = 12; // Max height required to lift an object
BTC_lift_radius  = 2;  // You have to stay in this radius to lift an object
BTC_lift_pilot   = []; // Leave empty if all soldiers can use choppers to lift. If only pilot can -> BTC_lift_pilot = ["US_Soldier_Pilot_EP1","USMC_Soldier_Pilot", ...etc etc];

BTC_Get_liftable_array =
{
	_chopper = _this select 0;
	_array   = [];
	switch (typeOf _chopper) do
	{
		case "MH6J_EP1" : {_array = ["Motorcycle","ReammoBox"];}; // Modify the array to change liftable objects by the chopper ex -> _array = ["Motorcycle","ReammoBox","Wheeled_APC", ... etc etc];
		// To add a new chopper class: copy the previous line:
		// case "MH6J_EP1" : {_array = ["Motorcycle","ReammoBox"];};
		// modify the class in the "" -> "Mi17_Ins"
		// case "Mi17_Ins" : {_array = ["Motorcycle","ReammoBox"];};
		// modify the _array as u want like above
	};
	_array
};
*/