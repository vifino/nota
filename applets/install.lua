-- Applet that installs another applet into our storage.

if not (arg[1] and arg[2])then
	print("Usage: install <appname> <app.lua>")
	return 1
end

-- Some variables to make code easier to read
local appname = arg[1]
local source_location = arg[2]

-- Initialize the native vfs backend to read the file
assert(vfs.new("native", "native", "/"))
assert(vfs.chdir("native:"..os.pwd()))

-- Copy!
assert(vfs.copy("native:"..source_location, "storage:/applets/"..string.gsub(appname, "%.", "/")..".lua"))
print("Installed "..source_location.." as nota applet "..appname)
