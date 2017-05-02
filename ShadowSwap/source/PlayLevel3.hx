package;

import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import flixel.addons.editors.ogmo.FlxOgmoLoader;

class PlayLevel3 extends PlayState {

	override public function create():Void {

		_map = new FlxOgmoLoader(AssetPaths.room_001__oel);
 		_mWalls = _map.loadTilemap(AssetPaths.tiles__png, 16, 16, "walls");
		_mWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.NONE);
	 	_mWalls.setTileProperties(2, FlxObject.ANY);
 		add(_mWalls);

 		_hud = new HUD(3, true);
 		add(_hud);

		super.create();
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);		
	}
}
