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
        loadGraphic(AssetPaths.Shadow3__png, false, 22, 32);
        alpha = 0.8;
        acceleration.y = gravity;
    }

	override public function update(elapsed:Float):Void
	{
        acceleration.x = 0;
		velocity.x = 0;
        if (in_water)
        {
            acceleration.y = gravity / 6 - 1.75 * velocity.y / 6;
        }
        else
        {
            acceleration.y = gravity - 1.75 * velocity.y;
        }
	    super.update(elapsed);
	}

	public function inWater(water:Bool):Void
	{
		in_water = water;
	}
}