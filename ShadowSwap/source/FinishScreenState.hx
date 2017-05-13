package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.text.FlxText;

class FinishScreenState extends FlxState
{
	override public function create():Void
	{
		var _star = new FlxSprite(50, 50);
		_star.loadGraphic(AssetPaths.Stars0__png, false, 70, 20);
		_star.screenCenter();
		_star.y -= 100;
		add(_star);

		var _text:FlxText = new FlxText(0, 0, 0, "Level " + Reg.getCurrentLevel() + " complete!", 40);
		_text.systemFont = "Arial Black";
		_text.screenCenter();

		_text.y -= 200;

		var _lvlBtn:FlxButton = new FlxButton(0, 0, "", lvl);
		_lvlBtn.loadGraphic(AssetPaths.lvlButton__png, true, 70, 50);

		var _nxtBtn:FlxButton = new FlxButton(0, 0, "", nxt);
		_nxtBtn.loadGraphic(AssetPaths.nxtButton__png, true, 70, 50);

		_lvlBtn.screenCenter();
		_lvlBtn.x -= 100;

		_nxtBtn.screenCenter();
		_nxtBtn.x += 100;

 		add(_lvlBtn);
  		add(_nxtBtn);
 		add(_text);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		// If pressed "M", go to Menu
		if (FlxG.keys.justPressed.M)
			lvl();

		// If pressed "Enter", go to next level
		if (FlxG.keys.justPressed.ENTER)
			nxt();
	}

	private function nxt():Void
	{	
		var nextLevelNum:Int = Reg.getCurrentLevel() + 1;
		if (!Reg.islevelUnlocked(nextLevelNum))
		{
			Reg.unlockLevel(nextLevelNum);
		}
		Reg.updateCurrentLevel(nextLevelNum);
		FlxG.switchState(new PlayState());

	}

	private function lvl():Void
	{		
		var nextLevelNum:Int = Reg.getCurrentLevel() + 1;
		if (!Reg.islevelUnlocked(nextLevelNum))
		{
			Reg.unlockLevel(nextLevelNum);
		}
	    FlxG.switchState(new LevelSelectState());
	}	
}
