/*--------------------------------------------------------------------------------------------------
	Change Location Text

	SERVER EXECUTION ONLY

	Usage: Changes a map default location name

	Parameters:
		0.) Position - Position2D, Position3D, or Object
		1.) Text - String
		2.) Include Terrain Locations - BOOL (Default: False)

	Example:
		[[500,250], "Military Base Alpha", false] call HYP_fnc_changeLocationText
--------------------------------------------------------------------------------------------------*/

params [
	["_pos", objNull, [objNull, []]],
	["_text", "", [""]],
	["_terrain", false, [true]]
];

if !(isServer) exitWith {};

private _filter = [
	"NameCityCaptial",
	"NameCity",
	"NameVillage",
	"NameLocal",
	"Name"
];
if (_terrain) then {
	_filter insert [
		-1,
		[
			"Mount",
			"NameMarine",
			"Hill",
			"ViewPoint",
			"RockArea",
			"BorderCrossing",
			"VegetationBroadleaf",
			"VegetationFir",
			"VegetationPalm",
			"VegetationVineyard"
		]
	];
};

private _locations = nearestLocations [_pos, _filter, 50, _pos];
if (_locations isEqualTo []) exitWith { systemChat format ["No Locations Found at %1", _pos] };

private _location = _locations select 0;
_location = createLocation [_location];
_location setText _text;