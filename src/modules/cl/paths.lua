local paths = {}

function paths.getFile(file)
	local strutils = require("src.modules.qyvern_strutils")
	local parsed_file
	if not (strutils.checkNil(file)) then
		if (strutils.typeCheck(file, "string")) then
			parsed_file = file
		end
	end
	return parsed_file
end

--- Gets and returns the path of "logfile.txt."
function paths.getLogfilePath()
	local _file = "logs/logfile.txt"
	return _file
end

--- Gets files from the "config" folder and returns them.
function paths.getConfigProperty(_property)
	local strutils = require("src.modules.qyvern_strutils")
	local matching_property = false
	local parsed_property
	local properties_table = {
		"cursor",
		"profile",
		"repo-desc",
		"selection-cursor"
	}
	if not (strutils.checkNil(_property)) then
		for i = 1, #properties_table do
			if (_property == properties_table[i]) then
				matching_property = true
			end
		end
	end
	if (matching_property) then
		parsed_property = _property
	end
	return "config/" .. parsed_property .. ".txt"
end

--- Returns files from the "shared" folder.
function paths.getSharedFile(filename)
	local file = require("src.modules.qylib.file")
	local strutils = require("src.modules.qyvern_strutils")
	local parsed
	if not (strutils.checkNil(filename)) then
		if (strutils.typeCheck(filename, "string")) then
			parsed = file.readFile("shared/" .. filename .. ".txt")
		end
	end
	return parsed
end

return paths