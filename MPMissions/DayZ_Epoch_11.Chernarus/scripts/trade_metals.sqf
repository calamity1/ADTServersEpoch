/*
ADT-TEAM
*/
private ["_buy","_metals_conversion","_cancel"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_103") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

{player removeAction _x} count s_player_parts;s_player_parts = [];
s_player_parts_crtl = 1;

_metals_conversion = [ 
    ["ItemTopaz","ItemBriefcase100oz",1,1,"buy","Full Briefcases","Topaz",99],
    ["ItemBriefcase100oz","ItemTopaz",1,1,"buy","Topaz","Full Briefcases",99],
    
    ["ItemObsidian","ItemBriefcase100oz",1,1,"buy","Full Briefcases","Obsidian",99],
    ["ItemBriefcase100oz","ItemObsidian",1,1,"buy","Obsidian","Full Briefcases",99],    
    
    ["ItemRuby","ItemObsidian",1,1,"buy","Obsidian","Ruby",99],
    ["ItemObsidian","ItemRuby",1,1,"buy","Ruby","Obsidian",99],
	 
	["ItemSapphire","ItemBriefcase100oz",1,1,"buy","Full Briefcases","Sapphire",99],
    ["ItemBriefcase100oz","ItemSapphire",1,1,"buy","Sapphire","Full Briefcases",99],
	
	["ItemAmethyst","ItemBriefcase100oz",1,1,"buy","Full Briefcases","Amethyst",99],
    ["ItemBriefcase100oz","ItemAmethyst",1,1,"buy","Amethyst","Full Briefcases",99],
	
	["ItemEmerald","ItemBriefcase100oz",1,1,"buy","Full Briefcases","Emerald",99],
    ["ItemBriefcase100oz","ItemEmerald",1,1,"buy","Emerald","Full Briefcases",99] 
];

// Стат меню...
{
	//diag_log format["DEBUG TRADER: %1", _x];
	_buy = player addAction [format["Trade %1 %2 for %3 %4",(_x select 3),(_x select 5),(_x select 2),(_x select 6)], "custom\trade_items_wo_db.sqf",[(_x select 0),(_x select 1),(_x select 2),(_x select 3),(_x select 4),(_x select 5),(_x select 6)], (_x select 7), true, true, "",""];
	s_player_parts set [count s_player_parts,_buy];
				
} count _metals_conversion;

//_cancel = player addAction ["Отмена", "\z\addons\dayz_code\actions\trade_cancel.sqf",["na"], 0, true, false, "",""];
_cancel = player addAction ["Cancel", "custom\trade_cancel.sqf",["na"], 0, true, false, "",""];
s_player_parts set [count s_player_parts,_cancel];

DZE_ActionInProgress = false;
