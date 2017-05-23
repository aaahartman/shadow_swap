package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.text.FlxText;

class LevelExitState extends FlxState
{
	override public function create():Void
	{
		var _success:Bool = Reg.wasSuccessfulFinish();
		var _level:Int = Reg.getCurrentLevel();
		var _numSwap:Int = Reg.getNumSwap();
		var _minSwap:Int = Reg.getMinSwap(_level);


		if (_success)
		{
			Main.LOGGER.logLevelEnd({won: true});
			if (!Reg.islevelUnlocked(Reg.getCurrentLevel() + 1))
			{
				Reg.unlockLevel(Reg.getCurrentLevel() + 1);
			}
		}

		// Player can earn 1-3 stars upon completion of a level
		var _star = new FlxSprite(50, 50);
		_star.scale.x = 2;
		_star.scale.y = 2;
		_star.screenCenter();
		_star.y -= 100;
		_star.x -= 35;
		if (!_success)
		{
			_star.loadGraphic(AssetPaths.Stars0__png, false, 70, 20);
			//_star.alpha = 0.2;
		}
		else if (_numSwap <= _minSwap)
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
		var _text:FlxText = new FlxText(0, 0, 0, "Level " + Reg.getCurrentLevel() + " failed!", 40);
		if (_success)
		{
			_text = new FlxText(0, 0, 0, "Level " + Reg.getCurrentLevel() + " complete!", 40);
		}
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

		var _replayBtn:FlxButton = new FlxButton(0, 0, "", replay);
		_replayBtn.loadGraphic(AssetPaths.replayButton__png, true, 70, 50);
		_replayBtn.screenCenter();

		// Next Level Button
		var _nxtBtn:FlxButton = new FlxButton(0, 0, "", nxt);
		_nxtBtn.loadGraphic(AssetPaths.nxtButton__png, true, 70, 50);
		_nxtBtn.screenCenter();
		_nxtBtn.x += 100;

		if (!_success)
		{
			_nxtBtn.active = false;
			_nxtBtn.alpha = 0.5;
		}

 		add(_lvlBtn);
  		add(_nxtBtn);
  		add(_replayBtn);
 		add(_text);
 		add(_swapText);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		// If pressed "M", go to Menu
		if (FlxG.keys.justPressed.M)
		{
			lvl();
		}

		if (FlxG.keys.justPressed.R)
		{
			replay();
		}

		// If pressed "Enter", go to next level
		if (FlxG.keys.justPressed.ENTER)
		{
			if(Reg.wasSuccessfulFinish())
				nxt();
		}
	}

	private function replay():Void
	{
		Reg.updateCurrentLevel(Reg.getCurrentLevel());
		FlxG.switchState(new PlayState());
	}

	private function nxt():Void
	{
		Reg.updateCurrentLevel(Reg.getCurrentLevel() + 1);
		FlxG.switchState(new PlayState());
	}

	private function lvl():Void
	{
	    FlxG.switchState(new LevelSelectState());
	}
}
