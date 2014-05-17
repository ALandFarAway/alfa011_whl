#include "acr_spawn_i"

void main() {

SendMessageToPC(GetFirstPC(), "Hi, my name is "+GetName(OBJECT_SELF));

}