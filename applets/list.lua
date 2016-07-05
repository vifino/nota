-- List available applets

local app_locations = {"storage:/applets", "root:applets"}

for loc_no=1, #app_locations do
	local app_list = ""
	local files = vfs.list(app_locations[loc_no])
	if files then
		for file_no=1, #files do
			local file = files[file_no]
			if file:sub(-4) == ".lua" then
				app_list = app_list .. file:sub(1, -5) .. "\n"
			end
		end
		ui:addelement("Available applets under "..app_locations[loc_no], app_list:sub(1, -2))
	end
end
ui:draw()
