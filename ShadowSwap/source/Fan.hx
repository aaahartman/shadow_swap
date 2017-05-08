package;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxObject;

class Fan extends FlxSprite
{
	private var _id:Int = 0;
	private var _dir:Int = 0;
	private var _on:Bool = false;

	public function new(?X:Float = 0, ?Y:Float = 0, ?id:Int = 0, ?dir:Int = 0, ?on:Int = 0)
	{
		super(X, Y);
		makeGraphic(16, 48, FlxColor.ORANGE);
        setFacingFlip(FlxObject.LEFT, true, true);
        setFacingFlip(FlxObject.RIGHT, true, true);
        setFacingFlip(FlxObject.UP, true, true);
        setFacingFlip(FlxObject.DOWN, true, true);
		switch(dir) {
			case 0:
				angle = 0;
				facing = FlxObject.UP;
			case 1:
				angle = 90;
				facing = FlxObject.RIGHT;
			case 2:
				angle = 180;
	   			facing = FlxObject.DOWN;
			case 3:
				angle = 270;
				facing = FlxObject.LEFT;
		}
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