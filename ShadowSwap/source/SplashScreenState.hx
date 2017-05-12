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
		_text = new FlxText(0, 0, 0, "SHADOW SWAP", 32);
		_text.systemFont = "Arial Black";
		//_text.bold = true;
		_text.screenCenter();
		_text.y -= 50;

		_btnPlay = new FlxButton(0, 0, "", clickPlay);
		_btnPlay.loadGraphic(AssetPaths.Play__png, true, 90, 50);
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
