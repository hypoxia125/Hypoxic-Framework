params ["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

/*--------------------------------------------------------------------------------------------------
	EXAMPLE - DEATH INTO INSTANT BLACK SCREEN WITH GURGLE SOUND INTO MUTE - ACE REQUIRED - RESPAWN = "BASE"

	// Instant black screen
	titleText ["", "BLACK OUT", 1e-3, true, false];

	// Play Death Sound
	private _sound = playSound "ACE_hit_Male01ENGB_high_4";
	waitUntil {isNull _sound};

	// Mute Game
	ace_hearing_disableVolumeUpdate = true;
	0 fadeSound 0;
	0 fadeRadio 0;
	0 fadeSpeech 0;
	0 fadeEnvironment 0;

	// Wait
	waitUntil {visibleMap};

	// Unmute Game
	3 fadeSound 1;
	3 fadeRadio 1;
	3 fadeSpeech 1;
	3 fadeEnvironment 0;
	[] spawn {sleep 3; ace_hearing_disableVolumeUpdate = false};

	// Fade in for map screen
	titleText ["", "BLACK IN", 1, true, false];
--------------------------------------------------------------------------------------------------*/