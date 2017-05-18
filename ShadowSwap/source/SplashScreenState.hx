package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxSprite;

class SplashScreenState extends FlxState
{
	override public function create():Void
	{
		Reg.updateCurrentLevel(1);
		Reg.unlockLevel(1);

		var _background = new FlxSprite();
		_background.loadGraphic(AssetPaths.background__png);
		_background.screenCenter();

		var _text:FlxText = new FlxText(0, 0, 0, "SHADOW SWAP", 40);
		_text.systemFont = "Arial Black";
		_text.screenCenter();
		_text.y -= 50;

		var _btnPlay:FlxButton = new FlxButton(0, 0, "", clickPlay);
		_btnPlay.loadGraphic(AssetPaths.Play__png, true, 90, 50);
		_btnPlay.screenCenter();

		add(_background);
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
