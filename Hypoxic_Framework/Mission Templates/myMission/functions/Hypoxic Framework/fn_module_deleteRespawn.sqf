/*--------------------------------------------------------------------------------------------------
	Module: Delete Respawn

	SERVER EXECUTION

	Usage: Deletes respawn position that a BI respawn module creates using its variable name given in the editor

	Parameters:
		0:) Respawn Module - Object

	Example:
		[myRespawn_0] call HYP_fnc_module_deleteRespawn
--------------------------------------------------------------------------------------------------*/

if !(isServer) exitWith { false };

params ["_logic"];

_respawn = _logic getVariable ["respawn", []];
_respawn = _respawn param [0, [], [[], ""]];
if (_respawn isEqualType [] && {count _respawn == 2}) then {
   _respawn call bis_fnc_removeRespawnposition;
};

deleteVehicle _logic;

// return
true