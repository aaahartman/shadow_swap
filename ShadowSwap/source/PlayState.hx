package;

import flixel.FlxState;
import flixel.tile.FlxTilemap;
import flixel.FlxG;
import flixel.FlxObject;

import flixel.addons.editors.ogmo.FlxOgmoLoader;

class PlayState extends FlxState
{
	private var _player:Player;
	private var _map:FlxOgmoLoader;
 	private var _mWalls:FlxTilemap;


	override public function create():Void
	{
		_map = new FlxOgmoLoader(AssetPaths.room_001__oel);
 		_mWalls = _map.loadTilemap(AssetPaths.tiles__png, 16, 16, "walls");
 		_mWalls.follow();
 		_mWalls.setTileProperties(1, FlxObject.NONE);
 		_mWalls.setTileProperties(2, FlxObject.ANY);
 		add(_mWalls);
		_player = new Player();
 		_map.loadEntities(placeEntities, "entities");
 		add(_player);
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
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(_player, _mWalls);
	}
}
