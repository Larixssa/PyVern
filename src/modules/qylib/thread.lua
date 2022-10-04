local thread = {}

--- Roblox users rn: wait() :troll:
function thread.sleep(n)
	local strutils = require("src.modules.qyvern_strutils")
	local convert = require("src.modules.qylib.convert")
	local sys = require("src.modules.qyvern_sys")
	local qos = require("src.modules.qylib.q_os")
	local jit = require("jit")
	if (n < 0) then
		n = 1
	end
	if (strutils.checkStringEquals(jit.os, qos.getCurrentOS("Linux"))) then
		sys.osExecute("sleep " .. convert.toNumber(n))
	elseif (strutils.checkStringEquals(jit.os, qos.getCurrentOS("Windows"))) then
		sys.osExecute("ping " .. convert.toNumber(n+1) .. "localhost > NUL")
	end
end

return thread
