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
import flixel.math.FlxPoint;
import flixel.ui.FlxButton;
import flixel.FlxSprite;


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
	private var _spikes:FlxTypedGroup<Spike>;
	private var _water:FlxTypedGroup<Water>;

	private var _levelNum:Int;
	private var _timers:Map<Int, FlxTimer>;
	private var _timeInWater:FlxTimer;
	private var _timerOn:Bool;
	private var _counter:Int;
	private var _countDownText:FlxText;
	private var _hint:Hint;
	private var _openGates:List<Gate>;

	private var _numSwap:Int;

	private var _hud:HUD;

	override public function create():Void 
	{
		FlxG.log.redirectTraces = true;
		Reg.playerNewStart();
		_timers = new Map<Int, FlxTimer>();
		_levelNum = Reg.getCurrentLevel();

		// Import tile map
		_map = new FlxOgmoLoader(Reg.getLevel(_levelNum));
		_mWalls = _map.loadTilemap(AssetPaths.tiles__png, 32, 32, "walls");
		_mWalls.follow();
  		_mWalls.setTileProperties(1, FlxObject.ANY); // ground
  		_mWalls.setTileProperties(2, FlxObject.ANY); // ground
  		_mWalls.setTileProperties(3, FlxObject.NONE); // background
 		add(_mWalls);
	
 		// Import tile map non-collidible layer
		_background = _map.loadTilemap(AssetPaths.tiles__png, 32, 32, "background");
		_background.follow();
		_background.setTileProperties(1, FlxObject.NONE);
		add(_background);

		// Resize screen to fit tilemap at center
		flixel.FlxCamera.defaultZoom = 1;
		FlxG.cameras.reset();
		FlxG.camera.setSize((cast _mWalls.width), (cast _mWalls.height));
		FlxG.camera.x = (FlxG.width - _mWalls.width) / 2;

		// Create HUD
		_hud = new HUD(_levelNum);

		// Initialize water related components
		_timeInWater = new FlxTimer();
		_counter = 10;
		_countDownText = new FlxText(_mWalls.width / 2 - 32, _mWalls.height / 2, FlxG.width, "", 64);
		_countDownText.systemFont = "Arial Black";

		// Initialize all entities
		_player = new Player();
		_shadow = new Shadow();
		_glass = new FlxTypedGroup<Glass>();
		_glassWithSwitch = new FlxTypedGroup<Glass>();
		_gates = new FlxTypedGroup<Gate>();
		_buttons = new FlxTypedGroup<Button>();
		_fans = new FlxTypedGroup<Fan>();
		_switches = new FlxTypedGroup<Switch>();
		_key = new Key();
		_door = new Door(0, 0, true);
		_spikes = new FlxTypedGroup<Spike>();
		_water = new FlxTypedGroup<Water>();
 		_map.loadEntities(placeEntities, "entities");
		
		// Initialize current gates to empty
		_openGates = new List<Gate>();

		//Local saving of number of swaps, initialized to 0;
		_numSwap = 0;

		// Add all components to game state
		add(_water);
		add(_glass);
		add(_glassWithSwitch);
		add(_key);
		add(_door);
		add(_gates);
		add(_buttons);
		add(_fans);
 		add(_switches);
 		add(_hud);
		add(_spikes);
 		add(_player);
 		add(_shadow);
		add(_countDownText);

		if (_hint != null)
		{
			add(_hint);
		}

		if (Reg.getCurrentLevel() == 1) {
			var _welcomeText = new FlxText(_mWalls.width / 2 - 200, 100, FlxG.width, "Welcome to Shadow Swap!", 25);
			//_welcomeText.systemFont = "Arial Black";
			add(_welcomeText);
		}

		Reg.resetKey();

		super.create();

		Main.LOGGER.logLevelStart(_levelNum, {"StartLevel": _levelNum});
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
		else if (entityName == "water")
		{
			_water.add(new Water(x, y));
		}
		else 
		{
			var id:Int = Std.parseInt(entityData.get("_id"));
			if (entityName == "gate_vertical")
			{
				_gates.add(new VerticalGate(x, y, id));
			}
			else if (entityName == "gate_horizontal")
			{
				_gates.add(new HorizontalGate(x, y, id));
			}
			else if (entityName == "button")
			{
				_buttons.add(new Button(x, y, id));
			}
			else if (entityName == "hint") 
			{
				_hint = new Hint(x, y, id);
			}
			else if (entityName == "spike")
			{
				_spikes.add(new Spike(x, y));
			}
			else 
			{
				var on:Bool = entityData.get("_on").toLowerCase() == "true";
				if (entityName == "glass")
				{
					if (id == 0) 
					{
						_glass.add(new Glass(x, y, id, on));
					}
					else
					{
						if (on) 
						{
							_glassWithSwitch.add(new Glass(x, y, id, on));
						}
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
	 				var _power:Int = Std.parseInt(entityData.get("_power"));
					var rotation:Bool = (entityData.get("_rotation").toLowerCase() == "true");
					var range:Int;
					if (entityData.get("_range") == null)
					{
						range = 10;
					}
					else{
						range = Std.parseInt(entityData.get("_range"));
					}
					var fan:Fan = new Fan(x, y, id, dir, on, rotation, range, _power);
					_fans.add(fan);
				}
			}
		}

	}

	override public function update(elapsed:Float):Void
	{
		// If pressed "R", restart the game
		if (FlxG.keys.justPressed.R) {
			Main.LOGGER.logLevelAction(LoggingActions.CLICK_RESET, {level: _levelNum});
			FlxG.switchState(new PlayState());
		}

		// If pressed "M", return to level selection menu
		if (FlxG.keys.justPressed.M) {
			Main.LOGGER.logLevelAction(LoggingActions.CLICK_LEVELSELECTION, {level: _levelNum});
			FlxG.switchState(new LevelSelectState());
		}

		// If pressed "S", swap player and shadow
		if (FlxG.keys.justPressed.S) {
			var temp:Float = _player.x;
			_player.x = _shadow.x;
			_shadow.x = temp;
			temp = _player.y;
			_player.y = _shadow.y;
			_shadow.y = temp;

			// update local number swaps
			_numSwap++;
			_hud.setSwap(_numSwap);
			Main.LOGGER.logLevelAction(LoggingActions.PLAYER_SWAP);
		}

		super.update(elapsed);
		
		updateSwitches();
		updateFans();

		// Check for player collision with walls and entities
		FlxG.collide(_player, _mWalls);
		FlxG.collide(_shadow, _mWalls);
		FlxG.collide(_player, _glass);
		FlxG.collide(_player, _glassWithSwitch);
		FlxG.overlap(_player, _key, collectKey);
		FlxG.overlap(_player, _door, unlockDoor);
		FlxG.overlap(_spikes, _player, spikeKillPlayer);


		// Player / Water interaction
		if (_player.overlaps(_water)) {
			_player.inWater(true);
			if (!_timerOn)
			{
				_timerOn = true;
				_timeInWater.start(1, countDown, 11);
			}
		} else {
			_player.inWater(false);

			if (_timerOn)
			{
				_timerOn = false;
				_timeInWater.destroy();
				_counter = 10;
				_countDownText.text = "";
			}
		}

		// Player / Button interaction
		_buttons.forEachAlive(checkActivation, false);

		// Player / Glass Interaction
		_glassWithSwitch.forEachAlive(checkOn, false);

		// Player / Gate Interaction
		_gates.forEachAlive(checkRaised, false);
	}

	private function checkRaised(_O:FlxObject):Void
	{
		var _gate:Gate = cast _O;
		if (!_gate.isRaised()) 
		{
			FlxG.collide(_player, _gate);
			FlxG.collide(_shadow, _gate);
		}
	}

	private function checkOn(_O:FlxObject):Void
	{			
		var _glass:Glass = cast _O;
		if (!_glass.isOn()) 
		{
			FlxG.collide(_glass, _shadow);
		}
	}

	private function checkActivation(_O:FlxObject):Void
	{
		var _button:Button = cast _O;
		if (_player.overlaps(_button)) 
		{
			_gates.forEachAlive(openGateIfID.bind(_, _button.getId()), false);
			_button.buttonPressed();
		} 
		else 
		{
			_button.buttonReleased();
		}
	}

	// Countdown for player's remaining time in water.
	private function countDown(Timer:FlxTimer):Void
	{
		_countDownText.text = "" + _counter;
		if (_counter > 0)
			_counter--;
		else
		{
			waterKillPlayer();
			_countDownText.text = "";
		}
	}

	// Kill player by spike and restart the game.
	private function spikeKillPlayer(S:FlxObject = null, P:FlxObject = null):Void
	{
			Main.LOGGER.logLevelAction(LoggingActions.PLAYER_DIE, {"SpikeLevel" : _levelNum});
			FlxG.switchState(new LevelExitState());
	}

	// Kill player by water and restart the game.
	private function waterKillPlayer(S:FlxObject = null, P:FlxObject = null):Void
	{
			Main.LOGGER.logLevelAction(LoggingActions.PLAYER_DIE, {"WaterLevel" : _levelNum});
			FlxG.switchState(new LevelExitState());
	}

	// Destroy Key object when it is collected.
	private function collectKey(P:FlxObject, K:FlxObject):Void 
	{
		Reg.grabKey();
		_hud.updateHUD();
		K.kill();
	}

	// Check for key and handle player winning UI.
	private function unlockDoor(P:FlxObject, D:FlxObject):Void 
	{
		if (Reg.playerHasKey())
		{
			// If the last level (20), switch to end credit
			if (Reg.getCurrentLevel() == 20) {
				FlxG.switchState(new EndCredit());
			}
			else {
				Reg.logSuccessfulFinish();
				_door.openDoor();
				Reg.setNumSwap(_numSwap);
				FlxG.switchState(new LevelExitState());
			}
		}
	}

	private function openGateIfID(_O:FlxObject, _id:Int):Void
	{
		var _gate:Gate = cast _O;
		if (_gate.getId() == _id)
		{
			if (_gate.isRaised()) 
			{
				_timers.get(_id).reset();
			}
			else
			{
				_gate.raiseGate();
				_openGates.add(_gate);
				_timers.set(_id, new FlxTimer().start(1.0, dropGate, 1));
			}
		}
	}

	private function dropGate(Timer:FlxTimer):Void 
	{
		var gate:Gate = _openGates.pop();
		if (gate != null)
		{
			gate.dropGate();
		}
	}

	private function onSwitch(S:FlxObject, P:FlxObject):Void 
	{
		var s:Switch = cast S;
		// if player is already on the switch, do nothing
		if (s.isPressed()) 
		{
			return;
		}

		s.stepOn();
		var id:Int = s.getId();
		
		if (s.controlFan())
		{
			
			var itr:FlxTypedGroupIterator<Fan> = _fans.iterator();
			s.toggleSwitch();
			while(itr.hasNext()) 
			{
				var curFan:Fan = itr.next();
				if (curFan.getId() == id)
					curFan.toggle();
			}
		}
		else
		{
			var itr:FlxTypedGroupIterator<Glass> = _glassWithSwitch.iterator();
			s.toggleSwitch();
			while(itr.hasNext()) 
			{
				var curGlass:Glass = itr.next();
				if (curGlass.getId() == id)
				{
					curGlass.toggle();
					if (s.on()) 
					{
						curGlass.setAlpha(1);
					}
					else 
					{
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
		while(itr.hasNext()) 
		{
			var curSwitch:Switch = itr.next();
			if (curSwitch.isPressed()) 
			{
				if (!_player.overlaps(curSwitch)) 
				{
					curSwitch.stepOff();
				}
			} 
			else 
			{
				if (_player.overlaps(curSwitch)) 
				{
					onSwitch(curSwitch, _player);
				}
			}
		}
	}

	private function overlapsWithAnyFan(bbox:FlxRect):Bool
	{
		var iter:Iterator<Fan> = _fans.iterator();
		while(iter.hasNext())
		{
			var curFan:Fan = iter.next();
			if (curFan.isOn() && curFan.bbox().overlaps(bbox))
			{
				return true;
			}
		}
		return false;
	}

	private function updateFans():Void
	{
		_fans.forEachAlive(applyFanForce, false);
	}

	private function applyFanForce(_O:FlxObject):Void
	{
		var _fan:Fan = cast _O;
		if(_fan.isOn() && _fan.bbox().overlaps(_player.bbox()))
		{
			var _playerPoint:FlxPoint = new FlxPoint(_player.x, _player.y);
			var _fanPoint:FlxPoint = new FlxPoint(_fan.x, _fan.y);
			_player.updateFanForce(_fan.getPower(), _fan.getDir(), _playerPoint.distanceTo(_fanPoint));
		}
	}

}
