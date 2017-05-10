package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Button extends FlxSprite
{
	private var _id:Int = 0;
	private var pressed:Bool = false;

	public function new(?X:Float = 0, ?Y:Float = 0, ?id:Int = 0)
	{
		super(X, Y);
		//makeGraphic(16, 16, FlxColor.ORANGE);
		loadGraphic(AssetPaths.Button__png, false, 32, 32);
		height = 16;
		immovable = true;
		_id = id;
	}
	
	public function getId():Int
	{
		return _id;
	}

	public function buttonPressed():Void {
		pressed = true;
		loadGraphic(AssetPaths.Button_Pressed__png, false, 32, 32);
	}

	public function buttonReleased():Void {
		if (pressed) {
			pressed = false;
			loadGraphic(AssetPaths.Button__png, false, 32, 32);
		}
	}
}