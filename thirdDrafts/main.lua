-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- include Corona's "widget" library
local widgetBottomTabBar = require "widget"
local widgetTopTabBar = require "widget"
local storyboard = require "storyboard"

function showContextmenu( event )
	contmenubackground = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
	contmenubackground:setFillColor ( 0 )
	contmenubackground.alpha = 0.75

	contmenu = display.newRect( 0, -48, display.contentWidth * 0.75, display.contentHeight + 48 )
	contmenu:setFillColor ( 0, 32, 48 )
	contmenu.alpha = 0.75
--[[
	if (contmenu.x < 0) then
		contmenu:translate(500,-24)
	elseif (contmenu.x >= 0) then
		contmenu:translate(-500,-24)
	end
	]]
	
	-- Gruppe für die Menüknöpfe
	
	-- Knopf: Aktuelle Empfehlungen
	buttonBgRecentOffer = display.newRect( 0, -48, display.contentWidth * 0.75, 48 )
	buttonBgRecentOffer:setFillColor ( 59, 139, 190 )
	buttonBgRecentOffer.alpha = 0.75
	
	buttonIconRecentOffer = display.newImageRect("img/Icon_MesserUndGabel.png", 27, 36)
	buttonIconRecentOffer.x = 27
	buttonIconRecentOffer.y = buttonBgRecentOffer.contentHeight * 0.5 - 48
	
	buttonTextRecentOffer = display.newText( "Aktuelle Empfehlungen", 0, -48, native.systemFont, 14, left )
	buttonTextRecentOffer:setTextColor( 255 )
	buttonTextRecentOffer:setReferencePoint(display.CenterLeftReferencePoint);
	buttonTextRecentOffer.x = 48
	buttonTextRecentOffer.y = buttonBgRecentOffer.contentHeight * 0.5 - 48
	
	local buttonRecentOffer = display.newGroup()
	buttonRecentOffer:insert(buttonBgRecentOffer)
	buttonRecentOffer:insert(buttonIconRecentOffer)
	buttonRecentOffer:insert(buttonTextRecentOffer)
	
	-- Knopf: Wochenrückblick
	buttonBgPreviousOffer = display.newRect( 0, 0, display.contentWidth * 0.75, 48 )
	buttonBgPreviousOffer:setFillColor ( 39, 75, 99 )
	buttonBgPreviousOffer.alpha = 0.75
	
	buttonIconPreviousOffer = display.newImageRect("img/Icon_Kalender.png", 27, 36)
	buttonIconPreviousOffer.x = 27
	buttonIconPreviousOffer.y = buttonBgPreviousOffer.contentHeight * 0.5 
	
	buttonTextPreviousOffer = display.newText( "Wochenrückblick", 0, 0, native.systemFont, 14, left )
	buttonTextPreviousOffer:setTextColor( 255 )
	buttonTextPreviousOffer:setReferencePoint(display.CenterLeftReferencePoint);
	buttonTextPreviousOffer.x = 48
	buttonTextPreviousOffer.y = buttonBgPreviousOffer.contentHeight * 0.5 
	
	local buttonPreviousOffer = display.newGroup()
	buttonPreviousOffer:insert(buttonBgPreviousOffer)
	buttonPreviousOffer:insert(buttonIconPreviousOffer)
	buttonPreviousOffer:insert(buttonTextPreviousOffer)	
	
	-- Knopf: Einstellungen
	buttonBgSettings = display.newRect( 0, 48, display.contentWidth * 0.75, 48 )
	buttonBgSettings:setFillColor ( 50, 90, 115 )
	buttonBgSettings.alpha = 0.75
	
	buttonIconSettings = display.newImageRect("img/Icon_Zange.png", 27, 36)
	buttonIconSettings.x = 27
	buttonIconSettings.y = buttonBgSettings.contentHeight * 0.5 + 48
	
	buttonTextSettings = display.newText( "Einstellungen", 0, 0, native.systemFont, 14, left )
	buttonTextSettings:setTextColor( 255 )
	buttonTextSettings:setReferencePoint(display.CenterLeftReferencePoint);
	buttonTextSettings.x = 48
	buttonTextSettings.y = buttonBgSettings.contentHeight * 0.5 + 48
	
	local buttonSettings = display.newGroup()
	buttonSettings:insert(buttonBgSettings)
	buttonSettings:insert(buttonIconSettings)
	buttonSettings:insert(buttonTextSettings)
	
	-- Knopf: Über Uns
	buttonBgAboutUs = display.newRect( 0, 96, display.contentWidth * 0.75, 48 )
	buttonBgAboutUs:setFillColor ( 20, 51, 71 )
	buttonBgAboutUs.alpha = 0.75
	
	buttonIconAboutUs = display.newImageRect("img/Icon_Zauberstab.png", 27, 36)
	buttonIconAboutUs.x = 27
	buttonIconAboutUs.y = buttonBgAboutUs.contentHeight * 0.5 + 96
	
	buttonTextAboutUs = display.newText( "Über uns", 0, 0, native.systemFont, 14, left )
	buttonTextAboutUs:setTextColor( 255 )
	buttonTextAboutUs:setReferencePoint(display.CenterLeftReferencePoint);
	buttonTextAboutUs.x = 48
	buttonTextAboutUs.y = buttonBgAboutUs.contentHeight * 0.5 + 96
	
	local buttonAboutUs = display.newGroup()
	buttonAboutUs:insert(buttonBgAboutUs)
	buttonAboutUs:insert(buttonIconAboutUs)
	buttonAboutUs:insert(buttonTextAboutUs)
	
	-- Logo "delightful Dining"
	local delightful = display.newText( "delightful", 0, 0, "Purisa", 12 )
	local dining = display.newText( "DINING", 0, 0, native.systemFont, 14 )
	delightful.y = 462
	delightful:setTextColor( 30, 121, 178 )
	delightful:setReferencePoint( display.BottomCenterReferencePoint )
	delightful.x = contmenu.contentWidth * 0.5 - 40
	dining.y = 460
	dining:setTextColor( 30, 121, 178 )
	dining:setReferencePoint( display.BottomCenterReferencePoint )
	dining.x = delightful.x + 63
	-- Gruppieren der beiden Wörter
	local titel = display.newGroup()
	titel:insert(delightful)
	titel:insert(dining)
	titel.alpha = 0.75
	
	
	local contextmenu = display.newGroup()
	contextmenu:insert(contmenu)
	contextmenu:insert(buttonRecentOffer)
	contextmenu:insert(buttonPreviousOffer)
	contextmenu:insert(buttonSettings)
	contextmenu:insert(buttonAboutUs)
	contextmenu:insert(titel)
	
	--[[ -- will sich nicht einklappen lassen
	function menueinklappen(event)
		contextmenu.isVisible = false
	end
		
	contentmenubackground:addeventlistener("touch", menueinklappen)
	]]
