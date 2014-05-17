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

object oAOE = GetObjectByTag("129_aoe_collapsingroof");
object oTarget = GetFirstInPersistentObject(oAOE);

object oEffectLocation = GetObjectByTag("129_location_collapsingroof");
effect eCollapse = EffectNWN2SpecialEffectFile("fx_rockslide", oEffectLocation);
ApplyEffectToObject(DURATION_TYPE_INSTANT, eCollapse, oEffectLocation); 
while (GetIsObjectValid(oTarget))
		{
		if (!GetIsDM(oTarget))
			{
			int iAC = GetAC(oTarget);
			if ((d20() + 15) >= iAC)
				{
				effect eDamage = EffectDamage(d6(5), DAMAGE_TYPE_BLUDGEONING);
				ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
				}
			}
		oTarget = GetNextInPersistentObject(oAOE);
		}





// If trap is One-Shot set it as triggered permanently

if (GetTrapOneShot(OBJECT_SELF) == TRUE)
	{
	ACR_SetPersistentInt(OBJECT_SELF, "SJC_PTRAP_FINISHED", 1);
	}
}