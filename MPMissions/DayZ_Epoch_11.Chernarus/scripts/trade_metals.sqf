/*
ADT-TEAM
*/
private ["_buy","_metals_conversion","_cancel"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_103") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

{player removeAction _x} count s_player_parts;s_player_parts = [];
s_player_parts_crtl = 1;

_metals_conversion = [ 
    ["ItemTopaz","ItemBriefcase40oz",1,1,"buy","Briefcase40oz","Topaz",99],
    ["ItemBriefcase40oz","ItemTopaz",1,1,"buy","Topaz","Briefcase40oz",99],
    
    ["ItemObsidian","ItemBriefcase50oz",1,1,"buy","Briefcase50oz","Obsidian",99],
    ["ItemBriefcase50oz","ItemObsidian",1,1,"buy","Obsidian","Briefcase50oz",99],    
    
    //["ItemRuby","ItemBriefcase40oz",1,1,"buy","Briefcase40oz","Ruby",99],
    //["ItemObsidian","ItemRuby",1,1,"buy","Ruby","Obsidian",99],
	 
	["ItemSapphire","ItemBriefcase40oz",1,1,"buy","Briefcase40oz","Sapphire",99],
    ["ItemBriefcase40oz","ItemSapphire",1,1,"buy","Sapphire","Briefcase40oz",99],
	
	["ItemAmethyst","ItemBriefcase30oz",1,1,"buy","Briefcase30oz","Amethyst",99],
    ["ItemBriefcase30oz","ItemAmethyst",1,1,"buy","Amethyst","Briefcase30oz",99],
	
	["ItemEmerald","ItemBriefcase30oz",1,1,"buy","Briefcase30oz","Emerald",99],
    ["ItemBriefcase30oz","ItemEmerald",1,1,"buy","Emerald","Briefcase30oz",99],
	
	["PartOreGold","ItemGoldBar",1,1,"buy","GoldBar","OreGold",99],
    ["ItemGoldBar","PartOreGold",1,1,"buy","OreGold","GoldBar",99],

    ["ItemCitrine","ItemBriefcase30oz",1,1,"buy","Briefcase30oz","Citrine",99],
    ["ItemBriefcase30oz","ItemCitrine",1,1,"buy","Citrine","Briefcase30oz",99]	
];

// Стат меню...
{
	//diag_log format["DEBUG TRADER: %1", _x];
	_buy = player addAction [format["Трейд %1 %2 for %3 %4",(_x select 3),(_x select 5),(_x select 2),(_x select 6)], "\z\addons\dayz_code\actions\trade_items_wo_db.sqf",[(_x select 0),(_x select 1),(_x select 2),(_x select 3),(_x select 4),(_x select 5),(_x select 6)], (_x select 7), true, true, "",""];
	s_player_parts set [count s_player_parts,_buy];
				
} count _metals_conversion;

//_cancel = player addAction ["Отмена", "\z\addons\dayz_code\actions\trade_cancel.sqf",["na"], 0, true, false, "",""];
_cancel = player addAction ["Отмена", "\z\addons\dayz_code\actions\trade_cancel.sqf",["na"], 0, true, false, "",""];
s_player_parts set [count s_player_parts,_cancel];

DZE_ActionInProgress = false;
