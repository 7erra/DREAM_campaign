// TER_leader2 (Kyriakos Elias)
// Lt Fotini Petridis
#include "..\..\general\scriptComponent.hpp"
TER_leader2 addAction [format ["Talk to %1",name TER_leader2], {_this execFSM "conversation.fsm";},["leader2"],ADDACTION_5M];