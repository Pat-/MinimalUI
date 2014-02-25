local P, C, L, G = unpack(Tukui)
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
-- Setup Frame Points
------------------------------------------------------------------------
TukuiPlayer:ClearAllPoints()
TukuiTarget:ClearAllPoints()
TukuiPet:ClearAllPoints()
TukuiTargetTarget:ClearAllPoints()
TukuiFocus:ClearAllPoints()

TukuiPlayer:SetPoint("CENTER", UIParent, "CENTER", -116, -350)
TukuiTarget:SetPoint("BOTTOM", TukuiPlayer, "TOP", 0, -10)

TukuiTargetTarget:SetPoint("LEFT", TukuiTarget, "RIGHT", 194, 22)
TukuiPet:SetPoint("RIGHT", TukuiPlayer, "LEFT", -7, 22)
TukuiFocus:SetPoint("BOTTOM", TukuiPet, "TOP", 0, 15)