void main()
{
object oAOE = GetObjectByTag("145_aoe_statuetrap");
object oTarget = GetFirstInPersistentObject(oAOE);
object oEffectLocation = GetObjectByTag("145_effect_location");
effect eCollapse = EffectNWN2SpecialEffectFile("sjc_smallimpact", oEffectLocation);
ApplyEffectToObject(DURATION_TYPE_INSTANT, eCollapse, oEffectLocation); 
DestroyObject(GetObjectByTag("145_statue_1"));
DestroyObject(GetObjectByTag("145_statue_2"));


while (GetIsObjectValid(oTarget))
		{
		if (!GetIsDM(oTarget))
			{
			int iAC = GetAC(oTarget);
			if ((d20() + 12) >= iAC)
				{
				effect eDamage = EffectDamage(d6(2), DAMAGE_TYPE_BLUDGEONING);
				ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
				}
			}
		oTarget = GetNextInPersistentObject(oAOE);
		}























}