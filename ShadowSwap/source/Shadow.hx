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
        //makeGraphic(16, 16, FlxColor.BLUE);
        loadGraphic(AssetPaths.Shadow2__png, false, 32, 32);
        acceleration.y = 800;
    }

	override public function update(elapsed:Float):Void
	{
        acceleration.x = 0;
		velocity.x = 0;
	    super.update(elapsed);
	}
}