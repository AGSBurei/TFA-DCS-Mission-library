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

Border_red = ZONE_POLYGON:New( "RED_Border", GROUP:FindByName( "RED_Border" ) )
A2ADispatcher_red:SetBorderZone( Border_red )

A2ADispatcher_red:SetGciRadius(200000)

-- Set 50km as the radius to engage any target by airborne friendlies.
A2ADispatcher_red:SetEngageRadius( 75000 )

--Setup CAP RED
A2ADispatcher_red:SetSquadron( "CAP-MAY", AIRBASE.Caucasus.Maykop_Khanskaya, { "CAP-M2KC" }, 2000 )
A2ADispatcher_red:SetSquadronTakeoffInAir( "CAP-MAY" )
A2ADispatcher_red:SetSquadronLandingAtEngineShutdown( "CAP-MAY" )

A2ADispatcher_red:SetSquadron( "INT-MAY", AIRBASE.Caucasus.Maykop_Khanskaya, { "INT-MIG21" }, 2000 )
A2ADispatcher_red:SetSquadronTakeoffInAir( "INT-MAY" )
A2ADispatcher_red:SetSquadronLandingAtEngineShutdown( "INT-MAY" )
 
-- Set a grouping per 2 airplanes.
A2ADispatcher_red:SetSquadronGrouping( "CAP-MAY", 2 )
A2ADispatcher_red:SetSquadronGrouping( "INT-MAY", 2 )

-- CAP Squadron execution.
CAPMaykop = ZONE_POLYGON:New( "CAP RED MAYKOP", GROUP:FindByName( "CAP RED MAYKOP" ) )
A2ADispatcher_red:SetSquadronCap( "CAP-MAY", CAPMaykop, 9500, 9500, 450, 450, 800, 1200, "BARO" )
A2ADispatcher_red:SetSquadronCapInterval( "CAP-MAY", 1, 300, 300, 1 )
A2ADispatcher_red:SetSquadronCapInterval( "INT-MAY", 2, 30, 600, 1 )

A2ADispatcher_red:SetSquadronGci( "INT-MAY", 900, 1200 )
 
 ---Fuel
A2ADispatcher_red:SetSquadronFuelThreshold( "CAP-MAY", 0.5 )
A2ADispatcher_red:SetSquadronFuelThreshold( "INT-MAY", 0.5 )

--enable tactical status
A2ADispatcher_red:SetTacticalDisplay( true )
A2ADispatcher_red:Start()
--END MOOSE CODE