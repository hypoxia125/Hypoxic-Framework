/*--------------------------------------------------------------------------------------------------
	Get Alive Players

	Usage: Returns alive players, no headless clients

	Parameters:
		NONE

	Return:
		Alive Players - Array of Players
--------------------------------------------------------------------------------------------------*/
params [
	["_aliveOnly", false, [true]]
];

private _players = (allUnits + allDead) select {isPlayer _x};
if (_aliveOnly) then {
	_players = _players select {alive _x};
};

// return
_players;