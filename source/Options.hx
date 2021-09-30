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
	    #if desktop
		FlxG.switchState(new KeyBindMenu());
		#else
		FlxG.switchState(new options.CustomControlsState());
		#end
        return false;
	}
	private override function updateDisplay():String
	{
		return "Controls";
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

class MiddleScroll extends Option
{	
	public override function press():Bool
	{
		FlxG.save.data.middle = !FlxG.save.data.middle;
		display = updateDisplay();
		return true;
	}
	
	private override function updateDisplay():String
	{
		return "Middle Scroll " + (FlxG.save.data.middle ? "on" : "off");
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
		return "Video Cutscenes " + (FlxG.save.data.cutscenes ? "on" : "off");
	}
}

class Practice extends Option
{	
	public override function press():Bool
	{
		FlxG.save.data.practice = !FlxG.save.data.practice;
		display = updateDisplay();
		return true;
	}
	
	private override function updateDisplay():String
	{
		return "Practice Mode " + (!FlxG.save.data.practice ? "on" : "off");
	}
}

class FPSOption extends Option
{
    public override function press():Bool
	{
		FlxG.save.data.fps = !FlxG.save.data.fps;
		(cast (Lib.current.getChildAt(0), Main)).toggleFPS(FlxG.save.data.fps);
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return "FPS Counter " + (FlxG.save.data.fps ? "on" : "off");
	}
}

class SongInfo extends Option
{	
	public override function press():Bool
	{
		FlxG.save.data.songtext = !FlxG.save.data.songtext;
		display = updateDisplay();
		return true;
	}
	
	private override function updateDisplay():String
	{
		return "Song Info Text " + (!FlxG.save.data.songtext ? "on" : "off");
	}
}
