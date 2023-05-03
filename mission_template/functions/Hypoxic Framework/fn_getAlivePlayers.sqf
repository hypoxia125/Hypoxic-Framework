/*--------------------------------------------------------------------------------------------------
	Get Alive Players

	Usage: Returns alive players, no headless clients

	Parameters:
		NONE

	Return:
		Alive Players - Array of Players
--------------------------------------------------------------------------------------------------*/

private _players = allPlayers - entities "HeadlessClient_F";
_players select { alive _x };