// conversation with captain
TER_captain addAction [format ["Talk to %1",name TER_captain],{
	_this execFSM "fsm\conversation.fsm";
},["captain1"]];
TER_finishedDialogs = [];

_addID = TER_headScientist addAction [
	format ["Talk to %1",name TER_headScientist],
	{
		[name TER_headScientist, "You should probably talk to the Captain first."] spawn BIS_fnc_showSubtitle;
	}
];
TER_headScientist setVariable ["TER_addID",_addID];