package;

import flixel.math.FlxMath;

class RatingSystem
{
	public static var gradeArray:Array<String> = ["FC++","FC","FC-","S+","S","S-","A+","A","A-","B+","B","B-","C+","C","C-","D"];
	public static var ghostTapping:Bool=false;	

	public static var ratingStrings = [
		"sick",
		"good",
		"bad",
		"shit",
	];
	
	public static function GetAccuracyConditions(): Array<Float>
	{
		    return [
            1.0,
            .98,
            .96,
            .94,
            .92,
            .89,
            .86,
            .83,
            .8,
            .76,
            .72,
            .68,
            .64,
            .6,
            .55,
        ];
	}
	public static function AccuracyToGrade(accuracy:Float):String 
	{
        var grade = gradeArray[gradeArray.length-1];
        var accuracyConditions:Array<Float>=GetAccuracyConditions();
        for(i in 0...accuracyConditions.length){
        if(accuracy >= accuracyConditions[i]){
            grade = gradeArray[i];
            break;
        }
        }

        return grade;
    }
	
	public static function DetermineRating(noteDiff:Float)
	{
		var noteDiff = Math.abs(noteDiff);
		return "shit";
	}

	public static function RatingToHit(rating:String):Float
	{
		var hit:Float = 0;
		switch (rating){
			case 'shit':
				hit = .1;
			case 'bad':
				hit = .35;
			case 'good':
				hit = .75;
			case 'sick':
				hit = 1;
		}
		return hit;
	}
	
	public static function RatingToScore(rating:String):Int
	{
		var score = 0;
		switch (rating){
			case 'shit' | 'bad':
				score = 0;
			case 'good':
				score = 100;
			case 'sick':
				score = 350;
		}
		if(!ghostTapping)
			score=Std.int(score*1.05); // TINY LIL MODIFIER

		return score;
	}
}
