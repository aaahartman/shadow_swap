package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;

class FinishState extends FlxState
{

	override public function create():Void
	{
		_text = new FlxText(0, 0, 0, "Yay! You finished!", 32);
		_text.systemFont = "Arial Black";
		_text.screenCenter();
		_text.y -= 50;

		_levelButton = new FlxButton(0, 0, "Next Level", nextLevel);
		_MenuButton = new FlxButton(50, 50, "Main Menu", toMenu);
 		add(_MenuButton);
 		add(_levelButton);
 		add(_text);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	private function nextLevel():Void 
	{
		
	}

	private function toMenu():Void
	{
	    FlxG.switchState(new LevelSelectState());
	}	
}
