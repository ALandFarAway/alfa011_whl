// script_name
/*
	Description:
	
*/
// Name_Date
#include "acr_db_persist_i"
int StartingConditional()
{
int iHasShamanQuest = ACR_GetPersistentInt(GetPCSpeaker(), "SJC_SHAMANINITDONE");
int iHasDoneInitiation = ACR_GetPersistentInt(GetPCSpeaker(), "SJC_DONEINITIATION");

if (iHasShamanQuest == 1 && iHasDoneInitiation == 0)
	{
	return TRUE;
	}
	
return FALSE; 
}