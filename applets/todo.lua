-- Basic todo applet

local action = arg[1] or "show"

local todoloc = "storage:/data/todos"

if action == "show" or action == "list" then -- list todos
	local list = vfs.list(todoloc)
	if list == nil or #list == 0 then
		ui:addelement("All done!", "No active TODOs.")
	else
		for file_no=1, #list do
			local file_name = list[file_no]

			-- We got the file name, which is the topic/title
			-- Now we need to get the actual data/objective to show it listed neatly.
			local title = file_name .. " (Modified: "..os.date("%c", vfs.modtime(todoloc.."/"..file_name)).. ")"
			local content = vfs.read(todoloc.."/"..file_name)
			ui:addelement(title, content)
		end
	end
elseif action == "add" then -- add a todo entry, pretty simple actually.
	local title = arg[2]
	local objective = arg[3]
	if not (title and objective) then -- display usage
		ui:addelement("Incorrect usage", "Usage: todo add '<title>' '<description'")
	else
		-- has proper data n stuff
		vfs.write(todoloc.."/"..title, objective)
		ui:addelement("Added todo: "..title, objective)
	end
elseif action == "delete" then -- delete a todo entry, even simpler
	local title = arg[2]
	if not title then -- display usage
		ui:addelement("Incorrect usage", "Usage: todo delete '<title|titleid>'")
	else
		local id_number = tonumber(title)
		if id_number then -- title is actually a number, referencing the numbering
			local list = vfs.list(todoloc)
			if list == nil or #list == 0 then -- no todos
				ui:addelement("No TODO's to delete.")
				ui:draw()
				return
			end
			local newtitle = list[id_number]
			if not newtitle then
				ui:addelement("No such TODO ID.")
				ui:draw()
				return
			end
			title = newtitle
		end

		local fp = todoloc.."/"..title
		if vfs.exists(fp) then
			local objective = vfs.read(fp)
			vfs.delete(fp)
			ui:addelement("Deleted todo: "..title, objective)
		else
			ui:addelement("No such todo entry: "..title)
		end
	end
else
	-- No such action
	ui:addelement("No such action: "..action, "Available: list/show, add and delete.")
end
ui:draw()
