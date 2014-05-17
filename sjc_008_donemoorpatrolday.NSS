#include "acr_db_persist_i"
void main()
{
int iDay = GetCalendarDay();
object oPC = GetPCSpeaker();
SetLocalInt(oPC, "q_sjc_moorpatroldone", iDay);
ACR_SetPersistentInt(oPC, "q_sjc_moorpatrolstate", 0, 0);
} 