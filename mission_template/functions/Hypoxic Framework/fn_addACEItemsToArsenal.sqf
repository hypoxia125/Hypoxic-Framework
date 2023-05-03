/*--------------------------------------------------------------------------------------------------
	Add ACE Items to Arsenal

	GLOBAL ARGUMENT - LOCAL OR GLOBAL EXECUTION

	Usage: Adds ACE items to the arsenal whitelist of a ACE Arsenal Box

	Parameters:
		0.) ACE Arsenal Box - Object
		1.) Types of Items - Array of Strings
			Available Types:
				- "ITEMS"
				- "MEDICAL"
				- "FOOD"
				- "ADVBALLISTICS"
				- "ROPES"
		2.) Global - BOOL (Default: False)
--------------------------------------------------------------------------------------------------*/

params [
	["_box", objNull],
	["_types", ["ITEMS", "MEDICAL"]],
	["_global", false]
];

private _items = [
	"ACE_RangeTable_82mm",
	"ACE_artilleryTable",
	"ACE_CableTie",
	"ACE_Cellphone",
	"ACE_Chemlight_Shield",
	"ACE_DAGR",
	"ACE_DeadManSwitch",
	"ACE_DefusalKit",
	"ACE_EarPlugs",
	"ACE_EntrenchingTool",
	"ACE_Fortify",
	"ACE_Flashlight_MX991",
	"ACE_HuntIR_monitor",
	"ACE_IR_Strobe_Item",
	"ACE_Flashlight_KSF1",
	"ACE_M26_Clacker",
	"ACE_Clacker",
	"ACE_Flashlight_XL50",
	"ACE_MapTools",
	"MineDetector",
	"ACE_Sandbag_empty",
	"ACE_SpareBarrel_Item",
	"ACE_SpraypaintBlack",
	"ACE_SpraypaintBlue",
	"ACE_SpraypaintGreen",
	"ACE_SpraypaintRed",
	"ToolKit",
	"ACE_UAVBattery",
	"ACE_wirecutter"
];

private _food = [
	"ACE_Banana",
	"ACE_Can_Franta",
	"ACE_Can_RedGull",
	"ACE_Can_Spirit",
	"ACE_Canteen",
	"ACE_Canteen_Empty",
	"ACE_Canteen_Half",
	"ACE_Humanitarian_Ration",
	"ACE_MRE_BeefStew",
	"ACE_MRE_ChickenTikkaMasala",
	"ACE_MRE_ChickenHerbDumplings",
	"ACE_MRE_CreamChickenSoup",
	"ACE_MRE_CreamTomatoSoup",
	"ACE_MRE_LambCurry",
	"ACE_MRE_MeatballsPasta",
	"ACE_MRE_SteakVegetables",
	"ACE_Sunflower_Seeds",
	"ACE_WaterBottle",
	"ACE_WaterBottle_Empty",
	"ACE_WaterBottle_Half"
];

private _advBallistics = [
	"ACE_ATragMX",
	"ACE_Kestrel4500",
	"ACE_microDAGR",
	"ACE_RangeCard",
	"ACE_SpottingScope",
	"ACE_Tripod"
];

private _medical = [
	"ACE_adenosine",
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_packingBandage",
	"ACE_quikclot",
	"ACE_bloodIV",
	"ACE_bloodIV_250",
	"ACE_bloodIV_500",
	"ACE_bodyBag",
	"ACE_epinephrine",
	"ACE_morphine",
	"ACE_personalAidKit",
	"ACE_plasmaIV",
	"ACE_plasmaIV_250",
	"ACE_plasmaIV_500",
	"ACE_salineIV",
	"ACE_salineIV_250",
	"ACE_salineIV_500",
	"ACE_splint",
	"ACE_surgicalKit",
	"ACE_tourniquet"
];

private _ropes = [
	"ACE_rope12",
	"ACE_rope15",
	"ACE_rope18",
	"ACE_rope27",
	"ACE_rope3",
	"ACE_rope36",
	"ACE_rope6"
];

private _final = [];

_types = _types apply { toUpperANSI _x };
if ("ITEMS" in _types) then {
	_final insert [-1, _items, true];
};
if ("FOOD" in _types) then {
	_final insert [-1, _food, true]
};
if ("ADVBALLISTICS" in _types) then {
	_final insert [-1, _advBallistics, true]
};
if ("MEDICAL" in _types) then {
	_final insert [-1, _medical, true]
};
if ("ROPES" in _types) then {
	_final insert [-1, _ropes, true]
};

[_box, _final, _global] call ACE_arsenal_fnc_addVirtualItems;
_box;