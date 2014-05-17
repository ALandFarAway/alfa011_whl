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
   if 	(GetTag(oItem)=="011_sjc_koboldtail") 
   			{DestroyObject(oItem);
		  	 nItems = nItems + 1;}
   		oItem = GetNextItemInInventory(oPC);
   }

int nGold = nItems*1;
int iXP = nItems*5;
ACR_AwardStaticQuestXP(oPC, "koboldtail", iXP); 
GiveGoldToCreature(oPC, nGold);

int nItems2 = 0;
object oItem2 = GetFirstItemInInventory(oPC);
while (GetIsObjectValid(oItem2))
   {
   if 	(GetTag(oItem2)=="011_sjc_orctusk") 
   			{DestroyObject(oItem2);
		  	 nItems2 = nItems2 + 1;}
   		oItem2 = GetNextItemInInventory(oPC);
   }

int nGold2 = nItems2*1;
int iXP2 = nItems2*5;
ACR_AwardStaticQuestXP(oPC, "orctusk", iXP2); 
GiveGoldToCreature(oPC, nGold2);

int nItems3 = 0;
object oItem3 = GetFirstItemInInventory(oPC);
while (GetIsObjectValid(oItem3))
   {
   if 	(GetTag(oItem3)=="011_sjc_goblinhand") 
   			{DestroyObject(oItem3);
		  	 nItems3 = nItems3 + 1;}
   		oItem3 = GetNextItemInInventory(oPC);
   }

int nGold3 = nItems3*1;
int iXP3 = nItems3*5;
ACR_AwardStaticQuestXP(oPC, "goblinhand", iXP3); 
GiveGoldToCreature(oPC, nGold3);

int nItems4 = 0;
object oItem4 = GetFirstItemInInventory(oPC);
while (GetIsObjectValid(oItem4))
   {
   if 	(GetTag(oItem4)=="011_sjc_hobgoblinhand") 
   			{DestroyObject(oItem4);
		  	 nItems4 = nItems4 + 1;}
   		oItem4 = GetNextItemInInventory(oPC);
   }

int nGold4 = nItems4*2;
int iXP4 = nItems4*6;
ACR_AwardStaticQuestXP(oPC, "hobgoblinhand", iXP4); 
GiveGoldToCreature(oPC, nGold4);

int nItems5 = 0;
object oItem5 = GetFirstItemInInventory(oPC);
while (GetIsObjectValid(oItem5))
   {
   if 	(GetTag(oItem5)=="011_sjc_ogrehand") 
   			{DestroyObject(oItem5);
		  	 nItems5 = nItems5 + 1;}
   		oItem5 = GetNextItemInInventory(oPC);
   }

int nGold5 = nItems5*3;
int iXP5 = nItems5*10;
ACR_AwardStaticQuestXP(oPC, "ogrehand", iXP5); 
GiveGoldToCreature(oPC, nGold5);

int nItems6 = 0;
object oItem6 = GetFirstItemInInventory(oPC);
while (GetIsObjectValid(oItem6))
   {
   if 	(GetTag(oItem6)=="011_sjc_ogrefoot") 
   			{DestroyObject(oItem6);
		  	 nItems6 = nItems6 + 1;}
   		oItem6 = GetNextItemInInventory(oPC);
   }

int nGold6 = nItems6*3;
int iXP6 = nItems6*10;
ACR_AwardStaticQuestXP(oPC, "ogrefoot", iXP6); 
GiveGoldToCreature(oPC, nGold6);

int nItems7 = 0;
object oItem7 = GetFirstItemInInventory(oPC);
while (GetIsObjectValid(oItem7))
   {
   if 	(GetTag(oItem7)=="011_sjc_bugbearear") 
   			{DestroyObject(oItem7);
		  	 nItems7 = nItems7 + 1;}
   		oItem7 = GetNextItemInInventory(oPC);
   }

int nGold7 = nItems7*3;
int iXP7 = nItems7*13;
ACR_AwardStaticQuestXP(oPC, "bugbearear", iXP7); 
GiveGoldToCreature(oPC, nGold7);
}