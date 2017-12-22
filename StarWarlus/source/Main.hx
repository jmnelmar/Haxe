package;

import flixel.FlxGame;
import flixel.FlxState;
import openfl.display.Sprite;

class Main extends Sprite
{
	var gameWidth:Int = 960;
	var gameHeight:Int = 640;
	var initialState:Class<FlxState> = MenuState;
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, MenuState));
	}
}
