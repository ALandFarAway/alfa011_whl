// Placeable OnUsed Template	
/*
	Required: Static=FALSE, Usable=TRUE, CurrentHP>0, attach script to the OnUsed event
	Suggested: Plot=TRUE, DefaultActionPreference="Use"
*/
//



void main()
{
	object oUser = GetLastUsedBy();
	effect eTripping = EffectNWN2SpecialEffectFile("sjc_tripping");
	ApplyEffectToObject(DURATION_TYPE_PERMANENT, eTripping, oUser);
	FloatingTextStringOnCreature("The brew is bitter and hard to swallow and suddenly things begin to look a bit strange...", oUser);
	SetLocalInt(oUser, "112_drunkpotion", 1);
	
}