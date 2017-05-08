package;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;

class Glass extends FlxSprite
{
	private var _id:Int = 0;
	private var _on:Bool = false;
	public function new(?X:Float = 0, ?Y:Float = 0, ?id:Int = 0, ?on:Bool = false)
	{
		super(X, Y);
		makeGraphic(16, 16, FlxColor.CYAN);
		immovable = true;
		alpha = 1;
		_id = id;
		_on = on;
	}
	
	public function setAlpha(?new_alpha:Float = 0)
	{
		alpha = new_alpha;
	}

	public function getId():Int
	{
		return _id;
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