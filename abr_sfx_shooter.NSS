#include "ginc_debug"
#include "ginc_param_const"
	
void main ()
{	
	object oTarget = GetTarget(TARGET_OBJECT_SELF);
	int interval = GetLocalInt(oTarget,"interval");
	int variation = Random(GetLocalInt(oTarget,"interval_variation"));
	// this will get a value of 1 or 2
	int upordown = Random(3);

	if (upordown == 1)interval += variation;
	// we dont want our int to become negative, so check
	else if (interval > variation) interval -= variation;
	
	string sfx_name = GetLocalString(oTarget, "sfx_name");
	// we now change the heartbeat time so it fires with new time
	SetCustomHeartbeat(oTarget,interval);
	// and dont forget to apply the effect	
	effect ef = EffectNWN2SpecialEffectFile(sfx_name);
	// todo: apply variation to the position
	ApplyEffectToObject(DURATION_TYPE_INSTANT, ef, oTarget);
}