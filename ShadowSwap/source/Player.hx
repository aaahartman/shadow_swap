package;

import flixel.FlxSprite;
import flixel.system.FlxAssets;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.FlxObject;

class Player extends FlxSprite
{
	private var _is_shadow:Bool = false;
	public var speed:Float = 80;
	public var gravity:Float = 500;
	public var jump_speed:Float = 200;
	private var jump_duration:Float = -1;
	private var in_air:Bool = false;

    public function new(?X:Float=0, ?Y:Float=0, ?is_shadow:Bool)
    {
    	_is_shadow = is_shadow;
        super(X, Y);

        if (_is_shadow)
        	makeGraphic(8, 14, FlxColor.BLUE);
        else 
        	makeGraphic(8, 14, FlxColor.RED);
        
        drag.x = drag.y = 1600;
        acceleration.y = gravity;
    }

	override public function update(elapsed:Float):Void
	{
		// Swap between player and shadow if "S" is pressed
		var _swap:Bool = false;
		_swap = FlxG.keys.justPressed.S;
		if (_swap) {
			_is_shadow = !_is_shadow;

			// update player/shadow graphics
			if (_is_shadow)
        		makeGraphic(8, 14, FlxColor.BLUE);
        	else 
        		makeGraphic(8, 14, FlxColor.RED);
        }

        acceleration.x = 0;

        // move player only
		if (!_is_shadow)
	    	movement(elapsed);

	    super.update(elapsed);
	}

	private function movement(elapsed:Float):Void {
    	var _jump:Bool = false;
 		var _left:Bool = false;
 		var _right:Bool = false;

 		_jump = FlxG.keys.anyJustPressed([UP, W]);
 		_left = FlxG.keys.anyPressed([LEFT, A]);
 		_right = FlxG.keys.anyPressed([RIGHT, D]);

 		acceleration.x = 0;
 		in_air = !isTouching(FlxObject.FLOOR);

 		// negate if both left and right are pressed
 		if (_left && _right) {
      		_left = _right = false;
 		}

		if (_jump) {
			jump(elapsed);
		}

		if (_left) {
		    velocity.x = -speed;
		    acceleration.x = -drag.x;
		} else if (_right) {
			velocity.x = speed;
			acceleration.x = drag.x;
		}
	}

	private function jump(elapsed:Float):Void {
		if (!in_air) {
			velocity.y = -jump_speed;
		}
	}

	public function isShadow():Bool{
		return _is_shadow;
	}
	
}