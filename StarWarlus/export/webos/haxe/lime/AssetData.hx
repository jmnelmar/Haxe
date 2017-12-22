package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/fonts/BebasNeue.otf", "assets/fonts/BebasNeue.otf");
			type.set ("assets/fonts/BebasNeue.otf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/images/button.png", "assets/images/button.png");
			type.set ("assets/images/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemy01.png", "assets/images/enemy01.png");
			type.set ("assets/images/enemy01.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/gameBackground.png", "assets/images/gameBackground.png");
			type.set ("assets/images/gameBackground.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/healthHeartOff.png", "assets/images/healthHeartOff.png");
			type.set ("assets/images/healthHeartOff.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/healthHeartOn.png", "assets/images/healthHeartOn.png");
			type.set ("assets/images/healthHeartOn.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/hudBackground.png", "assets/images/hudBackground.png");
			type.set ("assets/images/hudBackground.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/levelEndHeader.png", "assets/images/levelEndHeader.png");
			type.set ("assets/images/levelEndHeader.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/levelEndWindow.png", "assets/images/levelEndWindow.png");
			type.set ("assets/images/levelEndWindow.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/newBestScore.png", "assets/images/newBestScore.png");
			type.set ("assets/images/newBestScore.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/titleScreenBackground.png", "assets/images/titleScreenBackground.png");
			type.set ("assets/images/titleScreenBackground.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/titleScreenLogo.png", "assets/images/titleScreenLogo.png");
			type.set ("assets/images/titleScreenLogo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/titleScreenStar.png", "assets/images/titleScreenStar.png");
			type.set ("assets/images/titleScreenStar.png", Reflect.field (AssetType, "image".toUpperCase ()));
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
