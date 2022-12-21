AWACS = UNIT:FindByName( "EWB-E3" )

 function AWACS:OnEventDead( EventData )
   Spawn_AWACS = SPAWN:New( AWACS )
   Spawn_Plane:SpawnAtAirbase( AIRBASE:FindByName( "AIRBASE.PersianGulf.Liwa_Airbase" ), SPAWN.Takeoff.Cold )
 end