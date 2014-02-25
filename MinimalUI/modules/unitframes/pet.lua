local P, C, L, G = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local font = C.media.pixelfont
local fsize = C.media.pfontsize
local self = _G["TukuiPet"]

self.panel:Kill()
self.shadow:Kill()
self.Power:Kill()

self:SetBackdrop(nil)
self:SetBackdropColor(0, 0, 0)

------------------------------------------------------------------------
-- Setup Pet Frames Here
------------------------------------------------------------------------

local Line1 = CreateFrame("Frame", nil, self)
Line1:SetHeight(1)
Line1:SetWidth(120)
Line1:Point("TOP", self.Health, "BOTTOM", 5, -3)
Line1:SetTemplate("Default")
Line1:SetFrameLevel(5)
Line1:SetFrameStrata("LOW")

local Line2 = CreateFrame("Frame", nil, self)
Line2:SetHeight(17)
Line2:SetWidth(1)
Line2:Point("LEFT", self.Health, "RIGHT", 3, -2)
Line2:SetTemplate("Default")
Line2:SetFrameLevel(5)
Line2:SetFrameStrata("LOW")

self:SetSize(110, 13)

self.Health:SetHeight(13)
self.Health:SetFrameLevel(5)
self.Health:SetBorder(false, true)

self.Health.bg:SetTexture(C.media.normTex)
self.Health:SetStatusBarColor(.1, .1, .1, .4)
self.Health.bg:SetVertexColor(.6, .2, .2)

self.Health.bg:ClearAllPoints()
self.Health.bg:SetPoint("LEFT")
self.Health.bg:SetPoint("RIGHT")
self.Health.bg:SetPoint("TOP")
self.Health.bg:SetPoint("BOTTOM")
self.Health.bg:SetPoint("LEFT", self.Health:GetStatusBarTexture(), "RIGHT")

self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
self.Name:SetShadowOffset(0, 0)
self.Name:Point("CENTER", self.Health, "CENTER", 0, 1)

self.Castbar:ClearAllPoints()
self.Castbar.Text:ClearAllPoints()
self.Castbar.Time:ClearAllPoints()
