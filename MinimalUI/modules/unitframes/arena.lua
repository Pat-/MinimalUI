local P, C, L, G = unpack(Tukui)
------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------

local font = C.media.pixelfont
local fsize = C.media.pfontsize

------------------------------------------------------------------------
-- Setup Arena Frames
------------------------------------------------------------------------

for i = 1, 5 do
	local self = _G["TukuiArena"..i]
	self:SetBackdrop(nil)
	self:SetBackdropColor(0, 0, 0)
	self.shadow:Kill()
	
	self:Width(215)
	
	self.Health:Height(15)
	self.Health:SetBorder(false, true)

	self.Health.bg:SetTexture(C.media.normTex)
	self.Health.bg:SetVertexColor(.6, .2, .2, .8)

	self.Power:Size(95, 4)
	self.Power:ClearAllPoints()
	self.Power:Point("TOPLEFT", self.Health, "BOTTOMLEFT", 6, 0)
	self.Power:SetBorder(false, true)
	self.Power:SetFrameLevel(10)
	self.Power:SetFrameStrata("HIGH")
	
	self.Power.bg:SetVertexColor(.12, .12, .12, .5)
	self.Power.bg:SetTexture(C.media.normTex)
	
	self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
	self.Name:SetPoint("TOP", self.Health, "TOP", 0, 0)
	self.Name:SetShadowOffset(0, 0)
	
	self.Health.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
	self.Health.value:Point("RIGHT", self.Health, "RIGHT", -4, 1)

	self.Power.value = P.SetFontString(self.Health, font, fsize, "MONOCHROMEOUTLINE")
	self.Power.value:Point("LEFT", self.Health, "LEFT", 4, 1)
	
	self.Castbar:ClearAllPoints()
	self.Castbar:SetSize(215, 18)
	self.Castbar:SetPoint("BOTTOM", self.Health, "TOP", 0, 5)
	self.Castbar:SetBorder(false, true)

	self.Castbar.button:Kill()
	
	self.Castbar.Time = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
	self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 0)

	self.Castbar.Text = P.SetFontString(self.Castbar, font, fsize, "MONOCHROMEOUTLINE")
	self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 0)
	
	self.Debuffs:SetAlpha(0)
	
	if i == 1 then
		_G["TukuiArena"..i]:SetPoint("RIGHT", UIParent, "RIGHT", -200, 0)
	else
		_G["TukuiArena"..i]:SetPoint("BOTTOM", "TukuiArena"..i - 1, "TOP", 0, 35)             
	end
end