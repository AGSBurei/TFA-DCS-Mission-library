MESSAGE:New( "Spawn", 25 ):ToAll()

AWACS = SPAWN:New( "AWACS" )
 
AWACS:InitKeepUnitNames( true )
AWACS:SpawnAtAirbase( AIRBASE:FindByName( AIRBASE.Caucasus.Kutaisi ), SPAWN.Takeoff.Runway )
