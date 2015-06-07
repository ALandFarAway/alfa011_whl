// ga_floating_text
/*
	Do floaty text on PC speaker for a fixed amount of time
*/
// ChazM 6/27/06
// Teric 6/6/15

#include "ginc_debug"

void main(string sText, float fTime)
{
    object oPC = (GetPCSpeaker()==OBJECT_INVALID?OBJECT_SELF:GetPCSpeaker());
	// PrettyDebug ("Doing floaty text on " + GetName(oPC));
	FloatingTextStringOnCreature(sText, oPC, FALSE, fTime);	
}