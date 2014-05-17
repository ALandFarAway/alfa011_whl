

int StartingConditional() {
  
  int iMessageSent = GetLocalInt( OBJECT_SELF, "116_MessageSent");
  int iDay = GetCalendarDay();
  if (iDay == iMessageSent) return TRUE;
  return FALSE;
}