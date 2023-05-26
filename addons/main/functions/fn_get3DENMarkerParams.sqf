params [
	["_markers", [], [[]]]
];

private _isEqualType = _markers isEqualTypeAll "";
if !(_isEqualType) exitWith {};

if !(is3DEN) exitWith {};

private _markerParams = [];
_markers apply {
	_marker = _x;
	_markerParams insert [
		-1,
		[
			[
				_marker get3DENAttribute "itemClass" select 0,
				_marker get3DENAttribute "markerName" select 0,
				_marker get3DENAttribute "text" select 0,
				_marker get3DENAttribute "position" select 0,
				_marker get3DENAttribute "size2" select 0,
				_marker get3DENAttribute "rotation" select 0,
				_marker get3DENAttribute "markerType" select 0,
				_marker get3DENAttribute "brush" select 0,
				_marker get3DENAttribute "baseColor" select 0,
				_marker get3DENAttribute "alpha" select 0
			]
		]
	];
};

_markerParams;