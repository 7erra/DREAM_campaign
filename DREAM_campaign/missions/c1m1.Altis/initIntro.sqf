/* Intro script with camera, run in the intro scenario */
_fncIn = {
	cutText ["","BLACK IN",_sleep];
	_sleep fadeSound 1;
};
_fncOut = {
	cutText ["","BLACK OUT",_sleep];
	_sleep fadeSound 0;
};
_fncSmoothAnim = {
	params ["_unit","_anim"];
	{_unit disableAI _x} forEach ["AUTOTARGET", "FSM", "MOVE", "TARGET","ANIM"];
	_unit playMoveNow _anim;
	_unit setVariable ["TER_animName",_anim];
	_animEH = _unit addEventHandler [
		"AnimDone",
		compile format ["{
			params [""_unit"",""_anim""];
			if (_anim == %1) then {
				_unit removeEventHandler [""AnimDone"", _unit getVariable ""TER_animEH""];
				{_unit enableAI _x} forEach [""ANIM"", ""AUTOTARGET"", ""FSM"", ""MOVE"", ""TARGET""];
			};
		}",_anim]
	];
	_unit setVariable ["TER_animEH", _animEH];
};
_sleep = 3;

// Create camera object
_cam = "camera" camCreate (position player);
_cam cameraEffect ["internal", "BACK"];
_suv = vehicle player;
_dSuv = driver _suv;
_dSuv setBehaviour "CARELESS";
_cam camSetTarget _suv;
playMusic "Track05_Underwater2";
_startPos = getPos _suv;
_cam attachTo [_suv,[0,-20,2]];
enableEnvironment false;
cutText ["","BLACK",0.001];

	// information text intro
	_textFormat = "<t align = 'left' font = 'LucidaConsoleB' size = '0.5'>%1</t><br/>";
	_textHandle = [
		[
			["ALTIS",_textFormat],
			["2035",_textFormat]
		]
	] spawn BIS_fnc_typeText;
	waitUntil {scriptDone _textHandle};
	sleep 1;
	_textHandle = [
		[
			["Scientists unraveled the secrets of the mind.",_textFormat],
			["Most mental disorders are now cureable with a 90% success rate.",_textFormat],
			["Naturally the military took notice too, looking for a way to cure mental disorders caused by traumatic incidents.",_textFormat]
		]
	] spawn BIS_fnc_typeText;
	waitUntil {scriptDone _textHandle};
	sleep 1;
	_textHandle = [
		[
			["You are a hired ""Traumfenger"". Your job is to insert your consciousness into other people's minds. " ,_textFormat],
			["During this so called ""Minddive"" you experience the subject's memories.",_textFormat],
			["This method has been proven to bear no danger for the Traumfenger.",_textFormat]
		]
	] spawn BIS_fnc_typeText;
	waitUntil {scriptDone _textHandle};
	sleep 1;
	_textHandle = [
		[
			["You received a call from Captain Anthis Manago from the AAF this morning." ,_textFormat],
			["He wants you to demonstrate the possibilities of the Minddive by curing one of his lieutenants from PTSD.",_textFormat],
			["More details will be available at the lab......",_textFormat]
		]
	] spawn BIS_fnc_typeText;
	waitUntil {scriptDone _textHandle};

_drivePos = [17511.8,13198.7,0];
driver _suv doMove _drivePos;
0 fadeSound 0;
enableEnvironment true;
sleep 5;

// start screen black out
//playMusic "AmbientTrack02_F_Orange";
playMusic "LeadTrack01_F_EPA";
call _fncIn;
sleep 3;
[parseText "<t font = 'EtelkaMonospacePro'><t size='1.6'>Subject 1</t><br />Michalis Papadopoulos<br />""Shelled""</t>", true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
waitUntil {getPos _suv distance _drivePos <= (_startPos distance _drivePos)/2};

// cam in bunker
detach _cam;
_nextCamPos = [17553.6,13136.4,5.77767];
_cam camSetPos _nextCamPos;
_cam camCommit 0;
waitUntil {getPos _suv distance _drivePos <= 25};
call _fncOut;
sleep 3;

//next cam, checkpoint
_dSuv disableAI "ALL";
_nextPos = [17466.1,13165,-3.43323e-005];
_nextDir = 229.263;
_nextCamPos = [17461,13158.9,1.8];
_suv setPos _nextPos;
_suv setDir _nextDir;
_suv setFuel 0;
_cam camSetPos _nextCamPos;
_cam camCommit 0;
call _fncIn;
sleep 2;
TER_signalCheck disableAI "ANIM";
TER_signalCheck switchmove "Acts_listeningToRadio_In";
sleep 5;
[TER_signalCheck,"Acts_SignalToCheck"] call _fncSmoothAnim;
sleep 2;
_cam camSetRelPos [-0.423828,-0.0117188,0.15094];
_cam camSetTarget TER_checkMan;
_cam camCommit 0;
TER_checkMan setAnimSpeedCoef 0.5;
[TER_checkMan,"AmovPercMwlkSlowWrflDfr"] call _fncSmoothAnim;
sleep 4;
call _fncOut;
sleep 3;

// next cam lab front
unassignVehicle _dSuv;
moveOut _dSuv;

_nextCamPos = [17410.8,13192.4,13.9626];
_nextCamTarget = [17403.2,13229,1.72657];
_cam camSetPos _nextCamPos;
_cam camSetTarget _nextCamTarget;
_cam camCommit 0;
_nextPos = [17409.2,13200.5,0];
_nextDir = 349.456;
_dSuv setPos _nextPos;
_dSuv setDir _nextDir;
TER_checkMan setPos (_dSuv modelToWorld [-1,0.3,0]);
TER_checkMan setDir _nextDir;
TER_checkMan setAnimSpeedCoef 1;

call _fncIn;
_dSuv setAnimSpeedCoef 0.8;
_dSuv playMoveNow "AmovPercMwlkSnonWnonDf";
_dSuv disableAI "ALL";
TER_checkMan disableAI "ALL";
TER_checkMan playMoveNow "AmovPercMwlkSlowWrflDf_v1";

sleep 9;
_nextCamPos = [17403.2,13229,1.72657];
_cam camSetPos _nextCamPos;
_cam camCommit 10;
sleep 9.5;
_sleep = 0.1;
call _fncOut;
2 fadeMusic 0;
sleep 3;
endMission "end1";