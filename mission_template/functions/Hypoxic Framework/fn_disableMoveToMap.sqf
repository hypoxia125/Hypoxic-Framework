/*--------------------------------------------------------------------------------------------------
	Disable Move To Map

	LOCAL ARGUMENT - LOCAL EXECUTION

	Usage: Disables the ability to move to character's location on the map (top right)

	Parameters:
		NONE

	Example:
		[] call HYP_fnc_disableMoveToMap
--------------------------------------------------------------------------------------------------*/

if !(hasInterface) exitWith { false };

[] spawn {
    disableSerialization;
    disableMapIndicators [true, true, true, true];
    while {true} do {
        waitUntil {sleep 0.5; visibleMap};
        _display = uiNamespace getVariable "RSCDiary";
        _ctrl = _display displayCtrl 1202;
        _ctrl ctrlEnable false;
        _ctrl ctrlsettextcolor [0,0,0,0];
        _ctrl ctrlSetTooltip "";
        _ctrl ctrlCommit 0;
        waitUntil {sleep 0.5; !visibleMap};
    };
};

// return
true