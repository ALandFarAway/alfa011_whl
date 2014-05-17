// sjc_onlocked_setpstate
// Set persistent variable that lock has been locked
// Teric 281109

#include "acr_db_persist_i"

void main()
{
ACR_SetPersistentInt(OBJECT_SELF, "SJC_PLOCK_FINISHED", 0);
}