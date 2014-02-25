local P, C, L, G = unpack(Tukui)
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local self = _G["TukuiTarget"]
local font = C.media.pixelfont
local fsize = C.media.pfontsize

self.panel:Kill()
self.shadow:Kill()
self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")

self:SetBackdrop(nil)
self:SetBackdropColor(0, 0, 0)

------------------------------------------------------------------------
-- Setup Target Frames
------------------------------------------------------------------------

local Line1 = CreateFrame("Frame", "UFLine3", self)
Line1:SetHeight(1)
Line1:SetWidth(367)
Line1:Point("BOTTOM", self.Health, "TOP", 94, 3)
Line1:SetTemplate("Default")
Line1:SetFrameLevel(5)
Line1:SetFrameStrata("LOW")

local Line2 = CreateFrame("Frame", "UFLine4", self)
Line2:SetHeight(17)
Line2:SetWidth(1)
Line2:Point("LEFT", self.Health, "RIGHT", 3, 2)
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
self.Health.value:Point("LEFT", self.Health, "LEFT", 2, 1)
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
self.Power.value:Point("RIGHT", self.Power, "RIGHT", -2, 1)
self.Power.value:SetShadowOffset(0, 0)

self:Tag(self.Name, "[Tukui:getnamecolor][Tukui:nameshort][Tukui:diffcolor] [shortclassification]")

self.Castbar:ClearAllPoints()
self.Castbar:SetSize(UFLine1:GetWidth(), 18)
self.Castbar:SetPoint("BOTTOM", UFLine3, "TOP", 0, 35)
self.Castbar.bg:SetVertexColor(.12, .12, .12, .5)
self.Castbar:SetBorder(false, true)
	
self.Castbar.Time = P.SetFontString( self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 1)

self.Castbar.Text = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 1)

-- Thanks to Tukz and FlyingBoots
-- our update (hook) or the original buff/debuffs button creation)
local function PostCreateAura(self, button)
	-- kill the glow
	button.Glow:Kill()

	-- move icon just 1px inside the black inset (it hide 1px borders)
	button:SetBorder(false, true)
	button.icon:Point("TOPLEFT", 0, 0)
	button.icon:Point("BOTTOMRIGHT", 0, 0)

	-- resize the cooldown tex to fix new icon size
	button.cd:Point("TOPLEFT", button, "TOPLEFT", 0, 0)
	button.cd:Point("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 0)

	-- change the font
	button.remaining:SetFont(font, fsize, "MONOCHROMEOUTLINE")
	button.remaining:SetShadowOffset(0, 0)
end
hooksecurefunc(P, "PostCreateAura", PostCreateAura)

-- edited position, size, space, etc of buffs
self.Buffs:SetHeight(23)
self.Buffs:SetWidth(367)
self.Buffs.size = 20
self.Buffs.num = 8
self.Buffs.spacing = 3
self.Buffs.initialAnchor = 'TOPLEFT'
self.Buffs["growth-y"] = "UP"
self.Buffs["growth-x"] = "RIGHT"
self.Buffs:SetPoint("BOTTOMLEFT", UFLine3, "TOPLEFT", 0, 2)
self.Buffs.PostCreateIcon = P.PostCreateAura
self.Buffs.PostUpdateIcon = P.PostUpdateAura

-- edited position, size, space, etc of debuffs
self.Debuffs:SetHeight(25)
self.Debuffs:SetWidth(367)
self.Debuffs.size = 20
self.Debuffs.num = 8
self.Debuffs.spacing = 3
self.Debuffs.initialAnchor = 'TOPRIGHT'
self.Debuffs["growth-y"] = "UP"
self.Debuffs["growth-x"] = "LEFT"
self.Debuffs:SetPoint("BOTTOMRIGHT", UFLine3, "TOPRIGHT", 0, 2)
self.Debuffs.PostCreateIcon = P.PostCreateAura
self.Debuffs.PostUpdateIcon = P.PostUpdateAura

-- because default tukui update regularly the position of buffs/debuffs on this unit
-- we need to disable the position update process
self.Buffs.ClearAllPoints = P.dummy
self.Buffs.SetPoint = P.dummy
