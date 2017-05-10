package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class VerticalGate extends Gate
{
	public function new(?X:Float = 0, ?Y:Float = 0, ?id:Int = 0)
	{
		super(X, Y, id);
		makeGraphic(32, 96, FlxColor.RED);
		immovable = true;
		_id = id;
	}
}