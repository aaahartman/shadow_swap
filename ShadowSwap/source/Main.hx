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

		// Start the game at the highest level solved
 		var level = Reg.getNumUnlockedLevels();
 		Reg.setCurrentLevel(level);
		addChild(new FlxGame(736, 640, PlayState, 1, 60, 60, true, false));
	}
}
