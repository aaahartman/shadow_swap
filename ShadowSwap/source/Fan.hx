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
	private var _numBlocks:Int = 10;
	private var _size:Int = 32;

	public function new(?X:Float = 0, ?Y:Float = 0, ?id:Int = 0, ?dir:Int = 0, ?on:Bool = false, ?rotation:Bool = false, ?range:Int = 10)
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
		_numBlocks = range;
		changeDirection();
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
			changeDirection();
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

	public function changeDirection():Void
	{
		switch(_dir) 
		{
			case 0:
				angle = -90;
				_bbox = new FlxRect(x, y - _size * _numBlocks + _size, _size, _size * _numBlocks);
			case 1:
				angle = 0;
				_bbox = new FlxRect(x, y, _size * _numBlocks, _size);
			case 2:
				angle = 90;
				_bbox = new FlxRect(x, y, _size, _size * _numBlocks);
			case 3:
				angle = 180;
				_bbox = new FlxRect(x - _size * _numBlocks + _size, y, _size * _numBlocks, _size);
		}
	}
}