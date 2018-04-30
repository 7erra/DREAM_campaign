params ["_unit","_anim"];
{_unit disableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
_unit playMoveNow _anim;
_animEH = _unit addEventHandler [
	"AnimDone",
	{
		if (_this select 1 == _anim) then {
			_unit removeEventHandler ["AnimDone", _unit getVariable "TER_animEH"];
			{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
		};
	}
];
_unit setVariable ["TER_animEH", _animEH];