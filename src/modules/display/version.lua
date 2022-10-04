local version = {}

function version.create(_version)
	local strutils = require("src.modules.qyvern_strutils")
	local version_str
	if not (strutils.checkNil(_version)) then
		if (strutils.typeCheck(_version, "string")) then
			version_str = _version
		end
	end
	return version_str
end

return version