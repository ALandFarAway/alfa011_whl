// sjc_gc_008_finishedmoorpatrol
/*
    Check if moor patrol finished (quest state == 11)
*/
// 
#include "acr_db_persist_i"

int StartingConditional()
{
object oPC = GetPCSpeaker();
int iQuestState = ACR_GetPersistentInt(oPC, "q_sjc_woolsleyqueststate");

if (iQuestState == 1)
	{
	return TRUE;
	}
	
	return FALSE;
}