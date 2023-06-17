params [
	["_side", sideUnknown, [sideUnknown]],
	["_sMin", 0.5, [-1]],
	["_aMin", 0.3, [-1]],
	["_sMax", 1.0, [-1]],
	["_aMax", 1.0, [-1]],
	["_maxPlayer", 5, [-1]]
];

if !(isServer) exitWith {};
if (_side == sideUnknown) exitWith {};

private _minPlayer = 1;
private _currentPlayer = count ([false] call HYP_fnc_getPlayers);

private _skillToSet = linearConversion [_minPlayer, _maxPlayer, _currentPlayer, _sMin, _sMax, true];
private _aimToSet = linearConversion [_minPlayer, _maxPlayer, _currentPlayer, _aMin, _aMax, true];

{
	[_x, _skillToSet] remoteExecCall ["setSkill", _x];
	[_x, ["spotDistance", _skillToSet]] remoteExecCall ["setSkill", _x];
	[_x, ["spotTime", _skillToSet]] remoteExecCall ["setSkill", _x];
	[_x, ["general", _skillToSet]] remoteExecCall ["setSkill", _x];

	[_x, ["aimingAccuracy", _aimToSet]] remoteExecCall ["setSkill", _x];
	[_x, ["aimingShake", _aimToSet]] remoteExecCall ["setSkill", _x];
	[_x, ["aimingSpeed", _aimToSet]] remoteExecCall ["setSkill", _x];
} forEach units _side;

// return
[_skillToSet, _aimToSet];