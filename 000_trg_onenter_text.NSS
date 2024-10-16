// Set this on the onenter of the trigger 
// set   message= " what you want the message to be " in the variable of the trigger


void main()
{    
    object oPC = GetEnteringObject();
    object oTrigger = OBJECT_SELF;
    
    string sMessage = GetLocalString(oTrigger, "message");
    SendMessageToPC(oPC, sMessage);
}