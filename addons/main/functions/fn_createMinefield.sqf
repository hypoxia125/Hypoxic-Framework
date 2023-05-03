/*--------------------------------------------------------------------------------------------------
    Create Minefield

    GLOBAL ARGUMENT - GLOBAL EXECUTION

    Usage: Creates a minefield based on an array of mines

    Parameters:
        0.) Trigger - Object
        1.) Array of Mines - Array of String
        2.) Minimum Mine Count - Number
        3.) Maximum Mine Couint - Number
        4.) Draw Area Marker - BOOL (Default: False)

    Return:
        Mines - Array of Objects

    Example:
        [myTrigger, ["APERS_Mine", "AT_mine"], 25, 100, false] call HYP_fnc_createMinefield
--------------------------------------------------------------------------------------------------*/

params [
    ["_triggerArea", objNull, [objNull]],
	["_mineList", [], [[]]],
    ["_minMinesCount", 0, [-1]],
    ["_maxMinesCount", 0, [-1]],
	["_draw", false, [true]]
];

if (isNull _triggerArea) exitWith { false };
if (_mineList isEqualTo []) exitWith { false };
if (_minMinesCount < 0) then { false };
if (_maxMinesCount <= 0) exitWith { false };

private _minesCountInArea = random [_minMinesCount, _maxMinesCount / 2, _maxMinesCount];

private _mines = [];
for "_i" from 0 to _minesCountInArea - 1 do {
    private _pos = _triggerArea call BIS_fnc_randomPosTrigger;
    _pos set [2, 0];

    if (surfaceIsWater _pos) then {_i = _i - 1; continue};

    private _mine = createMine [selectRandom _mineList, _pos, [], 0];
    _mine setVectorUp (surfaceNormal _pos);

    _mines pushBack _mine;
};

if (_draw) then {
    private _markerName = format ["minefield_%1_icon", _pos];
    private _markerArea = [_markerName, _triggerArea, true] call BIS_fnc_markerToTrigger;
    _markerArea setMarkerColorLocal "ColorRED";
    _markerArea setMarkerBrush "FDiagonal";

    private _markerName = format ["minefield_%1_icon", _pos];
    private _marker = createMarkerLocal [_markerName, _pos];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "hd_warning";
    _marker setMarkerColor "ColorRED";
};

_mines