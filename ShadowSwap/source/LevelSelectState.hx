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
	private var _text:FlxText;
	private static var _levelNum:Int;
	private static var _levelUnlocked:Int;
	private var _btns:FlxTypedGroup<FlxButton>;
	
	override public function create():Void 
	{
		// Initialize Playable Levels
		if (Reg._save.data.level != null)
			_levelUnlocked = Reg.loadLevel();
		else 
			_levelUnlocked = 1;


		flixel.FlxCamera.defaultZoom = 1;
		FlxG.cameras.reset();
		FlxG.camera.setSize(1080, 720);
		

		// Create transparent canvas for drawing
		var _canvas = new FlxSprite();
		_canvas.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT, true);
		add(_canvas);

		// Color border 
		_canvas.drawRect(FlxG.width / 2 - 270, 130, 120, 380, 0xff86cc9b);
		_canvas.drawRect(FlxG.width / 2 - 130, 130, 120, 380, 0xff0f635f);
		_canvas.drawRect(FlxG.width / 2 + 10, 130, 120, 380, 0xff4c3c34);
		_canvas.drawRect(FlxG.width / 2 + 150, 130, 120, 380, 0xff937566);

		// black border
		_canvas.drawRect(FlxG.width / 2 - 265, 135, 110, 370, FlxColor.BLACK);
		_canvas.drawRect(FlxG.width / 2 - 125, 135, 110, 370, FlxColor.BLACK);
		_canvas.drawRect(FlxG.width / 2 + 15, 135, 110, 370, FlxColor.BLACK);
		_canvas.drawRect(FlxG.width / 2 + 155, 135, 110, 370, FlxColor.BLACK);

		// Color background
		_canvas.drawRect(FlxG.width / 2 - 260, 140, 100, 360, 0xff86cc9b);
		_canvas.drawRect(FlxG.width / 2 - 120, 140, 100, 360, 0xff0f635f);
		_canvas.drawRect(FlxG.width / 2 + 20, 140, 100, 360, 0xff4c3c34);
		_canvas.drawRect(FlxG.width / 2 + 160, 140, 100, 360, 0xff937566);


		// Create a group to hold all the buttons
		_btns = new FlxTypedGroup<FlxButton>();

		// Stage 1 buttons
		for (i in 1...6) 
		{
			var _btn = new FlxButton(FlxG.width / 2 - 250, 150 + 70 * (i - 1), "Level " + i);
			_btn.onDown.callback = clickPlay.bind(i);
			_btn.loadGraphic("assets/images/ButtonBackdrop.png", true, 75, 27);

			// lock levels
			if (i > _levelUnlocked) {
				_btn.active = false;
				_btn.alpha = 0.5;
			}

			_btns.add(_btn);
		}

		// Stage 2 buttons
		for (i in 6...11) 
		{
			var _btn = new FlxButton(FlxG.width / 2 - 110, 150+ 70 * (i - 6), "Level " + i);
			_btn.onDown.callback = clickPlay.bind(i);
			_btn.loadGraphic("assets/images/ButtonBackdrop2.png", true, 75, 27);
			
			// lock levels
			if (i > _levelUnlocked) {
				_btn.active = false;
				_btn.alpha = 0.5;
			}

			_btns.add(_btn);
		}

		// Stage 3 buttons
		for (i in 11...16) 
		{
			var _btn = new FlxButton(FlxG.width / 2 + 30, 150 + 70 * (i - 11), "Level " + i);
			_btn.onDown.callback = clickPlay.bind(i);
			_btn.loadGraphic("assets/images/ButtonBackdrop3.png", true, 75, 27);

			// lock levels
			if (i > _levelUnlocked) {
				_btn.active = false;
				_btn.alpha = 0.5;
			}

			_btns.add(_btn);
		}

		// Stage 4 buttons
		for (i in 16...21)
		{
			var _btn = new FlxButton(FlxG.width / 2 + 170, 150 + 70 * (i - 16), "Level " + i);
			_btn.onDown.callback = clickPlay.bind(i);
			_btn.loadGraphic("assets/images/ButtonBackdrop3.png", true, 75, 27);

			// lock levels
			if (i > _levelUnlocked) {
				_btn.active = false;
				_btn.alpha = 0.5;
			}	

			_btns.add(_btn);		
		}

		_text = new FlxText(FlxG.width / 2 - 80, 90, FlxG.width, " Level Menu", 25);
		_text.systemFont = "Arial Black";
		//_text.bold = true;

 		add(_text);
 		add(_btns);
		super.create();
	}

	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		// lock or unlock buttons based on levels
		var btns_iter:FlxTypedGroupIterator<FlxButton> = _btns.iterator();
		var index = 1;
		while (btns_iter.hasNext()) {
			var curButton:FlxButton = btns_iter.next();
			if (index <= _levelUnlocked) {
				curButton.active = true;
				curButton.alpha = 1.0;

				index++;
			} else {
				break;
			}
		}
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

	public static function updateLevelUnlocked(lv:Int):Void 
	{
		_levelUnlocked = lv;
	}
}
