package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class HorizontalGate extends Gate
{
	public function new(?X:Float = 0, ?Y:Float = 0, ?id:Int = 0)
	{
		super(X, Y, id);
		makeGraphic(96, 32, FlxColor.RED);
		immovable = true;
		_id = id;
	}
}