

int StartingConditional() {
  object oPC = GetPCSpeaker();
  int iLastPlayed = GetLocalInt( oPC, "004_Bard_HasPlayed");
  int iDay = GetCalendarDay();
  if (iDay == iLastPlayed) return TRUE;
  return FALSE;
}