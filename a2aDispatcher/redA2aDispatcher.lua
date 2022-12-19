-- Setup the Detection, using DETECTION_AREAS.
-- First define the SET of GROUPs that are defining the EWR network.
-- Here with prefixes DF CCCP AWACS, DF CCCP EWR.
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( { "EWR-RED" } )
DetectionSetGroup:FilterStart()

-- Define the DETECTION_AREAS, using the DetectionSetGroup, with a 30km grouping radius.
Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )

-- Now Setup the A2A dispatcher, and initialize it using the Detection object.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )
  
-- Set 50km as the radius to engage any target by airborne friendlies.
A2ADispatcher:SetEngageRadius( 50000 )

-- Set 100km as the radius to engage any target by airborne friendlies.
A2ADispatcher:SetEngageRadius() -- 100000 is the default value.

-- Now Setup the A2A dispatcher, and initialize it using the Detection object.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )

-- Set 100km as the radius to ground control intercept detected targets from the nearest airbase.
A2ADispatcher:SetGciRadius( 100000 )

-- Set 200km as the radius to ground control intercept.
A2ADispatcher:SetGciRadius() -- 200000 is the default value.

--Setup CAP RED
A2ADispatcher:SetSquadron( "CAP-South", AIRBASE.Caucasus.Sukhumi_Babushara, { "CAP-***-MIG29","CAP-***-MIG23","CAP-***-MIG21","CAP-***-MIG25","CAP-***-SU27","CAP-***-SU30","CAP-***-MIG31" }, 2000 )
A2ADispatcher:SetSquadronTakeoffInAir( "CAP-South" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "CAP-South" )
 
A2ADispatcher:SetSquadron( "CAP Helo", AIRBASE.Caucasus.Senaki_Kolkhi, { "CAP-***-mi24","CAP-***-ka50" }, 2000 )
A2ADispatcher:SetSquadronTakeoffInAir( "CAP Helo" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "CAP Helo" )
 
-- Set a grouping per 2 airplanes.
A2ADispatcher:SetSquadronGrouping( "CAP-South", 2 )
A2ADispatcher:SetSquadronGrouping( "CAP Helo", 2 )

-- CAP Squadron execution.
CAPZoneEast = ZONE_POLYGON:New( "CAP Zone East", GROUP:FindByName( "CAP Zone East" ) )
CAPZoneEast = ZONE_POLYGON:New( "CAP Helo", GROUP:FindByName( "CAP Helo" ) )
A2ADispatcher:SetSquadronCap( "CAP Helo", CAPZoneEast, 300, 300, 220, 220, 220, 220 )
A2ADispatcher:SetSquadronCapInterval( "CAP Helo", 0, 500, 800, 1 )
A2ADispatcher:SetSquadronCap( "CAP-South", CAPZoneEast, 9000, 11000, 500, 600, 800, 1200 )
A2ADispatcher:SetSquadronCapInterval( "CAP-South", 1, 1500, 1800, 1 )
 
 ---Fuel
A2ADispatcher:SetSquadronFuelThreshold( "CAP-South", 0.5 )
A2ADispatcher:SetSquadronFuelThreshold( "CAP Helo", 0.5 )
 
 
 --enable tactical status
A2ADispatcher:SetTacticalDisplay(true)
A2ADispatcher:Start()
--END MOOSE CODE