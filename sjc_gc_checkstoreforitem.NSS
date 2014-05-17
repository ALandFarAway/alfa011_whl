// sjc_gc_checkstoreforitem
/*
    This script checks to see if a store has an item in stock
	string sItem = Tag of item to look for
	string sStore = Tag of store to look in
*/
// 

int StartingConditional(string sItem, string sStore)
{

object oStore = GetObjectByTag(sStore);
object oItem = GetFirstItemInInventory(oStore);
	while (oItem != OBJECT_INVALID)
		{
		string sTag = GetTag(oItem);
		if (sTag == sItem) return TRUE;
		oItem = GetNextItemInInventory(oStore);
		}
	return FALSE;
}