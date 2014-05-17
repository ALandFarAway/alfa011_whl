void main()
{
object oAOE = GetObjectByTag("aoe_collapsingroof");
object oTarget = GetFirstInPersistentObject(oAOE);
object oEffectLocation = GetObjectByTag("effect_location");
effect eDamage = EffectDamage(d6(5), DAMAGE_TYPE_BLUDGEONING);

effect eCollapse = EffectNWN2SpecialEffectFile("fx_rockslide", oEffectLocation);
ApplyEffectToObject(DURATION_TYPE_INSTANT, eCollapse, oEffectLocation); 
while (GetIsObjectValid(oTarget))
		{
		ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
		oTarget = GetNextInPersistentObject(oAOE);
		}
























}