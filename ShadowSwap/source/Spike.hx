package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Spike extends FlxSprite
{
	public function new(?X:Float = 0, ?Y:Float = 0) {
		super(X, Y);
		makeGraphic(32, 32, FlxColor.GRAY);
		immovable = true;
	}
}
