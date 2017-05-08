package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;

class SplashScreenState extends FlxState
{
	private var _btnPlay:FlxButton;
	private var _text:FlxText;

	override public function create():Void
	{
		_text = new FlxText(20, 20, FlxG.width, "Shadow Swap", 32);
		_text.screenCenter();
		//_text.y += 20;
		_btnPlay = new FlxButton(0, 0, "Play", clickPlay);
		_btnPlay.screenCenter();
 		add(_btnPlay);
 		add(_text);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	private function clickPlay():Void
	{
	    FlxG.switchState(new LevelSelectState());
	}	
}
