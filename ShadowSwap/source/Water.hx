package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Water extends FlxSprite
{
	public function new(?X:Float = 0, ?Y:Float = 0) {
		super(X, Y);
		loadGraphic(AssetPaths.Water__png, false, 32, 32);
		immovable = true;
	}
}
