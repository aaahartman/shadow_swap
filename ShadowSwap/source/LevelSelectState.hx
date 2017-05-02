package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;

class LevelSelectState extends FlxState
{
	private var _btnPlay:FlxButton;
	private var _text:FlxText;

	override public function create():Void
	{
		_text = new FlxText(20, 20, "Select the Desired Level:", 16);
		_btnPlay = new FlxButton(0, 0, "Level 1", clickPlay);
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
	    FlxG.switchState(new PlayState());
	}	
}
