// sjc_gc_103_checkbankedgold
/*
    This script only shows scrolls that the PC can afford from her banked amount
	int iScrollCost = The amount of banked gold a PC must have to see the convo node
*/
// 
#include "acr_db_persist_i"

int StartingConditional(int iScrollCost)
{
object oPC = GetPCSpeaker();
int iBanked = ACR_GetPersistentInt(oPC, "103_creditbanked");

if (iBanked >= iScrollCost)
	{
	return TRUE;
	}
	
	return FALSE;
}