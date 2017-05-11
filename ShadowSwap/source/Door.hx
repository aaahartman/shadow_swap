package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Door extends FlxSprite
{
	public function new(?X:Float = 0, ?Y:Float = 0, ?locked:Bool = true)
	{
		super(X, Y);
		loadGraphic(AssetPaths.Door__png, false, 32, 64);
		offset.y = 32;
		height = 32;
		immovable = true;
	}

	public function openDoor():Void 
	{
		loadGraphic(AssetPaths.Door_open__png, false, 32, 64);
	}
}