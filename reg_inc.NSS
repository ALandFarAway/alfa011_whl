// Generic registration routines...
//
//

void Register(object parent, object child, string list_name) {

    // Sanity check

    if (!GetIsObjectValid(parent)) {
        return;
    }

    if (!GetIsObjectValid(child)) {
        return;
    }

    if (list_name == "") {
        return;
    }

    // Work out some derived names

    list_name = list_name + "_";

    string list_count = list_name + "count";

    string list_element = list_name + "element";

    string list_parent = list_name + "parent";

    // Bail if already registered

    if (GetLocalString(child, list_element) != "") {
        return;
    }

    // Add it to the list

    // Update the list count

    int n = GetLocalInt(parent, list_count);

    n = n + 1;

    SetLocalInt(parent, list_count, n);

    // Set it as the newest element

    list_count = list_name + IntToString(n);

    SetLocalObject(parent, list_count, child);

    // Mark as registered (and stash its index into the list)

    SetLocalString(child, list_element, list_count);

    SetLocalObject(child, list_parent, parent);

    // All done...

    return;
}

// Deregister a spawner

void Deregister(object child, string list_name) {

    // Sanity check

    if (!GetIsObjectValid(child)) {
        return;
    }

    if (list_name == "") {
        return;
    }

    // Work out some derived names

    list_name = list_name + "_";

    string list_count = list_name + "count";

    string list_element = list_name + "element";

    string list_parent = list_name + "parent";

    // Bail if not registered

    string reg_entry = GetLocalString(child, list_element);

    if ( reg_entry == "") {
        return;
    }

    // What are we registeed with

    object parent = GetLocalObject(child, list_parent);

    if (!GetIsObjectValid(parent)) {
        DeleteLocalString(child, list_element);
        DeleteLocalObject(child, list_parent);
        return;
    }

    // Get the index

    int n = GetLocalInt(parent, list_count);

    // Bail if not found

    if (n == 0) {
        DeleteLocalString(child, list_element);
        DeleteLocalObject(child, list_parent);
        return;
    }

    // Remember the last entry

    string last_entry = list_name + IntToString(n);

    // Decrement the counter

    n -= 1;

    SetLocalInt(parent, list_count, n);

    // Now, if the entry isn't the last entry, we need to play swapsie

    if (reg_entry != last_entry) {

        // Fetch the last entry

        object temp = GetLocalObject(parent, last_entry);

        // Stash it where the deregistered one was

        SetLocalObject(parent, reg_entry, temp);

        // Make sure it knows where it is

        SetLocalString(temp, list_element, reg_entry);
    }

    // Now we can just trash the last entry

    DeleteLocalObject(parent, last_entry);

    // And make surethe spawner is now deregistered

    DeleteLocalString(child, list_element);
    DeleteLocalObject(child, list_parent);

    // All done...

    return;
}