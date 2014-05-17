//::///////////////////////////////////////////////
//:: Dragon Breath Cold
//:: nw_s1_dragcold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calculates the proper damage and DC Save for the
    breath weapon based on the HD of the dragon.
*/
//:://////////////////////////////////////////////
//:: Modified: June 4, 2011 (DannJ)
//:://////////////////////////////////////////////
#include "NW_I0_SPELLS"

void ColdFire(int nDamage, int nDC);

void main()
{
    //Declare major variables
    int nAge = GetHitDice(OBJECT_SELF);
    int nDamage;// cold damage
    int nDC;
    float fDelay;
    object oTarget;
    //Determine save DC and ability damage
    if (nAge <= 5) //Wyrmling
    {
        nDamage = 1;
        nDC = 12;
    }
    else if (nAge >= 6 && nAge <= 8) //Very Young
    {
        nDamage = 2;
        nDC = 14;
    }
    else if (nAge >= 9 && nAge <= 11) //Young
    {
        nDamage = 3;
        nDC = 16;
    }
    else if (nAge >= 12 && nAge <= 14) //Juvenile
    {
        nDamage = 4;
        nDC = 18;
    }
    else if (nAge >= 15 && nAge <= 17) //Young Adult
    {
        nDamage = 5;
        nDC = 20;
    }
    else if (nAge >= 18 && nAge <= 20) //Adult
    {
        nDamage = 6;
        nDC = 23;
    }
    else if (nAge >= 21 && nAge <= 23) //Mature Adult
    {
        nDamage = 7;
        nDC = 25;
    }
    else if (nAge >= 24 && nAge <= 26) //Old
    {
        nDamage = 8;
        nDC = 27;
    }
    else if (nAge >= 27 && nAge <= 29) //Very Old
    {
        nDamage = 19;
        nDC = 29;
    }
    else if (nAge >= 30 && nAge <= 32) //Ancient
    {
        nDamage = 10;
        nDC = 31;
    }
    else if (nAge >= 33 && nAge < 35) //Wyrm
    {
        nDamage = 11;
        nDC = 33;
    }
    else if (nAge >= 36) //Great Wyrm
    {
        nDamage = 12;
        nDC = 36;
    }
    PlayDragonBattleCry();
    effect eBreath = EffectNWN2SpecialEffectFile("fx_cold_breath.sef");
    PlayCustomAnimation(OBJECT_SELF, "Una_breathattack01", 0, 0.7f);
    DelayCommand(0.5f, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBreath, OBJECT_SELF, 3.0f));
    DelayCommand(0.7f, ColdFire(nDamage, nDC));
}

void ColdFire(int nDamage, int nDC)
{
	float fDelay;
    effect eVis = EffectVisualEffect(VFX_IMP_FROST_S);
    object oTarget = GetFirstObjectInShape(SHAPE_SPELLCONE, RADIUS_SIZE_VAST, GetSpellTargetLocation(), TRUE);
    while(GetIsObjectValid(oTarget))
    {
        if(oTarget != OBJECT_SELF && spellsIsTarget(oTarget, SPELL_TARGET_STANDARDHOSTILE, OBJECT_SELF))
        {
            //Reset the damage to full
            int nDamStrike = d6(nDamage);	

            //Fire cast spell at event for the specified target
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELLABILITY_DRAGON_BREATH_FIRE));
            //Adjust the damage based on the Reflex Save, Evasion and Improved Evasion.
            if(MySavingThrow(SAVING_THROW_REFLEX, oTarget, nDC, SAVING_THROW_TYPE_COLD))
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
			effect eBreath = EffectDamage(nDamStrike, DAMAGE_TYPE_COLD);
			if (nDamStrike > 0)
            {
                //Apply the VFX impact and effects
                DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget, 3.0f));
                DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eBreath, oTarget));
             }
        }
        //Get next target in spell area
        oTarget = GetNextObjectInShape(SHAPE_SPELLCONE, RADIUS_SIZE_VAST, GetSpellTargetLocation(), TRUE);
    }
}