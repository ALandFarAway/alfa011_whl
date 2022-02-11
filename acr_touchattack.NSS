


#include "x2_inc_spellhook"
#include "x2_inc_switches"
#include "acr_creature_i"
#include "NW_I0_SPELLS"


void main()
{
	object oTarget = GetSpellTargetObject();
	if(GetLocalString(OBJECT_SELF, "ACR_TOUCH_ATTACK") == "SHADOW")
	{
		if(GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
		{
			int nTouch = TouchAttackMelee(oTarget);
			int nDamage = 0;
			SendMessageToPC(oTarget, "nDamage = " + IntToString(nDamage));
			
			
        nDamage = d6(1);
        if(nTouch == 2) nDamage += d6(1);
		SendMessageToPC(oTarget, "nDamage = " + IntToString(nDamage));
		if(nTouch)
			{
				if(nDamage >  GetAbilityScore(oTarget, ABILITY_STRENGTH) &&
				   !GetIsImmune(oTarget, IMMUNITY_TYPE_ABILITY_DECREASE))
				{
					ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oTarget);
				}
				else
				{
					effect eEffect = GetFirstEffect(oTarget);
					while(GetIsEffectValid(eEffect))
					{
						if(GetEffectSpellId(eEffect) == GetSpellId() &&
						   GetEffectCreator(eEffect) == OBJECT_SELF)
						//{
						//	nDamage += GetEffectInteger(eEffect, 1);
					//		RemoveEffect(oTarget, eEffect);
					//	}
						eEffect = GetNextEffect(oTarget);
					}
				}
				ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectAbilityDecrease(ABILITY_STRENGTH, nDamage)), oTarget);
				SendMessageToPC(oTarget, GetName(OBJECT_SELF) + " touches you! Strength goes out of your limbs.");
				ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectVisualEffect( VFX_IMP_PULSE_NEGATIVE ), oTarget );
			}
	
	 }
   }
} 
   
     
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   