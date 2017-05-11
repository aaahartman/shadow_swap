package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;

class LevelSelectState extends FlxState
{
	private var _text:FlxText;
	private static var _levelNum:Int;
	
	override public function create():Void 
	{

		flixel.FlxCamera.defaultZoom = 1;
		FlxG.cameras.reset();
		FlxG.camera.setSize(1080, 720);
		
		FlxG.log.redirectTraces = true;

		var _canvas = new FlxSprite();
		_canvas.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT, true);
		add(_canvas);
		_canvas.drawRect(FlxG.width / 2 - 220, 80, 120, 270, 0xff0f635f);
		_canvas.drawRect(FlxG.width / 2 - 70, 80, 120, 270, 0xff4c3c34);
		_canvas.drawRect(FlxG.width / 2 + 80, 80, 120, 270, 0xff937566);

		_canvas.drawRect(FlxG.width / 2 - 215, 85, 110, 260, FlxColor.BLACK);
		_canvas.drawRect(FlxG.width / 2 - 65, 85, 110, 260, FlxColor.BLACK);
		_canvas.drawRect(FlxG.width / 2 + 85, 85, 110, 260, FlxColor.BLACK);

		_canvas.drawRect(FlxG.width / 2 - 210, 90, 100, 250, 0xff0f635f);
		_canvas.drawRect(FlxG.width / 2 - 60, 90, 100, 250, 0xff4c3c34);
		_canvas.drawRect(FlxG.width / 2 + 90, 90, 100, 250, 0xff937566);

		// Stage 1 buttons
		for (i in 1...6) 
		{
			var _btn = new FlxButton(FlxG.width / 2 - 200, 50 + 50 * i, "Level " + i);
			_btn.onDown.callback = clickPlay.bind(i);
			_btn.loadGraphic("assets/images/ButtonBackdrop.png", true, 75, 27);
			add(_btn);
		}

		// Stage 2 buttons
		for (i in 6...11) 
		{
			var _btn = new FlxButton(FlxG.width / 2 - 50, 50 + 50 * (i - 5), "Level " + i);
			_btn.onDown.callback = clickPlay.bind(i);
			_btn.loadGraphic("assets/images/ButtonBackdrop2.png", true, 75, 27);
			add(_btn);
		}

		// Stage 3 buttons
		for (i in 11...16) 
		{
			var _btn = new FlxButton(FlxG.width / 2 + 100, 50 + 50 * (i - 10), "Level " + i);
			_btn.onDown.callback = clickPlay.bind(i);
			_btn.loadGraphic("assets/images/ButtonBackdrop3.png", true, 75, 27);
			add(_btn);
		}

		_text = new FlxText(FlxG.width / 2 - 70, 40, FlxG.width, "Select Level", 16);

 		add(_text);
		super.create();
	}

	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}

	private function clickPlay(_level:Int):Void 
	{
		_levelNum = _level;
		Main.LOGGER.logActionWithNoLevel(LoggingActions.CLICK_START,  {level:_levelNum});
	    FlxG.switchState(new PlayState());
	}	

	public static function getLevelNumber():Int 
	{
		return _levelNum;
	}

	public static function setLevelNumer(lv:Int):Void 
	{
		_levelNum = lv;
	}
}
