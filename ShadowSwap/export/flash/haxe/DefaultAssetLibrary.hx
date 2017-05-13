package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/Levels/uncomp.oel", __ASSET__assets_data_levels_uncomp_oel);
		type.set ("assets/data/Levels/uncomp.oel", AssetType.TEXT);
		className.set ("assets/data/Levels/_l1.oel", __ASSET__assets_data_levels__l1_oel);
		type.set ("assets/data/Levels/_l1.oel", AssetType.TEXT);
		className.set ("assets/data/Levels/_l10.oel", __ASSET__assets_data_levels__l10_oel);
		type.set ("assets/data/Levels/_l10.oel", AssetType.TEXT);
		className.set ("assets/data/Levels/_l11.oel", __ASSET__assets_data_levels__l11_oel);
		type.set ("assets/data/Levels/_l11.oel", AssetType.TEXT);
		className.set ("assets/data/Levels/_l12.oel", __ASSET__assets_data_levels__l12_oel);
		type.set ("assets/data/Levels/_l12.oel", AssetType.TEXT);
		className.set ("assets/data/Levels/_l13.oel", __ASSET__assets_data_levels__l13_oel);
		type.set ("assets/data/Levels/_l13.oel", AssetType.TEXT);
		className.set ("assets/data/Levels/_l14.oel", __ASSET__assets_data_levels__l14_oel);
		type.set ("assets/data/Levels/_l14.oel", AssetType.TEXT);
		className.set ("assets/data/Levels/_l17.oel", __ASSET__assets_data_levels__l17_oel);
		type.set ("assets/data/Levels/_l17.oel", AssetType.TEXT);
		className.set ("assets/data/Levels/_l18.oel", __ASSET__assets_data_levels__l18_oel);
		type.set ("assets/data/Levels/_l18.oel", AssetType.TEXT);
		className.set ("assets/data/Levels/_l19.oel", __ASSET__assets_data_levels__l19_oel);
		type.set ("assets/data/Levels/_l19.oel", AssetType.TEXT);
		className.set ("assets/data/Levels/_l2.oel", __ASSET__assets_data_levels__l2_oel);
		type.set ("assets/data/Levels/_l2.oel", AssetType.TEXT);
		className.set ("assets/data/Levels/_l20.oel", __ASSET__assets_data_levels__l20_oel);
		type.set ("assets/data/Levels/_l20.oel", AssetType.TEXT);
		className.set ("assets/data/Levels/_l3.oel", __ASSET__assets_data_levels__l3_oel);
		type.set ("assets/data/Levels/_l3.oel", AssetType.TEXT);
		className.set ("assets/data/Levels/_l4.oel", __ASSET__assets_data_levels__l4_oel);
		type.set ("assets/data/Levels/_l4.oel", AssetType.TEXT);
		className.set ("assets/data/Levels/_l5.oel", __ASSET__assets_data_levels__l5_oel);
		type.set ("assets/data/Levels/_l5.oel", AssetType.TEXT);
		className.set ("assets/data/Levels/_l6.oel", __ASSET__assets_data_levels__l6_oel);
		type.set ("assets/data/Levels/_l6.oel", AssetType.TEXT);
		className.set ("assets/data/Levels/_l7.oel", __ASSET__assets_data_levels__l7_oel);
		type.set ("assets/data/Levels/_l7.oel", AssetType.TEXT);
		className.set ("assets/data/Shadow Swap.oep", __ASSET__assets_data_shadow_swap_oep);
		type.set ("assets/data/Shadow Swap.oep", AssetType.TEXT);
		className.set ("assets/images/Button.png", __ASSET__assets_images_button_png);
		type.set ("assets/images/Button.png", AssetType.IMAGE);
		className.set ("assets/images/ButtonBackdrop.png", __ASSET__assets_images_buttonbackdrop_png);
		type.set ("assets/images/ButtonBackdrop.png", AssetType.IMAGE);
		className.set ("assets/images/ButtonBackdrop2.png", __ASSET__assets_images_buttonbackdrop2_png);
		type.set ("assets/images/ButtonBackdrop2.png", AssetType.IMAGE);
		className.set ("assets/images/ButtonBackdrop3.png", __ASSET__assets_images_buttonbackdrop3_png);
		type.set ("assets/images/ButtonBackdrop3.png", AssetType.IMAGE);
		className.set ("assets/images/Button_Pressed.png", __ASSET__assets_images_button_pressed_png);
		type.set ("assets/images/Button_Pressed.png", AssetType.IMAGE);
		className.set ("assets/images/Door.png", __ASSET__assets_images_door_png);
		type.set ("assets/images/Door.png", AssetType.IMAGE);
		className.set ("assets/images/Door_open.png", __ASSET__assets_images_door_open_png);
		type.set ("assets/images/Door_open.png", AssetType.IMAGE);
		className.set ("assets/images/Fan_off.png", __ASSET__assets_images_fan_off_png);
		type.set ("assets/images/Fan_off.png", AssetType.IMAGE);
		className.set ("assets/images/Fan_On.png", __ASSET__assets_images_fan_on_png);
		type.set ("assets/images/Fan_On.png", AssetType.IMAGE);
		className.set ("assets/images/Glass.png", __ASSET__assets_images_glass_png);
		type.set ("assets/images/Glass.png", AssetType.IMAGE);
		className.set ("assets/images/Ground.png", __ASSET__assets_images_ground_png);
		type.set ("assets/images/Ground.png", AssetType.IMAGE);
		className.set ("assets/images/Hint_S.png", __ASSET__assets_images_hint_s_png);
		type.set ("assets/images/Hint_S.png", AssetType.IMAGE);
		className.set ("assets/images/Key.png", __ASSET__assets_images_key_png);
		type.set ("assets/images/Key.png", AssetType.IMAGE);
		className.set ("assets/images/Key_slot.png", __ASSET__assets_images_key_slot_png);
		type.set ("assets/images/Key_slot.png", AssetType.IMAGE);
		className.set ("assets/images/Key_slot_filled.png", __ASSET__assets_images_key_slot_filled_png);
		type.set ("assets/images/Key_slot_filled.png", AssetType.IMAGE);
		className.set ("assets/images/levelButton.png", __ASSET__assets_images_levelbutton_png);
		type.set ("assets/images/levelButton.png", AssetType.IMAGE);
		className.set ("assets/images/levelButton1.png", __ASSET__assets_images_levelbutton1_png);
		type.set ("assets/images/levelButton1.png", AssetType.IMAGE);
		className.set ("assets/images/levelButton2.png", __ASSET__assets_images_levelbutton2_png);
		type.set ("assets/images/levelButton2.png", AssetType.IMAGE);
		className.set ("assets/images/levelButton3.png", __ASSET__assets_images_levelbutton3_png);
		type.set ("assets/images/levelButton3.png", AssetType.IMAGE);
		className.set ("assets/images/levelButton4.png", __ASSET__assets_images_levelbutton4_png);
		type.set ("assets/images/levelButton4.png", AssetType.IMAGE);
		className.set ("assets/images/Menu.png", __ASSET__assets_images_menu_png);
		type.set ("assets/images/Menu.png", AssetType.IMAGE);
		className.set ("assets/images/Next.png", __ASSET__assets_images_next_png);
		type.set ("assets/images/Next.png", AssetType.IMAGE);
		className.set ("assets/images/Play.png", __ASSET__assets_images_play_png);
		type.set ("assets/images/Play.png", AssetType.IMAGE);
		className.set ("assets/images/Reset.png", __ASSET__assets_images_reset_png);
		type.set ("assets/images/Reset.png", AssetType.IMAGE);
		className.set ("assets/images/Shadow.png", __ASSET__assets_images_shadow_png);
		type.set ("assets/images/Shadow.png", AssetType.IMAGE);
		className.set ("assets/images/Shadow2.png", __ASSET__assets_images_shadow2_png);
		type.set ("assets/images/Shadow2.png", AssetType.IMAGE);
		className.set ("assets/images/Shadow3.png", __ASSET__assets_images_shadow3_png);
		type.set ("assets/images/Shadow3.png", AssetType.IMAGE);
		className.set ("assets/images/Spike.png", __ASSET__assets_images_spike_png);
		type.set ("assets/images/Spike.png", AssetType.IMAGE);
		className.set ("assets/images/Stars0.png", __ASSET__assets_images_stars0_png);
		type.set ("assets/images/Stars0.png", AssetType.IMAGE);
		className.set ("assets/images/Stars1.png", __ASSET__assets_images_stars1_png);
		type.set ("assets/images/Stars1.png", AssetType.IMAGE);
		className.set ("assets/images/Stars2.png", __ASSET__assets_images_stars2_png);
		type.set ("assets/images/Stars2.png", AssetType.IMAGE);
		className.set ("assets/images/Stars3.png", __ASSET__assets_images_stars3_png);
		type.set ("assets/images/Stars3.png", AssetType.IMAGE);
		className.set ("assets/images/Switch.png", __ASSET__assets_images_switch_png);
		type.set ("assets/images/Switch.png", AssetType.IMAGE);
		className.set ("assets/images/tiles.png", __ASSET__assets_images_tiles_png);
		type.set ("assets/images/tiles.png", AssetType.IMAGE);
		className.set ("assets/images/Water.png", __ASSET__assets_images_water_png);
		type.set ("assets/images/Water.png", AssetType.IMAGE);
		className.set ("assets/images/White_spritesheet.png", __ASSET__assets_images_white_spritesheet_png);
		type.set ("assets/images/White_spritesheet.png", AssetType.IMAGE);
		className.set ("assets/images/White_spritesheet2.png", __ASSET__assets_images_white_spritesheet2_png);
		type.set ("assets/images/White_spritesheet2.png", AssetType.IMAGE);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		type.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		type.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/Levels/uncomp.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Levels/_l1.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Levels/_l10.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Levels/_l11.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Levels/_l12.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Levels/_l13.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Levels/_l14.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Levels/_l17.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Levels/_l18.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Levels/_l19.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Levels/_l2.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Levels/_l20.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Levels/_l3.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Levels/_l4.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Levels/_l5.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Levels/_l6.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Levels/_l7.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Shadow Swap.oep";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/Button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ButtonBackdrop.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ButtonBackdrop2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ButtonBackdrop3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Button_Pressed.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Door.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Door_open.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Fan_off.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Fan_On.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Glass.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Ground.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Hint_S.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Key.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Key_slot.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Key_slot_filled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/levelButton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/levelButton1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/levelButton2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/levelButton3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/levelButton4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Menu.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Next.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Play.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Reset.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Shadow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Shadow2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Shadow3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Spike.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Stars0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Stars1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Stars2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Stars3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Switch.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tiles.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Water.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/White_spritesheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/White_spritesheet2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/Levels/uncomp.oel", __ASSET__assets_data_levels_uncomp_oel);
		type.set ("assets/data/Levels/uncomp.oel", AssetType.TEXT);
		
		className.set ("assets/data/Levels/_l1.oel", __ASSET__assets_data_levels__l1_oel);
		type.set ("assets/data/Levels/_l1.oel", AssetType.TEXT);
		
		className.set ("assets/data/Levels/_l10.oel", __ASSET__assets_data_levels__l10_oel);
		type.set ("assets/data/Levels/_l10.oel", AssetType.TEXT);
		
		className.set ("assets/data/Levels/_l11.oel", __ASSET__assets_data_levels__l11_oel);
		type.set ("assets/data/Levels/_l11.oel", AssetType.TEXT);
		
		className.set ("assets/data/Levels/_l12.oel", __ASSET__assets_data_levels__l12_oel);
		type.set ("assets/data/Levels/_l12.oel", AssetType.TEXT);
		
		className.set ("assets/data/Levels/_l13.oel", __ASSET__assets_data_levels__l13_oel);
		type.set ("assets/data/Levels/_l13.oel", AssetType.TEXT);
		
		className.set ("assets/data/Levels/_l14.oel", __ASSET__assets_data_levels__l14_oel);
		type.set ("assets/data/Levels/_l14.oel", AssetType.TEXT);
		
		className.set ("assets/data/Levels/_l17.oel", __ASSET__assets_data_levels__l17_oel);
		type.set ("assets/data/Levels/_l17.oel", AssetType.TEXT);
		
		className.set ("assets/data/Levels/_l18.oel", __ASSET__assets_data_levels__l18_oel);
		type.set ("assets/data/Levels/_l18.oel", AssetType.TEXT);
		
		className.set ("assets/data/Levels/_l19.oel", __ASSET__assets_data_levels__l19_oel);
		type.set ("assets/data/Levels/_l19.oel", AssetType.TEXT);
		
		className.set ("assets/data/Levels/_l2.oel", __ASSET__assets_data_levels__l2_oel);
		type.set ("assets/data/Levels/_l2.oel", AssetType.TEXT);
		
		className.set ("assets/data/Levels/_l20.oel", __ASSET__assets_data_levels__l20_oel);
		type.set ("assets/data/Levels/_l20.oel", AssetType.TEXT);
		
		className.set ("assets/data/Levels/_l3.oel", __ASSET__assets_data_levels__l3_oel);
		type.set ("assets/data/Levels/_l3.oel", AssetType.TEXT);
		
		className.set ("assets/data/Levels/_l4.oel", __ASSET__assets_data_levels__l4_oel);
		type.set ("assets/data/Levels/_l4.oel", AssetType.TEXT);
		
		className.set ("assets/data/Levels/_l5.oel", __ASSET__assets_data_levels__l5_oel);
		type.set ("assets/data/Levels/_l5.oel", AssetType.TEXT);
		
		className.set ("assets/data/Levels/_l6.oel", __ASSET__assets_data_levels__l6_oel);
		type.set ("assets/data/Levels/_l6.oel", AssetType.TEXT);
		
		className.set ("assets/data/Levels/_l7.oel", __ASSET__assets_data_levels__l7_oel);
		type.set ("assets/data/Levels/_l7.oel", AssetType.TEXT);
		
		className.set ("assets/data/Shadow Swap.oep", __ASSET__assets_data_shadow_swap_oep);
		type.set ("assets/data/Shadow Swap.oep", AssetType.TEXT);
		
		className.set ("assets/images/Button.png", __ASSET__assets_images_button_png);
		type.set ("assets/images/Button.png", AssetType.IMAGE);
		
		className.set ("assets/images/ButtonBackdrop.png", __ASSET__assets_images_buttonbackdrop_png);
		type.set ("assets/images/ButtonBackdrop.png", AssetType.IMAGE);
		
		className.set ("assets/images/ButtonBackdrop2.png", __ASSET__assets_images_buttonbackdrop2_png);
		type.set ("assets/images/ButtonBackdrop2.png", AssetType.IMAGE);
		
		className.set ("assets/images/ButtonBackdrop3.png", __ASSET__assets_images_buttonbackdrop3_png);
		type.set ("assets/images/ButtonBackdrop3.png", AssetType.IMAGE);
		
		className.set ("assets/images/Button_Pressed.png", __ASSET__assets_images_button_pressed_png);
		type.set ("assets/images/Button_Pressed.png", AssetType.IMAGE);
		
		className.set ("assets/images/Door.png", __ASSET__assets_images_door_png);
		type.set ("assets/images/Door.png", AssetType.IMAGE);
		
		className.set ("assets/images/Door_open.png", __ASSET__assets_images_door_open_png);
		type.set ("assets/images/Door_open.png", AssetType.IMAGE);
		
		className.set ("assets/images/Fan_off.png", __ASSET__assets_images_fan_off_png);
		type.set ("assets/images/Fan_off.png", AssetType.IMAGE);
		
		className.set ("assets/images/Fan_On.png", __ASSET__assets_images_fan_on_png);
		type.set ("assets/images/Fan_On.png", AssetType.IMAGE);
		
		className.set ("assets/images/Glass.png", __ASSET__assets_images_glass_png);
		type.set ("assets/images/Glass.png", AssetType.IMAGE);
		
		className.set ("assets/images/Ground.png", __ASSET__assets_images_ground_png);
		type.set ("assets/images/Ground.png", AssetType.IMAGE);
		
		className.set ("assets/images/Hint_S.png", __ASSET__assets_images_hint_s_png);
		type.set ("assets/images/Hint_S.png", AssetType.IMAGE);
		
		className.set ("assets/images/Key.png", __ASSET__assets_images_key_png);
		type.set ("assets/images/Key.png", AssetType.IMAGE);
		
		className.set ("assets/images/Key_slot.png", __ASSET__assets_images_key_slot_png);
		type.set ("assets/images/Key_slot.png", AssetType.IMAGE);
		
		className.set ("assets/images/Key_slot_filled.png", __ASSET__assets_images_key_slot_filled_png);
		type.set ("assets/images/Key_slot_filled.png", AssetType.IMAGE);
		
		className.set ("assets/images/levelButton.png", __ASSET__assets_images_levelbutton_png);
		type.set ("assets/images/levelButton.png", AssetType.IMAGE);
		
		className.set ("assets/images/levelButton1.png", __ASSET__assets_images_levelbutton1_png);
		type.set ("assets/images/levelButton1.png", AssetType.IMAGE);
		
		className.set ("assets/images/levelButton2.png", __ASSET__assets_images_levelbutton2_png);
		type.set ("assets/images/levelButton2.png", AssetType.IMAGE);
		
		className.set ("assets/images/levelButton3.png", __ASSET__assets_images_levelbutton3_png);
		type.set ("assets/images/levelButton3.png", AssetType.IMAGE);
		
		className.set ("assets/images/levelButton4.png", __ASSET__assets_images_levelbutton4_png);
		type.set ("assets/images/levelButton4.png", AssetType.IMAGE);
		
		className.set ("assets/images/Menu.png", __ASSET__assets_images_menu_png);
		type.set ("assets/images/Menu.png", AssetType.IMAGE);
		
		className.set ("assets/images/Next.png", __ASSET__assets_images_next_png);
		type.set ("assets/images/Next.png", AssetType.IMAGE);
		
		className.set ("assets/images/Play.png", __ASSET__assets_images_play_png);
		type.set ("assets/images/Play.png", AssetType.IMAGE);
		
		className.set ("assets/images/Reset.png", __ASSET__assets_images_reset_png);
		type.set ("assets/images/Reset.png", AssetType.IMAGE);
		
		className.set ("assets/images/Shadow.png", __ASSET__assets_images_shadow_png);
		type.set ("assets/images/Shadow.png", AssetType.IMAGE);
		
		className.set ("assets/images/Shadow2.png", __ASSET__assets_images_shadow2_png);
		type.set ("assets/images/Shadow2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Shadow3.png", __ASSET__assets_images_shadow3_png);
		type.set ("assets/images/Shadow3.png", AssetType.IMAGE);
		
		className.set ("assets/images/Spike.png", __ASSET__assets_images_spike_png);
		type.set ("assets/images/Spike.png", AssetType.IMAGE);
		
		className.set ("assets/images/Stars0.png", __ASSET__assets_images_stars0_png);
		type.set ("assets/images/Stars0.png", AssetType.IMAGE);
		
		className.set ("assets/images/Stars1.png", __ASSET__assets_images_stars1_png);
		type.set ("assets/images/Stars1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Stars2.png", __ASSET__assets_images_stars2_png);
		type.set ("assets/images/Stars2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Stars3.png", __ASSET__assets_images_stars3_png);
		type.set ("assets/images/Stars3.png", AssetType.IMAGE);
		
		className.set ("assets/images/Switch.png", __ASSET__assets_images_switch_png);
		type.set ("assets/images/Switch.png", AssetType.IMAGE);
		
		className.set ("assets/images/tiles.png", __ASSET__assets_images_tiles_png);
		type.set ("assets/images/tiles.png", AssetType.IMAGE);
		
		className.set ("assets/images/Water.png", __ASSET__assets_images_water_png);
		type.set ("assets/images/Water.png", AssetType.IMAGE);
		
		className.set ("assets/images/White_spritesheet.png", __ASSET__assets_images_white_spritesheet_png);
		type.set ("assets/images/White_spritesheet.png", AssetType.IMAGE);
		
		className.set ("assets/images/White_spritesheet2.png", __ASSET__assets_images_white_spritesheet2_png);
		type.set ("assets/images/White_spritesheet2.png", AssetType.IMAGE);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		type.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		type.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_levels_uncomp_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels__l1_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels__l10_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels__l11_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels__l12_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels__l13_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels__l14_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels__l17_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels__l18_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels__l19_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels__l2_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels__l20_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels__l3_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels__l4_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels__l5_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels__l6_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels__l7_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_shadow_swap_oep extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_buttonbackdrop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_buttonbackdrop2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_buttonbackdrop3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_button_pressed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_door_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_door_open_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fan_off_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fan_on_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_glass_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hint_s_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_key_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_key_slot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_key_slot_filled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_levelbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_levelbutton1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_levelbutton2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_levelbutton3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_levelbutton4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_next_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_play_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_reset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_shadow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_shadow2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_shadow3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_spike_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_stars0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_stars1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_stars2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_stars3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_switch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_water_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_white_spritesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_white_spritesheet2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5




























































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 




