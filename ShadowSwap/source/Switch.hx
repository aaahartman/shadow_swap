package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Switch extends FlxSprite
{
	public function new(?X:Float = 0, ?Y:Float = 0)
	{
		super(X, Y);
		makeGraphic(16, 16, FlxColor.BROWN);
		immovable = true;
	}
}