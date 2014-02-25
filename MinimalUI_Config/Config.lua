local C = {}
if not (select(4, GetAddOnInfo('MinimalUI'))) then return end

C.media = {
	datatextcolor2 = {0, .7, 1},
	pixelfont = [=[Interface\AddOns\MinimalUI\media\fonts\pixelfont.ttf]=],
	ru_pixelfont = [[Interface\AddOns\MinimalUI\media\fonts\pixel_font.ttf]],
	dmgfont = [=[Interface\AddOns\MinimalUI\media\fonts\font.ttf]=],
	logo = [=[Interface\AddOns\MinimalUI\media\textures\logo.tga]=],
	pfontsize = 10,
	ru_pfontsize = 10,
}

C.general = {
	backdropcolor = {.08, .08, .08},
	bordercolor = {.2, .2, .2},
}

C.unitframes = {
	showraidpets = false,
	unicolor = true,
	combatfeedback = false,
	cbicons = false,
	showfocustarget = false,
	onlyselfdebuffs = true,
	
	gridhealthvertical = false,
	
	-- boss frames
	showboss = true,
	
	-- arena frames
	arena = true,
	
	-- priest only plugin
	weakendsoulbar = true,
	
	-- class bar
	classbar = true,
	
	-- these class bar are considered optional
	druidmanabar = false,
	druidmushroombar = false,
	mageclassbar = false,
	showstatuebar = false,
}

C.actionbar = {
	hotkey = false,
	macro = false,
	hideshapeshift = true,
	buttonspacing = 0, 
}

C.datatext = {
	fps_ms = 0,
	system = 0,
	bags = 0,
	gold = 0,
	wowtime = 1,
	guild = 0,
	dur = 2,
	friends = 0,
	dps_text = 0,
	hps_text = 0,
	power = 0,
	haste = 0,
	crit = 0,
	avd = 0,
	armor = 0,
	currency = 0,
	hit = 0,
	mastery = 0,
	micromenu = 0,
	regen = 0,
	talent = 0,
	calltoarms = 0,
	
	time24 = false,
	localtime = true,
	battleground = false,
}

C.chat = {
	background = false,
}

C.nameplate = {
	enable = true,
    showhealth = true,
	enhancethreat = true,
}

C.classbar = {
	comboPoints = true,
}

-- make it public
TukuiEditedDefaultConfig = C