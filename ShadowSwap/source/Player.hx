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
	private var _moveStrength:Float = 3500;
	private var _gravity:Float = 1500;
	private var _inAirFactor:Float = 1 / 10;
	private var _waterDrag:Float = 20;
	private var _airDrag:Float = 2.5;
	private var _floorDrag:Float = 10;

	
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
        animation.add("jump", [4, 5, 6, 7, 8], 6, false);
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
		
		if (FlxG.keys.anyPressed([UP, W, SPACE]))
		{
			facing = FlxObject.UP;
			if (_inWater || isTouching(FlxObject.FLOOR))
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
			applyVerticalForce(-_waterDrag * velocity.y);
			applyHorizontalForce(-_waterDrag * velocity.x);
		} else {
			applyVerticalForce(-_airDrag * velocity.y);
			applyHorizontalForce(-_airDrag * velocity.x);
			if (isTouching(FlxObject.FLOOR))
			{
				applyHorizontalForce(-_floorDrag * velocity.x);
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