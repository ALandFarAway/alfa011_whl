

 #include "acr_items_i"
 #include "acr_spawn_i"
 #include "acr_tools_i"
 #include "acr_db_persist_i"
#include "ginc_math"
#include "acr_spells_i"
#include "ginc_debug"
#include "x2_inc_spellhook"


void main()
	{  //object oItem;        // The item triggering this spellscript
	   //object oTarget; // On a weapon: The one being hit. On an armor: The one hitting the armor
	   //object oWielder; // On a weapon: The one wielding the weapon. On an armor: The one wearing an armor
	   object oItem  		= GetSpellCastItem();    // The item casting that triggered this spellscript
   	   object oSpellOrigin = OBJECT_SELF ;
	   object oSpellTarget = GetSpellTargetObject();
	   object oPossessor = GetItemPossessor(oItem);
	   int nCastSummon = Random(95);
	   itemproperty ipCast = ItemPropertyCastSpell(IP_CONST_CASTSPELL_UNIQUE_POWER_SELF_ONLY,-1);
	   
	  
	   SendMessageToPC(oPossessor, "Hit"); //Debug
	   SendMessageToPC(oPossessor, IntToString(nCastSummon));//Debug
	   
	   if(nCastSummon==1)	
	   {
	   	ActionCastSpellAtLocation(SPELL_SUMMON_CREATURE_I, GetLocation(oPossessor), METAMAGIC_NONE, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
	  	}		
}			  		  