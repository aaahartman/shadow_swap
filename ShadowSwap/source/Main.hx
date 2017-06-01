package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();

		// Initialize Save Object in Registry
		Reg.initSave();

		// Start the game with lv1 for now
		Reg.setCurrentLevel(1);
		addChild(new FlxGame(736, 640, PlayState));
	}
}
