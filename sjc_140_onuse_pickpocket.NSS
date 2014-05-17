void main()
{


object oPC = GetLastUsedBy();
int iSkill = GetSkillRank(SKILL_SLEIGHT_OF_HAND, oPC);

PlayCustomAnimation(OBJECT_SELF,"gettable", 0);

if (GetLocalInt(oPC, "140_STEALFAIL") == 1)
	{
	FloatingTextStringOnCreature("You have done this part of the test and cannot try again today", oPC, FALSE);
	return;
	}

if (d20() + iSkill > 18)
	{
	SetLocalInt(oPC, "140_STEALFAIL", 1);
	FloatingTextStringOnCreature("You find and retrieve the key without triggering the alarm", oPC, FALSE);
	CreateItemOnObject("140_chest", oPC);
	}
	
else
	{
	SetLocalInt(oPC, "140_STEALFAIL", 1);
	FloatingTextStringOnCreature("You fail to retrieve the key cleanly and the alarm bell sounds", oPC, FALSE);
	PlaySound("as_cv_bellwind1");
	}


}