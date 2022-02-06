// Variables need to be put on the creatures claw/slam and the Creature.  Choose the OnHitCast Touch attack on the item.

#include "x2_inc_spellhook"
#include "x2_inc_switches"
#include "acr_creature_i"
#include "NW_I0_SPELLS"


void main()
{
	object oTarget = GetSpellTargetObject();
	int SaveDC = GetHitDice(OBJECT_SELF) / 2 + GetAbilityModifier(ABILITY_CHARISMA, OBJECT_SELF) + 10;

if(GetLocalString(OBJECT_SELF, "ACR_TOUCH_ATTACK") == "WRAITH")
	{
		if(GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
		{
			int nTouch = TouchAttackMelee(oTarget);
			int nDamage = d4();
			if(nTouch == 2) nDamage += d4();
			SendMessageToPC(oTarget, "nDamage = " + IntToString(nDamage));
			int nDrain = d6();
			if(nTouch && !FortitudeSave(oTarget, SaveDC, SAVING_THROW_TYPE_NEGATIVE, OBJECT_SELF))
			{
				if(nDrain >  GetAbilityScore(oTarget, ABILITY_CONSTITUTION) &&
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
						{
							nDrain += GetEffectInteger(eEffect, 1);
							RemoveEffect(oTarget, eEffect);
						}
						eEffect = GetNextEffect(oTarget);
					}
				}
				ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectTemporaryHitpoints(5)), OBJECT_SELF);
				ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_CONSTITUTION, nDrain)), oTarget);
				SendMessageToPC(oTarget, "Creature touches you! You feel more frail.");
				ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage), oTarget);
				ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectVisualEffect( VFX_IMP_PULSE_NEGATIVE ), oTarget );
			}
		}
	}
 
	else if(GetLocalString(OBJECT_SELF, "ACR_TOUCH_ATTACK") == "GHOST")
	{
		if(GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
	{
			int nTouch = TouchAttackMelee(oTarget);
			int nDamage = d6();
			SendMessageToPC(oTarget, "nDamage = " + IntToString(nDamage));
			if(nTouch == 2) nDamage += d6();
			int nDrain = d6();
			if(nTouch)
			{
				effect eEffect = GetFirstEffect(oTarget);
				//while(GetIsEffectValid(eEffect))
				{
					if(GetEffectSpellId(eEffect) == GetSpellId() &&
					   GetEffectCreator(eEffect) == OBJECT_SELF)
					{
						nDrain += GetEffectInteger(eEffect, 1);
						RemoveEffect(oTarget, eEffect);
					}
					eEffect = GetNextEffect(oTarget);
				}
				int nAbility = ABILITY_STRENGTH;
				
				// TODO: Make this less metagamey (perhaps integrate with ACR_CreatureBehavior?)
				if(GetLevelByClass(CLASS_TYPE_SORCERER, oTarget) ||
				   GetLevelByClass(CLASS_TYPE_FAVORED_SOUL, oTarget) ||
				   GetLevelByClass(CLASS_TYPE_BARD, oTarget))
				{
					nAbility = ABILITY_CHARISMA;
				}
				if(GetLevelByClass(CLASS_TYPE_CLERIC, oTarget) ||
				   GetLevelByClass(CLASS_TYPE_DRUID, oTarget) ||
				   GetLevelByClass(CLASS_TYPE_SPIRIT_SHAMAN, oTarget))
				{
					nAbility = ABILITY_WISDOM;
				}
				if(GetLevelByClass(CLASS_TYPE_WIZARD, oTarget))
				{
					nAbility = ABILITY_INTELLIGENCE;
				}
				
				if(nDrain >  GetAbilityScore(oTarget, nAbility) &&
				   !GetIsImmune(oTarget, IMMUNITY_TYPE_ABILITY_DECREASE))
				{
					ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectParalyze(), oTarget);
				}
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(5), OBJECT_SELF);
				ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(nAbility, nDrain)), oTarget);
				SendMessageToPC(oTarget, "Creature touches you! You feel drained.");
				ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage), oTarget);
				ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect( VFX_IMP_PULSE_NEGATIVE ), oTarget );
			}
		}
	}
	
	
	  
