void main()
{

object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

//object oTarget = GetObjectByTag("sjc_deepbell");

PlaySound("as_cv_bell2");

}