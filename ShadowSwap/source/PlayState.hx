package;

import flixel.FlxState;
import flixel.tile.FlxTilemap;
import flixel.FlxG;
import flixel.FlxObject;

import flixel.addons.editors.ogmo.FlxOgmoLoader;

class PlayState extends FlxState
{
	private var _player1:Player;
	private var _player2:Player;
	//private var _map:FlxOgmoLoader;
 	//private var _mWalls:FlxTilemap;


	override public function create():Void
	{
		//_map = new FlxOgmoLoader(AssetPaths.room_001__oel);
 		//_mWalls = _map.loadTilemap(AssetPaths.tiles__png, 16, 16, "walls");
 		//_mWalls.follow();
 		//_mWalls.setTileProperties(1, FlxObject.NONE);
 		//_mWalls.setTileProperties(2, FlxObject.ANY);
 		//add(_mWalls);


 		/* TODO: Change the x, y initial parameters back to 0. and 
 		set starting location using Tile map. */
		_player1 = new Player(60, 100, false);  //player
		_player2 = new Player(50, 100, true);  //shadow


 		//_map.loadEntities(placeEntities, "entities");


 		add(_player1);
 		add(_player2);

		super.create();
	}
/*
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
	    var x:Int = Std.parseInt(entityData.get("x"));
	    var y:Int = Std.parseInt(entityData.get("y"));
	    if (entityName == "player")
	    {
	        _player.x = x;
	        _player.y = y;
	    }
	}
*/
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		//FlxG.collide(_player, _mWalls);
	}
}
