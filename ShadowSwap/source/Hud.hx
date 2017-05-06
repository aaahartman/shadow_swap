package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;
using flixel.util.FlxSpriteUtil;

class HUD extends FlxTypedGroup<FlxSprite> {
	
	private var background:FlxSprite;
	private var textLevel:FlxText;
	private var textKey:FlxText;
	private var keySlot:FlxSprite;
	private var reset:FlxButton;
	private var levelMenu:FlxButton;
	private var homeMenu:FlxButton;

	public function new(lv:Int) {
		super();
		background = new FlxSprite().makeGraphic(FlxG.width, 20, FlxColor.BLACK);
		background.drawRect(0, 19, FlxG.width, 1, FlxColor.WHITE);
		
		textLevel = new FlxText(0, 2, 0, "LV " + lv, 8);
		textLevel.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
		
		// Default setting: level does not have key.
		textKey = new FlxText(textLevel.width + 20, 2, 0, "Key", 8);
		keySlot = new FlxSprite(textLevel.width + 20 + textKey.width + 5, 5);
		keySlot.makeGraphic(8, 8, FlxColor.BLACK);

		// Reset Button
		reset = new FlxButton(FlxG.width - 70, 0, "Reset (R)", resetState);
		reset.scale.x = 0.7;
		reset.scale.y = 0.7;

		// Level Selection Button
		levelMenu = new FlxButton(FlxG.width - 140, 0, "Levels (L)", levelState);
		levelMenu.scale.x = 0.7;
		levelMenu.scale.y = 0.7;

		// Level Selection Button
		homeMenu = new FlxButton(FlxG.width - 210, 0, "Home (H)", homeState);
		homeMenu.scale.x = 0.7;
		homeMenu.scale.y = 0.7;

		add(background);
		add(textLevel);
		add(textKey);
		add(keySlot);
		add(reset);
		add(levelMenu);
		add(homeMenu);

		forEach(
			function(spr:FlxSprite) {
				spr.scrollFactor.set(0, 0);
		});
	}

	public function updateHUD():Void {
		keySlot.makeGraphic(8, 8, FlxColor.YELLOW);
	}

	private function resetState():Void {
		FlxG.switchState(new PlayState());
	}

	private function levelState():Void {
		FlxG.switchState(new LevelSelectState());
	}

	private function homeState():Void {
		FlxG.switchState(new SplashScreenState());
	}

	public function setKey():Void {
		keySlot.makeGraphic(8, 8, FlxColor.GRAY);
	}
}