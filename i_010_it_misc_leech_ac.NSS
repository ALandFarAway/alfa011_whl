#define FLOAT_RANGE_SHORT 3.0f

void main()
{
	object oPC  = GetItemActivator();
	object oTarget = GetItemActivatedTarget();

	if (GetDistanceBetween(oPC, oTarget) <= FLOAT_RANGE_SHORT)
	{
		int iLeech = d100();

		AssignCommand(oPC, ActionSpeakString("*applies some leeches on "+GetName(oTarget)+"*"));
		if (iLeech >= 90)
		{
			SendMessageToPC(oPC, "The leeches seem to have helped!");

			effect eEffect = GetFirstEffect(oTarget);

			while (GetIsEffectValid(eEffect))
			{
				if (GetEffectType(eEffect) == EFFECT_TYPE_DISEASE)
					RemoveEffect(oTarget, eEffect);
				else if (GetEffectType(eEffect) == EFFECT_TYPE_POISON)
					RemoveEffect(oTarget, eEffect);

				eEffect = GetNextEffect(oTarget);
			}
		}
		else
		{
			SendMessageToPC(oPC, "The leeches didn't seem to help.");

			if (iLeech <= 25)
				ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(1,DAMAGE_TYPE_PIERCING),oTarget);
		}

		AssignCommand(oPC, ActionSpeakString("The leeches seem to have harmed your patient!"));
	}
	else
	{
		SendMessageToPC(oPC, "You dropped a leech on the ground.  You need to get closer.");
	}
}