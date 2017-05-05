package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Switch extends FlxSprite
{
	private var _id:Int = 0;

	public function new(?X:Float = 0, ?Y:Float = 0, ?id:Int = 0)
	{
		super(X, Y);
		makeGraphic(16, 16, FlxColor.BROWN);
		immovable = true;
		_id = id;
	}

	public function getId():Int
	{
		return _id;
	}
}