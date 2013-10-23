local returnTable = {}

returnTable.show = function(offerTable,group)
	local text = display.newText(offerTable.title, math.random(0, display.contentWidth), math.random(0, display.contentHeight - 70), "Arial", 20)
	text:addEventListener("touch", 
		function(event)
			if event.phase == "ended" then
				returnTable.show(offerTable, group)
			end
		end
	)
	group:insert(text)

	
	
	
	
	local button = display.newImage("images/button_buy.jpg")
	button.x=display.contentWidth/2
	button.y=display.contentHeight
	group:insert(button)
	
	button:addEventListener("touch", button)
	button.touch = function(event)
		local storyboard = require "storyboard"
		storyboard.gotoScene( "imageTemplate", {effect="fade"})
	end
	
	
end

return returnTable