local convert = {}

--- Converts any type besides a string into a string.
---
--- *`10` -> `"10"`*
function convert.toString(v)
	local strutils = require("src.modules.io.qystrutils")
	local converted_string
	if not (strutils.checkNil(v)) then
		converted_string = tostring(v)
	end
	return converted_string
end


--- Converts any type besides a number into a number.
---
--- * *The string must be a number in order to be converted.*
---
--- *`"10"` -> `10`*
function convert.toNumber(a)
	local strutils = require("src.modules.io.qystrutils")
	local converted_num
	if not (strutils.checkNil(a)) then
		converted_num = tonumber(a)
	end
	return converted_num
end

return convert
