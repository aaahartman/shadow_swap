package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Gate extends FlxSprite
{
	private var _id:Int = 0;
	public var raised:Bool = false;

	public function new(?X:Float = 0, ?Y:Float = 0, ?id:Int = 0)
	{
		super(X, Y);
		makeGraphic(16, 64, FlxColor.GREEN);
		immovable = true;
		_id = id;
	}

	public function getId():Int
	{
		return _id;
	}

	public function raiseGate():Void
	{
		if (!raised)
		{
			this.y -= 16;
			raised = true;
		}
	}

	public function dropGate():Void
	{
		if (raised)
		{
			this.y += 16;
			raised = false;
		}
	}
}