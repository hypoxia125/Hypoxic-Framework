/*--------------------------------------------------------------------------------------------------
    Create Minefield

    GLOBAL ARGUMENT - GLOBAL EXECUTION

    Usage: Creates a minefield based on an array of mines

    Parameters:
        0.) Trigger - Object
        1.) Array of Mines - Array of String
        2.) Minimum Mine Count - Number
        3.) Maximum Mine Couint - Number
        4.) Debug Markers - BOOL (Default: False)

    Example:
        [myTrigger, ["APERS_Mine", "AT_mine"], 25, 100, false] call HYP_fnc_createMinefield
--------------------------------------------------------------------------------------------------*/

params [
    ["_triggerArea", objNull, [objNull]],
	["_mineList", [], [[]]],
    ["_minMinesCount", 0, [-1]],
    ["_maxMinesCount", 0, [-1]],
	["_debug", false, [true]]
];

if (isNull _triggerArea) exitWith { false };
if (_mineList isEqualTo []) exitWith { false };
if (_minMinesCount < 0) then {_minMinesCount = 0};
if (_maxMinesCount <= 0) exitWith { false };

private _minesCountInArea = random [_minMinesCount, _maxMinesCount / 2, _maxMinesCount];

for "_i" from 0 to _minesCountInArea - 1 do {
    private _pos = _triggerArea call BIS_fnc_randomPosTrigger;
    _pos set [2, 0];

    if (surfaceIsWater _pos) then {_i = _i - 1; continue};

    private _mine = createMine [selectRandom _mineList, _pos, [], 0];
    _mine setVectorUp (surfaceNormal _pos);

    if (_debug) then {
        private _markerName = format ["%1_marker", _mine];
        private _marker = createMarker [_markerName, _pos];
        _marker setMarkerColor "ColorRED";
        _marker setMarkerType "mil_dot";
        _marker setMarkerShape "ICON";

        private _pos = getPosATL _mine;
        private _arrow = createVehicle ["Sign_Arrow_F", _pos, [], 0, "CAN_COLLIDE"];
    };
};