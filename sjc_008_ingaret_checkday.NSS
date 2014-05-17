

int StartingConditional() {
  object oPC = GetPCSpeaker();
  int iDonePatrol = GetLocalInt( oPC, "q_sjc_moorpatroldone");
  int iDay = GetCalendarDay();
  if (iDay == iDonePatrol) return TRUE;
  return FALSE;
}