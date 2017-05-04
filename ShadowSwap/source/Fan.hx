package;

import flixel.FlxSprite;
import flixel.system.FlxAssets;
import flixel.util.FlxColor;
import flixel.tile.FlxTile;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.FlxObject;

class Fan extends FlxSprite
{
    

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
        makeGraphic(16, 16, FlxColor.RED);
    }

	override public function update(elapsed:Float):Void
	{
	    super.update(elapsed);
	}
}