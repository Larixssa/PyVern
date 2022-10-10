local cursor = {}

--- Sets the client's cursor.
function cursor.createCursor(cursorCh)
	local strutils = require("src.modules.io.qystrutils")
	local oututils = require("src.modules.io.qyoututils")
	if not (strutils.checkNil(cursorCh)) then
		oututils.writeStr(cursorCh .. " ")
	else
		oututils.writeStr("> ")
	end
end

--- Gets the selection cursor.
function cursor.getSelectionCursor(scursor_file)
	local strutils = require("src.modules.qyvern_strutils")
	local file = require("src.modules.qylib.file")
	local _scursor
	if (strutils.typeCheck(scursor_file, "string")) then
		if not (strutils.checkNil(scursor_file)) then
			_scursor = file.readFile(scursor_file)
		else
			_scursor = ">"
		end
	end
	return _scursor
end

return cursor
