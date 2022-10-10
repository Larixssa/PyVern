local option = {}

function option.createOption(option_short_name, option_name, has_description, option_description)
	local strutils = require("src.modules.io.qystrutils")
	local oututils =  require("src.modules.io.qyoututils")
	local errorutils = require("src.modules.error_handlers.qyerrorutils")
	local conv_short_name
	if not(strutils.checkNil(option_short_name)) then
		conv_short_name = string.lower(option_short_name)
		if not (strutils.checkNil(option_name)) then
			local main_str = "[" .. conv_short_name .. "] - " .. option_name
			if (has_description) then
				if not (strutils.checkNil(option_description)) then
					oututils.writeStr(main_str .. "\n> " .. option_description)
				end
			else
				oututils.writeStr(main_str)
			end
		else
			errorutils.execThrowError("missing", "OPTION_NAME_AND_DESCRIPTION")
		end
	else
		errorutils.execThrowError("missing", "OPTION_SHORT_NAME")
	end
end

return option
