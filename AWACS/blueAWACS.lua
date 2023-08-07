MESSAGE:New( "Start", 25 ):ToAll()


local Event = EVENTHANDLER:New()

local action = {
  ["EWB-E3#001-01"] = function (EventData) 
     AWACS = SPAWN:New( "AWACS" )
     AWACS:SpawnAtAirbase( AIRBASE:FindByName( AIRBASE.Caucasus.Kutaisi ), SPAWN.Takeoff.Runway )
  end,
  ["xxx"] = function (EventData) 
     env.info("-end-")
  end,

}


Event:HandleEvent( EVENTS.Crash )

function Event:OnEventCrash( EventData )

 UnitA = UNIT:FindByName(EventData.IniUnitName)
 env.info("----------")
 env.info(UnitA:GetName() .. "hit")
 
 action[UnitA:GetName()](EventData)
 env.info("----------")
 
end




 