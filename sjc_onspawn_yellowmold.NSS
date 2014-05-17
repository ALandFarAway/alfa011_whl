void main()
{
	effect eAOE = EffectAreaOfEffect(67,"sjc_yellowmold_onenter", "****", "****");
	ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAOE, OBJECT_SELF);
    


	object oTarget = OBJECT_SELF;
    effect ePetrify = EffectPetrify();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePetrify, oTarget);



}