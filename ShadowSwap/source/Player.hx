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
	public var jump_speed:Float = 500;
	public var swim_up_speed:Float = 10;
	public var swim_maximum_speed:Float = -100;
	private var jump_duration:Float = -1;
	private var in_air:Bool = false;
	private var in_water:Bool = false;
	private var fanXForce:Float = 0;
	private var fanYForce:Float = 0;

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
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
		acceleration.x = 0;
		acceleration.y = 0;
		applyFanForce();
		fanXForce = 0;
		fanYForce = 0;
		if (in_water)
		{
			applyWaterForce();				
			if (FlxG.keys.anyPressed([UP, W, SPACE]))
			{
				facing = FlxObject.UP;
				applySwimUpForce();
			}
			if (FlxG.keys.anyPressed([RIGHT, D]))
			{
				facing = FlxObject.RIGHT;
				applySwimRightForce();
			}
			if (FlxG.keys.anyPressed([LEFT, A]))
			{
				facing = FlxObject.LEFT;
				applySwimLeftForce();
			}
		} else {
			applyAirDrag();
			applyGravity();
			if (isTouching(FlxObject.FLOOR))
			{
				applyFloorDrag();
				if (FlxG.keys.anyPressed([UP, W, SPACE]))
				{
					facing = FlxObject.UP;
					applyUpForce();
				}
				if (FlxG.keys.anyPressed([RIGHT, D]))
				{
					facing = FlxObject.RIGHT;
					applyRightForce();
				}
				if (FlxG.keys.anyPressed([LEFT, A]))
				{
					facing = FlxObject.LEFT;
					applyLeftForce();
				}
			}
			else 
			{
				if (FlxG.keys.anyPressed([RIGHT, D]))
				{
					facing = FlxObject.RIGHT;
					applySmallRightForce();
				}
				if (FlxG.keys.anyPressed([LEFT, A]))
				{
					facing = FlxObject.LEFT;
					applySmallLeftForce();
				}
			}
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

	public function updateFanForce(_force:Int, _dir:Int, _distance:Float):Void
	{
		switch (_dir) {
			case 0:
				fanYForce -= _force / Math.sqrt(_distance); 
			case 1:
				fanXForce +=  _force / Math.sqrt(_distance); 
			case 2:
				fanYForce += _force / Math.sqrt(_distance); 
			case 3:
				fanXForce -= _force / Math.sqrt(_distance); 
		}
	}

	private function applyFanForce() {
		acceleration.y += fanYForce;
		acceleration.x += fanXForce;
	}

	private function applyGravity()
	{
		acceleration.y += 900;
	}

	private function applyFloorDrag()
	{
		acceleration.x -= 15 * velocity.x;
	}

	private function applyAirDrag()
	{
		acceleration.x -= 1.25 * velocity.x;
		acceleration.y -= 1.25 * velocity.y;
	}

	private function applyRightForce()
	{
		acceleration.x += 4500;
	}

	private function applyLeftForce()
	{
		acceleration.x -= 4500;
	}

	private function applySwimRightForce()
	{
		acceleration.x += 4500;
	}

	private function applySwimLeftForce()
	{
		acceleration.x -= 4500;
	}

	private function applySmallRightForce()
	{
		acceleration.x += 500;
	}

	private function applySmallLeftForce()
	{
		acceleration.x -= 500;
	}

	private function applyWaterForce()
	{
		acceleration.x -= 25 * velocity.x;
		acceleration.y = gravity / 1.25 - 10 * velocity.y;
	}

	private function applyUpForce()
	{
		acceleration.y -= 27000; 
	}

	private function applySwimUpForce()
	{
		acceleration.y -= 2000; 
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