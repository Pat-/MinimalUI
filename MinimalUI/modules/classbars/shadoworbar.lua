local P, C, L, G = unpack(Tukui)
if P.myclass ~= "PRIEST" or C.unitframes.classbar ~= true then return end

self = _G["TukuiPlayer"]

self.ShadowOrbsBar:ClearAllPoints()
self.ShadowOrbsBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 4, -1)
self.ShadowOrbsBar:Size(131, 3)
self.ShadowOrbsBar:SetFrameLevel(20)

for i = 1, 3 do
	self.ShadowOrbsBar[i]:Size((130 / 3), 3)
	
	if (i == 1) then
		self.ShadowOrbsBar[i]:SetPoint("LEFT", self.ShadowOrbsBar, "LEFT", 0, 0)
	else
		self.ShadowOrbsBar[i]:SetPoint("LEFT", self.ShadowOrbsBar[i - 1], "RIGHT", 1, 0)
	end
end