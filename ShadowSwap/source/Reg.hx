
// this was at the beginning of level select state

// if (Reg._save.data.level != null)
// 	_levelUnlocked = Reg.loadLevel();
// else 
// 	_levelUnlocked = 1;


package;

import flixel.util.FlxSave;

class Reg
{
	private static var key:Bool = false;

	public static var _save:FlxSave;

	private static var _currentLevelNum:Int = 1;
	private static var _numUnlockedLevels:Int = 1;

	private static var _minSwaps:Array<Int>;
	private static var _starRecord:Array<Int>;
	private static var _currentSwap:Int = 0;

	private static var _finishedCurrentLevel:Bool = false;
	private static var _levels:Array<Dynamic> = [
													AssetPaths._l1__oel,
													AssetPaths._l2__oel,
													AssetPaths._l3__oel,
													AssetPaths._l4__oel,
													AssetPaths._l5__oel,
													AssetPaths._l6__oel,
													AssetPaths._l7__oel,
													AssetPaths._l9__oel,
													AssetPaths._l10__oel,
													AssetPaths._l11__oel,
													AssetPaths._l12__oel,
													AssetPaths._l13__oel,
													AssetPaths._l14__oel,
													AssetPaths._l15__oel,
													AssetPaths.fan_playground__oel,
													AssetPaths._l17__oel,
													AssetPaths._l18__oel,
													AssetPaths._l19__oel,
													AssetPaths._l20__oel,
													AssetPaths.hard_lvl__oel
												];

	public static function getLevel(_levelIndex):Dynamic
	{
		return _levels[_levelIndex];
	}

	public static function numberOfLevels():Int
	{
		return _levels.length;
	}

	public static function initSave():Void 
	{
		// Initialize saving
		_save = new FlxSave();
		_save.bind("LevelProgression");

		// Initialize Playable Levels
		if (Reg._save.data.level != null)
			_numUnlockedLevels = _save.data.level;
		else 
			_numUnlockedLevels = 1;

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
		// _numUnlockedLevels = 20;
	}

	public static function wasSuccessfulFinish():Bool
	{
		return _finishedCurrentLevel;
	}

	public static function logSuccessfulFinish():Void
	{
		_finishedCurrentLevel = true;
	}

	public static function playerNewStart():Void
	{
		_finishedCurrentLevel = false;
	}

	public static function playerHasKey():Bool
	{
		return key;
	}

	public static function grabKey():Void
	{
		key = true;	
	}

	// Save new player progression
	public static function unlockLevel(levelNumToUnlock:Int):Void 
	{
		if (levelNumToUnlock > _numUnlockedLevels) {
			_numUnlockedLevels = levelNumToUnlock;
			_save.data.level = levelNumToUnlock;
    		_save.flush();
    	}
	}

	public static function getCurrentLevel():Int 
	{
		return _currentLevelNum;
	}

	public static function getNumUnlockedLevels():Int
	{
		return _numUnlockedLevels;
	}

	public static function islevelUnlocked(queryLevel:Int):Bool 
	{
		return queryLevel <= _numUnlockedLevels;
	}	

	public static function updateCurrentLevel(newLevelNum:Int):Void
	{
		_currentLevelNum = newLevelNum;
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
		if (newStars > _starRecord[level]) 
		{
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
