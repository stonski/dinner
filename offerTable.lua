local offerTable ={
	title = "Offer title",
	description = "Offer description"
}

function get()
	offerTable.title = "Offer Title new"
	print("loading");
end;

get();
return offerTable;