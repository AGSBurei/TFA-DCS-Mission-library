-- setup red IADS
redIADSminhad = SkynetIADS:create('IADS Minhad')
redIADSminhad:addSAMSitesByPrefix('SAMM')
redIADSminhad:addEarlyWarningRadarsByPrefix('EWM')
redIADSminhad:activate()
redIADSminhad:addRadioMenu()


--RED SAM LIST
redIADSminhad:getSAMSitesByPrefix('SAMM-SA-6'):setGoLiveRangeInPercent(70):setHARMDetectionChance(30)
redIADSminhad:getSAMSitesByPrefix('SAMM-SA-15'):setGoLiveRangeInPercent(80):setHARMDetectionChance(100)
redIADSminhad:getSAMSitesByPrefix('SAMM-SA-8'):setGoLiveRangeInPercent(100):setHARMDetectionChance(50)

--declaration of point defence by GroupName
local SA15PD = redIADSminhad:getSAMSiteByGroupName('SAMM-SA-15PD')
local SA15PD1 = redIADSminhad:getSAMSiteByGroupName('SAMM-SA-15PD-1')
local SA15PD2 = redIADSminhad:getSAMSiteByGroupName('SAMM-SA-15PD-2')
--set point defence to SAMSiteGroupe by name
redIADSminhad:getSAMSiteByGroupName('SAMM-SA-6'):addPointDefence(SA15PD):setHARMDetectionChance(100)
redIADSminhad:getSAMSiteByGroupName('SAMM-SA-6-1'):addPointDefence(SA15PD1):setHARMDetectionChance(100)
redIADSminhad:getSAMSiteByGroupName('SAMM-SA-6-2'):addPointDefence(SA15PD2):setHARMDetectionChance(100)

local commandCenter = StaticObject.getByName("ERO HQ Bunker-Minhad")
redIADSminhad:addCommandCenter(commandCenter)


