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
	private var _player1:Player;
	private var _player2:Player;	
	
	private var _key:Key;
	private var _entrance:Door;
	private var _exit:Door;

	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	private var _glass:FlxTypedGroup<Glass>;
	private var _got_key:FlxText;



	override public function create():Void
	{
		
		_map = new FlxOgmoLoader(AssetPaths.room_001__oel);
 		_mWalls = _map.loadTilemap(AssetPaths.tiles__png, 16, 16, "walls");
		_mWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.NONE);
	 	_mWalls.setTileProperties(2, FlxObject.ANY);
 		add(_mWalls);

 		/* TODO: Change the x, y initial parameters back to 0. and 
 		set starting location using Tile map. */
		_player1 = new Player(0, 0, false);  //player
		_player2 = new Player(0, 0, true);  //shadow
		_glass = new FlxTypedGroup<Glass>();
		_key = new Key();
		_entrance = new Door(0, 0, false);
		_exit = new Door(0, 0, true);
 		_map.loadEntities(placeEntities, "entities");
		
		Reg.gotKey = false;
		
		_got_key = new FlxText(0, 0, FlxG.width);
		_got_key.setFormat(null, 16, FlxColor.YELLOW, CENTER, OUTLINE, 0x131c1b);
		_got_key.scrollFactor.set(0, 0);
		
		add(_got_key);
		add(_glass);
		add(_key);
		add(_entrance);
		add(_exit);
 		add(_player1);
 		add(_player2);
		super.create();
	}

	private function placeEntities(entityName:String, entityData:Xml):Void
	{
	    var x:Int = Std.parseInt(entityData.get("x"));
	    var y:Int = Std.parseInt(entityData.get("y"));
	    if (entityName == "player")
	    {
	        _player1.x = x;
	        _player1.y = y;
	    }
		if (entityName == "shadow")
	    {
	        _player2.x = x;
	        _player2.y = y;
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
			FlxG.switchState(new PlayState());

		super.update(elapsed);

		if (Reg.gotKey) {
			_got_key.text = 'You got the key!';
		} else {
			_got_key.text = 'Go get the key!';
		}

		FlxG.collide(_player1, _mWalls);
		FlxG.collide(_player2, _mWalls);
		if (_player2.isShadow()) {
			FlxG.collide(_player1, _glass);
			FlxG.overlap(_player1, _key, collectKey);
			FlxG.overlap(_player1, _exit, unlockDoor);
		} else
		{
			FlxG.collide(_player2, _glass);
			FlxG.overlap(_player2, _key, collectKey);
			FlxG.overlap(_player2, _exit, unlockDoor);
		}
		
	}

	private function collectKey(P:FlxObject, K:FlxObject):Void 
	{
		K.kill();
	}

	private function unlockDoor(P:FlxObject, D:FlxObject):Void 
	{
		if (Reg.gotKey)
			_got_key.text = "You win!";
	}
}
