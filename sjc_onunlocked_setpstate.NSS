// sjc_ontriggered_setpstate
// Set persistent variable that trap has been triggered
// Teric 281109

#include "acr_db_persist_i"

void main()
{
ACR_SetPersistentInt(OBJECT_SELF, "SJC_PLOCK_FINISHED", 1);
}