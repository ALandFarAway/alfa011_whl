
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;
object oSound = GetObjectByTag("sjc_120_snd_faketreasure");
SoundObjectPlay(oSound);

}