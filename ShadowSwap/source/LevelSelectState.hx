package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import sys.FileSystem;

class LevelSelectState extends FlxState
{
	private var _btnPlay1:FlxButton;
	private var _btnPlay2:FlxButton;
	private var _btnPlay3:FlxButton;
	private var _btnPlay4:FlxButton;
	private var _btnPlay5:FlxButton;

	private var _text:FlxText;

	private var _levels:Array<String>;

	private static var _levelName:String;

	override public function create():Void
	{
		
		_levels = FileSystem.readDirectory("assets/data/levels");

		_text = new FlxText(20, 20, FlxG.width, "Select the Desired Level:", 16);

		var _counter:Int = 0;
		for (_level in _levels)
		{
			var _btn = new FlxButton(FlxG.width / 2 - 50, 50 + 25 * _counter, _level);
			_btn.onDown.callback = clickPlay.bind(_level);
			add(_btn);
			_counter++;
		}

 		add(_text);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	private function clickPlay(_level:String):Void
	{
		_levelName = _level;
	    FlxG.switchState(new PlayState());
	}	

	public static function getLevelName():String 
	{
		return "assets/data/levels/" + _levelName;
	}
}
