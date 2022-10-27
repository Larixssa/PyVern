local format = {}

--- Similar to C's ``printf()``
function format.print_format(_format, _content)
	local check_nil = require("src.modules.io.qystrutils").checkNil
	local type_check = require("src.modules.io.qystrutils").typeCheck
	local str_equals = require("src.modules.io.qystrutils").checkStringEquals
	local ln_out = require("src.modules.io.qyoututils").lnOutStr
	if (type_check(_format, "string")) then
		if not (check_nil(_format) and check_nil(_content)) then
			if (str_equals(_format, "%s")) then
				ln_out(format.set_format("%s", _content), true)
			elseif (str_equals(_format, "%n")) then
				ln_out(format.set_format("%n", _content), true)
			end
		end
	end
end

--- Set a format for a variable.
function format.set_format(frmt, var)
	local check_nil = require("src.modules.io.qystrutils").checkNil
	local type_check = require("src.modules.io.qystrutils").typeCheck
	local str_equals = require("src.modules.io.qystrutils").checkStringEquals
	local convert = require("src.modules.qylib.convert")
	if (type_check(frmt, "string")) then
		if not (check_nil(frmt) and check_nil(var)) then
			if (str_equals(frmt, "%s")) then
				if (type_check(var, "string")) then
					return convert.toString(var)
				end
			elseif (str_equals(frmt, "%n")) then
				if (type_check(var, "number")) then
					return convert.toNumber(var)
				end
			end
		end
	end
end

return format