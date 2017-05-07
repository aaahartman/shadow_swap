package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Door extends FlxSprite
{
	public function new(?X:Float = 0, ?Y:Float = 0, ?locked:Bool = true)
	{
		super(X, Y);
		if (locked) {
			//makeGraphic(16, 16, FlxColor.BROWN);
			loadGraphic(AssetPaths.Door__png, false, 32, 56);
			offset.y = 32;
			height = 32;
		} else {
			makeGraphic(16, 16, FlxColor.ORANGE);
		}
		immovable = true;
	}
}