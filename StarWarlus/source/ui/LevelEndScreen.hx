package ui;

import flixel.FlxState;
import flixel.FlxSprite;

import AssetPaths;
import Reg;

import flixel.ui.FlxButton;
import flixel.effects.FlxFlicker;
import flixel.group.FlxGroup;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.text.FlxText;


/**
 * ...
 * @author ...
 */
class LevelEndScreen extends FlxState 
{
	private var background:FlxSprite;
	private var txtGameScore:FlxText;
	
	private var windowHeader:FlxSprite;
	private var newBestScore:FlxSprite;
	private var window:FlxSprite;
	
	private var txtBestScore:FlxText;
	private var btnPlayAgain:FlxButton;
	private var windowGroup:FlxGroup;
	
	
	public function new(score:Int){
		super();
		background = new FlxSprite();
		background.makeGraphic(FlxG.stage.stageWidth, FlxG.stage.stageHeight, FlxColor.BLACK);
		background.alpha = 0.75;
		add(background);
		
		/*txtGameScore = new FlxText(0, 0, 500, "Final score: " + score+" \nClick to play again", 40);
		txtGameScore.setPosition(FlxG.stage.stageWidth / 2 - txtGameScore.width / 2, FlxG.stage.stageHeight / 2 - txtGameScore.height / 2);
		add(txtGameScore);*/
		
		windowGroup = new FlxGroup();
		add(windowGroup);
		windowGroup.visible = false;
		
		windowHeader = new FlxSprite();
		windowHeader.loadGraphic(AssetPaths.levelEndHeader__png);
		windowHeader.setPosition(3000, FlxG.height / 2 - windowHeader.height - 71);
		add(windowHeader);
		
		window = new FlxSprite();
		window.loadGraphic(AssetPaths.levelEndWindow__png);
		window.setPosition(FlxG.width / 2 - window.width / 2, FlxG.height / 2 - window.height / 2);
		windowGroup.add(window);
		
		var newHigScore:Bool = false;
		if(score>Reg.score){
			Reg.score = score;
			newHigScore = true;
		}
		
		txtGameScore = new FlxText(0, 0, 500);
		txtGameScore.text = "Score: " + score;
		txtGameScore.setFormat("Arial", 30, "left");
		txtGameScore.setPosition(FlxG.width / 2 - txtGameScore.width / 2 + 20, FlxG.height / 2 - txtGameScore.height +15);
		windowGroup.add(txtGameScore);
		txtBestScore = new FlxText(0, 0, 500);
		txtBestScore.text = "BEST SCORE: " + Reg.score;
		txtBestScore.setFormat("Arial", 25, 0xffd800, "left");
		txtBestScore.setPosition(FlxG.width / 2 - 210, FlxG.height / 2 +5);
		windowGroup.add(txtBestScore);
		
		btnPlayAgain = new FlxButton(0, 0, "PLAY AGAIN", onPlayAgain);
		btnPlayAgain.loadGraphic(AssetPaths.button__png);
		btnPlayAgain.label.setFormat("Arial", 25, FlxColor.WHITE, "center");
		btnPlayAgain.label.setBorderStyle(FlxTextBorderStyle.OUTLINE, 0x9d4300, 3);
		btnPlayAgain.setPosition(FlxG.width / 2 - btnPlayAgain.width / 2, FlxG.height / 2 +51);
		windowGroup.add(btnPlayAgain);
		
		if(newHigScore){
			newBestScore = new FlxSprite();
			newBestScore.loadGraphic(AssetPaths.newBestScore__png);
			newBestScore.setPosition(FlxG.width / 2 - 296, FlxG.height / 2 - 45);
			FlxFlicker.flicker(newBestScore, 0, 0.5);
			windowGroup.add(newBestScore);
			
		}
		
		FlxTween.tween(windowHeader, {
		x:FlxG.width / 2 - windowHeader.width / 2 - 19},
		1.5,
		{ease:FlxEase.quadIn, onComplete:onHeaderAnimateIn});
		FlxG.camera.flash(FlxColor.WHITE, 0.25);
		
	}
	
	override public function update(elapsed:Float):Void{
		super.update(elapsed);
		/*if(FlxG.mouse.justReleased){
			onPlayAgain();
		}*/
		
		
	}
	
	private function onPlayAgain():Void{
		FlxG.resetState();
	}
	
	private function onHeaderAnimateIn(tween:FlxTween):Void{
		FlxG.camera.shake();
		windowGroup.visible = true;
	}
}