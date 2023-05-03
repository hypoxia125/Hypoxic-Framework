/*--------------------------------------------------------------------------------------------------
	Get Scope Magnification

	Usage: Grabs the FOV of a scope and returns its converted magnification value

	Parameters:
		0.) Scope Class - String

	Example:
		["optic_arco"] call HYP_fnc_getScopeMagnification
--------------------------------------------------------------------------------------------------*/

params [
	["_class", "", [""]]
];

private _minZoom = 999;
{
	_minZoom = _minZoom min (getNumber (_x >> "opticsZoomMin"));
} forEach configProperties [configFile >> "CfgWeapons" >> _class >> "ItemInfo" >> "OpticsModes"];

// return
(0.25 / _minZoom)