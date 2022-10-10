local date = {}

--- Gets the current date
---
--- Parameters:
---
---		| "day_today" -> M D, Y
---		| "cur_time" -> H:M:S
---		| "std_time" -> H:M
function date.get(type)
	local strutils = require("src.modules.io.qystrutils")
	local dt
	if not (strutils.checkNil(type) or strutils.checkEmpty(type)) then
		if (strutils.checkStringEquals(type, "day_today")) then
			dt = os.date("%m %d, %Y")
		elseif (strutils.checkStringEquals(type, "cur_time")) then
			dt = os.date("%H:%M:%S")
		elseif (strutils.checkStringEquals(type, "std_time")) then
			dt = os.date("%H:%M")
		end
	end
	return dt
end

return date
