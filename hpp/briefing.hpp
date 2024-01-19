player createDiarySubject ["About", "About"];

player createDiaryRecord 
["Diary", ["About", 
	"
		Tour of Teamrespawn
		<br />
		<br />
		Mission Design: Mr.Ben 2023
		<br />
		<br />
		This is a remake of the original mission made for Arma 2.
		<br />
		<br />
		Thanks to all Tour members for testing and feedback.
		<br />
	"
]];

// give information about the actual mission itself, such as any unique mechanisms to the missions, and how to abort and complete the mission.
player createDiaryRecord 
["Diary", ["Mission & Mechanics", 
	"
		You can access the support menu using a PRC148, available to group leaders only.
		<br />
		<br />
		If HALO start is selected - walk out of the back of the C130 to begin your HALO jump. You will need to manually open the chute around 100-150m above ground level. Your watch will indicate height above sea level, so be sure to use the reading with care in relation to your landing zones elevation from the map data. Once you land, drop the parachute from your inventory and add the backpack using the ACE self interaction to switch your equipment backpack from your front to your back. You can then access its inventory... AND WALK NORMALLY!
		<br />
		<br />
		If SEA start is selected - you will begin in subs. There will be an option using ACE interaction on the sub you start in to swap over your gear.
		<br />
		<br />
		The more the stealthy approach to the mission, the less reinforcements and resistance you will encounter. The ultimate goal is to fuel up the plane and leave, but achieving all the objectives will give a far greater chance of success.
		<br />
		<br />
		A notepad has been given for you to use. Meeting the defector will give you invaluable information to help you succeed. Be sure to write it down!
		<br />
		<br />
		The mission can be ended at any point by escaping to the fishing boat to the north. Once all the remaining team is there, the mission will end.
		<br />
		<br />
		The respawn position is <marker name=""respawn_east"">the southern tip of Utes</marker>.
	"
]];

// give any information about assets here, do you have vehicles, which ones are available, how many, support systems such as medical facilities, artillery etc.
player createDiaryRecord 
["Diary", ["Assets", 
	"
		<font size='20' align='center' color='#0080ff'>Artillery</font>
		<br />
		<br />
		 Smokes can be called via the support menu providing you have a PRC148 radio. You can also call THREE laser guided artillery, however you will need a JTAC backpack with a laser marker.
		 <br />
		<br />
		<font size='20' align='center' color='#0080ff'>Weapons</font>
		<br />
		<br />
		 You have only what you bring with you. Remember, when you land to drop your parachute and move your backpack from your front to your back.
	"
]];

// Add information for settings required for radio channels
player createDiaryRecord 
["Diary", ["Radio Channels", 
	"
		<font size='20' align='center' color='#0080ff'>Default Radio Channels</font>
		<br />
		<br />	
		<font size='16' color='#ffa500'>Red Wolf Actual:</font> PRC343 - Channel 5
		<br />
		<br />	
		<font size='16' color='#ffa500'>Red Wolf One:</font> PRC343 - Channel 1
		<br />
		<br />
		<font size='16' color='#ffa500'>Red Wolf Two:</font> PRC343 - Channel 2
		<br />
		<br />
		<font size='16' color='#ffa500'>Red Wolf Three:</font> PRC343 - Channel 3
		<br />
		<br />
		<font size='16' color='#ffa500'>Red Wolf Four:</font> PRC343 - Channel 4
		<br />
		<br />
		Long range intersquad communications PRC148 set to channel 1
	"
]];

// give all callsign details of groups, including AI support units if used
player createDiaryRecord 
["Diary", ["Callsigns", 
	"
		<font size='20' align='center' color='#0080ff'>Spetsnaz</font>
		<br />
		<br />	
		<font size='16' color='#ffa500'>Red Wolf Actual:</font> Mission Lead
		<br />
		<br />	
		<font size='16' color='#ffa500'>Red Wolf One:</font> Special Forces Team
		<br />
		<br />
		<font size='16' color='#ffa500'>Red Wolf Two:</font> Special Forces Team
		<br />
		<br />	
		<font size='16' color='#ffa500'>Red Wolf Three:</font> Special Forces Team
		<br />
		<br />	
		<font size='16' color='#ffa500'>Red Wolf Four:</font> Special Forces Team
		<br />
		<br />		
		<font size='20' align='center' color='#0080ff'>Support</font>
		<br />
		<br />	
		<font size='16' color='#ffa500'>Drakon:</font> Artillery
		<br />
		<br />	
	"
]];

