void main()
{
object oCreator = GetAreaOfEffectCreator();
object oTarget = GetFirstInPersistentObject(OBJECT_SELF);
while (GetIsObjectValid(oTarget))
	{
	if (GetIsPC(oTarget) || GetIsDMPossessed(oTarget))
		{
		int iAC = GetAC(oTarget);
		
		if ((d20() + 5) >= iAC)
			{
			location lLocation = GetLocation(oTarget);
			int iDamage = (d8() + 4);
			effect eDamage = EffectDamage(iDamage, DAMAGE_TYPE_SLASHING);
			ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDamage, oTarget); 
			effect eSpurt = EffectNWN2SpecialEffectFile("bloodspurt", oTarget);
			ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSpurt, lLocation);
			}
		}
	oTarget = GetNextInPersistentObject();
	}

}