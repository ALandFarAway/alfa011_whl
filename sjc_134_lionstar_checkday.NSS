

int StartingConditional() {
  
  int iMessageSent = GetLocalInt( OBJECT_SELF, "134_MessageSent");
  int iDay = GetCalendarDay();
  if (iDay == iMessageSent) return TRUE;
  return FALSE;
}