else if(GetLocalString(OBJECT_SELF, "ACR_TOUCH_ATTACK") == "ALLIP")
	{
		if(GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
		{
			int nTouch = TouchAttackMelee(oTarget);
        	int nDamage = d4();
			SendMessageToPC(oTarget, "nDamage = " + IntToString(nDamage));
			if(nTouch == 2) nDamage += d4();
			if(nTouch)
			{
				if(nDamage >  GetAbilityScore(oTarget, ABILITY_WISDOM) &&
				   !GetIsImmune(oTarget, IMMUNITY_TYPE_ABILITY_DECREASE))
				{
					ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSleep(), oTarget);
				}
				else
				{
					effect eEffect = GetFirstEffect(oTarget);
					while(GetIsEffectValid(eEffect))
					{
						if(GetEffectSpellId(eEffect) == GetSpellId() &&
						   GetEffectCreator(eEffect) == OBJECT_SELF)
						{
							nDamage += GetEffectInteger(eEffect, 1);
							RemoveEffect(oTarget, eEffect);
						}
						eEffect = GetNextEffect(oTarget);
					}
				}
				ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectTemporaryHitpoints(5)), OBJECT_SELF);
				ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_WISDOM, nDamage)), oTarget);
				SendMessageToPC(oTarget, "Creature touches you! Panic clouds your judgement.");
				ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectVisualEffect( VFX_IMP_PULSE_NEGATIVE ), oTarget );
			}
		}
	}
	 
	else if(GetLocalString(OBJECT_SELF, "ACR_TOUCH_ATTACK") == "WISP")
	{
		if(GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
		{
			int nTouch = TouchAttackMelee(oTarget);
			int nDamage = d8(2);
			SendMessageToPC(oTarget, "nDamage = " + IntToString(nDamage));
			if(nTouch == 2) nDamage += d8(2);
			if(nTouch)
			{
				ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectDamage( nDamage, DAMAGE_TYPE_ELECTRICAL ), oTarget );
			    SendMessageToPC(oTarget, "Creature touches you! You feel a jolt run through your body");
				ApplyEffectToObject( DURATION_TYPE_TEMPORARY, EffectBeam( VFX_BEAM_SHOCKING_GRASP, OBJECT_SELF, BODY_NODE_CHEST, FALSE ), oTarget, 1.0f );
			}
		}
   }
    
		else if(GetLocalString(OBJECT_SELF, "ACR_TOUCH_ATTACK") == "SHADOW")
		{
		if(GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
		{
			int nTouch = TouchAttackMelee(oTarget);
			int nDamage = 0;
			
			{
        nDamage = d6();
        if(nTouch == 2) nDamage += d6();
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
						{
							nDamage += GetEffectInteger(eEffect, 1);
							RemoveEffect(oTarget, eEffect);
						}
						eEffect = GetNextEffect(oTarget);
					}
				}
				ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectAbilityDecrease(ABILITY_STRENGTH, nDamage)), oTarget);
				SendMessageToPC(oTarget, "Creature touches you! Suddenly everything is weighing you down ");
				ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectVisualEffect( VFX_IMP_PULSE_NEGATIVE ), oTarget );
			}
		}
	 }
	 }
  else
	{
    	if(GetLocalString(OBJECT_SELF, "ACR_TOUCH_ATTACK") == "GREATER SHADOW")
		{
		if(GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
		{
			int nTouch = TouchAttackMelee(oTarget);
			int nDamage = 0;
			
			{
        nDamage = d8();
        if(nTouch == 2) nDamage += d8();
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
						{
							nDamage += GetEffectInteger(eEffect, 1);
							RemoveEffect(oTarget, eEffect);
						}
						eEffect = GetNextEffect(oTarget);
					}
				}
				ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectAbilityDecrease(ABILITY_STRENGTH, nDamage)), oTarget);
				SendMessageToPC(oTarget, "Creature touches you! Suddenly everything is weighing you down alot more");
				ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectVisualEffect( VFX_IMP_PULSE_NEGATIVE ), oTarget );
			}
		}
	 }
}
}
}


