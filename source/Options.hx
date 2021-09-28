package;

import lime.app.Application;
import lime.system.DisplayMode;
import flixel.util.FlxColor;
import Controls.KeyboardScheme;
import flixel.FlxG;
import openfl.display.FPS;
import openfl.Lib;

class OptionCategory
{
	private var _options:Array<Option> = new Array<Option>();
	public final function getOptions():Array<Option>
	{
		return _options;
	}

	public final function addOption(opt:Option)
	{
		_options.push(opt);
	}

	
	public final function removeOption(opt:Option)
	{
		_options.remove(opt);
	}

	private var _name:String = "New Category";
	public final function getName() {
		return _name;
	}

	public function new (catName:String, options:Array<Option>)
	{
		_name = catName;
		_options = options;
	}
}

class Option
{
	public function new()
	{
		display = updateDisplay();
	}
	
	private var display:String;
	private var acceptValues:Bool = false;
	
	public final function getDisplay():String
	{
		return display;
	}

	public final function getAccept():Bool
	{
		return acceptValues;
	}

	public function getValue():String { return throw "stub!"; };
	
	public function press():Bool { return throw "stub!"; }
	private function updateDisplay():String { return throw "stub!"; }
	public function left():Bool { return throw "stub!"; }
	public function right():Bool { return throw "stub!"; }
}

class DownscrollOption extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.downscroll = !FlxG.save.data.downscroll;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return "Scroll " + (FlxG.save.data.downscroll ? "Down" : "Up");
	}
}

class RatingInHUDOption extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.ratingInHUD = !FlxG.save.data.ratingInHUD;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return "Rating In HUD " + (FlxG.save.data.ratingInHUD ? "on" : "off");
	}
}

class GhostTapOption extends Option
{
	public override function press():Bool
	{
		FlxG.save.data.ghost = !FlxG.save.data.ghost;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return "Ghost Tapping " + (FlxG.save.data.ghost ? "on" : "off");
	}
}

class Keys extends Option
{
	
	public override function press():Bool
	{
		FlxG.switchState(new KeyBindMenu());
        return false;
	}
	private override function updateDisplay():String
	{
		return "Keys";
	}

}

class NoteSplashs extends Option
{	
	public override function press():Bool
	{
		FlxG.save.data.notesplash = !FlxG.save.data.notesplash;
		display = updateDisplay();
		return true;
	}
	
	private override function updateDisplay():String
	{
		return "Note Splashes " + (FlxG.save.data.notesplash ? "on" : "off");
	}
}

class NoteGlow extends Option
{	
	public override function press():Bool
	{
		FlxG.save.data.noteglow = !FlxG.save.data.noteglow;
		display = updateDisplay();
		return true;
	}
	
	private override function updateDisplay():String
	{
		return "Note Glows " + (FlxG.save.data.noteglow ? "on" : "off");
	}
}

class Cutscenes extends Option
{	
	public override function press():Bool
	{
		FlxG.save.data.cutscenes = !FlxG.save.data.cutscenes;
		display = updateDisplay();
		return true;
	}
	
	private override function updateDisplay():String
	{
		return "Cutscenes " + (FlxG.save.data.cutscenes ? "on" : "off");
	}
}
