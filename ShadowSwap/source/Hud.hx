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
	//private var homeMenu:FlxButton;

	public function new(lv:Int) {
		super();
		background = new FlxSprite().makeGraphic(FlxG.width, 30, FlxColor.BLACK);
		background.drawRect(0, 29, FlxG.width, 1, FlxColor.WHITE);
		
		textLevel = new FlxText(0, 3, 0, "LV " + lv, 15);
		textLevel.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
		
		// Default setting: level does not have key.
		textKey = new FlxText(textLevel.width + 50, 3, 0, "Key", 15);
		keySlot = new FlxSprite(textLevel.width + 50 + textKey.width, 7);
		keySlot.makeGraphic(8, 8, FlxColor.BLACK);

		// Reset Button
		reset = new FlxButton(FlxG.width /2 , 5, "Reset (R)", resetState);

		// Level Selection Button
		levelMenu = new FlxButton(FlxG.width /2 + 50, 5, "Levels (L)", levelState);

		// Level Selection Button
		//homeMenu = new FlxButton(FlxG.width - 280, 5, "Home (H)", homeState);

		add(background);
		add(textLevel);
		add(textKey);
		add(keySlot);
		add(reset);
		add(levelMenu);
		//add(homeMenu);

		forEach(
			function(spr:FlxSprite) {
				spr.scrollFactor.set(0, 0);
		});
	}

	private function resetState():Void {
		FlxG.switchState(new PlayState());
	}

	private function levelState():Void {
		FlxG.switchState(new LevelSelectState());
	}

	//private function homeState():Void {
	//	FlxG.switchState(new SplashScreenState());
	//}

	public function setKey():Void {
		//keySlot.makeGraphic(8, 8, FlxColor.GRAY);
		keySlot.loadGraphic(AssetPaths.Key_slot__png, false, 32, 14);
	}

	public function updateHUD():Void {
		keySlot.loadGraphic(AssetPaths.Key_slot_filled__png, false, 32, 14);
	}
}