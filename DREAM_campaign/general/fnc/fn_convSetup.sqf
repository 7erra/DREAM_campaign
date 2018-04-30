//addaction params
params ["_target","_caller","_id","_arguments"];
_arguments params ["_convID"];
// some vars
_dialogCreated = createDialog "TER_RscConversation";
TER_convNext = false;
_test = compile preprocessFileLineNumbers "fsm\test.sqf";
_fncNext = {
	params [
		["_unit", player],
		["_response",""]
	];
	_txtAINAME ctrlSetText (name _unit);
	if (!isPlayer _unit) then {
		// from player to ai
		_lbCONVOPTIONS ctrlShow false;
		_stxtRESPONSE ctrlShow true;
		_stxtRESPONSE ctrlSetText _response;
		[_stxtRESPONSE, _unit] spawn {
			disableSerialization;
			params ["_stxtRESPONSE", "_unit"];
			_unit setRandomLip true;
			_words = {_x==32} count (toArray ctrlText _stxtRESPONSE);
			sleep (_words/2.5);
			_unit setRandomLip false;
		};
		_prevPos = ctrlPosition _stxtRESPONSE;
		_prevPos set [3,ctrlTextHeight _stxtRESPONSE];
		_newPos = _prevPos;
		_stxtRESPONSE ctrlSetPosition _newPos;
		_stxtRESPONSE ctrlCommit 0;
		_btnSAY ctrlEnable false;
		_btnNEXT ctrlEnable true;
	} else {
		// from ai to player
		lbClear _lbCONVOPTIONS;
		_lbCONVOPTIONS ctrlShow true;
		_stxtRESPONSE ctrlShow false;
		_btnSAY ctrlEnable true;
		_btnNEXT ctrlEnable false;
	};
};