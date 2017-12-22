package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxSpriteUtil;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class MenuState extends FlxState
{
	private var background:FlxSprite;
	private var star:FlxSprite;
	private var logo:FlxSprite;
	
	public var checkForInput:Bool = false;
	private var txtInstructions:FlxText;
	
	public function new() 
	{
		super();
	}
	
	override public function create():Void{
		super.create();
		background = new FlxSprite();
		background.loadGraphic(AssetPaths.titleScreenBackground__png);
		background.visible = false;
		FlxSpriteUtil.screenWrap(background);
		add(background);
		
		star = new FlxSprite();
		star.loadGraphic(AssetPaths.titleScreenStar__png);
		star.setPosition(3000, 276);
		add(star);
		
		logo = new FlxSprite();
		logo.loadGraphic(AssetPaths.titleScreenLogo__png);
		logo.setPosition(59, 360);
		logo.visible = false;
		add(logo);
		
		txtInstructions = new FlxText(0, 0, 500);
		txtInstructions.text = "- TAP TO START -";
		//txtInstructions.setFormat(AssetPaths.BebasNeue__otf, 72, FlxColor.BLACK, 3);
		
		txtInstructions.setPosition(FlxG.width / 2 - txtInstructions.width / 2, 0);
		txtInstructions.visible = false;
		
		add(txtInstructions);
		
		FlxTween.tween(star, {x:0}, 1.0, 
		{
			type:FlxTween.PERSIST,
			ease:FlxEase.quadIn, 
			onComplete:onStarAnimateIn/*,
			startDelay:1, 
			loopDelay:2*/
		}
		
		);
		
		
		
		
	}
	
	private function onStarAnimateIn(tween:FlxTween):Void{
		logo.visible = true;
		FlxG.camera.flash(FlxColor.WHITE, 0.25, onFlashComplete);
		FlxG.camera.shake();
		background.visible=true;
	}
	
	private function onFlashComplete():Void{
		FlxFlicker.flicker(txtInstructions, 0, 0.5);
		checkForInput = true;
	}
	
	override public function update(elapsed:Float):Void{
		super.update(elapsed);
		if(checkForInput&&FlxG.mouse.justReleased){
			gotoGame();
		}
		
	}
	
	private function gotoGame():Void{
		FlxG.camera.fade(FlxColor.BLACK,0.5,false,function(){
			FlxG.switchState(new PlayState());
		});
	}
	
}