package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/Levels/uncomp.oel", "assets/data/Levels/uncomp.oel");
			type.set ("assets/data/Levels/uncomp.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Levels/_l1.oel", "assets/data/Levels/_l1.oel");
			type.set ("assets/data/Levels/_l1.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Levels/_l10.oel", "assets/data/Levels/_l10.oel");
			type.set ("assets/data/Levels/_l10.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Levels/_l11.oel", "assets/data/Levels/_l11.oel");
			type.set ("assets/data/Levels/_l11.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Levels/_l12.oel", "assets/data/Levels/_l12.oel");
			type.set ("assets/data/Levels/_l12.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Levels/_l13.oel", "assets/data/Levels/_l13.oel");
			type.set ("assets/data/Levels/_l13.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Levels/_l14.oel", "assets/data/Levels/_l14.oel");
			type.set ("assets/data/Levels/_l14.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Levels/_l17.oel", "assets/data/Levels/_l17.oel");
			type.set ("assets/data/Levels/_l17.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Levels/_l18.oel", "assets/data/Levels/_l18.oel");
			type.set ("assets/data/Levels/_l18.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Levels/_l19.oel", "assets/data/Levels/_l19.oel");
			type.set ("assets/data/Levels/_l19.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Levels/_l2.oel", "assets/data/Levels/_l2.oel");
			type.set ("assets/data/Levels/_l2.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Levels/_l3.oel", "assets/data/Levels/_l3.oel");
			type.set ("assets/data/Levels/_l3.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Levels/_l4.oel", "assets/data/Levels/_l4.oel");
			type.set ("assets/data/Levels/_l4.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Levels/_l5.oel", "assets/data/Levels/_l5.oel");
			type.set ("assets/data/Levels/_l5.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Levels/_l6.oel", "assets/data/Levels/_l6.oel");
			type.set ("assets/data/Levels/_l6.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Levels/_l7.oel", "assets/data/Levels/_l7.oel");
			type.set ("assets/data/Levels/_l7.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Shadow Swap.oep", "assets/data/Shadow Swap.oep");
			type.set ("assets/data/Shadow Swap.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Button.png", "assets/images/Button.png");
			type.set ("assets/images/Button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ButtonBackdrop.png", "assets/images/ButtonBackdrop.png");
			type.set ("assets/images/ButtonBackdrop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ButtonBackdrop2.png", "assets/images/ButtonBackdrop2.png");
			type.set ("assets/images/ButtonBackdrop2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ButtonBackdrop3.png", "assets/images/ButtonBackdrop3.png");
			type.set ("assets/images/ButtonBackdrop3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Button_Pressed.png", "assets/images/Button_Pressed.png");
			type.set ("assets/images/Button_Pressed.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Door.png", "assets/images/Door.png");
			type.set ("assets/images/Door.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Door_open.png", "assets/images/Door_open.png");
			type.set ("assets/images/Door_open.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Fan_off.png", "assets/images/Fan_off.png");
			type.set ("assets/images/Fan_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Fan_On.png", "assets/images/Fan_On.png");
			type.set ("assets/images/Fan_On.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Glass.png", "assets/images/Glass.png");
			type.set ("assets/images/Glass.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Ground.png", "assets/images/Ground.png");
			type.set ("assets/images/Ground.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Hint_S.png", "assets/images/Hint_S.png");
			type.set ("assets/images/Hint_S.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Key.png", "assets/images/Key.png");
			type.set ("assets/images/Key.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Key_slot.png", "assets/images/Key_slot.png");
			type.set ("assets/images/Key_slot.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Key_slot_filled.png", "assets/images/Key_slot_filled.png");
			type.set ("assets/images/Key_slot_filled.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Menu.png", "assets/images/Menu.png");
			type.set ("assets/images/Menu.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Next.png", "assets/images/Next.png");
			type.set ("assets/images/Next.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Reset.png", "assets/images/Reset.png");
			type.set ("assets/images/Reset.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Shadow.png", "assets/images/Shadow.png");
			type.set ("assets/images/Shadow.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Shadow2.png", "assets/images/Shadow2.png");
			type.set ("assets/images/Shadow2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Shadow3.png", "assets/images/Shadow3.png");
			type.set ("assets/images/Shadow3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Spike.png", "assets/images/Spike.png");
			type.set ("assets/images/Spike.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Switch.png", "assets/images/Switch.png");
			type.set ("assets/images/Switch.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tiles.png", "assets/images/tiles.png");
			type.set ("assets/images/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Water.png", "assets/images/Water.png");
			type.set ("assets/images/Water.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/White_spritesheet.png", "assets/images/White_spritesheet.png");
			type.set ("assets/images/White_spritesheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/White_spritesheet2.png", "assets/images/White_spritesheet2.png");
			type.set ("assets/images/White_spritesheet2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
