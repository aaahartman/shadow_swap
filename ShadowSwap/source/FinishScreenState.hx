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
		var _level = Reg.getCurrentLevel();
		var _numSwap = Reg.getNumSwap();
		var _minSwap = Reg.getMinSwap(_level);

		// Player can earn 1-3 stars upon completion of a level
		var _star = new FlxSprite(50, 50);
		_star.scale.x = 2;
		_star.scale.y = 2;
		_star.screenCenter();
		_star.y -= 100;
		_star.x -= 35;
		if (_numSwap <= _minSwap)
		{
			_star.loadGraphic(AssetPaths.Stars3__png, false, 70, 20);
			Reg.setStars(_level, 3);
		} 
		else if (_numSwap <= _minSwap + 3) 
		{
			_star.loadGraphic(AssetPaths.Stars2__png, false, 70, 20);
			Reg.setStars(_level, 2);
		}
		else 
		{
			_star.loadGraphic(AssetPaths.Stars1__png, false, 70, 20);
			Reg.setStars(_level, 1);
		}
		add(_star);

		// Congratulation Text
		var _text:FlxText = new FlxText(0, 0, 0, "Level " + Reg.getCurrentLevel() + " complete!", 40);
		_text.systemFont = "Arial Black";
		_text.screenCenter();
		_text.y -= 200;

		// Number of Swaps Text
		var _swapText:FlxText = new FlxText(0, 0, 0, "Swap Used: " + _numSwap, 20);
		_swapText.systemFont = "Arial Black";
		_swapText.screenCenter();
		_swapText.y -= 150;

		// Level Menu Button
		var _lvlBtn:FlxButton = new FlxButton(0, 0, "", lvl);
		_lvlBtn.loadGraphic(AssetPaths.lvlButton__png, true, 70, 50);
		_lvlBtn.screenCenter();
		_lvlBtn.x -= 100;

		// Next Level Button
		var _nxtBtn:FlxButton = new FlxButton(0, 0, "", nxt);
		_nxtBtn.loadGraphic(AssetPaths.nxtButton__png, true, 70, 50);
		_nxtBtn.screenCenter();
		_nxtBtn.x += 100;

 		add(_lvlBtn);
  		add(_nxtBtn);
 		add(_text);
 		add(_swapText);

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
