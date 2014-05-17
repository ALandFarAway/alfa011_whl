// sjc_ontriggered_setpstate_standard
// For "old-style" traps
// Set persistent variable that trap has been triggered or disarmed
// Teric 281109 + 090210

#include "acr_db_persist_i"

void main()
{

// Because custom OnTrapTriggered scripts override
// the normal trap damage for non-projectile traps 
// we need to put it back in

int iTrapType = GetTrapBaseType(OBJECT_SELF);
string sSpell = Get2DAString("traps", "TrapScript", iTrapType);
ExecuteScript(sSpell, OBJECT_SELF);

// If trap is One-Shot set it as triggered permanently

if (GetTrapOneShot(OBJECT_SELF) == TRUE)
	{
	ACR_SetPersistentInt(OBJECT_SELF, "SJC_PTRAP_FINISHED", 1);
	}
}