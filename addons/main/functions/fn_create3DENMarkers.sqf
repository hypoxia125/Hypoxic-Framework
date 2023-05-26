params [
	["_markerParams", [], [[]]]
];

if !(is3DEN) exitWith {};

private _markersCreated = [];
_markerParams apply {
	_x params ["_type", "_name", "_text", "_position","_size","_rotation","_markerType","_brush","_color","_alpha"];

	private _marker = create3DENEntity ["marker", _type, [0,0,0]];

	_marker set3DENAttribute ["type", _type];
	_marker set3DENAttribute ["name", _name];
	_marker set3DENAttribute ["text", _text];
	_marker set3DENAttribute ["position", _position];
	_marker set3DENAttribute ["size2", _size];
	_marker set3DENAttribute ["rotation", _rotation];
	_marker set3DENAttribute ["markerType", _markerType];
	_marker set3DENAttribute ["brush", _brush];
	_marker set3DENAttribute ["baseColor", _color];
	_marker set3DENAttribute ["alpha", _alpha];

	_markersCreated pushBack _name;
};

_markersCreated;