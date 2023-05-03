/*--------------------------------------------------------------------------------------------------
	Clear Waypoints

	LOCAL ARGUMENT - GLOBAL EXECUTION

	Usage: Clears a group's waypoints

	Parameters:
		0.) Group - Group

	Example:
		[_group] call HYP_fnc_clearWaypoints
--------------------------------------------------------------------------------------------------*/

params [
	["_group", grpNull, [grpNull]]
];

if !(local _group) exitWith { grpNull };

for "_i" from count waypoints _group - 1 to 0 step -1 do {
	deleteWaypoint [_group, _i];
};

// return
waypoints _group