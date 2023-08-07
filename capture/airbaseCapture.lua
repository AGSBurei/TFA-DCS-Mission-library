  -- Define a new ZONE object, which is based on the trigger zone `CaptureZone`, which is defined within the mission editor.
  CaptureZone = ZONE:New( "CaptureZone" )

  -- Here we create a new ZONE_CAPTURE_COALITION object, using the :New constructor.
  ZoneCaptureCoalition = ZONE_CAPTURE_COALITION:New( CaptureZone, coalition.side.RED )

  -- Set the zone to Guarding state.
  ZoneCaptureCoalition:__Guard( 1 )

  -- Start the zone monitoring process in 30 seconds and check every 30 seconds.
  ZoneCaptureCoalition:Start( 30, 30 ) 

  --- @param Functional.ZoneCaptureCoalition#ZONE_CAPTURE_COALITION self
function ZoneCaptureCoalition:OnEnterGuarded( From, Event, To )
  if From ~= "Empty" then
    -- Display a message
  end
end