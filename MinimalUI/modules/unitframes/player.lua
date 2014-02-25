local P, C, L, G = unpack(Tukui)
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local self = _G["TukuiPlayer"]
local font = C.media.pixelfont
local fsize = C.media.pfontsize

self.panel:Kill()
self.shadow:Kill()
self.FlashInfo:Kill()

self:SetBackdrop(nil)
self:SetBackdropColor(0, 0, 0)

------------------------------------------------------------------------
-- Setup Player Frames
------------------------------------------------------------------------

local Line1 = CreateFrame("Frame", "UFLine1", self)
Line1:SetHeight(1)
Line1:SetWidth(367)
Line1:Point("TOP", self.Health, "BOTTOM", 94, -3)
Line1:SetTemplate("Default")
Line1:SetFrameLevel(5)
Line1:SetFrameStrata("LOW")

local Line2 = CreateFrame("Frame", "UFLine2", self)
Line2:SetHeight(17)
Line2:SetWidth(1)
Line2:Point("LEFT", self.Health, "RIGHT", 3, -2)
Line2:SetTemplate("Default")
Line2:SetFrameLevel(5)
Line2:SetFrameStrata("LOW")

self:SetWidth(180)

self.Health:SetHeight(13)
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

self.Health.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
self.Health.value:Point("RIGHT", self.Health, "RIGHT", -2, 1)
self.Health.value:SetShadowOffset(0, 0)

self.Power:ClearAllPoints()
self.Power:SetBorder(false, true)
self.Power:Point("LEFT", self.Health, "RIGHT", 7, 0)
self.Power:SetHeight(13)
self.Power:SetWidth(180)

self.Power.bg:SetVertexColor(.12, .12, .12, .4)
self.Power.bg:SetTexture(C.media.normTex)

self.Power.colorClass = false
self.Power.colorReaction = false

self.Power.value = P.SetFontString( self.Health, font, fsize, "MONOCHROMEOUTLINE")
self.Power.value:Point("LEFT", self.Power, "LEFT", 2, 1)
self.Power.value:SetShadowOffset(0, 0)

self.Castbar:ClearAllPoints()
self.Castbar:SetSize(UFLine1:GetWidth(), 18)
self.Castbar:SetPoint("BOTTOM", UFLine2, "TOP", 0, 8)
self.Castbar.bg:SetVertexColor(.12, .12, .12, .5)
self.Castbar:SetBorder(false, true)

self.Castbar.Time = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 1)

self.Castbar.Text = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 1)

self.Combat:ClearAllPoints()
self.Combat:Point("CENTER", self.Health, "CENTER", 0, 0)

-- experience bar on player via mouseover for player currently leveling a character
if P.level ~= MAX_PLAYER_LEVEL then
   	self.Experience:ClearAllPoints()
	self.Experience:SetStatusBarColor( 0, 0.4, 1, 0.8 )

	self.Experience:Size(4, 139.5)
	self.Experience:Point("LEFT", TukuiMinimap, "RIGHT", 3, 0)
	self.Experience:SetFrameLevel(3)
	self.Experience:SetAlpha(1)
	self.Experience:SetOrientation('VERTICAL')
	self.Experience:HideInsets()
	self.Experience:SetBorder(false, true)

	self.Experience:SetBackdropColor(.12, .12, .12, .7)

	self.Experience:HookScript("OnLeave", function(self) self:SetAlpha(1) end)

	self.Resting:SetTexture(nil)
end

-- reputation bar for max level character
if P.level == MAX_PLAYER_LEVEL then
   self.Reputation:ClearAllPoints()

	self.Reputation:Size(4, 139.5)
	self.Reputation:Point("LEFT", TukuiMinimap, "RIGHT", 3, 0)
	self.Reputation:SetFrameLevel(3)
	self.Reputation:SetAlpha(1)
	self.Reputation:SetOrientation('VERTICAL')
	self.Reputation:HideInsets()
	self.Reputation:SetBorder(false, true)

	self.Reputation:SetBackdropColor(.12, .12, .12, .7)

	self.Reputation:SetScript("OnLeave", function(self) self:SetAlpha(1) end)
end
