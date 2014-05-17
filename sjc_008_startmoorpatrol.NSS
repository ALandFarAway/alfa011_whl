
#include "acr_db_persist_i"

void main()
{
object oPC = GetPCSpeaker();
ACR_SetPersistentInt(oPC, "q_sjc_moorpatrolstate", 1, 0);
}