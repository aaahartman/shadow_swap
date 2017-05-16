package;

import flixel.FlxSprite;
import flixel.system.FlxAssets;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.FlxObject;
import flixel.tweens.*;

class Player extends FlxSprite
{
	public var speed:Float = 175;
	public var x_speed:Float = 0;
	public var y_speed:Float = 0;
	public var gravity:Float = 900;
	public var jump_speed:Float = 350;
	public var swim_up_speed:Float = 10;
	public var swim_maximum_speed:Float = -100;

	private var jump_duration:Float = -1;
	private var in_air:Bool = false;
	private var in_water:Bool = false;

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
        //makeGraphic(16, 16, FlxColor.RED);
        loadGraphic(AssetPaths.White_spritesheet2__png, true, 32, 32);
        setFacingFlip(FlxObject.LEFT, true, false);
        setFacingFlip(FlxObject.RIGHT, false, false);
        animation.add("move", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 14, true);
        animation.add("jump", [4, 5, 6, 7, 8], 6, false);
        animation.add("idle", [0], 0, false);

        acceleration.y = gravity;
    }

	public function bbox():FlxRect
	{
		return new FlxRect(Std.int(this.x), Std.int(this.y), 32, 32);
	}

	public function setXSpeed(?speed:Float = 0):Void
	{
		x_speed = speed;
	}

	public function setYSpeed(?speed:Float = 0):Void
	{
		y_speed = speed;
	}

	public function inWater(water:Bool):Void
	{
		in_water = water;
	}
	
	override public function update(elapsed:Float):Void
	{
        var _jump:Bool = false;
 		var _left:Bool = false;
 		var _right:Bool = false;

		if (in_water)
		{
			_jump = FlxG.keys.anyPressed([UP, W, SPACE]);
		}
		else
		{
			_jump = FlxG.keys.anyJustPressed([UP, W, SPACE]);
		}
 		
 		_left = FlxG.keys.anyPressed([LEFT, A]);
 		_right = FlxG.keys.anyPressed([RIGHT, D]);

 		// acceleration.x = 0;
 		in_air = !isTouching(FlxObject.FLOOR);

 		if (_left && _right) 
 		{
      		_left = _right = false;
 		}
		if (y_speed != 0)
		{
			velocity.y = y_speed;
		}
		if (_jump && in_water) 
		{
			if (velocity.y > swim_maximum_speed)
				velocity.y -= swim_up_speed;
			else
				velocity.y = swim_maximum_speed;
		}
		else if (_jump && !in_air) 
		{		
			velocity.y = -jump_speed;
		}

		if (!in_air) 
		{
			facing = FlxObject.DOWN;
		}

		velocity.x = x_speed;
		if (_left) 
		{
			if (in_water)
			{
		    	velocity.x -= speed / 2;
			}
			else
			{
				velocity.x -= speed;
			}
		    facing = FlxObject.LEFT;
		}
 		
 		if (_right) 
		{
			if (in_water)
			{
				velocity.x += speed / 2;
			}
			else
			{
				velocity.x += speed;
			}
			facing = FlxObject.RIGHT;
		}

		if (in_air) 
		{
			facing = FlxObject.UP;
		}

		if (in_water) 
		{
			acceleration.y = gravity / 6 - 2 * velocity.y / 6;
		}
		else 
		{
			acceleration.y = gravity - 2 * velocity.y;
		}
	
		switch (facing) 
		{
			case FlxObject.UP:
				animation.play("jump");
			case FlxObject.LEFT, FlxObject.RIGHT:
				animation.play("move");
			case FlxObject.DOWN:
				animation.play("move");
		}
	    super.update(elapsed);
	}

	public function isInAir():Bool 
	{
		return in_air;
	}
	
	override public function kill():Void 
	{
		FlxTween.tween(this, { alpha: 0, y: y - 20 }, 2.0, { ease: FlxEase.circOut, onComplete: finishKill});
	}

	private function finishKill(_):Void 
	{
		exists = false;
	}

}