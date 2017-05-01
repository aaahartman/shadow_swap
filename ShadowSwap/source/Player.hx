package;

import flixel.FlxSprite;
import flixel.system.FlxAssets;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxPoint;

class Player extends FlxSprite
{
	private var _is_shadow:Bool = false;
	public var speed:Float = 200;
	public var gravity:Float = 200;
	public var jump_speed:Float = 200;
	private var jump_duration:Float = -1;

    public function new(?X:Float=0, ?Y:Float=0, ?is_shadow:Bool)
    {
    	_is_shadow = is_shadow;
        super(X, Y);

        if (_is_shadow)
        	makeGraphic(8, 14, FlxColor.BLUE);
        else 
        	makeGraphic(8, 14, FlxColor.RED);
        
        drag.x = drag.y = 1600;
    }

	override public function update(elapsed:Float):Void
	{
		// Swap between player and shadow if "S" is pressed
		var _swap:Bool = false;
		_swap = FlxG.keys.justReleased.S;
		if (_swap) {
			_is_shadow = !_is_shadow;

			// update player/shadow graphics
			if (_is_shadow)
        		makeGraphic(8, 14, FlxColor.BLUE);
        	else 
        		makeGraphic(8, 14, FlxColor.RED);
        }

        acceleration.x = 0;
        acceleration.y = gravity;

        // move player only
		if (!_is_shadow)
	    	movement(elapsed);

	    super.update(elapsed);
	}

	private function movement(elapsed:Float):Void {
    	var _jump:Bool = false;
 		var _left:Bool = false;
 		var _right:Bool = false;

 		_jump = FlxG.keys.anyPressed([UP, W]);
 		_left = FlxG.keys.anyPressed([LEFT, A]);
 		_right = FlxG.keys.anyPressed([RIGHT, D]);

 		acceleration.x = 0;

 		if (_left && _right) {
      		_left = _right = false;
 		}


		//var mA:Float = 0;
		if (_jump) {
			jump(elapsed);
		}
		    //mA = -90;
		    //if (_left)
		    //    mA -= 45;
		    //else if (_right)
		    //    mA += 45;
		//}
		if (_left) {
		    velocity.x = -speed;
		    acceleration.x = -drag.x;
		} else if (_right) {
			velocity.x = speed;
			acceleration.x = drag.x;
		}
		//velocity.set(speed, 0);
		//velocity.rotate(FlxPoint.weak(0, 0), mA);
	}

	private function jump(elapsed:Float):Void {
		// Allow jump if player is on the ground
		//if ( velocity.y == 0) {
			jump_duration = 0;
		//}

		if (jump_duration >= 0) {
			jump_duration += elapsed;

			// Max time in air in 0.25 seconds
			if (jump_duration > 0.25)
				jump_duration = -1;
			else 
				velocity.y = -0.98 * jump_speed;

		} else {
			jump_duration = -1.0;
		}
	}

	public function isShadow():Bool{
		return _is_shadow;
	}
	
}