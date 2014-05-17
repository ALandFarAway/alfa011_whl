#include "acr_db_persist_i"

int StartingConditional()
{
object oPC = GetPCSpeaker();
if (ACR_GetPersistentInt(oPC, "SJC_140TEST_DONE") == 1)
	{
	return TRUE;
	}
return FALSE;



}