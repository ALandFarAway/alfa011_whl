void main()
{

object oPC = GetEnteringObject();
if  (GetLocalInt(OBJECT_SELF, "GLYPHFIRED") == 1)
	{
	return;
	}
if (GetLevelByClass(CLASS_TYPE_UNDEAD, oPC) != 0)
	{
	SetLocalInt(OBJECT_SELF, "GLYPHFIRED", 1);
	effect eDamage = EffectDamage(d8(4), DAMAGE_TYPE_FIRE);
	effect eVisual = EffectNWN2SpecialEffectFile("sp_magic_hit", oPC);
	ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oPC);
	ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);
	DestroyObject(GetObjectByTag("115_glyph_visual"));
	}



}