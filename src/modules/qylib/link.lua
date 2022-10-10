local link = {}

local function runOSCheck(_parse_url_)
	local strutils = require("src.modules.io.qystrutils")
	local q_os =  require("src.modules.qylib.q_os")
	local sys = require("src.modules.qyvern_sys")
	local jit = require("jit")
	if (strutils.checkStringEquals(jit.os, q_os.getCurrentOS("Linux"))) then
		sys.osExecute("xdg-open " .. _parse_url_)
	elseif (strutils.checkStringEquals(jit.os, q_os.getCurrentOS("Windows"))) then
		sys.osExecute("start " .. _parse_url_)
	end
end

--- Opens a Link/URL.
function link.open(url)
	local strutils = require("src.modules.io.qystrutils")
	if not (strutils.checkNil(url) or strutils.checkEmpty(url)) then
		if not (strutils.startsWith(url, "https://")) then
			local url_fix = "https://" .. url
			runOSCheck(url_fix)
		else
			runOSCheck(url)
		end
	end
end

return link