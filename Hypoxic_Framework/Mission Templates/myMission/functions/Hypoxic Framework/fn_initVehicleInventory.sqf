/*--------------------------------------------------------------------------------------------------
	Initialize Vehicle Inventory

	LOCAL ARGUMENT - GLOBAL EXECUTION

	Usage: Removes all vehicle inventory and inserts the inventory given in the array

	Parameters:
		0.) Vehicle - Object
		1.) Inventory Array - Array
			0.) Item - String
			1.) Count - Number
	
	Example:
		[myVehicle, [["myItemClass1",2],["myItemClass2",2]]] call HYP_fnc_initVehicleInventory
--------------------------------------------------------------------------------------------------*/

params [
	["_veh", objNull, [objNull]],
	["_itemArray", [], [[]]]
];

if !(local _veh) exitWith { false };
if (_itemArray isEqualTo []) exitWith { false };

// Clear inventory
clearItemCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearBackpackCargoGlobal _veh;

_itemArray apply {
	_x params ["_item", "_count"];

	_veh addItemCargoGlobal [_item, _count];
};