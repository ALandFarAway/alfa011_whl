//TSM individual item onHit cast.  
//Wynna February 2008


#include "acr_items_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "acr_db_persist_i"
#include "ginc_math"
#include "acr_spells_i"


void main()
	{ // object oItem;        // The item triggering this spellscript
	   object oItem  		= GetSpellCastItem();    // The item casting triggering this spellscript
	   object oSpellOrigin = OBJECT_SELF ;
	   object oTarget; // On a weapon: The one being hit. On an armor: The one hitting the armor
	   object oWielder; // On a weapon: The one wielding the weapon. On an armor: The one wearing an armor
	   int nCastSummon = Random(75);
	  { //moved from above Action
	   SendMessageToPC(oWielder, "Hit");
	   //SendMessageToPC(oPossessor,"Hit");
	   SendMessageToPC(oWielder, IntToString(nCastSummon));
	    //SendMessageToPC(oPossessor, IntToString(nCastSummon));
	   if(nCastSummon==1)
	   	
	  	ActionCastSpellAtLocation(SPELL_SUMMON_CREATURE_I, GetLocation(oWielder), METAMAGIC_NONE, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
		//ActionCastSpellAtLocation(SPELL_SUMMON_CREATURE_I, GetLocation(oPossessor), METAMAGIC_NONE, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
	  	}		
}			  