end
-- event listeners for tab buttons:
local function onFirstView( event )
	storyboard.gotoScene( "home" )
end




--Hiding status bar
display.setStatusBar(display.HiddenStatusBar)
--Content centering
local w=display.contentWidth/2
local h=display.contentHeight/2
--Splash image
local splash=display.newImageRect("img/1.jpg",320,480)
splash.x=w
splash.y=h

local function main()
	--Removing splash image
	splash:removeSelf()
	splash=nil
	
	-- Knöpfe für das Menü oben (table)
	local topTabButtons = {
		{ id="anders", defaultFile = "img/menuIcon.png", overFile = "img/menuIcon.png", width = 24, height = 24, onPress=showContextmenu},
		{ id="platzhalter", defaultFile = "img/topTabBarHintergrund.png", overFile = "img/topTabBarHintergrund.png", width = 185, height = 24},
	}

	-- Knöpfe für das Menü unten (table)
	local bottomTabButtons = {
		{ id="back", defaultFile = "img/backButton.png", overFile = "img/backButton.png", width = 34, height = 48, onPress=showContextmenu },
	 	{ id="home", defaultFile = "img/homeButton.png", overFile = "img/homeButton.png", width = 34, height = 48, onPress=showContextmenu },
		{ id="context", defaultFile = "img/contextButton.png", overFile = "img/contextButton.png", width = 34, height = 48, onPress=showContextmenu },
	}
	
	-- Menü oben
	local topTabBar = widgetTopTabBar.newTabBar{
		top = -48,
		left = -60,
		height = 48,
		backgroundFile ="img/topTabBarHintergrund.png",
		tabSelectedLeftFile = "img/topTabBarHintergrund.png",
	    	tabSelectedMiddleFile = "img/topTabBarHintergrund.png",
	    	tabSelectedRightFile = "img/topTabBarHintergrund.png",
	    	tabSelectedFrameWidth = 24,
	    	tabSelectedFrameHeight = 48,
		buttons = topTabButtons,
	}
	-- Menü unten
	local bottomTabBar = widgetBottomTabBar.newTabBar{
		top = display.contentHeight - 4,
		height = 48,
		backgroundFile ="img/bottomTabBarHintergrund.png",
		tabSelectedLeftFile = "img/bottomTabBarHintergrund.png",
	    	tabSelectedMiddleFile = "img/bottomTabBarHintergrund.png",
	    	tabSelectedRightFile = "img/bottomTabBarHintergrund.png",
	    	tabSelectedFrameWidth = 24,
	    	tabSelectedFrameHeight = 48,
		buttons = bottomTabButtons
	}
	onFirstView()	-- invoke first tab button's onPress event manually
end
--loads splash image for 400 milliseconds and calls main function
timer.performWithDelay( 400, main )


