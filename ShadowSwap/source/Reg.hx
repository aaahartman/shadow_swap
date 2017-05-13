
// this was at the beginning of level select state

// if (Reg._save.data.level != null)
// 	_levelUnlocked = Reg.loadLevel();
// else 
// 	_levelUnlocked = 1;


package;

import flixel.util.FlxSave;

class Reg
{
	public static var gotKey:Bool = false;
	public static var currentGates:List<Gate> = new List<Gate>();

	public static var _save:FlxSave;

	private static var currentLevelNum:Int;
	private static var numUnlockedLevels:Int;

	public static function initSave():Void 
	{
		// Initialize saving
		_save = new FlxSave();
		_save.bind("LevelProgression");

		// Initialize Playable Levels
		if (Reg._save.data.level != null)
			numUnlockedLevels = _save.data.level;
		else 
			numUnlockedLevels = 1;

		// UNCOMMENT THIS LINE FOR DEVELOPMENT AND DEBUG!!!
		//numUnlockedLevels = 20;
	}

	// Save new player progression
	public static function unlockLevel(levelNumToUnlock:Int):Void 
	{
		if (levelNumToUnlock > numUnlockedLevels) {
			numUnlockedLevels = levelNumToUnlock;
			_save.data.level = levelNumToUnlock;
    		_save.flush();
    	}
	}

	public static function getCurrentLevel():Int 
	{
		return currentLevelNum;
	}

	public static function getNumUnlockedLevels():Int
	{
		return numUnlockedLevels;
	}

	public static function islevelUnlocked(queryLevel:Int):Bool 
	{
		return queryLevel <= numUnlockedLevels;
	}	

	public static function updateCurrentLevel(newLevelNum:Int):Void
	{
		currentLevelNum = newLevelNum;
	}

	//public static function saveStars():Void {}
	//public statuc function loadStars():Int {}
}
