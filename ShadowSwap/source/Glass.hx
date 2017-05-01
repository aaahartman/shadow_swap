package;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;

class Glass extends FlxSprite
{
	public function new(?X:Float = 0, ?Y:Float = 0)
	{
		super(X, Y);
		makeGraphic(16, 16, FlxColor.CYAN);
		immovable = true;
		alpha = 1;
	}
	
	public function setAlpha(?new_alpha:Float = 0)
	{
		alpha = new_alpha;
	}
}