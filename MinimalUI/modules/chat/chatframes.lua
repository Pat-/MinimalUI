local P, C, L, G = unpack(Tukui)
if C["chat"].enable ~= true then return end

local function Skin(frame)
	local id = frame:GetID()
	local chat = frame:GetName()
	local tab = _G[chat.."Tab"]
	G.Chat[chat] = _G[chat]
	G.Chat[tab] = tab
	
	-- set min height/width to original tukui size
	_G[chat]:SetMinResize(371, 144)
	_G[chat]:SetMinResize(P.InfoLeftRightWidth + 1, 144)
	
	-- recolor the tab
	_G[chat.."TabText"]:SetTextColor(unpack(C.media.datatextcolor2))
	_G[chat.."TabText"]:SetFont(C["media"].pixelfont, C.media.pfontsize, "MONOCHROMEOUTLINE")
	_G[chat.."TabText"].SetTextColor = P.dummy
	_G[chat.."TabText"]:SetShadowOffset(0, 0)
	
	frame.isPatSkinned = true
end

TukuiChat:HookScript("OnEvent", function(self, event, addon)
	if addon == "Blizzard_CombatLog" then
		for i = 1, NUM_CHAT_WINDOWS do
			local frame = _G[format("ChatFrame%s", i)]
			Skin(frame)
		end
	end
end)

local function SkinTempChat()
	local frame = FCF_GetCurrentChatFrame()

	-- do a check if we already did a skinning earlier for this temp chat frame
	if frame.isPatSkinned then return end

	SkinAndPosition(frame)
end
hooksecurefunc("FCF_OpenTemporaryWindow", SkinTempChat)

-- default position of chat
P.SetDefaultChatPosition = function(frame)
	if frame then
		local id = frame:GetID()
		local name = FCF_GetChatWindowInfo(id)
		
		if id == 1 then
			frame:ClearAllPoints()
			frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 4, 4)
		elseif id == 4 and name == LOOT then
			if not frame.isDocked then
				FCF_SetLocked(ChatFrame4, 1)
				FCF_DockFrame(ChatFrame4)
			end
		end
		
		-- lock them if unlocked
		if not frame.isLocked then FCF_SetLocked(frame, 1) end
	end
end
hooksecurefunc("FCF_RestorePositionAndDimensions", P.SetDefaultChatPosition)
