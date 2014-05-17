// Reward PC for each copy of item with tag "sjc_venison"
// they have in their inventory.
// Fired from conversation node after checking for presence of item
// with gc_check_item and sItem = "sjc_venison"
// Teric neDhalir 060907


#include "acr_xp_i"
void main()
{
object oPC = GetPCSpeaker();
int nItems = 0;
object oItem = GetFirstItemInInventory(oPC);

while (GetIsObjectValid(oItem))
   {
   if 	(GetTag(oItem)=="011_sjc_111_ingredients") 
   			{DestroyObject(oItem);
		  	 nItems = nItems + 1;}
   		oItem = GetNextItemInInventory(oPC);
   }

int nGold = nItems*15;
int iXP = nItems*15;
ACR_AwardStaticQuestXP(oPC, "111_alchemist", iXP); 
GiveGoldToCreature(oPC, nGold);
}