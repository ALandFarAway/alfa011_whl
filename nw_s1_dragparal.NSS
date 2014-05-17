//::///////////////////////////////////////////////
//:: Dragon Breath Paralyze
//:: NW_S1_DragParal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calculates the proper DC Save for the
    breath weapon based on the HD of the dragon.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: May 9, 2001
//:: Modified By: DannJ, 5 June 5 2011
//:://////////////////////////////////////////////
#include "NW_I0_SPELLS"

void ParalysisBreath(int nCount, int nDC);

void main()
{
    //Declare major variables
    int nAge = GetHitDice(OBJECT_SELF);
    int nCount;
    int nDC;
    float fDelay;
    object oTarget;
    //Determine save DC and ability damage
   if (nAge <= 6) //Wyrmling
    {
        nDC = 14;
        nCount = 1;
    }
    else if (nAge >= 7 && nAge <= 9) //Very Young
    {
        nDC = 17;
        nCount = 2;
    }
    else if (nAge >= 10 && nAge <= 12) //Young
    {
        nDC = 18;
        nCount = 3;
    }
    else if (nAge >= 13 && nAge <= 15) //Juvenile
    {
        nDC = 21;
        nCount = 4;
    }
    else if (nAge >= 16 && nAge <= 18) //Young Adult
    {
        nDC = 23;
        nCount = 5;
    }
    else if (nAge >= 19 && nAge <= 21) //Adult
    {
        nDC = 26;
        nCount = 6;
    }
    else if (nAge >= 22 && nAge <= 24) //Mature Adult
    {
        nDC = 27;
        nCount = 7;
    }
    else if (nAge >= 25 && nAge <= 27) //Old
    {
        nDC = 30;
        nCount = 8;
    }
    else if (nAge >= 28 && nAge <= 30) //Very Old
    {
        nDC = 31;
        nCount = 9;
    }
    else if (nAge >= 31 && nAge <= 33) //Ancient
    {
        nDC = 34;
        nCount = 10;
    }
    else if (nAge >= 34 && nAge <= 37) //Wyrm
    {
        nDC = 36;
        nCount = 11;
    }
    else if (nAge > 37) //Great Wyrm
    {
        nDC = 39;
        nCount = 12;
    }
    PlayDragonBattleCry();
    effect eBreath = EffectNWN2SpecialEffectFile("fx_paralysis_breath.sef");
    PlayCustomAnimation(OBJECT_SELF, "Una_breathattack01", 0, 0.7f);
    DelayCommand(0.5f, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBreath, OBJECT_SELF, 3.0f));
    DelayCommand(0.7f, ParalysisBreath(nCount, nDC));
}

void ParalysisBreath(int nCount, int nDC)
{
	float fDelay;
    effect eBreath = EffectParalyze(nDC, SAVING_THROW_FORT);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eDur2 = EffectVisualEffect(VFX_DUR_PARALYZE_HOLD);
    effect eParal = EffectVisualEffect(VFX_DUR_PARALYZED);
    
    effect eLink = EffectLinkEffects(eBreath, eDur);
    eLink = EffectLinkEffects(eLink, eDur2);
    eLink = EffectLinkEffects(eLink, eParal);
	
    object oTarget = GetFirstObjectInShape(SHAPE_SPELLCONE, RADIUS_SIZE_ASTRONOMIC, GetSpellTargetLocation(), TRUE);
    while(GetIsObjectValid(oTarget))
    {
        if(oTarget != OBJECT_SELF && spellsIsTarget(oTarget, SPELL_TARGET_STANDARDHOSTILE, OBJECT_SELF))
        {	

            //Fire cast spell at event for the specified target
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELLABILITY_DRAGON_BREATH_PARALYZE));
            fDelay = GetDistanceBetween(oTarget, OBJECT_SELF)/20;
            if(MySavingThrow(SAVING_THROW_FORT, oTarget, nDC, SAVING_THROW_TYPE_NONE, OBJECT_SELF, 0.0) == 0)
            {
                //Apply the VFX impact and effects
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nCount)));
            }

        }
        //Get next target in spell area
        oTarget = GetNextObjectInShape(SHAPE_SPELLCONE, RADIUS_SIZE_ASTRONOMIC, GetSpellTargetLocation(), TRUE);
    }
}