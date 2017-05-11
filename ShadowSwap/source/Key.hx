package;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.tweens.*;

class Key extends FlxSprite
{
	public function new(?X:Float = 0, ?Y:Float = 0) 
	{
		super(X, Y);
		//makeGraphic(16, 16, FlxColor.YELLOW);
		loadGraphic(AssetPaths.Key__png, false, 15, 28);
		immovable = true;
	}

	override public function kill():Void 
	{
		Reg.gotKey = true;
		FlxTween.tween(this, { alpha: 0, y: y - 20 }, 1.5, { ease: FlxEase.circOut, onComplete: finishKill });
	}

	private function finishKill(_):Void 
	{
		exists = false;
	}
}
