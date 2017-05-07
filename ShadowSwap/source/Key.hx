package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Key extends FlxSprite
{
	public function new(?X:Float = 0, ?Y:Float = 0)
	{
		super(X, Y);
		//makeGraphic(16, 16, FlxColor.YELLOW);
		loadGraphic(AssetPaths.Key__png, false, 15, 28);
		immovable = true;
	}
	override public function kill():Void
	{
		super.kill();
		Reg.gotKey = true;
	}
}