#else



#if (windows || mac || linux || cpp)


@:file("assets/data/Levels/uncomp.oel") #if display private #end class __ASSET__assets_data_levels_uncomp_oel extends lime.utils.Bytes {}
@:file("assets/data/Levels/_l1.oel") #if display private #end class __ASSET__assets_data_levels__l1_oel extends lime.utils.Bytes {}
@:file("assets/data/Levels/_l10.oel") #if display private #end class __ASSET__assets_data_levels__l10_oel extends lime.utils.Bytes {}
@:file("assets/data/Levels/_l11.oel") #if display private #end class __ASSET__assets_data_levels__l11_oel extends lime.utils.Bytes {}
@:file("assets/data/Levels/_l12.oel") #if display private #end class __ASSET__assets_data_levels__l12_oel extends lime.utils.Bytes {}
@:file("assets/data/Levels/_l13.oel") #if display private #end class __ASSET__assets_data_levels__l13_oel extends lime.utils.Bytes {}
@:file("assets/data/Levels/_l14.oel") #if display private #end class __ASSET__assets_data_levels__l14_oel extends lime.utils.Bytes {}
@:file("assets/data/Levels/_l17.oel") #if display private #end class __ASSET__assets_data_levels__l17_oel extends lime.utils.Bytes {}
@:file("assets/data/Levels/_l18.oel") #if display private #end class __ASSET__assets_data_levels__l18_oel extends lime.utils.Bytes {}
@:file("assets/data/Levels/_l19.oel") #if display private #end class __ASSET__assets_data_levels__l19_oel extends lime.utils.Bytes {}
@:file("assets/data/Levels/_l2.oel") #if display private #end class __ASSET__assets_data_levels__l2_oel extends lime.utils.Bytes {}
@:file("assets/data/Levels/_l20.oel") #if display private #end class __ASSET__assets_data_levels__l20_oel extends lime.utils.Bytes {}
@:file("assets/data/Levels/_l3.oel") #if display private #end class __ASSET__assets_data_levels__l3_oel extends lime.utils.Bytes {}
@:file("assets/data/Levels/_l4.oel") #if display private #end class __ASSET__assets_data_levels__l4_oel extends lime.utils.Bytes {}
@:file("assets/data/Levels/_l5.oel") #if display private #end class __ASSET__assets_data_levels__l5_oel extends lime.utils.Bytes {}
@:file("assets/data/Levels/_l6.oel") #if display private #end class __ASSET__assets_data_levels__l6_oel extends lime.utils.Bytes {}
@:file("assets/data/Levels/_l7.oel") #if display private #end class __ASSET__assets_data_levels__l7_oel extends lime.utils.Bytes {}
@:file("assets/data/Shadow Swap.oep") #if display private #end class __ASSET__assets_data_shadow_swap_oep extends lime.utils.Bytes {}
@:image("assets/images/Button.png") #if display private #end class __ASSET__assets_images_button_png extends lime.graphics.Image {}
@:image("assets/images/ButtonBackdrop.png") #if display private #end class __ASSET__assets_images_buttonbackdrop_png extends lime.graphics.Image {}
@:image("assets/images/ButtonBackdrop2.png") #if display private #end class __ASSET__assets_images_buttonbackdrop2_png extends lime.graphics.Image {}
@:image("assets/images/ButtonBackdrop3.png") #if display private #end class __ASSET__assets_images_buttonbackdrop3_png extends lime.graphics.Image {}
@:image("assets/images/Button_Pressed.png") #if display private #end class __ASSET__assets_images_button_pressed_png extends lime.graphics.Image {}
@:image("assets/images/Door.png") #if display private #end class __ASSET__assets_images_door_png extends lime.graphics.Image {}
@:image("assets/images/Door_open.png") #if display private #end class __ASSET__assets_images_door_open_png extends lime.graphics.Image {}
@:image("assets/images/Fan_off.png") #if display private #end class __ASSET__assets_images_fan_off_png extends lime.graphics.Image {}
@:image("assets/images/Fan_On.png") #if display private #end class __ASSET__assets_images_fan_on_png extends lime.graphics.Image {}
@:image("assets/images/Glass.png") #if display private #end class __ASSET__assets_images_glass_png extends lime.graphics.Image {}
@:image("assets/images/Ground.png") #if display private #end class __ASSET__assets_images_ground_png extends lime.graphics.Image {}
@:image("assets/images/Hint_S.png") #if display private #end class __ASSET__assets_images_hint_s_png extends lime.graphics.Image {}
@:image("assets/images/Key.png") #if display private #end class __ASSET__assets_images_key_png extends lime.graphics.Image {}
@:image("assets/images/Key_slot.png") #if display private #end class __ASSET__assets_images_key_slot_png extends lime.graphics.Image {}
@:image("assets/images/Key_slot_filled.png") #if display private #end class __ASSET__assets_images_key_slot_filled_png extends lime.graphics.Image {}
@:image("assets/images/levelButton.png") #if display private #end class __ASSET__assets_images_levelbutton_png extends lime.graphics.Image {}
@:image("assets/images/levelButton1.png") #if display private #end class __ASSET__assets_images_levelbutton1_png extends lime.graphics.Image {}
@:image("assets/images/levelButton2.png") #if display private #end class __ASSET__assets_images_levelbutton2_png extends lime.graphics.Image {}
@:image("assets/images/levelButton3.png") #if display private #end class __ASSET__assets_images_levelbutton3_png extends lime.graphics.Image {}
@:image("assets/images/levelButton4.png") #if display private #end class __ASSET__assets_images_levelbutton4_png extends lime.graphics.Image {}
@:image("assets/images/Menu.png") #if display private #end class __ASSET__assets_images_menu_png extends lime.graphics.Image {}
@:image("assets/images/Next.png") #if display private #end class __ASSET__assets_images_next_png extends lime.graphics.Image {}
@:image("assets/images/Play.png") #if display private #end class __ASSET__assets_images_play_png extends lime.graphics.Image {}
@:image("assets/images/Reset.png") #if display private #end class __ASSET__assets_images_reset_png extends lime.graphics.Image {}
@:image("assets/images/Shadow.png") #if display private #end class __ASSET__assets_images_shadow_png extends lime.graphics.Image {}
@:image("assets/images/Shadow2.png") #if display private #end class __ASSET__assets_images_shadow2_png extends lime.graphics.Image {}
@:image("assets/images/Shadow3.png") #if display private #end class __ASSET__assets_images_shadow3_png extends lime.graphics.Image {}
@:image("assets/images/Spike.png") #if display private #end class __ASSET__assets_images_spike_png extends lime.graphics.Image {}
@:image("assets/images/Stars0.png") #if display private #end class __ASSET__assets_images_stars0_png extends lime.graphics.Image {}
@:image("assets/images/Stars1.png") #if display private #end class __ASSET__assets_images_stars1_png extends lime.graphics.Image {}
@:image("assets/images/Stars2.png") #if display private #end class __ASSET__assets_images_stars2_png extends lime.graphics.Image {}
@:image("assets/images/Stars3.png") #if display private #end class __ASSET__assets_images_stars3_png extends lime.graphics.Image {}
@:image("assets/images/Switch.png") #if display private #end class __ASSET__assets_images_switch_png extends lime.graphics.Image {}
@:image("assets/images/tiles.png") #if display private #end class __ASSET__assets_images_tiles_png extends lime.graphics.Image {}
@:image("assets/images/Water.png") #if display private #end class __ASSET__assets_images_water_png extends lime.graphics.Image {}
@:image("assets/images/White_spritesheet.png") #if display private #end class __ASSET__assets_images_white_spritesheet_png extends lime.graphics.Image {}
@:image("assets/images/White_spritesheet2.png") #if display private #end class __ASSET__assets_images_white_spritesheet2_png extends lime.graphics.Image {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/sounds/beep.mp3") #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/sounds/flixel.mp3") #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end