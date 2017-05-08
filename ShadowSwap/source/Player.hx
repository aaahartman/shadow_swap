package;

import flixel.FlxSprite;
import flixel.system.FlxAssets;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.FlxObject;

class Player extends FlxSprite
{
	public var default_speed:Float = 0;
	public var speed:Float = 120;
	public var gravity:Float = 800;
	public var jump_speed:Float = 300;
	private var jump_duration:Float = -1;
	private var in_air:Bool = false;

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
        makeGraphic(16, 16, FlxColor.RED);
        acceleration.y = gravity;
    }

	public function setDefaultSpeed(?speed:Float = 0)
	{
		default_speed = speed;
	}

	override public function update(elapsed:Float):Void
	{
        // acceleration.x = 0;

        var _jump:Bool = false;
 		var _left:Bool = false;
 		var _right:Bool = false;

 		_jump = FlxG.keys.anyJustPressed([UP, W]);
 		_left = FlxG.keys.anyPressed([LEFT, A]);
 		_right = FlxG.keys.anyPressed([RIGHT, D]);

 		// acceleration.x = 0;
 		in_air = !isTouching(FlxObject.FLOOR);

 		if (_left && _right) 
 		{
      		_left = _right = false;
 		}

		if (_jump) 
		{		
			if (!in_air) 
			{
				velocity.y = -jump_speed;
			}
		}

		velocity.x = default_speed;
		if (_left) 
		{
		    velocity.x = -speed;
		}

		if (_right) 
		{
			velocity.x = speed;
		}

	    super.update(elapsed);
	}
}