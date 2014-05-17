#include "x0_i0_projtrap"

void main()
{
object oPC = GetEnteringObject();
object oFallPoint = GetObjectByTag("147_fallpoint");
location lFallPoint = GetLocation(oFallPoint);
object oDodgePoint = GetObjectByTag("147_dodgepoint");
location lDodgePoint = GetLocation(oDodgePoint);
effect eDamage = EffectDamage(d6(2), DAMAGE_TYPE_BLUDGEONING);
object oPlaceHole = GetObjectByTag("147_holepoint");
location lNewHole = GetLocation(oPlaceHole); 
effect eBoom = EffectNWN2SpecialEffectFile("fx_wooden_explosion_big");
//effect eKnockdown = EffectKnockdown();
if (ReflexSave(oPC, 20, SAVING_THROW_TYPE_NONE, OBJECT_SELF))
	{
	AssignCommand(oPC, ActionJumpToLocation(lDodgePoint));
	}

else
	{	
	AssignCommand(oPC, ActionJumpToLocation(lFallPoint));
	ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);
	//ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnockdown, oPC, 6.0f);
	}	

ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eBoom, lNewHole);
CreateObject(OBJECT_TYPE_PLACEABLE, "147_hole", lNewHole);	
	
}