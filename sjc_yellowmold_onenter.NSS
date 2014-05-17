void main()
{
SendMessageToPC(GetFirstPC(), "triggered"); //Debug
object oTarget = GetEnteringObject();
if (!GetIsPC(oTarget)) return;




if (FortitudeSave(oTarget, 15, SAVING_THROW_TYPE_NONE, GetAreaOfEffectCreator()) == 0)

	{
	SendMessageToPC(GetFirstPC(), "failed save"); //Debug
	effect eConDrain = EffectAbilityDecrease(ABILITY_CONSTITUTION, d6());
	ApplyEffectToObject(DURATION_TYPE_PERMANENT, eConDrain, oTarget);}


}