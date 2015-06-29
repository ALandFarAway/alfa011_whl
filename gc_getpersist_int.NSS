// gc_getpersist_int
/*
    This script checks the value of an ALFA persistent int

*/
// Teric 29/6/15
#include "acr_db_persist_i"
int StartingConditional(string sVariable, int iValue)
{

    object oPC = GetPCSpeaker();


    if (ACR_GetPersistentInt(oPC, sVariable) == iValue)
	{
	return TRUE;
	}

	
    return FALSE;

}