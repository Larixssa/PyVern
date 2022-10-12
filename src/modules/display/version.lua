local version = {}

function version.create(_version, has_build_version)
	local strutils = require("src.modules.io.qystrutils")
	local file = require("src.modules.qylib.file")
	local version_str
	if not (strutils.checkNil(_version)) then
		if (strutils.typeCheck(_version, "string")) then
			if not (has_build_version) then version_str = _version else version_str = _version .. " - " .. file.readFile("build.txt") end
		end
	end
	return version_str
end

return version