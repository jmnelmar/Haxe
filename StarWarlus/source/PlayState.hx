package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.effects.postprocess.PostProcess;
import flixel.text.FlxText;
import flixel.FlxObject;
import flixel.util.FlxTimer;
import flixel.input.mouse.FlxMouseEventManager;
import ui.LevelEndScreen;

import ui.GameHUD;
import flixel.group.FlxGroup;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var background:FlxSprite;
	private var txtScore:FlxText;
	private var txtTime:FlxText;
	private var numEnemies:Int = 20;
	private var score:Int = 0;
	private var enemyPointVallue:Int = 155;
	private var enemies:Array<Enemy>;
	
	private var levelTimer:FlxTimer;
	private var levelTime:Int = 5;
	private var ticks:Int = 0;
	
	private var gameHud:GameHUD;
	private var enemyLayer:FlxGroup;
	
	private var background:FlxBackdrop;
	private var backgroundScrollSpeed:Float =-200;
	private var player:Player;
	private var playerLayer:FlxGroup;
	private var health:Int = 3;
	
	private var explosion:FlxTypedGroup<ExplosionEffect>;
	private var maxExplosions:Int = 40;
	
	override public function create():Void
	{
		
		
		
		//var helloWorldText = new FlxSprite();
		//helloWorldText.loadGraphic(AssetPaths.HelloWorld__png);
		//add(helloWorldText);
		
		super.create();
		background = new FlxBackdrop(AssetPaths.gameBackground__png);
		background.velocity.x = backgroundScrollSpeed;
		//background = new FlxSprite();
		//background.loadGraphic(AssetPaths.gameBackground__png);
		
		add(background);
		
		/*txtScore = new FlxText(10, 10, 200, "Score: 0", 20);
		txtTime = new FlxText(10, 30, 200, "Time: 0", 20);
		add(txtScore);
		add(txtTime);*/
		
		enemyLayer = new FlxGroup();
		add(enemyLayer);
		
		enemies = new Array<Enemy>();
		var enemy:Enemy;
		for(i in 0 ... numEnemies){
			enemy = new Enemy();
			//add(enemy);
			enemyLayer.add(enemy);
			enemies.push(enemy);
		
			//FlxMouseEventManager.add(enemy, onEnemyMouseDown);
		}
		
		Player = new Player();
		playerLayer = new FlxGroup();
		playerLayer.add(player);
		add(playerLayer);
		
		ExplosionEffect = new FlxTypedGroup<ExplosionEffect>(maxExplosions);
		var explosionEffect:ExplosionEffect;
		
		for(i in 0...maxExplosions){
			explosionEffect = new ExplosionEffect();
			explosionEffect.kill();
			explosions.add(explosionEffect);
		}
		
		playerLayer.add(explosions);
		gameHud = new GameHUD();
		add(gameHud);
		
		
		levelTimer = new FlxTimer();
		//levelTimer.start(1,onTimeComplete,levelTime);
		levelTimer.start(1,onTimeComplete,0);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(Player!=null){
			FlxG.overlap(player.projectiles, enemyLayer, onProjectileCollision);
			FlxG.overlap(player.sprite, enemyLayer.onEnemyCollision);
		}
	}
	
	private function onProjectileCollision(projectile:FlxObject,enemy:FlxObject):Void {
		projectile.kill();
		
		if(enemy.x < (FlxG.stage.stageWidth - 10) && Std.is(enemy, Enemy)){
			killEnemy(cast(enemy, Enemy));
			updateScore(enemyPointValue);
		}
	}
	
	private function onEnemyCollision(playerObject:FlxObject,enemy:FlxObject):Void {
		if(Std.is(enemy, Enemy)){
			killEnemy(cast(enemy, Enemy), 0.1);
			FlxG.camera.flash(FlxColor.RED, 0.15);
			health--;
			gameHud.setHealth(health);
			if (health == 0) {
				player.killPlayer();
				levelTimer.cancel();
				var levelEndScreen:LevelEndScreen = new LevelEndScreen(score);
				add(levelEndScreen);
			}
		}
	}
	
	
	private function onEnemyMouseDown(object:FlxObject):Void
	{
			object.visible = false;
			score+= enemyPointVallue;
			gameHud.setScore(score);
			//txtScore.text = "Score: " + score;
			
	}
	
	override public function destroy():Void
	{
		for (i in 0...enemies.length){
		
			FlxMouseEventManager.remove(enemies[i]);
		}
		super.destroy();
		
	}
	
	private function onTimeComplete(timer:FlxTimer):Void{

		ticks++;
		//txtTime.text = "Time: " + ticks;
		/*if(ticks>= levelTime){
			var levelEndScreen:LevelEndScreen = new LevelEndScreen(score);
			add(levelEndScreen);
		}*/
		updateScore(pointsPerSecond);
		
	}
	
	private function killEnemy(enemy:Enemy, shakeStrength:Float = 0.005):Void{
		enemy.killEnemy();
		var explosion:ExplosionEffect = explosions.recycle();
		explosion.playExplosion(enemy.x, enemy.y);
		FlxG.camera.shake(shakeStrength, 0.5);
		
		explosions.forEachAlive(function(currentExplosion:ExplosionEffect) {
				if (currentExplosion.animationComplete) {
					currentExplosion.kill();
				}
			} );
	}
	
	private function updateScore(points:Int):Void{
		score += points;
		gameHud.setScore(score);
	}
	
	
}
