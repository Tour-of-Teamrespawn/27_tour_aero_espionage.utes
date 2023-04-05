waituntil {!isnil "BIS_fnc_init"};
waitUntil {player==player};
if (!isDedicated) then
{
	if (isNil "TOUR_IED_scriptranPlayer") then
	{
		execFSM "scripts\TOUR_IED\TOUR_IED_MAIN.fsm";
		player createDiarySubject ["About", "About"]; 
		player createDiaryRecord ["About", ["IED defusal", 

		"<br/>
		Developer: Mr.Ben, modified by Mathias K.
		<br/>
		Version: 2.1
		<br/>
		<br/>Credits: Thanks to all Tour members for testing and feedback.
		<br />
		<br />
		 - There are triggermen who may detonate the IED when you are close to the IED. Killing, or moving them far enough away from the IED will allow you to get close to the IED to defuse it.
		 <br />
		 <br />
		  - Once close and look at the correct part of the IED, you will have an action to examine it, and then defuse it. When ready, click the action and follow the instructions in the dialog. Defusal of an IED can be done by working out a sequence of 8 arrows. If the sequence is wrong, you will have to start again, and remember the progress you had made. Aborting the defusal process (Esc), or running out of time, will likely result in detonation of the IED.
		  <br />
		  <br />
		  - In order to defuse an IED, you MUST have a defusal kit. If you are not an expert, less time will be given for the defusal process.
		  <br /> 
		  <br />
		   - Remember, it is always best to approach an IED prone, to ensure you are stable, and vibrations are at a minimum. Close cars may also trigger IED's to explode due to large vibrations.
		"]];
	};
};

TOUR_IED_scriptranPlayer = true;