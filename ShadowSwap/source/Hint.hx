package;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.text.FlxText;

class Hint extends FlxSprite
{
	public function new(?X:Float = 0, ?Y:Float = 0, ?id:Int = 0, ?locked:Bool = true)
	{
		super(X, Y);
		immovable = true;

		if (id == 0)
			SwapHint();
		else
			RecallHint();
	}

	public function SwapHint():Void {
		//makeGraphic(32, 20, FlxColor.WHITE);
		loadGraphic(AssetPaths.Hint_S__png, true, 32, 22);
		animation.add("flash", [0, 1], 1, true);
		animation.play("flash");
	}

	public function RecallHint():Void {
		makeGraphic(32, 20, FlxColor.WHITE);
		var text = new FlxText(0, 0, 0, "R", 8);
	}
}