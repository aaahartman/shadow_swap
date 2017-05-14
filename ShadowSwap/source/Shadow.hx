package;

import flixel.FlxSprite;
import flixel.system.FlxAssets;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.FlxObject;

class Shadow extends FlxSprite
{

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
        loadGraphic(AssetPaths.Shadow3__png, false, 22, 32);
        alpha = 0.8;
        acceleration.y = 900;
    }

	override public function update(elapsed:Float):Void
	{
        acceleration.x = 0;
		velocity.x = 0;
	    super.update(elapsed);
	}
}