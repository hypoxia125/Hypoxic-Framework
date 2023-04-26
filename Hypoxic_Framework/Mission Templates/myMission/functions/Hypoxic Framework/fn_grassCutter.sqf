/*--------------------------------------------------------------------------------------------------
	Grass Cutter

	SERVER ONLY - EDEN ONLY

	Usage: Creates grass cutters to fill an area in the eden editor

	Parameters:
		0.) Area or Trigger - Array or Object
		1.) Size - Number (1: Medium Size; 2: Large Size)

	Example:
		[[[100, 100, 0], 20, 30, 45, false], 2] call HYP_fnc_grassCutter
--------------------------------------------------------------------------------------------------*/

params [
	["_area", [], [[], objNull]],
	["_size", 2, [-1]]
];

if !(is3DEN) exitWith { false };

if (_area isEqualTo []) exitWith {"NO AREA GIVEN" call BIS_fnc_error};
if (isNull _area) exitWith {"NO AREA GIVEN" call BIS_fnc_error};
if (_area isEqualType objNull) then {
	_area = [getPosATL _area] + triggerArea _area;
};

private ["_class", "_dis"];
switch _size do {
	case 1: {
		_class = "Land_ClutterCutter_medium_F";
		_dis = 4;
	};
	case 2: {
		_class = "Land_ClutterCutter_large_F";
		_dis = 8;
	};
	default {
		_class = "Land_ClutterCutter_medium_F";
		_dis = 4;
	};
};

// checks
_area params ["_pos", "_a", "_b", "_angle", "_isRectangle"];
_pos params ["_xPos", "_yPos"];
private _xPos = _xPos - _a;
private _yPos = _yPos - _b;

// get 3den layer
private _layer = profileNamespace getVariable "HYP_cutterLayer";
if (isNil "_layer" || count get3DENLayerEntities _layer == 0) then {
	_layer = -1 add3DENLayer "Grass Cutters";
	profileNamespace setVariable ["HYP_cutterLayer", _layer];
};

private _grassCutters = 0;
// loop for cutters
for "_xx" from 0 to (_a * 2) step _dis do {
	for "_yy" from 0 to (_b * 2) step _dis do {

		// create grass cutter
		private _pos = [_xPos + _xx, _yPos + _yy, 0];
		if !(_pos inArea _area) then {continue};

		private _cutter = create3DENEntity ["Object", _class, _pos, true];
		_cutter set3DENLayer _layer;
		_grassCutters = _grassCutters + 1;
	};
};

// return
_grassCutters