void main() 

{
object oEntering = GetEnteringObject();
//if (!GetIsPC(oEntering)) return;
object oDestinationArea = GetObjectByTag("x03");
location lOldLocation = GetLocation(oEntering);
float fFacing = GetFacingFromLocation(lOldLocation);
float fNewX = 85.0; 
vector vOldPosition = GetPosition(oEntering); 
vector vNewPosition = Vector(fNewX, vOldPosition.y, vOldPosition.z); 
location lNewLocation = Location(oDestinationArea, vNewPosition, fFacing);
FloatingTextStringOnCreature("Heading East", oEntering, FALSE, 5.0);
AssignCommand(oEntering, ClearAllActions());
AssignCommand(oEntering, ActionJumpToLocation(lNewLocation));
}