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

	private var _levels:Array<Dynamic>;
	private var _levelNum:Int;
	private var _timers:Map<Int, FlxTimer>;
	private var _timeInWater:FlxTimer;
	private var _timerOn:Bool;
	private var _counter:Int;
	private var _countDownText:FlxText;
	private var _hint:Hint;
	private var _winText:FlxText;
	private var _loseText:FlxText;

	private var _hud:HUD;
	//private var _nextButton:FlxButton;

	override public function create():Void 
	{
		_levels = new Array();

		// Initialize level tilemap paths
		_levels[1] = AssetPaths._l1__oel;
		_levels[2] = AssetPaths._l2__oel;
		_levels[3] = AssetPaths._l3__oel;
		_levels[4] = AssetPaths._l4__oel;
		_levels[5] = AssetPaths._l5__oel;
		_levels[6] = AssetPaths._l6__oel;
		_levels[7] = AssetPaths._l7__oel;
		_levels[8] = AssetPaths._l10__oel;
		_levels[9] = AssetPaths._l11__oel;
		_levels[10] = AssetPaths._l12__oel;
		_levels[11] = AssetPaths._l13__oel;
		_levels[12] = AssetPaths._l14__oel;
		_levels[13] = AssetPaths._l17__oel;
		_levels[14] = AssetPaths._l18__oel;
		_levels[15] = AssetPaths._l19__oel;

		// New levels to be completed!!
		_levels[16] = AssetPaths._l19__oel;
		_levels[17] = AssetPaths._l19__oel;
		_levels[18] = AssetPaths._l19__oel;
		_levels[19] = AssetPaths._l19__oel;
		_levels[20] = AssetPaths._l19__oel;


		_timers = new Map<Int, FlxTimer>();
		_levelNum = Reg.getCurrentLevel();

		// Import tile map
		_map = new FlxOgmoLoader(_levels[_levelNum]);
		_mWalls = _map.loadTilemap(AssetPaths.tiles__png, 32, 32, "walls");
		_mWalls.follow();
  		_mWalls.setTileProperties(1, FlxObject.ANY); // ground
  		_mWalls.setTileProperties(2, FlxObject.ANY); // ground
  		_mWalls.setTileProperties(3, FlxObject.NONE); // ground
 		add(_mWalls);
	
 		// Import tile map non-collidible layer
		_background = _map.loadTilemap(AssetPaths.tiles__png, 32, 32, "background");
		_background.follow();
		_background.setTileProperties(1, FlxObject.NONE);
		add(_background);

		// Resize screen to fit tilemap at center
		flixel.FlxCamera.defaultZoom = 1;
		FlxG.cameras.reset();
		FlxG.camera.setSize((cast _mWalls.width), 720);
		FlxG.camera.x = (FlxG.width - _mWalls.width) / 2;

		// Create HUD
		_hud = new HUD(_levelNum);

		// Initialize water related components
		_timeInWater = new FlxTimer();
		_counter = 10;
		_countDownText = new FlxText(_mWalls.width / 2 - 32, _mWalls.height / 2, FlxG.width, "", 64);
		_countDownText.systemFont = "Arial Black";

		// Initialize winning and losing display
		_loseText = new FlxText(_mWalls.width / 2 - 70, _mWalls.height / 2, 0, "", 25);
		_loseText.systemFont = "Arial Black";
		_winText = new FlxText(_mWalls.width / 2 - 70, _mWalls.height / 2, 0, "", 25);
		_winText.systemFont = "Arial Black";

		// Create and Hide the "Next" button
		// _nextButton = new FlxButton(_mWalls.width / 2, _mWalls.height / 2 + _winText.height, "", promptNext);
		// _nextButton.loadGraphic(AssetPaths.Next__png, true, 50, 30);
		// _nextButton.x -= _nextButton.width / 2;
		// _nextButton.active = false;
		// _nextButton.visible = false;

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
		
		// Initialze Got key to false
		Reg.gotKey = false;

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
		add(_loseText);
		//add(_nextButton);
		add(_winText);
		if (_hint != null)
			add(_hint);

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
					var rotation:Bool = (entityData.get("_rotation").toLowerCase() == "true");
					var fan:Fan = new Fan(x, y, id, dir, on, rotation);
					_fans.add(fan);
				}
			}
		}

	}

	override public function update(elapsed:Float):Void
	{
		// If pressed "R", restart the game
		if (FlxG.keys.justPressed.R) {
			FlxG.switchState(new PlayState());
			Main.LOGGER.logLevelAction(LoggingActions.CLICK_RESET, {level: _levelNum});
		}

		// If pressed "M", return to level selection menu
		if (FlxG.keys.justPressed.M) {
			FlxG.switchState(new LevelSelectState());
			Main.LOGGER.logLevelAction(LoggingActions.CLICK_LEVELSELECTION, {level: _levelNum});
		}

		// If pressed "S", swap player and shadow
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

		// Check for player collision with walls and entities
		FlxG.collide(_player, _mWalls);
		FlxG.collide(_shadow, _mWalls);
		FlxG.collide(_player, _glass);
		FlxG.collide(_player, _glassWithSwitch);
		FlxG.overlap(_player, _key, collectKey);
		FlxG.overlap(_player, _door, unlockDoor);
		FlxG.overlap(_spikes, _player, killPlayer);


		// Player / Water interaction
		if (_player.overlaps(_water)) {
			_player.inWater(true);
			if (!_timerOn) {

				_timerOn = true;
				_timeInWater.start(1, countDown, 11);
			}
		} else {
			_player.inWater(false);

			if (_timerOn) {
				_timerOn = false;
				_timeInWater.destroy();
				_counter = 10;
				_countDownText.text = "";
			}
		}

		// Player / Button interaction
		var button_iter:FlxTypedGroupIterator<Button> = _buttons.iterator();
		while (button_iter.hasNext()) 
		{
			var curButton:Button = button_iter.next();
			if (_player.overlaps(curButton)) 
			{
				raiseGate(curButton);
				curButton.buttonPressed();
			} 
			else 
			{
				curButton.buttonReleased();
			}
		}

		// Player / Glass Interaction
		var glass_iter:FlxTypedGroupIterator<Glass> = _glassWithSwitch.iterator();
		while (glass_iter.hasNext()) 
		{
			var curGlass:Glass = glass_iter.next();
			if (!curGlass.isOn()) 
			{
				FlxG.collide(curGlass, _shadow);
			}
		}

		// Player / Gate Interaction
		var gate_iter:FlxTypedGroupIterator<Gate> = _gates.iterator();
		while (gate_iter.hasNext()) 
		{
			var curGate:Gate = gate_iter.next();
			if (!curGate.isRaised()) 
			{
				FlxG.collide(_player, curGate);
				FlxG.collide(_shadow, curGate);
			}
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
			killPlayer();
			_countDownText.text = "";
		}
	}

	// Kill player and restart the game.
	private function killPlayer(S:FlxObject = null, P:FlxObject = null):Void
	{
			_loseText.text = "YOU DIED.";
			_player.kill();
			haxe.Timer.delay(FlxG.switchState.bind(new PlayState()), 800);

			Main.LOGGER.logLevelAction(LoggingActions.PLAYER_DIE, {level: _levelNum});
	}

	// Destroy Key object when it is collected.
	private function collectKey(P:FlxObject, K:FlxObject):Void 
	{
		_hud.updateHUD();
		K.kill();
	}

	// Check for key and handle player winning UI.
	private function unlockDoor(P:FlxObject, D:FlxObject):Void 
	{
		if (Reg.gotKey)
		{
			_door.openDoor();
			Main.LOGGER.logLevelEnd({won: true});
			
			// If it's the last level, enter end credit
			if (_levelNum == 20) {
				FlxG.switchState(new EndCredit());
			} 
			// Activate "Next" button if it's not the last level
			else if (_levelNum < 20) {

			//_winText.text = "YOU WIN!";

			// // Activate "Next" button
			// if (_levelNum < 20) {
			// 	_nextButton.active = true;
			// 	_nextButton.visible = true;
			// }
			
			// // If pressed "Enter", go to next level
			// if (FlxG.keys.justPressed.ENTER)
			// 	promptNext();
<<<<<<< HEAD
=======

			Main.LOGGER.logLevelEnd({won: true});
>>>>>>> b9a8b5e1d40e64e11ba26d000ea449f408e524ce

			// Save the current furthest progress
			// if (_levelNum + 1 > Reg.loadLevel()) {
			// 	Reg.saveLevel(_levelNum + 1);
			// 	LevelSelectState.updateLevelUnlocked(_levelNum + 1);
			// }
<<<<<<< HEAD
				FlxG.switchState(new FinishScreenState());
			}
=======
			FlxG.switchState(new FinishScreenState());
>>>>>>> b9a8b5e1d40e64e11ba26d000ea449f408e524ce
		}
	}

	private function raiseGate(button:Button):Void 
	{
		var id:Int = button.getId();
		var itr:FlxTypedGroupIterator<Gate> = _gates.iterator();
		var curGate:Gate = new Gate();

		while(itr.hasNext()) 
		{
			curGate = itr.next();
			if (curGate.getId() == id)
			{
				if (curGate.isRaised()) 
				{
					_timers.get(id).reset();
				}
				else
				{
					curGate.raiseGate();
					Reg.currentGates.add(curGate);
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
		while(itr.hasNext()) 
		{
			var curFan:Fan = itr.next();
			if (curFan.isOn()) 
			{
				var size:Float = curFan.width;
				var numBlocks:Float = 10;
				switch (curFan.getDir())
				{
                    // up
                    case 0:
					 	if (!overlapsWithAnyFan(_player.bbox()))
						{
							_player.acceleration.y = _player.gravity;
							_player.setDefaultSpeed(0);
						}
						else if (_player.bbox().overlaps(curFan.bbox()))
						{
                            _player.velocity.y = -200;
							_player.acceleration.y = 0;
						}
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
					 	if (!overlapsWithAnyFan(_player.bbox()))
						{
							_player.acceleration.y = _player.gravity;
							_player.setDefaultSpeed(0);
						}
                        else if (_player.bbox().overlaps(curFan.bbox()))
						{
                            _player.velocity.y = 200;
							_player.acceleration.y = 0;
						}
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
