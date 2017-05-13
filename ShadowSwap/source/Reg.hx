package;

import flixel.util.FlxSave;

class Reg
{
	public static var gotKey:Bool = false;
	public static var currentGates:List<Gate> = new List<Gate>();

	public static var _save:FlxSave;

	public static function initSave():Void {
		// Initialize saving
		_save = new FlxSave();
		_save.bind("LevelProgression");

		// UNCOMMENT THIS LINE FOR DEVELOPMENT AND DEBUG!!!
		//_save.data.level = 20;
	}

	public static function saveLevel(_level:Int):Void {
    	_save.data.level = _level;
    	_save.flush();
	}

	//public static function saveStars():Void {}

	public static function loadLevel():Int {
    	return _save.data.level;
	}

	//public statuc function loadStars():Int {}
}
