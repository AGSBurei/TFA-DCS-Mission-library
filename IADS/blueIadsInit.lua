-- setup red IADS
redIADS = SkynetIADS:create('IADS South')
redIADS:addSAMSitesByPrefix('SAM')
redIADS:addEarlyWarningRadarsByPrefix('EW')
redIADS:activate()
redIADS:addRadioMenu()


--debug red IADS
local iadsDebug = redIADS:getDebugSettings()
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
redIADS:getSAMSitesByPrefix('SAM-SA-2'):setGoLiveRangeInPercent(70):setHARMDetectionChance(50)
redIADS:getSAMSitesByPrefix('SAM-SA-20A'):setGoLiveRangeInPercent(65):setHARMDetectionChance(90)
redIADS:getSAMSitesByPrefix('SAM-SA-9'):setGoLiveRangeInPercent(100):setHARMDetectionChance(50)
redIADS:getSAMSitesByPrefix('SAM-SA-8'):setGoLiveRangeInPercent(100):setHARMDetectionChance(75)

--declaration of point defence by GroupName
local SA15PD = redIADS:getSAMSiteByGroupName('SAM-SA-15-PD-SA-20A-RED-SOUTH')
--set point defence to SAMSiteGroupe by name
redIADS:getSAMSiteByGroupName('SAM-SA-20A-RED-SOUTH'):addPointDefence(SA15PD):setHARMDetectionChance(100)

local commandCenter = StaticObject.getByName("Static ERO HQ Bunker")
redIADS:addCommandCenter(commandCenter)


