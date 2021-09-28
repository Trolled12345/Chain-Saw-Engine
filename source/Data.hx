import openfl.Lib;
import flixel.FlxG;

//Original Maded By KadeDev

class Data
{
    public static function initSave()
    {
		if (FlxG.save.data.downscroll == null)
			FlxG.save.data.downscroll = false;
			
		if (FlxG.save.data.ratingInHUD == null)
			FlxG.save.data.ratingInHUD = true;
			
		if (FlxG.save.data.ghost == null)
			FlxG.save.data.ghost = true;
			
		if (FlxG.save.data.notesplash == null)
			FlxG.save.data.notesplash = true;
			
		if (FlxG.save.data.noteglow == null)
			FlxG.save.data.noteglow = true;	

		if (FlxG.save.data.cutscenes == null)
			FlxG.save.data.cutscenes = true;	
			
		PlayerSettings.player1.controls.loadKeyBinds();
		KeyBinds.keyCheck();
	}
}