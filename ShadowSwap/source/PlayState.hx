package;

import flixel.util.FlxColor;
import flixel.FlxState;
import flixel.tile.FlxTilemap;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.text.FlxText;
import flixel.group.FlxGroup;


import flixel.addons.editors.ogmo.FlxOgmoLoader;

class PlayState extends FlxState
{
	private var _player:Player;
	private var _shadow:Shadow;	
	
	private var _key:Key;
	private var _entrance:Door;
	private var _exit:Door;

	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	private var _glass:FlxTypedGroup<Glass>;
	private var _buttons:FlxTypedGroup<Button>;
	private var _fans:FlxTypedGroup<Fan>;
	private var _switches:FlxTypedGroup<Switch>;
	private var _got_key:FlxText;

	private var _hud:HUD;

	override public function create():Void 
	{
		FlxG.log.redirectTraces = true;
		var _levelName:String = LevelSelectState.getLevelName();
		_map = new FlxOgmoLoader(_levelName);
 		_mWalls = _map.loadTilemap(AssetPaths.colortiles__png, 16, 16, "walls");
		_mWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.ANY); // ground
		_mWalls.setTileProperties(4, FlxObject.ANY); // gate
		_mWalls.setTileProperties(10, FlxObject.ANY); // terrain

 		add(_mWalls);

		_player = new Player();  //player
		_shadow = new Shadow();  //shadow
		_glass = new FlxTypedGroup<Glass>();
		_key = new Key();
		_entrance = new Door(0, 0, false);
		_exit = new Door(0, 0, true);
 		_map.loadEntities(placeEntities, "entities");
		
		Reg.gotKey = false;

		//_got_key = new FlxText(0, 0, FlxG.width);
		//_got_key.setFormat(null, 16, FlxColor.YELLOW, CENTER, OUTLINE, 0x131c1b);
		//_got_key.scrollFactor.set(0, 0);
		
		add(_got_key);
		add(_glass);
		add(_key);
		add(_entrance);
		add(_exit);
 		add(_player);
 		add(_shadow);
		super.create();
	}

	private function placeEntities(entityName:String, entityData:Xml):Void
	{
	    var x:Int = Std.parseInt(entityData.get("x"));
	    var y:Int = Std.parseInt(entityData.get("y"));
	    if (entityName == "player")
	    {
	        _player.x = x;
	        _player.y = y;
	    }
		if (entityName == "shadow")
	    {
	        _shadow.x = x;
	        _shadow.y = y;
	    }
		if (entityName == "glass")
		{
			_glass.add(new Glass(x, y));
		}
		if (entityName == "key")
		{
			_key.x = x;
			_key.y = y;
		}
		if (entityName == "entrance")
		{
			_entrance.x = x;
			_entrance.y = y;
		}
		if (entityName == "exit")
		{
			_exit.x = x;
			_exit.y = y;
		}
	}

	override public function update(elapsed:Float):Void
	{

		// restart the game
		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new PlayState());
		}

		if (FlxG.keys.justPressed.H)
		{
			FlxG.switchState(new LevelSelectState());
		}

		if (FlxG.keys.justPressed.S)
		{
			var temp:Float = _player.x;
			_player.x = _shadow.x;
			_shadow.x = temp;
			temp = _player.y;
			_player.y = _shadow.y;
			_shadow.y = temp;
		}

		super.update(elapsed);

		//if (Reg.gotKey) {
		//	_got_key.text = 'You got the key!';
		//} else {
		//	_got_key.text = 'Go get the key!';
		//}

		FlxG.collide(_player, _mWalls);
		FlxG.collide(_shadow, _mWalls);
		FlxG.collide(_player, _glass);
		FlxG.overlap(_player, _key, collectKey);
		FlxG.overlap(_player, _exit, unlockDoor);
	}

	private function collectKey(P:FlxObject, K:FlxObject):Void 
	{
		//_hud.updateHUD();
		K.kill();
	}

	private function unlockDoor(P:FlxObject, D:FlxObject):Void 
	{
		if (Reg.gotKey)
		{

			//_got_key.text = "You win!";
			add(new FlxText(0, 0, FlxG.width, "YOU WIN!", 16).screenCenter());
			haxe.Timer.delay(FlxG.switchState.bind(new LevelSelectState()), 300);
		}
	}
}
