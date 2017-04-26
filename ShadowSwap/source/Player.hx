package;

import flixel.FlxSprite;
import flixel.system.FlxAssets;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxPoint;

class Player extends FlxSprite
{
	public var speed:Float = 200;

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
        makeGraphic(8, 14, FlxColor.BLUE);
        drag.x = drag.y = 1600;
    }

    private function movement():Void
    {
    	var _up:Bool = false;
 		var _left:Bool = false;
 		var _right:Bool = false;

 		_up = FlxG.keys.anyPressed([UP, W]);
 		_left = FlxG.keys.anyPressed([LEFT, A]);
 		_right = FlxG.keys.anyPressed([RIGHT, D]);

 		if (_left && _right) {
      		_left = _right = false;
 		}

 		if (_up || _left || _right) {
 		 	var mA:Float = 0;
			if (_up)
			{
			    mA = -90;
			    if (_left)
			        mA -= 45;
			    else if (_right)
			        mA += 45;
			}
			else if (_left){
			    mA = 180;
			}
			velocity.set(speed, 0);
 			velocity.rotate(FlxPoint.weak(0, 0), mA);
		}
	}

	override public function update(elapsed:Float):Void
	{
	    movement();
	    super.update(elapsed);
	}
}