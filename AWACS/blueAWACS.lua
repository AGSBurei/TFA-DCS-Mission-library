AWACS = UNIT:FindByName( "EWB-E3" )

Spawn_AWACS = SPAWN:New( AWACS )
Spawn_AWACS:SpawnAtAirbase( AIRBASE:FindByName( "AIRBASE.PersianGulf.Liwa_Airbase" ), SPAWN.Takeoff.Cold )


 function AWACS:OnEventDead( EventData )
   Spawn_AWACS = SPAWN:New( AWACS )
   Spawn_AWACS:SpawnAtAirbase( AIRBASE:FindByName( "AIRBASE.PersianGulf.Liwa_Airbase" ), SPAWN.Takeoff.Cold )
 end
