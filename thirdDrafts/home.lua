-----------------------------------------------------------------------------------------
--
-- home.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local widgetTopTabBar = require "widget"


local function onFirstView( event )
	local anklick = display.newText("geklickt First", 0, 0, native.systemFont, 14 )
	storyboard.gotoScene( "home" )
end

local function onForthView( event )
	--storyboard.gotoScene( "home" )
	local anklick = display.newText("geklickt Forth", 0, 0, native.systemFont, 14 )
end

function showContextmenu( event )
	if (contmenu.x < 0) then
		contmenu:translate(500,0)
	elseif (contmenu.x >= 0) then
		contmenu:translate(-500,0)
	end
end
-----------------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
-- 
-- NOTE: Code outside of listener functions (below) will only be executed once,
--		 unless storyboard.removeScene() is called.
-- 
-----------------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
	
	-- Hintergrundbild
	local bg = display.newImage("img/2.jpg")
	bg.x = display.contentCenterX
	bg.y = display.contentCenterY
	bg:setFillColor( 255 )
	
	-- Delightful Dining Logo, besteht aus verschiedenen Schriften
	local delightful = display.newText( "delightful", 0, 0, "Purisa", 12 )
	local dining = display.newText( "DINING", 0, 0, native.systemFont, 14 )
	delightful.y = -20
	delightful:setTextColor( 10, 90, 155 )
	delightful:setReferencePoint( display.CenterReferencePoint )
	delightful.x = display.contentWidth * 0.5 - 20
	dining.y = -22
	dining:setTextColor( 255 )
	dining:setReferencePoint( display.CenterReferencePoint )
	dining.x = delightful.x + 63
	-- Gruppieren der beiden Wörter
	local titel = display.newGroup()
	titel:insert(delightful)
	titel:insert(dining)
	
--[[
-- diverse TEsts
local myText = display.newText( "Hello World!", 100, 180, native.systemFont, 16 )

--rectangle
local myRectangle = display.newRect( 100, 0, 150, 50 )
myRectangle:setFillColor( 255, 0, 0 )

--myRectangle.rotation = 45

--circle
local myCircle = display.newCircle( 150, 110, 50 )
myCircle:setFillColor( 0, 255, 0 )

--display group (group of other display objects which can be manipulated as a whole)
local grubbe = display.newGroup()
grubbe:insert(myText)
grubbe:insert(myRectangle)
grubbe:insert(myCircle)
--myText.rotation = 45
grubbe:rotate( 45 )
]]

	local logoImage = display.newImageRect( "img/logo.png", 110, 100 )
	logoImage:translate( 160, 400 )
	
	
	
	-- der aktuellen Ansicht (self.view) werden die verschiedenen Objekte hinzugefügt
	group:insert( bg )
	--group:insert( title )       	-- ??
	--group:insert( delightful )	-- ??
	--group:insert( logoImage )	-- ??
	--group:insert( grubbe )	-- ??
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	-- Do nothing
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	-- INSERT code here (e.g. stop timers, remove listenets, unload sounds, etc.)
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	-- INSERT code here (e.g. remove listeners, remove widgets, save state variables, etc.)
end

-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------
return scene
