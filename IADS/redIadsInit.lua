-- setup red IADS
redIADSminhad = SkynetIADS:create('IADS Minhad')
redIADSminhad:addSAMSitesByPrefix('SAMM')
redIADSminhad:addEarlyWarningRadarsByPrefix('EWM')
redIADSminhad:activate()
--redIADSminhad:addRadioMenu()

--debug red IADS
--local iadsDebug = redIADSminhad:getDebugSettings()
--iadsDebug.IADSStatus = true
--iadsDebug.radarWentDark = true
--iadsDebug.contacts = true
--iadsDebug.radarWentLive = true
--iadsDebug.noWorkingCommmandCenter = true
--iadsDebug.samNoConnection = true
--iadsDebug.jammerProbability = true
--iadsDebug.addedEWRadar = true
--iadsDebug.harmDefence = true
--iadsDebug.samSiteStatusEnvOutput = true
--iadsDebug.earlyWarningRadarStatusEnvOutput = true
--iadsDebug.commandCenterStatusEnvOutput = true

--RED SAM LIST
redIADSminhad:getSAMSitesByPrefix('SAMM-SA-6'):setGoLiveRangeInPercent(70):setHARMDetectionChance(30)
redIADSminhad:getSAMSitesByPrefix('SAMM-SA-15'):setGoLiveRangeInPercent(80):setHARMDetectionChance(100)
redIADSminhad:getSAMSitesByPrefix('SAMM-SA-8'):setGoLiveRangeInPercent(100):setHARMDetectionChance(50)
redIADSminhad:getSAMSitesByPrefix('SAMM-SA-2'):setGoLiveRangeInPercent(100):setHARMDetectionChance(30)

--declaration of point defence by GroupName
local SA15PD = redIADSminhad:getSAMSiteByGroupName('SAMM-SA-15PD')
local SA15PD1 = redIADSminhad:getSAMSiteByGroupName('SAMM-SA-15PD-1')
local SA15PD2 = redIADSminhad:getSAMSiteByGroupName('SAMM-SA-15PD-2')
local SA15PDEWR = redIADSminhad:getSAMSiteByGroupName('SAMM-SA-15PD-EWR')
--set point defence to SAMSiteGroupe by name
redIADSminhad:getSAMSiteByGroupName('SAMM-SA-6'):addPointDefence(SA15PD):setHARMDetectionChance(100)
redIADSminhad:getSAMSiteByGroupName('SAMM-SA-6-1'):addPointDefence(SA15PD1):setHARMDetectionChance(100)
redIADSminhad:getSAMSiteByGroupName('SAMM-SA-6-2'):addPointDefence(SA15PD2):setHARMDetectionChance(100)
redIADSminhad:getSAMSiteByGroupName('EWM'):addPointDefence(SA15PDEWR):setHARMDetectionChance(100)

local commandCenter = StaticObject.getByName("ERO HQ Bunker-Minhad-1")
redIADSminhad:addCommandCenter(commandCenter)
