local P, C, L, G = unpack(Tukui)

local bar = TukuiAltPowerBar
local status = TukuiAltPowerBarStatus
local text = TukuiAltPowerBarText

-- Border for the bar
bar:ClearAllPoints()
bar:Point("CENTER", UIParent, "CENTER", 0, 500)
bar:Size(TukuiBar1:GetWidth(), 18)
bar:SetTemplate("Transparent")
bar:SetBorder(false, true)
bar:HideInsets()
bar:SetBackdropBorderColor(0, 0, 0, 0)
bar:SetFrameLevel(status:GetFrameLevel() - 1)

-- position status bar
status:ClearAllPoints()
status:Point("TOPLEFT", bar, "TOPLEFT", 0, 0)
status:Point("BOTTOMRIGHT", bar, "BOTTOMRIGHT", 0, 0)

-- change the font
text:ClearAllPoints()
text:SetFont(C["media"].pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
text:Point("CENTER", status, "CENTER", 0, 0)
text:SetShadowOffset(0, 0)

ExtraActionButton1:ClearAllPoints()
ExtraActionButton1:SetPoint("CENTER", UIParent, "CENTER", 0, 450)
