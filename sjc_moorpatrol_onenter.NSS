
#include "acr_db_persist_i"
#include "acr_xp_i"

void main()
{

object oPC = GetEnteringObject();
int iPatrolState = ACR_GetPersistentInt(oPC, "q_sjc_moorpatrolstate");
int iMarkerNumber = GetLocalInt(OBJECT_SELF, "ACR_QST_LOWER_STATE");
string sTextDisplay = GetLocalString(OBJECT_SELF, "ACR_QST_MESSAGE"); 


if (iPatrolState == iMarkerNumber)
	{
	ACR_SetPersistentInt(oPC, "q_sjc_moorpatrolstate", (iPatrolState + 1), 0);
	FloatingTextStringOnCreature(sTextDisplay, oPC, FALSE, 5.0f);
		if (ACR_GetPersistentInt(oPC, "q_sjc_moorpatrolstate") == 11)
		{
		ACR_AwardStaticQuestXP(oPC, "moorpatrol", 40);
		}
	}

}