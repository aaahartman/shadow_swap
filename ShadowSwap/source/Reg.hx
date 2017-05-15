
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

	private static var _minSwaps:Array<Int>;
	private static var _starRecord:Array<Int>;
	private static var _currentSwap:Int;

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

		// Initialize Personal Swap Record (Level 0 does not exist)

		// *** Uncomment these two lines to reset all stars to 0
		//_save.data.stars = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		//_save.flush();

		if (Reg._save.data.stars != null) {
			_starRecord = _save.data.stars;
		} else {
			_starRecord = new Array<Int>();
			for (i in 0...15)
				_starRecord.push(0);
			_save.data.stars = new Array();
			_save.data.stars = _starRecord;

			_save.flush();
		}

		// Initialize the minimun swaps of all levels
		_minSwaps = new Array<Int>();
		_minSwaps = [0, 1, 1, 3, 5, 5, 2, 0, 3, 7, 0, 2, 1, 6, 6, 0, 0, 8, 10, 10];

		// *** UNCOMMENT THIS LINE FOR DEVELOPMENT AND DEBUG!!!
		// numUnlockedLevels = 20;
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

	public static function getNumSwap():Int
	{
		return _currentSwap;
	}

	public static function setNumSwap(numSwap:Int):Void
	{
		_currentSwap = numSwap;
	}

	public static function getMinSwap(level:Int):Int
	{
		return _minSwaps[level];
	}

	public static function setStars(level:Int, newStars:Int):Void 
	{
		if (newStars > _starRecord[level]) {
			_starRecord[level] = newStars;
			_save.data.stars[level] = newStars;
    		_save.flush();
    	}
	}

	public static function getStars(level:Int):Int 
	{
		return _starRecord[level];
	}
}
