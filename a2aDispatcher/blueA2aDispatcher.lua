-- Setup the Detection, using DETECTION_AREAS.
-- First define the SET of GROUPs that are defining the EWR network.
-- Here with prefixes DF CCCP AWACS, DF CCCP EWR.
DetectionSetGroup_blue = SET_GROUP:New()
DetectionSetGroup_blue:FilterPrefixes( { "EWB" } )
DetectionSetGroup_blue:FilterStart()


-- Define the DETECTION_AREAS, using the DetectionSetGroup, with a 30km grouping radius.
Detection_blue = DETECTION_AREAS:New( DetectionSetGroup_blue, 30000 )

-- Now Setup the A2A dispatcher, and initialize it using the Detection object.
A2ADispatcher_blue = AI_A2A_DISPATCHER:New( Detection_blue )
  
-- Set 50km as the radius to engage any target by airborne friendlies.
A2ADispatcher_blue:SetEngageRadius( 50000 )

-- Set 100km as the radius to ground control intercept detected targets from the nearest airbase.
A2ADispatcher_blue:SetGciRadius( 100000 )

-- Set 200km as the radius to ground control intercept.
A2ADispatcher_blue:SetGciRadius() -- 200000 is the default value.

--Setup CAP Blue
A2ADispatcher_blue:SetSquadron( "CAP-LIWA", AIRBASE.PersianGulf.Liwa_Airbase, { "CAP-***-F18","CAP-***-F15" }, 2000 )
A2ADispatcher_blue:SetSquadronTakeoffInAir( "CAP-LIWA" )
A2ADispatcher_blue:SetSquadronLandingAtEngineShutdown( "CAP-LIWA" )
 
--A2ADispatcher_blue:SetSquadron( "CAP-ALAIN", AIRBASE.PersianGulf.Fujairah_Intl, { "CAP-F-14","CAP-JF-17","CAP-MIG21","CAP-F-4","CAP-M2KC","CAP-MIG-29","CAP-MF1","CAP-SU30","CAP-SU27","CAP-F5","CAP-M2K5" }, 2000 )
--A2ADispatcher_blue:SetSquadronTakeoffInAir( "CAP-ALAIN" )
--A2ADispatcher_blue:SetSquadronLandingAtEngineShutdown( "CAP-ALAIN" )
 
-- Set a grouping per 2 airplanes.
A2ADispatcher_blue:SetSquadronGrouping( "CAP-LIWA", 2 )
--A2ADispatcher_blue:SetSquadronGrouping( "CAP-ALAIN", 2 )

-- CAP Squadron execution.
CAPliwa = ZONE_POLYGON:New( "CAP BLUE LIWA", GROUP:FindByName( "CAP BLUE LIWA" ) )
--CAPalain = ZONE_POLYGON:New( "CAP RED AL AIN", GROUP:FindByName( "CAP RED AL AIN" ) )
--A2ADispatcher_blue:SetSquadronCap( "CAP-ALAIN", CAPalain, 9000, 11000, 400, 500, 800, 1200 )
--A2ADispatcher_blue:SetSquadronCapInterval( "CAP-ALAIN", 1, 420, 720, 1 )
A2ADispatcher_blue:SetSquadronCap( "CAP-LIWA", CAPliwa, 9000, 11000, 400, 500, 800, 1200 )
A2ADispatcher_blue:SetSquadronCapInterval( "CAP-LIWA", 1, 420, 720, 1 )
 
 ---Fuel
A2ADispatcher_blue:SetSquadronFuelThreshold( "CAP-LIWA", 0.5 )
--A2ADispatcher_blue:SetSquadronFuelThreshold( "CAP-ALAIN", 0.5 )
 
 
 --enable tactical status
A2ADispatcher_blue:SetTacticalDisplay(true)
A2ADispatcher_blue:Start()
--END MOOSE CODE