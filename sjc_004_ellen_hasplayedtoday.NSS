void main()
{
int iDay = GetCalendarDay();
object oPC = GetPCSpeaker();
SetLocalInt(oPC, "004_Bard_HasPlayed", iDay);
} 