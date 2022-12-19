-- setup red IADS
blueIADS = SkynetIADS:create('IADS Lima')
blueIADS:addSAMSitesByPrefix('BLUE-SAM')
blueIADS:addEarlyWarningRadarsByPrefix('EWB')
blueIADS:activate()
blueIADS:addRadioMenu()

--RED SAM LIST
blueIADS:getSAMSitesByPrefix('BLUE-SAM-Patriot-Lima'):setGoLiveRangeInPercent(80):setHARMDetectionChance(100)
blueIADS:getSAMSitesByPrefix('BLUE-SAM-Hawk'):setGoLiveRangeInPercent(70):setHARMDetectionChance(60)
blueIADS:getSAMSitesByPrefix('BLUE-SAM-PD'):setGoLiveRangeInPercent(100):setHARMDetectionChance(100)

--declaration of point defence by GroupName
--local SA15PD = blueIADS:getSAMSiteByGroupName('SAM-SA-15-PD-SA-20A-RED-SOUTH')
--set point defence to SAMSiteGroupe by name
--blueIADS:getSAMSiteByGroupName('SAM-SA-20A-RED-SOUTH'):addPointDefence(SA15PD):setHARMDetectionChance(100)

local commandCenter = StaticObject.getByName("ERO HQ Bunker-LIMA")
blueIADS:addCommandCenter(commandCenter)


