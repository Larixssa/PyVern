local cursor = {}

--- Sets the client cursor.
function cursor.createCursor(cursorCh)
	local strutils = require("src.modules.qyvern_strutils")
	local oututils =  require("src.modules.qyvern_oututils")
	if not (strutils.checkNil(cursorCh)) then
		oututils.writeStr(cursorCh .. " ")
	else
		oututils.writeStr("> ")
	end
end

return cursor
