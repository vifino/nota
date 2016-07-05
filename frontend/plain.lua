-- Plain text output without some TUI framework or anything.

local _M = {}

_M.buffer = {}

-- draw function gets called when the module finished adding lines and things.
-- ui:draw()
function _M:draw()
	for elem_no=1, #self.buffer do
		local element = self.buffer[elem_no]

		print(tostring(elem_no)..") " .. element.title)
		if element.short_info then
			print("\t"..element.short_info)
		end
		print()
	end
end

-- addelement is there to add topics with short description, which is always shown, and a detail string or function, which may get invoked to see things in more detail, but it is up to the frontend to decide how and if to display it
-- ui:addelement(title:string, short_info:string, details:(function|string))
function _M:addelement(title, short_info, details)
	table.insert(self.buffer, {
		["title"] = title,
		["short_info"] = (short_info and short_info:gsub("\n", "\n\t")),
		["details"] = details,
	})
end

-- Return
return _M
