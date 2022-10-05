local cursor = {}

--- Sets the client cursor.
function cursor.createCursor(cursorCh)
	local strutils = require("src.modules.qyvern_strutils")
	local oututils = require("src.modules.qyvern_oututils")
	if not (strutils.checkNil(cursorCh)) then
		oututils.writeStr(cursorCh .. " ")
	else
		oututils.writeStr("> ")
	end
end

function cursor.getSelectionCursor(scursor_file)
	local strutils = require("src.modules.qyvern_strutils")
	local file = require("src.modules.qylib.file")
	local _scursor
	if not (strutils.checkNil(scursor_file)) then
		if (strutils.typeCheck(scursor_file, "string")) then
			_scursor = file.readFile(scursor_file)
		end
	else
		_scursor = ">"
	end
	return _scursor
end

return cursor
