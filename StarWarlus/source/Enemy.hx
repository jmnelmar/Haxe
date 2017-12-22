package;

import flixel.FlxSprite;
import flixel.input.gamepad.id.OUYAID;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxTimer;

import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.ui.utils.loaders.TexturePackerData;/*Al parecer la funcionalidad de esta clase esta en FlxAtlasFrames*/
;

/**
 * ...
 * @author Nelson
 */
class Enemy extends FlxSprite 
{
	private var spawTimer:FlxTimer;
	private var maxSpawTime:Float = 14;
	private var maxX:Int = 750;
	private var minX:Int = 0;
	private var maxY:Int = 500;
	private var minY:Int = 0;
	
	private var texturePackerData:TexturePackerData;
	private var movementTween:FlxTween;
	
	private var spawnTimer:FlxTimer;
	private var maxSpawnTime:Float = 14;
	
	private var minSpeed:Float = 2.0;
	private var maxSpeed:Float = 3.5;
	
	private var maxX:Int = 750;
	private var minX:Int = 0;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		/*
		super(X, Y, SimpleGraphic);
		super(X, Y, SimpleGraphic);
		//var randomX:Int = (Math.floor(Math.random()*(maxX-minX +1))+minX);
		var randomY:Int = (Math.floor(Math.random() * (maxY - minY +1)) + minY);
		//this.setPosition(randomX, randomY);
		this.visible = false;
		
		var spawnTime:Float = Math.random() * (maxSpawTime+1);
		spawTimer = new FlxTimer();
		spawTimer.start(spawnTime, onSpawn);
		//this.loadGraphic(AssetPaths.enemy01__png);
		
		texturePackerData = new TexturePackerData(AssetPaths.ingameSprites__json,);
		*/
		
		super();
		texturePackerData = new TexturePackerData(AssetPaths.ingameSprites__json, AssetPaths.ingameSprites__png); 
		loadGraphicFromTexture(texturePackerData);
		var frameNames:Array<String> = new Array<String>();
		frameNames.push("RocketKitty01.png");
		frameNames.push("RocketKitty02.png");
		
		animation.addByNames("Idle", frameNames, 8);
		animation.play("Idle");

		spawnTimer = new FlxTimer();
		resetSpawn();
	}
	
	private function onSpawn(timer:FlxTimer):Void {
		visible = true;
		
		var randomY:Int = (Math.floor(Math.random() * (maxY - minY + 1)) + minY);
		
		this.y = randomY;
		
		var randomSpeed:Float = (Math.random() * (maxSpeed - minSpeed + 1) + minSpeed);
		movementTween = FlxTween.tween(this, { x:-width }, randomSpeed, { ease: FlxEase.quadIn,complete: resetSpawn} ); 
	}
	
	public function killEnemy():Void {
		this.solid = false;
		movementTween.cancel();
		FlxTween.tween(this, { alpha:0}, 0.15, { ease: FlxEase.quadIn,complete: resetSpawn} );
	}
	

	
	private function resetSpawn(tween:FlxTween = null):Void {
		visible = false;
		this.alpha = 1;
		setPosition(FlxG.width + width, 0);
		
		var spawnTime:Float = Math.random() * (maxSpawnTime+ 1);
		spawnTimer.start(spawnTime, onSpawn);
		this.solid = true;
	}
	
}