

#include "acr_db_persist_i"

void main(string sTag)
{
object oArea = GetArea(OBJECT_SELF);
ACR_SetPersistentInt(oArea, sTag + "CheckedOut", 1);
}