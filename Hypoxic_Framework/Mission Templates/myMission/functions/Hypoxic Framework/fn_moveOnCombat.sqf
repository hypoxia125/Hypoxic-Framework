/*--------------------------------------------------------------------------------------------------
	Move on Combat

	LOCAL ARGUMENT - GLOBAL EXECUTION

	Usage: Sets AI pathing off and waits until they are in combat to turn it back on. Use with
	garrison positioning

	Parameters:
		0.) Group - Group

	Example:
		[myGroup1] call HYP_fnc_moveOnCombat
--------------------------------------------------------------------------------------------------*/

params [
	["_group", grpNull, [grpNull]]
];

if !(local _group) exitWith { grpNull };

// disable pathing
units _group apply {
	_x disableAI "PATH";
};

_this spawn {
	params ["_group"];

	waitUntil {
		sleep 1;
		(behaviour leader _group) in ["COMBAT", "STEALTH"];
	};

	// enable pathing
	units _group apply {
		_x enableAI "PATH";
	};
};

// return
_group