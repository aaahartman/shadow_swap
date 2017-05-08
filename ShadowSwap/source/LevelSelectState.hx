package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;

class LevelSelectState extends FlxState
{
	private var _btnPlay1:FlxButton;
	private var _btnPlay2:FlxButton;
	private var _btnPlay3:FlxButton;
	private var _btnPlay4:FlxButton;
	private var _btnPlay5:FlxButton;

	private var _text:FlxText;

	private static var _levels:Array<String>;

	private static var _levelName:String;
	private static var _levelNum:Int;

	override public function create():Void
	{
		
		//_levels = FileSystem.readDirectory("assets/data/levels");
		FlxG.log.redirectTraces = true;

		_levels = new Array();

		for (i in 0...7) {
			_levels[i] = "level" + i + ".oel";
			var _btn = new FlxButton(FlxG.width / 2 - 50, 50 + 25 * i, _levels[i]);
			_btn.onDown.callback = clickPlay.bind(i);
			add(_btn);
		}

		_text = new FlxText(20, 20, FlxG.width, "Select the Desired Level:", 16);

 		add(_text);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	private function clickPlay(_level:Int):Void
	{
		_levelNum = _level;

	    FlxG.switchState(new PlayState());
	}	

	public static function getLevelName():String 
	{
		return "assets/data/levels/" + _levels[_levelNum];
	}

	public static function getLevelNumber():Int
	{
		return _levelNum;
	}
}
