-- Uninstall... uninstalls an applet.

if not arg[1] then
	print("Usage: uninstall <appletname>")
	return 1
end

-- variables
local filepath = "storage:/applets/"..string.gsub(arg[1], "%.", "/")..".lua"

if vfs.exists(filepath) then
	-- remove
	assert(vfs.delete(filepath))
	print("Removed installed applet: "..arg[1])
else
	print("No such installed applet: "..arg[1])
end
