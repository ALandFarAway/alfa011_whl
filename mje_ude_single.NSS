//#include "flock_single"

void main()
{

     int eventNum = GetUserDefinedEventNumber();
     int roll = d20(2);
     float random = IntToFloat(roll);
     switch (eventNum)

     {
        case 5001 :
            // run the flocking routine
            ExecuteScript("flock_single", OBJECT_SELF);

            // add another call to myEvent to the action queue.
            // NOTE: we add this to the action queue, to fire
            // once every few seconds
            event myEvent = EventUserDefined(5001);


            DelayCommand(random,
                    ActionDoCommand(SignalEvent(OBJECT_SELF,
                                                myEvent)));
            break;
     }
}
