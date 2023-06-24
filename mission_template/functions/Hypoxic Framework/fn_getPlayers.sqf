/*--------------------------------------------------------------------------------------------------
	Get Alive Players

	Usage: Returns alive players, no headless clients

	Parameters:
		NONE

	Return:
		Alive Players - Array of Players
--------------------------------------------------------------------------------------------------*/
params [
	["_includeDead", true, [true]]
];

private _players = allUnits select {isPlayer _x};
private _dead = allDead select {isPlayer _x};

if !(_includeDead) exitWith { _players };

_players + _dead