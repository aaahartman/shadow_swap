package;

import flixel.FlxSprite;
import flixel.system.FlxAssets;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.FlxObject;

class Player extends FlxSprite
{
	public var speed:Float = 175;

	public var default_speed:Float = 0;
	public var gravity:Float = 900;
	public var jump_speed:Float = 350;

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
		return new FlxRect(Std.int(this.x), Std.int(this.y), 16, 16);
	}

	public function setDefaultSpeed(?speed:Float = 0):Void
	{
		default_speed = speed;
	}

	public function inWater(water:Bool):Void
	{
		in_water = water;
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
 		in_air = !isTouching(FlxObject.FLOOR) && !in_water;

 		if (_left && _right) {
      		_left = _right = false;
 		}

		if (_jump && !in_air) {		
			velocity.y = -jump_speed;
		}

		if (!in_air)
			facing = FlxObject.DOWN;

		velocity.x = default_speed;
		if (_left) 
		{
		    velocity.x -= speed;
		    facing = FlxObject.LEFT;
		}
 		
 		if (_right) 
		{
			velocity.x += speed;
			facing = FlxObject.RIGHT;
		}

		if (in_air)
			facing = FlxObject.UP;

		if (in_water)
			acceleration.y = gravity / 2;
		else
			acceleration.y = gravity;
	
		switch (facing) {
			case FlxObject.UP:
				animation.play("jump");
			case FlxObject.LEFT, FlxObject.RIGHT:
				animation.play("move");
			case FlxObject.DOWN:
				animation.play("move");
		}
	    super.update(elapsed);
	}

	public function isInAir():Bool {
		return in_air;
	}

}