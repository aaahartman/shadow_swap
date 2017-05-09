package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Fan extends FlxSprite
{
	private var _id:Int = 0;
	private var _dir:Int = 0;

	public function new(?X:Float = 0, ?Y:Float = 0, ?id:Int = 0, ?dir:Int = 0)
	{
		super(X, Y);
		makeGraphic(32, 32, FlxColor.ORANGE);
		immovable = true;
		_id = id;
		_dir = dir;
	}

	public function getId():Int
	{
		return _id;
	}

	public function getDir():Int
	{
		return _dir;
	}
}