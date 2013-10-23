local purchaseTable ={
	
}

function purchaseTable:purchase()
	local path = getPathToFile()
	local file = io.open( path, "w" )
	file:write( "1" )
	io.close( file )
	file = nil
end

function purchaseTable:hasPurchased()
	local path = getPathToFile()
	local file = io.open( path, "r" )
	if (file) then
		local savedData = file:read( "*a" )
		io.close( file )
		file = nil
		return (savedData == "1")
	end
	return false
end

function purchaseTable:clear()
	local path = getPathToFile()
	local results, reason = os.remove( path )
	if results then
	   print( "file removed" )
	else
	   print( "file does not exist", reason )
	end
end

function getPathToFile()
	return system.pathForFile( "purchase.txt", system.DocumentsDirectory )
end

return purchaseTable;