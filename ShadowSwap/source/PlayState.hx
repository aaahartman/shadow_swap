package;

import flixel.util.FlxColor;
import flixel.FlxState;
import flixel.tile.FlxTilemap;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.text.FlxText;
import flixel.group.FlxGroup;
import flixel.util.FlxTimer;
import flixel.math.FlxRect;


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
	private var _background:FlxTilemap;
	private var _glass:FlxTypedGroup<Glass>;
	private var _glassWithSwitch:FlxTypedGroup<Glass>;
	private var _gates:FlxTypedGroup<Gate>;
	private var _buttons:FlxTypedGroup<Button>;
	private var _fans:FlxTypedGroup<Fan>;
	private var _switches:FlxTypedGroup<Switch>;

	private var _levels:Array<Dynamic>;
	private var _timers:Map<Int, FlxTimer>;

	private var _hud:HUD;

	override public function create():Void 
	{
		_levels = new Array();

		_levels[0] = AssetPaths.level0__oel;
		_levels[1] = AssetPaths.level1__oel;
		_levels[2] = AssetPaths.level2__oel;
		_levels[3] = AssetPaths.level3__oel;
		_levels[4] = AssetPaths.level4__oel;
		_levels[5] = AssetPaths.level6__oel;
		
		_timers = new Map<Int, FlxTimer>();

		_map = new FlxOgmoLoader(_levels[LevelSelectState.getLevelNumber()]);
 		_mWalls = _map.loadTilemap(AssetPaths.colortiles__png, 16, 16, "walls");
		_mWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.ANY); // ground
		_mWalls.setTileProperties(4, FlxObject.ANY); // gate
		_mWalls.setTileProperties(10, FlxObject.ANY); // terrain

		_background = _map.loadTilemap(AssetPaths.colortiles__png, 16, 16, "background");
		_background.follow();
		_background.setTileProperties(1, FlxObject.NONE);

 		add(_mWalls);
		add(_background);

		_player = new Player();  //player
		_shadow = new Shadow();  //shadow
		_glass = new FlxTypedGroup<Glass>();
		_glassWithSwitch = new FlxTypedGroup<Glass>();

		_gates = new FlxTypedGroup<Gate>();
		_buttons = new FlxTypedGroup<Button>();
		_fans = new FlxTypedGroup<Fan>();
		_switches = new FlxTypedGroup<Switch>();
		_key = new Key();
		_entrance = new Door(0, 0, false);
		_exit = new Door(0, 0, true);
 		_map.loadEntities(placeEntities, "entities");
		
		Reg.gotKey = false;
		add(_glass);
		add(_glassWithSwitch);
		add(_key);
		add(_entrance);
		add(_exit);
		add(_gates);
		add(_buttons);
		add(_fans);
 		add(_player);
 		add(_switches);
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
		else if (entityName == "shadow")
	    {
	        _shadow.x = x;
	        _shadow.y = y;
	    }
		else if (entityName == "key")
		{
			_key.x = x;
			_key.y = y;
		}
		else if (entityName == "entrance")
		{
			_entrance.x = x;
			_entrance.y = y;
		}
		else if (entityName == "exit")
		{
			_exit.x = x;
			_exit.y = y;
		}
		else {
			var id:Int = Std.parseInt(entityData.get("_id"));
			if (entityName == "gate")
			{
				_gates.add(new Gate(x, y, id));
			}
			else if (entityName == "button")
			{
				_buttons.add(new Button(x, y, id));
			}
			else {
				var on:Int = Std.parseInt(entityData.get("on"));
				if (entityName == "glass")
				{
					if (id == -1)
						_glass.add(new Glass(x, y, id, on));
					else
					{
						if (on == 1)
							_glassWithSwitch.add(new Glass(x, y, id, on));
						else
						{
							var newGlass:Glass = new Glass(x, y, id, on);
							newGlass.setAlpha(0);
							_glassWithSwitch.add(newGlass);
						}
					}
				}
				if (entityName == "switch")
				{
					var controlFan:Int = Std.parseInt(entityData.get("controlFan"));
					_switches.add(new Switch(x, y, id, controlFan, on));
				}
				if (entityName == "fan")
				{
	 				var dir:Int = Std.parseInt(entityData.get("dir"));
					_fans.add(new Fan(x, y, id, dir));
				}
			}
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
		
		updateSwitches();
		FlxG.collide(_player, _mWalls);
		FlxG.collide(_shadow, _mWalls);
		FlxG.collide(_player, _glass);
		FlxG.collide(_player, _glassWithSwitch);
		FlxG.collide(_player, _gates);
		FlxG.collide(_shadow, _gates);
		FlxG.overlap(_player, _key, collectKey);
		FlxG.overlap(_player, _exit, unlockDoor);
		FlxG.overlap(_buttons, _player, raiseGate);
		
		var iter:FlxTypedGroupIterator<Glass> = _glassWithSwitch.iterator();
		while (iter.hasNext()) {
			var curGlass:Glass = iter.next();
			if (!curGlass.isOn()) {
				FlxG.collide(curGlass, _shadow);
			}
		}
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
			add(new FlxText(0, 0, FlxG.width, "YOU WIN!", 16).screenCenter());
			haxe.Timer.delay(FlxG.switchState.bind(new LevelSelectState()), 300);
		}
	}

	private function raiseGate(B:FlxObject, P:FlxObject):Void 
	{
		var id:Int = (cast B).getId();
		var itr:FlxTypedGroupIterator<Gate> = _gates.iterator();
		var curGate:Gate = new Gate();
		while(itr.hasNext()) {
			curGate = itr.next();
			if (curGate.getId() == id)
				break;
		}
		if (curGate.isRaised()) 
		{
			_timers.get(id).reset();
		}
		else
		{
			curGate.raiseGate();
			Reg.currentGates.add(curGate);
			_timers.set(id, new FlxTimer().start(0.8, dropGate, 1));
		}
	}

	private function dropGate(Timer:FlxTimer):Void 
	{
		Reg.currentGates.pop().dropGate();
	}

	private function onSwitch(S:FlxObject, P:FlxObject):Void 
	{
		var s:Switch = cast S;
		// if player is already on the switch, do nothing
		if (s.isPressed()) {
			return;
		}

		s.stepOn();
		var id:Int = s.getId();
		if (s.controlFan())
		{
			var itr:FlxTypedGroupIterator<Fan> = _fans.iterator();
		}
		else
		{
			var itr:FlxTypedGroupIterator<Glass> = _glassWithSwitch.iterator();
			s.toggleSwitch();
			while(itr.hasNext()) {
				var curGlass:Glass = itr.next();
				if (curGlass.getId() == id)
				{
					if (s.on())
					{
						// show glass, set tile to -1
						curGlass.toggle();
						curGlass.setAlpha(1);
					}
					else
					{
						// hide glass, set tile to ground 
						curGlass.toggle();
						curGlass.setAlpha(0);
					}
				}
			}
		}
	}

	// check if player stepped off a switch
	private function updateSwitches():Void
	{
		var itr:FlxTypedGroupIterator<Switch> = _switches.iterator();
		while(itr.hasNext()) {
			var curSwitch:Switch = itr.next();
			if (curSwitch.isPressed()) {
				if (!_player.overlaps(curSwitch))
					curSwitch.stepOff();
			} else {
				if (_player.overlaps(curSwitch))
					onSwitch(curSwitch, _player);
			}
		}
	}
}
