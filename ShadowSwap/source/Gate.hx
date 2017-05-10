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
		makeGraphic(32, 96, FlxColor.RED);
		immovable = true;
		_id = id;
	}

	public function getId():Int
	{
		return _id;
	}

	public function isRaised():Bool
	{
		return raised;
	}
	
	public function raiseGate():Void
	{
		if (!raised)
		{
			//this.y -= this.width;
			this.alpha = 0;
			raised = true;
		}
	}

	public function dropGate():Void
	{
		if (raised)
		{
			//this.y += this.width;
			this.alpha = 1;
			raised = false;
		}
	}
}