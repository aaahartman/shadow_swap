package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Fan extends FlxSprite
{
	private var _id:Int = 0;
	private var _dir:Int = 0;
	private var _on:Bool = false;

	public function new(?X:Float = 0, ?Y:Float = 0, ?id:Int = 0, ?dir:Int = 0, ?on:Int = 0)
	{
		super(X, Y);
		makeGraphic(16, 16, FlxColor.ORANGE);
		immovable = true;
		_id = id;
		_dir = dir;
		_on = (on == 1);
	}

	public function getId():Int
	{
		return _id;
	}

	public function getDir():Int
	{
		return _dir;
	}

	public function isOn():Bool
	{
		return _on;
	}

	public function toggle():Void
	{
		_on = !_on;
	}
}