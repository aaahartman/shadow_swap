package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

class EndCredit extends FlxState
{
	private var levelMenu:FlxButton;
	private var _text:FlxText;
	private var _text2:FlxText;
	private var _text3:FlxText;
	private var _player:FlxSprite;
	private var _ground:FlxTypedGroup<FlxSprite>;

	override public function create():Void
	{
		_text = new FlxText(0, 0, 0, "CONGRATULATION!", 25);
		_text.systemFont = "Arial Black";
		_text.color = FlxColor.WHITE;
		_text.screenCenter();
		_text.y -= 130;

		_text2 = new FlxText(0, 0, 0, "YOU'VE FINISHED THE GAME!!", 20);
		_text2.systemFont = "Arial Black";
		_text2.screenCenter();
		_text2.y -= 90;

		_player = new FlxSprite();
		_player.loadGraphic(AssetPaths.White_spritesheet2__png, true, 32, 32);
		_player.screenCenter();
		_player.y -=32;
		_player.animation.add("move", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 14, true);
		_player.animation.play("move");

		_ground = new FlxTypedGroup<FlxSprite>();
		for (i in -1...2) {
			var ground = new FlxSprite();
			ground.loadGraphic(AssetPaths.Ground__png, true, 32, 32);
			ground.screenCenter();
			ground.x += i * 32;
			_ground.add(ground);
		}	

		_text3 = new FlxText(0, 0, 0, "Created by\nAndrew Hartman\nTing Cheng\nYina Zhu", 15);
		_text3.systemFont = "Arial Black";
		_text3.alignment = ("center");
		_text3.screenCenter();
		_text3.color = FlxColor.GRAY;
		_text3.y += 85;

		// Level Selection Button
		levelMenu = new FlxButton(0, 0, "", levelState);
		levelMenu.screenCenter();
		levelMenu.y += 155;
		levelMenu.x += 15;
		levelMenu.loadGraphic(AssetPaths.Menu__png, true, 50, 30);
 		
		add(_text);
		add(_text2);
		add(_text3);
		add(_player);
		add(_ground);
 		add(levelMenu);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	private function levelState():Void
	{
	    FlxG.switchState(new LevelSelectState());
	}	
}