package;

import cse481d.logging.CapstoneLogger;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public static var LOGGER:CapstoneLogger;

	public function new()
	{
		super();

		var gameId:Int = 1707;
		var gameKey:String = "68d2c16258bd3ea03c65f901196531eb";
		var gameName:String = "shadowswap";

		/* CategoryId: 1 = Debug
					   2 = Family/Friend Release
					   3 = Public Release
					   5 = 5/22 Release
		*/

		var categoryId:Int = 1;

		Main.LOGGER = new CapstoneLogger(gameId, gameName, gameKey, categoryId, 1, false);

		var userId:String = Main.LOGGER.getSavedUserId();
		if (userId == null)
		{
			userId = Main.LOGGER.generateUuid();
			Main.LOGGER.setSavedUserId(userId);
		}
		Main.LOGGER.startNewSession(userId, this.onSessionReady);

		// Initialize Save Object in Registry
		Reg.initSave();
	}

	private function onSessionReady(sessionRecieved:Bool):Void
	{
		addChild(new FlxGame(736, 640, LevelSelectState));
	}
}
