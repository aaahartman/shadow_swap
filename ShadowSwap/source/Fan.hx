package;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.math.FlxRect;

class Fan extends FlxSprite
{
	private var _id:Int = 0;
	private var _dir:Int = 0;
	private var _on:Bool = false;
	private var _bbox:FlxRect;
	private var _rotation:Bool = false;
	private var _range:Int = 10;
	private var _blockToPixel:Int = 32;
	private var _power:Int = 0;

	public function new(?X:Float = 0, ?Y:Float = 0, ?id:Int = 0, ?dir:Int = 0, ?on:Bool = false, ?rotation:Bool = false, ?range:Int = 10, ?power:Int = 0)
	{
		super(X, Y);
		immovable = true;
		_id = id;
		_dir = dir;
		_on = on;

		if (_on) 
		{
			loadGraphic(AssetPaths.Fan_On__png, true, 32, 32);
			animation.add("on", [0, 1], 11, true);
			animation.play("on");
		} 
		else 
		{
			loadGraphic(AssetPaths.Fan_off__png, false, 32, 32);
		}

		_rotation = rotation;
		_range = range;
		_power = power;
		updateBoundingBox();
	}

	public function getPower():Int
	{
		return _power;
	}

	public function getId():Int
	{
		return _id;
	}

	public function getDir():Int
	{
		return _dir;
	}

	public function isOn():Bool
	{
		return _on;
	}

	public function toggle():Void
	{
		if (_rotation)
		{
			_dir = (_dir + 1) % 4;
			updateBoundingBox();
		}
		else 
		{
			_on = !_on;
		}

		if (_on) 
		{
			loadGraphic(AssetPaths.Fan_On__png, true, 32, 32);
			animation.add("on", [0, 1], 11, true);
			animation.play("on");
		} 
		else 
		{
			loadGraphic(AssetPaths.Fan_off__png, false, 32, 32);
		}
	}
	
	public function bbox():FlxRect
	{
		return _bbox;
	}

	public function updateBoundingBox():Void
	{
		switch(_dir) 
		{
			case 0:
				angle = -90;
				_bbox = new FlxRect(x, y - _blockToPixel * _range + _blockToPixel, _blockToPixel, _blockToPixel * _range);
			case 1:
				angle = 0;
				_bbox = new FlxRect(x, y, _blockToPixel * _range, _blockToPixel);
			case 2:
				angle = 90;
				_bbox = new FlxRect(x, y, _blockToPixel, _blockToPixel * _range);
			case 3:
				angle = 180;
				_bbox = new FlxRect(x - _blockToPixel * _range + _blockToPixel, y, _blockToPixel * _range, _blockToPixel);
		}
	}
}