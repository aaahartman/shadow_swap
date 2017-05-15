package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;
import flixel.group.FlxGroup;

class LevelSelectState extends FlxState
{
	override public function create():Void 
	{
		flixel.FlxCamera.defaultZoom = 1;
		FlxG.cameras.reset();
		FlxG.camera.setSize(800, 720);

		// Create a group to hold all the buttons
		var _btns:FlxTypedGroup<FlxButton> = new FlxTypedGroup<FlxButton>();

		var unlocked:Int = Reg.getNumUnlockedLevels();

		// Stage 1 buttons
		for (i in 1...6) 
		{
			// Create Button
			var _btn = new FlxButton(FlxG.width / 2 - 215, 130 + 90 * (i - 1), "" + i);
			_btn.onDown.callback = clickPlay.bind(i);
			_btn.loadGraphic("assets/images/levelButton1.png", true, 70, 50);
			_btn.label.systemFont = "Arial Black";
			_btn.label.size = 28;
			_btn.label.color = FlxColor.WHITE;

			// Lock levels
			if (i > unlocked) {
				_btn.active = false;
				_btn.alpha = 0.5;
			}

			_btns.add(_btn);

			// Handle Stars
			var numStar = Reg.getStars(i);
			var _star = new FlxSprite(FlxG.width / 2 - 215, 185 + 90 * (i - 1));
			if (numStar == 3)
				_star.loadGraphic(AssetPaths.Stars3__png, false, 70, 20);
			else if (numStar == 2)
				_star.loadGraphic(AssetPaths.Stars2__png, false, 70, 20);
			else if (numStar == 1)
				_star.loadGraphic(AssetPaths.Stars1__png, false, 70, 20);
			else
				_star.loadGraphic(AssetPaths.Stars0__png, false, 70, 20);

			add(_star);
		}

		// Stage 2 buttons
		for (i in 6...11) 
		{
			var _btn = new FlxButton(FlxG.width / 2 - 95, 130 + 90 * (i - 6), "" + i);
			_btn.onDown.callback = clickPlay.bind(i);
			_btn.loadGraphic("assets/images/levelButton2.png", true, 70, 50);
			_btn.label.systemFont = "Arial Black";
			_btn.label.size = 28;
			_btn.label.color = FlxColor.WHITE;
			
			// lock levels
			if (i > unlocked) {
				_btn.active = false;
				_btn.alpha = 0.5;
			}

			_btns.add(_btn);

			// Handle Stars
			var numStar = Reg.getStars(i);
			var _star = new FlxSprite(FlxG.width / 2 - 95, 185 + 90 * (i - 6));
			if (numStar == 3)
				_star.loadGraphic(AssetPaths.Stars3__png, false, 70, 20);
			else if (numStar == 2)
				_star.loadGraphic(AssetPaths.Stars2__png, false, 70, 20);
			else if (numStar == 1)
				_star.loadGraphic(AssetPaths.Stars1__png, false, 70, 20);
			else
				_star.loadGraphic(AssetPaths.Stars0__png, false, 70, 20);

			add(_star);
		}

		// Stage 3 buttons
		for (i in 11...16) 
		{
			var _btn = new FlxButton(FlxG.width / 2 + 25, 130 + 90 * (i - 11), "" + i);
			_btn.onDown.callback = clickPlay.bind(i);
			_btn.loadGraphic("assets/images/levelButton3.png", true, 70, 50);
			_btn.label.systemFont = "Arial Black";
			_btn.label.size = 28;
			_btn.label.color = FlxColor.WHITE;

			// lock levels
			if (i > unlocked) {
				_btn.active = false;
				_btn.alpha = 0.5;
			}

			_btns.add(_btn);

			// Handle Stars
			var numStar = Reg.getStars(i);
			var _star = new FlxSprite(FlxG.width / 2 + 25, 185 + 90 * (i - 11));
			if (numStar == 3)
				_star.loadGraphic(AssetPaths.Stars3__png, false, 70, 20);
			else if (numStar == 2)
				_star.loadGraphic(AssetPaths.Stars2__png, false, 70, 20);
			else if (numStar == 1)
				_star.loadGraphic(AssetPaths.Stars1__png, false, 70, 20);
			else
				_star.loadGraphic(AssetPaths.Stars0__png, false, 70, 20);

			add(_star);
		}

		// Stage 4 buttons
		for (i in 16...21)
		{
			var _btn = new FlxButton(FlxG.width / 2 + 145, 130 + 90 * (i - 16), "" + i);
			_btn.onDown.callback = clickPlay.bind(i);
			_btn.loadGraphic("assets/images/levelButton4.png", true, 70, 50);
			_btn.label.systemFont = "Arial Black";
			_btn.label.size = 28;
			_btn.label.color = FlxColor.WHITE;

			// lock levels
			if (i > unlocked) {
				_btn.active = false;
				_btn.alpha = 0.5;
			}	

			_btns.add(_btn);

			// Handle Stars
			var numStar = Reg.getStars(i);
			var _star = new FlxSprite(FlxG.width / 2 + 145, 185 + 90 * (i - 16));
			if (numStar == 3)
				_star.loadGraphic(AssetPaths.Stars3__png, false, 70, 20);
			else if (numStar == 2)
				_star.loadGraphic(AssetPaths.Stars2__png, false, 70, 20);
			else if (numStar == 1)
				_star.loadGraphic(AssetPaths.Stars1__png, false, 70, 20);
			else
				_star.loadGraphic(AssetPaths.Stars0__png, false, 70, 20);

			add(_star);		
		}

		var _text:FlxText = new FlxText(FlxG.width / 2 - 80, 80, FlxG.width, " Level Menu", 25);
		_text.systemFont = "Arial Black";

 		add(_text);
 		add(_btns);
		super.create();
	}

	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}

	private function clickPlay(_level:Int):Void 
	{
		Reg.updateCurrentLevel(_level);
		Main.LOGGER.logActionWithNoLevel(LoggingActions.CLICK_START,  {level:_level});
	    FlxG.switchState(new PlayState());
	}
}
