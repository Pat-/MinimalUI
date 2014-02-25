local P, C, L, G = unpack(Tukui)

------------------------------------------------------------------------
-- Setting up Panels
------------------------------------------------------------------------

local panels = { TukuiMinimapStatsLeft, TukuiMinimapStatsRight, TukuiInfoLeftLineVertical, TukuiInfoRightLineVertical, TukuiLineToABLeft, TukuiLineToABRight, TukuiCubeLeft, TukuiCubeRight, TukuiLineToABLeftAlt, TukuiLineToABRightAlt, TukuiLineToPetActionBarBackground }

for _, panel in pairs(panels) do
	panel:Kill()
end

------------------------------------------------------------------------
-- Setting up Actionbars
------------------------------------------------------------------------

for i=1,7 do
	local bar = _G["TukuiBar"..i]
	
	bar:SetBackdrop(nil)
	bar:HideInsets()
end

TukuiBar5:ClearAllPoints()
TukuiBar5:Point("BOTTOM", UIParent, "BOTTOM", 0, 68)
TukuiBar5:SetWidth((P.buttonsize * 12) + (P.buttonspacing * 13))
TukuiBar5:SetHeight((P.buttonsize * 1) + (P.buttonspacing * 2))

TukuiPetBar:ClearAllPoints()
TukuiPetBar:Point("RIGHT", UIParent, "RIGHT", -2, -14)
TukuiPetBar:SetTemplate("Transparent")
TukuiPetBar:SetBackdrop(nil)
TukuiPetBar:HideInsets()
TukuiLineToPetActionBarBackground:SetBackdrop(nil)

TukuiBar5ButtonTop:ClearAllPoints()
TukuiBar5ButtonBottom:ClearAllPoints()
TukuiExitVehicleButtonLeft:ClearAllPoints()
TukuiExitVehicleButtonLeft:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -5000)

TukuiExitVehicleButtonRight:Size(19)
TukuiExitVehicleButtonRight:SetBackdrop(nil)
TukuiExitVehicleButtonRight:HideInsets()
TukuiExitVehicleButtonRight:SetBackdropBorderColor(0, 0, 0, 0)
TukuiExitVehicleButtonRight:SetBorder(false, true)
TukuiExitVehicleButtonRight:SetTemplate("Transparent")
TukuiExitVehicleButtonRight:SetFrameLevel(20)
TukuiExitVehicleButtonRight:SetFrameStrata("MEDIUM")

TukuiExitVehicleButtonRight:ClearAllPoints()
TukuiExitVehicleButtonRight:Point("TOPLEFT", TukuiMinimap, "TOPLEFT", 4, -4)
TukuiExitVehicleButtonRight.text:SetText("|cff4BAF4C V|r")

------------------------------------------------------------------------
-- Setting up Actionbar Buttons
------------------------------------------------------------------------

TukuiBar4Button:ClearAllPoints()
TukuiBar5ButtonTop:PatSkin()
TukuiBar5ButtonBottom:PatSkin()

------------------------------------------------------------------------
-- Setting up ChatFrames
------------------------------------------------------------------------

TukuiInfoLeft:ClearAllPoints()
TukuiInfoLeft:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 4, 125)
TukuiInfoLeft:SetBackdrop(nil)
TukuiInfoLeft:HideInsets()

TukuiInfoRight:Hide()

------------------------------------------------------------------------
-- Reanchor the Raid Util
------------------------------------------------------------------------

TukuiRaidUtilityShowButton:ClearAllPoints()
TukuiRaidUtilityShowButton:Point("TOP", TukuiMinimap, "BOTTOM", 0, -4)

------------------------------------------------------------------------
-- DataPoints
------------------------------------------------------------------------

local DataPoint = {}

for i=1, 2 do
	DataPoint[i] = CreateFrame("Frame", "DataPoint"..i, TukuiMinimap)
	DataPoint[i]:Size((TukuiMinimap:GetWidth() - 7) / 2, 20)
	DataPoint[i]:SetBackdrop(nil)
	
	if(i == 1) then
		DataPoint[i]:Point("BOTTOM", TukuiMinimap, "BOTTOM", 0, 2)
	else
		DataPoint[i]:Point("TOP", TukuiMinimap, "TOP", 0, -2)
	end
end
