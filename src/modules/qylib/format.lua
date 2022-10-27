local format = {}

--- Similar to C's ``printf()``
function format.print_format(_format, var)
	local check_nil_empty = require("src.modules.io.qystrutils").checkNilOrEmpty
	local type_check = require("src.modules.io.qystrutils").typeCheck
	local str_equals = require("src.modules.io.qystrutils").checkStringEquals
	local ln_out = require("src.modules.io.qyoututils").lnOutStr
	if (type_check(_format, "string")) then
		if (check_nil_empty(_format) and check_nil_empty(var)) then
			if (str_equals(_format, "%s")) then
				ln_out(format.set_format("%s", var))
			elseif (str_equals(_format, "%n")) then
				ln_out(format.set_format("%n", var))
			end
		end
	end
end

--- Set a format for a variable.
function format.set_format(frmt, var)
	local check_nil_empty = require("src.modules.io.qystrutils").checkNilOrEmpty
	local type_check = require("src.modules.io.qystrutils").typeCheck
	local str_equals = require("src.modules.io.qystrutils").checkStringEquals
	local convert = require("src.modules.qylib.convert")
	if (type_check(frmt, "string")) then
		if (check_nil_empty(frmt) and check_nil_empty(var)) then
			if (str_equals(frmt, "%s")) then
				return convert.toString(var)
			elseif (str_equals(frmt, "%n")) then
				return convert.toNumber(var)
			end
		end
	end
end

return format