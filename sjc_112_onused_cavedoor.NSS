
#include "acr_db_persist_i"
#include "acr_xp_i"
void main()
{
object oPC = GetLastUsedBy();
object oDestination = GetObjectByTag("x02_from_112");
effect eTest = GetFirstEffect(oPC);
object oCreator = GetObjectByTag("112_pl_cauldron");
ACR_SetPersistentInt(oPC, "SJC_DONEINITIATION", 1);
AddJournalQuestEntry("112_initiationcomplete", 1, oPC, TRUE, FALSE, FALSE);
ACR_AwardStaticQuestXP(oPC, "cavedoor", 60);

while (GetIsEffectValid(eTest)) 
	{ 
    if (GetEffectCreator(eTest) == oCreator) 
	{ 
    RemoveEffect(oPC, eTest); 
    } 
    eTest = GetNextEffect(oPC); 
	} 
	
DelayCommand(3.0f, AssignCommand(oPC, ActionJumpToObject(oDestination)));
}	