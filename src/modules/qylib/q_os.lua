local q_os = {}

--- Get and return the current operating system platform.
function q_os.getCurrentOS(osName)
	local strutils = require("src.modules.io.qystrutils")
	local errorutils = require("src.modules.error_handlers.qyerrorutils")
	local jit = require("jit")

	local r_osName

	if not (strutils.checkNil(osName) or strutils.checkEmpty("osName")) then
		if (strutils.checkStringEquals(osName, "Windows") or strutils.checkStringEquals(osName, "Linux")) then
			r_osName = osName
		else
			if (strutils.checkStringEquals(jit.os, "Windows")) then
				r_osName = "Windows"
			elseif (strutils.checkStringEquals(jit.os, "Linux")) then
				r_osName = "Linux"
			end
		end
	else
		errorutils.execThrowError("missing", "OS_NAME")
	end

	return r_osName
end

return q_os