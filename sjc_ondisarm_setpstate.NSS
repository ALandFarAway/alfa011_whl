// sjc_ondisarm_setpstate
// Set persistent variable that trap has been disarmed
// Teric 281109 + 090210

#include "acr_db_persist_i"
#include "acr_xp_i"

void main()
{
ACR_SetPersistentInt(OBJECT_SELF, "SJC_PTRAP_FINISHED", 1);
object oPC = GetLastDisarmed();
int iXP = GetTrapDisarmDC(OBJECT_SELF);
ACR_AwardStaticQuestXP(oPC, "sjc_disarm", iXP);
}