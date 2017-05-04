package;

import flixel.util.FlxColor;
import flixel.FlxState;
import flixel.tile.FlxTilemap;
import flixel.tile.FlxTile;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.text.FlxText;
import flixel.group.FlxGroup;


import flixel.addons.editors.ogmo.FlxOgmoLoader;

class PlayState extends FlxState
{
	private var _player:Player;
	private var _shadow:Shadow;	

	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	private var _mPlayerWalls:FlxTilemap;
	private var _buttons:FlxTypedGroup<Button>;
	private var _fans:FlxTypedGroup<Fan>;
	private var _switches:FlxTypedGroup<Switch>;

	private var timerCount:Float;
	private var maxTimerCounter:Float;
	private var restoring:Bool;

	override public function create():Void 
	{
		FlxG.log.redirectTraces = true;
		var _levelName:String = LevelSelectState.getLevelName();
		_map = new FlxOgmoLoader(_levelName);
 		_mWalls = _map.loadTilemap(AssetPaths.evenbettertiles__png, 16, 16, "walls");
 		_mPlayerWalls = _map.loadTilemap(AssetPaths.evenbettertiles__png, 16, 16, "playerwalls");
		_mWalls.follow();
		_mPlayerWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.ANY); // ground
		_mWalls.setTileProperties(4, FlxObject.ANY); // gate
		_mWalls.setTileProperties(10, FlxObject.ANY); // terrain

		_mPlayerWalls.setTileProperties(2, FlxObject.ANY); // glass
		_mPlayerWalls.setTileProperties(3, FlxObject.NONE, _doorFunc, Player); // door
		_mPlayerWalls.setTileProperties(8, FlxObject.NONE, _waterFunc, Player); // water
		_mPlayerWalls.setTileProperties(9, FlxObject.NONE, _spikeFunc, Player); // spike
		_mPlayerWalls.setTileProperties(11, FlxObject.NONE, _keyFunc, Player); // key

 		add(_mWalls);
 		add(_mPlayerWalls);
		_player = new Player();  //player
		_shadow = new Shadow();  //shadow
		_buttons = new FlxTypedGroup<Button>();
		_fans = new FlxTypedGroup<Fan>();
		_switches = new FlxTypedGroup<Switch>();
 		_map.loadEntities(placeEntities, "entities");
		
		Reg._keysCollected = 0;
		restoring = false;
		
 		add(_player);
 		add(_shadow);
 		add(_buttons);
 		add(_fans);
 		add(_switches);
		super.create();
	}


	private function _doorFunc(_tile:FlxObject, _object:FlxObject):Void
	{
		if (Reg._keysCollected > 0) 
		{
		    FlxG.switchState(new LevelSelectState());
		}
	}
	
	private function _fanFunc(_tile:FlxObject, _object:FlxObject):Void
	{

	}
	
	private function _waterFunc(_tile:FlxObject, _object:FlxObject):Void
	{

	}
	
	private function _spikeFunc(_tile:FlxObject, _object:FlxObject):Void
	{

	}
	
	private function _keyFunc(_tile:FlxObject, _object:FlxObject):Void
	{
		removeTile(cast _tile);
		Reg._keysCollected++;
	}

	private function removeTile(Tile:FlxTile):Void
	{
		_mPlayerWalls.setTileByIndex(Tile.mapIndex, 0, true);
	}

	private function placeEntities(entityName:String, entityData:Xml):Void
	{
	    var x:Int = Std.parseInt(entityData.get("x"));
	    var y:Int = Std.parseInt(entityData.get("y"));
	    var _x:Int = Std.parseInt(entityData.get("_x"));
	    var _y:Int = Std.parseInt(entityData.get("_y"));
	    var _h:Int = Std.parseInt(entityData.get("_h"));
	    var _w:Int = Std.parseInt(entityData.get("_w"));

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

	    if (entityName == "button")
	    {
	    	_buttons.add(new Button(x, y, _x, _y, _h, _w));
	    }

	    if (entityName == "switch")
	    {
	    	_switches.add(new Switch(x, y));
	    }

	    if (entityName == "fan")
	    {
	    	_fans.add(new Fan(x, y));
	    }
	}

	override public function update(elapsed:Float):Void
	{
		FlxG.overlap(_player, _buttons, buttonHandler);
		if (FlxG.overlap(_player, _buttons))
		{

		} else {
			if (!restoring) {
				haxe.Timer.delay(restoreGates, 3000);
				restoring = true;
			}
		}
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
			var _temp = _player.x;
			_player.x = _shadow.x;
			_shadow.x = _temp;
			_temp = _player.y;
			_player.y = _shadow.y;
			_shadow.y = _temp;
		}
		super.update(elapsed);
		FlxG.collide(_player, _mWalls);
		FlxG.collide(_player, _mPlayerWalls);
		FlxG.collide(_shadow, _mWalls);	
	}

	private function buttonHandler(player:FlxObject, button:FlxObject):Void
	{
		toggleGate(cast button);
	}

	private function toggleGate(button:Button):Void 
	{
		trace("2");
		for (i in button.get_y()...(button.get_y() + button.get_h()))
		{
			_mWalls.setTile(button.get_x(), i, 0);
		}
	}

	private function restoreGates():Void {
		trace("1");
		for (button in _buttons)
		{	
			for (i in button.get_y()...(button.get_y() + button.get_h()))
			{
				_mWalls.setTile(button.get_x(), i, 4);
			}
		}
		restoring = false;
	}
}
