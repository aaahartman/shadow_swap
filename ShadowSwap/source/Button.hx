package;

import flixel.FlxSprite;
import flixel.system.FlxAssets;
import flixel.util.FlxColor;
import flixel.tile.FlxTile;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.FlxObject;

class Button extends FlxSprite
{
    
    private var __x:Int;
    private var __y:Int;
    private var __h:Int;
    private var __w:Int;
    private var rest:Bool;

    public function new(?X:Float=0, ?Y:Float=0, _x:Int, _y:Int, _h:Int, _w:Int)
    {
        super(X, Y);
        __x = _x;
        __y = _y;
        __h = _h;
        __w = _w;
        rest = false;
        makeGraphic(16, 8, FlxColor.GREEN);
    }


    public function get_x():Int
    {
        return __x;
    }

    public function get_y():Int
    {
        return __y;
    }

    public function get_h():Int
    {
        return __h;
    }

    public function get_w():Int
    {
        return __w;
    }

    public function getRest():Bool 
    {
        return rest;
    }

	override public function update(elapsed:Float):Void
	{
	    super.update(elapsed);
	}
}