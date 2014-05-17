#include "acr_db_persist_i"

void main()
{
object oTarget = GetNearestObjectByTag("sjc_tamlin");
int iHasShamanQuest = ACR_GetPersistentInt(GetExitingObject(), "SJC_SHAMANINITDONE");
int iHasDoneInitiation = ACR_GetPersistentInt(GetExitingObject(), "SJC_DONEINITIATION");
if (iHasShamanQuest == 1 && iHasDoneInitiation == 0)
	{
	DestroyObject(oTarget);
	} 
}