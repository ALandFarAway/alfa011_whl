//::///////////////////////////////////////////////
//:: x2_door_death
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
// sjc_ondeath_setpobjectstate
// Set persistent variable that object is destroyed
// Teric 281109


#include "acr_db_persist_i"

void main()
{
	
if (GetObjectType(OBJECT_SELF) == OBJECT_TYPE_DOOR)
	{
    effect eDoorExplode = EffectNWN2SpecialEffectFile( "fx_wooden_explosion_big");
	ApplyEffectToObject(DURATION_TYPE_INSTANT, eDoorExplode, OBJECT_SELF);
	ACR_SetPersistentInt(OBJECT_SELF, "SJC_PLOCK_FINISHED", 1);
	}
	
else
	{
    effect eDoorExplode = EffectNWN2SpecialEffectFile( "fx_wooden_explosion_big");
	ApplyEffectToObject(DURATION_TYPE_INSTANT, eDoorExplode, OBJECT_SELF);
	ACR_SetPersistentInt(OBJECT_SELF, "SJC_POBJECT_DESTROYED", 1);	
	}
}