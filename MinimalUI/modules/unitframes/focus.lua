local P, C, L, G = unpack(Tukui)
if C.unitframes.enable ~= true then return end

------------------------------------------------------------------------
--	local variables
------------------------------------------------------------------------
local self = _G["TukuiFocus"]
local font = C.media.pixelfont
local fsize = C.media.pfontsize

------------------------------------------------------------------------
-- Kill things
------------------------------------------------------------------------

self.shadow:Kill()
self.Debuffs:Kill()
self.Castbar.Icon:Kill()
self.Castbar.button:Kill()

self:SetBackdrop(nil)
self:SetBackdropColor(0, 0, 0)

------------------------------------------------------------------------
--	Setup Focus Frame
------------------------------------------------------------------------

self:Size(110, 26)

self.Health:SetHeight(23)
self.Health:SetFrameLevel(5)
self.Health:SetFrameStrata("LOW")
self.Health:CreateBorder()

self.Health.bg:SetTexture(C.media.normTex)
self.Health.bg:SetVertexColor(.6, .2, .2)

self.Health.value:ClearAllPoints()
self.Power:ClearAllPoints()
self.Power.value:ClearAllPoints()
self.Castbar:ClearAllPoints()

self.Name:SetFont(font, fsize, "MONOCHROMEOUTLINE")
self.Name:SetShadowOffset(0, 0)
