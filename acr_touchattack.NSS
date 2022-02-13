


#include "x2_inc_spellhook"
#include "x2_inc_switches"
#include "acr_creature_i"
#include "NW_I0_SPELLS"
#include "acr_zspawn_i"
#include "x0_i0_spells"


void main()
{
    ACR_CreatureOnSpawnIn();
    object oCreature = OBJECT_SELF;
    // Custom code goes here.
	//IncorporealEffects(OBJECT_SELF);
	ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectDamageReduction(50, DAMAGE_POWER_PLUS_ONE, 0, DR_TYPE_MAGICBONUS)), oCreature);
	ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectConcealment(50)), oCreature);
	int nDeflection = GetAbilityModifier(ABILITY_CHARISMA, oCreature);
	if(nDeflection < 1) nDeflection = 1;
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectACIncrease(nDeflection, AC_DEFLECTION_BONUS)), oCreature);
	ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectSkillIncrease(SKILL_MOVE_SILENTLY, 50)), oCreature);
	ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectImmunity(IMMUNITY_TYPE_ENTANGLE)), oCreature);
	ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectImmunity(IMMUNITY_TYPE_KNOCKDOWN)), oCreature);
   
//{
	object oTarget = GetSpellTargetObject();
	if(GetLocalString(OBJECT_SELF, "ACR_TOUCH_ATTACK") == "LESSER_SHADOW")
	{
		if(GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
		
		{
			int nTouch = TouchAttackMelee(oTarget,TRUE, -1);
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


   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   