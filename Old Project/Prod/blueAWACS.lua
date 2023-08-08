AWACS = UNIT:FindByName( "EWB-E3" )

Spawn_AWACS = SPAWN:New( AWACS )
Spawn_AWACS:SpawnAtAirbase( AIRBASE:FindByName( "AIRBASE.PersianGulf.Liwa_Airbase" ), SPAWN.Takeoff.Cold )

AWACS:HandleEvent( EVENTS.Dead )

 function AWACS:OnEventDead( EventData )
   MessageBLUE = MESSAGE:New( "dead", "Penalty", 25):ToBlue()
   Spawn_AWACS = SPAWN:New( AWACS )
   Spawn_AWACS:SpawnAtAirbase( AIRBASE:FindByName( "AIRBASE.PersianGulf.Liwa_Airbase" ), SPAWN.Takeoff.Cold )
 end
