


#include "x2_inc_spellhook"
#include "x2_inc_switches"
#include "acr_creature_i"
#include "NW_I0_SPELLS"
#include "acr_zspawn_i"



void main()
{
    ACR_CreatureOnSpawnIn();

    // Custom code goes here.
	IncorporealEffects(OBJECT_SELF);

   
//{
	object oTarget = GetSpellTargetObject();
	if(GetLocalString(OBJECT_SELF, "ACR_TOUCH_ATTACK") == "LESSER_SHADOW")
	{
		if(GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
		{
			int nTouch = TouchAttackMelee(oTarget,TRUE, 0);
	    	int nDrain = d6(1);
			SendMessageToPC(oTarget, "nDrain = " + IntToString(nDrain));
			if(nTouch)
			{
				if(nDrain >  GetAbilityScore(oTarget, ABILITY_STRENGTH) &&
				   !GetIsImmune(oTarget, IMMUNITY_TYPE_ABILITY_DECREASE))
				{
				ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oTarget);
				}
				ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectAbilityDecrease(ABILITY_STRENGTH, nDrain)), oTarget);
				SendMessageToPC(oTarget, GetName(OBJECT_SELF) + " touches you! Strength goes out of your limbs.");
				ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectVisualEffect( VFX_IMP_PULSE_NEGATIVE ), oTarget );
			}
	      }
		}  
   //}
}     


   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   