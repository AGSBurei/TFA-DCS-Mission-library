-- setup red IADS
blueIADS = SkynetIADS:create('IADS BLUE')
blueIADS:addSAMSitesByPrefix('SAM')
blueIADS:addEarlyWarningRadarsByPrefix('EW')
blueIADS:activate()
blueIADS:addRadioMenu()


--debug red IADS
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

--RED SAM LIST
blueIADS:getSAMSitesByPrefix('SAM-SA-2'):setGoLiveRangeInPercent(70):setHARMDetectionChance(50)
blueIADS:getSAMSitesByPrefix('SAM-SA-20A'):setGoLiveRangeInPercent(65):setHARMDetectionChance(90)
blueIADS:getSAMSitesByPrefix('SAM-SA-9'):setGoLiveRangeInPercent(100):setHARMDetectionChance(50)
blueIADS:getSAMSitesByPrefix('SAM-SA-8'):setGoLiveRangeInPercent(100):setHARMDetectionChance(75)

--declaration of point defence by GroupName
local SA15PD = blueIADS:getSAMSiteByGroupName('SAM-SA-15-PD-SA-20A-RED-SOUTH')
--set point defence to SAMSiteGroupe by name
blueIADS:getSAMSiteByGroupName('SAM-SA-20A-RED-SOUTH'):addPointDefence(SA15PD):setHARMDetectionChance(100)

local commandCenter = StaticObject.getByName("Static ERO HQ Bunker")
blueIADS:addCommandCenter(commandCenter)


