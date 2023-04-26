/*--------------------------------------------------------------------------------------------------
	Get Weapon Linked Items

	GLOBAL ARGUMENT - LOCAL OR GLOBAL EXECUTION

	Usage: Grabs linked items of a weapon class that has attachments

	Parameters:
		0.) Weapon Class - String
--------------------------------------------------------------------------------------------------*/

params [
	["_weapon", "", [""]]
];

configProperties [(configFile >> "CfgWeapons" >> _weapon >> "LinkedItems")] apply {
	getText (_x >> "item")
};