
#include "acr_db_persist_i"
#include "acr_xp_i"
void main()
{
object oPC = GetLastUsedBy();

FloatingTextStringOnCreature("You sign the book, and can now style yourself Master Thief", oPC);
ACR_SetPersistentInt(oPC, "SJC_140TEST_DONE", 1);
ACR_AwardStaticQuestXP(oPC, "masterbook", 60);

}	