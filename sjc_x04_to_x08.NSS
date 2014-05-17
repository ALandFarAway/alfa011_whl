void main() 

{
object oEntering = GetEnteringObject();
//if (!GetIsPC(oEntering)) return;
object oDestinationArea = GetObjectByTag("x08");
location lOldLocation = GetLocation(oEntering);
float fFacing = GetFacingFromLocation(lOldLocation);
float fNewY = 395.0; 
vector vOldPosition = GetPosition(oEntering); 
vector vNewPosition = Vector(vOldPosition.x, fNewY, vOldPosition.z); 
location lNewLocation = Location(oDestinationArea, vNewPosition, fFacing);
FloatingTextStringOnCreature("Heading South", oEntering, FALSE, 5.0);
AssignCommand(oEntering, ClearAllActions());
AssignCommand(oEntering, ActionJumpToLocation(lNewLocation));

        }