AWACS = UNIT:FindByName( "NAME" )

 function AWACS:OnEventDead( EventData )
   Spawn_AWACS = SPAWN:New( AWACS )
   Spawn_Plane:SpawnAtAirbase( AIRBASE:FindByName( "NAME" ), SPAWN.Takeoff.Cold )
 end