-- Setup the Detection, using DETECTION_AREAS.
-- First define the SET of GROUPs that are defining the EWR network.
-- Here with prefixes DF CCCP AWACS, DF CCCP EWR.
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( { "EWM" } )
DetectionSetGroup:FilterStart()

-- Define the DETECTION_AREAS, using the DetectionSetGroup, with a 30km grouping radius.
Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )

-- Now Setup the A2A dispatcher, and initialize it using the Detection object.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )
  
-- Set 50km as the radius to engage any target by airborne friendlies.
A2ADispatcher:SetEngageRadius( 30000 )

-- Set 100km as the radius to engage any target by airborne friendlies.
A2ADispatcher:SetEngageRadius() -- 100000 is the default value.

-- Now Setup the A2A dispatcher, and initialize it using the Detection object.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )

-- Set 100km as the radius to ground control intercept detected targets from the nearest airbase.
A2ADispatcher:SetGciRadius( 70000 )

-- Set 200km as the radius to ground control intercept.
A2ADispatcher:SetGciRadius() -- 200000 is the default value.

--Setup CAP RED
A2ADispatcher:SetSquadron( "CAP-MIN", AIRBASE.PersianGulf.Tunb_Island_AFB, { "CAP-F-14","CAP-JF-17","CAP-MIG21","CAP-F-4","CAP-M2KC","CAP-MIG-29","CAP-MF1","CAP-SU30","CAP-SU27","CAP-F5","CAP-M2K5" }, 2000 )
A2ADispatcher:SetSquadronTakeoffInAir( "CAP-MIN" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "CAP-MIN" )
 
A2ADispatcher:SetSquadron( "CAP-ALAIN", AIRBASE.PersianGulf.Fujairah_Intl, { "CAP-F-14","CAP-JF-17","CAP-MIG21","CAP-F-4","CAP-M2KC","CAP-MIG-29","CAP-MF1","CAP-SU30","CAP-SU27","CAP-F5","CAP-M2K5" }, 2000 )
A2ADispatcher:SetSquadronTakeoffInAir( "CAP-ALAIN" )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( "CAP-ALAIN" )
 
-- Set a grouping per 2 airplanes.
A2ADispatcher:SetSquadronGrouping( "CAP-MIN", 2 )
A2ADispatcher:SetSquadronGrouping( "CAP-ALAIN", 2 )

-- CAP Squadron execution.
CAPminhad = ZONE_POLYGON:New( "CAP RED MINHAD", GROUP:FindByName( "CAP RED MINHAD" ) )
A2ADispatcher:SetSquadronCap( "CAP-MIN", CAPminhad, 9000, 11000, 400, 500, 800, 1200 )
A2ADispatcher:SetSquadronCapInterval( "CAP-MIN", 1, 420, 720, 1 )
CAPalain = ZONE_POLYGON:New( "CAP RED AL AIN", GROUP:FindByName( "CAP RED AL AIN" ) )
A2ADispatcher:SetSquadronCap( "CAP-ALAIN", CAPalain, 9000, 11000, 400, 500, 800, 1200 )
A2ADispatcher:SetSquadronCapInterval( "CAP-ALAIN", 1, 420, 720, 1 )
 
 ---Fuel
A2ADispatcher:SetSquadronFuelThreshold( "CAP-MIN", 0.5 )
A2ADispatcher:SetSquadronFuelThreshold( "CAP-ALAIN", 0.5 )
 
 
 --enable tactical status
A2ADispatcher:SetTacticalDisplay(true)
A2ADispatcher:Start()
--END MOOSE CODE