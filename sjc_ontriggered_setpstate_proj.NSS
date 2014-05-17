// sjc_ontriggered_setpstate_proj
// For projectile traps
// Set persistent variable that trap has been triggered or disarmed
// Teric 281109 + 090210 + 061010

#include "acr_db_persist_i"
#include "x0_i0_projtrap"
void main()
{

// Add spell code or custom code here
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!






// If trap is One-Shot set it as triggered permanently

if (GetTrapOneShot(OBJECT_SELF) == TRUE)
	{
	ACR_SetPersistentInt(OBJECT_SELF, "SJC_PTRAP_FINISHED", 1);
	}
}