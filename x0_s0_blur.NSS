//::///////////////////////////////////////////////
//:: Blur
//:: x0_s0_blur.nss
//:://////////////////////////////////////////////
/*
    20% concealment to attacks
	
    Duration: 1 turn/level
*/
//:://////////////////////////////////////////////
//:: Created By: rjshae
//:: Created On: July 7, 2015
//:://////////////////////////////////////////////

#include "nwn2_inc_spells"
#include "NW_I0_SPELLS"
#include "x2_inc_spellhook" 

void main()
{
	/* 
	  Spellcast Hook Code 
	  If you want to make changes to all spells,
	  check x2_inc_spellhook.nss to find out more
	*/
    if (!X2PreSpellCastCode())
    {
	// If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }
	// End of Spell Cast Hook
	
     //Declare major variables
    object oTarget = OBJECT_SELF;
	
	// AFW-OEI 08/07/2007: If you're casting it as a racial, use HD.
	int nDuration = GetCasterLevel(OBJECT_SELF);
	if (GetSpellId() == 1217)
	{
		nDuration = GetTotalLevels(OBJECT_SELF, TRUE);
	}
    float fDuration = TurnsToSeconds(nDuration);
	
    //Fire cast spell at event for the specified target
    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));
	
    //Check for metamagic extend
    fDuration = ApplyMetamagicDurationMods(fDuration);
    int nDurType = ApplyMetamagicDurationTypeMods(DURATION_TYPE_TEMPORARY);
	
    //Set the bonus
    effect eShield = EffectConcealment(20);
    effect eDur = EffectVisualEffect(VFX_DUR_SPELL_ENTROPIC_SHIELD);
    effect eLink = EffectLinkEffects(eShield, eDur);
	
    //Apply the armor bonuses and the VFX impact
    ApplyEffectToObject(nDurType, eLink, oTarget, fDuration);
}