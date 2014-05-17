// gc_checktotallevelrange_sjc
/*
    This script checks to see if the PC's level is within a given range
        nLowest  = Lowest valid level
		nHighest = Highest valid level

*/
// Teric 1/5/13

int StartingConditional(int nLowest, int nHighest)
{

    object oPC = GetPCSpeaker();


    if (GetHitDice(oPC) >= nLowest && GetHitDice(oPC) <= nHighest)
	{
	return TRUE;
	}

	
    return FALSE;

}