
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
						/* 1 */						AssetPaths._l1__oel,
						/* 2 */						AssetPaths._l2__oel,
						/* 3 */						AssetPaths._l3__oel,
						/* 4 */						AssetPaths._l4__oel,
						/* 5 */						AssetPaths._l5__oel,
						/* 6 */						AssetPaths._l6__oel,
						/* 7 */						AssetPaths._l7__oel,
						/* 8 */						AssetPaths._l9__oel,
						/* 9 */						AssetPaths._l11__oel,
						/* 10 */					AssetPaths._l10__oel,
						/* 11 */					AssetPaths._l12__oel,
						/* 12 */					AssetPaths._l14__oel,
						/* 13 */					AssetPaths._l13__oel,
						/* 14 */					AssetPaths._l15__oel,
						/* 15 */					AssetPaths.fan_backup__oel,
						/* 16 */					AssetPaths._l16__oel,
						/* 17 */					AssetPaths._l17__oel,
						/* 18 */					AssetPaths._l18__oel,
						/* 19 */					AssetPaths._l19__oel,
						/* 20 */					AssetPaths._l20__oel
												];

	public static function getLevel(_levelIndex):Dynamic
	{
		return _levels[_levelIndex - 1];
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

		if (_numUnlockedLevels > 20)
			_numUnlockedLevels = 20;

		// Initialize Personal Swap Record (Level 0 does not exist)

		// *** Uncomment these two lines to reset all stars to 0
		// _save.data.stars = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		// _save.flush();

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
		_minSwaps = [0, 1, 1, 3, 4, 5, 2, 4, 3, 8, 5, 5, 1, 1, 6, 3, 8, 3, 6, 11, 10];

		// *** UNCOMMENT THIS LINE TO RESET UNLOCKED TO 1
		// _numUnlockedLevels = 1;
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

	public static function resetKey():Void
	{
		key = false;
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

	public static function setCurrentLevel(level:Int):Void
	{
		_currentLevelNum = level;
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
