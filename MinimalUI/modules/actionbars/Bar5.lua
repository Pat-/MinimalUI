local P, C, L, G = unpack(Tukui)

local bar = TukuiBar5
bar:SetAlpha(1)
MultiBarRight:SetParent(bar)

for i= 1, 12 do
	local b = _G["MultiBarRightButton"..i]
	local b2 = _G["MultiBarRightButton"..i-1]
	b:SetSize(P.buttonsize, P.buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if i == 1 then
		b:SetPoint("TOPLEFT", bar, P.buttonspacing, -P.buttonspacing)
	else
		b:SetPoint("LEFT", b2, "RIGHT", P.buttonspacing, 0)
	end
end