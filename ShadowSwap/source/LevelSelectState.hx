package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;

class LevelSelectState extends FlxState
{
	private var _btnPlay1:FlxButton;
	private var _btnPlay2:FlxButton;
	private var _btnPlay3:FlxButton;
	private var _btnPlay4:FlxButton;
	private var _btnPlay5:FlxButton;

	private var _text:FlxText;

	override public function create():Void
	{
		_text = new FlxText(20, 20, FlxG.width, "Select the Desired Level:", 16);
		_btnPlay1 = new FlxButton(FlxG.width/2-50, 50, "Level 1");
		_btnPlay2 = new FlxButton(FlxG.width/2-50, 75, "Level 2");
		_btnPlay3 = new FlxButton(FlxG.width/2-50, 100, "Level 3");
		_btnPlay4 = new FlxButton(FlxG.width/2-50, 125, "Level 4");
		_btnPlay5 = new FlxButton(FlxG.width/2-50, 150, "Level 5");

		_btnPlay1.onDown.callback = clickPlay.bind(1);
		_btnPlay2.onDown.callback = clickPlay.bind(2);
		_btnPlay3.onDown.callback = clickPlay.bind(3);
		_btnPlay4.onDown.callback = clickPlay.bind(4);
		_btnPlay5.onDown.callback = clickPlay.bind(5);

 		add(_btnPlay1);
 		add(_btnPlay2);
 		add(_btnPlay3);
 		add(_btnPlay4);
 		add(_btnPlay5);

 		add(_text);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	private function clickPlay(level:Int):Void
	{
		if (level == 1)
	    	FlxG.switchState(new PlayLevel1());
	    if (level == 2)
	    	FlxG.switchState(new PlayLevel2());
	    if (level == 3)
	    	FlxG.switchState(new PlayLevel3());
	    if (level == 4)
	    	FlxG.switchState(new PlayLevel4());
	    if (level == 5)
	    	FlxG.switchState(new PlayLevel5());
	}	
}
