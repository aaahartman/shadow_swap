
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

		// UNCOMMENT THIS LINE FOR DEVELOPMENT AND DEBUG!!!
		_save.data.level = 20;
	}

	public static function saveLevel(_level:Int):Void 
	{
    	_save.data.level = _level;
    	_save.flush();
	}

	//public static function saveStars():Void {}

	public static function loadLevel():Int 
	{
    	return _save.data.level;
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

	public static function unlockLevel(levelNumToUnlock:Int):Void 
	{
		numUnlockedLevels = levelNumToUnlock;
	}

	public static function updateCurrentLevel(newLevelNum:Int):Void
	{
		currentLevelNum = newLevelNum;
	}

	//public statuc function loadStars():Int {}
}
