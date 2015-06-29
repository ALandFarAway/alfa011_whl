
#include "acr_db_persist_i"

void main()
{
object oPC = GetPCSpeaker();
ACR_SetPersistentInt(oPC, "SJC_LYRANSHOLD_STATUS", 1, 0);
}