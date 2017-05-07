package;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxObject;

class Switch extends FlxSprite
{
	private var _id:Int = 0;
	private var _pressed:Bool = false;
	private var _controlFan:Bool = false;
	private var _on:Bool = false;

	public function new(?X:Float = 0, ?Y:Float = 0, ?id:Int = 0, ?controlFan:Int = 0, ?on:Int = 0)
	{
		super(X, Y);
		//makeGraphic(16, 16, FlxColor.WHITE);
		loadGraphic(AssetPaths.Switch__png, false, 32, 32);

		// Switch on left when turned on, right when turned off 
		setFacingFlip(FlxObject.LEFT, false, false);
        setFacingFlip(FlxObject.RIGHT, true, false);

		immovable = true;
		_id = id;
		_controlFan = (controlFan == 1);
		_on = (on == 1);

		if(_on) {
			facing = FlxObject.LEFT;
		} else {
			facing = FlxObject.RIGHT;
		}
	}

	public function getId():Int
	{
		return _id;
	}

	public function controlFan():Bool
	{
		return _controlFan;
	}

	public function on():Bool
	{
		return _on;
	}

	public function toggleSwitch():Void
	{
		_on = !_on;

		if(_on) {
			facing = FlxObject.LEFT;
		} else {
			facing = FlxObject.RIGHT;
		}

	}

	public function isPressed():Bool
	{
		return _pressed;
	}

	public function stepOn():Void
	{
		_pressed = true;
	}

	public function stepOff():Void
	{
		_pressed = false;
	}
}