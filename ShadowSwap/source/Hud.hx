package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;
using flixel.util.FlxSpriteUtil;
import flixel.system.FlxAssets;

class HUD extends FlxTypedGroup<FlxSprite> 
{
	
	private var background:FlxSprite;
	private var textLevel:FlxText;
	private var textKey:FlxText;
	private var keySlot:FlxSprite;
	private var reset:FlxButton;
	private var levelMenu:FlxButton;

	public function new(lv:Int) 
	{

		super();
		background = new FlxSprite().makeGraphic(FlxG.width, 34, FlxColor.BLACK);
		background.drawRect(0, 33, FlxG.width, 1, FlxColor.WHITE);
		
		textLevel = new FlxText(0, 0, 0, "Lv " + lv, 21);
		textLevel.systemFont = "Arial Black";
		//textLevel.bold = true;
		
		// Default setting: level does not have key.
		textKey = new FlxText(textLevel.width + 50, 0, 0, "Key", 21);
		textKey.systemFont = "Arial Black";
		//textKey.bold = true;

		keySlot = new FlxSprite(textLevel.width + 50 + textKey.width, 10);
		keySlot.makeGraphic(8, 8, FlxColor.BLACK);

		// Reset Button
		var offset = textLevel.width + 100 + textKey.width + keySlot.width + 50;
		reset = new FlxButton(offset, 2, "", resetState);
		reset.loadGraphic(AssetPaths.Reset__png, true, 50, 30);

		// Level Selection Button
		levelMenu = new FlxButton(offset + 100, 2, "", levelState);
		levelMenu.loadGraphic(AssetPaths.Menu__png, true, 50, 30);

		add(background);
		add(textLevel);
		add(textKey);
		add(keySlot);
		add(reset);
		add(levelMenu);

		forEach(
			function(spr:FlxSprite) 
			{
				spr.scrollFactor.set(0, 0);
			}
		);
	}

	private function resetState():Void 
	{
		FlxG.switchState(new PlayState());
	}

	private function levelState():Void 
	{
		FlxG.switchState(new LevelSelectState());
	}

	public function setKey():Void 
	{
		keySlot.loadGraphic(AssetPaths.Key_slot__png, false, 32, 14);
	}

	public function updateHUD():Void 
	{
		keySlot.loadGraphic(AssetPaths.Key_slot_filled__png, false, 32, 14);
	}
}