_text = switch (TOUR_start) do 
{
	case 0: 	{
					"
					<font size='20' align='center' color='#0080ff'>Infilration</font>
					<br />
					<br />
					You will enter the AO via HALO jump from a stolen C130 <marker name=""TOUR_mkr_start"">south of Utes</marker>, around 10,000m above sea level. Be careful where you land, there are numerous patrols and mine fields!
					<br />
					"
				};
	case 1: 	{
					"
					<font size='20' align='center' color='#0080ff'>Infilration</font>
					<br />
					<br />
					You will start in subs to the <marker name=""TOUR_mkr_start"">south of Utes</marker>. Be careful where you make land, there are numerous patrols and mine fields! Watch out for patrol boats.
					<br />
					"
				};
	case 2: 	{
					"
					<font size='20' align='center' color='#0080ff'>Infilration</font>
					<br />
					<br />
					You will be dropped off on the <marker name=""TOUR_mkr_start"">southern tip of Utes</marker>. Though your entry to the island is safe, don't wait around. Patrols are covering every inch of the island!
					<br />
					"
				};
};

player createDiaryRecord 
["Diary", ["Infil", 
	_text
]];

// sumarries the mission details, for background info for immersion, any intel on enemy etc. Keep it to the point and spaced out, nobody likes a wall of text!!!
player createDiaryRecord 
["Diary", ["Briefing", 
	"
		<font size='20' align='center' color='#0080ff'>Overview</font>
		<br />
		<br />
		The US are close to completing a new stealth fighter prototype. We cannot let our enemy gain the up hand. We must steal the plane in order to learn its technology. The current prototype is being field tested from the island of <marker name=""TOUR_mkr_base"">Utes</marker>. Now that the plane is operational, we have a chance to fly it out of there.
		 <br />
		 <br />
		As such, your special forces unit has been tasked with stealing the plane. This may be a one way trip. Access codes to the hanger and further information can be gained from our source on the island who is defecting.
		<br />
		<br />
		<font size='20' align='center' color='#0080ff'>Intel</font>
		<br />
		<br />
		US marines are stationed on the island, and now that the plane is operational, the <marker name=""TOUR_mkr_carrier"">USS Khe Sanh</marker> has arrived to transport it back to the US. This means that support is close by for the airbase, and military presence on the island is much greater than usual. They are already in a state of high alert.
		<br />
		<br />	 
		The islands parimeter is patrolled by boats. In addition to miltary vehicles and armoured personnel carriers, the island is swarming with USMC patrols. There are also reports of freshly laid mine fields dotted all across the island. Be sure to watch your step!
		<br />
		<br />
		We are struggling to get in touch with our contact on the island. With increased surveillence, we believe he is running scared and has gone to ground. You will have to search for him in the <marker name=""TOUR_mkr_meet"">town</marker>. The assets name is Professor Richard Johnson.
		<br />
		<br />
		AA turrets are located across the island. Satellite imagery has given us the locations <marker name=""TOUR_mkr_AA_1"">here</marker>, <marker name=""TOUR_mkr_AA_2"">here</marker> and <marker name=""TOUR_mkr_AA_3"">here</marker>. Disabling these should make for a clean getaway. Avoid the <marker name=""TOUR_mkr_carrier"">USS Khe Sanh</marker> at all costs, she is outfitted with a full anti-air suite.
		<br />
		<br />
		The island is in communication with the nearby fleet using <marker name=""TOUR_mkr_objComms"">this tower</marker>. Disabling this should prevent or delay distress calls to the <marker name=""TOUR_mkr_carrier"">nearby carrier fleet</marker>
		<br />
		<br />
		An <marker name=""TOUR_mkr_radar"">advanced radar unit</marker> has been deployed on the island. Disabling this should prevent it being tracked and intercepted by enemy fighters.
		<br />
		<br />
		<font size='20' align='center' color='#0080ff'>Execution</font>
		<br />
		<br />
		Infiltrate the island and find <marker name=""TOUR_mkr_meet"">Black Spider</marker> to get the access codes and any other information you can to help with the theft of the prototype. Carry out any sabotage you can in order to increase the chances of success for the mission.
		<br />
		<br />
		Make sure the plane is fully fueled before flying, by stealing a refueling truck from the <marker name=""TOUR_mkr_fuel"">supply depot</marker>.
		<br />
		<br />
		The pilot must survive and fly the plane back to refueling plane <marker name=""TOUR_mkr_return"">to the south east</marker>, so it can travel back to mother Russia.
		<br />
		<br />
		Should you fail, you can attempt to make an escape using a <marker name=""TOUR_mkr_exfil"">local fishing boat</marker>, moored off the coast.
		<br />
		<br />
		<font size='20' align='center' color='#0080ff'>Support</font>
		<br />
		<br />
		A submarine is in the are and can off limited artillery support, with smoke and some precision laser guided artillery strikes.
		<br />
	"
]];

