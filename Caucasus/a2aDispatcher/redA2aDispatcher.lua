-- Setup the Detection, using DETECTION_AREAS.
-- First define the SET of GROUPs that are defining the EWR network.
-- Here with prefixes DF CCCP AWACS, DF CCCP EWR.
DetectionSetGroup_red = SET_GROUP:New()
DetectionSetGroup_red:FilterPrefixes( { "RED_EW" } )
DetectionSetGroup_red:FilterStart()

-- Define the DETECTION_AREAS, using the DetectionSetGroup, with a 30km grouping radius.
Detection_red = DETECTION_AREAS:New( DetectionSetGroup_red, 30000 )
-- Now Setup the A2A dispatcher, and initialize it using the Detection object.
A2ADispatcher_red = AI_A2A_DISPATCHER:New( Detection_red )

-- Set 50km as the radius to engage any target by airborne friendlies.
A2ADispatcher_red:SetEngageRadius( 75000 )

-- Set 100km as the radius to ground control intercept detected targets from the nearest airbase.
A2ADispatcher_red:SetGciRadius( 80000 )

-- Set 200km as the radius to ground control intercept.
A2ADispatcher_red:SetGciRadius() -- 200000 is the default value.

--Setup CAP RED
A2ADispatcher_red:SetSquadron( "CAP-MAY", AIRBASE.Caucasus.Maykop_Khanskaya, { "CAP-M2KC" }, 2000 )
A2ADispatcher_red:SetSquadronTakeoffInAir( "CAP-MAY" )
A2ADispatcher_red:SetSquadronLandingAtEngineShutdown( "CAP-MAY" )
 
-- Set a grouping per 2 airplanes.
A2ADispatcher_red:SetSquadronGrouping( "CAP-MAY", 2 )

-- CAP Squadron execution.
CAPMaykop = ZONE_POLYGON:New( "CAP RED MAYKOP", GROUP:FindByName( "CAP RED MAYKOP" ) )
A2ADispatcher_red:SetSquadronCap( "CAP-MAY", CAPMaykop, 9000, 11000, 400, 500, 800, 1200 )
A2ADispatcher_red:SetSquadronCapInterval( "CAP-MAY", 1, 420, 720, 1 )
 
 ---Fuel
A2ADispatcher_red:SetSquadronFuelThreshold( "CAP-MIN", 0.5 )
 
 
 --enable tactical status
A2ADispatcher_red:SetTacticalDisplay(true)
A2ADispatcher_red:Start()
--END MOOSE CODE