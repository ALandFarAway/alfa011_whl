//Put this script OnEnter


#include "acr_spellhook_i"
#include "acr_spells_i"
#include "nwn2_inc_spells"






void main()
{
int nMaxLvl;
object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;
  int nDamage;
	int nDamage2;
    float fDelay;
    //effect eVis = EffectVisualEffect(VFX_HIT_SPELL_FIRE);
    effect eDam,eDam2, eDam3;
    //Get the spell target location as opposed to the spell target.
    location lTarget = GetSpellTargetLocation();
    //Apply the ice storm VFX at the location captured above.
    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
   
effect eEffect;
//eEffect = EffectDamage(6, DAMAGE_TYPE_FIRE, DAMAGE_POWER_ENERGY);
	nDamage = d8(nMaxLvl);
				nDamage = ApplyMetamagicVariableMods(nDamage, nMaxLvl * 8);
				nDamage = GetReflexAdjustedDamage(nDamage, oTarget, GetSpellSaveDC(), SAVING_THROW_TYPE_FIRE);
ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oPC);

}