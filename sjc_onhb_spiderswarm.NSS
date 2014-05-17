void main()
{
int iDamage = d6();
effect eDamage = EffectDamage(iDamage);
effect ePoison = EffectPoison(POISON_SMALL_SPIDER_VENOM);
effect eAttack = EffectLinkEffects(eDamage, ePoison);
object oCreator = GetAreaOfEffectCreator();
object oTarget = GetFirstInPersistentObject(OBJECT_SELF);

while (GetIsObjectValid(oTarget))
	{
	if (GetIsPC(oTarget) || GetIsDMPossessed(oTarget))
		{
		ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAttack, oTarget); 
		}
	oTarget = GetNextInPersistentObject();
	}
















}