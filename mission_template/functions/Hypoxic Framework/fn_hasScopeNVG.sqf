/*--------------------------------------------------------------------------------------------------
	Scope NVG Support

	Usage: Gets the NVG/TI vision modes for a particular optic

	Parameters:
		0.) Scope Class - String

	Returns:
		Array - Array of Bools
		[
			Primary Optic NVG Integrated,
			Primary Optic NVG Support for NVG Goggles,
			Primary Optic Thermal Integrated,
			Secondary Optic NVG Support for NVG Goggles
		]

	Example:
		["optic_arco"] call HYP_fnc_scopeNVGSupport
		// Results [false, false, false, true]
--------------------------------------------------------------------------------------------------*/

params [
	["_class", "", [""]]
];

private _opticsModes = ("true" configClasses (configFile >> "CfgWeapons" >> _class >> "ItemInfo" >> "OpticsModes")) apply {
    private _visionMode = getArray (_x >> "visionMode");
    [
        getNumber (_x >> "useModelOptics") == 1, //is in optics
        _visionMode isEqualTo [], //Optional NVG 
        "NVG" in _visionMode, //Integrated NVG
        "Ti" in _visionMode //Integrated Thermal
    ]
};

private _primaryNVGIntegrated = false;
private _primaryNVGSupported = false;
private _primaryTiIntegrated = false;
private _secondaryNVGSupported = false;

{
    _x params ["_isPrimary", "_optionalNvg", "_integratedNVG", "_integratedTi"];
    if (_isPrimary) then {
        if (_integratedNVG) then {
            _primaryNVGIntegrated = true;
        };
        if (_optionalNvg) then {
            _primaryNVGSupported = true;
        };
        if (_integratedTi) then {
            _primaryTiIntegrated = true;
        };
    } else {
        if (_optionalNvg) then {
            _secondaryNVGSupported = true;
        }
    }
} forEach _opticsModes;

// return
[
	_primaryNVGIntegrated,
	_primaryNVGSupported,
	_primaryTiIntegrated,
	_secondaryNVGSupported
]