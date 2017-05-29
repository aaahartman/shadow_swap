package;

import flixel.FlxState;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.text.FlxText;

class LevelExitState extends FlxState
{
	private var _star:FlxSprite;
	private var _swapText:FlxText;
	private var _numSwap:Int;
	private var _minSwap:Int;
	private var _counter:Int;
	private var _loop:Int;
	private var _curStars:Int;
	private var _numStars:Int;
	override public function create():Void
	{
		var _level:Int = Reg.getCurrentLevel();
		var _success:Bool = Reg.wasSuccessfulFinish();
		_numSwap = Reg.getNumSwap();
		_minSwap = Reg.getMinSwap(_level);

		if (_success)
		{
			Main.LOGGER.logLevelEnd({won: true});
			if (!Reg.islevelUnlocked(Reg.getCurrentLevel() + 1))
			{
				Reg.unlockLevel(Reg.getCurrentLevel() + 1);
			}
		}

		// Number of Swaps Text
		if (_success) 
		{
			_counter = _numSwap + 30;
		}
		else
		{
			_counter = _numSwap;
		}
		_swapText = new FlxText(0, 0, 0, "Swap Used: " + _counter, 20);
		_swapText.systemFont = "Arial Black";
		_swapText.screenCenter();
		_swapText.y -= 150;

		// Player can earn 1-3 stars upon completion of a level
		_star = new FlxSprite(50, 50);
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
		else {
			if (_numSwap <= _minSwap)
			{
				_numStars = 3;
			}	
			else if (_numSwap <= _minSwap + 3)
			{
				_numStars = 2;
			}
			else
			{
				_numStars = 1;
			}
			Reg.setStars(_level, _numStars);
			showOneStar();
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

	// count down function used for star animation & count down number of swaps
	private function countDown(timer:FlxTimer):Void
	{		    

		if (_counter > _loop) 
		{
		    _swapText.text = "Swap Used: " + _counter;
		    _counter --;
		}
		else
		{
			timer.cancel();
			_curStars++;
			if (_curStars == 1)
			{
				_star.loadGraphic(AssetPaths.Stars1__png, false, 70, 20);
				if (_numStars > 1) {
					showTwoStars();
				}
				else {
					_swapText.text = "Swap Used: " + _counter;
				}
			}
			else if (_curStars == 2)
			{
				_star.loadGraphic(AssetPaths.Stars2__png, false, 70, 20);
				if (_numStars > 2) {
					showThreeStars();
				}
				else 
				{
					_swapText.text = "Swap Used: " + _counter;
				}
			}
			else if (_curStars == 3) {
				_swapText.text = "Swap Used: " + _counter;
				_star.loadGraphic(AssetPaths.Stars3__png, false, 70, 20);
			}
		}
	}

	private function showOneStar():Void
	{
		_star.loadGraphic(AssetPaths.Stars0__png, false, 70, 20);
		_curStars = 0;
		if (_minSwap + 3 > _numSwap)
		{
			_loop = _minSwap + 3;
		}
		else
		{
			_loop = _numSwap;
		}
		new FlxTimer().start(0.001, countDown, 0);
	}

	private function showTwoStars():Void
	{
		if (_minSwap > _numSwap)
		{
			_loop = _minSwap;
		}
		else
		{
			_loop = _numSwap;
		}
		new FlxTimer().start(0.1, countDown, 0);
	}

	private function showThreeStars():Void
	{
		_loop = _numSwap;
		new FlxTimer().start(0.3, countDown, 0);
	}
}
