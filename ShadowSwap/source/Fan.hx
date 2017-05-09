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
	private var _numBlocks:Int = 5;
	private var _size:Int = 32;

	public function new(?X:Float = 0, ?Y:Float = 0, ?id:Int = 0, ?dir:Int = 0, ?on:Bool = false)
	{
		super(X, Y);
		makeGraphic(_size, _size, FlxColor.ORANGE);
		switch(dir) {
			case 0:
				_bbox = new FlxRect(X, Y - _size * _numBlocks, _size, _size * _numBlocks);
			case 1:
				_bbox = new FlxRect(X, Y, _size * _numBlocks, _size);
			case 2:
				_bbox = new FlxRect(X, Y, _size, _size * _numBlocks);
			case 3:
				_bbox = new FlxRect(X - _size * _numBlocks, Y, _size * _numBlocks, _size);
		}
		immovable = true;
		_id = id;
		_dir = dir;
		_on = on;
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
		_on = !_on;
	}
	
	public function bbox():FlxRect
	{
		return _bbox;
	}
}