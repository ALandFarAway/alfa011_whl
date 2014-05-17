void main()
{

object oPC = GetEnteringObject();

if (GetLevelByClass(CLASS_TYPE_CLERIC, oPC) == 0) {return;}
	
if (GetDeity(oPC) == "Cyric")
	{
	AddJournalQuestEntry("dmq_001", 1, oPC, FALSE, FALSE, FALSE);
	}
}