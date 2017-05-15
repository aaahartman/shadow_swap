package;

import flixel.FlxSprite;
import flixel.system.FlxAssets;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.FlxObject;

class Shadow extends FlxSprite
{
    private var in_water:Bool = false;
	public var gravity:Float = 900;

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
        loadGraphic(AssetPaths.Shadow3__png, false, 32, 32);
        alpha = 0.8;
        acceleration.y = gravity / 2;
    }

	override public function update(elapsed:Float):Void
	{
        acceleration.x = 0;
		velocity.x = 0;
        if (in_water)
        {
            acceleration.y = 300;
        }
        else
        {
            acceleration.y = gravity;
        }
	    super.update(elapsed);
	}

	public function inWater(water:Bool):Void
	{
		in_water = water;
	}
}