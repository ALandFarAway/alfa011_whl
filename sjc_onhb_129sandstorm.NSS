void main()
{

object oTrigger = OBJECT_SELF;
effect eKnockdown = EffectKnockdown();
object oAffected = GetFirstInPersistentObject();

while (GetIsObjectValid(oAffected) == TRUE)
	{
	if (GetIsPC(oAffected))
		{
		if (FortitudeSave(oAffected, 18) == 0)
			{
			FloatingTextStringOnCreature("The wind has knocked you down", oAffected);
			ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnockdown, oAffected, 5.0f); 
			}
		
		} 
	oAffected = GetNextInPersistentObject();
	} 


















}