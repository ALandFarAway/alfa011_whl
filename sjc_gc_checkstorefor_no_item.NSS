// sjc_gc_checkstorefor_no_item
/*
    This script checks to see if a store has no items in stock
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
		if (sTag == sItem) return FALSE;
		oItem = GetNextItemInInventory(oStore);
		}
	return TRUE;
}