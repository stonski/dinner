local purchaseTable = require("purchaseTable")

local offerTable ={
	title = "Offer title",
	description = "Offer description"
}

function offerTable:isPurchased()
	return purchaseTable:hasPurchased()
end

function get()
	print("loading data");
	offerTable.title = "Offer Title new"
end;

get();
return offerTable;