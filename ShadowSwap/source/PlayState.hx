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
	private var _door:Door;

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
	private var _levelNum:Int;
	private var _timers:Map<Int, FlxTimer>;

	private var _hud:HUD;

	override public function create():Void 
	{
		_levels = new Array();

		// Initialize level tilemap paths
		_levels[1] = AssetPaths._l1__oel;
		_levels[2] = AssetPaths._l2__oel;
		_levels[3] = AssetPaths._l3__oel;
		_levels[4] = AssetPaths._l5__oel;
		_levels[5] = AssetPaths._l5__oel;
		_levels[6] = AssetPaths._l5__oel;
		_levels[7] = AssetPaths._l7__oel;
		_levels[8] = AssetPaths._l8__oel;
		_levels[9] = AssetPaths._l9__oel;
		_levels[10] = AssetPaths._l10__oel;
		_levels[11] = AssetPaths._l11__oel;
		_levels[12] = AssetPaths._l11__oel;
		_levels[13] = AssetPaths._l11__oel;
		_levels[14] = AssetPaths._l14__oel;
		_levels[15] = AssetPaths._l15__oel;

		_timers = new Map<Int, FlxTimer>();
		_levelNum = LevelSelectState.getLevelNumber();

		_map = new FlxOgmoLoader(_levels[_levelNum]);
		_mWalls = _map.loadTilemap(AssetPaths.tiles__png, 32, 32, "walls");
		_mWalls.follow();
  		_mWalls.setTileProperties(1, FlxObject.ANY); // ground
  		_mWalls.setTileProperties(2, FlxObject.ANY); // ground
  		_mWalls.setTileProperties(3, FlxObject.NONE); // ground

 		add(_mWalls);
		
		_background = _map.loadTilemap(AssetPaths.tiles__png, 32, 32, "background");
		_background.follow();
		_background.setTileProperties(1, FlxObject.NONE);
		add(_background);

		_hud = new HUD(_levelNum);

		_player = new Player();  //player
		_shadow = new Shadow();  //shadow
		_glass = new FlxTypedGroup<Glass>();
		_glassWithSwitch = new FlxTypedGroup<Glass>();

		_gates = new FlxTypedGroup<Gate>();
		_buttons = new FlxTypedGroup<Button>();
		_fans = new FlxTypedGroup<Fan>();
		_switches = new FlxTypedGroup<Switch>();
		_key = new Key();
		_door = new Door(0, 0, true);
 		_map.loadEntities(placeEntities, "entities");
		
		Reg.gotKey = false;
		add(_glass);
		add(_glassWithSwitch);
		add(_key);
		add(_door);
		add(_gates);
		add(_buttons);
		add(_fans);
 		add(_player);
 		add(_switches);
 		add(_shadow);
 		add(_hud);
		super.create();


		Main.LOGGER.logLevelStart(_levelNum);
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
			_hud.setKey();
		}
		else if (entityName == "door")
		{
			_door.x = x;
			_door.y = y;
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
			else if (entityName == "water")
			{
				// do something
			}
			else {
				var on:Bool = entityData.get("_on").toLowerCase() == "true";
				if (entityName == "glass")
				{
					if (id == 0)
						_glass.add(new Glass(x, y, id, on));
					else
					{
						if (on)
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
					var fan:Bool = entityData.get("_fan").toLowerCase() == "true";
					_switches.add(new Switch(x, y, id, fan, on));
				}
				if (entityName == "fan")
				{
	 				var dir:Int = Std.parseInt(entityData.get("_dir"));
					var rotation:Bool = (entityData.get("_rotation").toLowerCase() == "true");
					var fan:Fan = new Fan(x, y, id, dir, on, rotation);
					_fans.add(fan);
				}
			}
		}

	}

	override public function update(elapsed:Float):Void
	{
		// restart the game
		if (FlxG.keys.justPressed.R) {
			FlxG.switchState(new PlayState());
			Main.LOGGER.logLevelAction(LoggingActions.CLICK_RESET, {level: _levelNum});
		}

		// return to level selection menu
		if (FlxG.keys.justPressed.L) {
			FlxG.switchState(new LevelSelectState());
			Main.LOGGER.logLevelAction(LoggingActions.CLICK_LEVELSELECTION, {level: _levelNum});
		}

		// return to home menu
		if (FlxG.keys.justPressed.H) {
			FlxG.switchState(new SplashScreenState());
			Main.LOGGER.logLevelAction(LoggingActions.CLICK_HOME, {level: _levelNum});
		}


		if (FlxG.keys.justPressed.S) {
			var temp:Float = _player.x;
			_player.x = _shadow.x;
			_shadow.x = temp;
			temp = _player.y;
			_player.y = _shadow.y;
			_shadow.y = temp;

			Main.LOGGER.logLevelAction(LoggingActions.PLAYER_SWAP);
		}

		super.update(elapsed);
		
		updateSwitches();
		updateFans();
		FlxG.collide(_player, _mWalls);
		FlxG.collide(_shadow, _mWalls);
		FlxG.collide(_player, _glass);
		FlxG.collide(_player, _glassWithSwitch);
		FlxG.overlap(_player, _key, collectKey);
		FlxG.overlap(_player, _door, unlockDoor);
		FlxG.overlap(_buttons, _player, raiseGate);


		// Release any button that is pressed.
		if (!Reg.currentButton.isEmpty())
			Reg.currentButton.pop().buttonReleased();

		
		var glass_iter:FlxTypedGroupIterator<Glass> = _glassWithSwitch.iterator();
		while (glass_iter.hasNext()) {
			var curGlass:Glass = glass_iter.next();
			if (!curGlass.isOn()) {
				FlxG.collide(curGlass, _shadow);
			}
		}

		var gate_iter:FlxTypedGroupIterator<Gate> = _gates.iterator();
		while (gate_iter.hasNext()) {
			var curGate:Gate = gate_iter.next();
			if (!curGate.isRaised()) {
				FlxG.collide(_player, curGate);
				FlxG.collide(_shadow, curGate);
			}
		}
	}

	private function collectKey(P:FlxObject, K:FlxObject):Void 
	{
		_hud.updateHUD();
		K.kill();
	}

	private function unlockDoor(P:FlxObject, D:FlxObject):Void 
	{
		if (Reg.gotKey)
		{
			_door.openDoor();
			add(new FlxText(0, 0, FlxG.width, "YOU WIN!", 16).screenCenter());
			haxe.Timer.delay(FlxG.switchState.bind(new LevelSelectState()), 500);
			Main.LOGGER.logLevelEnd({won: true});
		}
	}

	private function raiseGate(B:FlxObject, P:FlxObject):Void 
	{
		var id:Int = (cast B).getId();
		var button:Button = (cast B);
		button.buttonPressed();
		var itr:FlxTypedGroupIterator<Gate> = _gates.iterator();
		var curGate:Gate = new Gate();

		while(itr.hasNext()) {
			curGate = itr.next();
			if (curGate.getId() == id)
			{
				if (curGate.isRaised()) 
				{
					_timers.get(id).reset();
					Reg.currentButton.add(button);
				}
				else
				{
					curGate.raiseGate();
					Reg.currentGates.add(curGate);
					Reg.currentButton.add(button);
					_timers.set(id, new FlxTimer().start(1.0, dropGate, 1));
				}
			}
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
			s.toggleSwitch();
			while(itr.hasNext()) {
				var curFan:Fan = itr.next();
				if (curFan.getId() == id)
					curFan.toggle();
			}
		}
		else
		{
			var itr:FlxTypedGroupIterator<Glass> = _glassWithSwitch.iterator();
			s.toggleSwitch();
			while(itr.hasNext()) {
				var curGlass:Glass = itr.next();
				if (curGlass.getId() == id)
				{
					curGlass.toggle();
					if (s.on())
						// show glass, set tile to -1
						curGlass.setAlpha(1);
					else
						// hide glass, set tile to ground 
						curGlass.setAlpha(0);
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

	private function overlapsWithAnyFan(bbox:FlxRect):Bool
	{
		var iter:Iterator<Fan> = _fans.iterator();
		while(iter.hasNext())
		{
			if (iter.next().bbox().overlaps(bbox))
			{
				return true;
			}
		}
		return false;
	}

	private function updateFans():Void
	{
		var itr:FlxTypedGroupIterator<Fan> = _fans.iterator();
		while(itr.hasNext()) {
			var curFan:Fan = itr.next();
			if (curFan.isOn()) {
				var size:Float = curFan.width;
				var numBlocks:Float = 10;
				switch (curFan.getDir()){
                    // up
                    case 0:
						if (_player.bbox().overlaps(curFan.bbox()))
                            _player.velocity.y = -200;
                    // right
                    case 1:
                        if (!overlapsWithAnyFan(_player.bbox()))
						{
							_player.setDefaultSpeed(0);
						}
                        else if(_player.bbox().overlaps(curFan.bbox()))
						{
							_player.setDefaultSpeed(100);
							_player.velocity.y = 0;
						}
                    // down
                    case 2:
                        if (_player.bbox().overlaps(curFan.bbox()))
                            _player.velocity.y = 200;
                    // left
                    case 3:
                        if (!overlapsWithAnyFan(_player.bbox()))
						{
							_player.setDefaultSpeed(0);
						}
                        else if (_player.bbox().overlaps(curFan.bbox()))
						{
							_player.setDefaultSpeed(-100);
							_player.velocity.y = 0;
						}
				}

			}
		}
	}

}
