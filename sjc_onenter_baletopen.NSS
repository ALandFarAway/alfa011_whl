


void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

DisplayMessageBox(oPC, 1 , "Exit DM Area and wait to be brought back in-game?", "gui_sjc_leavedmarea", "" , TRUE); 

}
