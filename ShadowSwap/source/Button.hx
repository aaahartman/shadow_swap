package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Button extends FlxSprite
{
	public function new(?X:Float = 0, ?Y:Float = 0, ?locked:Bool = true)
	{
		super(X, Y);
		makeGraphic(16, 16, FlxColor.ORANGE);
		immovable = true;
	}
}