local P, C, L, G = unpack(Tukui)

TukuiMinimap:ClearAllPoints()
TukuiMinimap:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 4, -4)
TukuiMinimap:HideInsets()
TukuiMinimap:SetBorder(true, false)
TukuiMinimap:SetBackdrop(nil)

-- Zone coordinates on hovering minimap.
TukuiMinimapCoord:SetTemplate("Transparent")
TukuiMinimapCoord:HideInsets()
TukuiMinimapCoord:SetBackdropBorderColor(0, 0, 0, 0)
TukuiMinimapCoord:SetBackdrop(nil)
TukuiMinimapCoord:ClearAllPoints()
TukuiMinimapCoord:SetPoint("BOTTOMLEFT", TukuiMinimap, "BOTTOMLEFT", -2, 2)
TukuiMinimapCoordText:SetFont(C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")

-- Zone text when hovering minimap.
TukuiMinimapZone:SetTemplate("Transparent")
TukuiMinimapZone:HideInsets()
TukuiMinimapZone:SetBackdropBorderColor(0, 0, 0, 0)
TukuiMinimapZone:SetBackdrop(nil)
TukuiMinimapZone:ClearAllPoints()
TukuiMinimapZone.Text:Point("TOP", TukuiMinimap, "TOP", 0, -20)
TukuiMinimapZoneText:SetFont(C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE") -- So sexeh.

-- Skin the ticket panel.
TukuiTicket:SetTemplate("Transparent")
TukuiTicket:Size(23)
TukuiTicket.Text:SetText(P.RGBToHex(unpack(C.media.datatextcolor2)).."T")
TukuiTicket.Text:SetFont(C.media.pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
TukuiTicket:ClearAllPoints()
TukuiTicket:SetPoint("BOTTOMLEFT", TukuiMinimap, "BOTTOMLEFT", 2, 2)

TukuiAurasPlayerBuffs:ClearAllPoints()
TukuiAurasPlayerDebuffs:ClearAllPoints()

TukuiAurasPlayerBuffs:SetAttribute("wrapAfter", 17)
TukuiAurasPlayerBuffs:SetAttribute("xOffset", -33)
TukuiAurasPlayerBuffs:SetAttribute("wrapYOffset", -42)

TukuiAurasPlayerBuffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT",  -2, -2)
TukuiAurasPlayerDebuffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -2, -118)
