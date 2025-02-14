//onenter_wardmist
//8-2022  Arri

//Put this script OnEnter
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

object oTarget;
oTarget = oPC;

ActionCastSpellAtObject(SPELL_FEAR, oTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);

effect eEffect;
eEffect = EffectDamage(2, DAMAGE_TYPE_NEGATIVE, DAMAGE_POWER_NORMAL);

ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oPC);

ActionSpeakString("* You feel as if claws are raking your skin* ");

}