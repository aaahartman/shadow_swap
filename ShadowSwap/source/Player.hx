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
	private var _upFactor:Float = 10;
	private var _moveStrength:Float = 3800;
	private var _swimStrength:Float = 40;
	private var _gravity:Float = 1500;
	private var _inAirFactor:Float = 1 / 10;
	private var _waterDrag:Float = 20;
	private var _airDrag:Float = 2.5;
	private var _floorDrag:Float = 15;

	
	private var _inWater:Bool = false;
	private var _fanXForce:Float = 0;
	private var _fanYForce:Float = 0;

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
        loadGraphic(AssetPaths.White_spritesheet2__png, true, 32, 32);
        setFacingFlip(FlxObject.LEFT, true, false);
        setFacingFlip(FlxObject.RIGHT, false, false);
        animation.add("move", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 14, true);
        animation.add("jump", [4, 5, 6, 7, 8], 8, false);
        animation.add("idle", [0], 0, false);
    }

	public function bbox():FlxRect
	{
		return new FlxRect(Std.int(this.x), Std.int(this.y), 32, 32);
	}

	public function inWater(water:Bool):Void
	{
		_inWater = water;
	}
	
	override public function update(elapsed:Float):Void
	{
		acceleration.x = 0;
		acceleration.y = 0;
		applyVerticalForce(_fanYForce);
		applyHorizontalForce(_fanXForce);
		_fanXForce = 0;
		_fanYForce = 0;
		applyVerticalForce(_gravity);
		
		// Animation: make sure player do not jump on ground
		if(!isTouching(FlxObject.FLOOR)) {
			facing = FlxObject.UP;
		} else {
			facing = FlxObject.DOWN;
		}

		// jump
		if (!_inWater && FlxG.keys.anyJustPressed([UP, W, SPACE]))
		{
			if (isTouching(FlxObject.FLOOR))
			{
				applyVerticalForce(-_moveStrength * _upFactor); 
			}
			else
			{
				applyVerticalForce(-_moveStrength *  _inAirFactor);
			}
		}

		if (FlxG.keys.anyPressed([RIGHT, D]))	
		{
			// Animation: Facing Right if on ground
			if (isTouching(FlxObject.FLOOR))
				facing = FlxObject.RIGHT;

			if (_inWater || isTouching(FlxObject.FLOOR))
			{
				applyHorizontalForce(_moveStrength);
			}
			else 
			{
				applyHorizontalForce(_moveStrength * _inAirFactor);
			}
		}	

		if (FlxG.keys.anyPressed([LEFT, A]))
		{
			// Animation: Facing Left if on ground
			if (isTouching(FlxObject.FLOOR))
				facing = FlxObject.LEFT;		

			if (_inWater || isTouching(FlxObject.FLOOR))
			{
				applyHorizontalForce(-_moveStrength);
			}
			else 
			{
				applyHorizontalForce(-_moveStrength * _inAirFactor);
			}
		}

		if (_inWater)
		{	
			// swim up
			if (FlxG.keys.anyPressed([UP, W, SPACE]))
			{
				if (-velocity.y < _gravity)
				{
					applyVerticalForce(-_swimStrength * _upFactor -_gravity); 
				}
			}
			else
			{
				applyVerticalForce(-_waterDrag * velocity.y);
			}
			applyHorizontalForce(-_waterDrag * velocity.x);

			// facing direction in water
			if(velocity.x > 0)
				facing = FlxObject.RIGHT;
			else
				facing = FlxObject.LEFT;

		} else {
			applyVerticalForce(-_airDrag * velocity.y);
			applyHorizontalForce(-_airDrag * velocity.x);
			if (isTouching(FlxObject.FLOOR))
			{
				applyHorizontalForce(-_floorDrag * velocity.x);
			}
		}
	
		// Animation: swtich animation
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
				_fanYForce -= _force / Math.sqrt(_distance); 
			case 1:
				_fanXForce +=  _force / Math.sqrt(_distance); 
			case 2:
				_fanYForce += _force / Math.sqrt(_distance); 
			case 3:
				_fanXForce -= _force / Math.sqrt(_distance); 
		}
	}

	private function applyVerticalForce(_force:Float):Void
	{
		acceleration.y += _force;
	}

	private function applyHorizontalForce(_force:Float):Void
	{
		acceleration.x += _force;
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