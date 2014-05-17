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
   if 	(GetTag(oItem)=="011_sjc_gamebird") 
   			{DestroyObject(oItem);
		  	 nItems = nItems + 1;}
   		oItem = GetNextItemInInventory(oPC);
   }

int nGold = nItems*8;
int iXP = nItems*8;
ACR_GiveXPToPC(oPC, iXP); 
GiveGoldToCreature(oPC, nGold);

int nItems2 = 0;
object oItem2 = GetFirstItemInInventory(oPC);
while (GetIsObjectValid(oItem2))
   {
   if 	(GetTag(oItem2)=="011_sjc_deadrabbit") 
   			{DestroyObject(oItem2);
		  	 nItems2 = nItems2 + 1;}
   		oItem2 = GetNextItemInInventory(oPC);
   }

int nGold2 = nItems2*8;
int iXP2 = nItems2*8;
ACR_AwardStaticQuestXP(oPC, "cooky", iXP2); 
GiveGoldToCreature(oPC, nGold2);

}