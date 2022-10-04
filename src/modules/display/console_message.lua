local console_message = {}

--- Create and return the data for console messages.
function console_message.create()
	local date = require("src.modules.qylib.date")
	local time = date.get("cur_time")
	local msg = "[Console] " .. time .. ": "
	return msg
end

return console_message