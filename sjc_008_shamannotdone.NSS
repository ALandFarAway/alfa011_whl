#include "acr_db_persist_i"

int StartingConditional()
{
object oPC = GetPCSpeaker();
if (ACR_GetPersistentInt(oPC, "SJC_SHAMANINITDONE") == 1)
	{
	return FALSE;
	}
return TRUE;



}