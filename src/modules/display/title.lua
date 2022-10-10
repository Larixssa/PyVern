local title = {}

function title.create(title_str)
	local strutils = require("src.modules.io.qystrutils")
	local title
	if not (strutils.checkNil(title_str)) then
		if (strutils.typeCheck(title_str, "string")) then
			title = title_str
		end
	end
	return title
end

return title