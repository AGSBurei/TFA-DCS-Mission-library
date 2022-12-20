-- Setup the Detection, using DETECTION_AREAS.
-- First define the SET of GROUPs that are defining the EWR network.
-- Here with prefixes DF CCCP AWACS, DF CCCP EWR.
DetectionSetGroup_red = SET_GROUP:New()
DetectionSetGroup_red:FilterPrefixes( { "EWM" } )
DetectionSetGroup_red:FilterStart()


-- Define the DETECTION_AREAS, using the DetectionSetGroup, with a 30km grouping radius.
Detection_red = DETECTION_AREAS:New( DetectionSetGroup_red, 30000 )

-- Now Setup the A2A dispatcher, and initialize it using the Detection object.
A2ADispatcher_red = AI_A2A_DISPATCHER:New( Detection_red )
  
-- Set 50km as the radius to engage any target by airborne friendlies.
A2ADispatcher_red:SetEngageRadius( 50000 )

-- Set 100km as the radius to ground control intercept detected targets from the nearest airbase.
A2ADispatcher_red:SetGciRadius( 100000 )

-- Set 200km as the radius to ground control intercept.
A2ADispatcher_red:SetGciRadius() -- 200000 is the default value.

--Setup CAP RED
A2ADispatcher_red:SetSquadron( "CAP-MIN", AIRBASE.PersianGulf.Tunb_Island_AFB, { "CAP-F-14","CAP-JF-17","CAP-MIG21","CAP-F-4","CAP-M2KC","CAP-MIG-29","CAP-MF1","CAP-SU30","CAP-SU27","CAP-F5","CAP-M2K5" }, 2000 )
A2ADispatcher_red:SetSquadronTakeoffInAir( "CAP-MIN" )
A2ADispatcher_red:SetSquadronLandingAtEngineShutdown( "CAP-MIN" )
 
A2ADispatcher_red:SetSquadron( "CAP-ALAIN", AIRBASE.PersianGulf.Fujairah_Intl, { "CAP-F-14","CAP-JF-17","CAP-MIG21","CAP-F-4","CAP-M2KC","CAP-MIG-29","CAP-MF1","CAP-SU30","CAP-SU27","CAP-F5","CAP-M2K5" }, 2000 )
A2ADispatcher_red:SetSquadronTakeoffInAir( "CAP-ALAIN" )
A2ADispatcher_red:SetSquadronLandingAtEngineShutdown( "CAP-ALAIN" )
 
-- Set a grouping per 2 airplanes.
A2ADispatcher_red:SetSquadronGrouping( "CAP-MIN", 2 )
A2ADispatcher_red:SetSquadronGrouping( "CAP-ALAIN", 2 )

-- CAP Squadron execution.
CAPminhad = ZONE_POLYGON:New( "CAP RED MINHAD", GROUP:FindByName( "CAP RED MINHAD" ) )
A2ADispatcher_red:SetSquadronCap( "CAP-MIN", CAPminhad, 9000, 11000, 400, 500, 800, 1200 )
A2ADispatcher_red:SetSquadronCapInterval( "CAP-MIN", 1, 420, 720, 1 )
CAPalain = ZONE_POLYGON:New( "CAP RED AL AIN", GROUP:FindByName( "CAP RED AL AIN" ) )
A2ADispatcher_red:SetSquadronCap( "CAP-ALAIN", CAPalain, 9000, 11000, 400, 500, 800, 1200 )
A2ADispatcher_red:SetSquadronCapInterval( "CAP-ALAIN", 1, 420, 720, 1 )
 
 ---Fuel
A2ADispatcher_red:SetSquadronFuelThreshold( "CAP-MIN", 0.5 )
A2ADispatcher_red:SetSquadronFuelThreshold( "CAP-ALAIN", 0.5 )
 
 
 --enable tactical status
--A2ADispatcher_red:SetTacticalDisplay(true)
--A2ADispatcher_red:Start()
--END MOOSE CODE