//TSM individual item onHit cast.  
//Wynna February 2008


 #include "acr_items_i"
 #include "acr_spawn_i"
 #include "acr_tools_i"
 #include "acr_db_persist_i"
#include "ginc_math"
#include "acr_spells_i"


void main()
	{  //object oItem;        // The item triggering this spellscript
	   //object oTarget; // On a weapon: The one being hit. On an armor: The one hitting the armor
	   //object oWielder; // On a weapon: The one wielding the weapon. On an armor: The one wearing an armor
	   object oItem  		= GetSpellCastItem();    // The item casting that triggered this spellscript
   	   object oSpellOrigin = OBJECT_SELF ;
	   object oSpellTarget = GetSpellTargetObject();
	   object oWielder = GetItemPossessor(oItem);
	   int nCastSummon = Random(95);
	 
	   
	   //SendMessageToPC(oWielder, "Hit");
	    SendMessageToPC(oWielder, "Hit");
	   SendMessageToPC(oWielder, IntToString(nCastSummon));
	   if(nCastSummon==1)	
	   {
	   	ActionCastSpellAtLocation(SPELL_SUMMON_CREATURE_I, GetLocation(oWielder), METAMAGIC_NONE, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
	  	}		
}			  		  