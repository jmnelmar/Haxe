package ui;

import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
/**
 * ...
 * @author ...
 */
class GameHUD extends FlxGroup 
{
	
	private var background:FlxSprite;
	private var txtHealtHeader:FlxText;
	private var healtHearts:Array<FlxSprite>;
	private var maxHealth:Int = 3;
	private var heartPadding:Int = 14;
	
	private var txtScore:FlxText;
	
	

	public function new ()
	{
		super();
		background = new FlxSprite();
		background.loadGraphic(AssetPaths.hudBackground__png);
		background.setPosition(6, 18);
		add(background);
		
		txtHealtHeader = new FlxText(30, 20, 500);
		txtHealtHeader.text = "HEALT:";
		txtHealtHeader.setFormat("Arial", 26, FlxColor.WHITE, "left");
		add(txtHealtHeader);
		
		txtScore = new FlxText(62, 52, 500);
		txtScore.text = "SCORE: " + 0;
		txtScore.setFormat("Arial", 30, 0x9d4300, "left");
		add(txtScore);
		
		healtHearts = new Array<FlxSprite>();
		var healtHeart:FlxSprite;
		for(i in 0... maxHealth){
			healtHeart = new FlxSprite();
			healtHeart.loadGraphic(AssetPaths.healthHeartOn__png);
			healtHeart.setPosition(132 + (i * (healtHeart.width + heartPadding)), 22);
			add(healtHeart);
			healtHearts.push(healtHeart);
			
		}
	}
	
	public function setScore(score:Int):Void{
		txtScore.text = "SCORE: " + score;
	}
	
	public function setHealth(health:Int):Void{
		for (i in 0...healtHearts.length) {
			if(i > (health -1)){
				healtHearts[i].loadGraphic(AssetPaths.healthHeartOff__png);
			}
		}
	}
	
	
}