//::///////////////////////////////////////////////
//:: Dragon Breath Lightning
//:: NW_S1_DragLight
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calculates the proper damage and DC Save for the
    breath weapon based on the HD of the dragon.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: May 9, 2001
//:: Modified By: DannJ, 4 June 4 2011
//:://////////////////////////////////////////////
#include "NW_I0_SPELLS"

void LightningFire(int nDamage, int nDC);

void main()
{
    //Declare major variables
    int nAge = GetHitDice(OBJECT_SELF);
    int nDamage;// lightning damage xd10
    int nDC;
    float fDelay;
    object oTarget;
    //Determine save DC and ability damage
    if (nAge <= 6) //Wyrmling
    {
        nDamage = 2;
        nDC = 14;
    }
    else if (nAge >= 7 && nAge <= 9) //Very Young
    {
        nDamage = 4;
        nDC = 16;
    }
    else if (nAge >= 10 && nAge <= 12) //Young
    {
        nDamage = 6;
        nDC = 18;
    }
    else if (nAge >= 13 && nAge <= 15) //Juvenile
    {
        nDamage = 8;
        nDC = 20;
    }
    else if (nAge >= 16 && nAge <= 18) //Young Adult
    {
        nDamage = 10;
        nDC = 22;
    }
    else if (nAge >= 19 && nAge <= 21) //Adult
    {
        nDamage = 12;
        nDC = 24;
    }
    else if (nAge >= 22 && nAge <= 24) //Mature Adult
    {
        nDamage = 14;
        nDC = 26;
    }
    else if (nAge >= 25 && nAge <= 27) //Old
    {
        nDamage = 16;
        nDC = 29;
    }
    else if (nAge >= 28 && nAge <= 30) //Very Old
    {
        nDamage = 18;
        nDC = 32;
    }
    else if (nAge >= 31 && nAge <= 33) //Ancient
    {
        nDamage = 20;
        nDC = 34;
    }
    else if (nAge >= 34 && nAge < 37) //Wyrm
    {
        nDamage = 22;
        nDC = 37;
    }
    else if (nAge >= 37) //Great Wyrm
    {
        nDamage = 24;
        nDC = 39;
    }
    PlayDragonBattleCry();
    effect eBreath = EffectNWN2SpecialEffectFile("fx_lightning_breath.sef");
    PlayCustomAnimation(OBJECT_SELF, "Una_breathattack01", 0, 0.7f);
    DelayCommand(0.5f, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBreath, OBJECT_SELF, 3.0f));
    DelayCommand(0.7f, LightningFire(nDamage, nDC));
}

void LightningFire(int nDamage, int nDC)
{
	float fDelay;
    effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
    object oTarget = GetFirstObjectInShape(SHAPE_SPELLCONE, RADIUS_SIZE_ASTRONOMIC, GetSpellTargetLocation(), TRUE);
    while(GetIsObjectValid(oTarget))
    {
        if(oTarget != OBJECT_SELF && spellsIsTarget(oTarget, SPELL_TARGET_STANDARDHOSTILE, OBJECT_SELF))
        {
            //Reset the damage to full
            int nDamStrike = d10(nDamage);	

            //Fire cast spell at event for the specified target
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELLABILITY_DRAGON_BREATH_LIGHTNING));
            //Adjust the damage based on the Reflex Save, Evasion and Improved Evasion.
            if(MySavingThrow(SAVING_THROW_REFLEX, oTarget, nDC, SAVING_THROW_TYPE_ELECTRICITY))
            {
                nDamStrike = nDamStrike/2;
                if(GetHasFeat(FEAT_EVASION, oTarget) || GetHasFeat(FEAT_IMPROVED_EVASION, oTarget))
                {
                    nDamStrike = 0;
                }
            }
            else if(GetHasFeat(FEAT_IMPROVED_EVASION, oTarget))
            {
                nDamStrike = nDamStrike/2;
            }			
			effect eBreath = EffectDamage(nDamStrike, DAMAGE_TYPE_ELECTRICAL);
			if (nDamStrike > 0)
            {
                //Apply the VFX impact and effects
                DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget, 3.0f));
                DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eBreath, oTarget));
             }
        }
        //Get next target in spell area
        oTarget = GetNextObjectInShape(SHAPE_SPELLCONE, RADIUS_SIZE_ASTRONOMIC, GetSpellTargetLocation(), TRUE);
    }
}