package;

import flixel.FlxSprite;
import flixel.system.FlxAssets;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.FlxObject;

class Player extends FlxSprite
{
	public var speed:Float = 120;
	public var gravity:Float = 800;
	public var jump_speed:Float = 300;
	private var jump_duration:Float = -1;
	private var in_air:Bool = false;

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
        //makeGraphic(16, 16, FlxColor.RED);
        loadGraphic(AssetPaths.White_spritesheet2__png, true, 32, 32);
        setFacingFlip(FlxObject.LEFT, true, false);
        setFacingFlip(FlxObject.RIGHT, false, false);
        animation.add("move", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 14, true);
        animation.add("jump", [4, 5, 6, 7, 8], 4, false);
        animation.add("idle", [0], 0, false);

        acceleration.y = gravity;
    }

	override public function update(elapsed:Float):Void
	{
        acceleration.x = 0;

        var _jump:Bool = false;
 		var _left:Bool = false;
 		var _right:Bool = false;

 		_jump = FlxG.keys.anyJustPressed([UP, W]);
 		_left = FlxG.keys.anyPressed([LEFT, A]);
 		_right = FlxG.keys.anyPressed([RIGHT, D]);

 		acceleration.x = 0;
 		in_air = !isTouching(FlxObject.FLOOR);

 		if (_left && _right) {
      		_left = _right = false;
 		}

		if (_jump && !in_air) {		
			velocity.y = -jump_speed;
		}

		if (!in_air)
			facing = FlxObject.DOWN;

		velocity.x = 0;
		if (_left) 
		{
		    velocity.x = -speed;
		    facing = FlxObject.LEFT;
		}
 		
 		if (_right) 
		{
			velocity.x = speed;
			facing = FlxObject.RIGHT;
		}

		if (in_air)
			facing = FlxObject.UP;

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
}