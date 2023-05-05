/*--------------------------------------------------------------------------------------------------
	Add Scopes to Arsenal

	GLOBAL ARGUMENT - LOCAL OR GLOBAL EXECUTION

	Usage: Adds scopes to the arsenal whitelist of a ACE Arsenal Box depending on parameters

	Parameters:
		0.) ACE Arsenal Box - Object
		1.) Max Scope Magnification - Number
		2.) Include NVG - Bool (Default: True)
		3.) Global - Bool (Default: False)
--------------------------------------------------------------------------------------------------*/

params [
	["_box", objNull, [objNull]],
	["_maxMag", 999, [-1]],
	["_nvg", true, [true]],
	["_global", false, [true]]
];

_maxMag = abs _maxMag;

// get scopes
private _scopes = toString {
	getNumber (_x >> "scope") == 2
	&&
	{getNumber (_x >> "ItemInfo" >> "type") == 201}
} configClasses (configFile >> "CfgWeapons");
_scopes = _scopes apply { configName _x };

// filter max magnification
_scopes = _scopes select {
	_x call HYP_fnc_getScopeMag <= _maxMag
};

// filter nvg
if !(_nvg) then {
	_scopes = _scopes select {
		(_x call HYP_fnc_hasScopeNVG) params ["_primaryIntegrated", "_primarySupported", "_primaryTiIntegrated", "_secondaryNVGSupported"];
		!(_primaryIntegrated) or !(_primaryTiIntegrated)
	};
};

[_box, _scopes, _global] call ACE_arsenal_fnc_addVirtualItems;