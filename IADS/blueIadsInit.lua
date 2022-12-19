-- setup blue IADS
blueIADS = SkynetIADS:create('IADS Lima')
blueIADS:addSAMSitesByPrefix('BLUE-SAM')
blueIADS:addEarlyWarningRadarsByPrefix('EWB')
blueIADS:activate()
blueIADS:addRadioMenu()

--debug blue IADS
local iadsDebug = blueIADS:getDebugSettings()
iadsDebug.IADSStatus = true
iadsDebug.radarWentDark = true
iadsDebug.contacts = true
iadsDebug.radarWentLive = true
iadsDebug.noWorkingCommmandCenter = true
iadsDebug.samNoConnection = true
iadsDebug.jammerProbability = true
iadsDebug.addedEWRadar = true
iadsDebug.harmDefence = true
iadsDebug.samSiteStatusEnvOutput = true
iadsDebug.earlyWarningRadarStatusEnvOutput = true
iadsDebug.commandCenterStatusEnvOutput = true

--BLUE SAM LIST
blueIADS:getSAMSitesByPrefix('BLUE-SAM-Patriot-Lima'):setGoLiveRangeInPercent(80):setHARMDetectionChance(100)
blueIADS:getSAMSitesByPrefix('BLUE-SAM-Hawk'):setGoLiveRangeInPercent(70):setHARMDetectionChance(60)
blueIADS:getSAMSitesByPrefix('BLUE-SAM-PD'):setGoLiveRangeInPercent(100):setHARMDetectionChance(100)

--declaration of point defence by GroupName
--local SA15PD = blueIADS:getSAMSiteByGroupName('SAM-SA-15-PD-SA-20A-RED-SOUTH')
--set point defence to SAMSiteGroupe by name
--blueIADS:getSAMSiteByGroupName('SAM-SA-20A-RED-SOUTH'):addPointDefence(SA15PD):setHARMDetectionChance(100)

local commandCenter = StaticObject.getByName("ERO HQ Bunker-LIMA")
blueIADS:addCommandCenter(commandCenter)
